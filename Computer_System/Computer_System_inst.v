	Computer_System u0 (
		.audio_ADCDAT               (<connected-to-audio_ADCDAT>),               //                audio.ADCDAT
		.audio_ADCLRCK              (<connected-to-audio_ADCLRCK>),              //                     .ADCLRCK
		.audio_BCLK                 (<connected-to-audio_BCLK>),                 //                     .BCLK
		.audio_DACDAT               (<connected-to-audio_DACDAT>),               //                     .DACDAT
		.audio_DACLRCK              (<connected-to-audio_DACLRCK>),              //                     .DACLRCK
		.audio_pll_clk_clk          (<connected-to-audio_pll_clk_clk>),          //        audio_pll_clk.clk
		.audio_pll_ref_clk_clk      (<connected-to-audio_pll_ref_clk_clk>),      //    audio_pll_ref_clk.clk
		.audio_pll_ref_reset_reset  (<connected-to-audio_pll_ref_reset_reset>),  //  audio_pll_ref_reset.reset
		.av_config_SDAT             (<connected-to-av_config_SDAT>),             //            av_config.SDAT
		.av_config_SCLK             (<connected-to-av_config_SCLK>),             //                     .SCLK
		.char_lcd_DATA              (<connected-to-char_lcd_DATA>),              //             char_lcd.DATA
		.char_lcd_ON                (<connected-to-char_lcd_ON>),                //                     .ON
		.char_lcd_BLON              (<connected-to-char_lcd_BLON>),              //                     .BLON
		.char_lcd_EN                (<connected-to-char_lcd_EN>),                //                     .EN
		.char_lcd_RS                (<connected-to-char_lcd_RS>),                //                     .RS
		.char_lcd_RW                (<connected-to-char_lcd_RW>),                //                     .RW
		.expansion_jp5_export       (<connected-to-expansion_jp5_export>),       //        expansion_jp5.export
		.flash_ADDR                 (<connected-to-flash_ADDR>),                 //                flash.ADDR
		.flash_CE_N                 (<connected-to-flash_CE_N>),                 //                     .CE_N
		.flash_OE_N                 (<connected-to-flash_OE_N>),                 //                     .OE_N
		.flash_WE_N                 (<connected-to-flash_WE_N>),                 //                     .WE_N
		.flash_RST_N                (<connected-to-flash_RST_N>),                //                     .RST_N
		.flash_DQ                   (<connected-to-flash_DQ>),                   //                     .DQ
		.green_leds_export          (<connected-to-green_leds_export>),          //           green_leds.export
		.hex3_hex0_export           (<connected-to-hex3_hex0_export>),           //            hex3_hex0.export
		.hex7_hex4_export           (<connected-to-hex7_hex4_export>),           //            hex7_hex4.export
		.irda_TXD                   (<connected-to-irda_TXD>),                   //                 irda.TXD
		.irda_RXD                   (<connected-to-irda_RXD>),                   //                     .RXD
		.ps2_port_CLK               (<connected-to-ps2_port_CLK>),               //             ps2_port.CLK
		.ps2_port_DAT               (<connected-to-ps2_port_DAT>),               //                     .DAT
		.ps2_port_dual_CLK          (<connected-to-ps2_port_dual_CLK>),          //        ps2_port_dual.CLK
		.ps2_port_dual_DAT          (<connected-to-ps2_port_dual_DAT>),          //                     .DAT
		.pushbuttons_export         (<connected-to-pushbuttons_export>),         //          pushbuttons.export
		.red_leds_export            (<connected-to-red_leds_export>),            //             red_leds.export
		.sd_card_b_SD_cmd           (<connected-to-sd_card_b_SD_cmd>),           //              sd_card.b_SD_cmd
		.sd_card_b_SD_dat           (<connected-to-sd_card_b_SD_dat>),           //                     .b_SD_dat
		.sd_card_b_SD_dat3          (<connected-to-sd_card_b_SD_dat3>),          //                     .b_SD_dat3
		.sd_card_o_SD_clock         (<connected-to-sd_card_o_SD_clock>),         //                     .o_SD_clock
		.sdram_addr                 (<connected-to-sdram_addr>),                 //                sdram.addr
		.sdram_ba                   (<connected-to-sdram_ba>),                   //                     .ba
		.sdram_cas_n                (<connected-to-sdram_cas_n>),                //                     .cas_n
		.sdram_cke                  (<connected-to-sdram_cke>),                  //                     .cke
		.sdram_cs_n                 (<connected-to-sdram_cs_n>),                 //                     .cs_n
		.sdram_dq                   (<connected-to-sdram_dq>),                   //                     .dq
		.sdram_dqm                  (<connected-to-sdram_dqm>),                  //                     .dqm
		.sdram_ras_n                (<connected-to-sdram_ras_n>),                //                     .ras_n
		.sdram_we_n                 (<connected-to-sdram_we_n>),                 //                     .we_n
		.sdram_clk_clk              (<connected-to-sdram_clk_clk>),              //            sdram_clk.clk
		.serial_port_RXD            (<connected-to-serial_port_RXD>),            //          serial_port.RXD
		.serial_port_TXD            (<connected-to-serial_port_TXD>),            //                     .TXD
		.slider_switches_export     (<connected-to-slider_switches_export>),     //      slider_switches.export
		.sram_DQ                    (<connected-to-sram_DQ>),                    //                 sram.DQ
		.sram_ADDR                  (<connected-to-sram_ADDR>),                  //                     .ADDR
		.sram_LB_N                  (<connected-to-sram_LB_N>),                  //                     .LB_N
		.sram_UB_N                  (<connected-to-sram_UB_N>),                  //                     .UB_N
		.sram_CE_N                  (<connected-to-sram_CE_N>),                  //                     .CE_N
		.sram_OE_N                  (<connected-to-sram_OE_N>),                  //                     .OE_N
		.sram_WE_N                  (<connected-to-sram_WE_N>),                  //                     .WE_N
		.system_pll_ref_clk_clk     (<connected-to-system_pll_ref_clk_clk>),     //   system_pll_ref_clk.clk
		.system_pll_ref_reset_reset (<connected-to-system_pll_ref_reset_reset>), // system_pll_ref_reset.reset
		.usb_INT1                   (<connected-to-usb_INT1>),                   //                  usb.INT1
		.usb_DATA                   (<connected-to-usb_DATA>),                   //                     .DATA
		.usb_RST_N                  (<connected-to-usb_RST_N>),                  //                     .RST_N
		.usb_ADDR                   (<connected-to-usb_ADDR>),                   //                     .ADDR
		.usb_CS_N                   (<connected-to-usb_CS_N>),                   //                     .CS_N
		.usb_RD_N                   (<connected-to-usb_RD_N>),                   //                     .RD_N
		.usb_WR_N                   (<connected-to-usb_WR_N>),                   //                     .WR_N
		.usb_INT0                   (<connected-to-usb_INT0>),                   //                     .INT0
		.vga_CLK                    (<connected-to-vga_CLK>),                    //                  vga.CLK
		.vga_HS                     (<connected-to-vga_HS>),                     //                     .HS
		.vga_VS                     (<connected-to-vga_VS>),                     //                     .VS
		.vga_BLANK                  (<connected-to-vga_BLANK>),                  //                     .BLANK
		.vga_SYNC                   (<connected-to-vga_SYNC>),                   //                     .SYNC
		.vga_R                      (<connected-to-vga_R>),                      //                     .R
		.vga_G                      (<connected-to-vga_G>),                      //                     .G
		.vga_B                      (<connected-to-vga_B>),                      //                     .B
		.video_in_TD_CLK27          (<connected-to-video_in_TD_CLK27>),          //             video_in.TD_CLK27
		.video_in_TD_DATA           (<connected-to-video_in_TD_DATA>),           //                     .TD_DATA
		.video_in_TD_HS             (<connected-to-video_in_TD_HS>),             //                     .TD_HS
		.video_in_TD_VS             (<connected-to-video_in_TD_VS>),             //                     .TD_VS
		.video_in_clk27_reset       (<connected-to-video_in_clk27_reset>),       //                     .clk27_reset
		.video_in_TD_RESET          (<connected-to-video_in_TD_RESET>),          //                     .TD_RESET
		.video_in_overflow_flag     (<connected-to-video_in_overflow_flag>),     //                     .overflow_flag
		.video_pll_ref_clk_clk      (<connected-to-video_pll_ref_clk_clk>),      //    video_pll_ref_clk.clk
		.video_pll_ref_reset_reset  (<connected-to-video_pll_ref_reset_reset>)   //  video_pll_ref_reset.reset
	);

