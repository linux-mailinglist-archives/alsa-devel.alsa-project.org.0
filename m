Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A876FE35D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3011019;
	Wed, 10 May 2023 19:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3011019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740518;
	bh=lzbfOrMnkBzE7HRqjQQ+zyEYl5sZ4DL0g8LfJkYN9bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cpR7uOHOvcnIPynlZKID5nxPU3OGALWqLUbTBn5CYUK2u79xNZq30Ef+1elQD9JQX
	 Ca4ZXDFGcMfqFCuycV8k+eNrRpdfweTO27lF+GxBNfbDSx2B8BrL35piWEF2RBVUrP
	 Tthw6CQUkNs0f+5fU9Xa1r4p3PLPN/xtELwaXClE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C64F8032D;
	Wed, 10 May 2023 19:39:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C532F80579; Wed, 10 May 2023 19:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D0DBF8052E
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D0DBF8052E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 2EF592423F;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tTC-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Dowland <jon@dow.land>
Subject: [PATCH 06/14] ALSA: emu10k1: simplify tone control switch DSP code
Date: Wed, 10 May 2023 19:39:09 +0200
Message-Id: <20230510173917.3073107-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFW66O2Y6GZCHNP4LZCU6PMHPKV6WXVP
X-Message-ID-Hash: ZFW66O2Y6GZCHNP4LZCU6PMHPKV6WXVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFW66O2Y6GZCHNP4LZCU6PMHPKV6WXVP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using lots of instructions to mix wet and dry signals,
simply skip over the whole code block if tone control is disabled.
This also allows us doing away with the "shadow" playback channels.

Tested-by: Jonathan Dowland <jon@dow.land>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 123 ++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 73 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 2e139ae8b41b..2da1f9f1fb5a 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1211,10 +1211,10 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	int err, z, gpr, nctl;
 	int bit_shifter16;
 	const int playback = 10;
-	const int capture = playback + (SND_EMU10K1_PLAYBACK_CHANNELS * 2); /* we reserve 10 voices */
+	const int capture = playback + SND_EMU10K1_PLAYBACK_CHANNELS; /* we reserve 10 voices */
 	const int stereo_mix = capture + 2;
 	const int tmp = 0x88;
-	u32 ptr;
+	u32 ptr, ptr_skip;
 	struct snd_emu10k1_fx8010_code *icode = NULL;
 	struct snd_emu10k1_fx8010_control_gpr *controls = NULL, *ctl;
 	u32 *gpr_map;
@@ -1474,18 +1474,6 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	/*
 	 *  Process tone control
 	 */
-	A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 0), A_GPR(playback + 0), A_C_00000000, A_C_00000000); /* left */
-	A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 1), A_GPR(playback + 1), A_C_00000000, A_C_00000000); /* right */
-	A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 2), A_GPR(playback + 2), A_C_00000000, A_C_00000000); /* rear left */
-	A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 3), A_GPR(playback + 3), A_C_00000000, A_C_00000000); /* rear right */
-	A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 4), A_GPR(playback + 4), A_C_00000000, A_C_00000000); /* center */
-	A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 5), A_GPR(playback + 5), A_C_00000000, A_C_00000000); /* LFE */
-	if (emu->card_capabilities->spk71) {
-		A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 6), A_GPR(playback + 6), A_C_00000000, A_C_00000000); /* side left */
-		A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 7), A_GPR(playback + 7), A_C_00000000, A_C_00000000); /* side right */
-	}
-	
-
 	ctl = &controls[nctl + 0];
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, "Tone Control - Bass");
@@ -1515,12 +1503,19 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 			controls[nctl + 1].gpr[z * 2 + j] = TREBLE_GPR + z * 2 + j;
 		}
 	}
