BEGIN;
-- 用户
INSERT INTO system_user (username, password, nickname, tel, email, sex, status, is_admin, remark, create_time, update_time) VALUES ('lanyulei', '$2a$10$7AkPs/BP4h3JQiK0K2vPLeh/qa.soqsiCllhjwvHYkfEnHo./kQo6', '兰玉磊', '', 'lanyulei@fdevops.com', 0, true, true, '', now(), now());

-- 菜单
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/home', 'Home', 'home/index', '', '首页', '', false, true, true, false, '{home}', 'HomeFilled', 0, 2, 0, 1, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system', 'System', 'layout/routerView/parent', '', '系统设置', '', false, true, false, false, '{system}', 'Setting', 0, 1, 2, 2, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system/menu', 'SystemMenu', 'system/menu/index', '', '菜单管理', '', false, true, false, false, '{system:menu}', 'Tickets', 2, 2, 15, 3, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system/user', 'SystemUser', 'system/user/index', '', '用户管理', '', false, true, false, false, '{system:user}', 'User', 2, 2, 1, 4, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system/role', 'SystemRole', 'system/role/index', '', '角色管理', '', false, true, false, false, '{system:role}', 'SetUp', 2, 2, 5, 5, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system/api', 'SystemAPI', 'system/api/index', '', '接口管理', '', false, true, false, false, '{system:api}', 'Promotion', 2, 2, 10, 6, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system/role/permission/:id', 'SystemRolePermission', 'system/role/permission', '', '角色权限', '', true, true, false, false, '{system:role:permission}', 'Minus', 2, 2, 99, 7, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '新建用户', '', false, false, false, false, '{system:user:create}', '', 4, 3, 0, 8, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '编辑用户', '', false, false, false, false, '{system:user:edit}', '', 4, 3, 0, 9, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '删除用户', '', false, false, false, false, '{system:user:delete}', '', 4, 3, 0, 10, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '新建角色', '', false, false, false, false, '{system:role:create}', '', 5, 3, 0, 11, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '角色权限', '', false, false, false, false, '{system:role:permission}', '', 5, 3, 0, 12, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '编辑角色', '', false, false, false, false, '{system:role:edit}', '', 5, 3, 0, 13, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '删除角色', '', false, false, false, false, '{system:role:delete}', '', 5, 3, 0, 14, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '新建接口', '', false, false, false, false, '{system:api:create}', '', 6, 3, 0, 15, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '编辑接口', '', false, false, false, false, '{system:api:edit}', '', 6, 3, 0, 16, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '删除接口', '', false, false, false, false, '{system:api:delete}', '', 6, 3, 0, 17, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '接口分组列表', '', false, false, false, false, '{system:api-group:list}', '', 6, 3, 0, 18, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '新建接口分组', '', false, false, false, false, '{system:api-group:create}', '', 6, 3, 0, 19, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '编辑接口分组', '', false, false, false, false, '{system:api-group:edit}', '', 6, 3, 0, 20, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '删除接口分组', '', false, false, false, false, '{system:api-group:delete}', '', 6, 3, 0, 21, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '新建顶级菜单', '', false, false, false, false, '{system:top-menu:create}', '', 3, 3, 0, 22, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '保存菜单表单', '', false, false, false, false, '{system:menu-form:save}', '', 3, 3, 0, 23, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '右键新建菜单', '', false, false, false, false, '{system:menu:create}', '', 3, 3, 0, 24, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '右键删除菜单', '', false, false, false, false, '{system:menu:delete}', '', 3, 3, 0, 25, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '新建页面按钮', '', false, false, false, false, '{system:menu-button:create}', '', 3, 3, 0, 26, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '编辑页面按钮', '', false, false, false, false, '{system:menu-button:edit}', '', 3, 3, 0, 27, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '删除页面按钮', '', false, false, false, false, '{system:menu-button:delete}', '', 3, 3, 0, 28, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '菜单接口管理', '', false, false, false, false, '{system:menu-api:manager}', '', 3, 3, 0, 29, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '保存权限', '', false, false, false, false, '{system:role-permission:save}', '', 7, 3, 0, 30, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '接口权限管理', '', false, false, false, false, '{system:role-permission-api:manager}', '', 7, 3, 0, 31, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('/system/login-log', 'SystemLoginLog', 'system/loginLog/index', '', '登陆日志', '', false, true, false, false, '{system:loginLog}', 'TrendCharts', 2, 2, 20, 32, now(), now());
INSERT INTO system_menu (path, name, component, redirect, title, hyperlink, is_hide, is_keep_alive, is_affix, is_iframe, auth, icon, parent, type, sort, id, create_time, update_time) VALUES ('', '', '', '', '删除登陆日志', '', false, false, false, false, '{system:loginLog:delete}', '', 34, 3, 0, 33, now(), now());

