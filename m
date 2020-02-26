Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF817081E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:56:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C7916AC;
	Wed, 26 Feb 2020 19:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C7916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743360;
	bh=68RciCR5efa55fwqvQXaDldsWhIhO+T4vIRRuJiRtMg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pv6XZ8bLwljvZAvR1msGIssLUjGft51YTl5sCjsgwROtqaL/UQKK5jpFJSq+i8/q5
	 V2GY3M8s3uIamfZ74uOhGytbvYOp9/08S4nAghn+/SzAepEDwirnoSn2idj7s4JA3f
	 pRu6HfyJ3exlBXptVgxVC9M+v7uMisqqvEJEV6mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF75F80323;
	Wed, 26 Feb 2020 19:48:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3BFF80307; Wed, 26 Feb 2020 19:48:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CCD61F8014D
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD61F8014D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43A94B2;
 Wed, 26 Feb 2020 10:48:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27F5C3F881;
 Wed, 26 Feb 2020 10:48:06 -0800 (PST)
Date: Wed, 26 Feb 2020 18:48:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Shreyas NC <shreyas.nc@intel.com>
Subject: Applied "ASoC: Add initial support for multiple CPU DAIs" to the asoc
 tree
In-Reply-To: <20200225133917.21314-2-yung-chuan.liao@linux.intel.com>
Message-Id: <applied-20200225133917.21314-2-yung-chuan.liao@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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

   ASoC: Add initial support for multiple CPU DAIs

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

From 76afa64374a79c22b2dab61aebef99a967783bf0 Mon Sep 17 00:00:00 2001
From: Shreyas NC <shreyas.nc@intel.com>
Date: Tue, 25 Feb 2020 21:39:12 +0800
Subject: [PATCH] ASoC: Add initial support for multiple CPU DAIs

ASoC core supports multiple codec DAIs but supports only a CPU DAI.
To support multiple cpu DAIs, add cpu_dai and num_cpu_dai in
snd_soc_dai_link and snd_soc_pcm_runtime structures similar to
support for codec_dai. This is intended as a preparatory patch to
eventually support the unification of the Codec and CPU DAI.

Inline with multiple codec DAI approach, add support to allocate,
init, bind and probe multiple cpu_dai on init if driver specifies
that. Also add support to loop over multiple cpu_dai during
suspend and resume.

This is intended as a preparatory patch to eventually unify the CPU
and Codec DAI into DAI components.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Link: https://lore.kernel.org/r/20200225133917.21314-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  15 ++++
 sound/soc/soc-core.c | 168 +++++++++++++++++++++++--------------------
 2 files changed, 106 insertions(+), 77 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8a2266676b2d..81e5d17be935 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -855,6 +855,11 @@ struct snd_soc_dai_link {
 	     ((platform) = &link->platforms[i]);			\
 	     (i)++)
 
+#define for_each_link_cpus(link, i, cpu)				\
+	for ((i) = 0;							\
+	     ((i) < link->num_cpus) && ((cpu) = &link->cpus[i]);	\
+	     (i)++)
+
 /*
  * Sample 1 : Single CPU/Codec/Platform
  *
@@ -1132,6 +1137,9 @@ struct snd_soc_pcm_runtime {
 	struct snd_soc_dai **codec_dais;
 	unsigned int num_codecs;
 
+	struct snd_soc_dai **cpu_dais;
+	unsigned int num_cpus;
+
 	struct delayed_work delayed_work;
 	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
@@ -1159,6 +1167,13 @@ struct snd_soc_pcm_runtime {
 #define for_each_rtd_codec_dai_rollback(rtd, i, dai)		\
 	for (; (--(i) >= 0) && ((dai) = rtd->codec_dais[i]);)
 
+#define for_each_rtd_cpu_dai(rtd, i, dai)\
+	for ((i) = 0;						       \
+	     ((i) < rtd->num_cpus) && ((dai) = rtd->cpu_dais[i]); \
+	     (i)++)
+#define for_each_rtd_cpu_dai_rollback(rtd, i, dai)		\
+	for (; (--(i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
+
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
 /* mixer control */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 518b652cf872..f2cfbf182f49 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -483,6 +483,14 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	if (!rtd->codec_dais)
 		goto free_rtd;
 
