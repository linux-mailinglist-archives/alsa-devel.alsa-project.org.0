Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0571246C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 12:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2393E8;
	Fri, 26 May 2023 12:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2393E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685096405;
	bh=NeIzAMDc4UqPs6dcB7MXnVJpQ4bXQkQ4Opos2SlG6mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gruF2okxWNfsx/Wg+3vy0cOFVlHjVGlkkICmIji6ItnnaKJgcqV4klL7hOFOwWVeL
	 iYSOfPDZjY9u+Q8p+KZ8VBzt17yfRDsP/va7eQQOsCjQoZXJ+hVJxQh2BRHidzQsVG
	 nbXmKXEVR31bZxzOUej6fUGicyEDwC+mwxlHoNFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C292F805B6; Fri, 26 May 2023 12:17:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D6CF805B5;
	Fri, 26 May 2023 12:17:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CEC2F80563; Fri, 26 May 2023 12:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CAD8F80564
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAD8F80564
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D91722425D;
	Fri, 26 May 2023 06:16:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q2UVH-pwq-00; Fri, 26 May 2023 12:16:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Dowland <jon@dow.land>
Subject: [PATCH 6/6] ALSA: emu10k1: vastly improve usefulness of info in /proc
Date: Fri, 26 May 2023 12:16:59 +0200
Message-Id: <20230526101659.437969-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3T6PMP43Y7A2THFYWHX4ZV5G6F62T576
X-Message-ID-Hash: 3T6PMP43Y7A2THFYWHX4ZV5G6F62T576
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3T6PMP43Y7A2THFYWHX4ZV5G6F62T576/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Include the FX bus map, without which the already present send routing
  info would require looking up the documentation.
- Include the physical I/O channels as known to the driver
- Make the multi-channel capture map actually name the mapped input
  channels rather than "FXBUS" (Audigy) or even "???" (SbLive)
- The latter two are omitted for E-MU cards, as their physical I/O is
  routed through the FPGA
- While at it, make the "Card" field somewhat more useful

This includes de-duplicating the label tables between emuproc and emufx,
updating/improving the FX bus label table, and making the SB Live! 5.1
multi-track capture channel mapping hack data-driven.

Tested-by: Jonathan Dowland <jon@dow.land>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h     |  10 +++
 sound/pci/emu10k1/emufx.c   |  87 ++++++++++++-------
 sound/pci/emu10k1/emuproc.c | 167 ++++++++++++------------------------
 3 files changed, 120 insertions(+), 144 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 4b9dda449917..cc0151e7c828 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1440,6 +1440,16 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 
 /* 0x600 and 0x700 no used */
 
