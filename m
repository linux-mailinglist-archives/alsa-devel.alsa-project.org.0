Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311F898E67
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 20:55:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51182CF5;
	Thu,  4 Apr 2024 20:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51182CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712256953;
	bh=7Vqpp8s8GADSIu4ctRnp2HLxEpXCDfxMtr3oyM65+Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SZrjJsuDXlvbqG3peNyiFDQjCAHcswnTHtWaPLJPdFs61H57mtRYXxQG/+c1+OLE9
	 0LoELkI9Oc8zaLukL41to1Fd1UWOYvIRYVz+CMSNfbdib67pKWtaYKR5wzUjpKorAt
	 7I80q3qV6k1NM8/gqHdqCeXy9Isupvp2uFaPqlr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54C33F805BB; Thu,  4 Apr 2024 20:55:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86723F805C5;
	Thu,  4 Apr 2024 20:55:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46C50F805B3; Thu,  4 Apr 2024 20:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 014E7F8016E
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 20:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 014E7F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EonWesa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256903; x=1743792903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Vqpp8s8GADSIu4ctRnp2HLxEpXCDfxMtr3oyM65+Ew=;
  b=EonWesa8mG5QUap7JwUf3JbI2DVwH9COvZhIc5TlXJdPKaFv9RIM2rkg
   vknX09kEwxLz4UTVgsNYbSJlN4ckyrM3ChOASQE+3SbAroE7hffQZVfPg
   LinWdykpKQMseAZakFrLYKeVRa0fj3ryuYbCzyTMV8yfMYY5XSDiiQviu
   ZXwVswyQJ0w74l+tK+BDVYRic/QDO6bYy6Zg7aycWYHcbs89Etv9MUUEf
   f/m6ZgE0NZIIXOUZwD1QSNz6BF2YsC1+TfgFq9nu0Czhn7xw+wvR5MVF0
   GDq4PXdf0oGnl4cZpxirD89MBSA1IzfVqp6uccKPaySwVhG5GieIs/3fw
   A==;
X-CSE-ConnectionGUID: ajJoHQcZRp2QWYGnQaCuzQ==
X-CSE-MsgGUID: torOyVzfRWGQRXa/uASF0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432801"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7432801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:54:59 -0700
X-CSE-ConnectionGUID: hIGp+16oRMSN+lFmvC04lA==
X-CSE-MsgGUID: Os4jl9RSSO6zchGDjqKePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="23574626"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:54:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: Intel: hda-loader: change signature of code
 loader helpers
Date: Thu,  4 Apr 2024 13:54:46 -0500
Message-Id: <20240404185448.136157-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HGWXTAKK2DNSCAXM443RBSTUXWYE5M4X
X-Message-ID-Hash: HGWXTAKK2DNSCAXM443RBSTUXWYE5M4X
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGWXTAKK2DNSCAXM443RBSTUXWYE5M4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We need to reuse cl_prepare, cl_trigger and cl_cleanup helpers from a
SoundWire context where only the device information is
available. Rather than pass the 'sdev' argument, use get_drvdata() to
retrieve the required structure.

For consistency, rename hda_cl_stream_prepare() as hda_cl_prepare().

These three helpers are also exported so that they can be referenced
from another module.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 50 +++++++++++++++++---------------
 sound/soc/sof/intel/hda.h        | 11 ++++---
 2 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index dafb6b3ebb20..5716772a7a91 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -44,13 +44,13 @@ static void hda_ssp_set_cbp_cfp(struct snd_sof_dev *sdev)
 	}
 }
 
-struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
-					      unsigned int size, struct snd_dma_buffer *dmab,
-					      int direction, bool is_iccmax)
+struct hdac_ext_stream *hda_cl_prepare(struct device *dev, unsigned int format,
+				       unsigned int size, struct snd_dma_buffer *dmab,
+				       int direction, bool is_iccmax)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
-	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
 	hext_stream = hda_dsp_stream_get(sdev, direction, 0);
@@ -63,7 +63,7 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
 	hstream->substream = NULL;
 
 	/* allocate DMA buffer */
-	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, &pci->dev, size, dmab);
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, dev, size, dmab);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: memory alloc failed: %d\n", ret);
 		goto out_put;
