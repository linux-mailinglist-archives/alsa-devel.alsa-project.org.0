Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587A517014
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 15:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927D715E5;
	Mon,  2 May 2022 15:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927D715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651497289;
	bh=i3sODOZ2hKY4Hg4AtT00iOazNEgIIhoNw/ZsA8dg1z0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ixhSEANw71AXxJNhXt1BuOi5hLtm2wd6dyI+IjTvfoQs3AOt4bqBGWW1wX+B55j/Y
	 bwUyb+IkwP3suq5ejTFTy+KU4jKVbG210fwwvlSbNRbY+fFmUkIF2A9rmuIOmo1DLj
	 Gcq0MzjHXYADWlRCCPjpHi7qbqX7Onv0jBDjVWCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAF7F80129;
	Mon,  2 May 2022 15:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 637A8F80245; Mon,  2 May 2022 15:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 345FCF800D2
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 15:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 345FCF800D2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nlVru-0000l5-7Q; Mon, 02 May 2022 15:13:38 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nlVru-006XlI-C6; Mon, 02 May 2022 15:13:36 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nlVrs-00AvZi-7q; Mon, 02 May 2022 15:13:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: Use default config when none
 is given
Date: Mon,  2 May 2022 15:13:35 +0200
Message-Id: <20220502131335.2604158-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, kernel@pengutronix.de
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

snd_dmaengine_pcm_register() can be passed a NULL pointer for the config
which means that the we have to test for pcm->config being non NULL
before accessing it. Make the code more straight forward by providing a
default config when none is passed. With this pcm->config is never NULL
and we can skip all the if (pcm->config) tests.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 57 ++++++++++++---------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 285441d6aeed4..87858462bba99 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -79,29 +79,19 @@ static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
-	int (*prepare_slave_config)(struct snd_pcm_substream *substream,
-			struct snd_pcm_hw_params *params,
-			struct dma_slave_config *slave_config);
 	struct dma_slave_config slave_config;
+	int ret;
 
-	memset(&slave_config, 0, sizeof(slave_config));
-
-	if (!pcm->config)
-		prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
-	else
-		prepare_slave_config = pcm->config->prepare_slave_config;
+	if (!pcm->config->prepare_slave_config)
+		return 0;
 
-	if (prepare_slave_config) {
-		int ret = prepare_slave_config(substream, params, &slave_config);
-		if (ret)
-			return ret;
+	memset(&slave_config, 0, sizeof(slave_config));
 
-		ret = dmaengine_slave_config(chan, &slave_config);
-		if (ret)
-			return ret;
-	}
+	ret = pcm->config->prepare_slave_config(substream, params, &slave_config);
+	if (ret)
+		return ret;
 
-	return 0;
+	return dmaengine_slave_config(chan, &slave_config);
 }
 
 static int
@@ -121,7 +111,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	if (pcm->config && pcm->config->pcm_hardware)
+	if (pcm->config->pcm_hardware)
 		return snd_soc_set_runtime_hwparams(substream,
 				pcm->config->pcm_hardware);
 
@@ -188,7 +178,6 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 {
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct snd_dmaengine_dai_dma_data *dma_data;
-	dma_filter_fn fn = NULL;
 
 	if (rtd->num_cpus > 1) {
 		dev_err(rtd->dev,
@@ -201,13 +190,11 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
 		return pcm->chan[0];
 
-	if (pcm->config && pcm->config->compat_request_channel)
+	if (pcm->config->compat_request_channel)
 		return pcm->config->compat_request_channel(rtd, substream);
 
-	if (pcm->config)
-		fn = pcm->config->compat_filter_fn;
-
-	return snd_dmaengine_pcm_request_channel(fn, dma_data->filter_data);
+	return snd_dmaengine_pcm_request_channel(pcm->config->compat_filter_fn,
+						 dma_data->filter_data);
 }
 
 static bool dmaengine_pcm_can_report_residue(struct device *dev,
@@ -239,12 +226,12 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
 	size_t max_buffer_size;
 	unsigned int i;
 
-	if (config && config->prealloc_buffer_size)
+	if (config->prealloc_buffer_size)
 		prealloc_buffer_size = config->prealloc_buffer_size;
 	else
 		prealloc_buffer_size = prealloc_buffer_size_kbytes * 1024;
 
-	if (config && config->pcm_hardware && config->pcm_hardware->buffer_bytes_max)
+	if (config->pcm_hardware && config->pcm_hardware->buffer_bytes_max)
 		max_buffer_size = config->pcm_hardware->buffer_bytes_max;
 	else
 		max_buffer_size = SIZE_MAX;
@@ -254,7 +241,7 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
 		if (!substream)
 			continue;
 
-		if (!pcm->chan[i] && config && config->chan_names[i])
+		if (!pcm->chan[i] && config->chan_names[i])
 			pcm->chan[i] = dma_request_slave_channel(dev,
 				config->chan_names[i]);
 
@@ -367,10 +354,10 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 	struct dma_chan *chan;
 
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || (!dev->of_node &&
-	    !(config && config->dma_dev && config->dma_dev->of_node)))
+	    !(config->dma_dev && config->dma_dev->of_node)))
 		return 0;
 
-	if (config && config->dma_dev) {
+	if (config->dma_dev) {
 		/*
 		 * If this warning is seen, it probably means that your Linux
 		 * device structure does not match your HW device structure.
@@ -387,7 +374,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			name = "rx-tx";
 		else
 			name = dmaengine_pcm_dma_channel_names[i];
-		if (config && config->chan_names[i])
+		if (config->chan_names[i])
 			name = config->chan_names[i];
 		chan = dma_request_chan(dev, name);
 		if (IS_ERR(chan)) {
@@ -425,6 +412,10 @@ static void dmaengine_pcm_release_chan(struct dmaengine_pcm *pcm)
 	}
 }
 
+static const struct snd_dmaengine_pcm_config snd_dmaengine_pcm_default_config = {
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+};
+
 /**
  * snd_dmaengine_pcm_register - Register a dmaengine based PCM device
  * @dev: The parent device for the PCM device
@@ -445,6 +436,8 @@ int snd_dmaengine_pcm_register(struct device *dev,
 #ifdef CONFIG_DEBUG_FS
 	pcm->component.debugfs_prefix = "dma";
 #endif
+	if (!config)
+		config = &snd_dmaengine_pcm_default_config;
 	pcm->config = config;
 	pcm->flags = flags;
 
@@ -452,7 +445,7 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	if (ret)
 		goto err_free_dma;
 
-	if (config && config->process)
+	if (config->process)
 		driver = &dmaengine_pcm_component_process;
 	else
 		driver = &dmaengine_pcm_component;
-- 
2.30.2

