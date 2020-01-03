Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD612F5AD
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:45:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037471766;
	Fri,  3 Jan 2020 09:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037471766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041106;
	bh=0lOXqSEWKoJBl6MH/opTbRCVSml21dovETLgrqZ0Smk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tROR9999U9/Xt4htE/Y+huQJUoVgubXFq5M9b8S9NY/zYmWm0jvpjb9d0rakauS5A
	 J39uzovTSuuL9pIBi8JS3UKldlVLlSz0UrzET6CE8F/WsdO2NahtZka2VaG33eYmpF
	 aGSxiS/lL38mQrsAVNTj7VhcE336rCxFsnspo6fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA32F80477;
	Fri,  3 Jan 2020 09:19:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D4AF80383; Fri,  3 Jan 2020 09:18:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6314F802A9
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6314F802A9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89BE4B27B
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:54 +0100
Message-Id: <20200103081714.9560-39-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 38/58] ALSA: ppc: Constify snd_kcontrol_new
	items
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Most of snd_kcontrol_new definitions are read-only and passed as-is.
Let's declare them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/awacs.c    | 50 +++++++++++++++++++++++++-------------------------
 sound/ppc/burgundy.c | 20 ++++++++++----------
 sound/ppc/daca.c     |  2 +-
 sound/ppc/pmac.c     |  2 +-
 sound/ppc/snd_ps3.c  |  2 +-
 sound/ppc/tumbler.c  |  4 ++--
 6 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
