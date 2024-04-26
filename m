Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E575E8B34C3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D44EE0D;
	Fri, 26 Apr 2024 12:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D44EE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125639;
	bh=T4nHsF9OKK9PpS+tpyMCag09I+TatdAfIymTICQ28jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jtd/jvs1zrtbd745KB7TwquNXGFjIh0cZamSEvtYjAiLKdnfrizj1DlXqshvnhfMe
	 x53dwmGm4AwGjsbc/UwPuEyNyPPPQx6bQwPDdoa3xNUpbLeIR9vLOAORDJTYVBqVgp
	 KlNemBWHu/ODagUD6+TZrtLyPjDQbkwx2uBsRRnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0119FF805CB; Fri, 26 Apr 2024 11:59:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58037F805CB;
	Fri, 26 Apr 2024 11:59:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DB0CF80570; Fri, 26 Apr 2024 11:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81A1CF802E8
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A1CF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BlL5rZAH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125419; x=1745661419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4nHsF9OKK9PpS+tpyMCag09I+TatdAfIymTICQ28jw=;
  b=BlL5rZAH+aVwMqQ23hzgRsHlNcW9+RDWg2ACjahmGVcCS8pJfxlO8Oak
   G7oS1QoXpr+FMv2oBmW+ivWfc0qpJr1Z6qlLg4YPpQR8ygTGCoFZNFLnl
   yxoh03lU54kWrcZ3PbedX9C2XE9Jxdl4EPrmSb8LGwRwpPA11GKx5c4pc
   4RGm+IGzN5clGiPTdPtqz/yGDRwmNG94rBfSAtJ+RCRuONYfeuk8+2zMp
   yWz858WF0G0wFx1rmOcKZBJN1hMvvYTJ4fkrvVYOOMSkRoyuQBpzhthGy
   HiSMjCNCCGOngG+oXgrEUbgLOOV/XPK8QX3Yeo8AHpuCt0soVrFPvJ+MV
   g==;
X-CSE-ConnectionGUID: GKlkjQQuRQejQyhfPyDFMw==
X-CSE-MsgGUID: nr/J5IriT6GHlMXS59WR3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409204"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409204"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:56:57 -0700
X-CSE-ConnectionGUID: eGWsMj9aTv2AUPXSi/+nxw==
X-CSE-MsgGUID: 29Vqh8b6StOyno+65ujRbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460588"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/8] ASoC: Intel: avs: Store pointer to adev in DAI dma_data
Date: Fri, 26 Apr 2024 11:57:29 +0200
Message-Id: <20240426095733.3946951-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4GMER2UJOV6H6WDFRXBULUUVR2K4327L
X-Message-ID-Hash: 4GMER2UJOV6H6WDFRXBULUUVR2K4327L
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GMER2UJOV6H6WDFRXBULUUVR2K4327L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reduce the number of to_avs_dev() casts by storing the driver context in
DAI's dma_data.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 23f7e0fae817..a3a04115216c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -22,6 +22,7 @@
 struct avs_dma_data {
 	struct avs_tplg_path_template *template;
 	struct avs_path *path;
+	struct avs_dev *adev;
 	/*
 	 * link stream is stored within substream's runtime
 	 * private_data to fulfill the needs of codec BE path
@@ -60,7 +61,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 			   const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct avs_dev *adev = to_avs_dev(dai->component->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
 
@@ -77,6 +78,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 
 	data->substream = substream;
 	data->template = template;
+	data->adev = adev;
 	snd_soc_dai_set_dma_data(dai, substream, data);
 
 	if (rtd->dai_link->ignore_suspend)
@@ -88,13 +90,12 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
 	if (rtd->dai_link->ignore_suspend)
-		adev->num_lp_paths--;
+		data->adev->num_lp_paths--;
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	kfree(data);
@@ -107,7 +108,6 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct avs_dma_data *data;
 	struct avs_path *path;
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	int ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
@@ -124,7 +124,7 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 		params_rate(be_hw_params), params_channels(be_hw_params),
 		params_width(be_hw_params), params_physical_width(be_hw_params));
 
-	path = avs_path_create(adev, dma_id, data->template, fe_hw_params, be_hw_params);
+	path = avs_path_create(data->adev, dma_id, data->template, fe_hw_params, be_hw_params);
 	if (IS_ERR(path)) {
 		ret = PTR_ERR(path);
 		dev_err(dai->dev, "create path failed: %d\n", ret);
@@ -505,8 +505,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct avs_dma_data *data;
-	struct avs_dev *adev = to_avs_dev(dai->dev);
-	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_bus *bus;
 	struct hdac_ext_stream *host_stream;
 	int ret;
 
@@ -515,6 +514,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 		return ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
+	bus = &data->adev->base.core;
 
 	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
 	if (!host_stream) {
@@ -655,7 +655,6 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
 	struct hdac_bus *bus;
@@ -685,7 +684,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = avs_dai_prepare(adev, substream, dai);
+	ret = avs_dai_prepare(data->adev, substream, dai);
 	if (ret)
 		return ret;
 
-- 
2.25.1

