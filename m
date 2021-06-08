Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2371E39F93B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C5D189C;
	Tue,  8 Jun 2021 16:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C5D189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162763;
	bh=IpomKu4W2aQl43Xtgwq7xMBoDDiu1qVZdqvtsMB9fhA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LyNCuBf4V+pwkC643cngRI/68gmHRJQaWcEjMnKYBCrpKHeBmMjZbyrQLFZDUl2Rn
	 g2kzspByNoPyl26HIsC1/MjFHnzspHlBTgT/7cqa07ZnkgBiLQ3ZVb/WweNyuNf01G
	 ZLaVytsA+urNsfbgUQYX4hVvC6o0lm+szCGfGEkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7762AF8077D;
	Tue,  8 Jun 2021 16:07:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC099F806FA; Tue,  8 Jun 2021 16:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C0D3F80528
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C0D3F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rvtrBU9u"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Gn7OiwHE"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 67FE3219E7
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVhZMvm8ltb6wtU/rOpFIt4dULJFI7aRB7O3osMb6eQ=;
 b=rvtrBU9uRvzIzSrDP4PvgUgR9sRAfmtGA8GMo6BOqCalYiU7FdFojpFagLyh7AKP0s2Zn+
 v+ST2NeSjUlrGzsmlJseYdAtjT2pqPBBvbfKurBb/sHHlXwpWPOAWaaUebXJz0v+tE5CFD
 RE4R8Z9RRNZwixD49Yjj295O34GjTno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVhZMvm8ltb6wtU/rOpFIt4dULJFI7aRB7O3osMb6eQ=;
 b=Gn7OiwHEHufUsy4x0igkMdIIY7NwZTeH66s1smQ+nLE75K4HDNdt7/oP9fPUSCljMjS+mQ
 xjGi7PoSus5iW7Dg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 542CCA3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 34/66] ALSA: ac97: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:08 +0200
Message-Id: <20210608140540.17885-35-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

AC97 codec driver code contains a lot of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_codec.c | 205 ++++++++++++++++++++++++------------
 sound/pci/ac97/ac97_patch.c | 137 ++++++++++++++++--------
 2 files changed, 228 insertions(+), 114 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 012a7ee849e8..01f296d524ce 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1286,15 +1286,17 @@ static int snd_ac97_cmix_new_stereo(struct snd_card *card, const char *pfx,
 
 	if (snd_ac97_try_bit(ac97, reg, 15)) {
 		sprintf(name, "%s Switch", pfx);
-		if ((err = snd_ac97_cmute_new_stereo(card, name, reg,
-						     check_stereo, check_amix,
-						     ac97)) < 0)
+		err = snd_ac97_cmute_new_stereo(card, name, reg,
+						check_stereo, check_amix,
+						ac97);
+		if (err < 0)
 			return err;
 	}
 	check_volume_resolution(ac97, reg, &lo_max, &hi_max);
 	if (lo_max) {
 		sprintf(name, "%s Volume", pfx);
-		if ((err = snd_ac97_cvol_new(card, name, reg, lo_max, hi_max, ac97)) < 0)
+		err = snd_ac97_cvol_new(card, name, reg, lo_max, hi_max, ac97);
+		if (err < 0)
 			return err;
 	}
 	return 0;
@@ -1333,9 +1335,11 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	/* build center controls */
 	if ((snd_ac97_try_volume_mix(ac97, AC97_CENTER_LFE_MASTER)) 
 		&& !(ac97->flags & AC97_AD_MULTI)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_center[0], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_center[0], ac97));
+		if (err < 0)
 			return err;
-		if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_center[1], ac97))) < 0)
+		err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_center[1], ac97));
+		if (err < 0)
 			return err;
 		snd_ac97_change_volume_params2(ac97, AC97_CENTER_LFE_MASTER, 0, &max);
 		kctl->private_value &= ~(0xff << 16);
@@ -1347,9 +1351,11 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	/* build LFE controls */
 	if ((snd_ac97_try_volume_mix(ac97, AC97_CENTER_LFE_MASTER+1))
 		&& !(ac97->flags & AC97_AD_MULTI)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_lfe[0], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_lfe[0], ac97));
+		if (err < 0)
 			return err;
-		if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_lfe[1], ac97))) < 0)
+		err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_lfe[1], ac97));
+		if (err < 0)
 			return err;
 		snd_ac97_change_volume_params2(ac97, AC97_CENTER_LFE_MASTER, 8, &max);
 		kctl->private_value &= ~(0xff << 16);
