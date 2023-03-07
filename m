Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE696AE1CC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:09:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCC0D147D;
	Tue,  7 Mar 2023 15:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCC0D147D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198177;
	bh=3KtDFHuaUhPPc+mX/D2SbQgBBr4qSPtzunEgueYYAnE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hNXegTMNFAgb8ez4P7cxV1XgMGmhj+FcRe1QpQ3rzW4htqD/Xqg/2NFfMWBBuTFY9
	 p8ZwYnx8waeZjg6rCxxe3muP+9iSNynAWJYIK4rRrM62/um86QVzHmRfUPIj5u0dzv
	 jPp8I3d9no0+sFKppyEf7E2vqJbkkfTA429OV/yA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FB3F805C0;
	Tue,  7 Mar 2023 15:05:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D8AFF80567; Tue,  7 Mar 2023 15:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5D25F80557
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D25F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JdLIl1op
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197891; x=1709733891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3KtDFHuaUhPPc+mX/D2SbQgBBr4qSPtzunEgueYYAnE=;
  b=JdLIl1opC898NXAU/tBYsaQRl5x4H7Iv6nqmn7Owlj5PGbG9T/uk2E9i
   MazQIQLlMhFf+YAOhl0K5EjhVwxKO2tdVRtxAVgJDCCRjtumhn/iN3oj9
   NDdENm7FZDsiG+pqQ0G9GdioovSLG2XPHdTDUKCfMF8vmw3dkrOrqhUdJ
   fJ7zyu2a/XyKrJMtmwcbr/gmN+2ZZhM+do9EwoVB3m4jLmFgwcu37OfxG
   wO0T6iUCBXYAGXPMmXJ4gDp+YGvF6i5KifKEaPTZbYUv7QZcqRItTuGon
   qjXNYrE16d/4XWRsah/FWjkCTzwP+DUBBBsKfpDg0QwrdlEsZ+6xsCxco
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255333"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786707022"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786707022"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:47 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 14/14] ASoC: SOF: Intel: hda: remove redundant DAI config
 during hw_free
Date: Tue,  7 Mar 2023 16:04:35 +0200
Message-Id: <20230307140435.2808-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZLBJR2AIPXZKJNCP3A3CAHWXF55P4N6W
X-Message-ID-Hash: ZLBJR2AIPXZKJNCP3A3CAHWXF55P4N6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLBJR2AIPXZKJNCP3A3CAHWXF55P4N6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The DAI widget is freed during FE DAI hw_free and therefore the DAI
config during BE DAI hw_free is redundant.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 18 +-----------------
 sound/soc/sof/intel/hda.c     | 16 ----------------
 2 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 4ac6148940ae..9637f0f44b01 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -181,7 +181,7 @@ static int hda_link_dma_prepare(struct snd_pcm_substream *substream, struct snd_
 	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
 }
 
-static int hda_link_dma_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+static int hda_dai_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
@@ -319,22 +319,6 @@ static int hda_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	return 0;
 }
 
-static int hda_dai_hw_free(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
-{
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
-	struct snd_sof_dai_config_data data = { 0 };
-	int ret;
-
-	ret = hda_link_dma_hw_free(substream, dai);
-	if (ret < 0)
-		return ret;
-
-	data.dai_data = DMA_CHAN_INVALID;
-
-	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
-}
-
 static const struct snd_soc_dai_ops hda_dai_ops = {
 	.hw_params = hda_dai_hw_params,
 	.hw_free = hda_dai_hw_free,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 890993b2f14b..65389c7278e2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -69,24 +69,8 @@ static int sdw_params_stream(struct device *dev,
 	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_PARAMS, &data);
 }
 
-static int sdw_free_stream(struct device *dev,
-			   struct sdw_intel_stream_free_data *free_data)
-{
-	struct snd_soc_dai *d = free_data->dai;
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, free_data->stream);
-	struct snd_sof_dai_config_data data = { 0 };
-
-	data.dai_index = (free_data->link_id << 8) | d->id;
-
-	/* send invalid stream_id */
-	data.dai_data = 0xFFFF;
-
-	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
-}
-
 struct sdw_intel_ops sdw_callback = {
 	.params_stream = sdw_params_stream,
-	.free_stream = sdw_free_stream,
 };
 
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
-- 
2.39.2

