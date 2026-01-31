// lib/presentation/widgets/shared/menu_drawer.dart
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  // Changed to StatefulWidget
  final Function(String) onItemSelected;
  final String? currentRoute;

  const MenuDrawer({
    super.key,
    required this.onItemSelected,
    this.currentRoute,
  });

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  // Track which sections are expanded
  bool _isLayoutExpanded = true;
  bool _isNavigationExpanded = false;
  bool _isAnimationExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade900,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.class_, size: 48, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    'Flutter Class',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Learning Flutter',
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 14),
                  ),
                ],
              ),
            ),

            // Dashboard (always visible)
            _buildMenuItem(
              context,
              icon: Icons.dashboard,
              title: 'Dashboard',
              route: '/main',
              isSelected: widget.currentRoute == '/main',
            ),

            // Layout Section - Expandable
            _buildExpandableSection(
              title: 'Layout',
              icon: Icons.view_quilt,
              isExpanded: _isLayoutExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.view_column,
                  title: 'Column',
                  route: '/layout/column',
                  isSelected: widget.currentRoute == '/layout/column',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.view_agenda,
                  title: 'Row',
                  route: '/layout/row',
                  isSelected: widget.currentRoute == '/layout/row',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.grid_view,
                  title: 'Grid',
                  route: '/layout/grid',
                  isSelected: widget.currentRoute == '/layout/grid',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.list,
                  title: 'List',
                  route: '/layout/list',
                  isSelected: widget.currentRoute == '/layout/list',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.layers,
                  title: 'Stack',
                  route: '/layout/stack',
                  isSelected: widget.currentRoute == '/layout/stack',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.table_chart,
                  title: 'Table',
                  route: '/layout/table',
                  isSelected: widget.currentRoute == '/layout/table',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isLayoutExpanded = expanded;
                });
              },
            ),

            // Navigation Section - Expandable
            _buildExpandableSection(
              title: 'Navigation',
              icon: Icons.navigation,
              isExpanded: _isNavigationExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.arrow_downward,
                  title: 'Bottom Navigation',
                  route: '/navigation/bottom-nav',
                  isSelected: widget.currentRoute == '/navigation/bottom-nav',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.tab,
                  title: 'Tabs',
                  route: '/navigation/tabs',
                  isSelected: widget.currentRoute == '/navigation/tabs',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.menu,
                  title: 'Drawer',
                  route: '/navigation/drawer',
                  isSelected: widget.currentRoute == '/navigation/drawer',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isNavigationExpanded = expanded;
                });
              },
            ),

            // Animation Section - Expandable
            _buildExpandableSection(
              title: 'Animation',
              icon: Icons.animation,
              isExpanded: _isAnimationExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.animation,
                  title: 'Basic Animation',
                  route: '/animation/basic',
                  isSelected: widget.currentRoute == '/animation/basic',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.play_arrow,
                  title: 'Transitions',
                  route: '/animation/transitions',
                  isSelected: widget.currentRoute == '/animation/transitions',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.rotate_90_degrees_cw,
                  title: 'Hero Animation',
                  route: '/animation/hero',
                  isSelected: widget.currentRoute == '/animation/hero',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isAnimationExpanded = expanded;
                });
              },
            ),

            // Forms Section - Expandable (for future)
            _buildExpandableSection(
              title: 'Forms & Inputs',
              icon: Icons.edit,
              isExpanded: false,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.text_fields,
                  title: 'Text Fields',
                  route: '/forms/text-fields',
                  isSelected: widget.currentRoute == '/forms/text-fields',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.check_box,
                  title: 'Checkboxes & Radios',
                  route: '/forms/checkboxes',
                  isSelected: widget.currentRoute == '/forms/checkboxes',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  // _isFormsExpanded = expanded;
                });
              },
            ),

            const Divider(color: Colors.grey),

            // Logout button
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red.shade300),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.red.shade300),
              ),
              onTap: () {
                Navigator.pop(context);
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required IconData icon,
    required bool isExpanded,
    required List<Widget> children,
    required ValueChanged<bool> onExpansionChanged,
  }) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(icon, color: Colors.grey.shade300, size: 20),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      initiallyExpanded: isExpanded,
      onExpansionChanged: onExpansionChanged,
      collapsedIconColor: Colors.grey.shade500,
      iconColor: Colors.grey.shade300,
      childrenPadding: const EdgeInsets.only(left: 16),
      children: children,
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    bool isSelected = false,
    bool indent = false,
  }) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: indent ? 16 : 0),
        child: Icon(
          icon,
          color: isSelected ? Colors.amber[500] : Colors.grey.shade300,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.amber[500] : Colors.grey.shade100,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: isSelected
          // ignore: deprecated_member_use
          ? Colors.grey.shade800.withOpacity(0.5)
          : Colors.transparent,
      onTap: () {
        Navigator.pop(context);
        widget.onItemSelected(route);
      },
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
