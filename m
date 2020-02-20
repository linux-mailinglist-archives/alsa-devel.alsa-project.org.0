Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E93166A4A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 23:22:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E186916B9;
	Thu, 20 Feb 2020 23:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E186916B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582237369;
	bh=YtwERpCS4cVj4E0w5pdDcFpSHIwe04dw8BHBMDjNxcM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jVVGj4a2brUJAkgESdS2no0zSr1lg//6JOklCoX3U1E9l15/sPclTFj1wvAGsKjTc
	 V9rmPzauUy7d6VaiJM+DoBl4I9+C1B8Xd/9uARpUiKTb8knOS41v+Cn/bI1I8UCXWb
	 eoQBbm7ldah5cNODDdD4+yvIpe9C1H90c7xH5KH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA951F80299;
	Thu, 20 Feb 2020 23:18:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01D89F802A1; Thu, 20 Feb 2020 23:18:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0E3C7F80299
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 23:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3C7F80299
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2BC1063;
 Thu, 20 Feb 2020 14:18:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74A7F3F6CF;
 Thu, 20 Feb 2020 14:18:50 -0800 (PST)
Date: Thu, 20 Feb 2020 22:18:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "ASoC: intel/skl/hda - add no-HDMI cases to generic HDA
 driver" to the asoc tree
In-Reply-To: <20200220171028.22023-2-kai.vehmanen@linux.intel.com>
Message-Id: <applied-20200220171028.22023-2-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: intel/skl/hda - add no-HDMI cases to generic HDA driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d2ad9d6ca5b2435754a0fd811f57d30914c612ce Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 20 Feb 2020 19:10:27 +0200
Subject: [PATCH] ASoC: intel/skl/hda - add no-HDMI cases to generic HDA driver

Extend the generic HDA driver to support systems where iDisp/HDMI
audio codecs are disabled for some reason. Switch codecs to
SoC dummy in the affected DAI links. This allows to reuse
existing topologies for this case.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206085
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1163677
BugLink: https://github.com/thesofproject/linux/issues/1658
Link: https://lore.kernel.org/r/20200220171028.22023-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index 11eaee9ae41f..fe2d3a23a4ef 100644
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
2.20.1

