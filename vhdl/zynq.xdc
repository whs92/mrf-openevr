
#     _____
#    / #   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET ELECTRONICS MARKETING
#      \======/         www.picozed.org
#       \====/
# ----------------------------------------------------------------------------
#
#  Created With Avnet Constraints Generator V0.8.0
#     Date: Friday, December 19, 2014
#     Time: 1:57:39 PM
#
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#
#  Please direct any questions to:
#     Avnet Technical Community Forums
#     http://picozed.org/forum
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2014 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------
#
#  Notes:
#
#  Monday, april 20, 2015
#
#     IO standards based upon Bank 34, Bank 35, and Bank 13 Vcco supply
#     of 1.8V requires bank VCCO voltage to be set to 1.8V.
#
#     Net names are not allowed to contain hyphen characters '-' since this
#     is not a legal VHDL87 or Verilog character within an identifier.
#     HDL net names are adjusted to contain no hyphen characters '-' but
#     rather use underscore '_' characters.  Comment net name with the hyphen
#     characters will remain in place since these are intended to match the
#     schematic net names in order to better enable schematic search.
#
#     The string provided in the comment field provides the Zynq device pin
#     mapping in the following format:
#
#     "<Zynq Pin>.<SOM Net>"
#
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN AA15 [get_ports {gpout_tri_o[0]}]
set_property PACKAGE_PIN AA14 [get_ports {gpout_tri_o[1]}]
set_property PACKAGE_PIN Y15 [get_ports {gpout_tri_o[2]}]
set_property PACKAGE_PIN Y14 [get_ports {gpout_tri_o[3]}]
# ----------------------------------------------------------------------------
# Expansion I/O - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN AA15 [get_ports {BANK13_LVDS_0_N }];  # "AA15.BANK13_LVDS_0_N"
#set_property PACKAGE_PIN AA14 [get_ports {BANK13_LVDS_0_P }];  # "AA14.BANK13_LVDS_0_P"
#set_property PACKAGE_PIN Y15  [get_ports {BANK13_LVDS_1_N }];  # "Y15.BANK13_LVDS_1_N"
#set_property PACKAGE_PIN Y14  [get_ports {BANK13_LVDS_1_P }];  # "Y14.BANK13_LVDS_1_P"
#set_property PACKAGE_PIN Y13  [get_ports {BANK13_LVDS_10_N}];  # "Y13.BANK13_LVDS_10_N"
#set_property PACKAGE_PIN Y12  [get_ports {BANK13_LVDS_10_P}];  # "Y12.BANK13_LVDS_10_P"
#set_property PACKAGE_PIN W11  [get_ports {BANK13_LVDS_11_N}];  # "W11.BANK13_LVDS_11_N"
#set_property PACKAGE_PIN V11  [get_ports {BANK13_LVDS_11_P}];  # "V11.BANK13_LVDS_11_P"
#set_property PACKAGE_PIN V14  [get_ports {BANK13_LVDS_12_N}];  # "V14.BANK13_LVDS_12_N"
#set_property PACKAGE_PIN V13  [get_ports {BANK13_LVDS_12_P}];  # "V13.BANK13_LVDS_12_P"
#set_property PACKAGE_PIN W13  [get_ports {BANK13_LVDS_13_N}];  # "W13.BANK13_LVDS_13_N"
#set_property PACKAGE_PIN W12  [get_ports {BANK13_LVDS_13_P}];  # "W12.BANK13_LVDS_13_P"
#set_property PACKAGE_PIN T17  [get_ports {BANK13_LVDS_14_N}];  # "T17.BANK13_LVDS_14_N"
#set_property PACKAGE_PIN R17  [get_ports {BANK13_LVDS_14_P}];  # "R17.BANK13_LVDS_14_P"
#set_property PACKAGE_PIN W15  [get_ports {BANK13_LVDS_15_N}];  # "W15.BANK13_LVDS_15_N"
#set_property PACKAGE_PIN V15  [get_ports {BANK13_LVDS_15_P}];  # "V15.BANK13_LVDS_15_P"
#set_property PACKAGE_PIN W16  [get_ports {BANK13_LVDS_16_N}];  # "W16.BANK13_LVDS_16_N"
#set_property PACKAGE_PIN V16  [get_ports {BANK13_LVDS_16_P}];  # "V16.BANK13_LVDS_16_P"
#set_property PACKAGE_PIN V19  [get_ports {BANK13_LVDS_2_N }];  # "V19.BANK13_LVDS_2_N"
#set_property PACKAGE_PIN U19  [get_ports {BANK13_LVDS_2_P }];  # "U19.BANK13_LVDS_2_P"
#set_property PACKAGE_PIN W18  [get_ports {BANK13_LVDS_3_N }];  # "W18.BANK13_LVDS_3_N"
#set_property PACKAGE_PIN V18  [get_ports {BANK13_LVDS_3_P }];  # "V18.BANK13_LVDS_3_P"
set_property PACKAGE_PIN AB22 [get_ports PL_PB3]
set_property PACKAGE_PIN AB21 [get_ports PL_LED4]
#set_property PACKAGE_PIN AB21 [get_ports {BANK13_LVDS_4_P }];  # "AB21.BANK13_LVDS_4_P"
set_property PACKAGE_PIN AB19 [get_ports PL_PB5]
set_property PACKAGE_PIN AB18 [get_ports PL_PB4]
#set_property PACKAGE_PIN AA20 [get_ports {BANK13_LVDS_6_N }];  # "AA20.BANK13_LVDS_6_N"
set_property PACKAGE_PIN AA20 [get_ports PL_LED3]
#set_property PACKAGE_PIN AA19 [get_ports {BANK13_LVDS_6_P }];  # "AA19.BANK13_LVDS_6_P"
set_property PACKAGE_PIN AA19 [get_ports PL_LED2]
#set_property PACKAGE_PIN Y19  [get_ports {BANK13_LVDS_7_N }];  # "Y19.BANK13_LVDS_7_N"
set_property PACKAGE_PIN Y18 [get_ports PL_CLK]
set_property PACKAGE_PIN AA17 [get_ports BANK13_LVDS_8_N]
set_property PACKAGE_PIN AA16 [get_ports BANK13_LVDS_8_P]
#set_property PACKAGE_PIN AB11 [get_ports {BANK13_LVDS_9_N }];  # "AB11.BANK13_LVDS_9_N"
#set_property PACKAGE_PIN AA11 [get_ports {BANK13_LVDS_9_P }];  # "AA11.BANK13_LVDS_9_P"
set_property PACKAGE_PIN T16 [get_ports PL_PB2]


