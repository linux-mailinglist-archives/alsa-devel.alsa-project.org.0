Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A276FE366
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB200208;
	Wed, 10 May 2023 19:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB200208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740642;
	bh=zz7olly0wZzNNmQp6ekH3SBTbtV9ewvaRhP6MeJof1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPg4dvfqGRw0Tue/pUu+jJdZKmfnXt6y0df7i+/AmdIWFOxTIrQd9O5liQcLg1buy
	 5lEZ6XjuMY9OHnXFNXbj/3HKyJSxXm3zN46Qt9qZ1VrCDW6+Wtf1CfM9xWl/pelU7d
	 y0t7Tn4wYMu83Pge0o270qs0aeOKxczK1W+R6b9Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28448F805BB;
	Wed, 10 May 2023 19:40:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CCCBF8053D; Wed, 10 May 2023 19:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA252F80549
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA252F80549
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 477D924265;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tTg-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 11/14] ALSA: emu10k1: omit non-applicable mixer controls for
 E-MU cards
Date: Wed, 10 May 2023 19:39:14 +0200
Message-Id: <20230510173917.3073107-12-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VJRXTHPQACBX6JJQCDPZS4WZITV4DH5R
X-Message-ID-Hash: VJRXTHPQACBX6JJQCDPZS4WZITV4DH5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJRXTHPQACBX6JJQCDPZS4WZITV4DH5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The E-MU cards don't try very hard to be Sound Blasters. All sound I/O
goes through the Hana FPGA, thus making the regular extin/out controls
useless. Still showing them just serves to clutter up the interface and
confuse the user.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 241 +++++++++++++++++++-------------------
 1 file changed, 120 insertions(+), 121 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 01d69e496696..cdce8475bd99 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1379,87 +1379,88 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 		snd_emu10k1_init_stereo_control(&controls[nctl++], "EMU Capture Volume", gpr, 0);
 		gpr_map[gpr + 2] = 0x00000000;
 		gpr += 3;
+	} else {
+		/* AC'97 Playback Volume - used only for mic (renamed later) */
+		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AC97_L);
+		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_AC97_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++], "AMic Playback Volume", gpr, 0);
+		gpr += 2;
+		/* AC'97 Capture Volume - used only for mic */
+		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_AC97_L);
+		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_AC97_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++], "Mic Capture Volume", gpr, 0);
+		gpr += 2;
+
+		/* mic capture buffer */
+		A_OP(icode, &ptr, iINTERP, A_EXTOUT(A_EXTOUT_MIC_CAP), A_EXTIN(A_EXTIN_AC97_L), A_C_40000000, A_EXTIN(A_EXTIN_AC97_R));
+
+		/* Audigy CD Playback Volume */
+		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_SPDIF_CD_L);
+		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_SPDIF_CD_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++],
+						emu->card_capabilities->ac97_chip ? "Audigy CD Playback Volume" : "CD Playback Volume",
+						gpr, 0);
+		gpr += 2;
+		/* Audigy CD Capture Volume */
+		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_SPDIF_CD_L);
+		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_SPDIF_CD_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++],
+						emu->card_capabilities->ac97_chip ? "Audigy CD Capture Volume" : "CD Capture Volume",
+						gpr, 0);
+		gpr += 2;
+
+		/* Optical SPDIF Playback Volume */
+		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_OPT_SPDIF_L);
+		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_OPT_SPDIF_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++], SNDRV_CTL_NAME_IEC958("Optical ",PLAYBACK,VOLUME), gpr, 0);
+		gpr += 2;
+		/* Optical SPDIF Capture Volume */
+		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_OPT_SPDIF_L);
+		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_OPT_SPDIF_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++], SNDRV_CTL_NAME_IEC958("Optical ",CAPTURE,VOLUME), gpr, 0);
+		gpr += 2;
+
+		/* Line2 Playback Volume */
+		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_LINE2_L);
+		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_LINE2_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++],
+						emu->card_capabilities->ac97_chip ? "Line2 Playback Volume" : "Line Playback Volume",
+						gpr, 0);
+		gpr += 2;
+		/* Line2 Capture Volume */
+		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_LINE2_L);
+		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_LINE2_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++],
+						emu->card_capabilities->ac97_chip ? "Line2 Capture Volume" : "Line Capture Volume",
+						gpr, 0);
+		gpr += 2;
+
+		/* Philips ADC Playback Volume */
+		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_ADC_L);
+		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_ADC_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++], "Analog Mix Playback Volume", gpr, 0);
+		gpr += 2;
+		/* Philips ADC Capture Volume */
+		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_ADC_L);
+		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_ADC_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++], "Analog Mix Capture Volume", gpr, 0);
+		gpr += 2;
+
+		/* Aux2 Playback Volume */
+		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AUX2_L);
+		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_AUX2_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++],
+						emu->card_capabilities->ac97_chip ? "Aux2 Playback Volume" : "Aux Playback Volume",
+						gpr, 0);
+		gpr += 2;
+		/* Aux2 Capture Volume */
+		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_AUX2_L);
+		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_AUX2_R);
+		snd_emu10k1_init_stereo_control(&controls[nctl++],
+						emu->card_capabilities->ac97_chip ? "Aux2 Capture Volume" : "Aux Capture Volume",
+						gpr, 0);
+		gpr += 2;
 	}