@@ -1362,23 +1368,26 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	if ((snd_ac97_try_volume_mix(ac97, AC97_SURROUND_MASTER)) 
 		&& !(ac97->flags & AC97_AD_MULTI)) {
 		/* Surround Master (0x38) is with stereo mutes */
-		if ((err = snd_ac97_cmix_new_stereo(card, "Surround Playback",
-						    AC97_SURROUND_MASTER, 1, 0,
-						    ac97)) < 0)
+		err = snd_ac97_cmix_new_stereo(card, "Surround Playback",
+					       AC97_SURROUND_MASTER, 1, 0,
+					       ac97);
+		if (err < 0)
 			return err;
 	}
 
 	/* build headphone controls */
 	if (snd_ac97_try_volume_mix(ac97, AC97_HEADPHONE)) {
-		if ((err = snd_ac97_cmix_new(card, "Headphone Playback",
-					     AC97_HEADPHONE, 0, ac97)) < 0)
+		err = snd_ac97_cmix_new(card, "Headphone Playback",
+					AC97_HEADPHONE, 0, ac97);
+		if (err < 0)
 			return err;
 	}
 	
 	/* build master mono controls */
 	if (snd_ac97_try_volume_mix(ac97, AC97_MASTER_MONO)) {
-		if ((err = snd_ac97_cmix_new(card, "Master Mono Playback",
-					     AC97_MASTER_MONO, 0, ac97)) < 0)
+		err = snd_ac97_cmix_new(card, "Master Mono Playback",
+					AC97_MASTER_MONO, 0, ac97);
+		if (err < 0)
 			return err;
 	}
 	
@@ -1386,7 +1395,9 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	if (!(ac97->flags & AC97_HAS_NO_TONE)) {
 		if (snd_ac97_try_volume_mix(ac97, AC97_MASTER_TONE)) {
 			for (idx = 0; idx < 2; idx++) {
-				if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_tone[idx], ac97))) < 0)
+				kctl = snd_ac97_cnew(&snd_ac97_controls_tone[idx], ac97);
+				err = snd_ctl_add(card, kctl);
+				if (err < 0)
 					return err;
 				if (ac97->id == AC97_ID_YMF743 ||
 				    ac97->id == AC97_ID_YMF753) {
@@ -1402,9 +1413,12 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	if (!(ac97->flags & AC97_HAS_NO_PC_BEEP) && 
 		((ac97->flags & AC97_HAS_PC_BEEP) ||
 	    snd_ac97_try_volume_mix(ac97, AC97_PC_BEEP))) {
-		for (idx = 0; idx < 2; idx++)
-			if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_pc_beep[idx], ac97))) < 0)
+		for (idx = 0; idx < 2; idx++) {
+			kctl = snd_ac97_cnew(&snd_ac97_controls_pc_beep[idx], ac97);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
+		}
 		set_tlv_db_scale(kctl, db_scale_4bit);
 		snd_ac97_write_cache(
 			ac97,
@@ -1417,8 +1431,9 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	/* build Phone controls */
 	if (!(ac97->flags & AC97_HAS_NO_PHONE)) {
 		if (snd_ac97_try_volume_mix(ac97, AC97_PHONE)) {
-			if ((err = snd_ac97_cmix_new(card, "Phone Playback",
-						     AC97_PHONE, 1, ac97)) < 0)
+			err = snd_ac97_cmix_new(card, "Phone Playback",
+						AC97_PHONE, 1, ac97);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1426,26 +1441,30 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	/* build MIC controls */
 	if (!(ac97->flags & AC97_HAS_NO_MIC)) {
 		if (snd_ac97_try_volume_mix(ac97, AC97_MIC)) {
-			if ((err = snd_ac97_cmix_new(card, "Mic Playback",
-						     AC97_MIC, 1, ac97)) < 0)
+			err = snd_ac97_cmix_new(card, "Mic Playback",
+						AC97_MIC, 1, ac97);
+			if (err < 0)
 				return err;
-			if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_mic_boost, ac97))) < 0)
+			err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_mic_boost, ac97));
+			if (err < 0)
 				return err;
 		}
 	}
 
 	/* build Line controls */
 	if (snd_ac97_try_volume_mix(ac97, AC97_LINE)) {
-		if ((err = snd_ac97_cmix_new(card, "Line Playback",
-					     AC97_LINE, 1, ac97)) < 0)
+		err = snd_ac97_cmix_new(card, "Line Playback",
+					AC97_LINE, 1, ac97);
+		if (err < 0)
 			return err;
 	}
 	
 	/* build CD controls */
 	if (!(ac97->flags & AC97_HAS_NO_CD)) {
 		if (snd_ac97_try_volume_mix(ac97, AC97_CD)) {
-			if ((err = snd_ac97_cmix_new(card, "CD Playback",
-						     AC97_CD, 1, ac97)) < 0)
+			err = snd_ac97_cmix_new(card, "CD Playback",
+						AC97_CD, 1, ac97);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1453,8 +1472,9 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	/* build Video controls */
 	if (!(ac97->flags & AC97_HAS_NO_VIDEO)) {
 		if (snd_ac97_try_volume_mix(ac97, AC97_VIDEO)) {
-			if ((err = snd_ac97_cmix_new(card, "Video Playback",
-						     AC97_VIDEO, 1, ac97)) < 0)
+			err = snd_ac97_cmix_new(card, "Video Playback",
+						AC97_VIDEO, 1, ac97);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1462,8 +1482,9 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	/* build Aux controls */
 	if (!(ac97->flags & AC97_HAS_NO_AUX)) {
 		if (snd_ac97_try_volume_mix(ac97, AC97_AUX)) {
-			if ((err = snd_ac97_cmix_new(card, "Aux Playback",
-						     AC97_AUX, 1, ac97)) < 0)
+			err = snd_ac97_cmix_new(card, "Aux Playback",
+						AC97_AUX, 1, ac97);
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1475,26 +1496,38 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 			init_val = 0x9f9f;
 		else
 			init_val = 0x9f1f;
-		for (idx = 0; idx < 2; idx++)
-			if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_pcm[idx], ac97))) < 0)
+		for (idx = 0; idx < 2; idx++) {
+			kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_pcm[idx], ac97);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
+		}
 		set_tlv_db_scale(kctl, db_scale_5bit);
 		ac97->spec.ad18xx.pcmreg[0] = init_val;
 		if (ac97->scaps & AC97_SCAP_SURROUND_DAC) {
-			for (idx = 0; idx < 2; idx++)
-				if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_surround[idx], ac97))) < 0)
+			for (idx = 0; idx < 2; idx++) {
+				kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_surround[idx], ac97);
+				err = snd_ctl_add(card, kctl);
+				if (err < 0)
 					return err;