# ----------------------------------------------------------------------------
# Expansion Connector JX1 - Bank 35 -
# Warning! Bank 35 is a High Performance Bank on the 7030
# and will only accept 1.8V level signals
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN H3   [get_ports {JX1_LVDS_0_N    }];  # "H3.JX1_LVDS_0_N"
#set_property PACKAGE_PIN H4   [get_ports {JX1_LVDS_0_P    }];  # "H4.JX1_LVDS_0_P"
#set_property PACKAGE_PIN E5   [get_ports {JX1_LVDS_1_N    }];  # "E5.JX1_LVDS_1_N"
#set_property PACKAGE_PIN F5   [get_ports {JX1_LVDS_1_P    }];  # "F5.JX1_LVDS_1_P"
#set_property PACKAGE_PIN C5   [get_ports {JX1_LVDS_10_N   }];  # "C5.JX1_LVDS_10_N"
#set_property PACKAGE_PIN C6   [get_ports {JX1_LVDS_10_P   }];  # "C6.JX1_LVDS_10_P"
#set_property PACKAGE_PIN C4   [get_ports {JX1_LVDS_11_N   }];  # "C4.JX1_LVDS_11_N"
#set_property PACKAGE_PIN D5   [get_ports {JX1_LVDS_11_P   }];  # "D5.JX1_LVDS_11_P"
#set_property PACKAGE_PIN B3   [get_ports {JX1_LVDS_12_N   }];  # "B3.JX1_LVDS_12_N"
#set_property PACKAGE_PIN B4   [get_ports {JX1_LVDS_12_P   }];  # "B4.JX1_LVDS_12_P"
#set_property PACKAGE_PIN C3   [get_ports {JX1_LVDS_13_N   }];  # "C3.JX1_LVDS_13_N"
#set_property PACKAGE_PIN D3   [get_ports {JX1_LVDS_13_P   }];  # "D3.JX1_LVDS_13_P"
#set_property PACKAGE_PIN C1   [get_ports {JX1_LVDS_14_N   }];  # "C1.JX1_LVDS_14_N"
#set_property PACKAGE_PIN D1   [get_ports {JX1_LVDS_14_P   }];  # "D1.JX1_LVDS_14_P"
#set_property PACKAGE_PIN A1   [get_ports {JX1_LVDS_15_N   }];  # "A1.JX1_LVDS_15_N"
#set_property PACKAGE_PIN A2   [get_ports {JX1_LVDS_15_P   }];  # "A2.JX1_LVDS_15_P"
#set_property PACKAGE_PIN D2   [get_ports {JX1_LVDS_16_N   }];  # "D2.JX1_LVDS_16_N"
#set_property PACKAGE_PIN E2   [get_ports {JX1_LVDS_16_P   }];  # "E2.JX1_LVDS_16_P"
#set_property PACKAGE_PIN D6   [get_ports {JX1_LVDS_17_N   }];  # "D6.JX1_LVDS_17_N"
#set_property PACKAGE_PIN D7   [get_ports {JX1_LVDS_17_P   }];  # "D7.JX1_LVDS_17_P"
#set_property PACKAGE_PIN E7   [get_ports {JX1_LVDS_18_N   }];  # "E7.JX1_LVDS_18_N"
#set_property PACKAGE_PIN F7   [get_ports {JX1_LVDS_18_P   }];  # "F7.JX1_LVDS_18_P"
#set_property PACKAGE_PIN A4   [get_ports {JX1_LVDS_19_N   }];  # "A4.JX1_LVDS_19_N"
#set_property PACKAGE_PIN A5   [get_ports {JX1_LVDS_19_P   }];  # "A5.JX1_LVDS_19_P"
set_property PACKAGE_PIN G2 [get_ports PL_PB1]
set_property PACKAGE_PIN G3 [get_ports PL_LED1]
#set_property PACKAGE_PIN G3   [get_ports {JX1_LVDS_2_P    }];  # "G3.JX1_LVDS_2_P"
#set_property PACKAGE_PIN G7   [get_ports {JX1_LVDS_20_N   }];  # "G7.JX1_LVDS_20_N"
#set_property PACKAGE_PIN G8   [get_ports {JX1_LVDS_20_P   }];  # "G8.JX1_LVDS_20_P"
#set_property PACKAGE_PIN A6   [get_ports {JX1_LVDS_21_N   }];  # "A6.JX1_LVDS_21_N"
#set_property PACKAGE_PIN A7   [get_ports {JX1_LVDS_21_P   }];  # "A7.JX1_LVDS_21_P"
#set_property PACKAGE_PIN B6   [get_ports {JX1_LVDS_22_N   }];  # "B6.JX1_LVDS_22_N"
#set_property PACKAGE_PIN B7   [get_ports {JX1_LVDS_22_P   }];  # "B7.JX1_LVDS_22_P"
#set_property PACKAGE_PIN B8   [get_ports {JX1_LVDS_23_N   }];  # "B8.JX1_LVDS_23_N"
#set_property PACKAGE_PIN C8   [get_ports {JX1_LVDS_23_P   }];  # "C8.JX1_LVDS_23_P"
#set_property PACKAGE_PIN F1   [get_ports {JX1_LVDS_3_N    }];  # "F1.JX1_LVDS_3_N"
#set_property PACKAGE_PIN F2   [get_ports {JX1_LVDS_3_P    }];  # "F2.JX1_LVDS_3_P"
#set_property PACKAGE_PIN F4   [get_ports {JX1_LVDS_4_N    }];  # "F4.JX1_LVDS_4_N"
#set_property PACKAGE_PIN G4   [get_ports {JX1_LVDS_4_P    }];  # "G4.JX1_LVDS_4_P"
#set_property PACKAGE_PIN E3   [get_ports {JX1_LVDS_5_N    }];  # "E3.JX1_LVDS_5_N"
#set_property PACKAGE_PIN E4   [get_ports {JX1_LVDS_5_P    }];  # "E4.JX1_LVDS_5_P"
#set_property PACKAGE_PIN F6   [get_ports {JX1_LVDS_6_N    }];  # "F6.JX1_LVDS_6_N"
#set_property PACKAGE_PIN G6   [get_ports {JX1_LVDS_6_P    }];  # "G6.JX1_LVDS_6_P"
#set_property PACKAGE_PIN B1   [get_ports {JX1_LVDS_7_N    }];  # "B1.JX1_LVDS_7_N"
#set_property PACKAGE_PIN B2   [get_ports {JX1_LVDS_7_P    }];  # "B2.JX1_LVDS_7_P"
#set_property PACKAGE_PIN D8   [get_ports {JX1_LVDS_8_N    }];  # "D8.JX1_LVDS_8_N"
#set_property PACKAGE_PIN E8   [get_ports {JX1_LVDS_8_P    }];  # "E8.JX1_LVDS_8_P"
#set_property PACKAGE_PIN G1   [get_ports {JX1_LVDS_9_N    }];  # "G1.JX1_LVDS_9_N"
#set_property PACKAGE_PIN H1   [get_ports {JX1_LVDS_9_P    }];  # "H1.JX1_LVDS_9_P"
#set_property PACKAGE_PIN H6   [get_ports {JX1_SE_0        }];  # "H6.JX1_SE_0"
#set_property PACKAGE_PIN H5   [get_ports {JX1_SE_1        }];  # "H5.JX1_SE_1"


