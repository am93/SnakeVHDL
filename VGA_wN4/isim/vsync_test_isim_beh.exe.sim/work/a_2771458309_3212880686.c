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
static const char *ng0 = "C:/Users/Ajda/Documents/Projekti/VGA/vsync.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546454082_3965413181(char *, char *, char *, int );


static void work_a_2771458309_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(80, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5384);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5256);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2771458309_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(81, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5448);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5272);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2771458309_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(82, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 5512);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 9U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5288);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2771458309_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    int t17;
    char *t18;

LAB0:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5304);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(87, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t2 = (t0 + 8268U);
    t15 = (480 + 10);
    t3 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t4, t2, t15);
    if (t3 == 1)
        goto LAB14;

LAB15:    t1 = (unsigned char)0;

LAB16:    t7 = (!(t1));
    if (t7 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 5576);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB12:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t2 = (t0 + 8268U);
    t1 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t4, t2, 480);
    if (t1 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 5640);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB18:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(88, ng0);
    t4 = (t0 + 5576);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 5640);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(92, ng0);
    t11 = (t0 + 5576);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t18 = *((char **)t14);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t11);
    goto LAB12;

LAB14:    t5 = (t0 + 2312U);
    t8 = *((char **)t5);
    t5 = (t0 + 8268U);
    t16 = (480 + 10);
    t17 = (t16 + 2);
    t6 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t8, t5, t17);
    t1 = t6;
    goto LAB16;

LAB17:    xsi_set_current_line(97, ng0);
    t5 = (t0 + 5640);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t5);
    goto LAB18;

}


extern void work_a_2771458309_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2771458309_3212880686_p_0,(void *)work_a_2771458309_3212880686_p_1,(void *)work_a_2771458309_3212880686_p_2,(void *)work_a_2771458309_3212880686_p_3};
	xsi_register_didat("work_a_2771458309_3212880686", "isim/vsync_test_isim_beh.exe.sim/work/a_2771458309_3212880686.didat");
	xsi_register_executes(pe);
}