+			}
 			set_tlv_db_scale(kctl, db_scale_5bit);
 			ac97->spec.ad18xx.pcmreg[1] = init_val;
 		}
 		if (ac97->scaps & AC97_SCAP_CENTER_LFE_DAC) {
-			for (idx = 0; idx < 2; idx++)
-				if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_center[idx], ac97))) < 0)
+			for (idx = 0; idx < 2; idx++) {
+				kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_center[idx], ac97);
+				err = snd_ctl_add(card, kctl);
+				if (err < 0)
 					return err;
+			}
 			set_tlv_db_scale(kctl, db_scale_5bit);
-			for (idx = 0; idx < 2; idx++)
-				if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_lfe[idx], ac97))) < 0)
+			for (idx = 0; idx < 2; idx++) {
+				kctl = snd_ac97_cnew(&snd_ac97_controls_ad18xx_lfe[idx], ac97);
+				err = snd_ctl_add(card, kctl);
+				if (err < 0)
 					return err;
+			}
 			set_tlv_db_scale(kctl, db_scale_5bit);
 			ac97->spec.ad18xx.pcmreg[2] = init_val;
 		}
@@ -1515,7 +1548,8 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 
 	/* build Capture controls */
 	if (!(ac97->flags & AC97_HAS_NO_REC_GAIN)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_control_capture_src, ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_control_capture_src, ac97));
+		if (err < 0)
 			return err;
 		if (snd_ac97_try_bit(ac97, AC97_REC_GAIN, 15)) {
 			err = snd_ac97_cmute_new(card, "Capture Switch",
@@ -1523,7 +1557,9 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 			if (err < 0)
 				return err;
 		}
-		if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_control_capture_vol, ac97))) < 0)
+		kctl = snd_ac97_cnew(&snd_ac97_control_capture_vol, ac97);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 		set_tlv_db_scale(kctl, db_scale_rec_gain);
 		snd_ac97_write_cache(ac97, AC97_REC_SEL, 0x0000);
@@ -1531,52 +1567,62 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	}
 	/* build MIC Capture controls */
 	if (snd_ac97_try_volume_mix(ac97, AC97_REC_GAIN_MIC)) {
-		for (idx = 0; idx < 2; idx++)
-			if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_mic_capture[idx], ac97))) < 0)
+		for (idx = 0; idx < 2; idx++) {
+			kctl = snd_ac97_cnew(&snd_ac97_controls_mic_capture[idx], ac97);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
+		}
 		set_tlv_db_scale(kctl, db_scale_rec_gain);
 		snd_ac97_write_cache(ac97, AC97_REC_GAIN_MIC, 0x0000);
 	}
 
 	/* build PCM out path & mute control */
 	if (snd_ac97_try_bit(ac97, AC97_GENERAL_PURPOSE, 15)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_PCM_OUT], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_PCM_OUT], ac97));
+		if (err < 0)
 			return err;
 	}
 
 	/* build Simulated Stereo Enhancement control */
 	if (ac97->caps & AC97_BC_SIM_STEREO) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_STEREO_ENHANCEMENT], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_STEREO_ENHANCEMENT], ac97));
+		if (err < 0)
 			return err;
 	}
 
 	/* build 3D Stereo Enhancement control */
 	if (snd_ac97_try_bit(ac97, AC97_GENERAL_PURPOSE, 13)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_3D], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_3D], ac97));
