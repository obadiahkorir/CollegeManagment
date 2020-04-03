var documentViewer;
$(document).ready(function () {

    var preferences = new gnostice.Preferences();

    //Specifies whether toolbar of the viewer should be displayed.
    preferences.toolbarVisible = true;
   
    //Specifies whether color inversion controls needs to be displayed.
    preferences.visibleColorInversionControls.allPages = true;

    //Specifies whether file operation controls needs to be displayed.
    preferences.visibleFileOperationControls.download = true;
    preferences.visibleFileOperationControls.downloadAs = true;
    preferences.visibleFileOperationControls.open = true;
    preferences.visibleFileOperationControls.print = true;
    preferences.visibleFileOperationControls.save = true;

    //Specifies whether full screen control needs to be displayed.
    preferences.visibleFullScreen = true;

    //Specifies whether page navigation controls needs to be displayed.
    preferences.visibleNavigationControls.firstPage = true;
    preferences.visibleNavigationControls.gotoPage = true;
    preferences.visibleNavigationControls.lastPage = true;
    preferences.visibleNavigationControls.nextPage = true;
    preferences.visibleNavigationControls.pageIndicator = true;
    preferences.visibleNavigationControls.prevPage = true;

    //Specifies whether page magnification controls needs to be displayed.
    preferences.visibleZoomControls.fixedSteps = true;
    preferences.visibleZoomControls.zoomIn = true;
    preferences.visibleZoomControls.zoomOut = true;

    //Specifies whether page rotation operation controls needs to be displayed.
    preferences.visibleRotationControls.clockwise = true;
    preferences.visibleRotationControls.counterClockwise = true;

    //Specifies search operation controls settings.
    preferences.search.enableQuickSearch = true;
    preferences.search.visibleQuickSearchControls = true;
    preferences.search.highlightColor = "yellow";

    // Specifies initial view settings with which document when loaded needs to be displayed.
    preferences.initialView.zoomValue = gnostice.ZoomMode.actualSize;
    preferences.initialView.rotationAngle = gnostice.RotationAngle.zero;
    preferences.initialView.colorInversionApplied = false;
    preferences.initialView.navigationPaneOpened = true;
    preferences.navigationPane.enableBookmarks = true;
    preferences.navigationPane.enableThumbnails = true;
    preferences.navigationPane.visible = true;
    preferences.navigationPane.position = gnostice.NavigationPanePosition.fixed;
    preferences.navigationPane.width = 210;

    // Specifies hyperlink access settings.
    preferences.security.hyperlinkNavigation.access = gnostice.HyperlinkAccess.alwaysAsk;

    preferences.localization.language = "en_US";
    preferences.localization.resourcePath = "Scripts/localization/";

    documentViewer = new gnostice.DocumentViewer('doc-viewer-id', preferences);
});
