Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703836EBA3B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A18EF0;
	Sat, 22 Apr 2023 18:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A18EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180010;
	bh=s2zcOLUWXvUoC7EHbwZBivDq7D9q5i1JbnmZFNIQ1VU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j31op4a4tA6heCRI9F3qVNuo+8uRUpFId0wuYPp0HQ2aJRzE3KQMwEGSS6cKmxx60
	 IizieYtoLUOQGPm0VsV/Wjv0UB01dGe8Lv3+wmhs69cEy7uA4kSoYZTLSb0I5ew5Qr
	 DC6E3yZFeBIUEpAF3zhHMrTt7MFWM5jpv2zjCy3Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E53AF8052E;
	Sat, 22 Apr 2023 18:11:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E84F8057D; Sat, 22 Apr 2023 18:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EC97F804FC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC97F804FC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 926CF241BC;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nat-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ALSA: emu10k1: fixup DSP defines
Date: Sat, 22 Apr 2023 18:10:20 +0200
Message-Id: <20230422161021.1143903-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IH4NNWB7OBTFTNP7BX3ODHNT4SLA2CIM
X-Message-ID-Hash: IH4NNWB7OBTFTNP7BX3ODHNT4SLA2CIM
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IH4NNWB7OBTFTNP7BX3ODHNT4SLA2CIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Firstly, fix the distribution between public and private headers.
Otherwise, some of the already public macros wouldn't actually work, and
the SNDRV_EMU10K1_IOCTL_DBG_READ result for Audigy would be useless.

Secondly, add condition code registers for Audigy. These are just
aliases for selected constant registers, and thus are generation-
specific. At least A_CC_REG_ZERO is actually correct ...

Finally, shuffle around some defines to more logical places while at it,
and fix up some more comments.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      |  46 ++---------
 include/uapi/sound/emu10k1.h | 144 ++++++++++++++++++++++-------------
 2 files changed, 99 insertions(+), 91 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 0d288cc618c1..5958cae819fd 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -704,18 +704,15 @@
 
 #define GPSCS			0x51		/* General Purpose SPDIF channel status register	*/
 
+// Corresponding EMU10K1_DBG_* constants are in the public header
 #define DBG			0x52
 
 #define A_SPSC			0x52		/* S/PDIF Input C Channel Status			*/
 
 #define REG53			0x53		/* DO NOT PROGRAM THIS REGISTER!!! MAY DESTROY CHIP	*/
 
-#define A_DBG			 0x53
-#define A_DBG_SINGLE_STEP	 0x00020000	/* Set to zero to start dsp */
-#define A_DBG_ZC		 0x40000000	/* zero tram counter */
-#define A_DBG_STEP_ADDR		 0x000003ff
-#define A_DBG_SATURATION_OCCURED 0x20000000
-#define A_DBG_SATURATION_ADDR	 0x0ffc0000
+// Corresponding A_DBG_* constants are in the public header
+#define A_DBG			0x53
 
 // NOTE: 0x54,55,56: 64-bit (split over voices 0 & 1)
 #define SPCS0			0x54		/* SPDIF output Channel Status 0 register	*/
@@ -908,45 +905,14 @@
 #define A_FXRT_CHANNELD		0x3f000000
 
 /* 0x7f: Not used */
-/* Each FX general purpose register is 32 bits in length, all bits are used			*/
-#define FXGPREGBASE		0x100		/* FX general purpose registers base       	*/
-#define A_FXGPREGBASE		0x400		/* Audigy GPRs, 0x400 to 0x5ff			*/
 
