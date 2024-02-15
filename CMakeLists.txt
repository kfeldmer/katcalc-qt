cmake_minimum_required(VERSION 3.16)

project(Katronic_Demo_QtQuick VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appKatronic_Demo_QtQuick
    main.cpp
    Backend/calculator.cpp
)

qt_add_qml_module(appKatronic_Demo_QtQuick
    URI Katronic_Demo_QtQuick
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES UI/Assets/dropdown-arrow.png UI/Assets/katronic-logo.png
    QML_FILES UI/HomeScreen/HomeScreen.qml
    RESOURCES UI/Assets/dropdown-arrow.png UI/Assets/katronic-logo.png
    QML_FILES UI/CalculatorPage/CalculatorPage.qml
    QML_FILES UI/GeometryPage/GeometryPage.qml
    SOURCES Backend/calculator.h Backend/calculator.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appKatronic_Demo_QtQuick PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appKatronic_Demo_QtQuick
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appKatronic_Demo_QtQuick
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appKatronic_Demo_QtQuick
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Generate the deployment script for the target.
qt_generate_deploy_app_script(
    TARGET appKatronic_Demo_QtQuick
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)

# Call the deployment script on "cmake --install".
install(SCRIPT ${deploy_script})