+	/*
+	 * for rtd->cpu_dais
+	 */
+	rtd->cpu_dais = devm_kcalloc(dev, dai_link->num_cpus,
+				     sizeof(struct snd_soc_dai *),
+				     GFP_KERNEL);
+	if (!rtd->cpu_dais)
+		goto free_rtd;
 	/*
 	 * rtd remaining settings
 	 */
@@ -833,7 +841,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 				     struct snd_soc_dai_link *link)
 {
 	int i;
-	struct snd_soc_dai_link_component *codec, *platform;
+	struct snd_soc_dai_link_component *cpu, *codec, *platform;
 
 	for_each_link_codecs(link, i, codec) {
 		/*
@@ -882,44 +890,38 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 			return -EPROBE_DEFER;
 	}
 
-	/* FIXME */
-	if (link->num_cpus > 1) {
-		dev_err(card->dev,
-			"ASoC: multi cpu is not yet supported %s\n",
-			link->name);
-		return -EINVAL;
-	}
-
-	/*
-	 * CPU device may be specified by either name or OF node, but
-	 * can be left unspecified, and will be matched based on DAI
-	 * name alone..
-	 */
-	if (link->cpus->name && link->cpus->of_node) {
-		dev_err(card->dev,
-			"ASoC: Neither/both cpu name/of_node are set for %s\n",
-			link->name);
-		return -EINVAL;
-	}
+	for_each_link_cpus(link, i, cpu) {
+		/*
+		 * CPU device may be specified by either name or OF node, but
+		 * can be left unspecified, and will be matched based on DAI
+		 * name alone..
+		 */
+		if (cpu->name && cpu->of_node) {
+			dev_err(card->dev,
+				"ASoC: Neither/both cpu name/of_node are set for %s\n",
+				link->name);
+			return -EINVAL;
+		}
 
-	/*
-	 * Defer card registration if cpu dai component is not added to
-	 * component list.
-	 */
-	if ((link->cpus->of_node || link->cpus->name) &&
-	    !soc_find_component(link->cpus))
-		return -EPROBE_DEFER;
+		/*
+		 * Defer card registration if cpu dai component is not added to
+		 * component list.
+		 */
+		if ((cpu->of_node || cpu->name) &&
+		    !soc_find_component(cpu))
+			return -EPROBE_DEFER;
 
-	/*
-	 * At least one of CPU DAI name or CPU device name/node must be
-	 * specified
-	 */
-	if (!link->cpus->dai_name &&
-	    !(link->cpus->name || link->cpus->of_node)) {
-		dev_err(card->dev,
-			"ASoC: Neither cpu_dai_name nor cpu_name/of_node are set for %s\n",
-			link->name);
-		return -EINVAL;
+		/*
+		 * At least one of CPU DAI name or CPU device name/node must be
+		 * specified
+		 */
+		if (!cpu->dai_name &&
+		    !(cpu->name || cpu->of_node)) {
+			dev_err(card->dev,
+				"ASoC: Neither cpu_dai_name nor cpu_name/of_node are set for %s\n",
+				link->name);
+			return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -962,7 +964,7 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			    struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai_link_component *codec, *platform;
+	struct snd_soc_dai_link_component *codec, *platform, *cpu;
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -987,14 +989,19 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	if (!rtd)
 		return -ENOMEM;
 
-	/* FIXME: we need multi CPU support in the future */
-	rtd->cpu_dai = snd_soc_find_dai(dai_link->cpus);
-	if (!rtd->cpu_dai) {
-		dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
-			 dai_link->cpus->dai_name);
-		goto _err_defer;
+	rtd->num_cpus = dai_link->num_cpus;
+	for_each_link_cpus(dai_link, i, cpu) {
+		rtd->cpu_dais[i] = snd_soc_find_dai(cpu);
+		if (!rtd->cpu_dais[i]) {
+			dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
+				 cpu->dai_name);
+			goto _err_defer;
+		}
+		snd_soc_rtd_add_component(rtd, rtd->cpu_dais[i]->component);
 	}
-	snd_soc_rtd_add_component(rtd, rtd->cpu_dai->component);
+
+	/* Single cpu links expect cpu and cpu_dai in runtime data */
+	rtd->cpu_dai = rtd->cpu_dais[0];
 
 	/* Find CODEC from registered CODECs */
 	rtd->num_codecs = dai_link->num_codecs;
@@ -1114,7 +1121,8 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 			dai_link->stream_name, ret);
 		return ret;
 	}
-	ret = soc_dai_pcm_new(&cpu_dai, 1, rtd);
+	ret = soc_dai_pcm_new(rtd->cpu_dais,
+			      rtd->num_cpus, rtd);
 	if (ret < 0)
 		return ret;
 	ret = soc_dai_pcm_new(rtd->codec_dais,
@@ -1306,6 +1314,7 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	int i;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_pcm_runtime *rtd;
 	int order;
 
@@ -1315,14 +1324,15 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 			for_each_rtd_codec_dai(rtd, i, codec_dai)
 				soc_remove_dai(codec_dai, order);
 
-			soc_remove_dai(rtd->cpu_dai, order);
+			for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+				soc_remove_dai(cpu_dai, order);
 		}
 	}
 }
 
 static int soc_probe_link_dais(struct snd_soc_card *card)
 {
-	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *codec_dai, *cpu_dai;
 	struct snd_soc_pcm_runtime *rtd;
 	int i, order, ret;
 
@@ -1333,9 +1343,12 @@ static int soc_probe_link_dais(struct snd_soc_card *card)
 				"ASoC: probe %s dai link %d late %d\n",
 				card->name, rtd->num, order);
 