-	/* AC'97 Playback Volume - used only for mic (renamed later) */
-	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AC97_L);
-	A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_AC97_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++], "AMic Playback Volume", gpr, 0);
-	gpr += 2;
-	/* AC'97 Capture Volume - used only for mic */
-	A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_AC97_L);
-	A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_AC97_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++], "Mic Capture Volume", gpr, 0);
-	gpr += 2;
-
-	/* mic capture buffer */	
-	A_OP(icode, &ptr, iINTERP, A_EXTOUT(A_EXTOUT_MIC_CAP), A_EXTIN(A_EXTIN_AC97_L), A_C_40000000, A_EXTIN(A_EXTIN_AC97_R));
-
-	/* Audigy CD Playback Volume */
-	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_SPDIF_CD_L);
-	A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_SPDIF_CD_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++],
-					emu->card_capabilities->ac97_chip ? "Audigy CD Playback Volume" : "CD Playback Volume",
-					gpr, 0);
-	gpr += 2;
-	/* Audigy CD Capture Volume */
-	A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_SPDIF_CD_L);
-	A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_SPDIF_CD_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++],
-					emu->card_capabilities->ac97_chip ? "Audigy CD Capture Volume" : "CD Capture Volume",
-					gpr, 0);
-	gpr += 2;
-
- 	/* Optical SPDIF Playback Volume */
-	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_OPT_SPDIF_L);
-	A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_OPT_SPDIF_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++], SNDRV_CTL_NAME_IEC958("Optical ",PLAYBACK,VOLUME), gpr, 0);
-	gpr += 2;
-	/* Optical SPDIF Capture Volume */
-	A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_OPT_SPDIF_L);
-	A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_OPT_SPDIF_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++], SNDRV_CTL_NAME_IEC958("Optical ",CAPTURE,VOLUME), gpr, 0);
-	gpr += 2;
-
-	/* Line2 Playback Volume */
-	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_LINE2_L);
-	A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_LINE2_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++],
-					emu->card_capabilities->ac97_chip ? "Line2 Playback Volume" : "Line Playback Volume",
-					gpr, 0);
-	gpr += 2;
-	/* Line2 Capture Volume */
-	A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_LINE2_L);
-	A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_LINE2_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++],
-					emu->card_capabilities->ac97_chip ? "Line2 Capture Volume" : "Line Capture Volume",
-					gpr, 0);
-	gpr += 2;
-        
-	/* Philips ADC Playback Volume */
-	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_ADC_L);
-	A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_ADC_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++], "Analog Mix Playback Volume", gpr, 0);
-	gpr += 2;
-	/* Philips ADC Capture Volume */
-	A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_ADC_L);
-	A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_ADC_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++], "Analog Mix Capture Volume", gpr, 0);
-	gpr += 2;
-
-	/* Aux2 Playback Volume */
-	A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AUX2_L);
-	A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_AUX2_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++],
-					emu->card_capabilities->ac97_chip ? "Aux2 Playback Volume" : "Aux Playback Volume",
-					gpr, 0);
-	gpr += 2;
-	/* Aux2 Capture Volume */
-	A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_AUX2_L);
-	A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_AUX2_R);
-	snd_emu10k1_init_stereo_control(&controls[nctl++],
-					emu->card_capabilities->ac97_chip ? "Aux2 Capture Volume" : "Aux Capture Volume",
-					gpr, 0);
-	gpr += 2;
 	
 	/* Stereo Mix Front Playback Volume */
 	A_OP(icode, &ptr, iMAC0, A_GPR(playback), A_GPR(playback), A_GPR(gpr), A_GPR(stereo_mix));
