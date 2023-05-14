Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6E701E6F
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 19:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A066FA;
	Sun, 14 May 2023 19:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A066FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684083999;
	bh=PWb4VJc4QxsNCrAtLe6j9Bt5GSNnQo+NfEuJQVrFBlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=omyw0ctlJrpItWoqaOaLkqIvM/JweAUpmJsm1r95YJOFy5OdhQehXPK4NXPdMdtnd
	 PebmxQbkEdjhzSs8oEbQE8p7VIsKZC8XQY6SdPY57NZ8CCPRZnX3Ue7NxZvAUugf+4
	 ubG+PWduYYc/22heOZQg76hZa0X0BnkItNC2qY4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CA3AF805C6; Sun, 14 May 2023 19:04:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE17F80552;
	Sun, 14 May 2023 19:04:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9748F805C6; Sun, 14 May 2023 19:04:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 40E6FF80551
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 19:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E6FF80551
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AE1E724288;
	Sun, 14 May 2023 13:03:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyF7z-Io2-00; Sun, 14 May 2023 19:03:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Dowland <jon@dow.land>
Subject: [PATCH v2 6/7] ALSA: emu10k1: enable bit-exact playback,
 part 1: DSP attenuation
Date: Sun, 14 May 2023 19:03:22 +0200
Message-Id: <20230514170323.3408834-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
References: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BGPYMS3HJ4RQ7PSIZC7LBJVR2BSB7TRT
X-Message-ID-Hash: BGPYMS3HJ4RQ7PSIZC7LBJVR2BSB7TRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGPYMS3HJ4RQ7PSIZC7LBJVR2BSB7TRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fractional multiplication with the maximal value 2^31-1 causes some tiny
distortion. Instead, we want to multiply with the full 2^31. The catch
is of course that this cannot be represented in the DSP's signed 32 bit
registers.

One way to deal with this is to encode 1.0 as a negative number and
special-case it. As a matter of fact, the SbLive! code path already
contained such code, though the controls never actually exercised it.

A more efficient approach is to use negative values, which actually
extend to -2^31. Accordingly, for all the volume adjustments we now use
the MAC1 instruction which negates the X operand.

The range of the controls in highres mode is extended downwards, so -1
is the new zero/mute. At maximal excursion, real zero is not mute any
more, but I don't think anyone will notice this behavior change. ;-)

That also required making the min/max/values in the control structs
signed. This technically changes the user space interface, but it seems
implausible that someone would notice - the numbers were actually
treated as if they were signed anyway (and in the actual mixer iface
they _are_). And without this change, the min value didn't even make
sense in the first place (and no-one noticed, because it was always 0).

Tested-by: Jonathan Dowland <jon@dow.land>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      |   6 +-
 include/uapi/sound/emu10k1.h |   8 ++-
 sound/pci/emu10k1/emufx.c    | 119 +++++++++++++++++------------------
 3 files changed, 64 insertions(+), 69 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 7129b9249eb3..12135121128b 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1511,9 +1511,9 @@ struct snd_emu10k1_fx8010_ctl {
 	unsigned int vcount;
 	unsigned int count;		/* count of GPR (1..16) */
 	unsigned short gpr[32];		/* GPR number(s) */
-	unsigned int value[32];
-	unsigned int min;		/* minimum range */
-	unsigned int max;		/* maximum range */
+	int value[32];
+	int min;			/* minimum range */
+	int max;			/* maximum range */
 	unsigned int translation;	/* translation type (EMU10K1_GPR_TRANSLATION*) */
 	struct snd_kcontrol *kcontrol;
 };
diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index c8e131d6da00..4c32a116e7ad 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -308,6 +308,8 @@ struct snd_emu10k1_fx8010_info {
 #define EMU10K1_GPR_TRANSLATION_BASS		2
 #define EMU10K1_GPR_TRANSLATION_TREBLE		3
 #define EMU10K1_GPR_TRANSLATION_ONOFF		4
+#define EMU10K1_GPR_TRANSLATION_NEGATE		5
+#define EMU10K1_GPR_TRANSLATION_NEG_TABLE100	6
 
 enum emu10k1_ctl_elem_iface {
 	EMU10K1_CTL_ELEM_IFACE_MIXER = 2,	/* virtual mixer device */
@@ -328,9 +330,9 @@ struct snd_emu10k1_fx8010_control_gpr {
 	unsigned int vcount;		/* visible count */
 	unsigned int count;		/* count of GPR (1..16) */
 	unsigned short gpr[32];		/* GPR number(s) */
-	unsigned int value[32];		/* initial values */
-	unsigned int min;		/* minimum range */
-	unsigned int max;		/* maximum range */
+	int value[32];			/* initial values */
+	int min;			/* minimum range */
+	int max;			/* maximum range */
 	unsigned int translation;	/* translation type (EMU10K1_GPR_TRANSLATION*) */
 	const unsigned int *tlv;
 };
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 9c9ffba7e591..4c9d67e72ae5 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -332,7 +332,7 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_fx8010_ctl *ctl =
 		(struct snd_emu10k1_fx8010_ctl *) kcontrol->private_value;
-	unsigned int nval, val;
+	int nval, val;
 	unsigned int i, j;
 	int change = 0;
 	
@@ -349,9 +349,16 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 		case EMU10K1_GPR_TRANSLATION_NONE:
 			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0, val);
 			break;
+		case EMU10K1_GPR_TRANSLATION_NEGATE:
+			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0, ~val);
+			break;
 		case EMU10K1_GPR_TRANSLATION_TABLE100:
 			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0, db_table[val]);
 			break;
+		case EMU10K1_GPR_TRANSLATION_NEG_TABLE100:
+			snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[i], 0,
+					      val == 100 ? 0x80000000 : -(int)db_table[val]);
+			break;
 		case EMU10K1_GPR_TRANSLATION_BASS:
 			if ((ctl->count % 5) != 0 || (ctl->count / 5) != ctl->vcount) {
 				change = -EIO;
@@ -771,8 +778,10 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 		}
 		switch (gctl->translation) {
 		case EMU10K1_GPR_TRANSLATION_NONE:
+		case EMU10K1_GPR_TRANSLATION_NEGATE:
 			break;
 		case EMU10K1_GPR_TRANSLATION_TABLE100:
+		case EMU10K1_GPR_TRANSLATION_NEG_TABLE100:
 			if (gctl->min != 0 || gctl->max != 100) {
 				err = -EINVAL;
 				goto __error;
@@ -1137,44 +1146,44 @@ static int snd_emu10k1_ipcm_peek(struct snd_emu10k1 *emu,
 
 static void
 snd_emu10k1_init_mono_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
-			      const char *name, int gpr, int defval)
+			       const char *name, int gpr, int defval)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	if (high_res_gpr_volume) {
-		ctl->min = 0;
+		ctl->min = -1;
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
-		ctl->translation = EMU10K1_GPR_TRANSLATION_NONE;
-		defval = defval * 0x7fffffffLL / 100;
+		ctl->translation = EMU10K1_GPR_TRANSLATION_NEGATE;
+		defval = defval * 0x80000000LL / 100 - 1;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
 		ctl->tlv = snd_emu10k1_db_scale1;
-		ctl->translation = EMU10K1_GPR_TRANSLATION_TABLE100;
+		ctl->translation = EMU10K1_GPR_TRANSLATION_NEG_TABLE100;
 	}
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 }
 
 static void
 snd_emu10k1_init_stereo_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