-#define A_TANKMEMCTLREGBASE	0x100		/* Tank memory control registers base - only for Audigy */
-#define A_TANKMEMCTLREG_MASK	0x1f		/* only 5 bits used - only for Audigy */
-
-/* Tank audio data is logarithmically compressed down to 16 bits before writing to TRAM and is	*/
-/* decompressed back to 20 bits on a read.  There are a total of 160 locations, the last 32	*/
-/* locations are for external TRAM. 								*/
-#define TANKMEMDATAREGBASE	0x200		/* Tank memory data registers base     		*/
-#define TANKMEMDATAREG_MASK	0x000fffff	/* 20 bit tank audio data field			*/
-
-/* Combined address field and memory opcode or flag field.  160 locations, last 32 are external	*/
-#define TANKMEMADDRREGBASE	0x300		/* Tank memory address registers base		*/
-#define TANKMEMADDRREG_ADDR_MASK 0x000fffff	/* 20 bit tank address field			*/
-#define TANKMEMADDRREG_CLEAR	0x00800000	/* Clear tank memory				*/
-#define TANKMEMADDRREG_ALIGN	0x00400000	/* Align read or write relative to tank access	*/
-#define TANKMEMADDRREG_WRITE	0x00200000	/* Write to tank memory				*/
-#define TANKMEMADDRREG_READ	0x00100000	/* Read from tank memory			*/
-
-#define MICROCODEBASE		0x400		/* Microcode data base address			*/
+/* The public header defines the GPR and TRAM base addresses that
+ * are valid for _both_ CPU and DSP addressing. */
 
 /* Each DSP microcode instruction is mapped into 2 doublewords 					*/
 /* NOTE: When writing, always write the LO doubleword first.  Reads can be in either order.	*/
-#define LOWORD_OPX_MASK		0x000ffc00	/* Instruction operand X			*/
-#define LOWORD_OPY_MASK		0x000003ff	/* Instruction operand Y			*/
-#define HIWORD_OPCODE_MASK	0x00f00000	/* Instruction opcode				*/
-#define HIWORD_RESULT_MASK	0x000ffc00	/* Instruction result				*/
-#define HIWORD_OPA_MASK		0x000003ff	/* Instruction operand A			*/
-
-
-/* Audigy Soundcard have a different instruction format */
+#define MICROCODEBASE		0x400		/* Microcode data base address			*/
 #define A_MICROCODEBASE		0x600
-#define A_LOWORD_OPY_MASK	0x000007ff
-#define A_LOWORD_OPX_MASK	0x007ff000
-#define A_HIWORD_OPCODE_MASK	0x0f000000
-#define A_HIWORD_RESULT_MASK	0x007ff000
-#define A_HIWORD_OPA_MASK	0x000007ff
 
 
 /************************************************************************************************/
diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index 33e5228f5d8c..c8e131d6da00 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -43,13 +43,36 @@
 #define iINTERP  0x0e	/* R = A + (X * (Y - A) >> 31)  ; saturation */
 #define iSKIP    0x0f	/* R = A (cc_reg), X (count), Y (cc_test) */
 
+#define LOWORD_OPX_MASK		0x000ffc00	/* Instruction operand X			*/
+#define LOWORD_OPY_MASK		0x000003ff	/* Instruction operand Y			*/
+#define HIWORD_OPCODE_MASK	0x00f00000	/* Instruction opcode				*/
+#define HIWORD_RESULT_MASK	0x000ffc00	/* Instruction result				*/
+#define HIWORD_OPA_MASK		0x000003ff	/* Instruction operand A			*/
+
+/* Audigy Soundcards have a different instruction format */
+#define A_LOWORD_OPX_MASK	0x007ff000
+#define A_LOWORD_OPY_MASK	0x000007ff
+#define A_HIWORD_OPCODE_MASK	0x0f000000
+#define A_HIWORD_RESULT_MASK	0x007ff000
+#define A_HIWORD_OPA_MASK	0x000007ff
+
 /* GPRs */
 #define FXBUS(x)	(0x00 + (x))	/* x = 0x00 - 0x0f */
 #define EXTIN(x)	(0x10 + (x))	/* x = 0x00 - 0x0f */
 #define EXTOUT(x)	(0x20 + (x))	/* x = 0x00 - 0x0f physical outs -> FXWC low 16 bits */
 #define FXBUS2(x)	(0x30 + (x))	/* x = 0x00 - 0x0f copies of fx buses for capture -> FXWC high 16 bits */
 					/* NB: 0x31 and 0x32 are shared with Center/LFE on SB live 5.1 */
 
