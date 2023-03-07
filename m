Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15626AE1A3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:06:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B761B1476;
	Tue,  7 Mar 2023 15:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B761B1476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678197977;
	bh=G7hxpX7McKYMm/PX3OjERyQ12YBFZ6yOKJB/tyjpN+4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IELYGqc6XXSmG3tGu74Sh9AoAV7pJ7ANMc6CR++9Dfjej0IoG+atmImEQj/3dosqX
	 lNrhxOIbwXAAZ++iUhzAkq3sxwIeD4dbG6jn0huRGHkcNPyi8Zir/b2YwIEgdh/iAe
	 noOnP3QwbRPRGKPTX00hVKpoPHlV4zPisV3TDomY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7761F804FE;
	Tue,  7 Mar 2023 15:04:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3DCBF8051B; Tue,  7 Mar 2023 15:04:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2CB1F8042F
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CB1F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aGnoLfEe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197869; x=1709733869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G7hxpX7McKYMm/PX3OjERyQ12YBFZ6yOKJB/tyjpN+4=;
  b=aGnoLfEefeiJOGgz91wmW38WnsXHOrslWieCwqlY38Z3Cy/gVNG2Y7Me
   /yl/Pf/YHkJbO4r6ZO59NCNLYjMQ5h6dMNdI/KdyP1FhYhGNq8sx4387d
   NH5Ja6jXFJ2k8zeI2r9ozYDFP3UM0bi1jrIcTrKv6VrFvSCSD4+/cM3YK
   F3BnVk3//jnh/5khAMW/jkNwyvtzf1eC1dHL8ju/m0hvMjsRokH1KXVV9
   dZ71+nFXi6pZheDUOXSdRibqEcdAQStUXqpqyRTk6ZWkyMQq5qxSgshXc
   gKqVh83yh7aw2j7t4pV36bKPBEYYuN87VRvLF16jZB6NwDeE/pcDr5kzo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255179"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706928"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706928"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:18 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 02/14] ASoC: SOF: Intel: hda-dai: Remove hda_link_dma_params()
Date: Tue,  7 Mar 2023 16:04:23 +0200
Message-Id: <20230307140435.2808-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZWT3VNEJUQOFNWKW6CLSR2ANFA64GL2K
X-Message-ID-Hash: ZWT3VNEJUQOFNWKW6CLSR2ANFA64GL2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWT3VNEJUQOFNWKW6CLSR2ANFA64GL2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

No code change. Just code move from hda_link_dma_params() to
hda_link_dma_hw_params().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 62 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c7f89c18d5c2..770c00ae29ac 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -168,39 +168,6 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
-			       struct hda_pipe_params *params)
-{
-	struct hdac_stream *hstream = &hext_stream->hstream;
-	unsigned char stream_tag = hstream->stream_tag;
-	struct hdac_bus *bus = hstream->bus;
-	struct hdac_ext_link *hlink;
-	unsigned int format_val;
-
-	snd_hdac_ext_stream_reset(hext_stream);
-
-	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
-						 params->format,
-						 params->link_bps, 0);
-
-	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
-		format_val, params->s_freq, params->ch, params->format);
-
-	snd_hdac_ext_stream_setup(hext_stream, format_val);
-
-	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		list_for_each_entry(hlink, &bus->hlink_list, list) {
-			if (hlink->index == params->link_index)
-				snd_hdac_ext_bus_link_set_stream_id(hlink,
-								    stream_tag);
-		}
-	}
-
-	hext_stream->link_prepared = 1;
-
-	return 0;
-}
-
 static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -209,9 +176,12 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hda_pipe_params p_params = {0};
 	struct hdac_ext_stream *hext_stream;
+	struct hdac_stream *hstream;
 	struct hdac_ext_link *hlink;
 	struct snd_sof_dev *sdev;
 	struct hdac_bus *bus;
+	unsigned int format_val;
+	unsigned char stream_tag;
 
 	sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	bus = sof_to_bus(sdev);
@@ -229,6 +199,9 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
 	}
 
+	hstream = &hext_stream->hstream;
+	stream_tag = hstream->stream_tag;
+
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream), substream->stream);
 
@@ -242,7 +215,28 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	else
 		p_params.link_bps = codec_dai->driver->capture.sig_bits;
 
-	return hda_link_dma_params(hext_stream, &p_params);
+	snd_hdac_ext_stream_reset(hext_stream);
+
+	format_val = snd_hdac_calc_stream_format(p_params.s_freq, p_params.ch,
+						 p_params.format,
+						 p_params.link_bps, 0);
+
+	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
+		format_val, p_params.s_freq, p_params.ch, p_params.format);
+
+	snd_hdac_ext_stream_setup(hext_stream, format_val);
+
+	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		list_for_each_entry(hlink, &bus->hlink_list, list) {
+			if (hlink->index == p_params.link_index)
+				snd_hdac_ext_bus_link_set_stream_id(hlink,
+								    stream_tag);
+		}
+	}
+
+	hext_stream->link_prepared = 1;
+
+	return 0;
 }
 
 static int hda_link_dma_prepare(struct snd_pcm_substream *substream)
-- 
2.39.2

