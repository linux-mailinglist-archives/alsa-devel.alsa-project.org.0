Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A9166415
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 18:13:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F9D16CF;
	Thu, 20 Feb 2020 18:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F9D16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582218812;
	bh=/xqinfJ4ButkgFJ/3nNMJAgXoBUuK4L8g2KyVQyqMgo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eeJEdpM+dRy5Yr8NwLxmLdmm6tV2VKK7CpKJn4akxZ8/KYGS5x185Mp5dtpO7zmUe
	 ZnUNLAFDYWcr2cMXW/Mfsy4oBu/f794O6/EtzCSBQWVu+j5ri5IKYXSycaBgBYgAG3
	 VrPgrfFPWzeyGj6Vbf73wvXvOu5cz7yXH6HfrPSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE52DF8015C;
	Thu, 20 Feb 2020 18:11:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA1F3F80148; Thu, 20 Feb 2020 18:11:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB31F8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 18:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB31F8011D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="408849973"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 20 Feb 2020 09:10:35 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: intel/skl/hda - add no-HDMI cases to generic HDA
 driver
Date: Thu, 20 Feb 2020 19:10:27 +0200
Message-Id: <20200220171028.22023-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220171028.22023-1-kai.vehmanen@linux.intel.com>
References: <20200220171028.22023-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

Extend the generic HDA driver to support systems where iDisp/HDMI
audio codecs are disabled for some reason. Switch codecs to
SoC dummy in the affected DAI links. This allows to reuse
existing topologies for this case.

BugLink: https://github.com/thesofproject/linux/issues/1658
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1163677
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206085
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  4 ++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 25 ++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index d6150670ca05..e8545d13062f 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -49,6 +49,10 @@ static inline int skl_hda_hdmi_build_controls(struct snd_soc_card *card)
 	struct snd_soc_component *component;
 	struct skl_hda_hdmi_pcm *pcm;
 
+	/* HDMI disabled, do not create controls */
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return 0;
+
 	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct skl_hda_hdmi_pcm,
 			       head);
 	component = pcm->codec_dai->component;
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index f1216fbeb289..3be764299ab0 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -61,6 +61,9 @@ static const struct snd_soc_dapm_route skl_hda_map[] = {
 	{ "Alt Analog CPU Capture", NULL, "Alt Analog Codec Capture" },
 };
 
+SND_SOC_DAILINK_DEF(dummy_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")));
+
 static int skl_hda_card_late_probe(struct snd_soc_card *card)
 {
 	return skl_hda_hdmi_jack_init(card);
@@ -114,13 +117,19 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 {
 	struct snd_soc_card *card = &hda_soc_card;
 	struct snd_soc_dai_link *dai_link;
-	u32 codec_count, codec_mask;
+	u32 codec_count, codec_mask, idisp_mask;
 	int i, num_links, num_route;
 
 	codec_mask = mach_params->codec_mask;
 	codec_count = hweight_long(codec_mask);
+	idisp_mask = codec_mask & IDISP_CODEC_MASK;
+
+	if (!codec_count || codec_count > 2 ||
+	    (codec_count == 2 && !idisp_mask))
+		return -EINVAL;
 
-	if (codec_count == 1 && codec_mask & IDISP_CODEC_MASK) {
+	if (codec_mask == idisp_mask) {
+		/* topology with iDisp as the only HDA codec */
 		num_links = IDISP_DAI_COUNT + DMIC_DAI_COUNT;
 		num_route = IDISP_ROUTE_COUNT;
 
@@ -135,13 +144,19 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 				skl_hda_be_dai_links[IDISP_DAI_COUNT +
 					HDAC_DAI_COUNT + i];
 		}
-	} else if (codec_count == 2 && codec_mask & IDISP_CODEC_MASK) {
+	} else {
+		/* topology with external and iDisp HDA codecs */
 		num_links = ARRAY_SIZE(skl_hda_be_dai_links);
 		num_route = ARRAY_SIZE(skl_hda_map);
 		card->dapm_widgets = skl_hda_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
-	} else {
-		return -EINVAL;
+		if (!idisp_mask) {
+			for (i = 0; i < IDISP_DAI_COUNT; i++) {
+				skl_hda_be_dai_links[i].codecs = dummy_codec;
+				skl_hda_be_dai_links[i].num_codecs =
+					ARRAY_SIZE(dummy_codec);
+			}
+		}
 	}
 
 	card->num_links = num_links;
-- 
2.17.1