# ----------------------------------------------------------------------------
# Expansion Connector JX2 - Bank 34
# Warning! Bank 34 is a High Performance Bank on the 7030
# and will only accept 1.8V level signals
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN M3   [get_ports {JX2_LVDS_0_N    }];  # "M3.JX2_LVDS_0_N"
#set_property PACKAGE_PIN M4   [get_ports {JX2_LVDS_0_P    }];  # "M4.JX2_LVDS_0_P"
#set_property PACKAGE_PIN J1   [get_ports {JX2_LVDS_1_N    }];  # "J1.JX2_LVDS_1_N"
#set_property PACKAGE_PIN J2   [get_ports {JX2_LVDS_1_P    }];  # "J2.JX2_LVDS_1_P"
#set_property PACKAGE_PIN K3   [get_ports {JX2_LVDS_10_N   }];  # "K3.JX2_LVDS_10_N"
#set_property PACKAGE_PIN K4   [get_ports {JX2_LVDS_10_P   }];  # "K4.JX2_LVDS_10_P"
#set_property PACKAGE_PIN L4   [get_ports {JX2_LVDS_11_N   }];  # "L4.JX2_LVDS_11_N"
#set_property PACKAGE_PIN L5   [get_ports {JX2_LVDS_11_P   }];  # "L5.JX2_LVDS_11_P"
#set_property PACKAGE_PIN T1   [get_ports {JX2_LVDS_12_N   }];  # "T1.JX2_LVDS_12_N"
#set_property PACKAGE_PIN T2   [get_ports {JX2_LVDS_12_P   }];  # "T2.JX2_LVDS_12_P"
#set_property PACKAGE_PIN U1   [get_ports {JX2_LVDS_13_N   }];  # "U1.JX2_LVDS_13_N"
#set_property PACKAGE_PIN U2   [get_ports {JX2_LVDS_13_P   }];  # "U2.JX2_LVDS_13_P"
#set_property PACKAGE_PIN R2   [get_ports {JX2_LVDS_14_N   }];  # "R2.JX2_LVDS_14_N"
#set_property PACKAGE_PIN R3   [get_ports {JX2_LVDS_14_P   }];  # "R3.JX2_LVDS_14_P"
#set_property PACKAGE_PIN M6   [get_ports {JX2_LVDS_15_N   }];  # "M6.JX2_LVDS_15_N"
#set_property PACKAGE_PIN L6   [get_ports {JX2_LVDS_15_P   }];  # "L6.JX2_LVDS_15_P"
#set_property PACKAGE_PIN K5   [get_ports {JX2_LVDS_16_N   }];  # "K5.JX2_LVDS_16_N"
#set_property PACKAGE_PIN J5   [get_ports {JX2_LVDS_16_P   }];  # "J5.JX2_LVDS_16_P"
#set_property PACKAGE_PIN R4   [get_ports {JX2_LVDS_17_N   }];  # "R4.JX2_LVDS_17_N"
#set_property PACKAGE_PIN R5   [get_ports {JX2_LVDS_17_P   }];  # "R5.JX2_LVDS_17_P"
#set_property PACKAGE_PIN J6   [get_ports {JX2_LVDS_18_N   }];  # "J6.JX2_LVDS_18_N"
#set_property PACKAGE_PIN J7   [get_ports {JX2_LVDS_18_P   }];  # "J7.JX2_LVDS_18_P"
#set_property PACKAGE_PIN P5   [get_ports {JX2_LVDS_19_N   }];  # "P5.JX2_LVDS_19_N"
#set_property PACKAGE_PIN P6   [get_ports {JX2_LVDS_19_P   }];  # "P6.JX2_LVDS_19_P"
#set_property PACKAGE_PIN L7   [get_ports {JX2_LVDS_2_N    }];  # "L7.JX2_LVDS_2_N"
#set_property PACKAGE_PIN K7   [get_ports {JX2_LVDS_2_P    }];  # "K7.JX2_LVDS_2_P"
#set_property PACKAGE_PIN K8   [get_ports {JX2_LVDS_20_N   }];  # "K8.JX2_LVDS_20_N"
#set_property PACKAGE_PIN J8   [get_ports {JX2_LVDS_20_P   }];  # "J8.JX2_LVDS_20_P"
#set_property PACKAGE_PIN N5   [get_ports {JX2_LVDS_21_N   }];  # "N5.JX2_LVDS_21_N"
#set_property PACKAGE_PIN N6   [get_ports {JX2_LVDS_21_P   }];  # "N6.JX2_LVDS_21_P"
#set_property PACKAGE_PIN M7   [get_ports {JX2_LVDS_22_N   }];  # "M7.JX2_LVDS_22_N"
#set_property PACKAGE_PIN M8   [get_ports {JX2_LVDS_22_P   }];  # "M8.JX2_LVDS_22_P"
#set_property PACKAGE_PIN P8   [get_ports {JX2_LVDS_23_N   }];  # "P8.JX2_LVDS_23_N"
#set_property PACKAGE_PIN N8   [get_ports {JX2_LVDS_23_P   }];  # "N8.JX2_LVDS_23_P"
#set_property PACKAGE_PIN K2   [get_ports {JX2_LVDS_3_N    }];  # "K2.JX2_LVDS_3_N"
#set_property PACKAGE_PIN J3   [get_ports {JX2_LVDS_3_P    }];  # "J3.JX2_LVDS_3_P"
#set_property PACKAGE_PIN R7   [get_ports {JX2_LVDS_4_N    }];  # "R7.JX2_LVDS_4_N"
#set_property PACKAGE_PIN P7   [get_ports {JX2_LVDS_4_P    }];  # "P7.JX2_LVDS_4_P"
#set_property PACKAGE_PIN L1   [get_ports {JX2_LVDS_5_N    }];  # "L1.JX2_LVDS_5_N"
#set_property PACKAGE_PIN L2   [get_ports {JX2_LVDS_5_P    }];  # "L2.JX2_LVDS_5_P"
#set_property PACKAGE_PIN N3   [get_ports {JX2_LVDS_6_N    }];  # "N3.JX2_LVDS_6_N"
#set_property PACKAGE_PIN N4   [get_ports {JX2_LVDS_6_P    }];  # "N4.JX2_LVDS_6_P"
#set_property PACKAGE_PIN P2   [get_ports {JX2_LVDS_7_N    }];  # "P2.JX2_LVDS_7_N"
#set_property PACKAGE_PIN P3   [get_ports {JX2_LVDS_7_P    }];  # "P3.JX2_LVDS_7_P"
#set_property PACKAGE_PIN M1   [get_ports {JX2_LVDS_8_N    }];  # "M1.JX2_LVDS_8_N"
#set_property PACKAGE_PIN M2   [get_ports {JX2_LVDS_8_P    }];  # "M2.JX2_LVDS_8_P"
#set_property PACKAGE_PIN P1   [get_ports {JX2_LVDS_9_N    }];  # "P1.JX2_LVDS_9_N"
#set_property PACKAGE_PIN N1   [get_ports {JX2_LVDS_9_P    }];  # "N1.JX2_LVDS_9_P"
#set_property PACKAGE_PIN H8   [get_ports {JX2_SE_0        }];  # "H8.JX2_SE_0"
#set_property PACKAGE_PIN R8   [get_ports {JX2_SE_1        }];  # "R8.JX2_SE_1"