+#define A_FXBUS(x)	(0x00 + (x))	/* x = 0x00 - 0x3f FX buses */
+#define A_EXTIN(x)	(0x40 + (x))	/* x = 0x00 - 0x0f physical ins */
+#define A_P16VIN(x)	(0x50 + (x))	/* x = 0x00 - 0x0f p16v ins (A2 only) "EMU32 inputs" */
+#define A_EXTOUT(x)	(0x60 + (x))	/* x = 0x00 - 0x1f physical outs -> A_FXWC1 0x79-7f unknown   */
+#define A_FXBUS2(x)	(0x80 + (x))	/* x = 0x00 - 0x1f extra outs used for EFX capture -> A_FXWC2 */
+#define A_EMU32OUTH(x)	(0xa0 + (x))	/* x = 0x00 - 0x0f "EMU32_OUT_10 - _1F" */
+#define A_EMU32OUTL(x)	(0xb0 + (x))	/* x = 0x00 - 0x0f "EMU32_OUT_01 - _0F" */
+#define A3_EMU32IN(x)	(0x160 + (x))	/* x = 0x00 - 0x1f "EMU32_IN_00 - _1F" - Only when .device = 0x0008 */
+#define A3_EMU32OUT(x)	(0x1E0 + (x))	/* x = 0x00 - 0x1f "EMU32_OUT_00 - _1F" - Only when .device = 0x0008 */
+
 #define C_00000000	0x40
 #define C_00000001	0x41
 #define C_00000002	0x42
@@ -78,38 +101,88 @@
 #define GPR_NOISE1	0x59		/* noise source */
 #define GPR_IRQ		0x5a		/* IRQ register */
 #define GPR_DBAC	0x5b		/* TRAM Delay Base Address Counter */
+
+/* Audigy constants */
+#define A_C_00000000	0xc0
+#define A_C_00000001	0xc1
+#define A_C_00000002	0xc2
+#define A_C_00000003	0xc3
+#define A_C_00000004	0xc4
+#define A_C_00000008	0xc5
+#define A_C_00000010	0xc6
+#define A_C_00000020	0xc7
+#define A_C_00000100	0xc8
+#define A_C_00010000	0xc9
+#define A_C_00000800	0xca
+#define A_C_10000000	0xcb
+#define A_C_20000000	0xcc
+#define A_C_40000000	0xcd
+#define A_C_80000000	0xce
+#define A_C_7fffffff	0xcf
+#define A_C_ffffffff	0xd0
+#define A_C_fffffffe	0xd1
+#define A_C_c0000000	0xd2
+#define A_C_4f1bbcdc	0xd3
+#define A_C_5a7ef9db	0xd4
+#define A_C_00100000	0xd5
+#define A_GPR_ACCU	0xd6		/* ACCUM, accumulator */
+#define A_GPR_COND	0xd7		/* CCR, condition register */
+#define A_GPR_NOISE0	0xd8		/* noise source */
+#define A_GPR_NOISE1	0xd9		/* noise source */
+#define A_GPR_IRQ	0xda		/* IRQ register */
+#define A_GPR_DBAC	0xdb		/* TRAM Delay Base Address Counter - internal */
+#define A_GPR_DBACE	0xde		/* TRAM Delay Base Address Counter - external */
+
+/* Each FX general purpose register is 32 bits in length, all bits are used			*/
+#define FXGPREGBASE		0x100		/* FX general purpose registers base       	*/
+#define A_FXGPREGBASE		0x400		/* Audigy GPRs, 0x400 to 0x5ff			*/
+
+#define A_TANKMEMCTLREGBASE	0x100		/* Tank memory control registers base - only for Audigy */
+#define A_TANKMEMCTLREG_MASK	0x1f		/* only 5 bits used - only for Audigy */
+
+/* Tank audio data is logarithmically compressed down to 16 bits before writing to TRAM and is	*/
+/* decompressed back to 20 bits on a read.  There are a total of 160 locations, the last 32	*/
+/* locations are for external TRAM. 								*/
+#define TANKMEMDATAREGBASE	0x200		/* Tank memory data registers base     		*/
+#define TANKMEMDATAREG_MASK	0x000fffff	/* 20 bit tank audio data field			*/
+
+/* Combined address field and memory opcode or flag field.  160 locations, last 32 are external	*/
+#define TANKMEMADDRREGBASE	0x300		/* Tank memory address registers base		*/
+#define TANKMEMADDRREG_ADDR_MASK 0x000fffff	/* 20 bit tank address field			*/
+#define TANKMEMADDRREG_CLEAR	0x00800000	/* Clear tank memory				*/
+#define TANKMEMADDRREG_ALIGN	0x00400000	/* Align read or write relative to tank access	*/
+#define TANKMEMADDRREG_WRITE	0x00200000	/* Write to tank memory				*/
+#define TANKMEMADDRREG_READ	0x00100000	/* Read from tank memory			*/
+
 #define GPR(x)		(FXGPREGBASE + (x)) /* free GPRs: x = 0x00 - 0xff */
 #define ITRAM_DATA(x)	(TANKMEMDATAREGBASE + 0x00 + (x)) /* x = 0x00 - 0x7f */
 #define ETRAM_DATA(x)	(TANKMEMDATAREGBASE + 0x80 + (x)) /* x = 0x00 - 0x1f */
 #define ITRAM_ADDR(x)	(TANKMEMADDRREGBASE + 0x00 + (x)) /* x = 0x00 - 0x7f */
 #define ETRAM_ADDR(x)	(TANKMEMADDRREGBASE + 0x80 + (x)) /* x = 0x00 - 0x1f */
 