+
+/* ------------------- CONSTANTS -------------------- */
+
+extern const char * const snd_emu10k1_fxbus[32];
+extern const char * const snd_emu10k1_sblive_ins[16];
+extern const char * const snd_emu10k1_audigy_ins[16];
+extern const char * const snd_emu10k1_sblive_outs[32];
+extern const char * const snd_emu10k1_audigy_outs[32];
+extern const s8 snd_emu10k1_sblive51_fxbus2_map[16];
+
 /* ------------------- STRUCTURES -------------------- */
 
 enum {
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index e9855d37fa5c..9904bcfee106 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -46,26 +46,45 @@ MODULE_PARM_DESC(high_res_gpr_volume, "GPR mixer controls use 31-bit range.");
  *  Tables
  */ 
 
-static const char * const fxbuses[16] = {
+// Playback channel labels; corresponds with the public FXBUS_* defines.
+// Unlike the tables below, this is not determined by the hardware.
+const char * const snd_emu10k1_fxbus[32] = {
 	/* 0x00 */ "PCM Left",
 	/* 0x01 */ "PCM Right",
-	/* 0x02 */ "PCM Surround Left",
-	/* 0x03 */ "PCM Surround Right",
+	/* 0x02 */ "PCM Rear Left",
+	/* 0x03 */ "PCM Rear Right",
 	/* 0x04 */ "MIDI Left",
 	/* 0x05 */ "MIDI Right",
-	/* 0x06 */ "Center",
-	/* 0x07 */ "LFE",
-	/* 0x08 */ NULL,
-	/* 0x09 */ NULL,
+	/* 0x06 */ "PCM Center",
+	/* 0x07 */ "PCM LFE",
+	/* 0x08 */ "PCM Front Left",
+	/* 0x09 */ "PCM Front Right",
 	/* 0x0a */ NULL,
 	/* 0x0b */ NULL,
 	/* 0x0c */ "MIDI Reverb",
 	/* 0x0d */ "MIDI Chorus",
-	/* 0x0e */ NULL,
-	/* 0x0f */ NULL
+	/* 0x0e */ "PCM Side Left",
+	/* 0x0f */ "PCM Side Right",
+	/* 0x10 */ NULL,
+	/* 0x11 */ NULL,
+	/* 0x12 */ NULL,
+	/* 0x13 */ NULL,
+	/* 0x14 */ "Passthrough Left",
+	/* 0x15 */ "Passthrough Right",
+	/* 0x16 */ NULL,
+	/* 0x17 */ NULL,
+	/* 0x18 */ NULL,
+	/* 0x19 */ NULL,
+	/* 0x1a */ NULL,
+	/* 0x1b */ NULL,
+	/* 0x1c */ NULL,
+	/* 0x1d */ NULL,
+	/* 0x1e */ NULL,
+	/* 0x1f */ NULL
 };
 
-static const char * const creative_ins[16] = {
+// Physical inputs; corresponds with the public EXTIN_* defines.
+const char * const snd_emu10k1_sblive_ins[16] = {
 	/* 0x00 */ "AC97 Left",
 	/* 0x01 */ "AC97 Right",
 	/* 0x02 */ "TTL IEC958 Left",
@@ -84,7 +103,8 @@ static const char * const creative_ins[16] = {
 	/* 0x0f */ NULL
 };
 
-static const char * const audigy_ins[16] = {
+// Physical inputs; corresponds with the public A_EXTIN_* defines.
+const char * const snd_emu10k1_audigy_ins[16] = {
 	/* 0x00 */ "AC97 Left",
 	/* 0x01 */ "AC97 Right",
 	/* 0x02 */ "Audigy CD Left",
@@ -103,7 +123,8 @@ static const char * const audigy_ins[16] = {
 	/* 0x0f */ NULL
 };
 
-static const char * const creative_outs[32] = {
+// Physical outputs; corresponds with the public EXTOUT_* defines.
+const char * const snd_emu10k1_sblive_outs[32] = {
 	/* 0x00 */ "AC97 Left",
 	/* 0x01 */ "AC97 Right",
 	/* 0x02 */ "Optical IEC958 Left",
@@ -120,6 +141,7 @@ static const char * const creative_outs[32] = {
 	/* 0x0d */ "AC97 Surround Left",
 	/* 0x0e */ "AC97 Surround Right",
 	/* 0x0f */ NULL,
+	// This is actually the FXBUS2 range; SB Live! 5.1 only.
 	/* 0x10 */ NULL,
 	/* 0x11 */ "Analog Center",
 	/* 0x12 */ "Analog LFE",
@@ -138,7 +160,8 @@ static const char * const creative_outs[32] = {
 	/* 0x1f */ NULL,
 };
 
-static const char * const audigy_outs[32] = {
+// Physical outputs; corresponds with the public A_EXTOUT_* defines.
+const char * const snd_emu10k1_audigy_outs[32] = {
 	/* 0x00 */ "Digital Front Left",
 	/* 0x01 */ "Digital Front Right",
 	/* 0x02 */ "Digital Center",
@@ -173,6 +196,18 @@ static const char * const audigy_outs[32] = {
 	/* 0x1f */ NULL,
 };
 
+// On the SB Live! 5.1, FXBUS2[1] and FXBUS2[2] are occupied by EXTOUT_ACENTER
+// and EXTOUT_ALFE, so we can't connect inputs to them for multitrack recording.
+//
+// Since only 14 of the 16 EXTINs are used, this is not a big problem.
+// We route AC97 to FX capture 14 and 15, SPDIF_CD to FX capture 0 and 3,
+// and the rest of the EXTINs to the corresponding FX capture channel.
+// Multitrack recorders will still see the center/LFE output signal
+// on the second and third "input" channel.
+const s8 snd_emu10k1_sblive51_fxbus2_map[16] = {
+	2, -1, -1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0, 1
+};
+
 static const u32 bass_table[41][5] = {
 	{ 0x3e4f844f, 0x84ed4cc3, 0x3cc69927, 0x7b03553a, 0xc4da8486 },
 	{ 0x3e69a17a, 0x84c280fb, 0x3cd77cd4, 0x7b2f2a6f, 0xc4b08d1d },
@@ -2290,21 +2325,11 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 
 	/* EFX capture - capture the 16 EXTINS */
 	if (emu->card_capabilities->sblive51) {
-		/* On the Live! 5.1, FXBUS2(1) and FXBUS(2) are shared with EXTOUT_ACENTER
-		 * and EXTOUT_ALFE, so we can't connect inputs to them for multitrack recording.
-		 *
-		 * Since only 14 of the 16 EXTINs are used, this is not a big problem.  
-		 * We route AC97L and R to FX capture 14 and 15, SPDIF CD in to FX capture 
-		 * 0 and 3, then the rest of the EXTINs to the corresponding FX capture 
-		 * channel.  Multitrack recorders will still see the center/lfe output signal 
-		 * on the second and third channels.
-		 */
-		OP(icode, &ptr, iACC3, FXBUS2(14), C_00000000, C_00000000, EXTIN(0));
-		OP(icode, &ptr, iACC3, FXBUS2(15), C_00000000, C_00000000, EXTIN(1));
-		OP(icode, &ptr, iACC3, FXBUS2(0), C_00000000, C_00000000, EXTIN(2));
-		OP(icode, &ptr, iACC3, FXBUS2(3), C_00000000, C_00000000, EXTIN(3));
-		for (z = 4; z < 14; z++)
-			OP(icode, &ptr, iACC3, FXBUS2(z), C_00000000, C_00000000, EXTIN(z));
+		for (z = 0; z < 16; z++) {
+			s8 c = snd_emu10k1_sblive51_fxbus2_map[z];
+			if (c != -1)
+				OP(icode, &ptr, iACC3, FXBUS2(z), C_00000000, C_00000000, EXTIN(c));
+		}
 	} else {
 		for (z = 0; z < 16; z++)
 			OP(icode, &ptr, iACC3, FXBUS2(z), C_00000000, C_00000000, EXTIN(z));
@@ -2448,9 +2473,9 @@ static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
 
 	info->internal_tram_size = emu->fx8010.itram_size;
 	info->external_tram_size = emu->fx8010.etram_pages.bytes / 2;
-	fxbus = fxbuses;
-	extin = emu->audigy ? audigy_ins : creative_ins;
-	extout = emu->audigy ? audigy_outs : creative_outs;
+	fxbus = snd_emu10k1_fxbus;
+	extin = emu->audigy ? snd_emu10k1_audigy_ins : snd_emu10k1_sblive_ins;
+	extout = emu->audigy ? snd_emu10k1_audigy_outs : snd_emu10k1_sblive_outs;
 	extin_mask = emu->audigy ? ~0 : emu->fx8010.extin_mask;
 	extout_mask = emu->audigy ? ~0 : emu->fx8010.extout_mask;
 	for (res = 0; res < 16; res++, fxbus++, extin++, extout++) {
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 2eb42a9c72f5..9ba80f10e179 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -66,118 +66,22 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 static void snd_emu10k1_proc_read(struct snd_info_entry *entry, 
 				  struct snd_info_buffer *buffer)
 {
-	/* FIXME - output names are in emufx.c too */
-	static const char * const creative_outs[32] = {
-		/* 00 */ "AC97 Left",
-		/* 01 */ "AC97 Right",
-		/* 02 */ "Optical IEC958 Left",
-		/* 03 */ "Optical IEC958 Right",
-		/* 04 */ "Center",
-		/* 05 */ "LFE",
-		/* 06 */ "Headphone Left",
-		/* 07 */ "Headphone Right",
-		/* 08 */ "Surround Left",
-		/* 09 */ "Surround Right",
-		/* 10 */ "PCM Capture Left",
-		/* 11 */ "PCM Capture Right",
-		/* 12 */ "MIC Capture",
-		/* 13 */ "AC97 Surround Left",
-		/* 14 */ "AC97 Surround Right",
-		/* 15 */ "???",
-		/* 16 */ "???",
-		/* 17 */ "Analog Center",
-		/* 18 */ "Analog LFE",
-		/* 19 */ "???",
-		/* 20 */ "???",
-		/* 21 */ "???",
-		/* 22 */ "???",
-		/* 23 */ "???",
-		/* 24 */ "???",
-		/* 25 */ "???",
-		/* 26 */ "???",
-		/* 27 */ "???",
-		/* 28 */ "???",
-		/* 29 */ "???",
-		/* 30 */ "???",
-		/* 31 */ "???"
-	};
-
-	static const char * const audigy_outs[64] = {
-		/* 00 */ "Digital Front Left",
-		/* 01 */ "Digital Front Right",
-		/* 02 */ "Digital Center",
-		/* 03 */ "Digital LEF",
-		/* 04 */ "Headphone Left",
-		/* 05 */ "Headphone Right",
-		/* 06 */ "Digital Rear Left",
-		/* 07 */ "Digital Rear Right",
-		/* 08 */ "Front Left",
-		/* 09 */ "Front Right",
-		/* 10 */ "Center",
-		/* 11 */ "LFE",
-		/* 12 */ "???",
-		/* 13 */ "???",
-		/* 14 */ "Rear Left",
-		/* 15 */ "Rear Right",
-		/* 16 */ "AC97 Front Left",
-		/* 17 */ "AC97 Front Right",
-		/* 18 */ "ADC Capture Left",
-		/* 19 */ "ADC Capture Right",
-		/* 20 */ "???",
-		/* 21 */ "???",
-		/* 22 */ "???",
-		/* 23 */ "???",
-		/* 24 */ "???",
-		/* 25 */ "???",
-		/* 26 */ "???",
-		/* 27 */ "???",
-		/* 28 */ "???",
-		/* 29 */ "???",
-		/* 30 */ "???",
-		/* 31 */ "???",
-		/* 32 */ "FXBUS2_0",
-		/* 33 */ "FXBUS2_1",
-		/* 34 */ "FXBUS2_2",
-		/* 35 */ "FXBUS2_3",
-		/* 36 */ "FXBUS2_4",
-		/* 37 */ "FXBUS2_5",
-		/* 38 */ "FXBUS2_6",
-		/* 39 */ "FXBUS2_7",
-		/* 40 */ "FXBUS2_8",
-		/* 41 */ "FXBUS2_9",
-		/* 42 */ "FXBUS2_10",
-		/* 43 */ "FXBUS2_11",
-		/* 44 */ "FXBUS2_12",
-		/* 45 */ "FXBUS2_13",
-		/* 46 */ "FXBUS2_14",
-		/* 47 */ "FXBUS2_15",
-		/* 48 */ "FXBUS2_16",
-		/* 49 */ "FXBUS2_17",
-		/* 50 */ "FXBUS2_18",
-		/* 51 */ "FXBUS2_19",
-		/* 52 */ "FXBUS2_20",
-		/* 53 */ "FXBUS2_21",
-		/* 54 */ "FXBUS2_22",
-		/* 55 */ "FXBUS2_23",
-		/* 56 */ "FXBUS2_24",
-		/* 57 */ "FXBUS2_25",
-		/* 58 */ "FXBUS2_26",
-		/* 59 */ "FXBUS2_27",
-		/* 60 */ "FXBUS2_28",
-		/* 61 */ "FXBUS2_29",
-		/* 62 */ "FXBUS2_30",
-		/* 63 */ "FXBUS2_31"
-	};
-
 	struct snd_emu10k1 *emu = entry->private_data;
+	const char * const *inputs = emu->audigy ?
+		snd_emu10k1_audigy_ins : snd_emu10k1_sblive_ins;
+	const char * const *outputs = emu->audigy ?
+		snd_emu10k1_audigy_outs : snd_emu10k1_sblive_outs;
+	unsigned short extin_mask = emu->audigy ? ~0 : emu->fx8010.extin_mask;
+	unsigned short extout_mask = emu->audigy ? ~0 : emu->fx8010.extout_mask;
 	unsigned int val, val1, ptrx, psst, dsl, snda;
-	int nefx = emu->audigy ? 64 : 32;
-	const char * const *outputs = emu->audigy ? audigy_outs : creative_outs;
+	int nefx = emu->audigy ? 32 : 16;
 	int idx;
 	
 	snd_iprintf(buffer, "EMU10K1\n\n");
 	snd_iprintf(buffer, "Card                  : %s\n",
-		    emu->audigy ? "Audigy" : (emu->card_capabilities->ecard ? "EMU APS" : "Creative"));
+		    emu->card_capabilities->emu_model ? "E-MU D.A.S." :
+		    emu->card_capabilities->ecard ? "E-MU A.P.S." :
+		    emu->audigy ? "SB Audigy" : "SB Live!");
 	snd_iprintf(buffer, "Internal TRAM (words) : 0x%x\n", emu->fx8010.itram_size);
 	snd_iprintf(buffer, "External TRAM (words) : 0x%x\n", (int)emu->fx8010.etram_pages.bytes / 2);
 
@@ -211,14 +115,51 @@ static void snd_emu10k1_proc_read(struct snd_info_entry *entry,
 				(val >> 28) & 0x0f, REG_VAL_GET(DSL_FXSENDAMOUNT_D, dsl));
 		}
 	}
-	snd_iprintf(buffer, "\nCaptured FX Outputs   :\n");
-	for (idx = 0; idx < nefx; idx++) {
-		if (emu->efx_voices_mask[idx/32] & (1 << (idx%32)))
-			snd_iprintf(buffer, "  Output %02i [%s]\n", idx, outputs[idx]);
+	snd_iprintf(buffer, "\nEffect Send Targets:\n");
+	// Audigy actually has 64, but we don't use them all.
+	for (idx = 0; idx < 32; idx++) {
+		const char *c = snd_emu10k1_fxbus[idx];
+		if (c)
+			snd_iprintf(buffer, "  Channel %02i [%s]\n", idx, c);
+	}
+	if (!emu->card_capabilities->emu_model) {
+		snd_iprintf(buffer, "\nOutput Channels:\n");
+		for (idx = 0; idx < 32; idx++)
+			if (outputs[idx] && (extout_mask & (1 << idx)))
+				snd_iprintf(buffer, "  Channel %02i [%s]\n", idx, outputs[idx]);
+		snd_iprintf(buffer, "\nInput Channels:\n");
+		for (idx = 0; idx < 16; idx++)
+			if (inputs[idx] && (extin_mask & (1 << idx)))
+				snd_iprintf(buffer, "  Channel %02i [%s]\n", idx, inputs[idx]);
+		snd_iprintf(buffer, "\nMultichannel Capture Sources:\n");
+		for (idx = 0; idx < nefx; idx++)
+			if (emu->efx_voices_mask[0] & (1 << idx))
+				snd_iprintf(buffer, "  Channel %02i [Output: %s]\n",
+					    idx, outputs[idx] ? outputs[idx] : "???");
+		if (emu->audigy) {
+			for (idx = 0; idx < 32; idx++)
+				if (emu->efx_voices_mask[1] & (1 << idx))
+					snd_iprintf(buffer, "  Channel %02i [Input: %s]\n",
+						    idx + 32, inputs[idx] ? inputs[idx] : "???");
+		} else {
+			for (idx = 0; idx < 16; idx++) {
+				if (emu->efx_voices_mask[0] & ((1 << 16) << idx)) {
+					if (emu->card_capabilities->sblive51) {
+						s8 c = snd_emu10k1_sblive51_fxbus2_map[idx];
+						if (c == -1)
+							snd_iprintf(buffer, "  Channel %02i [Output: %s]\n",
+								    idx + 16, outputs[idx + 16]);
+						else
+							snd_iprintf(buffer, "  Channel %02i [Input: %s]\n",
+								    idx + 16, inputs[c]);
+					} else {
+						snd_iprintf(buffer, "  Channel %02i [Input: %s]\n",
+							    idx + 16, inputs[idx] ? inputs[idx] : "???");
+					}
+				}
+			}
+		}
 	}
-	snd_iprintf(buffer, "\nAll FX Outputs        :\n");
-	for (idx = 0; idx < (emu->audigy ? 64 : 32); idx++)
-		snd_iprintf(buffer, "  Output %02i [%s]\n", idx, outputs[idx]);
 }
 
 static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry, 
-- 
2.40.0.152.g15d061e6df

