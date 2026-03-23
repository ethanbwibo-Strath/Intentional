import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Intentional.", 
                    style: Theme.of(context).textTheme.displayLarge),
                ),
              ),
              SliverToBoxAdapter(
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    // 1. Monthly Theme (Wide Card)
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: _BentoCard(
                        title: "Monthly Theme",
                        content: "Mindful Movement",
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    // 2. Habit Progress (Small Card)
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: _BentoCard(title: "Habits", content: "85% Done"),
                    ),
                    // 3. Quick Note (Small Card)
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: _BentoCard(title: "Journal", content: "3 Wins today"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Simple Helper for the Bento Look
class _BentoCard extends StatelessWidget {
  final String title;
  final String content;
  final Color? color;
  const _BentoCard({required this.title, required this.content, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelMedium),
          const Spacer(),
          Text(content, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}