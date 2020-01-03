Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A412F5AC
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1451B175C;
	Fri,  3 Jan 2020 09:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1451B175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041065;
	bh=V6y9fYAUN6Y9DFms3qS9tUkTnYA9M4TjwdmNwHGcC60=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+4i4JnpIhoTgvApj8iHMAGxbD4swP0HjTp81KP4/QEbWoAvZ6a6dwlAcpzyYfTPD
	 HGGy/9vP1mek5P9pt6vc9avtPINi1XBDKsUzFXHwKjtfQt2/oJGDux76oFHWAINXv/
	 7JitY5iDFcolHxcjRFwN6c7/ftcB5o/wCnCw6Bsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4179EF80474;
	Fri,  3 Jan 2020 09:19:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7593AF80384; Fri,  3 Jan 2020 09:18:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,
 RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DAB5F802A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DAB5F802A7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5850AB277
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:51 +0100
Message-Id: <20200103081714.9560-36-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 35/58] ALSA: isa: Constify snd_kcontrol_new
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
 sound/isa/ad1816a/ad1816a_lib.c      |  2 +-
 sound/isa/cmi8330.c                  |  2 +-
 sound/isa/cs423x/cs4236_lib.c        | 14 +++++++-------
 sound/isa/es1688/es1688_lib.c        |  2 +-
 sound/isa/es18xx.c                   | 26 +++++++++++++-------------
 sound/isa/gus/gus_mixer.c            |  4 ++--
 sound/isa/msnd/msnd_pinnacle_mixer.c |  2 +-
 sound/isa/opl3sa2.c                  |  4 ++--
 sound/isa/opti9xx/miro.c             | 14 +++++++-------
 sound/isa/opti9xx/opti92x-ad1848.c   |  2 +-
 sound/isa/sb/emu8000.c               | 14 +++++++-------
 sound/isa/sb/sb_mixer.c              |  2 +-
 sound/isa/wss/wss_lib.c              |  2 +-
 13 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 560885fbc983..01381fe7c0c9 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -884,7 +884,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_6bit, -9450, 150, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_5bit_12db_max, -3450, 150, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_rec_gain, 0, 150, 0);
 
