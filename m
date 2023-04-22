Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED296EBA38
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF38DEFF;
	Sat, 22 Apr 2023 18:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF38DEFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682179960;
	bh=Un4zv0VQV0PDxkHxzk8k+T9WmwgApul+3QLgKSe8X2E=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LLpCgZyiiX/evZkXMSjWMSWC24XuMoPPa3wGk0bZNQTo+oEFrIZS6k0M/tB1s4Cpz
	 U0K3cO4XYItpqK0plJkNiizfDF8ZXEUtLOBxjVQ3Z0LbW4eqtow+p2kFKY36PFpIM2
	 Z26ehVUtd3ErS3NPzfR7hoAykAkl7CPdQrXEmfBo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D43BF8055A;
	Sat, 22 Apr 2023 18:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA67EF8055B; Sat, 22 Apr 2023 18:10:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C39BF80510
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C39BF80510
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 929BF24212;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nan-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ALSA: emu10k1: pull in some register definitions from
 kX-project
Date: Sat, 22 Apr 2023 18:10:19 +0200
Message-Id: <20230422161021.1143903-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GTBMYSYL2GGPDAA45WVNT2KKRB2U5JP6
X-Message-ID-Hash: GTBMYSYL2GGPDAA45WVNT2KKRB2U5JP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTBMYSYL2GGPDAA45WVNT2KKRB2U5JP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For documentation purposes and later use.

Some pre-existing but (mostly) unused definitions were renamed for
consistency.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          | 78 ++++++++++++++++++++++----------
 sound/pci/emu10k1/emu10k1_main.c |  2 +-
 2 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 6927fac1aa5f..0d288cc618c1 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -61,8 +61,8 @@
 						/* the relevant bits and zero to the other bits	*/
 #define IPR_P16V		0x80000000	/* Bit set when the CA0151 P16V chip wishes
 						   to interrupt */
-#define IPR_GPIOMSG		0x20000000	/* GPIO message interrupt (RE'd, still not sure 
-						   which INTE bits enable it)			*/
+#define IPR_WATERMARK_REACHED	0x40000000
+#define IPR_A_GPIO		0x20000000	/* GPIO input pin change			*/
 
 /* The next two interrupts are for the midi port on the Audigy Drive (A_MPU1)			*/
 #define IPR_A_MIDITRANSBUFEMPTY2 0x10000000	/* MIDI UART transmit buffer empty		*/
@@ -122,10 +122,14 @@
 						/* behavior and possibly random segfaults and	*/
 						/* lockups if enabled.				*/
 
+#define INTE_A_GPIOENABLE 	0x00040000	/* Enable GPIO input change interrupts		*/
+
 /* The next two interrupts are for the midi port on the Audigy Drive (A_MPU1)			*/
 #define INTE_A_MIDITXENABLE2	0x00020000	/* Enable MIDI transmit-buffer-empty interrupts	*/
 #define INTE_A_MIDIRXENABLE2	0x00010000	/* Enable MIDI receive-buffer-empty interrupts	*/
 
+#define INTE_A_SPDIF_BUFFULL_ENABLE 	0x00008000
+#define INTE_A_SPDIF_HALFBUFFULL_ENABLE	0x00004000
 
 #define INTE_SAMPLERATETRACKER	0x00002000	/* Enable sample rate tracker interrupts	*/
 						/* NOTE: This bit must always be enabled       	*/
@@ -146,9 +150,10 @@
 #define WC			0x10		/* Wall Clock register				*/
 #define WC_SAMPLECOUNTER_MASK	0x03FFFFC0	/* Sample periods elapsed since reset		*/
 #define WC_SAMPLECOUNTER	0x14060010
-#define WC_CURRENTCHANNEL	0x0000003F	/* Channel [0..63] currently being serviced	*/
+#define WC_CURRENTCHANNEL_MASK	0x0000003F	/* Channel [0..63] currently being serviced	*/
 						/* NOTE: Each channel takes 1/64th of a sample	*/
 						/* period to be serviced.			*/
+#define WC_CURRENTCHANNEL	0x06000010
 
 #define HCFG			0x14		/* Hardware config register			*/
 						/* NOTE: There is no reason to use the legacy	*/
@@ -276,7 +281,7 @@
 						/* NOTE: After the rate is changed, a maximum	*/
 						/* of 1024 sample periods should be allowed	*/
 						/* before the new rate is guaranteed accurate.	*/
-#define TIMER_RATE_MASK		0x000003ff	/* Timer interrupt rate in sample periods	*/
+#define TIMER_RATE_MASK		0x03ff		/* Timer interrupt rate in sample periods	*/
 						/* 0 == 1024 periods, [1..4] are not useful	*/
 
 #define AC97DATA		0x1c		/* AC97 register set data register (16 bit)	*/
