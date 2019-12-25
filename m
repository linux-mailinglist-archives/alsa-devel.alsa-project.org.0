Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8912AAC3
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Dec 2019 08:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0294316DF;
	Thu, 26 Dec 2019 08:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0294316DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577344464;
	bh=EVM9M9ggxzA/CKdcCD9hi2+z3QEC0n55rgLoagIAxFc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YiLmIrZPNjxtg5gkmY/S/PYngJni/Zy0KZjmfok7khrWCyPhqoGGRuzo6SJUPJHIp
	 3NKBCF6YY4maGnghCMtlTdPxG0X0Zve4f1zV8UXnTajeqJuiutjU3U//heFB6AxQw2
	 O5q5P0FgohQ4BhHszgSkap3PKc8E6UjhWMSC0LzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4DF2F8012E;
	Thu, 26 Dec 2019 08:12:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F6A6F8019B; Thu, 26 Dec 2019 08:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE08CF8012D
 for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2019 08:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE08CF8012D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Dec 2019 23:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,358,1571727600"; d="scan'208";a="300327217"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001.jf.intel.com with ESMTP; 25 Dec 2019 23:11:50 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org
Date: Thu, 26 Dec 2019 03:14:59 +0800
Message-Id: <20191225191501.23848-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
References: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH RFC 1/3] ASoC: Add initial support for multiple
	CPU DAIs
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
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc.h  |  15 ++++
 sound/soc/soc-core.c | 183 +++++++++++++++++++++++++------------------
 2 files changed, 120 insertions(+), 78 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 262896799826..ab18c8ab95f0 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -868,6 +868,11 @@ struct snd_soc_dai_link {
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
@@ -1149,6 +1154,9 @@ struct snd_soc_pcm_runtime {
 	struct snd_soc_dai **codec_dais;
 	unsigned int num_codecs;
 
+	struct snd_soc_dai **cpu_dais;
+	unsigned int num_cpu_dai;
+
 	struct delayed_work delayed_work;
 	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
@@ -1170,6 +1178,13 @@ struct snd_soc_pcm_runtime {
 #define for_each_rtd_codec_dai_rollback(rtd, i, dai)		\
 	for (; ((--i) >= 0) && ((dai) = rtd->codec_dais[i]);)
 
+#define for_each_rtd_cpu_dai(rtd, i, dai)\
+	for ((i) = 0;						       \
+	     ((i) < rtd->num_cpu_dai) && ((dai) = rtd->cpu_dais[i]); \
+	     (i)++)
+#define for_each_rtd_cpu_dai_rollback(rtd, i, dai)		\
+	for (; ((--i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
+
 
 /* mixer control */
 struct soc_mixer_control {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 5e54d02ad653..b8d678211ddc 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -491,6 +491,14 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
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
@@ -587,13 +595,15 @@ int snd_soc_suspend(struct device *dev)
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
@@ -658,16 +668,18 @@ int snd_soc_suspend(struct device *dev)
 	}
 
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		if (cpu_dai->driver->bus_control)
-			snd_soc_dai_suspend(cpu_dai);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->driver->bus_control)
+				snd_soc_dai_suspend(cpu_dai);
 
-		/* deactivate pins to sleep state */
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
+			/* deactivate pins to sleep state */
+			pinctrl_pm_select_sleep_state(cpu_dai->dev);
+		}
 	}
 
 	if (card->suspend_post)
@@ -705,13 +717,15 @@ static void soc_resume_deferred(struct work_struct *work)
 
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
@@ -748,13 +762,15 @@ static void soc_resume_deferred(struct work_struct *work)
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
@@ -777,6 +793,7 @@ int snd_soc_resume(struct device *dev)
 	bool bus_control = false;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
@@ -785,10 +802,10 @@ int snd_soc_resume(struct device *dev)
 
 	/* activate pins from sleep state */
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		if (cpu_dai->active)
-			pinctrl_pm_select_default_state(cpu_dai->dev);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			if (cpu_dai->active)
+				pinctrl_pm_select_default_state(cpu_dai->dev);
+		}
 
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (codec_dai->active)
@@ -803,9 +820,8 @@ int snd_soc_resume(struct device *dev)
 	 * due to I/O costs and anti-pop so handle them out of line.
 	 */
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		bus_control |= cpu_dai->driver->bus_control;
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+			bus_control |= cpu_dai->driver->bus_control;
 	}
 	if (bus_control) {
 		dev_dbg(dev, "ASoC: Resuming control bus master immediately\n");
@@ -1020,14 +1036,6 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
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
 	/*
 	 * CPU device may be specified by either name or OF node, but
 	 * can be left unspecified, and will be matched based on DAI
@@ -1109,7 +1117,7 @@ int snd_soc_add_dai_link(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai_link_component *codec, *platform;
+	struct snd_soc_dai_link_component *codec, *platform, *cpu;
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1134,14 +1142,19 @@ int snd_soc_add_dai_link(struct snd_soc_card *card,
 	if (!rtd)
 		return -ENOMEM;
 
-	/* FIXME: we need multi CPU support in the future */
-	rtd->cpu_dai = snd_soc_find_dai(dai_link->cpus);
-	if (!rtd->cpu_dai) {
-		dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
-			 dai_link->cpus->dai_name);
-		goto _err_defer;
+	rtd->num_cpu_dai = dai_link->num_cpus;
+	for_each_link_cpus(dai_link, i, cpu) {
+		rtd->cpu_dais[i] = snd_soc_find_dai(cpu);
+		if (!rtd->cpu_dais[i]) {
+			dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
+				 cpu->dai_name);
+			goto _err_defer;
+		}
+		snd_soc_rtdcom_add(rtd, rtd->cpu_dais[i]->component);
 	}
-	snd_soc_rtdcom_add(rtd, rtd->cpu_dai->component);
+
+	/* Single cpu links expect cpu and cpu_dai in runtime data */
+	rtd->cpu_dai = rtd->cpu_dais[0];
 
 	/* Find CODEC from registered CODECs */
 	rtd->num_codecs = dai_link->num_codecs;
@@ -1372,6 +1385,7 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	int i;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_pcm_runtime *rtd;
 	int order;
 
@@ -1381,14 +1395,15 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
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
 
@@ -1399,9 +1414,12 @@ static int soc_probe_link_dais(struct snd_soc_card *card)
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
@@ -1494,10 +1512,11 @@ static int soc_link_init(struct snd_soc_card *card,
 			 struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 	int ret, num;
+	int i;
 
 	/* set default power off timeout */
 	rtd->pmdown_time = pmdown_time;
@@ -1539,12 +1558,14 @@ static int soc_link_init(struct snd_soc_card *card,
 	}
 
 	/* create compress_device if possible */
-	ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
-	if (ret != -ENOTSUPP) {
-		if (ret < 0)
-			dev_err(card->dev, "ASoC: can't create compress %s\n",
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
+		if (ret != -ENOTSUPP) {
+			if (ret < 0)
+				dev_err(card->dev, "ASoC: can't create compress %s\n",
 					 dai_link->stream_name);
-		return ret;
+			return ret;
+		}
 	}
 
 	/* create the pcm */
@@ -1554,7 +1575,7 @@ static int soc_link_init(struct snd_soc_card *card,
 			dai_link->stream_name, ret);
 		return ret;
 	}
-	ret = soc_link_dai_pcm_new(&cpu_dai, 1, rtd);
+	ret = soc_link_dai_pcm_new(rtd->cpu_dais, rtd->num_cpu_dai, rtd);
 	if (ret < 0)
 		return ret;
 	ret = soc_link_dai_pcm_new(rtd->codec_dais,
@@ -1640,7 +1661,7 @@ static void soc_remove_aux_devices(struct snd_soc_card *card)
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	unsigned int i;
 	int ret;
@@ -1658,33 +1679,35 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
 	 * the component which has non_legacy_dai_naming is Codec
 	 */
-	if (cpu_dai->component->driver->non_legacy_dai_naming) {
-		unsigned int inv_dai_fmt;
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (cpu_dai->component->driver->non_legacy_dai_naming) {
+			unsigned int inv_dai_fmt;
+
+			inv_dai_fmt = dai_fmt & ~SND_SOC_DAIFMT_MASTER_MASK;
+			switch (dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+			case SND_SOC_DAIFMT_CBM_CFM:
+				inv_dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+				break;
+			case SND_SOC_DAIFMT_CBM_CFS:
+				inv_dai_fmt |= SND_SOC_DAIFMT_CBS_CFM;
+				break;
+			case SND_SOC_DAIFMT_CBS_CFM:
+				inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFS;
+				break;
+			case SND_SOC_DAIFMT_CBS_CFS:
+				inv_dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+				break;
+			}
 
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
+			dai_fmt = inv_dai_fmt;
 		}
 
-		dai_fmt = inv_dai_fmt;
-	}
-
-	ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
-	if (ret != 0 && ret != -ENOTSUPP) {
-		dev_warn(cpu_dai->dev,
-			 "ASoC: Failed to set DAI format: %d\n", ret);
-		return ret;
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
+		if (ret != 0 && ret != -ENOTSUPP) {
+			dev_warn(cpu_dai->dev,
+				 "ASoC: Failed to set DAI format: %d\n", ret);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -2149,8 +2172,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 				pinctrl_pm_select_sleep_state(dai->dev);
 		}
 
-		if (!rtd->cpu_dai->active)
-			pinctrl_pm_select_sleep_state(rtd->cpu_dai->dev);
+		for_each_rtd_cpu_dai(rtd, i, dai) {
+			if (!dai->active)
+				pinctrl_pm_select_sleep_state(dai->dev);
+		}
 	}
 
 probe_end:
@@ -2212,11 +2237,13 @@ int snd_soc_poweroff(struct device *dev)
 
 	/* deactivate pins to sleep state */
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+		struct snd_soc_dai *cpu_dai;
 		struct snd_soc_dai *codec_dai;
 		int i;
 
-		pinctrl_pm_select_sleep_state(cpu_dai->dev);
+		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+			pinctrl_pm_select_sleep_state(cpu_dai->dev);
+		}
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			pinctrl_pm_select_sleep_state(codec_dai->dev);
 		}
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