+	nctl += 2;
+
+	A_OP(icode, &ptr, iACC3, A_C_00000000, A_GPR(gpr), A_C_00000000, A_C_00000000);
+	snd_emu10k1_init_mono_onoff_control(controls + nctl++, "Tone Control - Switch", gpr, 0);
+	gpr++;
+	A_OP(icode, &ptr, iSKIP, A_GPR_COND, A_GPR_COND, A_CC_REG_ZERO, A_GPR(gpr));
+	ptr_skip = ptr;
 	for (z = 0; z < 4; z++) {		/* front/rear/center-lfe/side */
 		int j, k, l, d;
 		for (j = 0; j < 2; j++) {	/* left/right */
 			k = 0xb0 + (z * 8) + (j * 4);
 			l = 0xe0 + (z * 8) + (j * 4);
-			d = playback + SND_EMU10K1_PLAYBACK_CHANNELS + z * 2 + j;
+			d = playback + z * 2 + j;
 
 			A_OP(icode, &ptr, iMAC0, A_C_00000000, A_C_00000000, A_GPR(d), A_GPR(BASS_GPR + 0 + j));
 			A_OP(icode, &ptr, iMACMV, A_GPR(k+1), A_GPR(k), A_GPR(k+1), A_GPR(BASS_GPR + 4 + j));
@@ -1542,47 +1537,38 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 				break;
 		}
 	}
-	nctl += 2;
+	gpr_map[gpr++] = ptr - ptr_skip;
 
 #undef BASS_GPR
 #undef TREBLE_GPR
 
-	for (z = 0; z < 8; z++) {
-		A_SWITCH(icode, &ptr, tmp + 0, playback + SND_EMU10K1_PLAYBACK_CHANNELS + z, gpr);
-		A_SWITCH_NEG(icode, &ptr, tmp + 1, gpr);
-		A_SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
-		A_OP(icode, &ptr, iACC3, A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + z), A_GPR(tmp + 0), A_GPR(tmp + 1), A_C_00000000);
-	}
-	snd_emu10k1_init_mono_onoff_control(controls + nctl++, "Tone Control - Switch", gpr, 0);
-	gpr++;
-
 	/* Master volume (will be renamed later) */
 	for (z = 0; z < 8; z++)
-		A_OP(icode, &ptr, iMAC0, A_GPR(playback+z+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+z+SND_EMU10K1_PLAYBACK_CHANNELS));
+		A_OP(icode, &ptr, iMAC0, A_GPR(playback+z), A_C_00000000, A_GPR(gpr), A_GPR(playback+z));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Wave Master Playback Volume", gpr, 0);
 	gpr += 2;
 
 	/* analog speakers */
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_AFRONT_L, A_EXTOUT_AFRONT_R, playback + SND_EMU10K1_PLAYBACK_CHANNELS);
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_AREAR_L, A_EXTOUT_AREAR_R, playback+2 + SND_EMU10K1_PLAYBACK_CHANNELS);
-	A_PUT_OUTPUT(A_EXTOUT_ACENTER, playback+4 + SND_EMU10K1_PLAYBACK_CHANNELS);
-	A_PUT_OUTPUT(A_EXTOUT_ALFE, playback+5 + SND_EMU10K1_PLAYBACK_CHANNELS);
+	A_PUT_STEREO_OUTPUT(A_EXTOUT_AFRONT_L, A_EXTOUT_AFRONT_R, playback);
+	A_PUT_STEREO_OUTPUT(A_EXTOUT_AREAR_L, A_EXTOUT_AREAR_R, playback+2);
+	A_PUT_OUTPUT(A_EXTOUT_ACENTER, playback+4);
+	A_PUT_OUTPUT(A_EXTOUT_ALFE, playback+5);
 	if (emu->card_capabilities->spk71)