-				const char *name, int gpr, int defval)
+				 const char *name, int gpr, int defval)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	if (high_res_gpr_volume) {
-		ctl->min = 0;
+		ctl->min = -1;
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
-		ctl->translation = EMU10K1_GPR_TRANSLATION_NONE;
-		defval = defval * 0x7fffffffLL / 100;
+		ctl->translation = EMU10K1_GPR_TRANSLATION_NEGATE;
+		defval = defval * 0x80000000LL / 100 - 1;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
 		ctl->tlv = snd_emu10k1_db_scale1;
-		ctl->translation = EMU10K1_GPR_TRANSLATION_TABLE100;
+		ctl->translation = EMU10K1_GPR_TRANSLATION_NEG_TABLE100;
 	}
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 	ctl->gpr[1] = gpr + 1; ctl->value[1] = defval;
@@ -1293,87 +1302,87 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 
 #if 1
 	/* PCM front Playback Volume (independent from stereo mix)
-	 * playback = 0 + ( gpr * FXBUS_PCM_LEFT_FRONT >> 31)
-	 * where gpr contains attenuation from corresponding mixer control
+	 * playback = -gpr * FXBUS_PCM_LEFT_FRONT >> 31
+	 * where gpr contains negated attenuation from corresponding mixer control
 	 * (snd_emu10k1_init_stereo_control)
 	 */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT_FRONT));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+1), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT_FRONT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT_FRONT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+1), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT_FRONT));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "PCM Front Playback Volume", gpr, 100);
 	gpr += 2;
 
 	/* PCM Surround Playback (independent from stereo mix) */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+2), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT_REAR));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+3), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT_REAR));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+2), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT_REAR));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+3), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT_REAR));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "PCM Surround Playback Volume", gpr, 100);
 	gpr += 2;
 	
 	/* PCM Side Playback (independent from stereo mix) */
 	if (emu->card_capabilities->spk71) {
-		A_OP(icode, &ptr, iMAC0, A_GPR(playback+6), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT_SIDE));
-		A_OP(icode, &ptr, iMAC0, A_GPR(playback+7), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT_SIDE));
+		A_OP(icode, &ptr, iMAC1, A_GPR(playback+6), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT_SIDE));
+		A_OP(icode, &ptr, iMAC1, A_GPR(playback+7), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT_SIDE));
 		snd_emu10k1_init_stereo_control(&controls[nctl++], "PCM Side Playback Volume", gpr, 100);
 		gpr += 2;
 	}
 
 	/* PCM Center Playback (independent from stereo mix) */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+4), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_CENTER));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+4), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_CENTER));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "PCM Center Playback Volume", gpr, 100);
 	gpr++;
 
 	/* PCM LFE Playback (independent from stereo mix) */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+5), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LFE));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+5), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LFE));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "PCM LFE Playback Volume", gpr, 100);
 	gpr++;
 	
 	/*
 	 * Stereo Mix
 	 */
 	/* Wave (PCM) Playback Volume (will be renamed later) */
-	A_OP(icode, &ptr, iMAC0, A_GPR(stereo_mix), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT));
-	A_OP(icode, &ptr, iMAC0, A_GPR(stereo_mix+1), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(stereo_mix), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(stereo_mix+1), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "Wave Playback Volume", gpr, 100);
 	gpr += 2;
 
 	/* Synth Playback */
-	A_OP(icode, &ptr, iMAC0, A_GPR(stereo_mix+0), A_GPR(stereo_mix+0), A_GPR(gpr), A_FXBUS(FXBUS_MIDI_LEFT));
-	A_OP(icode, &ptr, iMAC0, A_GPR(stereo_mix+1), A_GPR(stereo_mix+1), A_GPR(gpr+1), A_FXBUS(FXBUS_MIDI_RIGHT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(stereo_mix+0), A_GPR(stereo_mix+0), A_GPR(gpr), A_FXBUS(FXBUS_MIDI_LEFT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(stereo_mix+1), A_GPR(stereo_mix+1), A_GPR(gpr+1), A_FXBUS(FXBUS_MIDI_RIGHT));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "Synth Playback Volume", gpr, 100);
 	gpr += 2;
 
 	/* Wave (PCM) Capture */
-	A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT));
-	A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(capture+0), A_C_00000000, A_GPR(gpr), A_FXBUS(FXBUS_PCM_LEFT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(capture+1), A_C_00000000, A_GPR(gpr+1), A_FXBUS(FXBUS_PCM_RIGHT));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "PCM Capture Volume", gpr, 0);
 	gpr += 2;
 
 	/* Synth Capture */
-	A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A_GPR(gpr), A_FXBUS(FXBUS_MIDI_LEFT));
-	A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_FXBUS(FXBUS_MIDI_RIGHT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(capture+0), A_GPR(capture+0), A_GPR(gpr), A_FXBUS(FXBUS_MIDI_LEFT));
+	A_OP(icode, &ptr, iMAC1, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_FXBUS(FXBUS_MIDI_RIGHT));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "Synth Capture Volume", gpr, 0);
 	gpr += 2;
       
 	/*
 	 * inputs
 	 */
 #define A_ADD_VOLUME_IN(var,vol,input) \
