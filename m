Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E26AE1AF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:07:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEF3E1488;
	Tue,  7 Mar 2023 15:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEF3E1488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198035;
	bh=SvPWvMFHECfm12wAqbwkiWMD1HJJLwawB7HwTiauMB8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qwsve/7AlFwlHN4XhQa5kZcj5fOKjJGC/eGJtasfZfjrzc/CJYOGtWW2L3/huwDYn
	 qfne2ReBnzlqm1uAlsahfl9oyc41HyERQswv9SonswTVP8TAmsfW8YvJGyVyQJiwBx
	 xfVMnxofoHdRjySX/L4zbfOZ4TTtgRYBaAGn4tvo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5DEF8055C;
	Tue,  7 Mar 2023 15:04:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7334F80431; Tue,  7 Mar 2023 15:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 890C6F80236
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 890C6F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gwOlBcUr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197870; x=1709733870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SvPWvMFHECfm12wAqbwkiWMD1HJJLwawB7HwTiauMB8=;
  b=gwOlBcUr+2LAdEFu1zSACw7MFIsG6OutrGiRh8fUnnIKhQ2IKWc4ZwGj
   4rAslq/KljvapRSO93AwlqhyJIYQs6LPAd5R3Q9V2QmW2sgeFm9fieXSL
   bhlHHYME10thSY1HcnRgRvPXv3R0LsqR3N9wjtJjJABYx5vsA1IGJysPw
   AslzXCtdP+MO1YE9m/kuhFAcL86Odc78qI1+zmOurIRylNNUqXBllQaQE
   j2HOasCvbTitOAoWOGXQ174Cx4oVIRMLBObY4J/8qg1hljruWb0NUM0Ti
   SFveixLxsLUTLFu35J6tge0jcyi9vWrbDm+Ybo3zYr33JVIWe8Fr/dTfx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255192"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255192"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706936"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706936"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 03/14] ASoC: SOF: Intel: hda-dai: remove struct
 hda_pipe_params
Date: Tue,  7 Mar 2023 16:04:24 +0200
Message-Id: <20230307140435.2808-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4SK64QVNRZHAM2AX6JXFRYRCU745IGJT
X-Message-ID-Hash: 4SK64QVNRZHAM2AX6JXFRYRCU745IGJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SK64QVNRZHAM2AX6JXFRYRCU745IGJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove the struct definition and use the params argument directly.
Also, use the hlink pointer to set the stream ID instead of looking it
up again.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 37 +++++++++--------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 770c00ae29ac..009299c6de40 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -29,14 +29,6 @@ MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 
-struct hda_pipe_params {
-	u32 ch;
-	u32 s_freq;
-	snd_pcm_format_t format;
-	int link_index;
-	unsigned int link_bps;
-};
-
 /*
  * This function checks if the host dma channel corresponding
  * to the link DMA stream_tag argument is assigned to one
@@ -174,13 +166,13 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct hda_pipe_params p_params = {0};
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
 	struct hdac_ext_link *hlink;
 	struct snd_sof_dev *sdev;
 	struct hdac_bus *bus;
 	unsigned int format_val;
+	unsigned int link_bps;
 	unsigned char stream_tag;
 
 	sdev = snd_soc_component_get_drvdata(cpu_dai->component);
@@ -202,38 +194,27 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	hstream = &hext_stream->hstream;
 	stream_tag = hstream->stream_tag;
 
+	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK)
+		snd_hdac_ext_bus_link_set_stream_id(hlink, stream_tag);
+
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream), substream->stream);
 
-	p_params.ch = params_channels(params);
-	p_params.s_freq = params_rate(params);
-	p_params.link_index = hlink->index;
-	p_params.format = params_format(params);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		p_params.link_bps = codec_dai->driver->playback.sig_bits;
+		link_bps = codec_dai->driver->playback.sig_bits;
 	else
-		p_params.link_bps = codec_dai->driver->capture.sig_bits;
+		link_bps = codec_dai->driver->capture.sig_bits;
 
 	snd_hdac_ext_stream_reset(hext_stream);
 
-	format_val = snd_hdac_calc_stream_format(p_params.s_freq, p_params.ch,
-						 p_params.format,
-						 p_params.link_bps, 0);
+	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
+						 params_format(params), link_bps, 0);
 
 	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
-		format_val, p_params.s_freq, p_params.ch, p_params.format);
+		format_val, params_rate(params), params_channels(params), params_format(params));
 
 	snd_hdac_ext_stream_setup(hext_stream, format_val);
 
-	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		list_for_each_entry(hlink, &bus->hlink_list, list) {
-			if (hlink->index == p_params.link_index)
-				snd_hdac_ext_bus_link_set_stream_id(hlink,
-								    stream_tag);
-		}
-	}
-
 	hext_stream->link_prepared = 1;
 
 	return 0;
-- 
2.39.2

