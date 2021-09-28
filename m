Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804B41AA80
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DED51686;
	Tue, 28 Sep 2021 10:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DED51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632817169;
	bh=UH9DS11nMspK2pPcWBbgv/JlfYy2IUog0kmLefZXfvw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pHRuymY6KQPiwu1w4+deoDq2IScvDaAinrYs/3ugdWxEytiBetnAlqeekJoIlo0O7
	 IwfLR2/hFaDnmSwb3/uHN5ur/+a4kry8CB+cVH5kRxVu/7WYVBK0iX9233PcyvKXRJ
	 EwB9vxgwSbkaGrHsT4BEXvIcIrhqsl9w1c+okwZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C4AF804BC;
	Tue, 28 Sep 2021 10:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75615F8032C; Tue, 28 Sep 2021 10:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65313F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 10:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65313F800DE
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="222753909"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="222753909"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:17:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="553894699"
Received: from elisabal-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.25])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:17:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: Print stream name on
 STREAM_SD_OFFSET timeout
Date: Tue, 28 Sep 2021 11:17:44 +0300
Message-Id: <20210928081744.4785-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

In order to provide more information in case of timeout observed while
reading STREAM_SD_OFFSET, print out the stream name or in case there is
no audio stream associated (like dma-trace), print "--"

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 85 ++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 63c367478f1c..db028b83c5f2 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -25,6 +25,33 @@
 
 #define HDA_LTRP_GB_VALUE_US	95
 
+static inline const char *hda_hstream_direction_str(struct hdac_stream *hstream)
+{
+	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return "Playback";
+	else
+		return "Capture";
+}
+
+static char *hda_hstream_dbg_get_stream_info_str(struct hdac_stream *hstream)
+{
+	struct snd_soc_pcm_runtime *rtd;
+
+	if (hstream->substream)
+		rtd = asoc_substream_to_rtd(hstream->substream);
+	else if (hstream->cstream)
+		rtd = hstream->cstream->private_data;
+	else
+		/* Non audio DMA user, like dma-trace */
+		return kasprintf(GFP_KERNEL, "-- (%s, stream_tag: %u)",
+				 hda_hstream_direction_str(hstream),
+				 hstream->stream_tag);
+
+	return kasprintf(GFP_KERNEL, "dai_link \"%s\" (%s, stream_tag: %u)",
+			 rtd->dai_link->name, hda_hstream_direction_str(hstream),
+			 hstream->stream_tag);
+}
+
 /*
  * set up one of BDL entries for a stream
  */
@@ -257,7 +284,7 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
-	int ret;
+	int ret = 0;
 	u32 run;
 
 	/* cmd must be for audio stream */
@@ -283,14 +310,9 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					HDA_DSP_STREAM_RUN_TIMEOUT);
 
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: %s: cmd %d: timeout on STREAM_SD_OFFSET read\n",
-				__func__, cmd);
-			return ret;
-		}
+		if (ret >= 0)
+			hstream->running = true;
 
-		hstream->running = true;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -306,27 +328,32 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 						HDA_DSP_REG_POLL_INTERVAL_US,
 						HDA_DSP_STREAM_RUN_TIMEOUT);
 
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: %s: cmd %d: timeout on STREAM_SD_OFFSET read\n",
-				__func__, cmd);
-			return ret;
-		}
+		if (ret >= 0) {
+			snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+					  sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+					  SOF_HDA_CL_DMA_SD_INT_MASK);
 
-		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset +
-				  SOF_HDA_ADSP_REG_CL_SD_STS,
-				  SOF_HDA_CL_DMA_SD_INT_MASK);
-
-		hstream->running = false;
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
-					1 << hstream->index, 0x0);
+			hstream->running = false;
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						SOF_HDA_INTCTL,
+						1 << hstream->index, 0x0);
+		}
 		break;
 	default:
 		dev_err(sdev->dev, "error: unknown command: %d\n", cmd);
 		return -EINVAL;
 	}
 
-	return 0;
+	if (ret < 0) {
+		char *stream_name = hda_hstream_dbg_get_stream_info_str(hstream);
+
+		dev_err(sdev->dev,
+			"%s: cmd %d on %s: timeout on STREAM_SD_OFFSET read\n",
+			__func__, cmd, stream_name ? stream_name : "unknown stream");
+		kfree(stream_name);
+	}
+
+	return ret;
 }
 
 /* minimal recommended programming for ICCMAX stream */
@@ -440,9 +467,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 					    HDA_DSP_STREAM_RUN_TIMEOUT);
 
 	if (ret < 0) {
+		char *stream_name = hda_hstream_dbg_get_stream_info_str(hstream);
+
 		dev_err(sdev->dev,
-			"error: %s: timeout on STREAM_SD_OFFSET read1\n",
-			__func__);
+			"%s: on %s: timeout on STREAM_SD_OFFSET read1\n",
+			__func__, stream_name ? stream_name : "unknown stream");
+		kfree(stream_name);
 		return ret;
 	}
 
@@ -506,9 +536,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 					    HDA_DSP_STREAM_RUN_TIMEOUT);
 
 	if (ret < 0) {
+		char *stream_name = hda_hstream_dbg_get_stream_info_str(hstream);
+
 		dev_err(sdev->dev,
-			"error: %s: timeout on STREAM_SD_OFFSET read2\n",
-			__func__);
+			"%s: on %s: timeout on STREAM_SD_OFFSET read1\n",
+			__func__, stream_name ? stream_name : "unknown stream");
+		kfree(stream_name);
 		return ret;
 	}
 
-- 
2.33.0