-static struct snd_kcontrol_new snd_ad1816a_controls[] = {
+static const struct snd_kcontrol_new snd_ad1816a_controls[] = {
 AD1816A_DOUBLE("Master Playback Switch", AD1816A_MASTER_ATT, 15, 7, 1, 1),
 AD1816A_DOUBLE_TLV("Master Playback Volume", AD1816A_MASTER_ATT, 8, 0, 31, 1,
 		   db_scale_5bit),
diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index f8ec59a5bb8f..61d6944a69c7 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -179,7 +179,7 @@ MODULE_DEVICE_TABLE(pnp_card, snd_cmi8330_pnpids);
 #endif
 
 
-static struct snd_kcontrol_new snd_cmi8330_controls[] = {
+static const struct snd_kcontrol_new snd_cmi8330_controls[] = {
 WSS_DOUBLE("Master Playback Volume", 0,
 		CMI8330_MASTVOL, CMI8330_MASTVOL, 4, 0, 15, 0),
 WSS_SINGLE("Loud Playback Switch", 0,
diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index be48c60355d0..ca6646f9b58d 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -758,7 +758,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_4bit, -4500, 300, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_2bit, -1800, 600, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_rec_gain, 0, 150, 0);
 
-static struct snd_kcontrol_new snd_cs4236_controls[] = {
+static const struct snd_kcontrol_new snd_cs4236_controls[] = {
 
 CS4236_DOUBLE("Master Digital Playback Switch", 0,
 		CS4236_LEFT_MASTER, CS4236_RIGHT_MASTER, 7, 7, 1, 1),
@@ -853,7 +853,7 @@ CS4236_DOUBLE1_TLV("Loopback Digital Playback Volume", 0,
 static const DECLARE_TLV_DB_SCALE(db_scale_5bit_6db_max, -5600, 200, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_2bit_16db_max, -2400, 800, 0);
 
-static struct snd_kcontrol_new snd_cs4235_controls[] = {
+static const struct snd_kcontrol_new snd_cs4235_controls[] = {
 
 WSS_DOUBLE("Master Playback Switch", 0,
 		CS4235_LEFT_MASTER, CS4235_RIGHT_MASTER, 7, 7, 1, 1),
@@ -986,7 +986,7 @@ static int snd_cs4236_put_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 	return change;
 }
 
-static struct snd_kcontrol_new snd_cs4236_iec958_controls[] = {
+static const struct snd_kcontrol_new snd_cs4236_iec958_controls[] = {
 CS4236_IEC958_ENABLE("IEC958 Output Enable", 0),
 CS4236_SINGLEC("IEC958 Output Validity", 0, 4, 4, 1, 0),
 CS4236_SINGLEC("IEC958 Output User", 0, 4, 5, 1, 0),
@@ -995,12 +995,12 @@ CS4236_SINGLEC("IEC958 Output Channel Status Low", 0, 5, 1, 127, 0),
 CS4236_SINGLEC("IEC958 Output Channel Status High", 0, 6, 0, 255, 0)
 };
 
-static struct snd_kcontrol_new snd_cs4236_3d_controls_cs4235[] = {
+static const struct snd_kcontrol_new snd_cs4236_3d_controls_cs4235[] = {
 CS4236_SINGLEC("3D Control - Switch", 0, 3, 4, 1, 0),
 CS4236_SINGLEC("3D Control - Space", 0, 2, 4, 15, 1)
 };
 
-static struct snd_kcontrol_new snd_cs4236_3d_controls_cs4237[] = {
+static const struct snd_kcontrol_new snd_cs4236_3d_controls_cs4237[] = {
 CS4236_SINGLEC("3D Control - Switch", 0, 3, 7, 1, 0),
 CS4236_SINGLEC("3D Control - Space", 0, 2, 4, 15, 1),
 CS4236_SINGLEC("3D Control - Center", 0, 2, 0, 15, 1),
@@ -1008,7 +1008,7 @@ CS4236_SINGLEC("3D Control - Mono", 0, 3, 6, 1, 0),
 CS4236_SINGLEC("3D Control - IEC958", 0, 3, 5, 1, 0)
 };
 
-static struct snd_kcontrol_new snd_cs4236_3d_controls_cs4238[] = {
+static const struct snd_kcontrol_new snd_cs4236_3d_controls_cs4238[] = {
 CS4236_SINGLEC("3D Control - Switch", 0, 3, 4, 1, 0),
 CS4236_SINGLEC("3D Control - Space", 0, 2, 4, 15, 1),
 CS4236_SINGLEC("3D Control - Volume", 0, 2, 0, 15, 1),
@@ -1020,7 +1020,7 @@ int snd_cs4236_mixer(struct snd_wss *chip)
 	struct snd_card *card;
 	unsigned int idx, count;
 	int err;
-	struct snd_kcontrol_new *kcontrol;
+	const struct snd_kcontrol_new *kcontrol;
 
 	if (snd_BUG_ON(!chip || !chip->card))
 		return -EINVAL;
diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 99a833f29544..1568d0bfd1a8 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -924,7 +924,7 @@ static int snd_es1688_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	return change;
 }
 
-static struct snd_kcontrol_new snd_es1688_controls[] = {
+static const struct snd_kcontrol_new snd_es1688_controls[] = {
 ES1688_DOUBLE("Master Playback Volume", 0, ES1688_MASTER_DEV, ES1688_MASTER_DEV, 4, 0, 15, 0),
 ES1688_DOUBLE("PCM Playback Volume", 0, ES1688_PCM_DEV, ES1688_PCM_DEV, 4, 0, 15, 0),
 ES1688_DOUBLE("Line Playback Volume", 0, ES1688_LINE_DEV, ES1688_LINE_DEV, 4, 0, 15, 0),
diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index f9cd05d2b3bd..6ce5b5c76980 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1246,7 +1246,7 @@ static int snd_es18xx_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
  * The controls that are universal to all chipsets are fully initialized
  * here.
  */
-static struct snd_kcontrol_new snd_es18xx_base_controls[] = {
+static const struct snd_kcontrol_new snd_es18xx_base_controls[] = {
 ES18XX_DOUBLE("Master Playback Volume", 0, 0x60, 0x62, 0, 0, 63, 0),
 ES18XX_DOUBLE("Master Playback Switch", 0, 0x60, 0x62, 6, 6, 1, 1),
 ES18XX_DOUBLE("Line Playback Volume", 0, 0x3e, 0x3e, 4, 0, 15, 0),
@@ -1265,7 +1265,7 @@ ES18XX_DOUBLE("Capture Volume", 0, 0xb4, 0xb4, 4, 0, 15, 0),
 }
 };
 
-static struct snd_kcontrol_new snd_es18xx_recmix_controls[] = {
+static const struct snd_kcontrol_new snd_es18xx_recmix_controls[] = {
 ES18XX_DOUBLE("PCM Capture Volume", 0, 0x69, 0x69, 4, 0, 15, 0),
 ES18XX_DOUBLE("Mic Capture Volume", 0, 0x68, 0x68, 4, 0, 15, 0),
 ES18XX_DOUBLE("Line Capture Volume", 0, 0x6e, 0x6e, 4, 0, 15, 0),
@@ -1277,35 +1277,35 @@ ES18XX_DOUBLE("Aux Capture Volume", 0, 0x6c, 0x6c, 4, 0, 15, 0)
 /*
  * The chipset specific mixer controls
  */
-static struct snd_kcontrol_new snd_es18xx_opt_speaker =
+static const struct snd_kcontrol_new snd_es18xx_opt_speaker =
 	ES18XX_SINGLE("Beep Playback Volume", 0, 0x3c, 0, 7, 0);
 
-static struct snd_kcontrol_new snd_es18xx_opt_1869[] = {
+static const struct snd_kcontrol_new snd_es18xx_opt_1869[] = {
 ES18XX_SINGLE("Capture Switch", 0, 0x1c, 4, 1, ES18XX_FL_INVERT),
 ES18XX_SINGLE("Video Playback Switch", 0, 0x7f, 0, 1, 0),
 ES18XX_DOUBLE("Mono Playback Volume", 0, 0x6d, 0x6d, 4, 0, 15, 0),
 ES18XX_DOUBLE("Mono Capture Volume", 0, 0x6f, 0x6f, 4, 0, 15, 0)
 };
 
-static struct snd_kcontrol_new snd_es18xx_opt_1878 =
+static const struct snd_kcontrol_new snd_es18xx_opt_1878 =
 	ES18XX_DOUBLE("Video Playback Volume", 0, 0x68, 0x68, 4, 0, 15, 0);
 
-static struct snd_kcontrol_new snd_es18xx_opt_1879[] = {
+static const struct snd_kcontrol_new snd_es18xx_opt_1879[] = {
 ES18XX_SINGLE("Video Playback Switch", 0, 0x71, 6, 1, 0),
 ES18XX_DOUBLE("Video Playback Volume", 0, 0x6d, 0x6d, 4, 0, 15, 0),
 ES18XX_DOUBLE("Video Capture Volume", 0, 0x6f, 0x6f, 4, 0, 15, 0)
 };
 
-static struct snd_kcontrol_new snd_es18xx_pcm1_controls[] = {
+static const struct snd_kcontrol_new snd_es18xx_pcm1_controls[] = {
 ES18XX_DOUBLE("PCM Playback Volume", 0, 0x14, 0x14, 4, 0, 15, 0),
 };
 
-static struct snd_kcontrol_new snd_es18xx_pcm2_controls[] = {
+static const struct snd_kcontrol_new snd_es18xx_pcm2_controls[] = {
 ES18XX_DOUBLE("PCM Playback Volume", 0, 0x7c, 0x7c, 4, 0, 15, 0),
 ES18XX_DOUBLE("PCM Playback Volume", 1, 0x14, 0x14, 4, 0, 15, 0)
 };
 
-static struct snd_kcontrol_new snd_es18xx_spatializer_controls[] = {
+static const struct snd_kcontrol_new snd_es18xx_spatializer_controls[] = {
 ES18XX_SINGLE("3D Control - Level", 0, 0x52, 0, 63, 0),
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1316,13 +1316,13 @@ ES18XX_SINGLE("3D Control - Level", 0, 0x52, 0, 63, 0),
 }
 };
 
-static struct snd_kcontrol_new snd_es18xx_micpre1_control = 
+static const struct snd_kcontrol_new snd_es18xx_micpre1_control =
 ES18XX_SINGLE("Mic Boost (+26dB)", 0, 0xa9, 2, 1, 0);
 
-static struct snd_kcontrol_new snd_es18xx_micpre2_control =
+static const struct snd_kcontrol_new snd_es18xx_micpre2_control =
 ES18XX_SINGLE("Mic Boost (+26dB)", 0, 0x7d, 3, 1, 0);
 
-static struct snd_kcontrol_new snd_es18xx_hw_volume_controls[] = {
+static const struct snd_kcontrol_new snd_es18xx_hw_volume_controls[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Hardware Master Playback Volume",
@@ -1340,7 +1340,7 @@ static struct snd_kcontrol_new snd_es18xx_hw_volume_controls[] = {
 ES18XX_SINGLE("Hardware Master Volume Split", 0, 0x64, 7, 1, 0),
 };
 
-static struct snd_kcontrol_new snd_es18xx_opt_gpo_2bit[] = {
+static const struct snd_kcontrol_new snd_es18xx_opt_gpo_2bit[] = {
 ES18XX_SINGLE("GPO0 Switch", 0, ES18XX_PM, 0, 1, ES18XX_FL_PMPORT),
 ES18XX_SINGLE("GPO1 Switch", 0, ES18XX_PM, 1, 1, ES18XX_FL_PMPORT),
 };
diff --git a/sound/isa/gus/gus_mixer.c b/sound/isa/gus/gus_mixer.c
index 94e0c75ee417..201d0c40d0d9 100644
--- a/sound/isa/gus/gus_mixer.c
+++ b/sound/isa/gus/gus_mixer.c
@@ -120,13 +120,13 @@ static int snd_ics_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	return change;
 }
 
-static struct snd_kcontrol_new snd_gf1_controls[] = {
+static const struct snd_kcontrol_new snd_gf1_controls[] = {
 GF1_SINGLE("Master Playback Switch", 0, 1, 1),
 GF1_SINGLE("Line Switch", 0, 0, 1),
 GF1_SINGLE("Mic Switch", 0, 2, 0)
 };
 
-static struct snd_kcontrol_new snd_ics_controls[] = {
+static const struct snd_kcontrol_new snd_ics_controls[] = {
 GF1_SINGLE("Master Playback Switch", 0, 1, 1),
 ICS_DOUBLE("Master Playback Volume", 0, SNDRV_ICS_MASTER_DEV),
 ICS_DOUBLE("Synth Playback Volume", 0, SNDRV_ICS_GF1_DEV),
diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
index d0770e2aedca..02c566fca9e5 100644
--- a/sound/isa/msnd/msnd_pinnacle_mixer.c
+++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
@@ -275,7 +275,7 @@ static int snd_msndmix_volume_put(struct snd_kcontrol *kcontrol,
   .private_value = addr }
 
 
-static struct snd_kcontrol_new snd_msnd_controls[] = {
+static const struct snd_kcontrol_new snd_msnd_controls[] = {
 DUMMY_VOLUME("Master Volume", 0, MSND_MIXER_VOLUME),
 DUMMY_VOLUME("PCM Volume", 0, MSND_MIXER_PCM),
 DUMMY_VOLUME("Aux Volume", 0, MSND_MIXER_AUX),
diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index 6d19ab458291..85a181acd388 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -457,7 +457,7 @@ static int snd_opl3sa2_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static const DECLARE_TLV_DB_SCALE(db_scale_master, -3000, 200, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_5bit_12db_max, -3450, 150, 0);
 
-static struct snd_kcontrol_new snd_opl3sa2_controls[] = {
+static const struct snd_kcontrol_new snd_opl3sa2_controls[] = {
 OPL3SA2_DOUBLE("Master Playback Switch", 0, 0x07, 0x08, 7, 7, 1, 1),
 OPL3SA2_DOUBLE_TLV("Master Playback Volume", 0, 0x07, 0x08, 0, 0, 15, 1,
 		   db_scale_master),
@@ -467,7 +467,7 @@ OPL3SA2_SINGLE_TLV("Mic Playback Volume", 0, 0x09, 0, 31, 1,
 OPL3SA2_SINGLE("ZV Port Switch", 0, 0x02, 0, 1, 0),
 };
 
-static struct snd_kcontrol_new snd_opl3sa2_tone_controls[] = {
+static const struct snd_kcontrol_new snd_opl3sa2_tone_controls[] = {
 OPL3SA2_DOUBLE("3D Control - Wide", 0, 0x14, 0x14, 4, 0, 7, 0),
 OPL3SA2_DOUBLE("Tone Control - Bass", 0, 0x15, 0x15, 4, 0, 7, 0),
 OPL3SA2_DOUBLE("Tone Control - Treble", 0, 0x16, 0x16, 4, 0, 7, 0)
diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index 0458934de1c7..a9c773b9f471 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -577,7 +577,7 @@ static int snd_miro_put_double(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static struct snd_kcontrol_new snd_miro_controls[] = {
+static const struct snd_kcontrol_new snd_miro_controls[] = {
 MIRO_DOUBLE("Master Playback Volume", 0, ACI_GET_MASTER, ACI_SET_MASTER),
 MIRO_DOUBLE("Mic Playback Volume", 1, ACI_GET_MIC, ACI_SET_MIC),
 MIRO_DOUBLE("Line Playback Volume", 1, ACI_GET_LINE, ACI_SET_LINE),
@@ -589,7 +589,7 @@ MIRO_DOUBLE("Aux Playback Volume", 2, ACI_GET_LINE2, ACI_SET_LINE2),
 
 /* Equalizer with seven bands (only PCM20) 
    from -12dB up to +12dB on each band */
-static struct snd_kcontrol_new snd_miro_eq_controls[] = {
+static const struct snd_kcontrol_new snd_miro_eq_controls[] = {
 MIRO_DOUBLE("Tone Control - 28 Hz", 0, ACI_GET_EQ1, ACI_SET_EQ1),
 MIRO_DOUBLE("Tone Control - 160 Hz", 0, ACI_GET_EQ2, ACI_SET_EQ2),
 MIRO_DOUBLE("Tone Control - 400 Hz", 0, ACI_GET_EQ3, ACI_SET_EQ3),
@@ -599,15 +599,15 @@ MIRO_DOUBLE("Tone Control - 6.3 kHz", 0, ACI_GET_EQ6, ACI_SET_EQ6),
 MIRO_DOUBLE("Tone Control - 16 kHz", 0, ACI_GET_EQ7, ACI_SET_EQ7),
 };
 
-static struct snd_kcontrol_new snd_miro_radio_control[] = {
+static const struct snd_kcontrol_new snd_miro_radio_control[] = {
 MIRO_DOUBLE("Radio Playback Volume", 0, ACI_GET_LINE1, ACI_SET_LINE1),
 };
 
-static struct snd_kcontrol_new snd_miro_line_control[] = {
+static const struct snd_kcontrol_new snd_miro_line_control[] = {
 MIRO_DOUBLE("Line Playback Volume", 2, ACI_GET_LINE1, ACI_SET_LINE1),
 };
 
-static struct snd_kcontrol_new snd_miro_preamp_control[] = {
+static const struct snd_kcontrol_new snd_miro_preamp_control[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Mic Boost",
@@ -617,7 +617,7 @@ static struct snd_kcontrol_new snd_miro_preamp_control[] = {
 	.put = snd_miro_put_preamp,
 }};
 
-static struct snd_kcontrol_new snd_miro_amp_control[] = {
+static const struct snd_kcontrol_new snd_miro_amp_control[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Line Boost",
@@ -627,7 +627,7 @@ static struct snd_kcontrol_new snd_miro_amp_control[] = {
 	.put = snd_miro_put_amp,
 }};
 
-static struct snd_kcontrol_new snd_miro_capture_control[] = {
+static const struct snd_kcontrol_new snd_miro_capture_control[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "PCM Capture Switch",
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index b40ab806c349..697576459f71 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -550,7 +550,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_5bit_3db_step, -9300, 300, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_5bit, -4650, 150, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_4bit_12db_max, -3300, 300, 0);
 
-static struct snd_kcontrol_new snd_opti93x_controls[] = {
+static const struct snd_kcontrol_new snd_opti93x_controls[] = {
 WSS_DOUBLE("Master Playback Switch", 0,
 		OPTi93X_OUT_LEFT, OPTi93X_OUT_RIGHT, 7, 7, 1, 1),
 WSS_DOUBLE_TLV("Master Playback Volume", 0,
diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index bc47e8e51523..455dd5fa3ccb 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -855,7 +855,7 @@ static int mixer_bass_treble_put(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	return change;
 }
 
-static struct snd_kcontrol_new mixer_bass_control =
+static const struct snd_kcontrol_new mixer_bass_control =
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Synth Tone Control - Bass",
@@ -865,7 +865,7 @@ static struct snd_kcontrol_new mixer_bass_control =
 	.private_value = 0,
 };
 
-static struct snd_kcontrol_new mixer_treble_control =
+static const struct snd_kcontrol_new mixer_treble_control =
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Synth Tone Control - Treble",
@@ -922,7 +922,7 @@ static int mixer_chorus_reverb_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 	return change;
 }
 
-static struct snd_kcontrol_new mixer_chorus_mode_control =
+static const struct snd_kcontrol_new mixer_chorus_mode_control =
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Chorus Mode",
@@ -932,7 +932,7 @@ static struct snd_kcontrol_new mixer_chorus_mode_control =
 	.private_value = 1,
 };
 
-static struct snd_kcontrol_new mixer_reverb_mode_control =
+static const struct snd_kcontrol_new mixer_reverb_mode_control =
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Reverb Mode",
@@ -984,7 +984,7 @@ static int mixer_fm_depth_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	return change;
 }
 
-static struct snd_kcontrol_new mixer_fm_chorus_depth_control =
+static const struct snd_kcontrol_new mixer_fm_chorus_depth_control =
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "FM Chorus Depth",
@@ -994,7 +994,7 @@ static struct snd_kcontrol_new mixer_fm_chorus_depth_control =
 	.private_value = 1,
 };
 
-static struct snd_kcontrol_new mixer_fm_reverb_depth_control =
+static const struct snd_kcontrol_new mixer_fm_reverb_depth_control =
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "FM Reverb Depth",
@@ -1005,7 +1005,7 @@ static struct snd_kcontrol_new mixer_fm_reverb_depth_control =
 };
 
 
-static struct snd_kcontrol_new *mixer_defs[EMU8000_NUM_CONTROLS] = {
+static const struct snd_kcontrol_new *mixer_defs[EMU8000_NUM_CONTROLS] = {
 	&mixer_bass_control,
 	&mixer_treble_control,
 	&mixer_chorus_mode_control,
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index bd65ef0412a6..789dcf279a26 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -438,7 +438,7 @@ static int snd_sb16mixer_put_input_sw(struct snd_kcontrol *kcontrol, struct snd_
  */
 int snd_sbmixer_add_ctl(struct snd_sb *chip, const char *name, int index, int type, unsigned long value)
 {
-	static struct snd_kcontrol_new newctls[] = {
+	static const struct snd_kcontrol_new newctls[] = {
 		[SB_MIX_SINGLE] = {
 			.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 			.info = snd_sbmixer_info_single,
diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 0d019b238399..d37f4642162a 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -2157,7 +2157,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_5bit_12db_max, -3450, 150, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_rec_gain, 0, 150, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_4bit, -4500, 300, 0);
 
-static struct snd_kcontrol_new snd_wss_controls[] = {
+static const struct snd_kcontrol_new snd_wss_controls[] = {
 WSS_DOUBLE("PCM Playback Switch", 0,
 		CS4231_LEFT_OUTPUT, CS4231_RIGHT_OUTPUT, 7, 7, 1, 1),
 WSS_DOUBLE_TLV("PCM Playback Volume", 0,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
