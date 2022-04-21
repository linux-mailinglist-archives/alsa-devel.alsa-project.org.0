Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74F50AA01
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3BF516F7;
	Thu, 21 Apr 2022 22:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3BF516F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573278;
	bh=GLTPr05F2GcrTjcfvNulWSeUmVot9Uapz6LIadce8FI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+hMGJnEd0PhSjkGOellaBQuR4ZZqW/ce2HpwL3WleV/QbvpXXhaOSR8M8zOj05Fm
	 O44A2bO4y3shkKSR9Pt0/o4/K5slb82+Kbtvi5Gu4fYw5+HjKB5SUwbamtbwPxYoLI
	 18YMckcYlyLceXRMHSx5pqj7HrtiFgD2X+Q/XgnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED94F80535;
	Thu, 21 Apr 2022 22:32:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77A29F80507; Thu, 21 Apr 2022 22:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 699D7F804FE
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 699D7F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SU/YcA0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573162; x=1682109162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GLTPr05F2GcrTjcfvNulWSeUmVot9Uapz6LIadce8FI=;
 b=SU/YcA0ymA3M9zkc5DaQimoxgBCrhBMgMYN5qw1nLeZxldyQQIytyi+5
 8G36b7Ares0oPsa1axdR/aQ1J1Tbivdjik8Ka+NGS3TUkcc3Pof6Tvrze
 +K+6rMkIRaV09x2iJL8ldKviVdeBhhKVIgq8QSG9MwQmd6MQMIICURuEM
 h7l6bnTc2r5sMw5RGriimo9eo2sSK/syYr7XIRUZ+cOKjecofCaNLYZbQ
 WPpyO15KIse19nE1ORyJiNq74MjsAZ9rVgPsxfqEMCsYSAEpB626mDGyb
 uhdGdufcABd5SMBu6xmZ5swz8CMJjTIVGq4zTi+donMoQGHzy7GHwNLPt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047606"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047606"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455760"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/14] ASOC: SOF: Intel: hda-dai: consistent naming for HDA
 DAI and HDA link DMA
Date: Thu, 21 Apr 2022 15:31:50 -0500
Message-Id: <20220421203201.1550328-4-pierre-louis.bossart@linux.intel.com>
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

The Intel documentation refers to the concepts of 'HDAudio host
DMA' (system memory <--> DSP) and 'HDaudio link DMA' (DSP <-->
peripherals). We currently use the prefix 'hda_link' to describe DAI
operations, which can be confused for dailink operations.

Since the topology tokens refer unambiguously to the 'HDA' dai, let's
drop the link prefix for dai-related ops/callbacks. Conversely let's
use 'hda_link_dma' for routines related to the DMA management. In a
follow-up patch we will introduce the 'hda_dai_link' prefix for dailink
ops/callbacks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 8891077d8d8c3..65f3ff5196244 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -50,8 +50,8 @@ static bool hda_check_fes(struct snd_soc_pcm_runtime *rtd,
 }
 
 static struct hdac_ext_stream *
-	hda_link_stream_assign(struct hdac_bus *bus,
-			       struct snd_pcm_substream *substream)
+hda_link_stream_assign(struct hdac_bus *bus,
+		       struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sof_intel_hda_stream *hda_stream;
@@ -162,9 +162,9 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	return 0;
 }
 
-static int hda_link_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
-				      struct snd_soc_dapm_widget *w,
-				      int channel, bool widget_setup)
+static int hda_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
+				 struct snd_soc_dapm_widget *w,
+				 int channel, bool widget_setup)
 {
 	struct snd_sof_dai_config_data data;
 
@@ -177,9 +177,9 @@ static int hda_link_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
 	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
 }
 
-static int hda_link_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params,
-			      struct snd_soc_dai *dai)
+static int hda_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct hdac_bus *bus = hstream->bus;
@@ -213,7 +213,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 		w = dai->capture_widget;
 
 	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
-	ret = hda_link_dai_widget_update(hda_stream, w, stream_tag - 1, true);
+	ret = hda_dai_widget_update(hda_stream, w, stream_tag - 1, true);
 	if (ret < 0)
 		return ret;
 
@@ -239,8 +239,8 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	return hda_link_dma_params(hext_stream, &p_params);
 }
 
-static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
+static int hda_dai_prepare(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
@@ -254,11 +254,11 @@ static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
 
 	dev_dbg(sdev->dev, "hda: prepare stream dir %d\n", substream->stream);
 
-	return hda_link_hw_params(substream, &rtd->dpcm[stream].hw_params,
+	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params,
 				  dai);
 }
 
-static int hda_link_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
+static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
 	struct snd_soc_component *component = swidget->scomp;
@@ -276,8 +276,8 @@ static int hda_link_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 	return ret;
 }
 
-static int ipc3_hda_link_pcm_trigger(struct snd_pcm_substream *substream,
-				     int cmd, struct snd_soc_dai *dai)
+static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
+				int cmd, struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
@@ -316,7 +316,7 @@ static int ipc3_hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 		/*
 		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
 		 */
-		ret = hda_link_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
+		ret = hda_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
 		if (ret < 0)
 			return ret;
 
@@ -330,7 +330,7 @@ static int ipc3_hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_hdac_ext_link_stream_clear(hext_stream);
 
-		ret = hda_link_dai_config_pause_push_ipc(w);
+		ret = hda_dai_config_pause_push_ipc(w);
 		if (ret < 0)
 			return ret;
 		break;
@@ -340,8 +340,8 @@ static int ipc3_hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int hda_link_hw_free(struct snd_pcm_substream *substream,
-			    struct snd_soc_dai *dai)
+static int hda_dai_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
 {
 	unsigned int stream_tag;
 	struct sof_intel_hda_stream *hda_stream;
@@ -372,7 +372,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 		w = dai->capture_widget;
 
 	/* free the link DMA channel in the FW and the DAI widget */
-	ret = hda_link_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
+	ret = hda_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
 	if (ret < 0)
 		return ret;
 
@@ -395,11 +395,11 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops ipc3_hda_link_dai_ops = {
-	.hw_params = hda_link_hw_params,
-	.hw_free = hda_link_hw_free,
-	.trigger = ipc3_hda_link_pcm_trigger,
-	.prepare = hda_link_pcm_prepare,
+static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
+	.hw_params = hda_dai_hw_params,
+	.hw_free = hda_dai_hw_free,
+	.trigger = ipc3_hda_dai_trigger,
+	.prepare = hda_dai_prepare,
 };
 
 #endif
@@ -531,7 +531,7 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 			if (strstr(ops->drv[i].name, "iDisp") ||
 			    strstr(ops->drv[i].name, "Analog") ||
 			    strstr(ops->drv[i].name, "Digital"))
-				ops->drv[i].ops = &ipc3_hda_link_dai_ops;
+				ops->drv[i].ops = &ipc3_hda_dai_ops;
 #endif
 		}
 		break;
-- 
2.30.2