+		if (err < 0)
 			return err;
 	}
 
 	/* build Loudness control */
 	if (ac97->caps & AC97_BC_LOUDNESS) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_LOUDNESS], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_LOUDNESS], ac97));
+		if (err < 0)
 			return err;
 	}
 
 	/* build Mono output select control */
 	if (snd_ac97_try_bit(ac97, AC97_GENERAL_PURPOSE, 9)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_MONO], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_MONO], ac97));
+		if (err < 0)
 			return err;
 	}
 
 	/* build Mic select control */
 	if (snd_ac97_try_bit(ac97, AC97_GENERAL_PURPOSE, 8)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_MIC], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_MIC], ac97));
+		if (err < 0)
 			return err;
 	}
 
 	/* build ADC/DAC loopback control */
 	if (enable_loopback && snd_ac97_try_bit(ac97, AC97_GENERAL_PURPOSE, 7)) {
-		if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_LOOPBACK], ac97))) < 0)
+		err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_general[AC97_GENERAL_LOOPBACK], ac97));
+		if (err < 0)
 			return err;
 	}
 
@@ -1592,11 +1638,15 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 			snd_ac97_write(ac97, AC97_3D_CONTROL, val);
 			val = snd_ac97_read(ac97, AC97_3D_CONTROL);
 			val = val == 0x0606;
-			if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97))) < 0)
+			kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 			if (val)
 				kctl->private_value = AC97_3D_CONTROL | (9 << 8) | (7 << 16);
-			if ((err = snd_ctl_add(card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[1], ac97))) < 0)
+			kctl = snd_ac97_cnew(&snd_ac97_controls_3d[1], ac97);
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 			if (val)
 				kctl->private_value = AC97_3D_CONTROL | (1 << 8) | (7 << 16);
@@ -1613,14 +1663,18 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 
 	if ((ac97->ext_id & AC97_EI_SPDIF) && !(ac97->scaps & AC97_SCAP_NO_SPDIF)) {
 		if (ac97->build_ops->build_spdif) {
-			if ((err = ac97->build_ops->build_spdif(ac97)) < 0)
+			err = ac97->build_ops->build_spdif(ac97);
+			if (err < 0)
 				return err;
 		} else {
-			for (idx = 0; idx < 5; idx++)
-				if ((err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_spdif[idx], ac97))) < 0)
+			for (idx = 0; idx < 5; idx++) {
+				err = snd_ctl_add(card, snd_ac97_cnew(&snd_ac97_controls_spdif[idx], ac97));
+				if (err < 0)
 					return err;
+			}
 			if (ac97->build_ops->build_post_spdif) {
-				if ((err = ac97->build_ops->build_post_spdif(ac97)) < 0)
+				err = ac97->build_ops->build_post_spdif(ac97);
+				if (err < 0)
 					return err;
 			}
 			/* set default PCM S/PDIF params */
@@ -1632,9 +1686,11 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 	}
 	
 	/* build chip specific controls */
-	if (ac97->build_ops->build_specific)
-		if ((err = ac97->build_ops->build_specific(ac97)) < 0)
+	if (ac97->build_ops->build_specific) {
+		err = ac97->build_ops->build_specific(ac97);
+		if (err < 0)
 			return err;
+	}
 
 	if (snd_ac97_try_bit(ac97, AC97_POWERDOWN, 15)) {
 		kctl = snd_ac97_cnew(&snd_ac97_control_eapd, ac97);
@@ -1642,7 +1698,8 @@ static int snd_ac97_mixer_build(struct snd_ac97 * ac97)
 			return -ENOMEM;
 		if (ac97->scaps & AC97_SCAP_INV_EAPD)
 			set_inv_eapd(ac97, kctl);
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 	}
 
@@ -1664,14 +1721,18 @@ static int snd_ac97_modem_build(struct snd_card *card, struct snd_ac97 * ac97)
 	snd_ac97_write(ac97, AC97_MISC_AFE, 0x0);
 
 	/* build modem switches */
-	for (idx = 0; idx < ARRAY_SIZE(snd_ac97_controls_modem_switches); idx++)
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_ac97_controls_modem_switches[idx], ac97))) < 0)
+	for (idx = 0; idx < ARRAY_SIZE(snd_ac97_controls_modem_switches); idx++) {
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_ac97_controls_modem_switches[idx], ac97));
+		if (err < 0)
 			return err;
+	}
 
 	/* build chip specific controls */
-	if (ac97->build_ops->build_specific)
-		if ((err = ac97->build_ops->build_specific(ac97)) < 0)
+	if (ac97->build_ops->build_specific) {
+		err = ac97->build_ops->build_specific(ac97);
+		if (err < 0)
 			return err;
+	}
 
 	return 0;
 }
