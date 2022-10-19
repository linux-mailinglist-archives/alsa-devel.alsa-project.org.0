Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9949604D4C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D75AAE9E;
	Wed, 19 Oct 2022 18:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D75AAE9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196731;
	bh=eU1CeXuTw1IsV7HUjCGbyoslz1FNaX3JlJEelw7RZYU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=guNJqZYkEJZ8lBBSvGQIVT6PbM4TUUxUKELZjMKxtckFF+/F6AClAfhd/5hw2YOja
	 FVytaue+PiPDusaHaLUqt9ANMqmLfUYaZEK8+nmD3mXMC3qYQGO6qte0+LdoNVl188
	 e79HI+TNwEsVJX9uw71n/ufaXyfjqEFkmEZABaGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31739F8054A;
	Wed, 19 Oct 2022 18:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D84FF80553; Wed, 19 Oct 2022 18:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CED2DF804CC
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED2DF804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gsH2T96S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196630; x=1697732630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eU1CeXuTw1IsV7HUjCGbyoslz1FNaX3JlJEelw7RZYU=;
 b=gsH2T96SrqmBZaQwUIRllHNWJSzkf/rOl6/5yufcup1YmK6wy8a0ZNbF
 cnYU/sb3nNSM64NGDfa3+Mt+GACoXk1M+YlfEHdHR8P2txDtn/vsAXgUX
 y3U9I2S3o6NPCS61ubShImu+dfEKpBOEDonju0DQXpsYrSpC4y6dnCAib
 ekl7UCrolOilrawPeNLc/CTQOukwp8CMSaQ895JDXCDYnLkIxlT0U3d1I
 auViRH5WIkOai0Zp13HwSoIfnxnEuZ6HF5sCxXoPzwl+8kkDEVrnEVRjZ
 t4BxDUG7+mofZEM6vyJnlTP7oCWXyi5lSSfrsxfeLQPrUnEn9+rW6aUyC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856222"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856222"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153826"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153826"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: SOF: Intel: hda-dai: use hlink variable/parameter
Date: Wed, 19 Oct 2022 11:21:08 -0500
Message-Id: <20221019162115.185917-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Follow the convention and use hlink for consistency.
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 556e883a32edb..0fadf99f2efad 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -146,11 +146,11 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	struct hdac_bus *bus = hstream->bus;
 	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_ext_link *link;
+	struct hdac_ext_link *hlink;
 	int stream_tag;
 
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
+	hlink = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!hlink)
 		return -EINVAL;
 
 	if (trigger_suspend_stop)
@@ -158,7 +158,7 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		stream_tag = hdac_stream(hext_stream)->stream_tag;
-		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		snd_hdac_ext_link_clear_stream_id(hlink, stream_tag);
 	}
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
 	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
@@ -177,7 +177,7 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	unsigned char stream_tag = hstream->stream_tag;
 	struct hdac_bus *bus = hstream->bus;
-	struct hdac_ext_link *link;
+	struct hdac_ext_link *hlink;
 	unsigned int format_val;
 
 	snd_hdac_ext_link_stream_reset(hext_stream);
@@ -192,9 +192,9 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	snd_hdac_ext_link_stream_setup(hext_stream, format_val);
 
 	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		list_for_each_entry(link, &bus->hlink_list, list) {
-			if (link->index == params->link_index)
-				snd_hdac_ext_link_set_stream_id(link,
+		list_for_each_entry(hlink, &bus->hlink_list, list) {
+			if (hlink->index == params->link_index)
+				snd_hdac_ext_link_set_stream_id(hlink,
 								stream_tag);
 		}
 	}
@@ -214,7 +214,7 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hda_pipe_params p_params = {0};
 	struct hdac_bus *bus = hstream->bus;
-	struct hdac_ext_link *link;
+	struct hdac_ext_link *hlink;
 
 	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
@@ -225,8 +225,8 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
 	}
 
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
+	hlink = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!hlink)
 		return -EINVAL;
 
 	/* set the hdac_stream in the codec dai */
@@ -236,7 +236,7 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	p_params.ch = params_channels(params);
 	p_params.s_freq = params_rate(params);
 	p_params.stream = substream->stream;
-	p_params.link_index = link->index;
+	p_params.link_index = hlink->index;
 	p_params.format = params_format(params);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-- 
2.34.1

