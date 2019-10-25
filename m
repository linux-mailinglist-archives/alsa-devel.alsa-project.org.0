Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAEE4B13
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 14:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B7217D4;
	Fri, 25 Oct 2019 14:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B7217D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572006758;
	bh=6BeiI1CvBYAfUOkkX258Z8FV6LP4PUKA9d3t3tfhp2o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bEtZBFkJdqrtjZaD7RDZ7xaeR+mg/U8PVqcBjhoxvs92PEMKWH29NauWNGgvC6N0u
	 Vu+LtajVBCgPYQpAkywuC+twzkbJD2Tk7NiVDigO4Lbw82b5/LSag3UnATInnSE20M
	 L3JkLAtA4UKc7hjWNSlBy4xNH45jEjEU4ZFMSXNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61723F8036F;
	Fri, 25 Oct 2019 14:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1FC6F8036F; Fri, 25 Oct 2019 14:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46A39F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 14:30:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4915EA003F;
 Fri, 25 Oct 2019 14:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4915EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572006647; bh=hJvcVBTOr7T5IdXIuSj+KkffZ617card5ofYFudctqY=;
 h=From:To:Cc:Subject:Date:From;
 b=dNUlP+PvyMB4g/jtX0aoQRLpAQI5HHBjdTmU1+Qm3M1Hnu0RJT4N5FihSO6reOsg9
 Trd+uB+2ktMgcMOAPuNzk3K6Mq5bPxuUipNq3veM7Dl/2+97S9ISoWh+JuBx6YMzXW
 4JGWySqvI0vTHr4LpZbJ8IrKH5nwCTwJKNbrcEK8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 14:30:42 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Fri, 25 Oct 2019 14:30:38 +0200
Message-Id: <20191025123038.19728-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
	pcm=' Jack control names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is an inconsistency in the names for the HDMI/DP Jack control
names between some ASoC drivers and the HDA HDMI driver which
introduced this naming in 2011.

There might be an impact for the user space (UCM). I will fix
the UCM configurations when this patch is applied.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/sound/designs/control-names.rst   | 5 +++--
 sound/soc/intel/boards/bxt_da7219_max98357a.c   | 2 +-
 sound/soc/intel/boards/bxt_rt298.c              | 2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c   | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c   | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c    | 2 +-
 sound/soc/intel/boards/kbl_rt5660.c             | 2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c    | 2 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c     | 2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c | 2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c   | 2 +-
 sound/soc/intel/boards/skl_rt286.c              | 2 +-
 sound/soc/intel/boards/sof_rt5682.c             | 2 +-
 13 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/sound/designs/control-names.rst b/Documentation/sound/designs/control-names.rst
index 7fedd0f33cd9..a5f6e3842df8 100644
--- a/Documentation/sound/designs/control-names.rst
+++ b/Documentation/sound/designs/control-names.rst
@@ -50,7 +50,7 @@ Internal	internal
 
 SOURCE
 ~~~~~~
-===================	=================================================
+===================	===================================================
 Master
 Master Mono
 Hardware Master
@@ -92,7 +92,8 @@ SPDIF			output only
 SPDIF In
 Digital In
 HDMI/DP			either HDMI or DisplayPort
-===================	=================================================
+HDMI/DP,pcm=<num>       either HDMI or DisplayPort with the PCM device link
+===================	===================================================
 
 Exceptions (deprecated)
 -----------------------
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index ac1dea5f9d11..b49028c6fd10 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -618,7 +618,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &broxton_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index adf416a49b48..caaf2f2af287 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -530,7 +530,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &broxton_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index bd2d371f2acd..5474f28e0c31 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -548,7 +548,7 @@ static int glk_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &geminilake_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 537a88932bb6..367415efed9b 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -548,7 +548,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &skylake_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 829f95fc4179..b30c2148d1f4 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -977,7 +977,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &kabylake_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 74fe1f3a5479..0965d1f02b2c 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -470,7 +470,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &skylake_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 7cefda341fbf..9f420e978459 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -888,7 +888,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &skylake_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 58409b6e476e..f717b1d179bd 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -139,7 +139,7 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			 "HDMI/DP, pcm=%d Jack", pcm->device);
+			 "HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					    SND_JACK_AVOUT, &pcm->hdmi_jack,
 					    NULL, 0);
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index 3ce8efbeed12..b009e2df25d3 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -607,7 +607,7 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT,
 					&skylake_hdmi[i],
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 1a7ac8bdf543..0a6e650dc698 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -648,7 +648,7 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT,
 					&skylake_hdmi[i],
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 231349a47cc9..56ee4b55dce9 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -489,7 +489,7 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
+			"HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &skylake_hdmi[i],
 					NULL, 0);
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4f6e58c3954a..862a7e35cb5c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -277,7 +277,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-			 "HDMI/DP, pcm=%d Jack", pcm->device);
+			 "HDMI/DP,pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					    SND_JACK_AVOUT, &sof_hdmi[i],
 					    NULL, 0);
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
