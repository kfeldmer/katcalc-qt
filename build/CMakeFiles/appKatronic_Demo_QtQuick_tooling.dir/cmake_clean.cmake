file(REMOVE_RECURSE
  "Katronic_Demo_QtQuick/Main.qml"
  "Katronic_Demo_QtQuick/UI/Assets/dropdown-arrow.png"
  "Katronic_Demo_QtQuick/UI/Assets/katronic-logo.png"
  "Katronic_Demo_QtQuick/UI/CalculatorPage/CalculatorPage.qml"
  "Katronic_Demo_QtQuick/UI/GeometryPage/GeometryPage.qml"
  "Katronic_Demo_QtQuick/UI/HomeScreen/HomeScreen.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/appKatronic_Demo_QtQuick_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