@@ -1916,7 +1977,8 @@ int snd_ac97_bus(struct snd_card *card, int num,
 	bus->clock = 48000;
 	spin_lock_init(&bus->bus_lock);
 	snd_ac97_bus_proc_init(bus);
-	if ((err = snd_device_new(card, SNDRV_DEV_BUS, bus, &dev_ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_BUS, bus, &dev_ops);
+	if (err < 0) {
 		snd_ac97_bus_free(bus);
 		return err;
 	}
@@ -1944,7 +2006,8 @@ static int snd_ac97_dev_register(struct snd_device *device)
 	dev_set_name(&ac97->dev, "%d-%d:%s",
 		     ac97->bus->card->number, ac97->num,
 		     snd_ac97_get_short_name(ac97));
-	if ((err = device_register(&ac97->dev)) < 0) {
+	err = device_register(&ac97->dev);
+	if (err < 0) {
 		ac97_err(ac97, "Can't register ac97 bus\n");
 		ac97->dev.bus = NULL;
 		return err;
@@ -2095,7 +2158,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 	if (!(ac97->scaps & AC97_SCAP_SKIP_AUDIO) && !(ac97->scaps & AC97_SCAP_AUDIO)) {
 		/* test if we can write to the record gain volume register */
 		snd_ac97_write_cache(ac97, AC97_REC_GAIN, 0x8a06);
-		if (((err = snd_ac97_read(ac97, AC97_REC_GAIN)) & 0x7fff) == 0x0a06)
+		err = snd_ac97_read(ac97, AC97_REC_GAIN);
+		if ((err & 0x7fff) == 0x0a06)
 			ac97->scaps |= AC97_SCAP_AUDIO;
 	}
 	if (ac97->scaps & AC97_SCAP_AUDIO) {
@@ -2248,7 +2312,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 			}
 		}
 		sprintf(comp, "AC97a:%08x", ac97->id);
-		if ((err = snd_component_add(card, comp)) < 0) {
+		err = snd_component_add(card, comp);
+		if (err < 0) {
 			snd_ac97_free(ac97);
 			return err;
 		}
@@ -2268,7 +2333,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 			}
 		}
 		sprintf(comp, "AC97m:%08x", ac97->id);
-		if ((err = snd_component_add(card, comp)) < 0) {
+		err = snd_component_add(card, comp);
+		if (err < 0) {
 			snd_ac97_free(ac97);
 			return err;
 		}
@@ -2280,7 +2346,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 	if (ac97_is_audio(ac97))
 		update_power_regs(ac97);
 	snd_ac97_proc_init(ac97);
-	if ((err = snd_device_new(card, SNDRV_DEV_CODEC, ac97, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_CODEC, ac97, &ops);
+	if (err < 0) {
 		snd_ac97_free(ac97);
 		return err;
 	}
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 1627a74baf3c..025c1666c1fc 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -29,9 +29,11 @@ static int patch_build_controls(struct snd_ac97 * ac97, const struct snd_kcontro
 {
 	int idx, err;
 
-	for (idx = 0; idx < count; idx++)
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&controls[idx], ac97))) < 0)
+	for (idx = 0; idx < count; idx++) {
+		err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&controls[idx], ac97));
+		if (err < 0)
 			return err;
+	}
 	return 0;
 }
 
@@ -416,7 +418,8 @@ static int patch_yamaha_ymf753_post_spdif(struct snd_ac97 * ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, snd_ac97_ymf753_controls_spdif, ARRAY_SIZE(snd_ac97_ymf753_controls_spdif))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_ymf753_controls_spdif, ARRAY_SIZE(snd_ac97_ymf753_controls_spdif));
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -461,7 +464,8 @@ static int patch_wolfson_wm9703_specific(struct snd_ac97 * ac97)
 	int err, i;
 	
 	for (i = 0; i < ARRAY_SIZE(wm97xx_snd_ac97_controls); i++) {
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm97xx_snd_ac97_controls[i], ac97))) < 0)
+		err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm97xx_snd_ac97_controls[i], ac97));
+		if (err < 0)
 			return err;
 	}
 	snd_ac97_write_cache(ac97,  AC97_WM97XX_FMIXER_VOL, 0x0808);
@@ -491,7 +495,8 @@ static int patch_wolfson_wm9704_specific(struct snd_ac97 * ac97)
 {
 	int err, i;
 	for (i = 0; i < ARRAY_SIZE(wm9704_snd_ac97_controls); i++) {
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm9704_snd_ac97_controls[i], ac97))) < 0)
+		err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm9704_snd_ac97_controls[i], ac97));
+		if (err < 0)
 			return err;
 	}
 	/* patch for DVD noise */
@@ -631,7 +636,8 @@ static int patch_wolfson_wm9711_specific(struct snd_ac97 * ac97)
 	int err, i;
 	
 	for (i = 0; i < ARRAY_SIZE(wm9711_snd_ac97_controls); i++) {
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm9711_snd_ac97_controls[i], ac97))) < 0)
+		err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm9711_snd_ac97_controls[i], ac97));
+		if (err < 0)
 			return err;
 	}
 	snd_ac97_write_cache(ac97,  AC97_CODEC_CLASS_REV, 0x0808);