@@ -425,7 +430,7 @@
 
 #define CCCA			0x08		/* Filter Q, interp. ROM, byte size, cur. addr register */
 #define CCCA_RESONANCE		0xf0000000	/* Lowpass filter resonance (Q) height			*/
-#define CCCA_INTERPROMMASK	0x0e000000	/* Selects passband of interpolation ROM		*/
+#define CCCA_INTERPROM_MASK	0x0e000000	/* Selects passband of interpolation ROM		*/
 						/* 1 == full band, 7 == lowpass				*/
 						/* ROM 0 is used when pitch shifting downward or less	*/
 						/* then 3 semitones upward.  Increasingly higher ROM	*/
@@ -487,7 +492,7 @@
 						/* 0x8000-n == 666*n usec delay	       			*/
 
 #define ATKHLDV 		0x11		/* Volume envelope hold and attack register		*/
-#define ATKHLDV_PHASE0		0x00008000	/* 0 = Begin attack phase				*/
+#define ATKHLDV_PHASE0_MASK	0x00008000	/* 0 = Begin attack phase				*/
 #define ATKHLDV_HOLDTIME_MASK	0x00007f00	/* Envelope hold time (127-n == n*88.2msec)		*/
 #define ATKHLDV_ATTACKTIME_MASK	0x0000007f	/* Envelope attack time, log encoded			*/
 						/* 0 = infinite, 1 = 10.9msec, ... 0x7f = 5.5msec	*/
@@ -510,7 +515,7 @@
 						/* 0x8000-n == 666*n usec delay				*/
 
 #define ATKHLDM			0x15		/* Modulation envelope hold and attack register		*/
-#define ATKHLDM_PHASE0		0x00008000	/* 0 = Begin attack phase				*/
+#define ATKHLDM_PHASE0_MASK	0x00008000	/* 0 = Begin attack phase				*/
 #define ATKHLDM_HOLDTIME	0x00007f00	/* Envelope hold time (127-n == n*42msec)		*/
 #define ATKHLDM_ATTACKTIME	0x0000007f	/* Envelope attack time, log encoded			*/
 						/* 0 = infinite, 1 = 11msec, ... 0x7f = 5.5msec		*/
@@ -839,34 +844,45 @@
 #define A_FXWC1			0x74            /* Selects 0x7f-0x60 for FX recording           */
 #define A_FXWC2			0x75		/* Selects 0x9f-0x80 for FX recording           */
 
-/* Extended Hardware Control */
-#define A_SPDIF_SAMPLERATE	0x76		/* Set the sample rate of SPDIF output		*/
-#define A_SAMPLE_RATE		0x76		/* Various sample rate settings. */
-#define A_SAMPLE_RATE_NOT_USED  0x0ffc111e	/* Bits that are not used and cannot be set. 	*/
-#define A_SAMPLE_RATE_UNKNOWN	0xf0030001	/* Bits that can be set, but have unknown use. 	*/
+#define A_EHC			0x76		/* Extended Hardware Control */
+
+#define A_SPDIF_SAMPLERATE	A_EHC		/* Set the sample rate of SPDIF output		*/
 #define A_SPDIF_RATE_MASK	0x000000e0	/* Any other values for rates, just use 48000	*/
-#define A_SPDIF_48000		0x00000000
+#define A_SPDIF_48000		0x00000000	/* kX calls this BYPASS				*/
 #define A_SPDIF_192000		0x00000020
 #define A_SPDIF_96000		0x00000040
 #define A_SPDIF_44100		0x00000080
+#define A_SPDIF_MUTED		0x000000c0
 
 #define A_I2S_CAPTURE_RATE_MASK	0x00000e00	/* This sets the capture PCM rate, but it is    */
 #define A_I2S_CAPTURE_48000	0x00000000	/* unclear if this sets the ADC rate as well.	*/
 #define A_I2S_CAPTURE_192000	0x00000200
 #define A_I2S_CAPTURE_96000	0x00000400
 #define A_I2S_CAPTURE_44100	0x00000800
 