# ----------------------------------------------------------------------------
# Expansion Connector JX3 - Bank 112
# ----------------------------------------------------------------------------

#set_property PACKAGE_PIN V9   [get_ports {MGTREFCLKC0_N   }];  # "V9.MGTREFCLKC0_N"
#set_property PACKAGE_PIN U9   [get_ports {MGTREFCLKC0_P   }];  # "U9.MGTREFCLKC0_P"
set_property PACKAGE_PIN V5 [get_ports MGTREFCLK1_N]
set_property PACKAGE_PIN U5 [get_ports MGTREFCLK1_P]
#set_property PACKAGE_PIN AB7  [get_ports {MGTRX0_N        }];  # "AB7.MGTRX0_N"
#set_property PACKAGE_PIN AA7  [get_ports {MGTRX0_P        }];  # "AA7.MGTRX0_P"
#set_property PACKAGE_PIN Y8   [get_ports {MGTRX1_N        }];  # "Y8.MGTRX1_N"
#set_property PACKAGE_PIN W8   [get_ports {MGTRX1_P        }];  # "W8.MGTRX1_P"
#set_property PACKAGE_PIN Y6   [get_ports {MGTRX3_N        }];  # "Y6.MGTRX3_N"
#set_property PACKAGE_PIN W6   [get_ports {MGTRX3_P        }];  # "W6.MGTRX3_P"
#set_property PACKAGE_PIN AB3  [get_ports {MGTTX0_N        }];  # "AB3.MGTTX0_N"
#set_property PACKAGE_PIN AA3  [get_ports {MGTTX0_P        }];  # "AA3.MGTTX0_P"
#set_property PACKAGE_PIN Y4   [get_ports {MGTTX1_N        }];  # "Y4.MGTTX1_N"
#set_property PACKAGE_PIN W4   [get_ports {MGTTX1_P        }];  # "W4.MGTTX1_P"
set_property PACKAGE_PIN AB9 [get_ports MGTRX2_N]
set_property PACKAGE_PIN AA9 [get_ports MGTRX2_P]
set_property PACKAGE_PIN AB5 [get_ports MGTTX2_N]
set_property PACKAGE_PIN AA5 [get_ports MGTTX2_P]
#set_property PACKAGE_PIN Y2   [get_ports {MGTTX3_N        }];  # "Y2.MGTTX3_N"
#set_property PACKAGE_PIN W2   [get_ports {MGTTX3_P        }];  # "W2.MGTTX3_P"


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are
# evaluated prior to other PACKAGE_PIN constraints being applied, then
# the IOSTANDARD specified will likely not be applied properly to those
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed
# within the XDC file in a location that is evaluated AFTER all
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
#
# Warning! Bank 34 and Bank 35 are a High Performance Banks on the 7030
# and will only accept 1.8V level signals

