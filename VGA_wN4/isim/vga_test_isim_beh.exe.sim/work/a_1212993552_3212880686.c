/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Ajda/Documents/Projekti/VGA/hsync.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546454082_3965413181(char *, char *, char *, int );


static void work_a_1212993552_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;

LAB0:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5192);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5256);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5320);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 5384);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 10U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 992U);
    t8 = xsi_signal_has_event(t1);
    if (t8 == 1)
        goto LAB5;

LAB6:    t3 = (unsigned char)0;

LAB7:    if (t3 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    if (t12 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 8456U);
    t15 = (1280 + 96);
    t8 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t2, t1, t15);
    if (t8 == 1)
        goto LAB14;

LAB15:    t3 = (unsigned char)0;

LAB16:    if (t3 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 5448);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB12:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 8456U);
    t3 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t2, t1, 1280);
    if (t3 != 0)
        goto LAB17;

LAB19:
LAB18:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 8456U);
    t15 = (1600 - 1);
    t3 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t2, t1, t15);
    if (t3 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(116, ng0);
    t1 = (t0 + 5576);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB21:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 8456U);
    t3 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t2, t1, 1280);
    if (t3 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 5640);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB24:
LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB7;

LAB8:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 5448);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(98, ng0);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t2 = t1;
    memset(t2, (unsigned char)2, 10U);
    t4 = (t0 + 5512);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    memcpy(t13, t1, 10U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 5576);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 5640);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 5704);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

LAB11:    xsi_set_current_line(104, ng0);
    t6 = (t0 + 5448);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    t14 = (t13 + 56U);
    t18 = *((char **)t14);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    goto LAB12;

LAB14:    t4 = (t0 + 2792U);
    t5 = *((char **)t4);
    t4 = (t0 + 8456U);
    t16 = (1280 + 96);
    t17 = (t16 + 192);
    t9 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t5, t4, t17);
    t3 = t9;
    goto LAB16;

LAB17:    xsi_set_current_line(109, ng0);
    t4 = (t0 + 2792U);
    t5 = *((char **)t4);
    t19 = (10 - 10);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t4 = (t5 + t21);
    t6 = (t0 + 5512);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    t14 = (t13 + 56U);
    t18 = *((char **)t14);
    memcpy(t18, t4, 10U);
    xsi_driver_first_trans_fast(t6);
    goto LAB18;

LAB20:    xsi_set_current_line(114, ng0);
    t4 = (t0 + 5576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);
    goto LAB21;

LAB23:    xsi_set_current_line(119, ng0);
    t4 = (t0 + 5640);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);
    goto LAB24;

}


extern void work_a_1212993552_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1212993552_3212880686_p_0};
	xsi_register_didat("work_a_1212993552_3212880686", "isim/vga_test_isim_beh.exe.sim/work/a_1212993552_3212880686.didat");
	xsi_register_executes(pe);
}