-#define A_PCM_RATE_MASK		0x0000e000	/* This sets the playback PCM rate on the P16V	*/
-#define A_PCM_48000		0x00000000
-#define A_PCM_192000		0x00002000
-#define A_PCM_96000		0x00004000
-#define A_PCM_44100		0x00008000
+#define A_EHC_SRC48_MASK	0x0000e000	/* This sets the playback PCM rate on the P16V	*/
+#define A_EHC_SRC48_BYPASS	0x00000000
+#define A_EHC_SRC48_192		0x00002000
+#define A_EHC_SRC48_96		0x00004000
+#define A_EHC_SRC48_44		0x00008000
+#define A_EHC_SRC48_MUTED	0x0000c000
+
+#define A_EHC_P17V_TVM		0x00000001	/* Tank virtual memory mode			*/
+#define A_EHC_P17V_SEL0_MASK	0x00030000	/* Aka A_EHC_P16V_PB_RATE; 00: 48, 01: 44.1, 10: 96, 11: 192 */
+#define A_EHC_P17V_SEL1_MASK	0x000c0000
+#define A_EHC_P17V_SEL2_MASK	0x00300000
+#define A_EHC_P17V_SEL3_MASK	0x00c00000
+
+#define A_EHC_ASYNC_BYPASS	0x80000000
 
 #define A_SRT3			0x77		/* I2S0 Sample Rate Tracker Status		*/
 #define A_SRT4			0x78		/* I2S1 Sample Rate Tracker Status		*/
 #define A_SRT5			0x79		/* I2S2 Sample Rate Tracker Status		*/
 /* - default to 0x01080000 on my audigy 2 ZS --rlrevell	*/
 
+#define A_SRT_ESTSAMPLERATE	0x001fffff
+#define A_SRT_RATELOCKED	0x01000000
+
 #define A_TTDA			0x7a		/* Tank Table DMA Address			*/
 #define A_TTDD			0x7b		/* Tank Table DMA Data				*/
 
@@ -981,7 +997,7 @@
 #define EMU_HANA_WCLOCK_INT_44_1K	0x01
 #define EMU_HANA_WCLOCK_HANA_SPDIF_IN	0x02
 #define EMU_HANA_WCLOCK_HANA_ADAT_IN	0x03
-#define EMU_HANA_WCLOCK_SYNC_BNCN	0x04
+#define EMU_HANA_WCLOCK_SYNC_BNC	0x04
 #define EMU_HANA_WCLOCK_2ND_HANA	0x05
 #define EMU_HANA_WCLOCK_SRC_RESERVED	0x06
 #define EMU_HANA_WCLOCK_OFF		0x07 /* For testing, forces fallback to DEFCLOCK */
@@ -1010,23 +1026,27 @@
 #define EMU_HANA_IRQ_DOCK_LOST		0x08
 
 #define EMU_HANA_SPDIF_MODE	0x0a	/* 00xxxxx  5 bits SPDIF MODE  */
-#define EMU_HANA_SPDIF_MODE_TX_COMSUMER	0x00
+#define EMU_HANA_SPDIF_MODE_TX_CONSUMER	0x00
 #define EMU_HANA_SPDIF_MODE_TX_PRO	0x01
 #define EMU_HANA_SPDIF_MODE_TX_NOCOPY	0x02
-#define EMU_HANA_SPDIF_MODE_RX_COMSUMER	0x00
+#define EMU_HANA_SPDIF_MODE_RX_CONSUMER	0x00
 #define EMU_HANA_SPDIF_MODE_RX_PRO	0x04
 #define EMU_HANA_SPDIF_MODE_RX_NOCOPY	0x08
 #define EMU_HANA_SPDIF_MODE_RX_INVALID	0x10
 
 #define EMU_HANA_OPTICAL_TYPE	0x0b	/* 00000xx  2 bits ADAT or SPDIF in/out  */
 #define EMU_HANA_OPTICAL_IN_SPDIF	0x00
 #define EMU_HANA_OPTICAL_IN_ADAT	0x01
 #define EMU_HANA_OPTICAL_OUT_SPDIF	0x00
 #define EMU_HANA_OPTICAL_OUT_ADAT	0x02
 
 #define EMU_HANA_MIDI_IN		0x0c	/* 000000x  1 bit  Control MIDI  */
-#define EMU_HANA_MIDI_IN_FROM_HAMOA	0x00 /* HAMOA MIDI in to Alice 2 MIDI B */
-#define EMU_HANA_MIDI_IN_FROM_DOCK	0x01 /* Audio Dock MIDI in to Alice 2 MIDI B */
+#define EMU_HANA_MIDI_INA_FROM_HAMOA	0x01 /* HAMOA MIDI in to Alice 2 MIDI A */
+#define EMU_HANA_MIDI_INA_FROM_DOCK1	0x02 /* Audio Dock-1 MIDI in to Alice 2 MIDI A */
+#define EMU_HANA_MIDI_INA_FROM_DOCK2	0x03 /* Audio Dock-2 MIDI in to Alice 2 MIDI A */
+#define EMU_HANA_MIDI_INB_FROM_HAMOA	0x08 /* HAMOA MIDI in to Alice 2 MIDI B */
+#define EMU_HANA_MIDI_INB_FROM_DOCK1	0x10 /* Audio Dock-1 MIDI in to Alice 2 MIDI B */
+#define EMU_HANA_MIDI_INB_FROM_DOCK2	0x18 /* Audio Dock-2 MIDI in to Alice 2 MIDI B */
 
 #define EMU_HANA_DOCK_LEDS_1	0x0d	/* 000xxxx  4 bit  Audio Dock LEDs  */
 #define EMU_HANA_DOCK_LEDS_1_MIDI1	0x01	/* MIDI 1 LED on */