# ----------------------------------------------------------------------------

# Set the bank voltage for IO Bank 34 to 1.8V by default.
#set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]]

# Set the bank voltage for IO Bank 13 to 1.8V by default.
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 13]]
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 13]];
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];

create_clock -period 12.000 -waveform {0.000 6.000} [get_ports MGTREFCLK1_N]
















set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[11]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[15]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[7]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[14]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[8]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[6]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[5]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[2]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[12]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[4]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[3]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[10]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[1]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[13]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[9]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[0]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[7]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[6]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[5]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[3]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[2]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[1]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[0]}]
set_property MARK_DEBUG true [get_nets {zynq_top_i/event_rxd[4]}]
set_property MARK_DEBUG true [get_nets {fifo_din[0]}]
set_property MARK_DEBUG true [get_nets {fifo_din[5]}]
set_property MARK_DEBUG true [get_nets {fifo_din[6]}]
set_property MARK_DEBUG true [get_nets {fifo_din[7]}]
set_property MARK_DEBUG true [get_nets {fifo_din[4]}]
set_property MARK_DEBUG true [get_nets {fifo_din[1]}]
set_property MARK_DEBUG true [get_nets {fifo_din[2]}]
set_property MARK_DEBUG true [get_nets {fifo_din[3]}]






#create_generated_clock -name fifo_wr_clk -source [get_pins zynq_top_i/i_evr_dc/mmc_i/CLKOUT0] -divide_by 100 [get_pins fifo_wr_clk_reg/Q]






























create_clock -period 48.000 -name PL_CLK -waveform {0.000 24.000} [get_ports PL_CLK]
create_clock -period 12.000 -name zynq_top_i/i_evr_dc/i_upstream/RXOUTCLK_out -waveform {0.000 6.000} [get_pins zynq_top_i/i_evr_dc/i_upstream/gtxe2_X0Y0_i/RXOUTCLK]
create_clock -period 12.000 -name zynq_top_i/i_evr_dc/i_upstream/tx_outclk -waveform {0.000 6.000} [get_pins zynq_top_i/i_evr_dc/i_upstream/gtxe2_X0Y0_i/TXOUTCLK]
create_generated_clock -name {design_1_i/data_stream_manager_0/U0/data_stream_manager_v1_0_M00_AXIS_inst/state[0]} -source [get_pins {design_1_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]}] -divide_by 1 [get_pins {design_1_i/data_stream_manager_0/U0/data_stream_manager_v1_0_M00_AXIS_inst/FSM_sequential_state_reg[0]/Q}]
create_generated_clock -name {design_1_i/data_stream_manager_0/U0/data_stream_manager_v1_0_M00_AXIS_inst/state[1]} -source [get_pins {design_1_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]}] -divide_by 1 [get_pins {design_1_i/data_stream_manager_0/U0/data_stream_manager_v1_0_M00_AXIS_inst/FSM_sequential_state_reg[1]/Q}]
create_generated_clock -name {design_1_i/data_stream_manager_0/U0/data_stream_manager_v1_0_M00_AXIS_inst/state[2]} -source [get_pins {design_1_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]}] -divide_by 1 [get_pins {design_1_i/data_stream_manager_0/U0/data_stream_manager_v1_0_M00_AXIS_inst/FSM_sequential_state_reg[2]/Q}]







set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks mmcm_clk0] -group [get_clocks -include_generated_clocks clk_fpga_0]


set_false_path -from [get_clocks mmcm_clk0] -to [get_clocks zynq_top_i/i_evr_dc/i_upstream/tx_outclk]













set_false_path -from [get_clocks PL_CLK] -to [get_clocks mmcm_clk0]
set_false_path -from [get_clocks PL_CLK] -to [get_clocks zynq_top_i/i_evr_dc/i_upstream/RXOUTCLK_out]