-- API分组
INSERT INTO system_api_group (name, remark, create_time, update_time) VALUES ('系统管理', '', '2021-09-05 10:25:43.667889 +00:00', '2021-09-05 10:49:02.592078 +00:00');

-- API接口
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取用户列表', '/api/v1/system/user', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取用户详情', '/api/v1/system/user/info', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('通过ID获取用户详情', '/api/v1/system/user/info/:id', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('新建用户', '/api/v1/system/user', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('编辑用户', '/api/v1/system/user/:id', 'PUT', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('删除用户', '/api/v1/system/user/:id', 'DELETE', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取菜单树', '/api/v1/system/menu/tree', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('新建/编辑菜单', '/api/v1/system/menu', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('删除菜单', '/api/v1/system/menu/:id', 'DELETE', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('批量删除菜单', '/api/v1/system/menu/batch', 'DELETE', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取菜单对应的按钮', '/api/v1/system/menu/button/:id', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('菜单绑定/解绑接口', '/api/v1/system/menu/api/:id', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取菜单绑定的接口', '/api/v1/system/menu/api/:id', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取菜单对应的接口', '/api/v1/system/menu/api-list/:id', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取角色列表', '/api/v1/system/role', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('新建/编辑角色', '/api/v1/system/role', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('删除角色', '/api/v1/system/role/:id', 'DELETE', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('角色授权/解除菜单权限', '/api/v1/system/role/permission/:id', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('角色授权/解除接口权限', '/api/v1/system/role/api/:id', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取角色授权的接口权限', '/api/v1/system/role/api/:id', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取角色授权的菜单权限', '/api/v1/system/role/permission/:id', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取接口列表', '/api/v1/system/api', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('新建/编辑接口', '/api/v1/system/api', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('删除接口', '/api/v1/system/api/:id', 'DELETE', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('接口分组列表', '/api/v1/system/api-group', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('新建/编辑接口分组', '/api/v1/system/api-group', 'POST', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('删除接口分组', '/api/v1/system/api-group/:id', 'DELETE', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('获取登陆日志列表', '/api/v1/system/login-log', 'GET', 1, '', now(), now());
INSERT INTO system_api (title, url, method, "group", remark, create_time, update_time) VALUES ('删除登陆日志', '/api/v1/system/login-log/:id', 'DELETE', 1, '', now(), now());

-- 菜单与接口的关联
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (4, 6, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (4, 5, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (4, 4, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (4, 3, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (4, 2, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (4, 1, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 21, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 20, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 19, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 18, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 17, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 16, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (5, 15, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (6, 27, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (6, 26, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (6, 25, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (6, 24, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (6, 23, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (6, 22, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 14, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 13, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 12, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 11, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 10, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 9, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 8, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (3, 7, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (7, 18, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (7, 19, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (7, 20, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (7, 21, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (34, 35, now(), now());
INSERT INTO system_menu_api (menu, api, create_time, update_time) VALUES (34, 34, now(), now());

COMMIT;
-- 执行结束