-A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
+	A_OP(icode, &ptr, iMAC1, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 
 	if (emu->card_capabilities->emu_model) {
 		/* EMU1010 DSP 0 and DSP 1 Capture */
 		// The 24 MSB hold the actual value. We implicitly discard the 16 LSB.
 		if (emu->card_capabilities->ca0108_chip) {
 			// For unclear reasons, the EMU32IN cannot be the Y operand!
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A3_EMU32IN(0x0), A_GPR(gpr));
+			A_OP(icode, &ptr, iMAC1, A_GPR(capture+0), A_GPR(capture+0), A3_EMU32IN(0x0), A_GPR(gpr));
 			// A3_EMU32IN(0) is delayed by one sample, so all other A3_EMU32IN channels
 			// need to be delayed as well; we use an auxiliary register for that.
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+2), A_GPR(gpr+1));
+			A_OP(icode, &ptr, iMAC1, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+2), A_GPR(gpr+1));
 			A_OP(icode, &ptr, iACC3, A_GPR(gpr+2), A3_EMU32IN(0x1), A_C_00000000, A_C_00000000);
 		} else {
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A_GPR(gpr), A_P16VIN(0x0));
+			A_OP(icode, &ptr, iMAC1, A_GPR(capture+0), A_GPR(capture+0), A_P16VIN(0x0), A_GPR(gpr));
 			// A_P16VIN(0) is delayed by one sample, so all other A_P16VIN channels
 			// need to be delayed as well; we use an auxiliary register for that.
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_GPR(gpr+2));
+			A_OP(icode, &ptr, iMAC1, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+2), A_GPR(gpr+1));
 			A_OP(icode, &ptr, iACC3, A_GPR(gpr+2), A_P16VIN(0x1), A_C_00000000, A_C_00000000);
 		}
 		snd_emu10k1_init_stereo_control(&controls[nctl++], "EMU Capture Volume", gpr, 0);
@@ -1465,33 +1474,33 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	}
 	
 	/* Stereo Mix Front Playback Volume */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback), A_GPR(playback), A_GPR(gpr), A_GPR(stereo_mix));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+1), A_GPR(playback+1), A_GPR(gpr+1), A_GPR(stereo_mix+1));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback), A_GPR(playback), A_GPR(gpr), A_GPR(stereo_mix));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+1), A_GPR(playback+1), A_GPR(gpr+1), A_GPR(stereo_mix+1));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "Front Playback Volume", gpr, 100);
 	gpr += 2;
 	
 	/* Stereo Mix Surround Playback */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+2), A_GPR(playback+2), A_GPR(gpr), A_GPR(stereo_mix));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+3), A_GPR(playback+3), A_GPR(gpr+1), A_GPR(stereo_mix+1));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+2), A_GPR(playback+2), A_GPR(gpr), A_GPR(stereo_mix));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+3), A_GPR(playback+3), A_GPR(gpr+1), A_GPR(stereo_mix+1));
 	snd_emu10k1_init_stereo_control(&controls[nctl++], "Surround Playback Volume", gpr, 0);
 	gpr += 2;
 
 	/* Stereo Mix Center Playback */
 	/* Center = sub = Left/2 + Right/2 */
 	A_OP(icode, &ptr, iINTERP, A_GPR(tmp), A_GPR(stereo_mix), A_C_40000000, A_GPR(stereo_mix+1));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+4), A_GPR(playback+4), A_GPR(gpr), A_GPR(tmp));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+4), A_GPR(playback+4), A_GPR(gpr), A_GPR(tmp));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Center Playback Volume", gpr, 0);
 	gpr++;
 
 	/* Stereo Mix LFE Playback */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+5), A_GPR(playback+5), A_GPR(gpr), A_GPR(tmp));
+	A_OP(icode, &ptr, iMAC1, A_GPR(playback+5), A_GPR(playback+5), A_GPR(gpr), A_GPR(tmp));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "LFE Playback Volume", gpr, 0);
 	gpr++;
 	
 	if (emu->card_capabilities->spk71) {
 		/* Stereo Mix Side Playback */
-		A_OP(icode, &ptr, iMAC0, A_GPR(playback+6), A_GPR(playback+6), A_GPR(gpr), A_GPR(stereo_mix));
-		A_OP(icode, &ptr, iMAC0, A_GPR(playback+7), A_GPR(playback+7), A_GPR(gpr+1), A_GPR(stereo_mix+1));
+		A_OP(icode, &ptr, iMAC1, A_GPR(playback+6), A_GPR(playback+6), A_GPR(gpr), A_GPR(stereo_mix));
+		A_OP(icode, &ptr, iMAC1, A_GPR(playback+7), A_GPR(playback+7), A_GPR(gpr+1), A_GPR(stereo_mix+1));
 		snd_emu10k1_init_stereo_control(&controls[nctl++], "Side Playback Volume", gpr, 0);
 		gpr += 2;
 	}