-		A_PUT_STEREO_OUTPUT(A_EXTOUT_ASIDE_L, A_EXTOUT_ASIDE_R, playback+6 + SND_EMU10K1_PLAYBACK_CHANNELS);
+		A_PUT_STEREO_OUTPUT(A_EXTOUT_ASIDE_L, A_EXTOUT_ASIDE_R, playback+6);
 
 	/* headphone */
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_HEADPHONE_L, A_EXTOUT_HEADPHONE_R, playback + SND_EMU10K1_PLAYBACK_CHANNELS);
+	A_PUT_STEREO_OUTPUT(A_EXTOUT_HEADPHONE_L, A_EXTOUT_HEADPHONE_R, playback);
 
 	/* digital outputs */
 	/* A_PUT_STEREO_OUTPUT(A_EXTOUT_FRONT_L, A_EXTOUT_FRONT_R, playback + SND_EMU10K1_PLAYBACK_CHANNELS); */
 	if (emu->card_capabilities->emu_model) {
 		/* EMU1010 Outputs from PCM Front, Rear, Center, LFE, Side */
 		dev_info(emu->card->dev, "EMU outputs on\n");
 		for (z = 0; z < 8; z++) {
 			if (emu->card_capabilities->ca0108_chip) {
-				A_OP(icode, &ptr, iACC3, A3_EMU32OUT(z), A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + z), A_C_00000000, A_C_00000000);
+				A_OP(icode, &ptr, iACC3, A3_EMU32OUT(z), A_GPR(playback + z), A_C_00000000, A_C_00000000);
 			} else {
-				A_OP(icode, &ptr, iACC3, A_EMU32OUTL(z), A_GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + z), A_C_00000000, A_C_00000000);
+				A_OP(icode, &ptr, iACC3, A_EMU32OUTL(z), A_GPR(playback + z), A_C_00000000, A_C_00000000);
 			}
 		}
 	}
@@ -1598,7 +1584,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 		A_OP(icode, &ptr, iANDXOR, A_GPR(tmp + 2), A_GPR(tmp + 2), A_GPR(gpr - 1), A_C_00000000);
 		A_SWITCH(icode, &ptr, tmp + 0, tmp + 2, gpr + z);
 		A_SWITCH_NEG(icode, &ptr, tmp + 1, gpr + z);
-		A_SWITCH(icode, &ptr, tmp + 1, playback + SND_EMU10K1_PLAYBACK_CHANNELS + z, tmp + 1);
+		A_SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
 		if ((z==1) && (emu->card_capabilities->spdif_bug)) {
 			/* Due to a SPDIF output bug on some Audigy cards, this code delays the Right channel by 1 sample */
 			dev_info(emu->card->dev,
@@ -1613,13 +1599,13 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	snd_emu10k1_init_stereo_onoff_control(controls + nctl++, SNDRV_CTL_NAME_IEC958("Optical Raw ",PLAYBACK,SWITCH), gpr, 0);
 	gpr += 2;
 	
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_REAR_L, A_EXTOUT_REAR_R, playback+2 + SND_EMU10K1_PLAYBACK_CHANNELS);
-	A_PUT_OUTPUT(A_EXTOUT_CENTER, playback+4 + SND_EMU10K1_PLAYBACK_CHANNELS);
-	A_PUT_OUTPUT(A_EXTOUT_LFE, playback+5 + SND_EMU10K1_PLAYBACK_CHANNELS);
+	A_PUT_STEREO_OUTPUT(A_EXTOUT_REAR_L, A_EXTOUT_REAR_R, playback+2);
+	A_PUT_OUTPUT(A_EXTOUT_CENTER, playback+4);
+	A_PUT_OUTPUT(A_EXTOUT_LFE, playback+5);
 
 	/* ADC buffer */
 #ifdef EMU10K1_CAPTURE_DIGITAL_OUT
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_ADC_CAP_L, A_EXTOUT_ADC_CAP_R, playback + SND_EMU10K1_PLAYBACK_CHANNELS);
+	A_PUT_STEREO_OUTPUT(A_EXTOUT_ADC_CAP_L, A_EXTOUT_ADC_CAP_R, playback);
 #else
 	A_PUT_OUTPUT(A_EXTOUT_ADC_CAP_L, capture);
 	A_PUT_OUTPUT(A_EXTOUT_ADC_CAP_R, capture+1);
