Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAF42D97
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F7A17D5;
	Wed, 12 Jun 2019 19:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F7A17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360822;
	bh=ifB/e7Yp0sKD6z2LJLTrWZmTHr2b/Vuoj7pJmzZij14=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUwMDDra+CrxtE+RSDbwC6av2ubUfvKVeWe6Rxs4hOigCALHS7p5/7jBH3mVGr6pV
	 jBfmoS7o2n1FPL0g0wpAsW89x4ipbUJ7ZiRq0G4MtLwTjYpt2xk1xJxdJlcsO3YkSD
	 kfdFp+IBebWcTThveEsLrIiSPYO4CR6IhHOoE2JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5BC9F8976B;
	Wed, 12 Jun 2019 19:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83310F89742; Wed, 12 Jun 2019 19:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C447F89736
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C447F89736
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:24:00 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:46 -0500
Message-Id: <20190612172347.22338-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 14/15] ASoC: SOF: Intel: hda: make sure DMA is
	start/stop by read the RUN bit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

As per the HW recommendation, after setting the RUN bit
(start as 1, stop as 0), software must read the bit back
to make sure the bit is set right, before modifying related
control registers/re-starting the DMA engine.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 22 ++++++++++++++++++++++
 sound/soc/sof/intel/hda.h        |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 23cff5aca007..13d114993f96 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -217,6 +217,9 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 {
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
+	int ret;
+	u32 run;
 
 	/* cmd must be for audio stream */
 	switch (cmd) {
@@ -234,6 +237,16 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 					SOF_HDA_SD_CTL_DMA_START |
 					SOF_HDA_CL_DMA_SD_INT_MASK);
 
+		ret = snd_sof_dsp_read_poll_timeout(sdev,
+					HDA_DSP_HDA_BAR,
+					sd_offset, run,
+					((run &	dma_start) == dma_start),
+					HDA_DSP_REG_POLL_INTERVAL_US,
+					HDA_DSP_STREAM_RUN_TIMEOUT);
+
+		if (ret)
+			return ret;
+
 		hstream->running = true;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -244,6 +257,15 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 					SOF_HDA_SD_CTL_DMA_START |
 					SOF_HDA_CL_DMA_SD_INT_MASK, 0x0);
 
+		ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_HDA_BAR,
+						sd_offset, run,
+						!(run &	dma_start),
+						HDA_DSP_REG_POLL_INTERVAL_US,
+						HDA_DSP_STREAM_RUN_TIMEOUT);
+
+		if (ret)
+			return ret;
+
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset +
 				  SOF_HDA_ADSP_REG_CL_SD_STS,
 				  SOF_HDA_CL_DMA_SD_INT_MASK);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 50653859e0a0..73d7cc08afc2 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -159,6 +159,12 @@
 #define HDA_DSP_MBOX_UPLINK_OFFSET		0x81000
 
 #define HDA_DSP_STREAM_RESET_TIMEOUT		300
+/*
+ * Timeout in us, for setting the stream RUN bit, during
+ * start/stop the stream. The timeout expires if new RUN bit
+ * value cannot be read back within the specified time.
+ */
+#define HDA_DSP_STREAM_RUN_TIMEOUT		300
 #define HDA_DSP_CL_TRIGGER_TIMEOUT		300
 
 #define HDA_DSP_SPIB_ENABLE			1
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