@@ -96,6 +96,7 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
 	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_NS(hda_cl_prepare, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 /*
  * first boot sequence has some extra steps.
@@ -220,9 +221,9 @@ int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	return ret;
 }
 
-static int cl_trigger(struct snd_sof_dev *sdev,
-		      struct hdac_ext_stream *hext_stream, int cmd)
+int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int cmd)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 
@@ -246,10 +247,12 @@ static int cl_trigger(struct snd_sof_dev *sdev,
 		return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 	}
 }
+EXPORT_SYMBOL_NS(hda_cl_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
+int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 		   struct hdac_ext_stream *hext_stream)
 {
+	struct snd_sof_dev *sdev =  dev_get_drvdata(dev);
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret = 0;
@@ -278,6 +281,7 @@ int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(hda_cl_cleanup, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
 {
@@ -286,7 +290,7 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 	unsigned int reg;
 	int ret, status;
 
-	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_START);
+	ret = hda_cl_trigger(sdev->dev, hext_stream, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger start failed\n");
 		return ret;
@@ -309,7 +313,7 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 			__func__, chip->rom_status_reg);
 	}
 
-	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
+	ret = hda_cl_trigger(sdev->dev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
 		if (!status)
@@ -334,8 +338,8 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * Prepare capture stream for ICCMAX. We do not need to store
 	 * the data, so use a buffer of PAGE_SIZE for receiving.
 	 */
-	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, PAGE_SIZE,
-					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE, true);
+	iccmax_stream = hda_cl_prepare(sdev->dev, HDA_CL_STREAM_FORMAT, PAGE_SIZE,
+				       &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE, true);
 	if (IS_ERR(iccmax_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
 		return PTR_ERR(iccmax_stream);
@@ -347,7 +351,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * Perform iccmax stream cleanup. This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = hda_cl_cleanup(sdev, &dmab_bdl, iccmax_stream);
+	ret1 = hda_cl_cleanup(sdev->dev, &dmab_bdl, iccmax_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: ICCMAX stream cleanup failed\n");
 
@@ -419,9 +423,9 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	init_waitqueue_head(&sdev->boot_wait);
 
 	/* prepare DMA for code loader stream */
-	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
-					    stripped_firmware.size,
-					    &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
+	hext_stream = hda_cl_prepare(sdev->dev, HDA_CL_STREAM_FORMAT,
+				     stripped_firmware.size,
+				     &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
 		return PTR_ERR(hext_stream);
@@ -494,7 +498,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = hda_cl_cleanup(sdev, &dmab, hext_stream);
+	ret1 = hda_cl_cleanup(sdev->dev, &dmab, hext_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
@@ -536,9 +540,9 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	stripped_firmware.size = fw_lib->sof_fw.fw->size - fw_lib->sof_fw.payload_offset;
 
 	/* prepare DMA for code loader stream */
-	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
-					    stripped_firmware.size,
-					    &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
+	hext_stream = hda_cl_prepare(sdev->dev, HDA_CL_STREAM_FORMAT,
+				     stripped_firmware.size,
+				     &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "%s: DMA prepare failed\n", __func__);
 		return PTR_ERR(hext_stream);
@@ -581,7 +585,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 		goto cleanup;
 	}
 
-	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_START);
+	ret = hda_cl_trigger(sdev->dev, hext_stream, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev, "%s: DMA trigger start failed\n", __func__);
 		goto cleanup;
@@ -598,7 +602,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 
 	/* Stop the DMA channel */
-	ret1 = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
+	ret1 = hda_cl_trigger(sdev->dev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "%s: DMA trigger stop failed\n", __func__);
 		if (!ret)
@@ -607,7 +611,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 
 cleanup:
 	/* clean up even in case of error and return the first error */
-	ret1 = hda_cl_cleanup(sdev, &dmab, hext_stream);
+	ret1 = hda_cl_cleanup(sdev->dev, &dmab, hext_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "%s: Code loader DSP cleanup failed\n", __func__);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 30a185d4c7ab..b4b037758fcb 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -703,10 +703,13 @@ void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level);
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev);
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
 int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream);
-struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
-					      unsigned int size, struct snd_dma_buffer *dmab,
-					      int direction, bool is_iccmax);
-int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
+
+struct hdac_ext_stream *hda_cl_prepare(struct device *dev, unsigned int format,
+				       unsigned int size, struct snd_dma_buffer *dmab,
+				       int direction, bool is_iccmax);
+int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int cmd);
+
+int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 		   struct hdac_ext_stream *hext_stream);
 int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 #define HDA_CL_STREAM_FORMAT 0x40
-- 
2.40.1

