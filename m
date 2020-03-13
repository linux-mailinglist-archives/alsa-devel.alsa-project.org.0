Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7EA184C68
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CBC1832;
	Fri, 13 Mar 2020 17:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CBC1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116698;
	bh=BmOWanj1kF3RE9HO3blRgxRPysQUgseEhRtc4T+7Ltw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cjpsgxD+i+CbW5uxvmC/kAAyXbfDBW+tSETjUew2EMXsxxgTy0AouDdQ613qEPuHB
	 J6RMB0CxxX+CPm9q3flH5ORsIKOm6qLZ8BaOLkfZ/1b0ieNE9Bjb9Uty0sCWswRbIU
	 tsMeljVzXlVC8vUwC0ufH7rErI4G7RvUmG27X19k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D159F802E8;
	Fri, 13 Mar 2020 17:18:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96F9BF802E3; Fri, 13 Mar 2020 17:18:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C5F0EF802DB
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:17:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5F0EF802DB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C6C113E;
 Fri, 13 Mar 2020 09:17:57 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1163F6CF;
 Fri, 13 Mar 2020 09:17:56 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:17:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "ASoC: Intel: sof_pcm512x: make HDMI optional for all
 platforms" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: Intel: sof_pcm512x: make HDMI optional for all platforms

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

From 15a5a89597e57e67d4dde1d57fa85105c5930bb3 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 12 Mar 2020 14:48:52 -0500
Subject: [PATCH] ASoC: Intel: sof_pcm512x: make HDMI optional for all
 platforms

Make HDMI optional for APL and later platforms. If no HDMI codec
is found on the HDA bus, the graphics side driver is missing or
correct codec driver is not part of kernel build, codec_mask
reflects this and HDMI is disabled. The DSP topology will still
have the links for HDMI, so connect these to dummy codec to avoid
failures in topology loading.

This change also fixes a kernel oops that was triggered if
sof_pcm512x was used with SOF configured to use hdac-hdmi (can be
done via "use_common_hdmi=0" or by selecting
CONFIG_SND_SOC_SOF_HDA_COMMON_HDMI_CODEC=n). This is not a supported
configuration.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312194859.4051-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_pcm512x.c | 38 +++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 626153bd71e7..4ce707b6eb79 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -27,6 +27,8 @@
 #define SOF_PCM512X_SSP_CODEC(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_PCM512X_SSP_CODEC_MASK			(GENMASK(3, 0))
 
+#define IDISP_CODEC_MASK	0x4
+
 /* Default: SSP5 */
 static unsigned long sof_pcm512x_quirk = SOF_PCM512X_SSP_CODEC(5);
 
@@ -40,6 +42,7 @@ struct sof_hdmi_pcm {
 
 struct sof_card_private {
 	struct list_head hdmi_pcm_list;
+	bool idisp_codec;
 };
 
 static int sof_pcm512x_quirk_cb(const struct dmi_system_id *id)
@@ -136,6 +139,9 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	if (list_empty(&ctx->hdmi_pcm_list))
 		return -EINVAL;
 
+	if (!ctx->idisp_codec)
+		return 0;
+
 	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
 
 	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
@@ -214,7 +220,8 @@ SND_SOC_DAILINK_DEF(dmic_component,
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int dmic_be_num,
-							  int hdmi_num)
+							  int hdmi_num,
+							  bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
@@ -316,11 +323,19 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		if (!links[id].cpus->dai_name)
 			goto devm_err;
 
-		idisp_components[i - 1].name = "ehdaudio0D2";
-		idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-								  GFP_KERNEL,
-								  "intel-hdmi-hifi%d",
-								  i);
+		/*
+		 * topology cannot be loaded if codec is missing, so
+		 * use the dummy codec if needed
+		 */
+		if (idisp_codec) {
+			idisp_components[i - 1].name = "ehdaudio0D2";
+			idisp_components[i - 1].dai_name =
+				devm_kasprintf(dev, GFP_KERNEL,
+					       "intel-hdmi-hifi%d", i);
+		} else {
+			idisp_components[i - 1].name = "snd-soc-dummy";
+			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+		}
 		if (!idisp_components[i - 1].dai_name)
 			goto devm_err;
 
@@ -341,8 +356,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
-	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
 	int ret, ssp_codec;
@@ -360,6 +375,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 	} else {
 		dmic_be_num = 2;
 #if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
+		if (mach->mach_params.common_hdmi_codec_drv &&
+		    (mach->mach_params.codec_mask & IDISP_CODEC_MASK))
+			ctx->idisp_codec = true;
+
+		/* links are always present in topology */
 		hdmi_num = 3;
 #endif
 	}
@@ -374,7 +394,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 	sof_audio_card_pcm512x.num_links = 1 + dmic_be_num + hdmi_num;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec,
-					      dmic_be_num, hdmi_num);
+					      dmic_be_num, hdmi_num,
+					      ctx->idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -383,7 +404,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	sof_audio_card_pcm512x.dev = &pdev->dev;
-	mach = (&pdev->dev)->platform_data;
 
 	/* set platform name for each dailink */
 	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_pcm512x,
-- 
2.20.1

