Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768F6AE1A5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDFB147F;
	Tue,  7 Mar 2023 15:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDFB147F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678197979;
	bh=ve4LEa7w5q9SgCM6Zjzdj7jRF6lciFsswqv/nbgoBMg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uAtNQMI62Z9Blj3sfjqTu+k454reAgjfJU0/Sl1HHsP7bA4vRtsRi6Tngxr5+DW8w
	 5MTigjLUWUvlbMI8zeWhVgs9NHkvVB+j/pTEPzy8o2t+toLigcWtA4GiAtzZz3oC0W
	 AdWZdb7TFVuvdXyBccMD3yb7NLyJzfuk5bZtLHj8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B5DF80534;
	Tue,  7 Mar 2023 15:04:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB8BF804FE; Tue,  7 Mar 2023 15:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71BBAF800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BBAF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bBliaRn5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197868; x=1709733868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ve4LEa7w5q9SgCM6Zjzdj7jRF6lciFsswqv/nbgoBMg=;
  b=bBliaRn5DpEKmCHe5hxpNKD9/MA9ZQTSY2ym5NAs+wBFWjg6CJDHzc6k
   rhflXKWpGagqpjjcjGigop9HweDfFL456ukq0Tr8uSxy/1zkyr0/Yo+mz
   Yyd1aXkX+drwhGKegT6Yt8bzbnPTkOFBP/C/tSdbrPEmjmlUmoQUT5blU
   VhbmBeNO9YouF9xTBKQzo2NRW8N1nYBEzgph7cM25PSY/cSxgdRdeZJ94
   Vnmtjje45T5PXpaIJ0KPuvg4+wVyisJUhg6cWslRKJSQVNXKThebUIFNl
   Tje/YjRFZ8VxgBuRw1/2B413fVFvsstAkBkilzsln2NWyBBjxIff3ivEO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255162"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255162"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706922"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706922"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:16 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 01/14] ASoC: SOF: Intel: hda-dai: Remove BE DAI DRV ops for
 SSP DAI's
Date: Tue,  7 Mar 2023 16:04:22 +0200
Message-Id: <20230307140435.2808-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2RDFBNJQOEGDN4GYQMVQWMFS6HNYQD54
X-Message-ID-Hash: 2RDFBNJQOEGDN4GYQMVQWMFS6HNYQD54
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RDFBNJQOEGDN4GYQMVQWMFS6HNYQD54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Now that the DAI_CONFIG IPC is sent after widget setup and before widget
free, there is no need for the BE DAI DRV ops that do the same thing. So
remove them.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 113 ----------------------------------
 1 file changed, 113 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 8d9c38d562d3..c7f89c18d5c2 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -605,115 +605,6 @@ static const struct snd_soc_dai_ops ipc4_hda_dai_ops = {
 
 #endif
 
-/* only one flag used so far to harden hw_params/hw_free/trigger/prepare */
-struct ssp_dai_dma_data {
-	bool setup;
-};
-
-static int ssp_dai_setup_or_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
-				 bool setup)
-{
-	struct snd_soc_dapm_widget *w;
-
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-
-	if (setup)
-		return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_NONE, NULL);
-
-	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, NULL);
-}
-
-static int ssp_dai_startup(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
-{
-	struct ssp_dai_dma_data *dma_data;
-
-	dma_data = kzalloc(sizeof(*dma_data), GFP_KERNEL);
-	if (!dma_data)
-		return -ENOMEM;
-
-	snd_soc_dai_set_dma_data(dai, substream, dma_data);
-
-	return 0;
-}
-
-static int ssp_dai_setup(struct snd_pcm_substream *substream,
-			 struct snd_soc_dai *dai,
-			 bool setup)
-{
-	struct ssp_dai_dma_data *dma_data;
-	int ret = 0;
-
-	dma_data = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma_data) {
-		dev_err(dai->dev, "%s: failed to get dma_data\n", __func__);
-		return -EIO;
-	}
-
-	if (dma_data->setup != setup) {
-		ret = ssp_dai_setup_or_free(substream, dai, setup);
-		if (!ret)
-			dma_data->setup = setup;
-	}
-	return ret;
-}
-
-static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
-{
-	/* params are ignored for now */
-	return ssp_dai_setup(substream, dai, true);
-}
-
-static int ssp_dai_prepare(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
-{
-	/*
-	 * the SSP will only be reconfigured during resume operations and
-	 * not in case of xruns
-	 */
-	return ssp_dai_setup(substream, dai, true);
-}
-
-static int ipc3_ssp_dai_trigger(struct snd_pcm_substream *substream,
-				int cmd, struct snd_soc_dai *dai)
-{
-	if (cmd != SNDRV_PCM_TRIGGER_SUSPEND)
-		return 0;
-
-	return ssp_dai_setup(substream, dai, false);
-}
-
-static int ssp_dai_hw_free(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
-{
-	return ssp_dai_setup(substream, dai, false);
-}
-
-static void ssp_dai_shutdown(struct snd_pcm_substream *substream,
-			     struct snd_soc_dai *dai)
-{
-	struct ssp_dai_dma_data *dma_data;
-
-	dma_data = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma_data) {
-		dev_err(dai->dev, "%s: failed to get dma_data\n", __func__);
-		return;
-	}
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(dma_data);
-}
-
-static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
-	.startup = ssp_dai_startup,
-	.hw_params = ssp_dai_hw_params,
-	.prepare = ssp_dai_prepare,
-	.trigger = ipc3_ssp_dai_trigger,
-	.hw_free = ssp_dai_hw_free,
-	.shutdown = ssp_dai_shutdown,
-};
-
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 {
 	int i;
@@ -721,10 +612,6 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 	switch (sdev->pdata->ipc_type) {
 	case SOF_IPC:
 		for (i = 0; i < ops->num_drv; i++) {
-			if (strstr(ops->drv[i].name, "SSP")) {
-				ops->drv[i].ops = &ipc3_ssp_dai_ops;
-				continue;
-			}
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 			if (strstr(ops->drv[i].name, "iDisp") ||
 			    strstr(ops->drv[i].name, "Analog") ||
-- 
2.39.2