@@ -1762,7 +1748,7 @@ static void _volume_out(struct snd_emu10k1_fx8010_code *icode, u32 *ptr, u32 dst
 static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 {
 	int err, i, z, gpr, tmp, playback, capture;
-	u32 ptr;
+	u32 ptr, ptr_skip;
 	struct snd_emu10k1_fx8010_code *icode;
 	struct snd_emu10k1_fx8010_pcm_rec *ipcm = NULL;
 	struct snd_emu10k1_fx8010_control_gpr *controls = NULL, *ctl;
@@ -1805,7 +1791,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	/* we have 12 inputs */
 	playback = SND_EMU10K1_INPUTS;
 	/* we have 6 playback channels and tone control doubles */
-	capture = playback + (SND_EMU10K1_PLAYBACK_CHANNELS * 2);
+	capture = playback + SND_EMU10K1_PLAYBACK_CHANNELS;
 	gpr = capture + SND_EMU10K1_CAPTURE_CHANNELS;
 	tmp = 0x88;	/* we need 4 temporary GPR */
 	/* from 0x8c to 0xff is the area for tone control */
@@ -2109,13 +2095,6 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	/*
 	 *  Process tone control
 	 */
-	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 0), GPR(playback + 0), C_00000000, C_00000000); /* left */
-	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 1), GPR(playback + 1), C_00000000, C_00000000); /* right */
-	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 2), GPR(playback + 2), C_00000000, C_00000000); /* rear left */
-	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 3), GPR(playback + 3), C_00000000, C_00000000); /* rear right */
-	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 4), GPR(playback + 4), C_00000000, C_00000000); /* center */
-	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 5), GPR(playback + 5), C_00000000, C_00000000); /* LFE */
-
 	ctl = &controls[i + 0];
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, "Tone Control - Bass");
@@ -2147,12 +2126,19 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 			controls[i + 1].gpr[z * 2 + j] = TREBLE_GPR + z * 2 + j;
 		}
 	}
+	i += 2;
+
+	OP(icode, &ptr, iACC3, C_00000000, GPR(gpr), C_00000000, C_00000000);
+	snd_emu10k1_init_mono_onoff_control(controls + i++, "Tone Control - Switch", gpr, 0);
+	gpr++;
+	OP(icode, &ptr, iSKIP, GPR_COND, GPR_COND, CC_REG_ZERO, GPR(gpr));
+	ptr_skip = ptr;
 	for (z = 0; z < 3; z++) {		/* front/rear/center-lfe */
 		int j, k, l, d;
 		for (j = 0; j < 2; j++) {	/* left/right */
 			k = 0xa0 + (z * 8) + (j * 4);
 			l = 0xd0 + (z * 8) + (j * 4);
-			d = playback + SND_EMU10K1_PLAYBACK_CHANNELS + z * 2 + j;
+			d = playback + z * 2 + j;
 
 			OP(icode, &ptr, iMAC0, C_00000000, C_00000000, GPR(d), GPR(BASS_GPR + 0 + j));
 			OP(icode, &ptr, iMACMV, GPR(k+1), GPR(k), GPR(k+1), GPR(BASS_GPR + 4 + j));
@@ -2174,37 +2160,28 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 				break;
 		}
 	}
-	i += 2;
+	gpr_map[gpr++] = ptr - ptr_skip;
 
 #undef BASS_GPR
 #undef TREBLE_GPR
 
-	for (z = 0; z < 6; z++) {
-		SWITCH(icode, &ptr, tmp + 0, playback + SND_EMU10K1_PLAYBACK_CHANNELS + z, gpr);
-		SWITCH_NEG(icode, &ptr, tmp + 1, gpr);
-		SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
-		OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + z), GPR(tmp + 0), GPR(tmp + 1), C_00000000);
-	}
-	snd_emu10k1_init_mono_onoff_control(controls + i++, "Tone Control - Switch", gpr, 0);
-	gpr++;
-
 	/*
 	 *  Process outputs
 	 */
 	if (emu->fx8010.extout_mask & ((1<<EXTOUT_AC97_L)|(1<<EXTOUT_AC97_R))) {
 		/* AC'97 Playback Volume */
 
 		for (z = 0; z < 2; z++)
-			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_L + z), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + z), C_00000000, C_00000000);
+			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_L + z), GPR(playback + z), C_00000000, C_00000000);
 	}
 
 	if (emu->fx8010.extout_mask & ((1<<EXTOUT_TOSLINK_L)|(1<<EXTOUT_TOSLINK_R))) {
 		/* IEC958 Optical Raw Playback Switch */
 
 		for (z = 0; z < 2; z++) {
 			SWITCH(icode, &ptr, tmp + 0, 8 + z, gpr + z);
 			SWITCH_NEG(icode, &ptr, tmp + 1, gpr + z);
-			SWITCH(icode, &ptr, tmp + 1, playback + SND_EMU10K1_PLAYBACK_CHANNELS + z, tmp + 1);
+			SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
 			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_TOSLINK_L + z), GPR(tmp + 0), GPR(tmp + 1), C_00000000);
 #ifdef EMU10K1_CAPTURE_DIGITAL_OUT
 	 		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ADC_CAP_L + z), GPR(tmp + 0), GPR(tmp + 1), C_00000000);
