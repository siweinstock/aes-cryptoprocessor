set_global_assignment -entity "pllclk" -library "lib_pllclk" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pllclk" -library "lib_pllclk" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "pllclk" -library "lib_pllclk" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pllclk" -name SPD_FILE [file join $::quartus(sip_path) "pllclk.spd"]

set_global_assignment -library "lib_pllclk" -name MISC_FILE [file join $::quartus(sip_path) "pllclk_sim/pllclk.vo"]