index 359d22a81ae3..73c0fd7277e6 100644
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -464,7 +464,7 @@ static int snd_pmac_awacs_put_master_amp(struct snd_kcontrol *kcontrol,
 #define AMP_CH_SPK	0
 #define AMP_CH_HD	1
 
-static struct snd_kcontrol_new snd_pmac_awacs_amp_vol[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_amp_vol[] = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Speaker Playback Volume",
 	  .info = snd_pmac_awacs_info_volume_amp,
@@ -582,46 +582,46 @@ static int snd_pmac_screamer_mic_boost_put(struct snd_kcontrol *kcontrol,
 /*
  * lists of mixer elements
  */
-static struct snd_kcontrol_new snd_pmac_awacs_mixers[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mixers[] = {
 	AWACS_SWITCH("Master Capture Switch", 1, SHIFT_LOOPTHRU, 0),
 	AWACS_VOLUME("Master Capture Volume", 0, 4, 0),
 /*	AWACS_SWITCH("Unknown Playback Switch", 6, SHIFT_PAROUT0, 0), */
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mixers_beige[] = {
+static const struct snd_kcontrol_new snd_pmac_screamer_mixers_beige[] = {
 	AWACS_VOLUME("Master Playback Volume", 2, 6, 1),
 	AWACS_VOLUME("Play-through Playback Volume", 5, 6, 1),
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_MIC, 0),
 	AWACS_SWITCH("CD Capture Switch", 0, SHIFT_MUX_LINE, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mixers_lo[] = {
+static const struct snd_kcontrol_new snd_pmac_screamer_mixers_lo[] = {
 	AWACS_VOLUME("Line out Playback Volume", 2, 6, 1),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mixers_imac[] = {
+static const struct snd_kcontrol_new snd_pmac_screamer_mixers_imac[] = {
 	AWACS_VOLUME("Play-through Playback Volume", 5, 6, 1),
 	AWACS_SWITCH("CD Capture Switch", 0, SHIFT_MUX_CD, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mixers_g4agp[] = {
+static const struct snd_kcontrol_new snd_pmac_screamer_mixers_g4agp[] = {
 	AWACS_VOLUME("Line out Playback Volume", 2, 6, 1),
 	AWACS_VOLUME("Master Playback Volume", 5, 6, 1),
 	AWACS_SWITCH("CD Capture Switch", 0, SHIFT_MUX_CD, 0),
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_MIC, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac7500[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac7500[] = {
 	AWACS_VOLUME("Line out Playback Volume", 2, 6, 1),
 	AWACS_SWITCH("CD Capture Switch", 0, SHIFT_MUX_CD, 0),
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_MIC, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac5500[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac5500[] = {
 	AWACS_VOLUME("Headphone Playback Volume", 2, 6, 1),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac[] = {
 	AWACS_VOLUME("Master Playback Volume", 2, 6, 1),
 	AWACS_SWITCH("CD Capture Switch", 0, SHIFT_MUX_CD, 0),
 };
@@ -629,34 +629,34 @@ static struct snd_kcontrol_new snd_pmac_awacs_mixers_pmac[] = {
 /* FIXME: is this correct order?
  * screamer (powerbook G3 pismo) seems to have different bits...
  */
-static struct snd_kcontrol_new snd_pmac_awacs_mixers2[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mixers2[] = {
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_LINE, 0),
 	AWACS_SWITCH("Mic Capture Switch", 0, SHIFT_MUX_MIC, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mixers2[] = {
+static const struct snd_kcontrol_new snd_pmac_screamer_mixers2[] = {
 	AWACS_SWITCH("Line Capture Switch", 0, SHIFT_MUX_MIC, 0),
 	AWACS_SWITCH("Mic Capture Switch", 0, SHIFT_MUX_LINE, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_mixers2_pmac5500[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mixers2_pmac5500[] = {
 	AWACS_SWITCH("CD Capture Switch", 0, SHIFT_MUX_CD, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_master_sw =
+static const struct snd_kcontrol_new snd_pmac_awacs_master_sw =
 AWACS_SWITCH("Master Playback Switch", 1, SHIFT_HDMUTE, 1);
 
-static struct snd_kcontrol_new snd_pmac_awacs_master_sw_imac =
+static const struct snd_kcontrol_new snd_pmac_awacs_master_sw_imac =
 AWACS_SWITCH("Line out Playback Switch", 1, SHIFT_HDMUTE, 1);
 
-static struct snd_kcontrol_new snd_pmac_awacs_master_sw_pmac5500 =
+static const struct snd_kcontrol_new snd_pmac_awacs_master_sw_pmac5500 =
 AWACS_SWITCH("Headphone Playback Switch", 1, SHIFT_HDMUTE, 1);
 
-static struct snd_kcontrol_new snd_pmac_awacs_mic_boost[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_mic_boost[] = {
 	AWACS_SWITCH("Mic Boost Capture Switch", 0, SHIFT_GAINLINE, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mic_boost[] = {
+static const struct snd_kcontrol_new snd_pmac_screamer_mic_boost[] = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Mic Boost Capture Volume",
 	  .info = snd_pmac_screamer_mic_boost_info,
@@ -665,34 +665,34 @@ static struct snd_kcontrol_new snd_pmac_screamer_mic_boost[] = {
 	},
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_mic_boost_pmac7500[] =
+static const struct snd_kcontrol_new snd_pmac_awacs_mic_boost_pmac7500[] =
 {
 	AWACS_SWITCH("Line Boost Capture Switch", 0, SHIFT_GAINLINE, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mic_boost_beige[] =
+static const struct snd_kcontrol_new snd_pmac_screamer_mic_boost_beige[] =
 {
 	AWACS_SWITCH("Line Boost Capture Switch", 0, SHIFT_GAINLINE, 0),
 	AWACS_SWITCH("CD Boost Capture Switch", 6, SHIFT_MIC_BOOST, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_screamer_mic_boost_imac[] =
+static const struct snd_kcontrol_new snd_pmac_screamer_mic_boost_imac[] =
 {
 	AWACS_SWITCH("Line Boost Capture Switch", 0, SHIFT_GAINLINE, 0),
 	AWACS_SWITCH("Mic Boost Capture Switch", 6, SHIFT_MIC_BOOST, 0),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_speaker_vol[] = {
+static const struct snd_kcontrol_new snd_pmac_awacs_speaker_vol[] = {
 	AWACS_VOLUME("Speaker Playback Volume", 4, 6, 1),
 };
 
-static struct snd_kcontrol_new snd_pmac_awacs_speaker_sw =
+static const struct snd_kcontrol_new snd_pmac_awacs_speaker_sw =
 AWACS_SWITCH("Speaker Playback Switch", 1, SHIFT_SPKMUTE, 1);
 
-static struct snd_kcontrol_new snd_pmac_awacs_speaker_sw_imac1 =
+static const struct snd_kcontrol_new snd_pmac_awacs_speaker_sw_imac1 =
 AWACS_SWITCH("Speaker Playback Switch", 1, SHIFT_PAROUT1, 1);
 
-static struct snd_kcontrol_new snd_pmac_awacs_speaker_sw_imac2 =
+static const struct snd_kcontrol_new snd_pmac_awacs_speaker_sw_imac2 =
 AWACS_SWITCH("Speaker Playback Switch", 1, SHIFT_PAROUT1, 0);
 
 
@@ -700,7 +700,7 @@ AWACS_SWITCH("Speaker Playback Switch", 1, SHIFT_PAROUT1, 0);
  * add new mixer elements to the card
  */
 static int build_mixers(struct snd_pmac *chip, int nums,
-			struct snd_kcontrol_new *mixers)
+			const struct snd_kcontrol_new *mixers)
 {
 	int i, err;
 
diff --git a/sound/ppc/burgundy.c b/sound/ppc/burgundy.c
index a2a41e5245ef..4fb990ab2ceb 100644
--- a/sound/ppc/burgundy.c
+++ b/sound/ppc/burgundy.c
@@ -454,7 +454,7 @@ static int snd_pmac_burgundy_put_switch_b(struct snd_kcontrol *kcontrol,
 /*
  * Burgundy mixers
  */
-static struct snd_kcontrol_new snd_pmac_burgundy_mixers[] = {
+static const struct snd_kcontrol_new snd_pmac_burgundy_mixers[] = {
 	BURGUNDY_VOLUME_W("Master Playback Volume", 0,
 			MASK_ADDR_BURGUNDY_MASTER_VOLUME, 8),
 	BURGUNDY_VOLUME_W("CD Capture Volume", 0,
@@ -482,7 +482,7 @@ static struct snd_kcontrol_new snd_pmac_burgundy_mixers[] = {
  */	BURGUNDY_SWITCH_B("PCM Capture Switch", 0,
 			MASK_ADDR_BURGUNDY_HOSTIFEH, 0x01, 0, 0)
 };
-static struct snd_kcontrol_new snd_pmac_burgundy_mixers_imac[] = {
+static const struct snd_kcontrol_new snd_pmac_burgundy_mixers_imac[] = {
 	BURGUNDY_VOLUME_W("Line in Capture Volume", 0,
 			MASK_ADDR_BURGUNDY_VOLLINE, 16),
 	BURGUNDY_VOLUME_W("Mic Capture Volume", 0,
@@ -508,7 +508,7 @@ static struct snd_kcontrol_new snd_pmac_burgundy_mixers_imac[] = {
 	BURGUNDY_SWITCH_B("Mic Boost Capture Switch", 0,
 			MASK_ADDR_BURGUNDY_INPBOOST, 0x40, 0x80, 1)
 };
-static struct snd_kcontrol_new snd_pmac_burgundy_mixers_pmac[] = {
+static const struct snd_kcontrol_new snd_pmac_burgundy_mixers_pmac[] = {
 	BURGUNDY_VOLUME_W("Line in Capture Volume", 0,
 			MASK_ADDR_BURGUNDY_VOLMIC, 16),
 	BURGUNDY_VOLUME_B("Line in Gain Capture Volume", 0,
@@ -524,33 +524,33 @@ static struct snd_kcontrol_new snd_pmac_burgundy_mixers_pmac[] = {
 /*	BURGUNDY_SWITCH_B("Line in Boost Capture Switch", 0,
  *		MASK_ADDR_BURGUNDY_INPBOOST, 0x40, 0x80, 1) */
 };
-static struct snd_kcontrol_new snd_pmac_burgundy_master_sw_imac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_master_sw_imac =
 BURGUNDY_SWITCH_B("Master Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_OUTPUT_LEFT | BURGUNDY_LINEOUT_LEFT | BURGUNDY_HP_LEFT,
 	BURGUNDY_OUTPUT_RIGHT | BURGUNDY_LINEOUT_RIGHT | BURGUNDY_HP_RIGHT, 1);
-static struct snd_kcontrol_new snd_pmac_burgundy_master_sw_pmac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_master_sw_pmac =
 BURGUNDY_SWITCH_B("Master Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_OUTPUT_INTERN
 	| BURGUNDY_OUTPUT_LEFT, BURGUNDY_OUTPUT_RIGHT, 1);
-static struct snd_kcontrol_new snd_pmac_burgundy_speaker_sw_imac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_speaker_sw_imac =
 BURGUNDY_SWITCH_B("Speaker Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_OUTPUT_LEFT, BURGUNDY_OUTPUT_RIGHT, 1);
-static struct snd_kcontrol_new snd_pmac_burgundy_speaker_sw_pmac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_speaker_sw_pmac =
 BURGUNDY_SWITCH_B("Speaker Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_OUTPUT_INTERN, 0, 0);
-static struct snd_kcontrol_new snd_pmac_burgundy_line_sw_imac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_line_sw_imac =
 BURGUNDY_SWITCH_B("Line out Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_LINEOUT_LEFT, BURGUNDY_LINEOUT_RIGHT, 1);
-static struct snd_kcontrol_new snd_pmac_burgundy_line_sw_pmac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_line_sw_pmac =
 BURGUNDY_SWITCH_B("Line out Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_OUTPUT_LEFT, BURGUNDY_OUTPUT_RIGHT, 1);
-static struct snd_kcontrol_new snd_pmac_burgundy_hp_sw_imac =
+static const struct snd_kcontrol_new snd_pmac_burgundy_hp_sw_imac =
 BURGUNDY_SWITCH_B("Headphone Playback Switch", 0,
 	MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES,
 	BURGUNDY_HP_LEFT, BURGUNDY_HP_RIGHT, 1);
diff --git a/sound/ppc/daca.c b/sound/ppc/daca.c
index f2b4478139a4..1eb698dafd93 100644
--- a/sound/ppc/daca.c
+++ b/sound/ppc/daca.c
@@ -186,7 +186,7 @@ static int daca_put_amp(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static struct snd_kcontrol_new daca_mixers[] = {
+static const struct snd_kcontrol_new daca_mixers[] = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Deemphasis Switch",
 	  .info = daca_info_deemphasis,
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 6ee97008c8f0..87738ddc8bfd 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -1104,7 +1104,7 @@ static int pmac_hp_detect_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new auto_mute_controls[] = {
+static const struct snd_kcontrol_new auto_mute_controls[] = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Auto Mute Switch",
 	  .info = snd_pmac_boolean_mono_info,
diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 2b4c0268a86b..6d2a33b8faa0 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -715,7 +715,7 @@ static int snd_ps3_spdif_default_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new spdif_ctls[] = {
+static const struct snd_kcontrol_new spdif_ctls[] = {
 	{
 		.access = SNDRV_CTL_ELEM_ACCESS_READ,
 		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 31bab6af645f..a5843035d718 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -826,7 +826,7 @@ static int snapper_put_capture_source(struct snd_kcontrol *kcontrol,
 
 /*
  */
-static struct snd_kcontrol_new tumbler_mixers[] = {
+static const struct snd_kcontrol_new tumbler_mixers[] = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Master Playback Volume",
 	  .info = tumbler_info_master_volume,
@@ -850,7 +850,7 @@ static struct snd_kcontrol_new tumbler_mixers[] = {
 	},
 };
 
-static struct snd_kcontrol_new snapper_mixers[] = {
+static const struct snd_kcontrol_new snapper_mixers[] = {
 	{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	  .name = "Master Playback Volume",
 	  .info = tumbler_info_master_volume,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