@@ -2219,9 +2196,9 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 		/* Headphone Playback Volume */
 
 		for (z = 0; z < 2; z++) {
-			SWITCH(icode, &ptr, tmp + 0, playback + SND_EMU10K1_PLAYBACK_CHANNELS + 4 + z, gpr + 2 + z);
+			SWITCH(icode, &ptr, tmp + 0, playback + 4 + z, gpr + 2 + z);
 			SWITCH_NEG(icode, &ptr, tmp + 1, gpr + 2 + z);
-			SWITCH(icode, &ptr, tmp + 1, playback + SND_EMU10K1_PLAYBACK_CHANNELS + z, tmp + 1);
+			SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
 			OP(icode, &ptr, iACC3, GPR(tmp + 0), GPR(tmp + 0), GPR(tmp + 1), C_00000000);
 			VOLUME_OUT(icode, &ptr, EXTOUT_HEADPHONE_L + z, tmp + 0, gpr + z);
 		}
@@ -2238,29 +2215,29 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	
 	if (emu->fx8010.extout_mask & ((1<<EXTOUT_REAR_L)|(1<<EXTOUT_REAR_R)))
 		for (z = 0; z < 2; z++)
-			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_REAR_L + z), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 2 + z), C_00000000, C_00000000);
+			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_REAR_L + z), GPR(playback + 2 + z), C_00000000, C_00000000);
 
 	if (emu->fx8010.extout_mask & ((1<<EXTOUT_AC97_REAR_L)|(1<<EXTOUT_AC97_REAR_R)))
 		for (z = 0; z < 2; z++)
-			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_REAR_L + z), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 2 + z), C_00000000, C_00000000);
+			OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_REAR_L + z), GPR(playback + 2 + z), C_00000000, C_00000000);
 
 	if (emu->fx8010.extout_mask & (1<<EXTOUT_AC97_CENTER)) {
 #ifndef EMU10K1_CENTER_LFE_FROM_FRONT
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_CENTER), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 4), C_00000000, C_00000000);
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ACENTER), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 4), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_CENTER), GPR(playback + 4), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ACENTER), GPR(playback + 4), C_00000000, C_00000000);
 #else
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_CENTER), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 0), C_00000000, C_00000000);
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ACENTER), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 0), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_CENTER), GPR(playback + 0), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ACENTER), GPR(playback + 0), C_00000000, C_00000000);
 #endif
 	}
 
 	if (emu->fx8010.extout_mask & (1<<EXTOUT_AC97_LFE)) {
 #ifndef EMU10K1_CENTER_LFE_FROM_FRONT
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_LFE), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 5), C_00000000, C_00000000);
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ALFE), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 5), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_LFE), GPR(playback + 5), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ALFE), GPR(playback + 5), C_00000000, C_00000000);
 #else
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_LFE), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 1), C_00000000, C_00000000);
-		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ALFE), GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 1), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_AC97_LFE), GPR(playback + 1), C_00000000, C_00000000);
+		OP(icode, &ptr, iACC3, EXTOUT(EXTOUT_ALFE), GPR(playback + 1), C_00000000, C_00000000);
 #endif
 	}
 	
-- 
2.40.0.152.g15d061e6df