+#define A_GPR(x)	(A_FXGPREGBASE + (x))
 #define A_ITRAM_DATA(x)	(TANKMEMDATAREGBASE + 0x00 + (x)) /* x = 0x00 - 0xbf */
 #define A_ETRAM_DATA(x)	(TANKMEMDATAREGBASE + 0xc0 + (x)) /* x = 0x00 - 0x3f */
 #define A_ITRAM_ADDR(x)	(TANKMEMADDRREGBASE + 0x00 + (x)) /* x = 0x00 - 0xbf */
 #define A_ETRAM_ADDR(x)	(TANKMEMADDRREGBASE + 0xc0 + (x)) /* x = 0x00 - 0x3f */
 #define A_ITRAM_CTL(x)	(A_TANKMEMCTLREGBASE + 0x00 + (x)) /* x = 0x00 - 0xbf */
 #define A_ETRAM_CTL(x)	(A_TANKMEMCTLREGBASE + 0xc0 + (x)) /* x = 0x00 - 0x3f */
 
-#define A_FXBUS(x)	(0x00 + (x))	/* x = 0x00 - 0x3f FX buses */
-#define A_EXTIN(x)	(0x40 + (x))	/* x = 0x00 - 0x0f physical ins */
-#define A_P16VIN(x)	(0x50 + (x))	/* x = 0x00 - 0x0f p16v ins (A2 only) "EMU32 inputs" */
-#define A_EXTOUT(x)	(0x60 + (x))	/* x = 0x00 - 0x1f physical outs -> A_FXWC1 0x79-7f unknown   */
-#define A_FXBUS2(x)	(0x80 + (x))	/* x = 0x00 - 0x1f extra outs used for EFX capture -> A_FXWC2 */
-#define A_EMU32OUTH(x)	(0xa0 + (x))	/* x = 0x00 - 0x0f "EMU32_OUT_10 - _1F" - ??? */
-#define A_EMU32OUTL(x)	(0xb0 + (x))	/* x = 0x00 - 0x0f "EMU32_OUT_1 - _F" - ??? */
-#define A3_EMU32IN(x)	(0x160 + (x))	/* x = 0x00 - 0x3f "EMU32_IN_00 - _3F" - Only when .device = 0x0008 */
-#define A3_EMU32OUT(x)	(0x1E0 + (x))	/* x = 0x00 - 0x0f "EMU32_OUT_00 - _3F" - Only when .device = 0x0008 */
-#define A_GPR(x)	(A_FXGPREGBASE + (x))
-
 /* cc_reg constants */
 #define CC_REG_NORMALIZED C_00000001
 #define CC_REG_BORROW	C_00000002
 #define CC_REG_MINUS	C_00000004
 #define CC_REG_ZERO	C_00000008
 #define CC_REG_SATURATE	C_00000010
 #define CC_REG_NONZERO	C_00000100
 
