Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FD6FE35F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7549610A2;
	Wed, 10 May 2023 19:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7549610A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740522;
	bh=NCRstr9AimFAX+Wq1cOeXs5Jk8XQ7pWg1OiaQ/bBUFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M1NXnfGBQnXmOp+EfWKGpYr/voykcJ7I35M1JjfYi/gt5e0OV5rg7BN9GsdWvVzS3
	 YW3xmFHyunj7aTR8bwEc/Dt2JHyGE8sP+taxeGiTNcN3H7rzdbie2rCgYfEsYhGGMr
	 TBJuMUat+NF2RQ3W1N6IyxScinj9VoIzO/QY6xxk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E075AF8053D;
	Wed, 10 May 2023 19:39:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5243F80568; Wed, 10 May 2023 19:39:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A362F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A362F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 4F6F124267;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tTy-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 14/14] ALSA: emu10k1: enable bit-exact playback,
 part 2: voice attenuation
Date: Wed, 10 May 2023 19:39:17 +0200
Message-Id: <20230510173917.3073107-15-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YJDEAGMIYCI24HFQYP6BGC47WROMRYSK
X-Message-ID-Hash: YJDEAGMIYCI24HFQYP6BGC47WROMRYSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJDEAGMIYCI24HFQYP6BGC47WROMRYSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The voice volume is a raw fractional multiplier that can't actually
represent 1.0. To still enable real pass-through, we now set the volume
to 0.5 (which results in no loss of precision, as the FX bus provides
fractional values) and scale up the samples in DSP code.

To maintain backwards compatibility with existing configuration files,
we rescale the values in the mixer controls. The range is extended
upwards from 0xffff to 0x1fffd, which actually introduces the
possibility of specifying an amplification.

There is still a minor incompatibility with user space, namely if
someone loaded custom DSP code. They'll just get half the volume, so
this doesn't seem like a big deal.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/cards/audigy-mixer.rst  |  2 +-
 Documentation/sound/cards/sb-live-mixer.rst |  2 +-
 include/sound/emu10k1.h                     |  3 +++
 sound/pci/emu10k1/emufx.c                   | 30 ++++++++++++---------
 sound/pci/emu10k1/emumixer.c                | 15 ++++++-----
 sound/pci/emu10k1/emupcm.c                  |  4 +--
 6 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/Documentation/sound/cards/audigy-mixer.rst b/Documentation/sound/cards/audigy-mixer.rst
index aa176451d5b5..e02dd890d089 100644
--- a/Documentation/sound/cards/audigy-mixer.rst
+++ b/Documentation/sound/cards/audigy-mixer.rst
@@ -227,7 +227,7 @@ PCM stream related controls
 
 name='EMU10K1 PCM Volume',index 0-31
 ------------------------------------
