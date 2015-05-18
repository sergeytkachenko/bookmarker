<?php

	require_once($basepath . "ImageManager/ImageManagerPlugin.php");

	// * * * * ImageManager config

	// General options
	$mcImageManagerConfig['general.theme'] = "im";
	$mcImageManagerConfig['general.tools'] = "createdir,upload,refresh,addfavorite,removefavorite,insert,delete,edit,preview,filemanager"; // "filemanager" button if you have "filemanager.urlprefix" configured.
	$mcImageManagerConfig['general.disabled_tools'] = "";
	$mcImageManagerConfig['general.user_friendly_paths'] = true;
	$mcImageManagerConfig['general.encrypt_paths'] = true;
	$mcImageManagerConfig['general.plugins'] = "History,Favorites"; // comma seperated
	$mcImageManagerConfig['general.demo'] = false;
	$mcImageManagerConfig['general.debug'] = false;
	$mcImageManagerConfig['general.error_log'] = "";
    
    
	$mcImageManagerConfig['general.language'] = "ru"; // en, sv
	$mcImageManagerConfig['general.remember_last_path'] = true;
	$mcImageManagerConfig['general.allow_export'] = "demo,tools,disabled_tools,debug,plugins";
	$mcImageManagerConfig['general.allow_override'] = "*";

	// Preview options
	$mcImageManagerConfig['preview.wwwroot'] = "../../../.."; // absolute or relative from this script path (c:/Inetpub/wwwroot).
        $mcImageManagerConfig['preview.urlprefix'] = ($_SERVER['SERVER_PORT'] == SERVER_SECURE_PORT ? 'https' : 'http') . "://$_SERVER[HTTP_HOST]/"; // domain name
	$mcImageManagerConfig['preview.urlprefix'] = "";
        $mcImageManagerConfig['preview.urlsuffix'] = "";
	$mcImageManagerConfig['preview.allow_export'] = "urlprefix,urlsuffix";
	$mcImageManagerConfig['preview.allow_override'] = "*";

	// Create directory options
	$mcImageManagerConfig['createdir.include_directory_pattern'] = '';
	$mcImageManagerConfig['createdir.exclude_directory_pattern'] = '/[^a-z0-9_]/';
	$mcImageManagerConfig['createdir.allow_override'] = "*";

	// General filesystem options
	$mcImageManagerConfig['filesystem'] = "Moxiecode_LocalFileImpl";
	$mcImageManagerConfig['filesystem.path'] = ''; // absolute or relative from this script path, optional.
	$mcImageManagerConfig['filesystem.rootpath'] = "../../../../attach"; // absolute or relative from this script path, required.
	$mcImageManagerConfig['filesystem.datefmt'] = "Y-m-d H:i";
	$mcImageManagerConfig['filesystem.include_directory_pattern'] = '';
	$mcImageManagerConfig['filesystem.exclude_directory_pattern'] = '/^(mcith$|\.)/i';
	$mcImageManagerConfig['filesystem.invalid_directory_name_msg'] = "";
	$mcImageManagerConfig['filesystem.include_file_pattern'] = '';
	$mcImageManagerConfig['filesystem.exclude_file_pattern'] = '/(^mcic_)/i';
	$mcImageManagerConfig['filesystem.invalid_file_name_msg'] = "";
	$mcImageManagerConfig['filesystem.extensions'] = "gif,jpg,png,bmp,swf,dcr,mov,qt,ram,rm,avi,mpg,mpeg,asf,flv,pdf";
	$mcImageManagerConfig['filesystem.readable'] = true;
	$mcImageManagerConfig['filesystem.writable'] = true;
	$mcImageManagerConfig['filesystem.delete_recursive'] = false;
	$mcImageManagerConfig['filesystem.directory_templates'] = '${rootpath}/templates/directory,${rootpath}/templates/another_directory';
	$mcImageManagerConfig['filesystem.force_directory_template'] = false;
	$mcImageManagerConfig['filesystem.list_directories'] = false;
	$mcImageManagerConfig['filesystem.allow_export'] = "extensions,readable,writable,directory_templates,force_directory_template";
	$mcImageManagerConfig['filesystem.allow_override'] = "*";

	// Thumbnail options
	$mcImageManagerConfig['thumbnail'] = "ImageToolsGD";
	$mcImageManagerConfig['thumbnail.enabled'] = true; // false default, verify that you have GD on your server
	$mcImageManagerConfig['thumbnail.auto_generate'] = true; // only if above is set to true
	$mcImageManagerConfig['thumbnail.use_exif'] = false; // use exif th if avalible
	$mcImageManagerConfig['thumbnail.insert'] = true;
	$mcImageManagerConfig['thumbnail.width'] = "90"; // px
	$mcImageManagerConfig['thumbnail.height'] = "90"; // px
	$mcImageManagerConfig['thumbnail.max_width'] = ""; // px (will not generate thumbnail if larger than this size)
	$mcImageManagerConfig['thumbnail.max_height'] = ""; // px (will not generate thumbnail if larger than this size)
	$mcImageManagerConfig['thumbnail.scale_mode'] = "percentage"; // percentage,resize
	$mcImageManagerConfig['thumbnail.folder'] = "mcith"; // required, exclude this folder with file pattern '/^mcith$/i' if you don't want it to show
	$mcImageManagerConfig['thumbnail.prefix'] = "mcith_"; // 
	$mcImageManagerConfig['thumbnail.delete'] = true; // delete th when original is deleted
	$mcImageManagerConfig['thumbnail.jpeg_quality'] = 75; // quality of th image, note that this is not checked against when regenerating ths.
	$mcImageManagerConfig['thumbnail.allow_export'] = "width,height,insert";
	$mcImageManagerConfig['thumbnail.allow_override'] = "*";

	// Upload options
	$mcImageManagerConfig['upload.maxsize'] = "10MB";
	$mcImageManagerConfig['upload.overwrite'] = true;
	$mcImageManagerConfig['upload.include_file_pattern'] = '';
	$mcImageManagerConfig['upload.exclude_file_pattern'] = '';
	$mcImageManagerConfig['upload.invalid_file_name_msg'] = "";
	$mcImageManagerConfig['upload.extensions'] = "gif,jpg,jpeg,png";
	$mcImageManagerConfig['upload.create_thumbnail'] = true; // true/false, create thumbnail on upload
	$mcImageManagerConfig['upload.autoresize'] = false; // Force max width/height, IM will rescale uploaded images.
	$mcImageManagerConfig['upload.autoresize_jpeg_quality'] = 75; // Force max width/height, IM will rescale uploaded images.
	$mcImageManagerConfig['upload.max_width'] = "800"; // Only if force_width_height is true
	$mcImageManagerConfig['upload.max_height'] = "600"; // Only if force_width_height is true
	$mcImageManagerConfig['upload.use_flash'] = false;
	$mcImageManagerConfig['upload.format'] = "";
	$mcImageManagerConfig['upload.allow_export'] = "maxsize,use_flash,overwrite,extensions";
	$mcImageManagerConfig['upload.allow_override'] = "*";

	// Edit image options
	$mcImageManagerConfig['edit.jpeg_quality'] = "90";

	// Authenication
	$mcImageManagerConfig['authenticator'] = "BaseAuthenticator";
	$mcImageManagerConfig['authenticator.login_page'] = "login_session_auth.php";
	$mcImageManagerConfig['authenticator.allow_override'] = "*";

	// SessionAuthenticator
	$mcImageManagerConfig['SessionAuthenticator.logged_in_key'] = "isLoggedIn";
	$mcImageManagerConfig['SessionAuthenticator.groups_key'] = "groups";
	$mcImageManagerConfig['SessionAuthenticator.user_key'] = "user";
	$mcImageManagerConfig['SessionAuthenticator.path_key'] = "mc_path";
	$mcImageManagerConfig['SessionAuthenticator.rootpath_key'] = "mc_rootpath";
	$mcImageManagerConfig['SessionAuthenticator.config_prefix'] = "imagemanager";

	// ExternalAuthenticator config
	$mcImageManagerConfig['ExternalAuthenticator.external_auth_url'] = "auth_example.jsp";
	$mcImageManagerConfig['ExternalAuthenticator.secret_key'] = "someSecretKey";

	// Local filesystem options
	$mcImageManagerConfig['filesystem.local.file_mask'] = "0777"; // 0777 for full access
	$mcImageManagerConfig['filesystem.local.directory_mask'] = "0777"; // 0777 for full access
	$mcImageManagerConfig['filesystem.local.file_template'] = '${rootpath}/templates/file.htm'; // not yet implemented, always forced
	$mcImageManagerConfig['filesystem.local.access_file_name'] = "mc_access";
	$mcImageManagerConfig['filesystem.local.allow_override'] = "*";

	// Stream options
	$mcImageManagerConfig['stream.mimefile'] = "mime.types";
	$mcImageManagerConfig['stream.include_file_pattern'] = '';
	$mcImageManagerConfig['stream.exclude_file_pattern'] = '/\.php$|\.shtm$/i';
	$mcImageManagerConfig['stream.extensions'] = "*";
	$mcImageManagerConfig['stream.allow_override'] = "*";

	// Filemanager configuration
	$mcImageManagerConfig['filemanager.urlprefix'] = "../../../filemanager/?type=fm"; // need to add "filemanager" button to tools as well.
	$mcImageManagerConfig['filemanager.allow_override'] = "*";
	$mcImageManagerConfig['filemanager.allow_export'] = "urlprefix";

	// Logging options
	$mcImageManagerConfig['log.enabled'] = true;
	$mcImageManagerConfig['log.level'] = "debug"; // debug|warn|error
	$mcImageManagerConfig['log.path'] = "logs";
	$mcImageManagerConfig['log.filename'] = "logs.log";
	$mcImageManagerConfig['log.format'] = "[{time}] [{level}] {message}";
	$mcImageManagerConfig['log.max_size'] = "100k";
	$mcImageManagerConfig['log.max_files'] = "10";

	// Custom plugin options.
	$mcImageManagerConfig['favorites.max'] = 20; // 10 is default.
	$mcImageManagerConfig['history.max'] = 20; // 10 is default.
?>