Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A3253790
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2B584B;
	Wed, 26 Aug 2020 20:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2B584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467893;
	bh=gGnrOOHegE/SpuorMNwyX2tnITAlvlZ2hDv6jM+8yUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GE1qvvtaqPKmjY3KfJargs59BP4MkVzhuCQjKLq/tCDY9YhwvAPLVvmaFgMTUoZhM
	 zPsys+7+j/oaT/2RQOIeYwGg1fGYRGn90h2UIakyp3dCvpul4H8XmoyR8yIkHkRbnj
	 96oi+1KblYz3uRtdvFgayfTiIGiiz+GTyKiFj8K4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42566F802F9;
	Wed, 26 Aug 2020 20:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E6AF802DF; Wed, 26 Aug 2020 20:46:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D0EF802A0
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D0EF802A0
IronPort-SDR: 85rf8wRahAPK9jFymyTYaASq6eAT448/czbxdrl7zXD3jnbDIqXYGD6dPMk67jrsCHoJX8r5KS
 K/RZfJcipSog==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418626"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418626"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:49 -0700
IronPort-SDR: QZw+evTRgmd7wDd7lJ55jihlvd1PmaMrLNrx1Fdz43MC24Zmv3lN7fX47tKxEHqYfG7tXddFcp
 TaMyifbzSfJw==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347347"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:48 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: SOF: Intel: hda: Simplify error handling during FW
 boot
Date: Wed, 26 Aug 2020 11:45:32 -0700
Message-Id: <20200826184532.1612070-9-ranjani.sridharan@linux.intel.com>
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

Modify cl_stream_prepare() to return a pointer to the prepared stream
if successful or ERR_PTR() otherwise. This would simplify the error
paths in hda_dsp_cl_boot_firmware() and hda_dsp_cl_boot_firmware_iccmax()
to perform the stream cleanup after FW boot. This change also renders
the function get_stream_with_tag() redundant.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 73 +++++++++-----------------------
 1 file changed, 19 insertions(+), 54 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 5464f899e16f..70727495fdbf 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -25,9 +25,9 @@
 #define HDA_FW_BOOT_ATTEMPTS	3
 #define HDA_CL_STREAM_FORMAT 0x40
 
-static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
-			     unsigned int size, struct snd_dma_buffer *dmab,
-			     int direction)
+static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
+						 unsigned int size, struct snd_dma_buffer *dmab,
+						 int direction)
 {
 	struct hdac_ext_stream *dsp_stream;
 	struct hdac_stream *hstream;
@@ -38,7 +38,7 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 
 	if (!dsp_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 	hstream = &dsp_stream->hstream;
 	hstream->substream = NULL;
@@ -69,12 +69,12 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 		hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
 	}
 
-	return hstream->stream_tag;
+	return dsp_stream;
 
 error:
 	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
 	snd_dma_free_pages(dmab);
-	return ret;
+	return ERR_PTR(ret);
 }
 
 /*
@@ -208,20 +208,6 @@ static int cl_trigger(struct snd_sof_dev *sdev,
 	}
 }
 
-static struct hdac_ext_stream *get_stream_with_tag(struct snd_sof_dev *sdev,
-						   int tag, int direction)
-{
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_stream *s;
-
-	/* get stream with tag */
-	list_for_each_entry(s, &bus->stream_list, list)
-		if (s->direction == direction && s->stream_tag == tag)
-			return stream_to_hdac_ext_stream(s);
-
-	return NULL;
-}
-
 static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		      struct hdac_ext_stream *stream)
 {
@@ -300,7 +286,6 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct firmware stripped_firmware;
 	int ret, ret1;
-	int iccmax_tag;
 	u8 original_gb;
 
 	/* save the original LTRP guardband value */
@@ -314,21 +299,14 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
 
 	/* prepare capture stream for ICCMAX */
-	iccmax_tag = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-				       &sdev->dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
-	if (iccmax_tag < 0) {
-		dev_err(sdev->dev, "error: dma prepare for ICCMAX %x\n", iccmax_tag);
-		return iccmax_tag;
+	iccmax_stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
+					  &sdev->dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
+	if (IS_ERR(iccmax_stream)) {
+		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
+		return PTR_ERR(iccmax_stream);
 	}
 
-	/* get stream with tag */
-	iccmax_stream = get_stream_with_tag(sdev, iccmax_tag, SNDRV_PCM_STREAM_CAPTURE);
-	if (!iccmax_stream) {
-		dev_err(sdev->dev, "error: could not get stream with stream tag %d\n", iccmax_tag);
-		ret = -ENODEV;
-	} else {
-		ret = hda_dsp_cl_boot_firmware(sdev);
-	}
+	ret = hda_dsp_cl_boot_firmware(sdev);
 
 	/*
 	 * Perform iccmax stream cleanup. This should be done even if firmware loading fails.
@@ -356,7 +334,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	const struct sof_intel_dsp_desc *chip_info;
 	struct hdac_ext_stream *stream;
 	struct firmware stripped_firmware;
-	int ret, ret1, tag, i;
+	int ret, ret1, i;
 
 	chip_info = desc->chip_info;
 
@@ -372,23 +350,11 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	init_waitqueue_head(&sdev->boot_wait);
 
 	/* prepare DMA for code loader stream */
-	tag = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-				&sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
-
-	if (tag < 0) {
-		dev_err(sdev->dev, "error: dma prepare for fw loading err: %x\n",
-			tag);
-		return tag;
-	}
-
-	/* get stream with tag */
-	stream = get_stream_with_tag(sdev, tag, SNDRV_PCM_STREAM_PLAYBACK);
-	if (!stream) {
-		dev_err(sdev->dev,
-			"error: could not get stream with stream tag %d\n",
-			tag);
-		ret = -ENODEV;
-		goto err;
+	stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
+				   &sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
+	if (IS_ERR(stream)) {
+		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
+		return PTR_ERR(stream);
 	}
 
 	memcpy(sdev->dmab.area, stripped_firmware.data,
@@ -399,7 +365,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev,
 			"Attempting iteration %d of Core En/ROM load...\n", i);
 
-		ret = cl_dsp_init(sdev, tag, i + 1);
+		ret = cl_dsp_init(sdev, stream->hstream.stream_tag, i + 1);
 
 		/* don't retry anymore if successful */
 		if (!ret)
@@ -468,7 +434,6 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		return chip_info->init_core_mask;
 
 	/* dump dsp registers and disable DSP upon error */
-err:
 	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
 
 	/* disable DSP */
-- 
2.25.1