@@ -798,7 +804,8 @@ static int patch_wolfson_wm9713_3d (struct snd_ac97 * ac97)
 	int err, i;
     
 	for (i = 0; i < ARRAY_SIZE(wm13_snd_ac97_controls_3d); i++) {
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm13_snd_ac97_controls_3d[i], ac97))) < 0)
+		err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm13_snd_ac97_controls_3d[i], ac97));
+		if (err < 0)
 			return err;
 	}
 	return 0;
@@ -809,7 +816,8 @@ static int patch_wolfson_wm9713_specific(struct snd_ac97 * ac97)
 	int err, i;
 	
 	for (i = 0; i < ARRAY_SIZE(wm13_snd_ac97_controls); i++) {
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm13_snd_ac97_controls[i], ac97))) < 0)
+		err = snd_ctl_add(ac97->bus->card, snd_ac97_cnew(&wm13_snd_ac97_controls[i], ac97));
+		if (err < 0)
 			return err;
 	}
 	snd_ac97_write_cache(ac97, AC97_PC_BEEP, 0x0808);
@@ -883,7 +891,8 @@ static int patch_sigmatel_stac9700_3d(struct snd_ac97 * ac97)
 	struct snd_kcontrol *kctl;
 	int err;
 
-	if ((err = snd_ctl_add(ac97->bus->card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97))) < 0)
+	err = snd_ctl_add(ac97->bus->card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97));
+	if (err < 0)
 		return err;
 	strcpy(kctl->id.name, "3D Control Sigmatel - Depth");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 2, 3, 0);
@@ -896,11 +905,15 @@ static int patch_sigmatel_stac9708_3d(struct snd_ac97 * ac97)
 	struct snd_kcontrol *kctl;
 	int err;
 
-	if ((err = snd_ctl_add(ac97->bus->card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97))) < 0)
+	kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97);
+	err = snd_ctl_add(ac97->bus->card, kctl);
+	if (err < 0)
 		return err;
 	strcpy(kctl->id.name, "3D Control Sigmatel - Depth");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 0, 3, 0);
-	if ((err = snd_ctl_add(ac97->bus->card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97))) < 0)
+	kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97);
+	err = snd_ctl_add(ac97->bus->card, kctl);
+	if (err < 0)
 		return err;
 	strcpy(kctl->id.name, "3D Control Sigmatel - Rear Depth");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 2, 3, 0);
@@ -927,18 +940,26 @@ static int patch_sigmatel_stac97xx_specific(struct snd_ac97 * ac97)
 	int err;
 
 	snd_ac97_write_cache(ac97, AC97_SIGMATEL_ANALOG, snd_ac97_read(ac97, AC97_SIGMATEL_ANALOG) & ~0x0003);
-	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_ANALOG, 1))
-		if ((err = patch_build_controls(ac97, &snd_ac97_sigmatel_controls[0], 1)) < 0)
+	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_ANALOG, 1)) {
+		err = patch_build_controls(ac97, &snd_ac97_sigmatel_controls[0], 1);
+		if (err < 0)
 			return err;
-	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_ANALOG, 0))
-		if ((err = patch_build_controls(ac97, &snd_ac97_sigmatel_controls[1], 1)) < 0)
+	}
+	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_ANALOG, 0)) {
+		err = patch_build_controls(ac97, &snd_ac97_sigmatel_controls[1], 1);
+		if (err < 0)
 			return err;
-	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_DAC2INVERT, 2))
-		if ((err = patch_build_controls(ac97, &snd_ac97_sigmatel_4speaker, 1)) < 0)
+	}
+	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_DAC2INVERT, 2)) {
+		err = patch_build_controls(ac97, &snd_ac97_sigmatel_4speaker, 1);
+		if (err < 0)
 			return err;
-	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_DAC2INVERT, 3))
-		if ((err = patch_build_controls(ac97, &snd_ac97_sigmatel_phaseinvert, 1)) < 0)
+	}
+	if (snd_ac97_try_bit(ac97, AC97_SIGMATEL_DAC2INVERT, 3)) {
+		err = patch_build_controls(ac97, &snd_ac97_sigmatel_phaseinvert, 1);
+		if (err < 0)
 			return err;
+	}
 	return 0;
 }
 
@@ -984,7 +1005,8 @@ static int patch_sigmatel_stac9708_specific(struct snd_ac97 *ac97)
 	snd_ac97_remove_ctl(ac97, "PCM Out Path & Mute", NULL);
 
 	snd_ac97_rename_vol_ctl(ac97, "Headphone Playback", "Sigmatel Surround Playback");