@@ -1119,6 +1139,10 @@
 
 /* 0x30 - 0x3f Unused Read only registers */
 
+// The meaning of this is not clear; kX-project just calls it "lock" in some info-only code.
+#define EMU_HANA_LOCK_STS_LO	0x38	/* 0xxxxxx  lower 6 bits */
+#define EMU_HANA_LOCK_STS_HI	0x39	/* 0xxxxxx  upper 6 bits */
+
 /************************************************************************************************/
 /* EMU1010 Audio Destinations									*/
 /************************************************************************************************/
@@ -1257,8 +1281,12 @@
 #define EMU_DST_DOCK_SPDIF_RIGHT2	0x011f	/* Audio Dock SPDIF Right, 2nd or 96kHz */
 #define EMU_DST_HANA_SPDIF_LEFT1	0x0200	/* Hana SPDIF Left, 1st or 48kHz only */
 #define EMU_DST_HANA_SPDIF_LEFT2	0x0202	/* Hana SPDIF Left, 2nd or 96kHz */
+#define EMU_DST_HANA_SPDIF_LEFT3	0x0204	/* Hana SPDIF Left, 3rd or 192kHz */
+#define EMU_DST_HANA_SPDIF_LEFT4	0x0206	/* Hana SPDIF Left, 4th or 192kHz */
 #define EMU_DST_HANA_SPDIF_RIGHT1	0x0201	/* Hana SPDIF Right, 1st or 48kHz only */
 #define EMU_DST_HANA_SPDIF_RIGHT2	0x0203	/* Hana SPDIF Right, 2nd or 96kHz */
+#define EMU_DST_HANA_SPDIF_RIGHT3	0x0205	/* Hana SPDIF Right, 3rd or 192kHz */
+#define EMU_DST_HANA_SPDIF_RIGHT4	0x0207	/* Hana SPDIF Right, 4th or 192kHz */
 #define EMU_DST_HAMOA_DAC_LEFT1	0x0300	/* Hamoa DAC Left, 1st or 48kHz only */
 #define EMU_DST_HAMOA_DAC_LEFT2	0x0302	/* Hamoa DAC Left, 2nd or 96kHz */
 #define EMU_DST_HAMOA_DAC_LEFT3	0x0304	/* Hamoa DAC Left, 3rd or 192kHz */
@@ -1409,8 +1437,12 @@
 #define EMU_SRC_HANA_ADAT	0x0400	/* Hana ADAT 8 channel in +0 to +7 */
 #define EMU_SRC_HANA_SPDIF_LEFT1	0x0500	/* Hana SPDIF Left, 1st or 48kHz only */
 #define EMU_SRC_HANA_SPDIF_LEFT2	0x0502	/* Hana SPDIF Left, 2nd or 96kHz */
+#define EMU_SRC_HANA_SPDIF_LEFT3	0x0504	/* Hana SPDIF Left, 3rd or 192kHz */
+#define EMU_SRC_HANA_SPDIF_LEFT4	0x0506	/* Hana SPDIF Left, 4th or 192kHz */
 #define EMU_SRC_HANA_SPDIF_RIGHT1	0x0501	/* Hana SPDIF Right, 1st or 48kHz only */
 #define EMU_SRC_HANA_SPDIF_RIGHT2	0x0503	/* Hana SPDIF Right, 2nd or 96kHz */
+#define EMU_SRC_HANA_SPDIF_RIGHT3	0x0505	/* Hana SPDIF Right, 3rd or 192kHz */
+#define EMU_SRC_HANA_SPDIF_RIGHT4	0x0507	/* Hana SPDIF Right, 4th or 192kHz */
 
 /* Additional inputs for 1616(M)/Microdock */
 
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 39b63c4ca1df..007c445d72bf 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1953,7 +1953,7 @@ static const unsigned char saved_regs[] = {
 	0xff /* end */
 };
 static const unsigned char saved_regs_audigy[] = {
-	A_ADCIDX, A_MICIDX, A_FXWC1, A_FXWC2, A_SAMPLE_RATE,
+	A_ADCIDX, A_MICIDX, A_FXWC1, A_FXWC2, A_EHC,
 	A_FXRT2, A_SENDAMOUNTS, A_FXRT1,
 	0xff /* end */
 };
-- 
2.40.0.152.g15d061e6df