-			ret = soc_probe_dai(rtd->cpu_dai, order);
-			if (ret)
-				return ret;
+			/* probe the CPU DAI */
+			for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+				ret = soc_probe_dai(cpu_dai, order);
+				if (ret)
+					return ret;
+			}
 
 			/* probe the CODEC DAI */
 			for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -1467,8 +1480,9 @@ static void soc_remove_aux_devices(struct snd_soc_card *card)
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	unsigned int inv_dai_fmt;
 	unsigned int i;
 	int ret;
 
@@ -1485,33 +1499,33 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
 	 * the component which has non_legacy_dai_naming is Codec
 	 */
-	if (cpu_dai->component->driver->non_legacy_dai_naming) {
-		unsigned int inv_dai_fmt;
-
-		inv_dai_fmt = dai_fmt & ~SND_SOC_DAIFMT_MASTER_MASK;
-		switch (dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBM_CFM:
-			inv_dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-			break;
-		case SND_SOC_DAIFMT_CBM_CFS:
-			inv_dai_fmt |= SND_SOC_DAIFMT_CBS_CFM;
-			break;
-		case SND_SOC_DAIFMT_CBS_CFM:
-			inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFS;
-			break;
-		case SND_SOC_DAIFMT_CBS_CFS:
-			inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
-			break;
-		}
-
-		dai_fmt = inv_dai_fmt;
+	inv_dai_fmt = dai_fmt & ~SND_SOC_DAIFMT_MASTER_MASK;
+	switch (dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		inv_dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFS:
+		inv_dai_fmt |= SND_SOC_DAIFMT_CBS_CFM;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFM:
+		inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFS;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		break;
 	}
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		unsigned int fmt = dai_fmt;
 
-	ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
-	if (ret != 0 && ret != -ENOTSUPP) {
-		dev_warn(cpu_dai->dev,
-			 "ASoC: Failed to set DAI format: %d\n", ret);
-		return ret;
+		if (cpu_dai->component->driver->non_legacy_dai_naming)
+			fmt = inv_dai_fmt;
+
+		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+		if (ret != 0 && ret != -ENOTSUPP) {
+			dev_warn(cpu_dai->dev,
+				 "ASoC: Failed to set DAI format: %d\n", ret);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.20.1

