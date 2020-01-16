Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B114D14056B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 09:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13DB017E0;
	Fri, 17 Jan 2020 09:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13DB017E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579249521;
	bh=5a93WQ/EYkRRTYD+4rbAKO32/wcAZF2anxbqKV3As3I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7N+YIu98ax8DXVboqDgNGIud7XrfluU+LbZI4mOAKofcC9P4ALqx2U9WbG1fIQll
	 ZhUrtLOeISSyzXX2asDftI49qIW/37JBkA6DpajUz/KIjpP3dRxNoWcrGhT20erFHJ
	 qLxTrWcsE+KJ2x9snTdJhvQMKzsHWOpHF2yCkpGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B985F80271;
	Fri, 17 Jan 2020 09:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2B5EF800E9; Fri, 17 Jan 2020 09:22:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9AB5F800E9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 09:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9AB5F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 00:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,329,1574150400"; d="scan'208";a="274295688"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2020 00:22:33 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Fri, 17 Jan 2020 04:26:17 +0800
Message-Id: <20200116202620.7401-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
References: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v3 1/4] ASoC: Add initial support for
	multiple CPU DAIs
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

From: Shreyas NC <shreyas.nc@intel.com>

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

Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc.h  |  15 ++++
 sound/soc/soc-core.c | 205 ++++++++++++++++++++++++-------------------
 2 files changed, 129 insertions(+), 91 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..4163f5e06126 100644
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
 	for (; ((--i) >= 0) && ((dai) = rtd->codec_dais[i]);)
 
+#define for_each_rtd_cpu_dai(rtd, i, dai)\
+	for ((i) = 0;						       \
+	     ((i) < rtd->num_cpus) && ((dai) = rtd->cpu_dais[i]); \
+	     (i)++)
+#define for_each_rtd_cpu_dai_rollback(rtd, i, dai)		\
+	for (; ((--i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
+
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
 /* mixer control */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index acf6f141fd2d..ac3d1650c913 100644
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
@@ -559,13 +567,15 @@ int snd_soc_suspend(struct device *dev)
 		card->suspend_pre(card);
 
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (!cpu_dai->driver->bus_control)
-			snd_soc_dai_suspend(cpu_dai);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (!cpu_dai->driver->bus_control)
+				snd_soc_dai_suspend(cpu_dai);
+		}
 	}
 
 	/* close any waiting streams */
@@ -640,13 +650,14 @@ int snd_soc_suspend(struct device *dev)
 	}
 
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->bus_control)
-			snd_soc_dai_suspend(cpu_dai);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			if (cpu_dai->driver->bus_control)
+				snd_soc_dai_suspend(cpu_dai);
 	}
 
 	if (card->suspend_post)
@@ -684,13 +695,15 @@ static void soc_resume_deferred(struct work_struct *work)
 
 	/* resume control bus DAIs */
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->bus_control)
-			snd_soc_dai_resume(cpu_dai);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->driver->bus_control)
+				snd_soc_dai_resume(cpu_dai);
+		}
 	}
 
 	for_each_card_components(card, component) {
@@ -727,13 +740,15 @@ static void soc_resume_deferred(struct work_struct *work)
 	}
 
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (!cpu_dai->driver->bus_control)
-			snd_soc_dai_resume(cpu_dai);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (!cpu_dai->driver->bus_control)
+				snd_soc_dai_resume(cpu_dai);
+		}
 	}
 
 	if (card->resume_post)
@@ -773,9 +788,11 @@ int snd_soc_resume(struct device *dev)
 	 * due to I/O costs and anti-pop so handle them out of line.
 	 */
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
+		int i;
 
-		bus_control |= cpu_dai->driver->bus_control;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			bus_control |= cpu_dai->driver->bus_control;
 	}
 	if (bus_control) {
 		dev_dbg(dev, "ASoC: Resuming control bus master immediately\n");
@@ -900,7 +917,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 				     struct snd_soc_dai_link *link)
 {
 	int i;
-	struct snd_soc_dai_link_component *codec, *platform;
+	struct snd_soc_dai_link_component *cpu, *codec, *platform;
 
 	for_each_link_codecs(link, i, codec) {
 		/*
@@ -949,44 +966,38 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
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
@@ -1029,7 +1040,7 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			    struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai_link_component *codec, *platform;
+	struct snd_soc_dai_link_component *codec, *platform, *cpu;
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1054,14 +1065,19 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
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
@@ -1181,7 +1197,8 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 			dai_link->stream_name, ret);
 		return ret;
 	}
-	ret = soc_dai_pcm_new(&cpu_dai, 1, rtd);
+	ret = soc_dai_pcm_new(rtd->cpu_dais,
+			      rtd->num_cpus, rtd);
 	if (ret < 0)
 		return ret;
 	ret = soc_dai_pcm_new(rtd->codec_dais,
@@ -1373,6 +1390,7 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	int i;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_pcm_runtime *rtd;
 	int order;
 
@@ -1382,14 +1400,15 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
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
 
@@ -1400,9 +1419,12 @@ static int soc_probe_link_dais(struct snd_soc_card *card)
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
@@ -1534,8 +1556,9 @@ static void soc_remove_aux_devices(struct snd_soc_card *card)
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	unsigned int inv_dai_fmt;
 	unsigned int i;
 	int ret;
 
@@ -1552,33 +1575,33 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
