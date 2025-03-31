import 'package:flutter/material.dart';
import 'package:poke_datadex/features/pokeAPI.dart';
import 'package:poke_datadex/widgets/pokemonListItem.dart';
import '../models/pokemon.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonScreen> {
  final PokeApiManager _apiManager = PokeApiManager();
  final ScrollController _scrollController = ScrollController();
  List<Pokemon> _pokemons = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _offset = 0;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    _loadInitialPokemons();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialPokemons() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    try {
      final newPokemons = await _fetchPokemonBatch(offset: 0);
      setState(() {
        _pokemons = newPokemons;
        _offset = _limit;
        _hasMore = newPokemons.length == _limit;
      });
    } catch (e) {
      _showError(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadMorePokemons() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);

    try {
      final newPokemons = await _fetchPokemonBatch(offset: _offset);
      setState(() {
        _pokemons.addAll(newPokemons);
        _offset += _limit;
        _hasMore = newPokemons.length == _limit;
      });
    } catch (e) {
      _showError(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<List<Pokemon>> _fetchPokemonBatch({required int offset}) async {
    final response = await _apiManager.getPokemonList(
      limit: _limit,
      offset: offset,
    );

    final results = (response['results'] as List).cast<Map<String, dynamic>>();

    // Fetch details for each Pokémon in parallel
    final pokemons = await Future.wait(
      results.map((pokemon) async {
        final id = _extractIdFromUrl(pokemon['url']);
        final details = await _apiManager.getPokemonDetails(id);
        return Pokemon.fromJson(details);
      }),
    );

    return pokemons;
  }

  int _extractIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return int.parse(segments[segments.length - 2]);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMorePokemons();
    }
  }

  Future<void> _refreshPokemons() async {
    setState(() {
      _offset = 0;
      _pokemons.clear();
      _hasMore = true;
    });
    await _loadInitialPokemons();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8),
        child: RefreshIndicator(
          onRefresh: _refreshPokemons,
          child: _buildPokemonList(),
        ),
      ),
    );
  }

  Widget _buildPokemonList() {
    if (_pokemons.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _pokemons.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _pokemons.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return Container(
          margin: EdgeInsets.only(bottom: 4),
          child: PokemonListItem(
            pokemon: _pokemons[index],
          ),
        );
      },
    );
  }
}
