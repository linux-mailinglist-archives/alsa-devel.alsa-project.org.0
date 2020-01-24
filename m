Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5B14905C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 22:43:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CE216A3;
	Fri, 24 Jan 2020 22:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CE216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579902197;
	bh=2h09JgYI1ffjsZoqQRvS0d+JtTPOwmTzGfpJfLhohho=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rCPRxpoP5d3HTbMxZutVUySuPx55pxiBRWixL87dBYSb4Cr1HHYsK4Wl4ARk2MhUZ
	 d+csB4qcAa7G4AG55FzBjvB7DJywPb6RROLWUCzohscKXSs/I1U4xGqR1Cb0+2NYm2
	 0KVwoiOMzzEfpFbY+KRf9i5pK/bGDlJLG1MB1b24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E66BFF802D2;
	Fri, 24 Jan 2020 22:37:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7DCCF801D8; Fri, 24 Jan 2020 22:36:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15618F8020C
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 22:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15618F8020C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 13:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; d="scan'208";a="294313621"
Received: from sascates-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.4.164])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2020 13:36:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 15:36:25 -0600
Message-Id: <20200124213625.30186-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124213625.30186-1-pierre-louis.bossart@linux.intel.com>
References: <20200124213625.30186-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 7/7] ASoC: Intel: consistent HDMI codec probing
	code
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Multiple Intel ASoC machine drivers repeat the same pattern in their
.late_probe() methods: they first check whether the common HDMI codec
driver is used, if not, they proceed by linking the legacy HDMI
driver to each HDMI port. While doing that they use some
inconsistent code:

1. after the loop they check, whether the list contained at least one
   element and if not, they return an error. However, the earlier
   code to use the common HDMI driver uses the first element of the
   same list without checking. To fix this we move the check to the
   top of the function.

2. some of those .late_probe() implementations execute code, only
   needed for the common HDMI driver, before checking, whether the
   driver is used. Move the code to after the check.

3. Some of those functions also perform a redundant initialisation of
   the "err" variable.

This patch fixes those issues.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 14 +++++++-------
 sound/soc/intel/boards/bxt_rt298.c            | 14 +++++++-------
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 13 +++++++------
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 16 ++++++++--------
 sound/soc/intel/boards/sof_rt5682.c           | 15 ++++++++-------
 5 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 33b13f3ca152..9177401c37a5 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -617,12 +617,15 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 		snd_soc_dapm_add_routes(&card->dapm, broxton_map,
 					ARRAY_SIZE(broxton_map));
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct bxt_hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
 
-	if (ctx->common_hdmi_codec_drv)
+	if (ctx->common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct bxt_hdmi_pcm,
+				       head);
+		component = pcm->codec_dai->component;
 		return hda_dsp_hdmi_build_controls(card, component);
+	}
 
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
@@ -643,9 +646,6 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 		i++;
 	}
 
-	if (!component)
-		return -EINVAL;
-
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 067a97e7e6a8..4b67f261377c 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -529,12 +529,15 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 	int err, i = 0;
 	char jack_name[NAME_SIZE];
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct bxt_hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
 
-	if (ctx->common_hdmi_codec_drv)
+	if (ctx->common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct bxt_hdmi_pcm,
+				       head);
+		component = pcm->codec_dai->component;
 		return hda_dsp_hdmi_build_controls(card, component);
+	}
 
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
@@ -555,9 +558,6 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 		i++;
 	}
 
-	if (!component)
-		return -EINVAL;
-
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index d6efc554898c..dd80d0186a6c 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -241,12 +241,15 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct hdmi_pcm *pcm;
 	int ret, i = 0;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
 
-	if (ctx->common_hdmi_codec_drv)
+	if (ctx->common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
+				       head);
+		component = pcm->codec_dai->component;
 		return hda_dsp_hdmi_build_controls(card, component);
+	}
 
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
@@ -265,8 +268,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 
 		i++;
 	}
-	if (!component)
-		return -EINVAL;
 
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 4a6d117ea7af..8e947bad143c 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -534,15 +534,18 @@ static int glk_card_late_probe(struct snd_soc_card *card)
 	struct snd_soc_component *component = NULL;
 	char jack_name[NAME_SIZE];
 	struct glk_hdmi_pcm *pcm;
-	int err = 0;
+	int err;
 	int i = 0;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct glk_hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
 
-	if (ctx->common_hdmi_codec_drv)
+	if (ctx->common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct glk_hdmi_pcm,
+				       head);
+		component = pcm->codec_dai->component;
 		return hda_dsp_hdmi_build_controls(card, component);
+	}
 
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
@@ -563,9 +566,6 @@ static int glk_card_late_probe(struct snd_soc_card *card)
 		i++;
 	}
 
-	if (!component)
-		return -EINVAL;
-
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8a13231dee15..5d878873a8e0 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -273,19 +273,22 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct snd_soc_component *component = NULL;
 	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
-	int err = 0;
+	int err;
 	int i = 0;
 
 	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 	if (is_legacy_cpu)
 		return 0;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
 
-	if (ctx->common_hdmi_codec_drv)
+	if (ctx->common_hdmi_codec_drv) {
+		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
+				       head);
+		component = pcm->codec_dai->component;
 		return hda_dsp_hdmi_build_controls(card, component);
+	}
 
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
@@ -305,8 +308,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 
 		i++;
 	}
-	if (!component)
-		return -EINVAL;
 
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