+#define A_CC_REG_NORMALIZED	A_C_00000001
+#define A_CC_REG_BORROW		A_C_00000002
+#define A_CC_REG_MINUS		A_C_00000004
+#define A_CC_REG_ZERO		A_C_00000008
+#define A_CC_REG_SATURATE	A_C_00000010
+#define A_CC_REG_NONZERO	A_C_00000100
+
 /* FX buses */
 // These are arbitrary mappings; our DSP code simply expects
 // the config files to route the channels this way.
@@ -203,54 +276,23 @@
 #define A_EXTOUT_ADC_CAP_R	0x17	/*                    right */
 #define A_EXTOUT_MIC_CAP	0x18	/* Mic capture buffer */
 
-/* Audigy constants */
-#define A_C_00000000	0xc0
-#define A_C_00000001	0xc1
-#define A_C_00000002	0xc2
-#define A_C_00000003	0xc3
-#define A_C_00000004	0xc4
-#define A_C_00000008	0xc5
-#define A_C_00000010	0xc6
-#define A_C_00000020	0xc7
-#define A_C_00000100	0xc8
-#define A_C_00010000	0xc9
-#define A_C_00000800	0xca
-#define A_C_10000000	0xcb
-#define A_C_20000000	0xcc
-#define A_C_40000000	0xcd
-#define A_C_80000000	0xce
-#define A_C_7fffffff	0xcf
-#define A_C_ffffffff	0xd0
-#define A_C_fffffffe	0xd1
-#define A_C_c0000000	0xd2
-#define A_C_4f1bbcdc	0xd3
-#define A_C_5a7ef9db	0xd4
-#define A_C_00100000	0xd5
-#define A_GPR_ACCU	0xd6		/* ACCUM, accumulator */
-#define A_GPR_COND	0xd7		/* CCR, condition register */
-#define A_GPR_NOISE0	0xd8		/* noise source */
-#define A_GPR_NOISE1	0xd9		/* noise source */
-#define A_GPR_IRQ	0xda		/* IRQ register */
-#define A_GPR_DBAC	0xdb		/* TRAM Delay Base Address Counter - internal */
-#define A_GPR_DBACE	0xde		/* TRAM Delay Base Address Counter - external */
-
-/* definitions for debug register */
+/* Definitions for debug register. Note that these are for emu10k1 ONLY. */
 #define EMU10K1_DBG_ZC			0x80000000	/* zero tram counter */
 #define EMU10K1_DBG_SATURATION_OCCURED	0x02000000	/* saturation control */
 #define EMU10K1_DBG_SATURATION_ADDR	0x01ff0000	/* saturation address */
 #define EMU10K1_DBG_SINGLE_STEP		0x00008000	/* single step mode */
 #define EMU10K1_DBG_STEP		0x00004000	/* start single step */
 #define EMU10K1_DBG_CONDITION_CODE	0x00003e00	/* condition code */
 #define EMU10K1_DBG_SINGLE_STEP_ADDR	0x000001ff	/* single step address */
 
-/* tank memory address line */
-#ifndef __KERNEL__
-#define TANKMEMADDRREG_ADDR_MASK 0x000fffff	/* 20 bit tank address field			*/
-#define TANKMEMADDRREG_CLEAR	 0x00800000	/* Clear tank memory				*/
-#define TANKMEMADDRREG_ALIGN	 0x00400000	/* Align read or write relative to tank access	*/
-#define TANKMEMADDRREG_WRITE	 0x00200000	/* Write to tank memory				*/
-#define TANKMEMADDRREG_READ	 0x00100000	/* Read from tank memory			*/
-#endif
+/* Definitions for emu10k2 debug register. */
+#define A_DBG_ZC			0x40000000	/* zero tram counter */
+#define A_DBG_SATURATION_OCCURED	0x20000000
+#define A_DBG_SATURATION_ADDR		0x0ffc0000
+#define A_DBG_SINGLE_STEP		0x00020000	/* Set to zero to start dsp */
+#define A_DBG_STEP			0x00010000
+#define A_DBG_CONDITION_CODE		0x0000f800
+#define A_DBG_STEP_ADDR			0x000003ff
 
 struct snd_emu10k1_fx8010_info {
 	unsigned int internal_tram_size;	/* in samples */
-- 
2.40.0.152.g15d061e6df