-	if ((err = patch_build_controls(ac97, &snd_ac97_stac9708_bias_control, 1)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_stac9708_bias_control, 1);
+	if (err < 0)
 		return err;
 	return patch_sigmatel_stac97xx_specific(ac97);
 }
@@ -1262,14 +1284,17 @@ static int patch_cirrus_build_spdif(struct snd_ac97 * ac97)
 	int err;
 
 	/* con mask, pro mask, default */
-	if ((err = patch_build_controls(ac97, &snd_ac97_controls_spdif[0], 3)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_controls_spdif[0], 3);
+	if (err < 0)
 		return err;
 	/* switch, spsa */
-	if ((err = patch_build_controls(ac97, &snd_ac97_cirrus_controls_spdif[0], 1)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_cirrus_controls_spdif[0], 1);
+	if (err < 0)
 		return err;
 	switch (ac97->id & AC97_ID_CS_MASK) {
 	case AC97_ID_CS4205:
-		if ((err = patch_build_controls(ac97, &snd_ac97_cirrus_controls_spdif[1], 1)) < 0)
+		err = patch_build_controls(ac97, &snd_ac97_cirrus_controls_spdif[1], 1);
+		if (err < 0)
 			return err;
 		break;
 	}
@@ -1324,10 +1349,12 @@ static int patch_conexant_build_spdif(struct snd_ac97 * ac97)
 	int err;
 
 	/* con mask, pro mask, default */
-	if ((err = patch_build_controls(ac97, &snd_ac97_controls_spdif[0], 3)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_controls_spdif[0], 3);
+	if (err < 0)
 		return err;
 	/* switch */
-	if ((err = patch_build_controls(ac97, &snd_ac97_conexant_controls_spdif[0], 1)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_conexant_controls_spdif[0], 1);
+	if (err < 0)
 		return err;
 	/* set default PCM S/PDIF params */
 	/* consumer,PCM audio,no copyright,no preemphasis,PCM coder,original,48000Hz */
@@ -1592,7 +1619,8 @@ static int patch_ad1885_specific(struct snd_ac97 * ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, snd_ac97_controls_ad1885, ARRAY_SIZE(snd_ac97_controls_ad1885))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_controls_ad1885, ARRAY_SIZE(snd_ac97_controls_ad1885));
+	if (err < 0)
 		return err;
 	reset_tlv(ac97, "Headphone Playback Volume",
 		  db_scale_6bit_6db_max);
@@ -1875,7 +1903,8 @@ static int patch_ad1981b_specific(struct snd_ac97 *ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1);
+	if (err < 0)
 		return err;
 	if (check_list(ac97, ad1981_jacks_denylist))
 		return 0;
@@ -2060,7 +2089,8 @@ static int patch_ad1980_specific(struct snd_ac97 *ac97)
 {
 	int err;
 
-	if ((err = patch_ad1888_specific(ac97)) < 0)
+	err = patch_ad1888_specific(ac97);
+	if (err < 0)
 		return err;
 	return patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1);
 }
@@ -2168,7 +2198,8 @@ static int patch_ad1985_specific(struct snd_ac97 *ac97)
 				"Master Surround Playback");
 	snd_ac97_rename_vol_ctl(ac97, "Headphone Playback", "Master Playback");
 
-	if ((err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1);
+	if (err < 0)
 		return err;
 
 	return patch_build_controls(ac97, snd_ac97_ad1985_controls,
@@ -2460,7 +2491,8 @@ static int patch_ad1986_specific(struct snd_ac97 *ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1)) < 0)
+	err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1);
+	if (err < 0)
 		return err;
 
 	return patch_build_controls(ac97, snd_ac97_ad1986_controls,
@@ -2582,10 +2614,12 @@ static int patch_alc650_specific(struct snd_ac97 * ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, snd_ac97_controls_alc650, ARRAY_SIZE(snd_ac97_controls_alc650))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_controls_alc650, ARRAY_SIZE(snd_ac97_controls_alc650));
+	if (err < 0)
 		return err;
 	if (ac97->ext_id & AC97_EI_SPDIF) {
-		if ((err = patch_build_controls(ac97, snd_ac97_spdif_controls_alc650, ARRAY_SIZE(snd_ac97_spdif_controls_alc650))) < 0)
+		err = patch_build_controls(ac97, snd_ac97_spdif_controls_alc650, ARRAY_SIZE(snd_ac97_spdif_controls_alc650));
+		if (err < 0)
 			return err;
 	}
 	if (ac97->id != AC97_ID_ALC650F)
