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
  bool _isUIComponentsExpanded = false;
  bool _isGesturesExpanded = false;
  bool _isStateManagementExpanded = false;
  bool _isNetworkingExpanded = false;
  bool _isStorageExpanded = false;
  bool _isAdvancedExpanded = false;

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
                crossAxisAlignment: CrossAxisAlignment.center,
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

            _buildExpandableSection(
              title: 'UI Components',
              icon: Icons.widgets,
              isExpanded: _isUIComponentsExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.check_box,
                  title: 'Checkbox & Radio',
                  route: '/ui/checkboxes',
                  isSelected: widget.currentRoute == '/ui/checkboxes',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.switch_right,
                  title: 'Switches & Sliders',
                  route: '/ui/switches',
                  isSelected: widget.currentRoute == '/ui/switches',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'Dropdowns & Pickers',
                  route: '/ui/dropdowns',
                  isSelected: widget.currentRoute == '/ui/dropdowns',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.calendar_today,
                  title: 'Date & Time Pickers',
                  route: '/ui/datetime-pickers',
                  isSelected: widget.currentRoute == '/ui/datetime-pickers',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'Dialogs & Modals',
                  route: '/ui/dialogs',
                  isSelected: widget.currentRoute == '/ui/dialogs',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.notifications,
                  title: 'Snackbars & Toasts',
                  route: '/ui/snackbars',
                  isSelected: widget.currentRoute == '/ui/snackbars',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isUIComponentsExpanded = expanded;
                });
              },
            ),

            // 2. Gestures & Interactions
            _buildExpandableSection(
              title: 'Gestures & Interactions',
              icon: Icons.touch_app,
              isExpanded: _isGesturesExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.tap_and_play,
                  title: 'Tap & Press Gestures',
                  route: '/gestures/tap',
                  isSelected: widget.currentRoute == '/gestures/tap',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.drag_handle,
                  title: 'Drag & Drop',
                  route: '/gestures/drag',
                  isSelected: widget.currentRoute == '/gestures/drag',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.zoom_in,
                  title: 'Scale & Pinch',
                  route: '/gestures/scale',
                  isSelected: widget.currentRoute == '/gestures/scale',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.swipe,
                  title: 'Swipe Gestures',
                  route: '/gestures/swipe',
                  isSelected: widget.currentRoute == '/gestures/swipe',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.gesture,
                  title: 'Gesture Detector',
                  route: '/gestures/detector',
                  isSelected: widget.currentRoute == '/gestures/detector',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.mouse,
                  title: 'Mouse & Pointer',
                  route: '/gestures/pointer',
                  isSelected: widget.currentRoute == '/gestures/pointer',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isGesturesExpanded = expanded;
                });
              },
            ),

            // 3. State Management
            _buildExpandableSection(
              title: 'State Management',
              icon: Icons.sync,
              isExpanded: _isStateManagementExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.set_meal,
                  title: 'setState (Basic)',
                  route: '/state/setstate',
                  isSelected: widget.currentRoute == '/state/setstate',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'Provider',
                  route: '/state/provider',
                  isSelected: widget.currentRoute == '/state/provider',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'Riverpod',
                  route: '/state/riverpod',
                  isSelected: widget.currentRoute == '/state/riverpod',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'Bloc/Cubit',
                  route: '/state/bloc',
                  isSelected: widget.currentRoute == '/state/bloc',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.get_app,
                  title: 'GetX',
                  route: '/state/getx',
                  isSelected: widget.currentRoute == '/state/getx',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'MobX',
                  route: '/state/mobx',
                  isSelected: widget.currentRoute == '/state/mobx',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isStateManagementExpanded = expanded;
                });
              },
            ),

            // 4. Networking & APIs
            _buildExpandableSection(
              title: 'Networking & APIs',
              icon: Icons.cloud,
              isExpanded: _isNetworkingExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.http,
                  title: 'HTTP Requests',
                  route: '/networking/http',
                  isSelected: widget.currentRoute == '/networking/http',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.download,
                  title: 'Dio Package',
                  route: '/networking/dio',
                  isSelected: widget.currentRoute == '/networking/dio',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'REST APIs',
                  route: '/networking/rest',
                  isSelected: widget.currentRoute == '/networking/rest',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'GraphQL',
                  route: '/networking/graphql',
                  isSelected: widget.currentRoute == '/networking/graphql',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.webhook,
                  title: 'WebSockets',
                  route: '/networking/websockets',
                  isSelected: widget.currentRoute == '/networking/websockets',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.download_for_offline,
                  title: 'File Download/Upload',
                  route: '/networking/files',
                  isSelected: widget.currentRoute == '/networking/files',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isNetworkingExpanded = expanded;
                });
              },
            ),

            // 5. Local Storage
            _buildExpandableSection(
              title: 'Local Storage',
              icon: Icons.storage,
              isExpanded: _isStorageExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.key,
                  title: 'Shared Preferences',
                  route: '/storage/shared-prefs',
                  isSelected: widget.currentRoute == '/storage/shared-prefs',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'SQLite Database',
                  route: '/storage/sqlite',
                  isSelected: widget.currentRoute == '/storage/sqlite',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.hive,
                  title: 'Hive Database',
                  route: '/storage/hive',
                  isSelected: widget.currentRoute == '/storage/hive',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.file_copy,
                  title: 'File Storage',
                  route: '/storage/files',
                  isSelected: widget.currentRoute == '/storage/files',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.security,
                  title: 'Secure Storage',
                  route: '/storage/secure',
                  isSelected: widget.currentRoute == '/storage/secure',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isStorageExpanded = expanded;
                });
              },
            ),

            // 6. Advanced Features
            _buildExpandableSection(
              title: 'Advanced Features',
              icon: Icons.code,
              isExpanded: _isAdvancedExpanded,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.notifications_active,
                  title: 'Push Notifications',
                  route: '/advanced/notifications',
                  isSelected: widget.currentRoute == '/advanced/notifications',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.payment,
                  title: 'In-App Purchases',
                  route: '/advanced/inapp-purchases',
                  isSelected:
                      widget.currentRoute == '/advanced/inapp-purchases',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.location_on,
                  title: 'Location Services',
                  route: '/advanced/location',
                  isSelected: widget.currentRoute == '/advanced/location',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.camera_alt,
                  title: 'Camera & Gallery',
                  route: '/advanced/camera',
                  isSelected: widget.currentRoute == '/advanced/camera',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.map,
                  title: 'Maps & Geolocation',
                  route: '/advanced/maps',
                  isSelected: widget.currentRoute == '/advanced/maps',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.security,
                  title: 'Authentication',
                  route: '/advanced/auth',
                  isSelected: widget.currentRoute == '/advanced/auth',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.topic,
                  title: 'Internationalization',
                  route: '/advanced/i18n',
                  isSelected: widget.currentRoute == '/advanced/i18n',
                  indent: true,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.accessibility,
                  title: 'Accessibility',
                  route: '/advanced/accessibility',
                  isSelected: widget.currentRoute == '/advanced/accessibility',
                  indent: true,
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isAdvancedExpanded = expanded;
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
