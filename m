Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A145D833
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 11:24:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DCB187D;
	Thu, 25 Nov 2021 11:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DCB187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637835890;
	bh=EcWpynoSvIdygu2nEiI1ukojA/6rQw8eBN1ntkiJvrU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMyP0QWT+zcSoc7VhJy2HfA1mGKrIJEplSSwyqcyhWngFXxWqA3VYPTgZKcvkEGOb
	 m56emXJMDVhkUml7xL9GH5XFytIjcn8gQR2Iwuy4jcFkalmMSwL1I1F0Pst8ahqNJj
	 opwI/iCE4QpBR6wnFEyLWTTkqIO9TT6imN4Yvyk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04FD8F804BC;
	Thu, 25 Nov 2021 11:23:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BCA8F80302; Thu, 25 Nov 2021 11:23:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D2A8F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 11:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D2A8F8007E
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="259387230"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="259387230"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 02:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="741671748"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2021 02:23:00 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/10] ASoC: SOF: Intel: hda: Add a helper function for stream
 reset
Date: Thu, 25 Nov 2021 12:15:12 +0200
Message-Id: <20211125101520.291581-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
References: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a helper function to perform stream reset.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 76 ++++++++++++++++++--------------
 sound/soc/sof/intel/hda.h        |  2 +
 2 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index b6f037815344..c2895bdd3f07 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -279,6 +279,45 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 	return 0;
 }
 
+static int hda_dsp_stream_reset(struct snd_sof_dev *sdev, struct hdac_stream *hstream)
+{
+	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	int timeout = HDA_DSP_STREAM_RESET_TIMEOUT;
+	u32 val;
+
+	/* enter stream reset */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset, SOF_STREAM_SD_OFFSET_CRST,
+				SOF_STREAM_SD_OFFSET_CRST);
+	do {
+		val = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, sd_offset);
+		if (val & SOF_STREAM_SD_OFFSET_CRST)
+			break;
+	} while (--timeout);
+	if (timeout == 0) {
+		dev_err(sdev->dev, "timeout waiting for stream reset\n");
+		return -ETIMEDOUT;
+	}
+
+	timeout = HDA_DSP_STREAM_RESET_TIMEOUT;
+
+	/* exit stream reset and wait to read a zero before reading any other register */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset, SOF_STREAM_SD_OFFSET_CRST, 0x0);
+
+	/* wait for hardware to report that stream is out of reset */
+	udelay(3);
+	do {
+		val = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, sd_offset);
+		if ((val & SOF_STREAM_SD_OFFSET_CRST) == 0)
+			break;
+	} while (--timeout);
+	if (timeout == 0) {
+		dev_err(sdev->dev, "timeout waiting for stream to exit reset\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 			   struct hdac_ext_stream *stream, int cmd)
 {
@@ -436,9 +475,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
-	int ret, timeout = HDA_DSP_STREAM_RESET_TIMEOUT;
+	int ret;
 	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
-	u32 val, mask;
+	u32 mask;
 	u32 run;
 
 	if (!stream) {
@@ -483,36 +522,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 				SOF_HDA_CL_DMA_SD_INT_MASK);
 
 	/* stream reset */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset, 0x1,
-				0x1);
-	udelay(3);
-	do {
-		val = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-				       sd_offset);
-		if (val & 0x1)
-			break;
-	} while (--timeout);
-	if (timeout == 0) {
-		dev_err(sdev->dev, "error: stream reset failed\n");
-		return -ETIMEDOUT;
-	}
-
-	timeout = HDA_DSP_STREAM_RESET_TIMEOUT;
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset, 0x1,
-				0x0);
-
-	/* wait for hardware to report that stream is out of reset */
-	udelay(3);
-	do {
-		val = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-				       sd_offset);
-		if ((val & 0x1) == 0)
-			break;
-	} while (--timeout);
-	if (timeout == 0) {
-		dev_err(sdev->dev, "error: timeout waiting for stream reset\n");
-		return -ETIMEDOUT;
-	}
+	ret = hda_dsp_stream_reset(sdev, hstream);
+	if (ret < 0)
+		return ret;
 
 	if (hstream->posbuf)
 		*hstream->posbuf = 0;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 8ed4031ca007..60139ea9b8de 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -487,6 +487,8 @@ struct sof_intel_hda_stream {
 	(SOF_HDA_ADSP_SD_ENTRY_SIZE * ((s)->index) \
 	 + SOF_HDA_ADSP_LOADER_BASE)
 
+#define SOF_STREAM_SD_OFFSET_CRST 0x1
+
 /*
  * DSP Core services.
  */
-- 
2.33.0

