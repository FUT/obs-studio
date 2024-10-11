find_package(Qt6 REQUIRED Widgets Network Svg Xml)

if(OS_LINUX OR OS_FREEBSD OR OS_OPENBSD)
  find_package(Qt6 REQUIRED Gui DBus)
endif()

if(NOT TARGET OBS::qt-wrappers)
  add_subdirectory("${CMAKE_SOURCE_DIR}/shared/qt/wrappers" "${CMAKE_BINARY_DIR}/shared/qt/wrappers")
endif()

target_link_libraries(
  obs-studio
  PRIVATE Qt::Widgets Qt::Svg Qt::Xml Qt::Network OBS::qt-wrappers
)

#target_include_directories(awerty PUBLIC "${PROJECT_SOURCE_DIR}/libobs")
#target_include_directories(awerty PUBLIC "${PROJECT_SOURCE_DIR}/UI")
#target_include_directories(awerty PUBLIC "${PROJECT_SOURCE_DIR}/UI/obs-frontend-api")

message(CMAKE_PREFIX_PATH=="${CMAKE_PREFIX_PATH}")
message(PROJECT_SOURCE_DIR=="${PROJECT_SOURCE_DIR}")
message(QT_ADDITIONAL_PACKAGES_PREFIX_PATH=="${QT_ADDITIONAL_PACKAGES_PREFIX_PATH}")


#target_link_libraries(obs-studio PRIVATE OBS::libobs OBS::frontend-api)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets WebEngineWidgets)
target_link_libraries(obs-studio PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Qt6::WebEngineWidgets
)

set_target_properties(
  obs-studio
  PROPERTIES AUTOMOC ON AUTOUIC ON AUTORCC ON
)

set_property(TARGET obs-studio APPEND PROPERTY AUTOUIC_SEARCH_PATHS forms forms/source-toolbar)

set(
  _qt_sources
  forms/AutoConfigFinishPage.ui
  forms/AutoConfigStartPage.ui
  forms/AutoConfigStartPage.ui
  forms/AutoConfigStreamPage.ui
  forms/AutoConfigTestPage.ui
  forms/AutoConfigVideoPage.ui
  forms/ColorSelect.ui
  forms/obs.qrc
  forms/OBSAbout.ui
  forms/OBSAdvAudio.ui
  forms/OBSBasic.ui
  forms/OBSBasicControls.ui
  forms/OBSBasicFilters.ui
  forms/OBSBasicInteraction.ui
  forms/OBSBasicProperties.ui
  forms/OBSBasicSettings.ui
  forms/OBSBasicSourceSelect.ui
  forms/OBSBasicTransform.ui
  forms/OBSBasicVCamConfig.ui
  forms/OBSExtraBrowsers.ui
  forms/OBSImporter.ui
  forms/OBSLogReply.ui
  forms/OBSLogViewer.ui
  forms/OBSMissingFiles.ui
  forms/OBSRemux.ui
  forms/OBSUpdate.ui
  forms/OBSYoutubeActions.ui
  forms/source-toolbar/browser-source-toolbar.ui
  forms/source-toolbar/color-source-toolbar.ui
  forms/source-toolbar/device-select-toolbar.ui
  forms/source-toolbar/game-capture-toolbar.ui
  forms/source-toolbar/image-source-toolbar.ui
  forms/source-toolbar/media-controls.ui
  forms/source-toolbar/text-source-toolbar.ui
)

target_sources(obs-studio PRIVATE ${_qt_sources})

source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}/forms" PREFIX "UI Files" FILES ${_qt_sources})

unset(_qt_sources)
