Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68650AA0E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0BB171E;
	Thu, 21 Apr 2022 22:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0BB171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573406;
	bh=nh24MF2e8BgIXBvfsQEIK/ywkuX/VGV32bIHbbkj7FE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=omUHz5Cje5HUJyPv8hg49jraMFPW66kUiwy1fmUPUEdFzaFmPLdjcdBmTLOeSzyOn
	 y/fApTZH0iMOr42pp9JPf4iJnGQ1C7lytS6F+AeBabqQ3oJyEJms7RI48lE1gQ1DNs
	 M356Lb7Pu9eOhxuKj9bTP6UOSaK8BhxG0Tjq6bPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D09F80570;
	Thu, 21 Apr 2022 22:33:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E81F80549; Thu, 21 Apr 2022 22:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7087EF80528
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7087EF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fOcjhgbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573168; x=1682109168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nh24MF2e8BgIXBvfsQEIK/ywkuX/VGV32bIHbbkj7FE=;
 b=fOcjhgbnIpH39+QVun5sxRqw54/YEDfAXO51M58YBTV3afEhfFpS+C0T
 UUxJk2qkLqoxSMynk76osDGAMQSPYegKKHwg/cm2ULDtFo1/nIt2dLrsV
 Sv22HF688g5wd1rfTHr0z6dJrWQ8+Yk3nuy7pcXs1goh7j6x96NLmGCot
 yttTNqVjZaUYROgiChAdG1b/9xYWhAC2VKWb6DscAoXkA96RcG8XWJIe7
 OhVfYxNLo2iFDXi1ReqRxmq2ozASbA7bfvOCJnO9G0o/Y1ZZNt0ay7HOQ
 MneOajziEXMxU3/qw0OJ1cxQLyVi8LXh2nWBkVGuZz+zCgJ1o1sjaXCtZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047643"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047643"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455819"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/14] ASoC: SOF: Intel: add helper for link DMA cleanups
Date: Thu, 21 Apr 2022 15:32:00 -0500
Message-Id: <20220421203201.1550328-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
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

We do the same operations from different places, add a helper to
enforce consistency and make the programming sequences clearer.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 112 ++++++++++++++--------------------
 1 file changed, 45 insertions(+), 67 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 644f75081edd3..53600c6c29116 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -128,6 +128,40 @@ hda_link_stream_assign(struct hdac_bus *bus,
 	return res;
 }
 
+static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
+				struct hdac_stream *hstream,
+				struct snd_soc_dai *cpu_dai,
+				struct snd_soc_dai *codec_dai,
+				bool trigger_suspend_stop)
+{
+	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	struct hdac_bus *bus = hstream->bus;
+	struct sof_intel_hda_stream *hda_stream;
+	struct hdac_ext_link *link;
+	int stream_tag;
+
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
+	if (trigger_suspend_stop)
+		snd_hdac_ext_link_stream_clear(hext_stream);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		stream_tag = hdac_stream(hext_stream)->stream_tag;
+		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	}
+	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
+	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	hext_stream->link_prepared = 0;
+
+	/* free the host DMA channel reserved by hostless streams */
+	hda_stream = hstream_to_sof_hda_stream(hext_stream);
+	hda_stream->host_reserved = 0;
+
+	return 0;
+}
+
 static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 			       struct hda_pipe_params *params)
 {
@@ -221,13 +255,7 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
-	struct hdac_ext_link *link;
-	struct hdac_bus *bus = hstream->bus;
-	int stream_tag;
-
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
+	int ret;
 
 	dev_dbg(cpu_dai->dev, "%s: cmd=%d\n", __func__, cmd);
 	if (!hext_stream)
@@ -240,15 +268,9 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_hdac_ext_link_stream_clear(hext_stream);
-
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			stream_tag = hdac_stream(hext_stream)->stream_tag;
-			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-		}
-		snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
-		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
-		hext_stream->link_prepared = 0;
+		ret = hda_link_dma_cleanup(substream, hstream, cpu_dai, codec_dai, true);
+		if (ret < 0)
+			return ret;
 
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -267,36 +289,13 @@ static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_stream *hext_stream;
-	struct hdac_ext_link *link;
-	int stream_tag;
 
 	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
-	if (!hext_stream) {
-		dev_dbg(cpu_dai->dev, "%s: hext_stream is not assigned\n", __func__);
-		return -EINVAL;
-	}
-
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		stream_tag = hdac_stream(hext_stream)->stream_tag;
-		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-	}
-
-	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
-	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
-	hext_stream->link_prepared = 0;
-
-	/* free the host DMA channel reserved by hostless streams */
-	hda_stream = hstream_to_sof_hda_stream(hext_stream);
-	hda_stream->host_reserved = 0;
+	if (!hext_stream)
+		return 0;
 
-	return 0;
+	return hda_link_dma_cleanup(substream, hstream, cpu_dai, codec_dai, false);
 }
 
 static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
@@ -457,15 +456,11 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct hdac_ext_stream *hext_stream;
-	struct hdac_ext_link *link;
 	struct hdac_stream *s;
-	const char *name;
-	int stream_tag;
 	int ret;
 
 	/* set internal flag for BE */
 	list_for_each_entry(s, &bus->stream_list, list) {
-		struct sof_intel_hda_stream *hda_stream;
 
 		hext_stream = stream_to_hdac_ext_stream(s);
 
@@ -482,34 +477,17 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
 			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			codec_dai = asoc_rtd_to_codec(rtd, 0);
-			name = codec_dai->component->name;
-			link = snd_hdac_ext_bus_get_link(bus, name);
-			if (!link)
-				return -EINVAL;
 
-			/*
-			 * we don't need to call snd_hdac_ext_link_stream_clear(he_stream)
-			 * since we can only reach this case in the pause_push state, and
-			 * the TRIGGER_PAUSE_PUSH already stops the DMA
-			 */
-			if (hdac_stream(hext_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
-				stream_tag = hdac_stream(hext_stream)->stream_tag;
-				snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-			}
-			snd_soc_dai_set_dma_data(cpu_dai, hext_stream->link_substream, NULL);
-			snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
-			hext_stream->link_prepared = 0;
-
-			/* free the host DMA channel reserved by hostless streams */
-			hda_stream = hstream_to_sof_hda_stream(hext_stream);
-			hda_stream->host_reserved = 0;
+			ret = hda_link_dma_cleanup(hext_stream->link_substream, s,
+						   cpu_dai, codec_dai, false);
+			if (ret < 0)
+				return ret;
 
 			/* for consistency with TRIGGER_SUSPEND we free DAI resources */
 			ret = hda_dai_hw_free_ipc(hdac_stream(hext_stream)->direction, cpu_dai);
 			if (ret < 0)
 				return ret;
 		}
-
 	}
 
 	return 0;
-- 
2.30.2