@@ -1580,60 +1581,58 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Wave Master Playback Volume", gpr, 0);
 	gpr++;
 
-	/* analog speakers */
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_AFRONT_L, A_EXTOUT_AFRONT_R, playback);
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_AREAR_L, A_EXTOUT_AREAR_R, playback+2);
-	A_PUT_OUTPUT(A_EXTOUT_ACENTER, playback+4);
-	A_PUT_OUTPUT(A_EXTOUT_ALFE, playback+5);
-	if (emu->card_capabilities->spk71)
-		A_PUT_STEREO_OUTPUT(A_EXTOUT_ASIDE_L, A_EXTOUT_ASIDE_R, playback+6);
-
-	/* headphone */
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_HEADPHONE_L, A_EXTOUT_HEADPHONE_R, playback);
-
-	/* digital outputs */
-	/* A_PUT_STEREO_OUTPUT(A_EXTOUT_FRONT_L, A_EXTOUT_FRONT_R, playback + SND_EMU10K1_PLAYBACK_CHANNELS); */
 	if (emu->card_capabilities->emu_model) {
 		/* EMU1010 Outputs from PCM Front, Rear, Center, LFE, Side */
 		dev_info(emu->card->dev, "EMU outputs on\n");
 		for (z = 0; z < 8; z++) {
 			if (emu->card_capabilities->ca0108_chip) {
 				A_OP(icode, &ptr, iACC3, A3_EMU32OUT(z), A_GPR(playback + z), A_C_00000000, A_C_00000000);
 			} else {
 				A_OP(icode, &ptr, iACC3, A_EMU32OUTL(z), A_GPR(playback + z), A_C_00000000, A_C_00000000);
 			}
 		}
-	}
+	} else {
+		/* analog speakers */
+		A_PUT_STEREO_OUTPUT(A_EXTOUT_AFRONT_L, A_EXTOUT_AFRONT_R, playback);
+		A_PUT_STEREO_OUTPUT(A_EXTOUT_AREAR_L, A_EXTOUT_AREAR_R, playback+2);
+		A_PUT_OUTPUT(A_EXTOUT_ACENTER, playback+4);
+		A_PUT_OUTPUT(A_EXTOUT_ALFE, playback+5);
+		if (emu->card_capabilities->spk71)
+			A_PUT_STEREO_OUTPUT(A_EXTOUT_ASIDE_L, A_EXTOUT_ASIDE_R, playback+6);
 
-	/* IEC958 Optical Raw Playback Switch */ 
-	gpr_map[gpr++] = 0;
-	gpr_map[gpr++] = 0x1008;
-	gpr_map[gpr++] = 0xffff0000;
-	for (z = 0; z < 2; z++) {
-		A_OP(icode, &ptr, iMAC0, A_GPR(tmp + 2), A_FXBUS(FXBUS_PT_LEFT + z), A_C_00000000, A_C_00000000);
-		A_OP(icode, &ptr, iSKIP, A_GPR_COND, A_GPR_COND, A_GPR(gpr - 2), A_C_00000001);
-		A_OP(icode, &ptr, iACC3, A_GPR(tmp + 2), A_C_00000000, A_C_00010000, A_GPR(tmp + 2));
-		A_OP(icode, &ptr, iANDXOR, A_GPR(tmp + 2), A_GPR(tmp + 2), A_GPR(gpr - 1), A_C_00000000);
-		A_SWITCH(icode, &ptr, tmp + 0, tmp + 2, gpr + z);
-		A_SWITCH_NEG(icode, &ptr, tmp + 1, gpr + z);
-		A_SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
-		if ((z==1) && (emu->card_capabilities->spdif_bug)) {
-			/* Due to a SPDIF output bug on some Audigy cards, this code delays the Right channel by 1 sample */
-			dev_info(emu->card->dev,
-				 "Installing spdif_bug patch: %s\n",
-				 emu->card_capabilities->name);
-			A_OP(icode, &ptr, iACC3, A_EXTOUT(A_EXTOUT_FRONT_L + z), A_GPR(gpr - 3), A_C_00000000, A_C_00000000);
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 3), A_GPR(tmp + 0), A_GPR(tmp + 1), A_C_00000000);
-		} else {
-			A_OP(icode, &ptr, iACC3, A_EXTOUT(A_EXTOUT_FRONT_L + z), A_GPR(tmp + 0), A_GPR(tmp + 1), A_C_00000000);
+		/* headphone */
+		A_PUT_STEREO_OUTPUT(A_EXTOUT_HEADPHONE_L, A_EXTOUT_HEADPHONE_R, playback);
+
+		/* IEC958 Optical Raw Playback Switch */
+		gpr_map[gpr++] = 0;
+		gpr_map[gpr++] = 0x1008;
+		gpr_map[gpr++] = 0xffff0000;
+		for (z = 0; z < 2; z++) {
+			A_OP(icode, &ptr, iMAC0, A_GPR(tmp + 2), A_FXBUS(FXBUS_PT_LEFT + z), A_C_00000000, A_C_00000000);
+			A_OP(icode, &ptr, iSKIP, A_GPR_COND, A_GPR_COND, A_GPR(gpr - 2), A_C_00000001);
+			A_OP(icode, &ptr, iACC3, A_GPR(tmp + 2), A_C_00000000, A_C_00010000, A_GPR(tmp + 2));
+			A_OP(icode, &ptr, iANDXOR, A_GPR(tmp + 2), A_GPR(tmp + 2), A_GPR(gpr - 1), A_C_00000000);
+			A_SWITCH(icode, &ptr, tmp + 0, tmp + 2, gpr + z);
+			A_SWITCH_NEG(icode, &ptr, tmp + 1, gpr + z);
+			A_SWITCH(icode, &ptr, tmp + 1, playback + z, tmp + 1);
+			if ((z==1) && (emu->card_capabilities->spdif_bug)) {
+				/* Due to a SPDIF output bug on some Audigy cards, this code delays the Right channel by 1 sample */
+				dev_info(emu->card->dev,
+					 "Installing spdif_bug patch: %s\n",
+					 emu->card_capabilities->name);
+				A_OP(icode, &ptr, iACC3, A_EXTOUT(A_EXTOUT_FRONT_L + z), A_GPR(gpr - 3), A_C_00000000, A_C_00000000);
+				A_OP(icode, &ptr, iACC3, A_GPR(gpr - 3), A_GPR(tmp + 0), A_GPR(tmp + 1), A_C_00000000);
+			} else {
+				A_OP(icode, &ptr, iACC3, A_EXTOUT(A_EXTOUT_FRONT_L + z), A_GPR(tmp + 0), A_GPR(tmp + 1), A_C_00000000);
+			}
 		}
+		snd_emu10k1_init_stereo_onoff_control(controls + nctl++, SNDRV_CTL_NAME_IEC958("Optical Raw ",PLAYBACK,SWITCH), gpr, 0);
+		gpr += 2;
+
+		A_PUT_STEREO_OUTPUT(A_EXTOUT_REAR_L, A_EXTOUT_REAR_R, playback+2);
+		A_PUT_OUTPUT(A_EXTOUT_CENTER, playback+4);
+		A_PUT_OUTPUT(A_EXTOUT_LFE, playback+5);
 	}
-	snd_emu10k1_init_stereo_onoff_control(controls + nctl++, SNDRV_CTL_NAME_IEC958("Optical Raw ",PLAYBACK,SWITCH), gpr, 0);
-	gpr += 2;
-	
-	A_PUT_STEREO_OUTPUT(A_EXTOUT_REAR_L, A_EXTOUT_REAR_R, playback+2);
-	A_PUT_OUTPUT(A_EXTOUT_CENTER, playback+4);
-	A_PUT_OUTPUT(A_EXTOUT_LFE, playback+5);
 
 	/* ADC buffer */
 #ifdef EMU10K1_CAPTURE_DIGITAL_OUT
-- 
2.40.0.152.g15d061e6df

