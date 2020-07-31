Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD032347FA
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 16:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF971672;
	Fri, 31 Jul 2020 16:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF971672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596206761;
	bh=LdLyQpZhCRzmIKlBnQuB2s+3sKDKL6Wmdk5qYHZfyqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/34sz/mwzLwfRc+hqnHqt8yu5UvJ4P0vlfnISuYiakAd5PP3FXe6ZyOKEByRKA4v
	 ieulz6PeOBARL8w3agqS41r2PGXOrBEs2UjxRBpaztaczIkU8yfE7oq+wnlZw4dXEr
	 uqOsKHFS5EZ0RdLjFzsU0nvEM14r652gXpoc8yEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E89F802BE;
	Fri, 31 Jul 2020 16:42:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CD80F8028D; Fri, 31 Jul 2020 16:42:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DA0F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 16:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DA0F8015C
IronPort-SDR: 9Ui5BiCmE9Fco2nC1cUoqA0uEpiobJZTnEvooC4CEFGRCZpWqg12diTx6MjkFxZiFPAmZfkG20
 5AGUGpwf/jTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131352479"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="131352479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 07:42:31 -0700
IronPort-SDR: OfL+I5sLrmC26koglryeIMQ4E1w7sHB2a7JjgHDrmxNlUt5rjC2Z+0Tphu5BEbPXA2MGTAl/ME
 khS12aq6O/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="491505215"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2020 07:42:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: core: Two step component registration
Date: Fri, 31 Jul 2020 16:41:46 +0200
Message-Id: <20200731144146.6678-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731144146.6678-1-cezary.rojewski@intel.com>
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lars@metafoo.de,
 olivier.moysan@st.com, alexandre.torgue@st.com, tiwai@suse.com,
 arnaud.pouliquen@st.com, lgirdwood@gmail.com, broonie@kernel.org,
 mcoquelin.stm32@gmail.com
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

Modify snd_soc_add_component so it calls snd_soc_component_initialize
no longer and thus providing true two-step registration. Drivers may
choose to change component's fields before actually adding it to ASoC
subsystem.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h                   |  8 +++-----
 sound/soc/soc-core.c                  | 27 +++++++++++++--------------
 sound/soc/soc-generic-dmaengine-pcm.c | 14 +++++++++-----
 sound/soc/stm/stm32_adfsdm.c          |  9 +++++++--
 4 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 787374362f83..5e3919ffb00c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -417,11 +417,9 @@ int snd_soc_poweroff(struct device *dev);
 int snd_soc_component_initialize(struct snd_soc_component *component,
 				 const struct snd_soc_component_driver *driver,
 				 struct device *dev);
-int snd_soc_add_component(struct device *dev,
-		struct snd_soc_component *component,
-		const struct snd_soc_component_driver *component_driver,
-		struct snd_soc_dai_driver *dai_drv,
-		int num_dai);
+int snd_soc_add_component(struct snd_soc_component *component,
+			  struct snd_soc_dai_driver *dai_drv,
+			  int num_dai);
 int snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f528367bc3be..2fe1b2ec7c8f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2463,22 +2463,16 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
 
-int snd_soc_add_component(struct device *dev,
-			struct snd_soc_component *component,
-			const struct snd_soc_component_driver *component_driver,
-			struct snd_soc_dai_driver *dai_drv,
-			int num_dai)
+int snd_soc_add_component(struct snd_soc_component *component,
+			  struct snd_soc_dai_driver *dai_drv,
+			  int num_dai)
 {
 	int ret;
 	int i;
 
 	mutex_lock(&client_mutex);
 
-	ret = snd_soc_component_initialize(component, component_driver, dev);
-	if (ret)
-		goto err_free;
-
-	if (component_driver->endianness) {
+	if (component->driver->endianness) {
 		for (i = 0; i < num_dai; i++) {
 			convert_endianness_formats(&dai_drv[i].playback);
 			convert_endianness_formats(&dai_drv[i].capture);
@@ -2487,7 +2481,8 @@ int snd_soc_add_component(struct device *dev,
 
 	ret = snd_soc_register_dais(component, dai_drv, num_dai);
 	if (ret < 0) {
-		dev_err(dev, "ASoC: Failed to register DAIs: %d\n", ret);
+		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
+			ret);
 		goto err_cleanup;
 	}
 
@@ -2505,7 +2500,7 @@ int snd_soc_add_component(struct device *dev,
 err_cleanup:
 	if (ret < 0)
 		snd_soc_del_component_unlocked(component);
-err_free:
+
 	mutex_unlock(&client_mutex);
 
 	if (ret == 0)
@@ -2521,13 +2516,17 @@ int snd_soc_register_component(struct device *dev,
 			int num_dai)
 {
 	struct snd_soc_component *component;
+	int ret;
 
 	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
 	if (!component)
 		return -ENOMEM;
 
-	return snd_soc_add_component(dev, component, component_driver,
-				     dai_drv, num_dai);
+	ret = snd_soc_component_initialize(component, component_driver, dev);
+	if (ret < 0)
+		return ret;
+
+	return snd_soc_add_component(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component);
 
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d17b4bf1dbe3..fb95c1464e66 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -424,6 +424,7 @@ static void dmaengine_pcm_release_chan(struct dmaengine_pcm *pcm)
 int snd_dmaengine_pcm_register(struct device *dev,
 	const struct snd_dmaengine_pcm_config *config, unsigned int flags)
 {
+	const struct snd_soc_component_driver *driver;
 	struct dmaengine_pcm *pcm;
 	int ret;
 
@@ -442,12 +443,15 @@ int snd_dmaengine_pcm_register(struct device *dev,
 		goto err_free_dma;
 
 	if (config && config->process)
-		ret = snd_soc_add_component(dev, &pcm->component,
-					    &dmaengine_pcm_component_process,
-					    NULL, 0);
+		driver = &dmaengine_pcm_component_process;
 	else
-		ret = snd_soc_add_component(dev, &pcm->component,
-					    &dmaengine_pcm_component, NULL, 0);
+		driver = &dmaengine_pcm_component;
+
+	ret = snd_soc_component_initialize(&pcm->component, driver, dev);
+	if (ret)
+		goto err_free_dma;
+
+	ret = snd_soc_add_component(&pcm->component, NULL, 0);
 	if (ret)
 		goto err_free_dma;
 
diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index c1433c20b08b..ec27c13af04f 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -344,12 +344,17 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 	component = devm_kzalloc(&pdev->dev, sizeof(*component), GFP_KERNEL);
 	if (!component)
 		return -ENOMEM;
+
+	ret = snd_soc_component_initialize(component,
+					   &stm32_adfsdm_soc_platform,
+					   &pdev->dev);
+	if (ret < 0)
+		return ret;
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "pcm";
 #endif
 
-	ret = snd_soc_add_component(&pdev->dev, component,
-				    &stm32_adfsdm_soc_platform, NULL, 0);
+	ret = snd_soc_add_component(component, NULL, 0);
 	if (ret < 0)
 		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
 			__func__);
-- 
2.17.1

