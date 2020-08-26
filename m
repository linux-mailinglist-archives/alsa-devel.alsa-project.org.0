Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B750425378E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B43317A7;
	Wed, 26 Aug 2020 20:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B43317A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467853;
	bh=nUoygYOtRjdcapyhKnUw4PYPYAzdeAoOqDrnLNSiLQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rdv/YnJgx6En95voon2f66+ZEcidRalSS1Ap7+D+jHwcUNxOi0PRSg5JSefx/XFCw
	 aIkDddhnv1wMUimPjEOYg+ymxXA0sQigoml5jWl8y5sRXWjCU+yoW3EkxuJGFzYnGv
	 N73raFSwm8TevDEUdy5aAc1dzaPXnXlzg9dyrCS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF10F802E8;
	Wed, 26 Aug 2020 20:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FFECF802DC; Wed, 26 Aug 2020 20:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63E5AF8020C
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E5AF8020C
IronPort-SDR: cO2PljMTZuHTvhe4zEIXu05cMri7JRQe+padwD0s1iL2Pdvg4Xtf9pRKQTUnYRsyu2DUuJ6RHe
 Dqx8MoSdGVJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418621"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418621"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:47 -0700
IronPort-SDR: 3Hq5s+1z1VPWOMHtwuo+Sq62lK6diQVfmdQRfG2wkaI75/JFp/pWuK4dHXU+lMA7l/B7CaoK5T
 jGPapx7RXUJg==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347340"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:47 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: SOF: Intel: hda: Define FW boot sequence with ICCMAX
Date: Wed, 26 Aug 2020 11:45:30 -0700
Message-Id: <20200826184532.1612070-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Define the FW boot sequence for platforms that are recommended
to use ICCMAX. This function uses the existing prepare and cleanup
functions for creating a specially crafted capture stream before
powering up the DSP cores.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 92 ++++++++++++++++++++++++++------
 sound/soc/sof/intel/hda.h        |  1 +
 2 files changed, 78 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 9b4844aa3023..5464f899e16f 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -17,6 +17,7 @@
 
 #include <linux/firmware.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/hda_register.h>
 #include <sound/sof.h>
 #include "../ops.h"
 #include "hda.h"
@@ -33,11 +34,6 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
-	if (direction != SNDRV_PCM_STREAM_PLAYBACK) {
-		dev_err(sdev->dev, "error: code loading DMA is playback only\n");
-		return -EINVAL;
-	}
-
 	dsp_stream = hda_dsp_stream_get(sdev, direction);
 
 	if (!dsp_stream) {
@@ -58,14 +54,21 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 	hstream->format_val = format;
 	hstream->bufsize = size;
 
-	ret = hda_dsp_stream_hw_params(sdev, dsp_stream, dmab, NULL);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: hdac prepare failed: %x\n", ret);
-		goto error;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+		ret = hda_dsp_iccmax_stream_hw_params(sdev, dsp_stream, dmab, NULL);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: iccmax stream prepare failed: %x\n", ret);
+			goto error;
+		}
+	} else {
+		ret = hda_dsp_stream_hw_params(sdev, dsp_stream, dmab, NULL);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: hdac prepare failed: %x\n", ret);
+			goto error;
+		}
+		hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
 	}
 
-	hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
-
 	return hstream->stream_tag;
 
 error:
@@ -224,12 +227,15 @@ static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 {
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
-	int ret;
+	int ret = 0;
 
-	ret = hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+	else
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
+					SOF_HDA_SD_CTL_DMA_START, 0);
 
-	hda_dsp_stream_put(sdev, SNDRV_PCM_STREAM_PLAYBACK,
-			   hstream->stream_tag);
+	hda_dsp_stream_put(sdev, hstream->direction, hstream->stream_tag);
 	hstream->running = 0;
 	hstream->substream = NULL;
 
@@ -287,6 +293,62 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
 	return status;
 }
 
+int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct hdac_ext_stream *iccmax_stream;
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct firmware stripped_firmware;
+	int ret, ret1;
+	int iccmax_tag;
+	u8 original_gb;
+
+	/* save the original LTRP guardband value */
+	original_gb = snd_hdac_chip_readb(bus, VS_LTRP) & HDA_VS_INTEL_LTRP_GB_MASK;
+
+	if (plat_data->fw->size <= plat_data->fw_offset) {
+		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
+		return -EINVAL;
+	}
+
+	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+
+	/* prepare capture stream for ICCMAX */
+	iccmax_tag = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
+				       &sdev->dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
+	if (iccmax_tag < 0) {
+		dev_err(sdev->dev, "error: dma prepare for ICCMAX %x\n", iccmax_tag);
+		return iccmax_tag;
+	}
+
+	/* get stream with tag */
+	iccmax_stream = get_stream_with_tag(sdev, iccmax_tag, SNDRV_PCM_STREAM_CAPTURE);
+	if (!iccmax_stream) {
+		dev_err(sdev->dev, "error: could not get stream with stream tag %d\n", iccmax_tag);
+		ret = -ENODEV;
+	} else {
+		ret = hda_dsp_cl_boot_firmware(sdev);
+	}
+
+	/*
+	 * Perform iccmax stream cleanup. This should be done even if firmware loading fails.
+	 * If the cleanup also fails, we return the initial error
+	 */
+	ret1 = cl_cleanup(sdev, &sdev->dmab_bdl, iccmax_stream);
+	if (ret1 < 0) {
+		dev_err(sdev->dev, "error: ICCMAX stream cleanup failed\n");
+
+		/* set return value to indicate cleanup failure */
+		if (!ret)
+			ret = ret1;
+	}
+
+	/* restore the original guardband value after FW boot */
+	snd_hdac_chip_updateb(bus, VS_LTRP, HDA_VS_INTEL_LTRP_GB_MASK, original_gb);
+
+	return ret;
+}
+
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 100eaaeecb4d..a2e6050f0ef0 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -612,6 +612,7 @@ int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
  * DSP Code loader.
  */
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev);
+int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
 int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev);
 
 /* pre and post fw run ops */
-- 
2.25.1

