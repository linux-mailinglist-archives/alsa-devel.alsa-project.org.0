Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DEF42D9D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E816C180E;
	Wed, 12 Jun 2019 19:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E816C180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360935;
	bh=tgkfBGhDmPlsGUC5K+8wE2QEHWUX4F1nIoiLjMH4E2s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqaheqpWYyLVNZMy9HQ19+wftXGMiYNFKmBje1mLt4mYhzRc1iGpYoCia+aa6ANz1
	 uKVVo7UjI2RTLyvD/bup4ID2nCaGsETBAS+h2KttXDjxR/BkGQeJm6m1To3jEdt0S1
	 NyUW64RrGKlShJFlYIS5UgJMlk+I79/FC0vkIkGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC3EF8977A;
	Wed, 12 Jun 2019 19:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DD6F89736; Wed, 12 Jun 2019 19:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C5A0F89737
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5A0F89737
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:24:00 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:24:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:47 -0500
Message-Id: <20190612172347.22338-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 15/15] ASoC: SOF: Intel: hda: make sure RUN bit
	setting to 0 during clear stream status
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

Before clearing stream statuses, ensure RUN bit update has taken
effect by reading the value back.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 13d114993f96..ad8d41f22e92 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -295,7 +295,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret, timeout = HDA_DSP_STREAM_RESET_TIMEOUT;
+	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
 	u32 val, mask;
+	u32 run;
 
 	if (!stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
@@ -316,6 +318,16 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 				SOF_HDA_CL_DMA_SD_INT_MASK |
 				SOF_HDA_SD_CTL_DMA_START, 0);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_HDA_BAR,
+					    sd_offset, run,
+					    !(run & dma_start),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_STREAM_RUN_TIMEOUT);
+
+	if (ret)
+		return ret;
+
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
@@ -368,6 +380,16 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 				SOF_HDA_CL_DMA_SD_INT_MASK |
 				SOF_HDA_SD_CTL_DMA_START, 0);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_HDA_BAR,
+					    sd_offset, run,
+					    !(run & dma_start),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_STREAM_RUN_TIMEOUT);
+
+	if (ret)
+		return ret;
+
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
