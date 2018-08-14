*SPICE netlist created from BLIF module timer by blif2BSpice
.include /usr/local/share/qflow/tech/osu035/osu035_stdcells.sp
.subckt timer vdd gnd S_ADR_I<0> S_ADR_I<1> S_ADR_I<2> S_ADR_I<3> S_ADR_I<4> S_ADR_I<5> S_ADR_I<6> S_ADR_I<7> S_ADR_I<8> S_ADR_I<9> S_ADR_I<10> S_ADR_I<11> S_ADR_I<12> S_ADR_I<13> S_ADR_I<14> S_ADR_I<15> S_ADR_I<16> S_ADR_I<17> S_ADR_I<18> S_ADR_I<19> S_ADR_I<20> S_ADR_I<21> S_ADR_I<22> S_ADR_I<23> S_ADR_I<24> S_ADR_I<25> S_ADR_I<26> S_ADR_I<27> S_ADR_I<28> S_ADR_I<29> S_ADR_I<30> S_ADR_I<31> S_DAT_I<0> S_DAT_I<1> S_DAT_I<2> S_DAT_I<3> S_DAT_I<4> S_DAT_I<5> S_DAT_I<6> S_DAT_I<7> S_DAT_I<8> S_DAT_I<9> S_DAT_I<10> S_DAT_I<11> S_DAT_I<12> S_DAT_I<13> S_DAT_I<14> S_DAT_I<15> S_DAT_I<16> S_DAT_I<17> S_DAT_I<18> S_DAT_I<19> S_DAT_I<20> S_DAT_I<21> S_DAT_I<22> S_DAT_I<23> S_DAT_I<24> S_DAT_I<25> S_DAT_I<26> S_DAT_I<27> S_DAT_I<28> S_DAT_I<29> S_DAT_I<30> S_DAT_I<31> S_WE_I S_STB_I S_CYC_I S_CTI_I<0> S_CTI_I<1> S_CTI_I<2> S_BTE_I<0> S_BTE_I<1> S_LOCK_I S_SEL_I<0> S_SEL_I<1> S_SEL_I<2> S_SEL_I<3> CLK_I RST_I S_DAT_O<0> S_DAT_O<1> S_DAT_O<2> S_DAT_O<3> S_DAT_O<4> S_DAT_O<5> S_DAT_O<6> S_DAT_O<7> S_DAT_O<8> S_DAT_O<9> S_DAT_O<10> S_DAT_O<11> S_DAT_O<12> S_DAT_O<13> S_DAT_O<14> S_DAT_O<15> S_DAT_O<16> S_DAT_O<17> S_DAT_O<18> S_DAT_O<19> S_DAT_O<20> S_DAT_O<21> S_DAT_O<22> S_DAT_O<23> S_DAT_O<24> S_DAT_O<25> S_DAT_O<26> S_DAT_O<27> S_DAT_O<28> S_DAT_O<29> S_DAT_O<30> S_DAT_O<31> S_ACK_O S_RTY_O S_ERR_O S_INT_O RSTREQ_O TOPULSE_O 
XBUFX4_1 vdd gnd _19_ _19__bF$buf4 BUFX4
XBUFX4_2 vdd gnd _19_ _19__bF$buf3 BUFX4
XBUFX4_3 vdd gnd _19_ _19__bF$buf2 BUFX4
XBUFX4_4 vdd gnd _19_ _19__bF$buf1 BUFX4
XBUFX2_1 vdd gnd _19_ _19__bF$buf0 BUFX2
XBUFX4_5 vdd gnd _86_ _86__bF$buf3 BUFX4
XBUFX4_6 vdd gnd _86_ _86__bF$buf2 BUFX4
XBUFX2_2 vdd gnd _86_ _86__bF$buf1 BUFX2
XBUFX4_7 vdd gnd _86_ _86__bF$buf0 BUFX4
XBUFX4_8 vdd gnd RST_I RST_I_bF$buf7 BUFX4
XBUFX4_9 vdd gnd RST_I RST_I_bF$buf6 BUFX4
XBUFX4_10 vdd gnd RST_I RST_I_bF$buf5 BUFX4
XBUFX4_11 vdd gnd RST_I RST_I_bF$buf4 BUFX4
XBUFX4_12 vdd gnd RST_I RST_I_bF$buf3 BUFX4
XBUFX4_13 vdd gnd RST_I RST_I_bF$buf2 BUFX4
XBUFX4_14 vdd gnd RST_I RST_I_bF$buf1 BUFX4
XBUFX4_15 vdd gnd RST_I RST_I_bF$buf0 BUFX4
XBUFX4_16 vdd gnd CLK_I CLK_I_bF$buf7 BUFX4
XBUFX4_17 vdd gnd CLK_I CLK_I_bF$buf6 BUFX4
XBUFX4_18 vdd gnd CLK_I CLK_I_bF$buf5 BUFX4
XBUFX4_19 vdd gnd CLK_I CLK_I_bF$buf4 BUFX4
XBUFX4_20 vdd gnd CLK_I CLK_I_bF$buf3 BUFX4
XBUFX4_21 vdd gnd CLK_I CLK_I_bF$buf2 BUFX4
XBUFX4_22 vdd gnd CLK_I CLK_I_bF$buf1 BUFX4
XBUFX4_23 vdd gnd CLK_I CLK_I_bF$buf0 BUFX4
XBUFX4_24 vdd gnd _58_ _58__bF$buf5 BUFX4
XBUFX4_25 vdd gnd _58_ _58__bF$buf4 BUFX4
XBUFX4_26 vdd gnd _58_ _58__bF$buf3 BUFX4
XBUFX4_27 vdd gnd _58_ _58__bF$buf2 BUFX4
XBUFX4_28 vdd gnd _58_ _58__bF$buf1 BUFX4
XBUFX4_29 vdd gnd _58_ _58__bF$buf0 BUFX4
XBUFX4_30 vdd gnd status<0> status_0_bF$buf3 BUFX4
XBUFX2_3 vdd gnd status<0> status_0_bF$buf2 BUFX2
XBUFX2_4 vdd gnd status<0> status_0_bF$buf1 BUFX2
XBUFX2_5 vdd gnd status<0> status_0_bF$buf0 BUFX2
XBUFX4_31 vdd gnd _462_ _462__bF$buf4 BUFX4
XBUFX4_32 vdd gnd _462_ _462__bF$buf3 BUFX4
XBUFX4_33 vdd gnd _462_ _462__bF$buf2 BUFX4
XBUFX4_34 vdd gnd _462_ _462__bF$buf1 BUFX4
XBUFX4_35 vdd gnd _462_ _462__bF$buf0 BUFX4
XAND2X2_1 vdd gnd _509_ _469_ _510_ AND2X2
XOAI21X1_1 gnd vdd read_08_data<15> _462__bF$buf1 _511_ _510_ OAI21X1
XINVX1_1 _511_ _528_<15> vdd gnd INVX1
XOAI21X1_2 gnd vdd _85_ _58__bF$buf4 _7_<0> _67_ OAI21X1
XOAI21X1_3 gnd vdd _102_ _58__bF$buf4 _7_<1> _99_ OAI21X1
XOAI21X1_4 gnd vdd _143_ _58__bF$buf3 _7_<2> _119_ OAI21X1
XOAI21X1_5 gnd vdd _144_ _58__bF$buf0 _7_<3> _140_ OAI21X1
XOAI21X1_6 gnd vdd _163_ _58__bF$buf0 _7_<4> _160_ OAI21X1
XINVX1_2 read_08_data<5> _512_ vdd gnd INVX1
XOAI21X1_7 gnd vdd _512_ _58__bF$buf5 _7_<5> _178_ OAI21X1
XINVX1_3 read_08_data<6> _513_ vdd gnd INVX1
XOAI21X1_8 gnd vdd _513_ _58__bF$buf0 _7_<6> _194_ OAI21X1
XINVX1_4 read_08_data<7> _514_ vdd gnd INVX1
XOAI21X1_9 gnd vdd _514_ _58__bF$buf3 _7_<7> _214_ OAI21X1
XOAI21X1_10 gnd vdd _240_ _58__bF$buf5 _7_<8> _238_ OAI21X1
XOAI21X1_11 gnd vdd _259_ _58__bF$buf5 _7_<9> _276_ OAI21X1
XOAI21X1_12 gnd vdd _289_ _58__bF$buf0 _7_<10> _279_ OAI21X1
XINVX1_5 read_08_data<11> _515_ vdd gnd INVX1
XOAI21X1_13 gnd vdd _515_ _58__bF$buf0 _7_<11> _304_ OAI21X1
XOAI21X1_14 gnd vdd _317_ _58__bF$buf1 _7_<12> _329_ OAI21X1
XNAND2X1_1 vdd _7_<13> gnd _337_ _339_ NAND2X1
XOAI21X1_15 gnd vdd _80_ _58__bF$buf2 _7_<14> _373_ OAI21X1
XOAI21X1_16 gnd vdd _81_ _58__bF$buf2 _7_<15> _406_ OAI21X1
XAND2X2_2 vdd gnd reg_wr dw04_cs _516_ AND2X2
XNAND2X1_2 vdd _517_ gnd latch_s_data<2> _516_ NAND2X1
XAOI21X1_1 gnd vdd _517_ reg_stop _518_ latch_s_data<3> AOI21X1
XNAND2X1_3 vdd _519_ gnd _136_ _516_ NAND2X1
XAOI21X1_2 gnd vdd _25_ _519_ _10_ _518_ AOI21X1
XNOR2X1_1 vdd status<2> gnd _520_ status<1> NOR2X1
XAOI21X1_3 gnd vdd _520_ _18_ _8_ reg_stop AOI21X1
XINVX1_6 reg_ito _521_ vdd gnd INVX1
XNAND2X1_4 vdd _522_ gnd latch_s_data<0> _516_ NAND2X1
XOAI21X1_17 gnd vdd _521_ _516_ _6_<0> _522_ OAI21X1
XNAND2X1_5 vdd _523_ gnd latch_s_data<1> _516_ NAND2X1
XOAI21X1_18 gnd vdd _54_ _516_ _6_<1> _523_ OAI21X1
XOR2X2_1 _524_ _521_ vdd gnd _66_ OR2X2
XNOR2X1_2 vdd _21_ gnd _525_ latch_s_data<0> NOR2X1
XAOI22X1_1 gnd vdd _435_ _524_ _11_ dw00_cs _525_ AOI22X1
XINVX1_7 s_ack_dly _526_ vdd gnd INVX1
XNOR2X1_3 vdd _526_ gnd _527_ s_ack_2dly NOR2X1
XNOR2X1_4 vdd _517_ gnd _9_ reg_run NOR2X1
XINVX1_8 RST_I_bF$buf5 _341_ vdd gnd INVX1
XINVX1_9 RST_I_bF$buf0 _343_ vdd gnd INVX1
XINVX1_10 RST_I_bF$buf5 _345_ vdd gnd INVX1
XINVX1_11 RST_I_bF$buf4 _347_ vdd gnd INVX1
XINVX1_12 RST_I_bF$buf5 _349_ vdd gnd INVX1
XINVX1_13 RST_I_bF$buf7 _351_ vdd gnd INVX1
XINVX1_14 RST_I_bF$buf7 _353_ vdd gnd INVX1
XINVX1_15 RST_I_bF$buf3 _355_ vdd gnd INVX1
XINVX1_16 RST_I_bF$buf3 _357_ vdd gnd INVX1
XINVX1_17 RST_I_bF$buf1 _359_ vdd gnd INVX1
XINVX1_18 RST_I_bF$buf3 _361_ vdd gnd INVX1
XINVX1_19 RST_I_bF$buf7 _362_ vdd gnd INVX1
XINVX1_20 RST_I_bF$buf6 _364_ vdd gnd INVX1
XINVX1_21 RST_I_bF$buf1 _366_ vdd gnd INVX1
XINVX1_22 RST_I_bF$buf3 _368_ vdd gnd INVX1
XINVX1_23 RST_I_bF$buf3 _370_ vdd gnd INVX1
XINVX1_24 RST_I_bF$buf6 _372_ vdd gnd INVX1
XINVX1_25 RST_I_bF$buf1 _374_ vdd gnd INVX1
XINVX1_26 RST_I_bF$buf0 _376_ vdd gnd INVX1
XINVX1_27 RST_I_bF$buf6 _378_ vdd gnd INVX1
XINVX1_28 RST_I_bF$buf4 _380_ vdd gnd INVX1
XINVX1_29 RST_I_bF$buf5 _382_ vdd gnd INVX1
XINVX1_30 RST_I_bF$buf5 _384_ vdd gnd INVX1
XINVX1_31 RST_I_bF$buf7 _386_ vdd gnd INVX1
XINVX1_32 RST_I_bF$buf7 _388_ vdd gnd INVX1
XINVX1_33 RST_I_bF$buf3 _390_ vdd gnd INVX1
XINVX1_34 RST_I_bF$buf7 _392_ vdd gnd INVX1
XINVX1_35 RST_I_bF$buf3 _394_ vdd gnd INVX1
XINVX1_36 RST_I_bF$buf7 _396_ vdd gnd INVX1
XINVX1_37 RST_I_bF$buf1 _398_ vdd gnd INVX1
XINVX1_38 RST_I_bF$buf0 _400_ vdd gnd INVX1
XINVX1_39 RST_I_bF$buf1 _401_ vdd gnd INVX1
XINVX1_40 RST_I_bF$buf7 _403_ vdd gnd INVX1
XINVX1_41 RST_I_bF$buf1 _405_ vdd gnd INVX1
XINVX1_42 RST_I_bF$buf6 _407_ vdd gnd INVX1
XINVX1_43 RST_I_bF$buf1 _409_ vdd gnd INVX1
XINVX1_44 RST_I_bF$buf5 _411_ vdd gnd INVX1
XINVX1_45 RST_I_bF$buf6 _413_ vdd gnd INVX1
XINVX1_46 RST_I_bF$buf2 _415_ vdd gnd INVX1
XINVX1_47 RST_I_bF$buf2 _417_ vdd gnd INVX1
XINVX1_48 RST_I_bF$buf2 _419_ vdd gnd INVX1
XINVX1_49 RST_I_bF$buf4 _421_ vdd gnd INVX1
XINVX1_50 RST_I_bF$buf0 _423_ vdd gnd INVX1
XINVX1_51 RST_I_bF$buf0 _425_ vdd gnd INVX1
XINVX1_52 RST_I_bF$buf4 _427_ vdd gnd INVX1
XINVX1_53 RST_I_bF$buf0 _429_ vdd gnd INVX1
XINVX1_54 RST_I_bF$buf2 _431_ vdd gnd INVX1
XINVX1_55 RST_I_bF$buf2 _433_ vdd gnd INVX1
XINVX1_56 RST_I_bF$buf6 _434_ vdd gnd INVX1
XINVX1_57 RST_I_bF$buf0 _436_ vdd gnd INVX1
XINVX1_58 RST_I_bF$buf4 _438_ vdd gnd INVX1
XINVX1_59 RST_I_bF$buf4 _440_ vdd gnd INVX1
XINVX1_60 RST_I_bF$buf2 _442_ vdd gnd INVX1
XINVX1_61 RST_I_bF$buf4 _444_ vdd gnd INVX1
XINVX1_62 RST_I_bF$buf4 _446_ vdd gnd INVX1
XINVX1_63 RST_I_bF$buf0 _448_ vdd gnd INVX1
XINVX1_64 RST_I_bF$buf5 _450_ vdd gnd INVX1
XINVX1_65 RST_I_bF$buf5 _452_ vdd gnd INVX1
XINVX1_66 RST_I_bF$buf6 _454_ vdd gnd INVX1
XINVX1_67 RST_I_bF$buf1 _456_ vdd gnd INVX1
XINVX1_68 RST_I_bF$buf3 _458_ vdd gnd INVX1
XINVX1_69 RST_I_bF$buf7 _459_ vdd gnd INVX1
XINVX1_70 RST_I_bF$buf2 _461_ vdd gnd INVX1
XINVX1_71 RST_I_bF$buf2 _463_ vdd gnd INVX1
XINVX1_72 RST_I_bF$buf6 _465_ vdd gnd INVX1
XBUFX2_6 vdd gnd $undef RSTREQ_O BUFX2
XBUFX2_7 vdd gnd _527_ S_ACK_O BUFX2
XBUFX2_8 vdd gnd _528_<0> S_DAT_O<0> BUFX2
XBUFX2_9 vdd gnd _528_<1> S_DAT_O<1> BUFX2
XBUFX2_10 vdd gnd _528_<2> S_DAT_O<2> BUFX2
XBUFX2_11 vdd gnd _528_<3> S_DAT_O<3> BUFX2
XBUFX2_12 vdd gnd _528_<4> S_DAT_O<4> BUFX2
XBUFX2_13 vdd gnd _528_<5> S_DAT_O<5> BUFX2
XBUFX2_14 vdd gnd _528_<6> S_DAT_O<6> BUFX2
XBUFX2_15 vdd gnd _528_<7> S_DAT_O<7> BUFX2
XBUFX2_16 vdd gnd _528_<8> S_DAT_O<8> BUFX2
XBUFX2_17 vdd gnd _528_<9> S_DAT_O<9> BUFX2
XBUFX2_18 vdd gnd _528_<10> S_DAT_O<10> BUFX2
XBUFX2_19 vdd gnd _528_<11> S_DAT_O<11> BUFX2
XBUFX2_20 vdd gnd _528_<12> S_DAT_O<12> BUFX2
XBUFX2_21 vdd gnd _528_<13> S_DAT_O<13> BUFX2
XBUFX2_22 vdd gnd _528_<14> S_DAT_O<14> BUFX2
XBUFX2_23 vdd gnd _528_<15> S_DAT_O<15> BUFX2
XBUFX2_24 vdd gnd gnd S_DAT_O<16> BUFX2
XBUFX2_25 vdd gnd gnd S_DAT_O<17> BUFX2
XBUFX2_26 vdd gnd gnd S_DAT_O<18> BUFX2
XBUFX2_27 vdd gnd gnd S_DAT_O<19> BUFX2
XBUFX2_28 vdd gnd gnd S_DAT_O<20> BUFX2
XBUFX2_29 vdd gnd gnd S_DAT_O<21> BUFX2
XBUFX2_30 vdd gnd gnd S_DAT_O<22> BUFX2
XBUFX2_31 vdd gnd gnd S_DAT_O<23> BUFX2
XBUFX2_32 vdd gnd gnd S_DAT_O<24> BUFX2
XBUFX2_33 vdd gnd gnd S_DAT_O<25> BUFX2
XBUFX2_34 vdd gnd gnd S_DAT_O<26> BUFX2
XBUFX2_35 vdd gnd gnd S_DAT_O<27> BUFX2
XBUFX2_36 vdd gnd gnd S_DAT_O<28> BUFX2
XBUFX2_37 vdd gnd gnd S_DAT_O<29> BUFX2
XBUFX2_38 vdd gnd gnd S_DAT_O<30> BUFX2
XBUFX2_39 vdd gnd gnd S_DAT_O<31> BUFX2
XBUFX2_40 vdd gnd gnd S_ERR_O BUFX2
XBUFX2_41 vdd gnd _529_ S_INT_O BUFX2
XBUFX2_42 vdd gnd gnd S_RTY_O BUFX2
XBUFX2_43 vdd gnd _530_ TOPULSE_O BUFX2
XDFFSR_1 gnd vdd _16_ _341_ vdd status<0> CLK_I_bF$buf2 DFFSR
XDFFSR_2 gnd vdd _15_ vdd _343_ status<1> CLK_I_bF$buf6 DFFSR
XDFFSR_3 gnd vdd _14_ vdd _345_ status<2> CLK_I_bF$buf5 DFFSR
XDFFSR_4 gnd vdd _0_ vdd _347_ _530_ CLK_I_bF$buf2 DFFSR
XDFFSR_5 gnd vdd _7_<0> vdd _349_ read_08_data<0> CLK_I_bF$buf2 DFFSR
XDFFSR_6 gnd vdd _7_<1> vdd _351_ read_08_data<1> CLK_I_bF$buf7 DFFSR
XDFFSR_7 gnd vdd _7_<2> _353_ vdd read_08_data<2> CLK_I_bF$buf7 DFFSR
XDFFSR_8 gnd vdd _7_<3> vdd _355_ read_08_data<3> CLK_I_bF$buf4 DFFSR
XDFFSR_9 gnd vdd _7_<4> _357_ vdd read_08_data<4> CLK_I_bF$buf4 DFFSR
XDFFSR_10 gnd vdd _7_<5> vdd _359_ read_08_data<5> CLK_I_bF$buf3 DFFSR
XDFFSR_11 gnd vdd _7_<6> vdd _361_ read_08_data<6> CLK_I_bF$buf4 DFFSR
XDFFSR_12 gnd vdd _7_<7> vdd _362_ read_08_data<7> CLK_I_bF$buf7 DFFSR
XDFFSR_13 gnd vdd _7_<8> vdd _364_ read_08_data<8> CLK_I_bF$buf1 DFFSR
XDFFSR_14 gnd vdd _7_<9> vdd _366_ read_08_data<9> CLK_I_bF$buf3 DFFSR
XDFFSR_15 gnd vdd _7_<10> vdd _368_ read_08_data<10> CLK_I_bF$buf4 DFFSR
XDFFSR_16 gnd vdd _7_<11> vdd _370_ read_08_data<11> CLK_I_bF$buf4 DFFSR
XDFFSR_17 gnd vdd _7_<12> vdd _372_ read_08_data<12> CLK_I_bF$buf1 DFFSR
XDFFSR_18 gnd vdd _7_<13> vdd _374_ read_08_data<13> CLK_I_bF$buf3 DFFSR
XDFFSR_19 gnd vdd _7_<14> vdd _376_ read_08_data<14> CLK_I_bF$buf6 DFFSR
XDFFSR_20 gnd vdd _7_<15> vdd _378_ read_08_data<15> CLK_I_bF$buf1 DFFSR
XDFFSR_21 gnd vdd _10_ vdd _380_ reg_stop CLK_I_bF$buf5 DFFSR
XDFFSR_22 gnd vdd _8_ vdd _382_ reg_run CLK_I_bF$buf5 DFFSR
XDFFSR_23 gnd vdd _5_<0> vdd _384_ internal_counter<0> CLK_I_bF$buf5 DFFSR
XDFFSR_24 gnd vdd _5_<1> vdd _386_ internal_counter<1> CLK_I_bF$buf7 DFFSR
XDFFSR_25 gnd vdd _5_<2> vdd _388_ internal_counter<2> CLK_I_bF$buf7 DFFSR
XDFFSR_26 gnd vdd _5_<3> vdd _390_ internal_counter<3> CLK_I_bF$buf4 DFFSR
XDFFSR_27 gnd vdd _5_<4> vdd _392_ internal_counter<4> CLK_I_bF$buf7 DFFSR
XDFFSR_28 gnd vdd _5_<5> vdd _394_ internal_counter<5> CLK_I_bF$buf4 DFFSR
XDFFSR_29 gnd vdd _5_<6> vdd _396_ internal_counter<6> CLK_I_bF$buf7 DFFSR
XDFFSR_30 gnd vdd _5_<7> vdd _398_ internal_counter<7> CLK_I_bF$buf3 DFFSR
XDFFSR_31 gnd vdd _5_<8> vdd _400_ internal_counter<8> CLK_I_bF$buf6 DFFSR
XDFFSR_32 gnd vdd _5_<9> vdd _401_ internal_counter<9> CLK_I_bF$buf3 DFFSR
XDFFSR_33 gnd vdd _5_<10> vdd _403_ internal_counter<10> CLK_I_bF$buf7 DFFSR
XDFFSR_34 gnd vdd _5_<11> vdd _405_ internal_counter<11> CLK_I_bF$buf3 DFFSR
XDFFSR_35 gnd vdd _5_<12> vdd _407_ internal_counter<12> CLK_I_bF$buf1 DFFSR
XDFFSR_36 gnd vdd _5_<13> vdd _409_ internal_counter<13> CLK_I_bF$buf3 DFFSR
XDFFSR_37 gnd vdd _5_<14> vdd _411_ internal_counter<14> CLK_I_bF$buf5 DFFSR
XDFFSR_38 gnd vdd _5_<15> vdd _413_ internal_counter<15> CLK_I_bF$buf1 DFFSR
XDFFSR_39 gnd vdd s_ack_pre vdd _415_ s_ack_dly CLK_I_bF$buf0 DFFSR
XDFFSR_40 gnd vdd s_ack_dly vdd _417_ s_ack_2dly CLK_I_bF$buf0 DFFSR
XDFFSR_41 gnd vdd _13_ vdd _419_ s_ack_pre CLK_I_bF$buf0 DFFSR
XDFFSR_42 gnd vdd _6_<0> vdd _421_ reg_ito CLK_I_bF$buf5 DFFSR
XDFFSR_43 gnd vdd _6_<1> vdd _423_ reg_cont CLK_I_bF$buf6 DFFSR
XDFFSR_44 gnd vdd _9_ vdd _425_ reg_start CLK_I_bF$buf5 DFFSR
XDFFSR_45 gnd vdd _11_ vdd _427_ _529_ CLK_I_bF$buf2 DFFSR
XDFFSR_46 gnd vdd _12_ vdd _429_ reg_wr CLK_I_bF$buf6 DFFSR
XDFFSR_47 gnd vdd _1_ vdd _431_ dw00_cs CLK_I_bF$buf0 DFFSR
XDFFSR_48 gnd vdd _2_ vdd _433_ dw04_cs CLK_I_bF$buf6 DFFSR
XDFFSR_49 gnd vdd _3_ vdd _434_ dw08_cs CLK_I_bF$buf1 DFFSR
XDFFSR_50 gnd vdd _4_ vdd _436_ dw0c_cs CLK_I_bF$buf6 DFFSR
XDFFSR_51 gnd vdd S_DAT_I<0> vdd _438_ latch_s_data<0> CLK_I_bF$buf5 DFFSR
XDFFSR_52 gnd vdd S_DAT_I<1> vdd _440_ latch_s_data<1> CLK_I_bF$buf6 DFFSR
XDFFSR_53 gnd vdd S_DAT_I<2> vdd _442_ latch_s_data<2> CLK_I_bF$buf0 DFFSR
XDFFSR_54 gnd vdd S_DAT_I<3> vdd _444_ latch_s_data<3> CLK_I_bF$buf2 DFFSR
XDFFSR_55 gnd vdd S_DAT_I<4> vdd _446_ latch_s_data<4> CLK_I_bF$buf2 DFFSR
XDFFSR_56 gnd vdd S_DAT_I<5> vdd _448_ latch_s_data<5> CLK_I_bF$buf6 DFFSR
XDFFSR_57 gnd vdd S_DAT_I<6> vdd _450_ latch_s_data<6> CLK_I_bF$buf2 DFFSR
XDFFSR_58 gnd vdd S_DAT_I<7> vdd _452_ latch_s_data<7> CLK_I_bF$buf2 DFFSR
XDFFSR_59 gnd vdd S_DAT_I<8> vdd _454_ latch_s_data<8> CLK_I_bF$buf1 DFFSR
XDFFSR_60 gnd vdd S_DAT_I<9> vdd _456_ latch_s_data<9> CLK_I_bF$buf3 DFFSR
XDFFSR_61 gnd vdd S_DAT_I<10> vdd _458_ latch_s_data<10> CLK_I_bF$buf4 DFFSR
XDFFSR_62 gnd vdd S_DAT_I<11> vdd _459_ latch_s_data<11> CLK_I_bF$buf7 DFFSR
XDFFSR_63 gnd vdd S_DAT_I<12> vdd _461_ latch_s_data<12> CLK_I_bF$buf0 DFFSR
XDFFSR_64 gnd vdd S_DAT_I<13> vdd _463_ latch_s_data<13> CLK_I_bF$buf0 DFFSR
XDFFSR_65 gnd vdd S_DAT_I<14> vdd _465_ latch_s_data<14> CLK_I_bF$buf0 DFFSR
XDFFSR_66 gnd vdd S_DAT_I<15> vdd _17_ latch_s_data<15> CLK_I_bF$buf1 DFFSR
XINVX1_73 RST_I_bF$buf6 _17_ vdd gnd INVX1
XINVX1_74 reg_start _18_ vdd gnd INVX1
XNOR2X1_5 vdd _18_ gnd _19_ reg_stop NOR2X1
XINVX4_1 vdd gnd _20_ dw08_cs INVX4
XINVX4_2 vdd gnd _21_ reg_wr INVX4
XOAI21X1_19 gnd vdd _20_ _21_ _22_ status_0_bF$buf1 OAI21X1
XINVX1_75 _22_ _23_ vdd gnd INVX1
XOAI21X1_20 gnd vdd status<1> _23_ _24_ _19__bF$buf4 OAI21X1
XINVX4_3 vdd gnd _25_ reg_stop INVX4
XNOR2X1_6 vdd internal_counter<1> gnd _26_ internal_counter<0> NOR2X1
XNOR2X1_7 vdd internal_counter<3> gnd _27_ internal_counter<2> NOR2X1
XNAND2X1_6 vdd _28_ gnd _26_ _27_ NAND2X1
XNOR2X1_8 vdd internal_counter<5> gnd _29_ internal_counter<6> NOR2X1
XNOR2X1_9 vdd internal_counter<4> gnd _30_ internal_counter<7> NOR2X1
XNAND2X1_7 vdd _31_ gnd _29_ _30_ NAND2X1
XNOR2X1_10 vdd _31_ gnd _32_ _28_ NOR2X1
XNOR2X1_11 vdd internal_counter<12> gnd _33_ internal_counter<15> NOR2X1
XNOR2X1_12 vdd internal_counter<13> gnd _34_ internal_counter<14> NOR2X1
XNAND2X1_8 vdd _35_ gnd _33_ _34_ NAND2X1
XNOR2X1_13 vdd internal_counter<9> gnd _36_ internal_counter<10> NOR2X1
XNOR2X1_14 vdd internal_counter<8> gnd _37_ internal_counter<11> NOR2X1
XNAND2X1_9 vdd _38_ gnd _36_ _37_ NAND2X1
XNOR2X1_15 vdd _38_ gnd _39_ _35_ NOR2X1
XAOI21X1_4 gnd vdd _32_ _39_ _40_ _25_ AOI21X1
XNAND2X1_10 vdd _41_ gnd _32_ _39_ NAND2X1
XOAI21X1_21 gnd vdd reg_cont _41_ _42_ status<2> OAI21X1
XOAI21X1_22 gnd vdd _40_ _42_ _14_ _24_ OAI21X1
XINVX8_1 vdd gnd status<2> _43_ INVX8
XAND2X2_3 vdd gnd _26_ _27_ _44_ AND2X2
XAND2X2_4 vdd gnd _29_ _30_ _45_ AND2X2
XNAND2X1_11 vdd _46_ gnd _44_ _45_ NAND2X1
XAND2X2_5 vdd gnd _33_ _34_ _47_ AND2X2
XAND2X2_6 vdd gnd _36_ _37_ _48_ AND2X2
XNAND2X1_12 vdd _49_ gnd _47_ _48_ NAND2X1
XOAI21X1_23 gnd vdd _46_ _49_ _50_ reg_stop OAI21X1
XINVX2_1 vdd gnd _51_ status<1> INVX2
XNOR2X1_16 vdd _19__bF$buf2 gnd _52_ _51_ NOR2X1
XINVX1_76 _52_ _53_ vdd gnd INVX1
XOAI21X1_24 gnd vdd _43_ _50_ _15_ _53_ OAI21X1
XINVX1_77 reg_cont _54_ vdd gnd INVX1
XNOR2X1_17 vdd _49_ gnd _55_ _46_ NOR2X1
XNAND2X1_13 vdd _56_ gnd _54_ _55_ NAND2X1
XINVX2_2 vdd gnd _57_ _19__bF$buf4 INVX2
XNOR2X1_18 vdd _21_ gnd _58_ _20_ NOR2X1
XOAI21X1_25 gnd vdd _58__bF$buf3 _57_ _59_ status_0_bF$buf3 OAI21X1
XOAI21X1_26 gnd vdd _43_ _56_ _16_ _59_ OAI21X1
XINVX1_78 S_ADR_I<3> _60_ vdd gnd INVX1
XNOR2X1_19 vdd S_ADR_I<4> gnd _61_ S_ADR_I<5> NOR2X1
XNAND2X1_14 vdd _62_ gnd _60_ _61_ NAND2X1
XNOR2X1_20 vdd _62_ gnd _1_ S_ADR_I<2> NOR2X1
XINVX1_79 S_ADR_I<2> _63_ vdd gnd INVX1
XNOR2X1_21 vdd _62_ gnd _2_ _63_ NOR2X1
XNAND2X1_15 vdd _64_ gnd S_ADR_I<3> _61_ NAND2X1
XNOR2X1_22 vdd _64_ gnd _3_ S_ADR_I<2> NOR2X1
XNOR2X1_23 vdd _64_ gnd _4_ _63_ NOR2X1
XAND2X2_7 vdd gnd S_STB_I S_CYC_I _13_ AND2X2
XNAND2X1_16 vdd _65_ gnd S_WE_I _13_ NAND2X1
XINVX1_80 _65_ _12_ vdd gnd INVX1
XNAND2X1_17 vdd _66_ gnd reg_run _55_ NAND2X1
XNOR2X1_24 vdd _66_ gnd _0_ _530_ NOR2X1
XNAND2X1_18 vdd _67_ gnd latch_s_data<0> _58__bF$buf4 NAND2X1
XINVX1_81 _67_ _68_ vdd gnd INVX1
XINVX2_3 vdd gnd _69_ internal_counter<0> INVX2
XNOR2X1_25 vdd read_08_data<11> gnd _70_ read_08_data<10> NOR2X1
XNOR2X1_26 vdd read_08_data<9> gnd _71_ read_08_data<8> NOR2X1
XAND2X2_8 vdd gnd _70_ _71_ _72_ AND2X2
XNOR2X1_27 vdd read_08_data<1> gnd _73_ read_08_data<0> NOR2X1
XNOR2X1_28 vdd read_08_data<3> gnd _74_ read_08_data<2> NOR2X1
XAND2X2_9 vdd gnd _73_ _74_ _75_ AND2X2
XNOR2X1_29 vdd read_08_data<5> gnd _76_ read_08_data<4> NOR2X1
XNOR2X1_30 vdd read_08_data<7> gnd _77_ read_08_data<6> NOR2X1
XAND2X2_10 vdd gnd _76_ _77_ _78_ AND2X2
XNAND3X1_1 _75_ vdd gnd _72_ _78_ _79_ NAND3X1
XINVX2_4 vdd gnd _80_ read_08_data<14> INVX2
XINVX1_82 read_08_data<15> _81_ vdd gnd INVX1
XNOR2X1_31 vdd read_08_data<13> gnd _82_ read_08_data<12> NOR2X1
XNAND3X1_2 _81_ vdd gnd _80_ _82_ _83_ NAND3X1
XOAI21X1_27 gnd vdd _83_ _79_ _84_ _19__bF$buf3 OAI21X1
XINVX1_83 read_08_data<0> _85_ vdd gnd INVX1
XINVX8_2 vdd gnd _58__bF$buf3 _86_ INVX8
XOAI21X1_28 gnd vdd _85_ _57_ _87_ _86__bF$buf1 OAI21X1
XAOI21X1_5 gnd vdd _84_ _69_ _88_ _87_ AOI21X1
XOAI21X1_29 gnd vdd _68_ _88_ _89_ status_0_bF$buf3 OAI21X1
XOAI21X1_30 gnd vdd reg_stop _18_ _90_ _58__bF$buf2 OAI21X1
XINVX4_4 vdd gnd _91_ _90_ INVX4
XNOR2X1_32 vdd _91_ gnd _92_ _69_ NOR2X1
XNOR2X1_33 vdd _67_ gnd _93_ _19__bF$buf1 NOR2X1
XOAI21X1_31 gnd vdd _93_ _92_ _94_ status<1> OAI21X1
XOAI21X1_32 gnd vdd read_08_data<0> _41_ _95_ _69_ OAI21X1
XOAI21X1_33 gnd vdd _58__bF$buf4 _95_ _96_ _67_ OAI21X1
XAOI21X1_6 gnd vdd _40_ _69_ _97_ _43_ AOI21X1
XOAI21X1_34 gnd vdd _40_ _96_ _98_ _97_ OAI21X1
XNAND3X1_3 _89_ vdd gnd _94_ _98_ _5_<0> NAND3X1
XNAND2X1_19 vdd _99_ gnd latch_s_data<1> _58__bF$buf4 NAND2X1
XINVX1_84 _99_ _100_ vdd gnd INVX1
XINVX2_5 vdd gnd _101_ internal_counter<1> INVX2
XINVX1_85 read_08_data<1> _102_ vdd gnd INVX1
XNOR2X1_34 vdd _102_ gnd _103_ _85_ NOR2X1
XOAI21X1_35 gnd vdd read_08_data<0> read_08_data<1> _104_ _19__bF$buf1 OAI21X1
XOAI21X1_36 gnd vdd _103_ _104_ _105_ _86__bF$buf1 OAI21X1
XAOI21X1_7 gnd vdd _84_ _101_ _106_ _105_ AOI21X1
XOAI21X1_37 gnd vdd _100_ _106_ _107_ status_0_bF$buf3 OAI21X1
XOAI21X1_38 gnd vdd _25_ _55_ _108_ status<2> OAI21X1
XOAI21X1_39 gnd vdd _101_ _43_ _109_ _108_ OAI21X1
XNAND2X1_20 vdd _110_ gnd read_08_data<1> _55_ NAND2X1
XNOR2X1_35 vdd _101_ gnd _111_ _69_ NOR2X1
XOAI21X1_40 gnd vdd _26_ _111_ _112_ _41_ OAI21X1
XAOI21X1_8 gnd vdd _110_ _112_ _113_ _58__bF$buf3 AOI21X1
XOAI21X1_41 gnd vdd _25_ _55_ _114_ _99_ OAI21X1
XOAI21X1_42 gnd vdd _114_ _113_ _115_ _109_ OAI21X1
XNOR2X1_36 vdd _91_ gnd _116_ _101_ NOR2X1
XNOR2X1_37 vdd _99_ gnd _117_ _19__bF$buf1 NOR2X1
XOAI21X1_43 gnd vdd _117_ _116_ _118_ status<1> OAI21X1
XNAND3X1_4 _107_ vdd gnd _118_ _115_ _5_<1> NAND3X1
XNAND2X1_21 vdd _119_ gnd latch_s_data<2> _58__bF$buf2 NAND2X1
XINVX1_86 _119_ _120_ vdd gnd INVX1
XINVX4_5 vdd gnd _121_ internal_counter<2> INVX4
XOAI21X1_44 gnd vdd read_08_data<0> read_08_data<1> _122_ read_08_data<2> OAI21X1
XINVX1_87 _122_ _123_ vdd gnd INVX1
XINVX1_88 _73_ _124_ vdd gnd INVX1
XOAI21X1_45 gnd vdd read_08_data<2> _124_ _125_ _19__bF$buf1 OAI21X1
XOAI21X1_46 gnd vdd _123_ _125_ _126_ _86__bF$buf1 OAI21X1
XAOI21X1_9 gnd vdd _84_ _121_ _127_ _126_ AOI21X1
XOAI21X1_47 gnd vdd _120_ _127_ _128_ status_0_bF$buf3 OAI21X1
XNOR2X1_38 vdd _91_ gnd _129_ _121_ NOR2X1
XNOR2X1_39 vdd _119_ gnd _130_ _19__bF$buf1 NOR2X1
XOAI21X1_48 gnd vdd _130_ _129_ _131_ status<1> OAI21X1
XXNOR2X1_1 _26_ _121_ gnd vdd _132_ XNOR2X1
XOAI21X1_49 gnd vdd _46_ _49_ _133_ _132_ OAI21X1
XNAND3X1_5 _32_ vdd gnd read_08_data<2> _39_ _134_ NAND3X1
XAOI21X1_10 gnd vdd _133_ _134_ _135_ _58__bF$buf3 AOI21X1
XINVX1_89 latch_s_data<2> _136_ vdd gnd INVX1
XOAI21X1_50 gnd vdd _136_ _86__bF$buf1 _137_ _50_ OAI21X1
XOAI21X1_51 gnd vdd _121_ _43_ _138_ _108_ OAI21X1
XOAI21X1_52 gnd vdd _135_ _137_ _139_ _138_ OAI21X1
XNAND3X1_6 _128_ vdd gnd _131_ _139_ _5_<2> NAND3X1
XNAND2X1_22 vdd _140_ gnd latch_s_data<3> _58__bF$buf4 NAND2X1
XINVX1_90 _140_ _141_ vdd gnd INVX1
XINVX2_6 vdd gnd _142_ internal_counter<3> INVX2
XINVX1_91 read_08_data<2> _143_ vdd gnd INVX1
XINVX1_92 read_08_data<3> _144_ vdd gnd INVX1
XAOI21X1_11 gnd vdd _73_ _143_ _145_ _144_ AOI21X1
XNAND2X1_23 vdd _146_ gnd _73_ _74_ NAND2X1
XNAND2X1_24 vdd _147_ gnd _19__bF$buf2 _146_ NAND2X1
XOAI21X1_53 gnd vdd _145_ _147_ _148_ _86__bF$buf2 OAI21X1
XAOI21X1_12 gnd vdd _84_ _142_ _149_ _148_ AOI21X1
XOAI21X1_54 gnd vdd _141_ _149_ _150_ status_0_bF$buf3 OAI21X1
XAOI21X1_13 gnd vdd _26_ _121_ _151_ _142_ AOI21X1
XOAI21X1_55 gnd vdd _44_ _151_ _152_ _86__bF$buf2 OAI21X1
XAOI21X1_14 gnd vdd _55_ _144_ _153_ _152_ AOI21X1
XOAI21X1_56 gnd vdd _25_ _55_ _154_ _140_ OAI21X1
XAOI21X1_15 gnd vdd _40_ _142_ _155_ _43_ AOI21X1
XOAI21X1_57 gnd vdd _154_ _153_ _156_ _155_ OAI21X1
XNOR2X1_40 vdd _91_ gnd _157_ _142_ NOR2X1
XNOR2X1_41 vdd _140_ gnd _158_ _19__bF$buf1 NOR2X1
XOAI21X1_58 gnd vdd _158_ _157_ _159_ status<1> OAI21X1
XNAND3X1_7 _159_ vdd gnd _156_ _150_ _5_<3> NAND3X1
XNAND2X1_25 vdd _160_ gnd latch_s_data<4> _58__bF$buf4 NAND2X1
XINVX1_93 _160_ _161_ vdd gnd INVX1
XINVX2_7 vdd gnd _162_ internal_counter<4> INVX2
XINVX1_94 read_08_data<4> _163_ vdd gnd INVX1
XNOR2X1_42 vdd _75_ gnd _164_ _163_ NOR2X1
XOAI21X1_59 gnd vdd read_08_data<4> _146_ _165_ _19__bF$buf2 OAI21X1
XOAI21X1_60 gnd vdd _165_ _164_ _166_ _86__bF$buf2 OAI21X1
XAOI21X1_16 gnd vdd _84_ _162_ _167_ _166_ AOI21X1
XOAI21X1_61 gnd vdd _161_ _167_ _168_ status_0_bF$buf0 OAI21X1
XNOR2X1_43 vdd _51_ gnd _169_ _162_ NOR2X1
XAOI22X1_2 gnd vdd _52_ _161_ _170_ _90_ _169_ AOI22X1
XNAND3X1_8 _26_ vdd gnd _162_ _27_ _171_ NAND3X1
XNAND2X1_26 vdd _172_ gnd internal_counter<4> _28_ NAND2X1
XOAI21X1_62 gnd vdd read_08_data<4> _41_ _173_ _86__bF$buf2 OAI21X1
XAOI21X1_17 gnd vdd _171_ _172_ _174_ _173_ AOI21X1
XOAI21X1_63 gnd vdd _25_ _55_ _175_ _160_ OAI21X1
XOAI21X1_64 gnd vdd _162_ _43_ _176_ _108_ OAI21X1
XOAI21X1_65 gnd vdd _175_ _174_ _177_ _176_ OAI21X1
XNAND3X1_9 _168_ vdd gnd _170_ _177_ _5_<4> NAND3X1
XNAND2X1_27 vdd _178_ gnd latch_s_data<5> _58__bF$buf2 NAND2X1
XINVX1_95 _178_ _179_ vdd gnd INVX1
XINVX2_8 vdd gnd _180_ internal_counter<5> INVX2
XNAND3X1_10 _73_ vdd gnd _163_ _74_ _181_ NAND3X1
XAND2X2_11 vdd gnd _181_ read_08_data<5> _182_ AND2X2
XOAI21X1_66 gnd vdd read_08_data<5> _181_ _183_ _19__bF$buf2 OAI21X1
XOAI21X1_67 gnd vdd _182_ _183_ _184_ _86__bF$buf2 OAI21X1
XAOI21X1_18 gnd vdd _84_ _180_ _185_ _184_ AOI21X1
XOAI21X1_68 gnd vdd _179_ _185_ _186_ status_0_bF$buf0 OAI21X1
XOAI21X1_69 gnd vdd _180_ _43_ _187_ _108_ OAI21X1
XXNOR2X1_2 _171_ _180_ gnd vdd _188_ XNOR2X1
XOAI21X1_70 gnd vdd read_08_data<5> _41_ _189_ _86__bF$buf0 OAI21X1
XOAI21X1_71 gnd vdd _188_ _189_ _190_ _178_ OAI21X1
XOAI21X1_72 gnd vdd _40_ _190_ _191_ _187_ OAI21X1
XNOR2X1_44 vdd _51_ gnd _192_ _180_ NOR2X1
XAOI22X1_3 gnd vdd _52_ _179_ _193_ _90_ _192_ AOI22X1
XNAND3X1_11 _186_ vdd gnd _193_ _191_ _5_<5> NAND3X1
XNAND2X1_28 vdd _194_ gnd latch_s_data<6> _58__bF$buf4 NAND2X1
XINVX1_96 _194_ _195_ vdd gnd INVX1
XINVX2_9 vdd gnd _196_ internal_counter<6> INVX2
XNAND3X1_12 _74_ vdd gnd _73_ _76_ _197_ NAND3X1
XAND2X2_12 vdd gnd _197_ read_08_data<6> _198_ AND2X2
XOAI21X1_73 gnd vdd read_08_data<6> _197_ _199_ _19__bF$buf2 OAI21X1
XOAI21X1_74 gnd vdd _198_ _199_ _200_ _86__bF$buf2 OAI21X1
XAOI21X1_19 gnd vdd _84_ _196_ _201_ _200_ AOI21X1
XOAI21X1_75 gnd vdd _195_ _201_ _202_ status_0_bF$buf0 OAI21X1
XOAI21X1_76 gnd vdd _196_ _43_ _203_ _108_ OAI21X1
XINVX1_97 _29_ _204_ vdd gnd INVX1
XOAI21X1_77 gnd vdd internal_counter<5> _171_ _205_ internal_counter<6> OAI21X1
XOAI21X1_78 gnd vdd _171_ _204_ _206_ _205_ OAI21X1
XOAI21X1_79 gnd vdd read_08_data<6> _41_ _207_ _206_ OAI21X1
XOAI21X1_80 gnd vdd _58__bF$buf0 _207_ _208_ _194_ OAI21X1
XOAI21X1_81 gnd vdd _40_ _208_ _209_ _203_ OAI21X1
XNOR2X1_45 vdd _91_ gnd _210_ _196_ NOR2X1
XNOR2X1_46 vdd _194_ gnd _211_ _19__bF$buf2 NOR2X1
XOAI21X1_82 gnd vdd _211_ _210_ _212_ status<1> OAI21X1
XNAND3X1_13 _202_ vdd gnd _212_ _209_ _5_<6> NAND3X1
XINVX1_98 status_0_bF$buf0 _213_ vdd gnd INVX1
XNAND2X1_29 vdd _214_ gnd latch_s_data<7> _58__bF$buf3 NAND2X1
XNAND2X1_30 vdd _215_ gnd _76_ _77_ NAND2X1
XNOR2X1_47 vdd _215_ gnd _216_ _146_ NOR2X1
XNAND2X1_31 vdd _217_ gnd _70_ _71_ NAND2X1
XNOR2X1_48 vdd _83_ gnd _218_ _217_ NOR2X1
XAOI21X1_20 gnd vdd _218_ _216_ _219_ _57_ AOI21X1
XOAI21X1_83 gnd vdd read_08_data<6> _197_ _220_ read_08_data<7> OAI21X1
XAOI21X1_21 gnd vdd _75_ _78_ _221_ _57_ AOI21X1
XAOI21X1_22 gnd vdd _221_ _220_ _222_ _58__bF$buf5 AOI21X1
XOAI21X1_84 gnd vdd internal_counter<7> _219_ _223_ _222_ OAI21X1
XAND2X2_13 vdd gnd _223_ _214_ _224_ AND2X2
XOAI21X1_85 gnd vdd _204_ _171_ _225_ internal_counter<7> OAI21X1
XOAI21X1_86 gnd vdd _39_ _46_ _226_ _225_ OAI21X1
XOAI21X1_87 gnd vdd _20_ _21_ _227_ _226_ OAI21X1
XNAND3X1_14 _86__bF$buf0 vdd gnd read_08_data<7> _55_ _228_ NAND3X1
XINVX1_99 _214_ _229_ vdd gnd INVX1
XNOR2X1_49 vdd _40_ gnd _230_ _229_ NOR2X1
XNAND3X1_15 _228_ vdd gnd _227_ _230_ _231_ NAND3X1
XINVX1_100 internal_counter<7> _232_ vdd gnd INVX1
XAOI21X1_23 gnd vdd _40_ _232_ _233_ _43_ AOI21X1
XAOI21X1_24 gnd vdd internal_counter<7> _86__bF$buf0 _234_ _229_ AOI21X1
XNAND2X1_32 vdd _235_ gnd internal_counter<7> _19__bF$buf0 NAND2X1
XOAI21X1_88 gnd vdd _19__bF$buf0 _234_ _236_ _235_ OAI21X1
XAOI22X1_4 gnd vdd _233_ _231_ _237_ status<1> _236_ AOI22X1
XOAI21X1_89 gnd vdd _213_ _224_ _5_<7> _237_ OAI21X1
XNAND2X1_33 vdd _238_ gnd latch_s_data<8> _58__bF$buf1 NAND2X1
XNOR2X1_50 vdd _219_ gnd _239_ internal_counter<8> NOR2X1
XINVX2_10 vdd gnd _240_ read_08_data<8> INVX2
XAND2X2_14 vdd gnd _216_ _240_ _241_ AND2X2
XOAI21X1_90 gnd vdd _240_ _216_ _242_ _19__bF$buf3 OAI21X1
XOAI21X1_91 gnd vdd _241_ _242_ _243_ _86__bF$buf3 OAI21X1
XOAI21X1_92 gnd vdd _239_ _243_ _244_ _238_ OAI21X1
XNAND2X1_34 vdd _245_ gnd status_0_bF$buf2 _244_ NAND2X1
XINVX2_11 vdd gnd _246_ internal_counter<8> INVX2
XNOR2X1_51 vdd _91_ gnd _247_ _246_ NOR2X1
XNOR2X1_52 vdd _238_ gnd _248_ _19__bF$buf4 NOR2X1
XOAI21X1_93 gnd vdd _248_ _247_ _249_ status<1> OAI21X1
XOAI21X1_94 gnd vdd _28_ _31_ _250_ _86__bF$buf0 OAI21X1
XAOI21X1_25 gnd vdd _50_ _250_ _251_ _246_ AOI21X1
XNOR2X1_53 vdd _58__bF$buf5 gnd _252_ _240_ NOR2X1
XNAND3X1_16 _32_ vdd gnd _252_ _39_ _253_ NAND3X1
XNOR3X1_1 vdd gnd _28_ _31_ internal_counter<8> _254_ NOR3X1
XAOI21X1_26 gnd vdd _47_ _48_ _255_ _58__bF$buf1 AOI21X1
XAOI22X1_5 gnd vdd _254_ _255_ _256_ latch_s_data<8> _58__bF$buf1 AOI22X1
XAOI21X1_27 gnd vdd _256_ _253_ _257_ _40_ AOI21X1
XOAI21X1_95 gnd vdd _251_ _257_ _258_ status<2> OAI21X1
XNAND3X1_17 _258_ vdd gnd _249_ _245_ _5_<8> NAND3X1
XINVX1_101 read_08_data<9> _259_ vdd gnd INVX1
XAOI21X1_28 gnd vdd _216_ _240_ _260_ _259_ AOI21X1
XNAND3X1_18 _75_ vdd gnd _71_ _78_ _261_ NAND3X1
XNAND2X1_35 vdd _262_ gnd _19__bF$buf3 _261_ NAND2X1
XOAI22X1_1 gnd vdd _219_ internal_counter<9> _262_ _260_ _263_ OAI22X1
XOAI21X1_96 gnd vdd _20_ _21_ _264_ _263_ OAI21X1
XINVX1_102 latch_s_data<9> _265_ vdd gnd INVX1
XNAND2X1_36 vdd _266_ gnd _265_ _58__bF$buf5 NAND2X1
XNAND3X1_19 _266_ vdd gnd status_0_bF$buf1 _264_ _267_ NAND3X1
XINVX2_12 vdd gnd _268_ internal_counter<9> INVX2
XOAI21X1_97 gnd vdd _268_ _43_ _269_ _108_ OAI21X1
XNAND3X1_20 _268_ vdd gnd _246_ _32_ _270_ NAND3X1
XOAI21X1_98 gnd vdd internal_counter<8> _46_ _271_ internal_counter<9> OAI21X1
XOAI21X1_99 gnd vdd read_08_data<9> _41_ _272_ _86__bF$buf3 OAI21X1
XAOI21X1_29 gnd vdd _270_ _271_ _273_ _272_ AOI21X1
XOAI21X1_100 gnd vdd _265_ _86__bF$buf3 _274_ _50_ OAI21X1
XOAI21X1_101 gnd vdd _274_ _273_ _275_ _269_ OAI21X1
XNAND2X1_37 vdd _276_ gnd latch_s_data<9> _58__bF$buf5 NAND2X1
XOAI22X1_2 gnd vdd _91_ _268_ _19__bF$buf3 _276_ _277_ OAI22X1
XNAND2X1_38 vdd _278_ gnd status<1> _277_ NAND2X1
XNAND3X1_21 _275_ vdd gnd _278_ _267_ _5_<9> NAND3X1
XNAND2X1_39 vdd _279_ gnd latch_s_data<10> _58__bF$buf0 NAND2X1
XINVX1_103 _279_ _280_ vdd gnd INVX1
XNAND2X1_40 vdd _281_ gnd _36_ _254_ NAND2X1
XOAI21X1_102 gnd vdd _46_ _49_ _282_ _86__bF$buf1 OAI21X1
XNAND3X1_22 _44_ vdd gnd _246_ _45_ _283_ NAND3X1
XOAI21X1_103 gnd vdd internal_counter<9> _283_ _284_ internal_counter<10> OAI21X1
XOAI21X1_104 gnd vdd _20_ _21_ _285_ read_08_data<10> OAI21X1
XAOI22X1_6 gnd vdd _281_ _284_ _286_ _282_ _285_ AOI22X1
XNOR3X1_2 vdd gnd _280_ _286_ _40_ _287_ NOR3X1
XOAI21X1_105 gnd vdd internal_counter<10> _50_ _288_ status<2> OAI21X1
XINVX1_104 read_08_data<10> _289_ vdd gnd INVX1
XNAND3X1_23 _71_ vdd gnd _289_ _216_ _290_ NAND3X1
XNAND2X1_41 vdd _291_ gnd read_08_data<10> _261_ NAND2X1
XNAND3X1_24 _290_ vdd gnd _19__bF$buf0 _291_ _292_ NAND3X1
XINVX1_105 internal_counter<10> _293_ vdd gnd INVX1
XAOI21X1_30 gnd vdd _84_ _293_ _294_ _22_ AOI21X1
XOAI21X1_106 gnd vdd _19__bF$buf0 _86__bF$buf0 _295_ internal_counter<10> OAI21X1
XOAI21X1_107 gnd vdd status_0_bF$buf1 _52_ _296_ _280_ OAI21X1
XOAI21X1_108 gnd vdd _51_ _295_ _297_ _296_ OAI21X1
XAOI21X1_31 gnd vdd _294_ _292_ _298_ _297_ AOI21X1
XOAI21X1_109 gnd vdd _288_ _287_ _5_<10> _298_ OAI21X1
XOAI21X1_110 gnd vdd internal_counter<10> _270_ _299_ internal_counter<11> OAI21X1
XNAND3X1_25 _45_ vdd gnd _44_ _48_ _300_ NAND3X1
XINVX1_106 _300_ _301_ vdd gnd INVX1
XOAI21X1_111 gnd vdd read_08_data<11> _35_ _302_ _301_ OAI21X1
XAOI21X1_32 gnd vdd _299_ _302_ _303_ _58__bF$buf5 AOI21X1
XNAND2X1_42 vdd _304_ gnd latch_s_data<11> _58__bF$buf3 NAND2X1
XOAI21X1_112 gnd vdd _25_ _55_ _305_ _304_ OAI21X1
XINVX2_13 vdd gnd _306_ internal_counter<11> INVX2
XAOI21X1_33 gnd vdd _40_ _306_ _307_ _43_ AOI21X1
XOAI21X1_113 gnd vdd _305_ _303_ _308_ _307_ OAI21X1
XAOI21X1_34 gnd vdd _290_ read_08_data<11> _309_ _57_ AOI21X1
XOAI21X1_114 gnd vdd read_08_data<11> _290_ _310_ _309_ OAI21X1
XAOI21X1_35 gnd vdd _84_ _306_ _311_ _22_ AOI21X1
XOAI22X1_3 gnd vdd _91_ _306_ _19__bF$buf0 _304_ _312_ OAI22X1
XNAND2X1_43 vdd _313_ gnd status<1> _312_ NAND2X1
XOAI21X1_115 gnd vdd _213_ _304_ _314_ _313_ OAI21X1
XAOI21X1_36 gnd vdd _310_ _311_ _315_ _314_ AOI21X1
XNAND2X1_44 vdd _5_<11> gnd _315_ _308_ NAND2X1
XOAI21X1_116 gnd vdd read_08_data<12> _79_ _316_ _19__bF$buf3 OAI21X1
XINVX1_107 read_08_data<12> _317_ vdd gnd INVX1
XAOI21X1_37 gnd vdd _216_ _72_ _318_ _317_ AOI21X1
XOAI22X1_4 gnd vdd _316_ _318_ internal_counter<12> _219_ _319_ OAI22X1
XNAND2X1_45 vdd _320_ gnd _86__bF$buf3 _319_ NAND2X1
XOR2X2_2 _321_ latch_s_data<12> vdd gnd _86__bF$buf3 OR2X2
XNAND3X1_26 _321_ vdd gnd status_0_bF$buf2 _320_ _322_ NAND3X1
XINVX2_14 vdd gnd _323_ internal_counter<12> INVX2
XOAI21X1_117 gnd vdd _323_ _43_ _324_ _108_ OAI21X1
XXNOR2X1_3 _300_ _323_ gnd vdd _325_ XNOR2X1
XOAI21X1_118 gnd vdd read_08_data<12> _41_ _326_ _86__bF$buf3 OAI21X1
XAOI21X1_38 gnd vdd latch_s_data<12> _58__bF$buf1 _327_ _40_ AOI21X1
XOAI21X1_119 gnd vdd _326_ _325_ _328_ _327_ OAI21X1
XNAND2X1_46 vdd _329_ gnd latch_s_data<12> _58__bF$buf1 NAND2X1
XOAI22X1_5 gnd vdd _91_ _323_ _19__bF$buf4 _329_ _330_ OAI22X1
XAOI22X1_7 gnd vdd _324_ _328_ _331_ status<1> _330_ AOI22X1
XNAND2X1_47 vdd _5_<12> gnd _331_ _322_ NAND2X1
XINVX2_15 vdd gnd _332_ internal_counter<13> INVX2
XOAI21X1_120 gnd vdd _332_ _43_ _333_ _108_ OAI21X1
XNOR2X1_54 vdd _300_ gnd _334_ internal_counter<12> NOR2X1
XNAND2X1_48 vdd _335_ gnd _332_ _334_ NAND2X1
XOAI21X1_121 gnd vdd internal_counter<12> _300_ _336_ internal_counter<13> OAI21X1
XOAI21X1_122 gnd vdd _20_ _21_ _337_ read_08_data<13> OAI21X1
XAOI22X1_8 gnd vdd _336_ _335_ _338_ _282_ _337_ AOI22X1
XNAND2X1_49 vdd _339_ gnd latch_s_data<13> _58__bF$buf2 NAND2X1
XOAI21X1_123 gnd vdd _25_ _55_ _340_ _339_ OAI21X1
XOAI21X1_124 gnd vdd _340_ _338_ _342_ _333_ OAI21X1
XNAND3X1_27 _82_ vdd gnd _72_ _216_ _344_ NAND3X1
XOAI21X1_125 gnd vdd read_08_data<12> _79_ _346_ read_08_data<13> OAI21X1
XNAND3X1_28 _344_ vdd gnd _19__bF$buf3 _346_ _348_ NAND3X1
XAOI21X1_39 gnd vdd _84_ _332_ _350_ _22_ AOI21X1
XNAND2X1_50 vdd _352_ gnd internal_counter<13> status<1> NAND2X1
XINVX1_108 _339_ _354_ vdd gnd INVX1
XOAI21X1_126 gnd vdd status_0_bF$buf1 _52_ _356_ _354_ OAI21X1
XOAI21X1_127 gnd vdd _91_ _352_ _358_ _356_ OAI21X1
XAOI21X1_40 gnd vdd _350_ _348_ _360_ _358_ AOI21X1
XNAND2X1_51 vdd _5_<13> gnd _360_ _342_ NAND2X1
XNAND3X1_29 _48_ vdd gnd _323_ _32_ _363_ NAND3X1
XOAI21X1_128 gnd vdd internal_counter<13> _363_ _365_ internal_counter<14> OAI21X1
XNAND2X1_52 vdd _367_ gnd _34_ _334_ NAND2X1
XOAI21X1_129 gnd vdd _20_ _21_ _369_ read_08_data<14> OAI21X1
XAOI22X1_9 gnd vdd _365_ _367_ _371_ _282_ _369_ AOI22X1
XNAND2X1_53 vdd _373_ gnd latch_s_data<14> _58__bF$buf2 NAND2X1
XOAI21X1_130 gnd vdd _25_ _55_ _375_ _373_ OAI21X1
XINVX1_109 internal_counter<14> _377_ vdd gnd INVX1
XAOI21X1_41 gnd vdd _40_ _377_ _379_ _43_ AOI21X1
XOAI21X1_131 gnd vdd _375_ _371_ _381_ _379_ OAI21X1
XAND2X2_15 vdd gnd _344_ _80_ _383_ AND2X2
XNOR2X1_55 vdd _344_ gnd _385_ _80_ NOR2X1
XOAI21X1_132 gnd vdd _385_ _383_ _387_ _19__bF$buf4 OAI21X1
XAOI21X1_42 gnd vdd _84_ _377_ _389_ _22_ AOI21X1
XNAND2X1_54 vdd _391_ gnd internal_counter<14> status<1> NAND2X1
XINVX1_110 _373_ _393_ vdd gnd INVX1
XOAI21X1_133 gnd vdd status_0_bF$buf2 _52_ _395_ _393_ OAI21X1
XOAI21X1_134 gnd vdd _91_ _391_ _397_ _395_ OAI21X1
XAOI21X1_43 gnd vdd _387_ _389_ _399_ _397_ AOI21X1
XNAND2X1_55 vdd _5_<14> gnd _381_ _399_ NAND2X1
XOAI21X1_135 gnd vdd _20_ _21_ _402_ internal_counter<15> OAI21X1
XAOI21X1_44 gnd vdd _334_ _34_ _404_ _402_ AOI21X1
XNAND2X1_56 vdd _406_ gnd latch_s_data<15> _58__bF$buf2 NAND2X1
XNOR2X1_56 vdd _58__bF$buf1 gnd _408_ _81_ NOR2X1
XNAND3X1_30 _32_ vdd gnd _408_ _39_ _410_ NAND3X1
XNAND3X1_31 _410_ vdd gnd _406_ _50_ _412_ NAND3X1
XINVX1_111 internal_counter<15> _414_ vdd gnd INVX1
XAOI21X1_45 gnd vdd _40_ _414_ _416_ _43_ AOI21X1
XOAI21X1_136 gnd vdd _412_ _404_ _418_ _416_ OAI21X1
XNAND2X1_57 vdd _420_ gnd internal_counter<15> _84_ NAND2X1
XOAI21X1_137 gnd vdd read_08_data<14> _344_ _422_ read_08_data<15> OAI21X1
XOAI21X1_138 gnd vdd _84_ _422_ _424_ _420_ OAI21X1
XNAND2X1_58 vdd _426_ gnd _23_ _424_ NAND2X1
XINVX1_112 _406_ _428_ vdd gnd INVX1
XOAI22X1_6 gnd vdd _91_ _414_ _19__bF$buf4 _406_ _430_ OAI22X1
XAOI22X1_10 gnd vdd status<1> _430_ _432_ status_0_bF$buf2 _428_ AOI22X1
XNAND3X1_32 _432_ vdd gnd _418_ _426_ _5_<15> NAND3X1
XINVX1_113 _529_ _435_ vdd gnd INVX1
XINVX1_114 S_STB_I _437_ vdd gnd INVX1
XNOR2X1_57 vdd _437_ gnd _439_ S_WE_I NOR2X1
XNAND2X1_59 vdd _441_ gnd dw00_cs _439_ NAND2X1
XINVX1_115 _439_ _443_ vdd gnd INVX1
XNOR2X1_58 vdd _443_ gnd _445_ _20_ NOR2X1
XNAND2X1_60 vdd _447_ gnd dw04_cs _439_ NAND2X1
XNAND2X1_61 vdd _449_ gnd dw0c_cs _439_ NAND2X1
XNAND2X1_62 vdd _451_ gnd internal_counter<0> _20_ NAND2X1
XOAI21X1_139 gnd vdd _451_ _449_ _453_ _447_ OAI21X1
XAOI21X1_46 gnd vdd read_08_data<0> _445_ _455_ _453_ AOI21X1
XOAI21X1_140 gnd vdd reg_ito _447_ _457_ _441_ OAI21X1
XOAI22X1_7 gnd vdd _455_ _457_ _435_ _441_ _528_<0> OAI22X1
XINVX1_116 reg_run _460_ vdd gnd INVX1
XINVX8_3 vdd gnd _445_ _462_ INVX8
XNOR2X1_59 vdd _449_ gnd _464_ _101_ NOR2X1
XOAI21X1_141 gnd vdd _102_ _462__bF$buf3 _466_ _447_ OAI21X1
XAOI21X1_47 gnd vdd _464_ _462__bF$buf3 _467_ _466_ AOI21X1
XOAI21X1_142 gnd vdd reg_cont _447_ _468_ _441_ OAI21X1
XOAI22X1_8 gnd vdd _467_ _468_ _460_ _441_ _528_<1> OAI22X1
XOAI21X1_143 gnd vdd dw04_cs dw00_cs _469_ _439_ OAI21X1
XOAI21X1_144 gnd vdd _121_ _449_ _470_ _462__bF$buf3 OAI21X1
XAND2X2_16 vdd gnd _470_ _469_ _471_ AND2X2
XOAI21X1_145 gnd vdd read_08_data<2> _462__bF$buf4 _472_ _471_ OAI21X1
XINVX1_117 _472_ _528_<2> vdd gnd INVX1
XOAI21X1_146 gnd vdd _142_ _449_ _473_ _462__bF$buf2 OAI21X1
XAND2X2_17 vdd gnd _473_ _469_ _474_ AND2X2
XOAI21X1_147 gnd vdd read_08_data<3> _462__bF$buf2 _475_ _474_ OAI21X1
XINVX1_118 _475_ _528_<3> vdd gnd INVX1
XOAI21X1_148 gnd vdd _162_ _449_ _476_ _462__bF$buf2 OAI21X1
XAND2X2_18 vdd gnd _476_ _469_ _477_ AND2X2
XOAI21X1_149 gnd vdd read_08_data<4> _462__bF$buf2 _478_ _477_ OAI21X1
XINVX1_119 _478_ _528_<4> vdd gnd INVX1
XOAI21X1_150 gnd vdd _180_ _449_ _479_ _462__bF$buf4 OAI21X1
XAND2X2_19 vdd gnd _479_ _469_ _480_ AND2X2
XOAI21X1_151 gnd vdd read_08_data<5> _462__bF$buf4 _481_ _480_ OAI21X1
XINVX1_120 _481_ _528_<5> vdd gnd INVX1
XOAI21X1_152 gnd vdd _196_ _449_ _482_ _462__bF$buf4 OAI21X1
XAND2X2_20 vdd gnd _482_ _469_ _483_ AND2X2
XOAI21X1_153 gnd vdd read_08_data<6> _462__bF$buf2 _484_ _483_ OAI21X1
XINVX1_121 _484_ _528_<6> vdd gnd INVX1
XOAI21X1_154 gnd vdd _232_ _449_ _485_ _462__bF$buf4 OAI21X1
XAND2X2_21 vdd gnd _485_ _469_ _486_ AND2X2
XOAI21X1_155 gnd vdd read_08_data<7> _462__bF$buf2 _487_ _486_ OAI21X1
XINVX1_122 _487_ _528_<7> vdd gnd INVX1
XOAI21X1_156 gnd vdd _246_ _449_ _488_ _462__bF$buf1 OAI21X1
XAND2X2_22 vdd gnd _488_ _469_ _489_ AND2X2
XOAI21X1_157 gnd vdd read_08_data<8> _462__bF$buf1 _490_ _489_ OAI21X1
XINVX1_123 _490_ _528_<8> vdd gnd INVX1
XOAI21X1_158 gnd vdd _268_ _449_ _491_ _462__bF$buf1 OAI21X1
XAND2X2_23 vdd gnd _491_ _469_ _492_ AND2X2
XOAI21X1_159 gnd vdd read_08_data<9> _462__bF$buf0 _493_ _492_ OAI21X1
XINVX1_124 _493_ _528_<9> vdd gnd INVX1
XOAI21X1_160 gnd vdd _293_ _449_ _494_ _462__bF$buf0 OAI21X1
XAND2X2_24 vdd gnd _494_ _469_ _495_ AND2X2
XOAI21X1_161 gnd vdd read_08_data<10> _462__bF$buf4 _496_ _495_ OAI21X1
XINVX1_125 _496_ _528_<10> vdd gnd INVX1
XOAI21X1_162 gnd vdd _306_ _449_ _497_ _462__bF$buf0 OAI21X1
XAND2X2_25 vdd gnd _497_ _469_ _498_ AND2X2
XOAI21X1_163 gnd vdd read_08_data<11> _462__bF$buf0 _499_ _498_ OAI21X1
XINVX1_126 _499_ _528_<11> vdd gnd INVX1
XOAI21X1_164 gnd vdd _323_ _449_ _500_ _462__bF$buf1 OAI21X1
XAND2X2_26 vdd gnd _500_ _469_ _501_ AND2X2
XOAI21X1_165 gnd vdd read_08_data<12> _462__bF$buf1 _502_ _501_ OAI21X1
XINVX1_127 _502_ _528_<12> vdd gnd INVX1
XOAI21X1_166 gnd vdd _332_ _449_ _503_ _462__bF$buf0 OAI21X1
XAND2X2_27 vdd gnd _503_ _469_ _504_ AND2X2
XOAI21X1_167 gnd vdd read_08_data<13> _462__bF$buf0 _505_ _504_ OAI21X1
XINVX1_128 _505_ _528_<13> vdd gnd INVX1
XOAI21X1_168 gnd vdd _377_ _449_ _506_ _462__bF$buf3 OAI21X1
XAND2X2_28 vdd gnd _506_ _469_ _507_ AND2X2
XOAI21X1_169 gnd vdd read_08_data<14> _462__bF$buf3 _508_ _507_ OAI21X1
XINVX1_129 _508_ _528_<14> vdd gnd INVX1
XOAI21X1_170 gnd vdd _414_ _449_ _509_ _462__bF$buf3 OAI21X1
.ends timer
 