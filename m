Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8E50A9FF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:34:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E551170A;
	Thu, 21 Apr 2022 22:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E551170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573242;
	bh=9srFh93GSqntEgY/Fwwx8N5/mstCxIJxEeT+my3sdwo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BplIVLsSzp7tt61krcDYS0udF0nVQ6fMnrqy1VX8s55XawjwSpt4RIPwk5UssQILX
	 e1rba+XM0mI/t9+MGqDN2X7r6Piyzy3GTtl1Qi9ebpF7twUXxHntZLucD5ydhhTQ91
	 x4/V5FdP2JYETlJTtGyjL9sQhMhoaKkd1+kBhsAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 583A9F8052D;
	Thu, 21 Apr 2022 22:32:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B5FF804DA; Thu, 21 Apr 2022 22:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3BA7F804FD
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3BA7F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HEMjmNbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573162; x=1682109162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9srFh93GSqntEgY/Fwwx8N5/mstCxIJxEeT+my3sdwo=;
 b=HEMjmNbTbPRHet09fX3hxPslz1PBKZrNXr3scQS8rxOSyxpxySglI9G7
 PwGEXT/+n8nfVzOJ1uxp3iRmSB0z0qgV6oa4UDqRIVgOqYbbsNfnPqZjF
 mtbzQ1Ad8DBDm08OoLhrYB8mORiL/0olNBnCVI8M8LRnM3bCg75aULAcl
 gDouOuRRDsi6c8t51DMqyVc7dnXAHWVlhSf4lPCmasa7O5BePVhxTq/cN
 rHFPc18FafZkc2GLlhIpHGffCoAiiwp1O3FsA9sf1jKrwx84SQQF9WnNd
 F8u4Xr/gOUKvThScyCkW1rbbG3V3PuDoAKeEM5uNgKzXvjqwAIumKkRSY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047608"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455764"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/14] ASoC: SOF: Intel: hda-dai: simplify
 hda_dai_widget_update() prototype
Date: Thu, 21 Apr 2022 15:31:51 -0500
Message-Id: <20220421203201.1550328-5-pierre-louis.bossart@linux.intel.com>
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

the argument "struct sof_intel_hda_stream *hda_stream" is not used, remove.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 65f3ff5196244..3113f61ae7370 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -162,8 +162,7 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	return 0;
 }
 
-static int hda_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
-				 struct snd_soc_dapm_widget *w,
+static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
 				 int channel, bool widget_setup)
 {
 	struct snd_sof_dai_config_data data;
@@ -186,7 +185,6 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct sof_intel_hda_stream *hda_stream;
 	struct hda_pipe_params p_params = {0};
 	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
@@ -205,15 +203,13 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 
 	stream_tag = hdac_stream(hext_stream)->stream_tag;
 
-	hda_stream = hstream_to_sof_hda_stream(hext_stream);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		w = dai->playback_widget;
 	else
 		w = dai->capture_widget;
 
 	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
-	ret = hda_dai_widget_update(hda_stream, w, stream_tag - 1, true);
+	ret = hda_dai_widget_update(w, stream_tag - 1, true);
 	if (ret < 0)
 		return ret;
 
@@ -281,7 +277,6 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 {
 	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
-	struct sof_intel_hda_stream *hda_stream;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
@@ -298,8 +293,6 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	if (!link)
 		return -EINVAL;
 
-	hda_stream = hstream_to_sof_hda_stream(hext_stream);
-
 	dev_dbg(dai->dev, "In %s cmd=%d\n", __func__, cmd);
 
 	w = snd_soc_dai_get_widget(dai, substream->stream);
@@ -316,7 +309,7 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 		/*
 		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
 		 */
-		ret = hda_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
+		ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
 		if (ret < 0)
 			return ret;
 
@@ -372,7 +365,7 @@ static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 		w = dai->capture_widget;
 
 	/* free the link DMA channel in the FW and the DAI widget */
-	ret = hda_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
+	ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