-Channel volume attenuation in range 0-0xffff. The maximum value (no
+Channel volume attenuation in range 0-0x1fffd. The middle value (no
 attenuation) is default. The channel mapping for three values is
 as follows:
 
diff --git a/Documentation/sound/cards/sb-live-mixer.rst b/Documentation/sound/cards/sb-live-mixer.rst
index 819886634400..4dd9bfe01bd8 100644
--- a/Documentation/sound/cards/sb-live-mixer.rst
+++ b/Documentation/sound/cards/sb-live-mixer.rst
@@ -258,7 +258,7 @@ PCM stream related controls
 
 ``name='EMU10K1 PCM Volume',index 0-31``
 ----------------------------------------
-Channel volume attenuation in range 0-0xffff. The maximum value (no
+Channel volume attenuation in range 0-0x1fffd. The middle value (no
 attenuation) is default. The channel mapping for three values is
 as follows:
 
diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 12135121128b..00b07e697261 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -396,6 +396,7 @@
 #define PTRX_FXSENDAMOUNT_B_MASK 0x000000ff	/* Linear level of channel output sent to FX send bus B	*/
 #define PTRX_FXSENDAMOUNT_B	0x08000001
 
+// Note: the volumes are raw multpliers, so real 100% is impossible.
 #define CVCF			0x02		/* Current volume and filter cutoff register		*/
 #define CVCF_CURRENTVOL_MASK	0xffff0000	/* Current linear volume of specified channel		*/
 #define CVCF_CURRENTVOL		0x10100002
@@ -1480,6 +1481,8 @@ struct snd_emu10k1_pcm_mixer {
 	/* mono, left, right x 8 sends (4 on emu10k1) */
 	unsigned char send_routing[3][8];
 	unsigned char send_volume[3][8];
+	// 0x8000 is neutral. The mixer code rescales it to 0xffff to maintain
+	// backwards compatibility with user space.
 	unsigned short attn[3];
 	struct snd_emu10k1_pcm *epcm;
 };
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 32d5ed7528e8..d31731a8e1b4 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1361,7 +1361,13 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	A_OP(icode, &ptr, iMAC1, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_FXBUS(FXBUS_MIDI_RIGHT));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "Synth Capture Volume", gpr, 0);
 	gpr += 2;
-      
+
+	// We need to double the volume, as we configure the voices for half volume,
+	// which is necessary for bit-identical reproduction.
+	{ static_assert(stereo_mix == playback + SND_EMU10K1_PLAYBACK_CHANNELS); }
+	for (z = 0; z < SND_EMU10K1_PLAYBACK_CHANNELS + 2; z++)
+		A_OP(icode, &ptr, iACC3, A_GPR(playback + z), A_GPR(playback + z), A_GPR(playback + z), A_C_00000000);
+
 	/*
 	 * inputs
 	 */
@@ -1822,18 +1828,18 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	/*
 	 *  Process FX Buses
 	 */
-	OP(icode, &ptr, iMACINT0, GPR(0), C_00000000, FXBUS(FXBUS_PCM_LEFT), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(1), C_00000000, FXBUS(FXBUS_PCM_RIGHT), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(2), C_00000000, FXBUS(FXBUS_MIDI_LEFT), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(3), C_00000000, FXBUS(FXBUS_MIDI_RIGHT), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(4), C_00000000, FXBUS(FXBUS_PCM_LEFT_REAR), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(5), C_00000000, FXBUS(FXBUS_PCM_RIGHT_REAR), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(6), C_00000000, FXBUS(FXBUS_PCM_CENTER), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(7), C_00000000, FXBUS(FXBUS_PCM_LFE), C_00000004);
+	OP(icode, &ptr, iMACINT0, GPR(0), C_00000000, FXBUS(FXBUS_PCM_LEFT), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(1), C_00000000, FXBUS(FXBUS_PCM_RIGHT), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(2), C_00000000, FXBUS(FXBUS_MIDI_LEFT), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(3), C_00000000, FXBUS(FXBUS_MIDI_RIGHT), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(4), C_00000000, FXBUS(FXBUS_PCM_LEFT_REAR), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(5), C_00000000, FXBUS(FXBUS_PCM_RIGHT_REAR), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(6), C_00000000, FXBUS(FXBUS_PCM_CENTER), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(7), C_00000000, FXBUS(FXBUS_PCM_LFE), C_00000008);
 	OP(icode, &ptr, iMACINT0, GPR(8), C_00000000, C_00000000, C_00000000);	/* S/PDIF left */
 	OP(icode, &ptr, iMACINT0, GPR(9), C_00000000, C_00000000, C_00000000);	/* S/PDIF right */
-	OP(icode, &ptr, iMACINT0, GPR(10), C_00000000, FXBUS(FXBUS_PCM_LEFT_FRONT), C_00000004);
-	OP(icode, &ptr, iMACINT0, GPR(11), C_00000000, FXBUS(FXBUS_PCM_RIGHT_FRONT), C_00000004);
+	OP(icode, &ptr, iMACINT0, GPR(10), C_00000000, FXBUS(FXBUS_PCM_LEFT_FRONT), C_00000008);
+	OP(icode, &ptr, iMACINT0, GPR(11), C_00000000, FXBUS(FXBUS_PCM_RIGHT_FRONT), C_00000008);
 
 	/* Raw S/PDIF PCM */
 	ipcm->substream = 0;
@@ -1927,7 +1933,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	
 	/* Wave Center/LFE Playback Volume */
 	OP(icode, &ptr, iACC3, GPR(tmp + 0), FXBUS(FXBUS_PCM_LEFT), FXBUS(FXBUS_PCM_RIGHT), C_00000000);
-	OP(icode, &ptr, iMACINT0, GPR(tmp + 0), C_00000000, GPR(tmp + 0), C_00000002);
+	OP(icode, &ptr, iMACINT0, GPR(tmp + 0), C_00000000, GPR(tmp + 0), C_00000004);
 	VOLUME(icode, &ptr, playback + 4, tmp + 0, gpr);
 	snd_emu10k1_init_mono_control(controls + i++, "Wave Center Playback Volume", gpr++, 0);
 	VOLUME(icode, &ptr, playback + 5, tmp + 0, gpr);
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 610700be1e37..8fb2b984e13f 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1352,7 +1352,7 @@ static int snd_emu10k1_attn_info(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 3;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 0xffff;
+	uinfo->value.integer.max = 0x1fffd;
 	return 0;
 }
 
@@ -1365,7 +1365,7 @@ static int snd_emu10k1_attn_get(struct snd_kcontrol *kcontrol,
 	int idx;
 
 	for (idx = 0; idx < 3; idx++)
-		ucontrol->value.integer.value[idx] = mix->attn[idx];
+		ucontrol->value.integer.value[idx] = mix->attn[idx] * 0xffffU / 0x8000U;
 	return 0;
 }
 
@@ -1380,7 +1380,8 @@ static int snd_emu10k1_attn_put(struct snd_kcontrol *kcontrol,
 
 	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (idx = 0; idx < 3; idx++) {
-		val = ucontrol->value.integer.value[idx] & 0xffff;
+		unsigned uval = ucontrol->value.integer.value[idx] & 0x1ffff;
+		val = uval * 0x8000U / 0xffffU;
 		if (mix->attn[idx] != val) {
 			mix->attn[idx] = val;
 			change = 1;
@@ -1547,32 +1548,34 @@ static int snd_emu10k1_efx_attn_info(struct snd_kcontrol *kcontrol, struct snd_c
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 0xffff;
+	uinfo->value.integer.max = 0x1fffd;
 	return 0;
 }
 
 static int snd_emu10k1_efx_attn_get(struct snd_kcontrol *kcontrol,
                                 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->efx_pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 
-	ucontrol->value.integer.value[0] = mix->attn[0];
+	ucontrol->value.integer.value[0] = mix->attn[0] * 0xffffU / 0x8000U;
 	return 0;
 }
 
 static int snd_emu10k1_efx_attn_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	int ch = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
 	struct snd_emu10k1_pcm_mixer *mix = &emu->efx_pcm_mixer[ch];
 	int change = 0, val;
+	unsigned uval;
 
 	spin_lock_irqsave(&emu->reg_lock, flags);
-	val = ucontrol->value.integer.value[0] & 0xffff;
+	uval = ucontrol->value.integer.value[0] & 0x1ffff;
+	val = uval * 0x8000U / 0xffffU;
 	if (mix->attn[0] != val) {
 		mix->attn[0] = val;
 		change = 1;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 5ed404e8ed39..6e6d3103ed90 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1049,7 +1049,7 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 		mix->send_routing[0][0] = i;
 		memset(&mix->send_volume, 0, sizeof(mix->send_volume));
 		mix->send_volume[0][0] = 255;
-		mix->attn[0] = 0xffff;
+		mix->attn[0] = 0x8000;
 		mix->epcm = epcm;
 		snd_emu10k1_pcm_efx_mixer_notify(emu, i, 1);
 	}
@@ -1098,7 +1098,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 	memset(&mix->send_volume, 0, sizeof(mix->send_volume));
 	mix->send_volume[0][0] = mix->send_volume[0][1] =
 	mix->send_volume[1][0] = mix->send_volume[2][1] = 255;
-	mix->attn[0] = mix->attn[1] = mix->attn[2] = 0xffff;
+	mix->attn[0] = mix->attn[1] = mix->attn[2] = 0x8000;
 	mix->epcm = epcm;
 	snd_emu10k1_pcm_mixer_notify(emu, substream->number, 1);
 	return 0;
-- 
2.40.0.152.g15d061e6df