@@ -2735,10 +2769,12 @@ static int patch_alc655_specific(struct snd_ac97 * ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, snd_ac97_controls_alc655, ARRAY_SIZE(snd_ac97_controls_alc655))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_controls_alc655, ARRAY_SIZE(snd_ac97_controls_alc655));
+	if (err < 0)
 		return err;
 	if (ac97->ext_id & AC97_EI_SPDIF) {
-		if ((err = patch_build_controls(ac97, snd_ac97_spdif_controls_alc655, ARRAY_SIZE(snd_ac97_spdif_controls_alc655))) < 0)
+		err = patch_build_controls(ac97, snd_ac97_spdif_controls_alc655, ARRAY_SIZE(snd_ac97_spdif_controls_alc655));
+		if (err < 0)
 			return err;
 	}
 	return 0;
@@ -2847,10 +2883,12 @@ static int patch_alc850_specific(struct snd_ac97 *ac97)
 {
 	int err;
 
-	if ((err = patch_build_controls(ac97, snd_ac97_controls_alc850, ARRAY_SIZE(snd_ac97_controls_alc850))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_controls_alc850, ARRAY_SIZE(snd_ac97_controls_alc850));
+	if (err < 0)
 		return err;
 	if (ac97->ext_id & AC97_EI_SPDIF) {
-		if ((err = patch_build_controls(ac97, snd_ac97_spdif_controls_alc655, ARRAY_SIZE(snd_ac97_spdif_controls_alc655))) < 0)
+		err = patch_build_controls(ac97, snd_ac97_spdif_controls_alc655, ARRAY_SIZE(snd_ac97_spdif_controls_alc655));
+		if (err < 0)
 			return err;
 	}
 	return 0;
@@ -3437,10 +3475,13 @@ static int patch_vt1616_specific(struct snd_ac97 * ac97)
 	struct snd_kcontrol *kctl;
 	int err;
 
-	if (snd_ac97_try_bit(ac97, 0x5a, 9))
-		if ((err = patch_build_controls(ac97, &snd_ac97_controls_vt1616[0], 1)) < 0)
+	if (snd_ac97_try_bit(ac97, 0x5a, 9)) {
+		err = patch_build_controls(ac97, &snd_ac97_controls_vt1616[0], 1);
+		if (err < 0)
 			return err;
-	if ((err = patch_build_controls(ac97, &snd_ac97_controls_vt1616[1], ARRAY_SIZE(snd_ac97_controls_vt1616) - 1)) < 0)
+	}
+	err = patch_build_controls(ac97, &snd_ac97_controls_vt1616[1], ARRAY_SIZE(snd_ac97_controls_vt1616) - 1);
+	if (err < 0)
 		return err;
 
 	/* There is already a misnamed master switch.  Rename it.  */
@@ -3810,9 +3851,11 @@ static const struct snd_kcontrol_new snd_ac97_spdif_controls_it2646[] = {
 static int patch_it2646_specific(struct snd_ac97 * ac97)
 {
 	int err;
-	if ((err = patch_build_controls(ac97, snd_ac97_controls_it2646, ARRAY_SIZE(snd_ac97_controls_it2646))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_controls_it2646, ARRAY_SIZE(snd_ac97_controls_it2646));
+	if (err < 0)
 		return err;
-	if ((err = patch_build_controls(ac97, snd_ac97_spdif_controls_it2646, ARRAY_SIZE(snd_ac97_spdif_controls_it2646))) < 0)
+	err = patch_build_controls(ac97, snd_ac97_spdif_controls_it2646, ARRAY_SIZE(snd_ac97_spdif_controls_it2646));
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -3845,9 +3888,11 @@ AC97_DOUBLE("Modem Speaker Volume", 0x5c, 14, 12, 3, 1)
 static int patch_si3036_specific(struct snd_ac97 * ac97)
 {
 	int idx, err;
-	for (idx = 0; idx < ARRAY_SIZE(snd_ac97_controls_si3036); idx++)
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ctl_new1(&snd_ac97_controls_si3036[idx], ac97))) < 0)
+	for (idx = 0; idx < ARRAY_SIZE(snd_ac97_controls_si3036); idx++) {
+		err = snd_ctl_add(ac97->bus->card, snd_ctl_new1(&snd_ac97_controls_si3036[idx], ac97));
+		if (err < 0)
 			return err;
+	}
 	return 0;
 }
 
@@ -3912,9 +3957,11 @@ AC97_SINGLE("Smart Low Power Mode", 0x6c, 4, 3, 0),
 static int patch_ucb1400_specific(struct snd_ac97 * ac97)
 {
 	int idx, err;
-	for (idx = 0; idx < ARRAY_SIZE(snd_ac97_controls_ucb1400); idx++)
-		if ((err = snd_ctl_add(ac97->bus->card, snd_ctl_new1(&snd_ac97_controls_ucb1400[idx], ac97))) < 0)
+	for (idx = 0; idx < ARRAY_SIZE(snd_ac97_controls_ucb1400); idx++) {
+		err = snd_ctl_add(ac97->bus->card, snd_ctl_new1(&snd_ac97_controls_ucb1400[idx], ac97));
+		if (err < 0)
 			return err;
+	}
 	return 0;
 }
 
-- 
2.26.2