@@ -1579,7 +1588,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 
 	/* Master volume (will be renamed later) */
 	for (z = 0; z < 8; z++)
-		A_OP(icode, &ptr, iMAC0, A_GPR(playback+z), A_C_00000000, A_GPR(gpr), A_GPR(playback+z));
+		A_OP(icode, &ptr, iMAC1, A_GPR(playback+z), A_C_00000000, A_GPR(gpr), A_GPR(playback+z));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Wave Master Playback Volume", gpr, 0);
 	gpr++;
 
@@ -1731,42 +1740,26 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
  * initial DSP configuration for Emu10k1
  */
 
-/* when volume = max, then copy only to avoid volume modification */
-/* with iMAC0 (negative values) */
+/* Volumes are in the [-2^31, 0] range, zero being mute. */
 static void _volume(struct snd_emu10k1_fx8010_code *icode, u32 *ptr, u32 dst, u32 src, u32 vol)
 {
-	OP(icode, ptr, iMAC0, dst, C_00000000, src, vol);
-	OP(icode, ptr, iANDXOR, C_00000000, vol, C_ffffffff, C_7fffffff);
-	OP(icode, ptr, iSKIP, GPR_COND, GPR_COND, CC_REG_NONZERO, C_00000001);
-	OP(icode, ptr, iACC3, dst, src, C_00000000, C_00000000);
+	OP(icode, ptr, iMAC1, dst, C_00000000, src, vol);
 }
 static void _volume_add(struct snd_emu10k1_fx8010_code *icode, u32 *ptr, u32 dst, u32 src, u32 vol)
 {
-	OP(icode, ptr, iANDXOR, C_00000000, vol, C_ffffffff, C_7fffffff);
-	OP(icode, ptr, iSKIP, GPR_COND, GPR_COND, CC_REG_NONZERO, C_00000002);
-	OP(icode, ptr, iMACINT0, dst, dst, src, C_00000001);
-	OP(icode, ptr, iSKIP, C_00000000, C_7fffffff, C_7fffffff, C_00000001);
-	OP(icode, ptr, iMAC0, dst, dst, src, vol);
-}
-static void _volume_out(struct snd_emu10k1_fx8010_code *icode, u32 *ptr, u32 dst, u32 src, u32 vol)
-{
-	OP(icode, ptr, iANDXOR, C_00000000, vol, C_ffffffff, C_7fffffff);
-	OP(icode, ptr, iSKIP, GPR_COND, GPR_COND, CC_REG_NONZERO, C_00000002);
-	OP(icode, ptr, iACC3, dst, src, C_00000000, C_00000000);
-	OP(icode, ptr, iSKIP, C_00000000, C_7fffffff, C_7fffffff, C_00000001);
-	OP(icode, ptr, iMAC0, dst, C_00000000, src, vol);
+	OP(icode, ptr, iMAC1, dst, dst, src, vol);
 }
 
 #define VOLUME(icode, ptr, dst, src, vol) \
 		_volume(icode, ptr, GPR(dst), GPR(src), GPR(vol))
 #define VOLUME_IN(icode, ptr, dst, src, vol) \
 		_volume(icode, ptr, GPR(dst), EXTIN(src), GPR(vol))
 #define VOLUME_ADD(icode, ptr, dst, src, vol) \
 		_volume_add(icode, ptr, GPR(dst), GPR(src), GPR(vol))
 #define VOLUME_ADDIN(icode, ptr, dst, src, vol) \
 		_volume_add(icode, ptr, GPR(dst), EXTIN(src), GPR(vol))
 #define VOLUME_OUT(icode, ptr, dst, src, vol) \
-		_volume_out(icode, ptr, EXTOUT(dst), GPR(src), GPR(vol))
+		_volume(icode, ptr, EXTOUT(dst), GPR(src), GPR(vol))
 #define _SWITCH(icode, ptr, dst, src, sw) \
 	OP((icode), ptr, iMACINT0, dst, C_00000000, src, sw);
 #define SWITCH(icode, ptr, dst, src, sw) \
-- 
2.40.0.152.g15d061e6df