set_false_path -from [get_clocks -of_objects [get_pins zynq_top_i/i_evr_dc/mmc_i/CLKOUT0]] -to [get_clocks PL_CLK]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[0]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[1]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[2]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[3]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[4]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[5]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[6]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[7]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[8]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[9]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[10]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[11]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[12]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[13]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[14]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[15]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[16]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[17]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[18]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[19]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[20]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[21]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[22]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[23]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[24]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[25]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[26]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[27]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[28]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[29]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[30]} {design_1_i/data_stream_manager_0_M00_AXIS_TDATA[31]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list zynq_top_i/i_evr_dc/event_clk_out]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 8 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {zynq_top_i/databuf_rxd[0]} {zynq_top_i/databuf_rxd[1]} {zynq_top_i/databuf_rxd[2]} {zynq_top_i/databuf_rxd[3]} {zynq_top_i/databuf_rxd[4]} {zynq_top_i/databuf_rxd[5]} {zynq_top_i/databuf_rxd[6]} {zynq_top_i/databuf_rxd[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/data_generator_test_0_data_out[0]} {design_1_i/data_generator_test_0_data_out[1]} {design_1_i/data_generator_test_0_data_out[2]} {design_1_i/data_generator_test_0_data_out[3]} {design_1_i/data_generator_test_0_data_out[4]} {design_1_i/data_generator_test_0_data_out[5]} {design_1_i/data_generator_test_0_data_out[6]} {design_1_i/data_generator_test_0_data_out[7]} {design_1_i/data_generator_test_0_data_out[8]} {design_1_i/data_generator_test_0_data_out[9]} {design_1_i/data_generator_test_0_data_out[10]} {design_1_i/data_generator_test_0_data_out[11]} {design_1_i/data_generator_test_0_data_out[12]} {design_1_i/data_generator_test_0_data_out[13]} {design_1_i/data_generator_test_0_data_out[14]} {design_1_i/data_generator_test_0_data_out[15]} {design_1_i/data_generator_test_0_data_out[16]} {design_1_i/data_generator_test_0_data_out[17]} {design_1_i/data_generator_test_0_data_out[18]} {design_1_i/data_generator_test_0_data_out[19]} {design_1_i/data_generator_test_0_data_out[20]} {design_1_i/data_generator_test_0_data_out[21]} {design_1_i/data_generator_test_0_data_out[22]} {design_1_i/data_generator_test_0_data_out[23]} {design_1_i/data_generator_test_0_data_out[24]} {design_1_i/data_generator_test_0_data_out[25]} {design_1_i/data_generator_test_0_data_out[26]} {design_1_i/data_generator_test_0_data_out[27]} {design_1_i/data_generator_test_0_data_out[28]} {design_1_i/data_generator_test_0_data_out[29]} {design_1_i/data_generator_test_0_data_out[30]} {design_1_i/data_generator_test_0_data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/fifo_generator_0_dout[0]} {design_1_i/fifo_generator_0_dout[1]} {design_1_i/fifo_generator_0_dout[2]} {design_1_i/fifo_generator_0_dout[3]} {design_1_i/fifo_generator_0_dout[4]} {design_1_i/fifo_generator_0_dout[5]} {design_1_i/fifo_generator_0_dout[6]} {design_1_i/fifo_generator_0_dout[7]} {design_1_i/fifo_generator_0_dout[8]} {design_1_i/fifo_generator_0_dout[9]} {design_1_i/fifo_generator_0_dout[10]} {design_1_i/fifo_generator_0_dout[11]} {design_1_i/fifo_generator_0_dout[12]} {design_1_i/fifo_generator_0_dout[13]} {design_1_i/fifo_generator_0_dout[14]} {design_1_i/fifo_generator_0_dout[15]} {design_1_i/fifo_generator_0_dout[16]} {design_1_i/fifo_generator_0_dout[17]} {design_1_i/fifo_generator_0_dout[18]} {design_1_i/fifo_generator_0_dout[19]} {design_1_i/fifo_generator_0_dout[20]} {design_1_i/fifo_generator_0_dout[21]} {design_1_i/fifo_generator_0_dout[22]} {design_1_i/fifo_generator_0_dout[23]} {design_1_i/fifo_generator_0_dout[24]} {design_1_i/fifo_generator_0_dout[25]} {design_1_i/fifo_generator_0_dout[26]} {design_1_i/fifo_generator_0_dout[27]} {design_1_i/fifo_generator_0_dout[28]} {design_1_i/fifo_generator_0_dout[29]} {design_1_i/fifo_generator_0_dout[30]} {design_1_i/fifo_generator_0_dout[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list design_1_i/data_generator_test_0_data_we]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list design_1_i/data_stream_manager_0_fifo_rd_enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list design_1_i/data_stream_manager_0_M00_AXIS_TLAST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/data_stream_manager_0_M00_AXIS_TREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/data_stream_manager_0_M00_AXIS_TVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/xlslice_1_Dout]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 8 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {zynq_top_i/event_rxd[0]} {zynq_top_i/event_rxd[1]} {zynq_top_i/event_rxd[2]} {zynq_top_i/event_rxd[3]} {zynq_top_i/event_rxd[4]} {zynq_top_i/event_rxd[5]} {zynq_top_i/event_rxd[6]} {zynq_top_i/event_rxd[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 8 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {event_rxd[0]} {event_rxd[1]} {event_rxd[2]} {event_rxd[3]} {event_rxd[4]} {event_rxd[5]} {event_rxd[6]} {event_rxd[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 32 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {fifo_din[0]} {fifo_din[1]} {fifo_din[2]} {fifo_din[3]} {fifo_din[4]} {fifo_din[5]} {fifo_din[6]} {fifo_din[7]} {fifo_din[8]} {fifo_din[9]} {fifo_din[10]} {fifo_din[11]} {fifo_din[12]} {fifo_din[13]} {fifo_din[14]} {fifo_din[15]} {fifo_din[16]} {fifo_din[17]} {fifo_din[18]} {fifo_din[19]} {fifo_din[20]} {fifo_din[21]} {fifo_din[22]} {fifo_din[23]} {fifo_din[24]} {fifo_din[25]} {fifo_din[26]} {fifo_din[27]} {fifo_din[28]} {fifo_din[29]} {fifo_din[30]} {fifo_din[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 64 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[0]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[1]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[2]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[3]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[4]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[5]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[6]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[7]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[8]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[9]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[10]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[11]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[12]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[13]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[14]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[15]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[16]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[17]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[18]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[19]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[20]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[21]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[22]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[23]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[24]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[25]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[26]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[27]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[28]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[29]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[30]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[31]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[32]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[33]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[34]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[35]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[36]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[37]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[38]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[39]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[40]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[41]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[42]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[43]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[44]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[45]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[46]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[47]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[48]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[49]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[50]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[51]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[52]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[53]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[54]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[55]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[56]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[57]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[58]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[59]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[60]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[61]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[62]} {zynq_top_i/i_evr_dc/i_upstream/rxdata_i[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 8 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {zynq_top_i/i_evr_dc/dbus_rxd[0]} {zynq_top_i/i_evr_dc/dbus_rxd[1]} {zynq_top_i/i_evr_dc/dbus_rxd[2]} {zynq_top_i/i_evr_dc/dbus_rxd[3]} {zynq_top_i/i_evr_dc/dbus_rxd[4]} {zynq_top_i/i_evr_dc/dbus_rxd[5]} {zynq_top_i/i_evr_dc/dbus_rxd[6]} {zynq_top_i/i_evr_dc/dbus_rxd[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 8 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {event_timestamp_i/fifo_buffer[event][0]} {event_timestamp_i/fifo_buffer[event][1]} {event_timestamp_i/fifo_buffer[event][2]} {event_timestamp_i/fifo_buffer[event][3]} {event_timestamp_i/fifo_buffer[event][4]} {event_timestamp_i/fifo_buffer[event][5]} {event_timestamp_i/fifo_buffer[event][6]} {event_timestamp_i/fifo_buffer[event][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 32 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {event_timestamp_i/fifo_buffer[seconds][0]} {event_timestamp_i/fifo_buffer[seconds][1]} {event_timestamp_i/fifo_buffer[seconds][2]} {event_timestamp_i/fifo_buffer[seconds][3]} {event_timestamp_i/fifo_buffer[seconds][4]} {event_timestamp_i/fifo_buffer[seconds][5]} {event_timestamp_i/fifo_buffer[seconds][6]} {event_timestamp_i/fifo_buffer[seconds][7]} {event_timestamp_i/fifo_buffer[seconds][8]} {event_timestamp_i/fifo_buffer[seconds][9]} {event_timestamp_i/fifo_buffer[seconds][10]} {event_timestamp_i/fifo_buffer[seconds][11]} {event_timestamp_i/fifo_buffer[seconds][12]} {event_timestamp_i/fifo_buffer[seconds][13]} {event_timestamp_i/fifo_buffer[seconds][14]} {event_timestamp_i/fifo_buffer[seconds][15]} {event_timestamp_i/fifo_buffer[seconds][16]} {event_timestamp_i/fifo_buffer[seconds][17]} {event_timestamp_i/fifo_buffer[seconds][18]} {event_timestamp_i/fifo_buffer[seconds][19]} {event_timestamp_i/fifo_buffer[seconds][20]} {event_timestamp_i/fifo_buffer[seconds][21]} {event_timestamp_i/fifo_buffer[seconds][22]} {event_timestamp_i/fifo_buffer[seconds][23]} {event_timestamp_i/fifo_buffer[seconds][24]} {event_timestamp_i/fifo_buffer[seconds][25]} {event_timestamp_i/fifo_buffer[seconds][26]} {event_timestamp_i/fifo_buffer[seconds][27]} {event_timestamp_i/fifo_buffer[seconds][28]} {event_timestamp_i/fifo_buffer[seconds][29]} {event_timestamp_i/fifo_buffer[seconds][30]} {event_timestamp_i/fifo_buffer[seconds][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 32 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {event_timestamp_i/fifo_buffer[timestamp][0]} {event_timestamp_i/fifo_buffer[timestamp][1]} {event_timestamp_i/fifo_buffer[timestamp][2]} {event_timestamp_i/fifo_buffer[timestamp][3]} {event_timestamp_i/fifo_buffer[timestamp][4]} {event_timestamp_i/fifo_buffer[timestamp][5]} {event_timestamp_i/fifo_buffer[timestamp][6]} {event_timestamp_i/fifo_buffer[timestamp][7]} {event_timestamp_i/fifo_buffer[timestamp][8]} {event_timestamp_i/fifo_buffer[timestamp][9]} {event_timestamp_i/fifo_buffer[timestamp][10]} {event_timestamp_i/fifo_buffer[timestamp][11]} {event_timestamp_i/fifo_buffer[timestamp][12]} {event_timestamp_i/fifo_buffer[timestamp][13]} {event_timestamp_i/fifo_buffer[timestamp][14]} {event_timestamp_i/fifo_buffer[timestamp][15]} {event_timestamp_i/fifo_buffer[timestamp][16]} {event_timestamp_i/fifo_buffer[timestamp][17]} {event_timestamp_i/fifo_buffer[timestamp][18]} {event_timestamp_i/fifo_buffer[timestamp][19]} {event_timestamp_i/fifo_buffer[timestamp][20]} {event_timestamp_i/fifo_buffer[timestamp][21]} {event_timestamp_i/fifo_buffer[timestamp][22]} {event_timestamp_i/fifo_buffer[timestamp][23]} {event_timestamp_i/fifo_buffer[timestamp][24]} {event_timestamp_i/fifo_buffer[timestamp][25]} {event_timestamp_i/fifo_buffer[timestamp][26]} {event_timestamp_i/fifo_buffer[timestamp][27]} {event_timestamp_i/fifo_buffer[timestamp][28]} {event_timestamp_i/fifo_buffer[timestamp][29]} {event_timestamp_i/fifo_buffer[timestamp][30]} {event_timestamp_i/fifo_buffer[timestamp][31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 32 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {event_timestamp_i/seconds_reg[0]} {event_timestamp_i/seconds_reg[1]} {event_timestamp_i/seconds_reg[2]} {event_timestamp_i/seconds_reg[3]} {event_timestamp_i/seconds_reg[4]} {event_timestamp_i/seconds_reg[5]} {event_timestamp_i/seconds_reg[6]} {event_timestamp_i/seconds_reg[7]} {event_timestamp_i/seconds_reg[8]} {event_timestamp_i/seconds_reg[9]} {event_timestamp_i/seconds_reg[10]} {event_timestamp_i/seconds_reg[11]} {event_timestamp_i/seconds_reg[12]} {event_timestamp_i/seconds_reg[13]} {event_timestamp_i/seconds_reg[14]} {event_timestamp_i/seconds_reg[15]} {event_timestamp_i/seconds_reg[16]} {event_timestamp_i/seconds_reg[17]} {event_timestamp_i/seconds_reg[18]} {event_timestamp_i/seconds_reg[19]} {event_timestamp_i/seconds_reg[20]} {event_timestamp_i/seconds_reg[21]} {event_timestamp_i/seconds_reg[22]} {event_timestamp_i/seconds_reg[23]} {event_timestamp_i/seconds_reg[24]} {event_timestamp_i/seconds_reg[25]} {event_timestamp_i/seconds_reg[26]} {event_timestamp_i/seconds_reg[27]} {event_timestamp_i/seconds_reg[28]} {event_timestamp_i/seconds_reg[29]} {event_timestamp_i/seconds_reg[30]} {event_timestamp_i/seconds_reg[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 32 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {event_timestamp_i/timestamp_event_counter[0]} {event_timestamp_i/timestamp_event_counter[1]} {event_timestamp_i/timestamp_event_counter[2]} {event_timestamp_i/timestamp_event_counter[3]} {event_timestamp_i/timestamp_event_counter[4]} {event_timestamp_i/timestamp_event_counter[5]} {event_timestamp_i/timestamp_event_counter[6]} {event_timestamp_i/timestamp_event_counter[7]} {event_timestamp_i/timestamp_event_counter[8]} {event_timestamp_i/timestamp_event_counter[9]} {event_timestamp_i/timestamp_event_counter[10]} {event_timestamp_i/timestamp_event_counter[11]} {event_timestamp_i/timestamp_event_counter[12]} {event_timestamp_i/timestamp_event_counter[13]} {event_timestamp_i/timestamp_event_counter[14]} {event_timestamp_i/timestamp_event_counter[15]} {event_timestamp_i/timestamp_event_counter[16]} {event_timestamp_i/timestamp_event_counter[17]} {event_timestamp_i/timestamp_event_counter[18]} {event_timestamp_i/timestamp_event_counter[19]} {event_timestamp_i/timestamp_event_counter[20]} {event_timestamp_i/timestamp_event_counter[21]} {event_timestamp_i/timestamp_event_counter[22]} {event_timestamp_i/timestamp_event_counter[23]} {event_timestamp_i/timestamp_event_counter[24]} {event_timestamp_i/timestamp_event_counter[25]} {event_timestamp_i/timestamp_event_counter[26]} {event_timestamp_i/timestamp_event_counter[27]} {event_timestamp_i/timestamp_event_counter[28]} {event_timestamp_i/timestamp_event_counter[29]} {event_timestamp_i/timestamp_event_counter[30]} {event_timestamp_i/timestamp_event_counter[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 32 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {event_timestamp_i/seconds_shift_reg[0]} {event_timestamp_i/seconds_shift_reg[1]} {event_timestamp_i/seconds_shift_reg[2]} {event_timestamp_i/seconds_shift_reg[3]} {event_timestamp_i/seconds_shift_reg[4]} {event_timestamp_i/seconds_shift_reg[5]} {event_timestamp_i/seconds_shift_reg[6]} {event_timestamp_i/seconds_shift_reg[7]} {event_timestamp_i/seconds_shift_reg[8]} {event_timestamp_i/seconds_shift_reg[9]} {event_timestamp_i/seconds_shift_reg[10]} {event_timestamp_i/seconds_shift_reg[11]} {event_timestamp_i/seconds_shift_reg[12]} {event_timestamp_i/seconds_shift_reg[13]} {event_timestamp_i/seconds_shift_reg[14]} {event_timestamp_i/seconds_shift_reg[15]} {event_timestamp_i/seconds_shift_reg[16]} {event_timestamp_i/seconds_shift_reg[17]} {event_timestamp_i/seconds_shift_reg[18]} {event_timestamp_i/seconds_shift_reg[19]} {event_timestamp_i/seconds_shift_reg[20]} {event_timestamp_i/seconds_shift_reg[21]} {event_timestamp_i/seconds_shift_reg[22]} {event_timestamp_i/seconds_shift_reg[23]} {event_timestamp_i/seconds_shift_reg[24]} {event_timestamp_i/seconds_shift_reg[25]} {event_timestamp_i/seconds_shift_reg[26]} {event_timestamp_i/seconds_shift_reg[27]} {event_timestamp_i/seconds_shift_reg[28]} {event_timestamp_i/seconds_shift_reg[29]} {event_timestamp_i/seconds_shift_reg[30]} {event_timestamp_i/seconds_shift_reg[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 32 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {design_1_i/fifo_din_1[0]} {design_1_i/fifo_din_1[1]} {design_1_i/fifo_din_1[2]} {design_1_i/fifo_din_1[3]} {design_1_i/fifo_din_1[4]} {design_1_i/fifo_din_1[5]} {design_1_i/fifo_din_1[6]} {design_1_i/fifo_din_1[7]} {design_1_i/fifo_din_1[8]} {design_1_i/fifo_din_1[9]} {design_1_i/fifo_din_1[10]} {design_1_i/fifo_din_1[11]} {design_1_i/fifo_din_1[12]} {design_1_i/fifo_din_1[13]} {design_1_i/fifo_din_1[14]} {design_1_i/fifo_din_1[15]} {design_1_i/fifo_din_1[16]} {design_1_i/fifo_din_1[17]} {design_1_i/fifo_din_1[18]} {design_1_i/fifo_din_1[19]} {design_1_i/fifo_din_1[20]} {design_1_i/fifo_din_1[21]} {design_1_i/fifo_din_1[22]} {design_1_i/fifo_din_1[23]} {design_1_i/fifo_din_1[24]} {design_1_i/fifo_din_1[25]} {design_1_i/fifo_din_1[26]} {design_1_i/fifo_din_1[27]} {design_1_i/fifo_din_1[28]} {design_1_i/fifo_din_1[29]} {design_1_i/fifo_din_1[30]} {design_1_i/fifo_din_1[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 1 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list zynq_top_i/databuf_rx_k]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list design_1_i/fifo_wr_clk_1]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 1 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list fifo_wr_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 1 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list design_1_i/fifo_wr_en_1]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list event_timestamp_i/prescaler_out]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets event_clk_out]
