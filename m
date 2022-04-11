Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8C4FC5BA
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996E01731;
	Mon, 11 Apr 2022 22:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996E01731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708611;
	bh=tNj5+vFUUsmLuKVILgUlnzSovGjCTwnHD7BRNmGgYTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMOIaJ29BJm6M2BeSJAtsas2npAr67zVyuEYx4x5L7ICpmiKyXFUt0VpoMQfC7Xy9
	 cDx5Nl8rbrkTzXp75orGYXhzd8qdfUu4d8YLr6iypQp75299KaSHhVPeP+2mg84MxE
	 yS8JwZM4YYy2Gqbisnnzmfu74Lu3JqIOpR1UwHHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3642CF805BD;
	Mon, 11 Apr 2022 22:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC0DF80564; Mon, 11 Apr 2022 22:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE5B7F8051A
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE5B7F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PZDv36ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708286; x=1681244286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tNj5+vFUUsmLuKVILgUlnzSovGjCTwnHD7BRNmGgYTc=;
 b=PZDv36hos/DBCJRhoWfDYT3WV2k/Vkr3Uh4KxVla85K58dcEATbu4Wob
 i6Nn0TftOLpiywyrzWrdeR1Lcf6AJx53FqO0MRFLr4FY/i3WwmsxedcQ0
 Q1N34g+L77Ng17L3J+4R/YKWbjDVId2+Q2uRJBDOd0+dHhMRdjXvSXhms
 Q1Ge+tLUi6AGokWu7yXeRpRZ7bYB2Dq0xMnJj5TKaT+8QkdTCwjlkcxu3
 omiH1JsPyCiUPboWRgKyCHiRHTMcPzSSstLI6Fe1ncTcdi8N0KMwWLOBk
 TQ0DM+sL6qkAhJ0b/DQqWCFCVV6SMBSgnYrxbnAPk88mAhQbshARKU4Tt w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090848"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090848"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135703"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/16] ASoC: SOF: Intel: hda: expose some codeloader functions
Date: Mon, 11 Apr 2022 15:17:25 -0500
Message-Id: <20220411201727.77971-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Expose the code loader functions for re-use in new platforms

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 27 ++++++++++++++-------------
 sound/soc/sof/intel/hda.h        |  6 ++++++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index f6c50ee526fa..78ceb5a2cbc0 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -41,9 +41,9 @@ static void hda_ssp_set_cbp_cfp(struct snd_sof_dev *sdev)
 	}
 }
 
-static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
-						 unsigned int size, struct snd_dma_buffer *dmab,
-						 int direction)
+struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
+					      unsigned int size, struct snd_dma_buffer *dmab,
+					      int direction)
 {
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
@@ -234,8 +234,8 @@ static int cl_trigger(struct snd_sof_dev *sdev,
 	}
 }
 
-static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
-		      struct hdac_ext_stream *hext_stream)
+int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
+		   struct hdac_ext_stream *hext_stream)
 {
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
@@ -266,7 +266,7 @@ static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 	return ret;
 }
 
-static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
+int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -328,8 +328,8 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
 
 	/* prepare capture stream for ICCMAX */
-	iccmax_stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-					  &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
+	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
+					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
 	if (IS_ERR(iccmax_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
 		return PTR_ERR(iccmax_stream);
@@ -341,7 +341,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * Perform iccmax stream cleanup. This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = cl_cleanup(sdev, &dmab_bdl, iccmax_stream);
+	ret1 = hda_cl_cleanup(sdev, &dmab_bdl, iccmax_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: ICCMAX stream cleanup failed\n");
 
@@ -420,8 +420,9 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	init_waitqueue_head(&sdev->boot_wait);
 
 	/* prepare DMA for code loader stream */
-	hext_stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-					&dmab, SNDRV_PCM_STREAM_PLAYBACK);
+	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
+					    stripped_firmware.size,
+					    &dmab, SNDRV_PCM_STREAM_PLAYBACK);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
 		return PTR_ERR(hext_stream);
@@ -475,7 +476,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * Continue with code loading and firmware boot
 	 */
 	hda->boot_iteration = HDA_FW_BOOT_ATTEMPTS;
-	ret = cl_copy_fw(sdev, hext_stream);
+	ret = hda_cl_copy_fw(sdev, hext_stream);
 	if (!ret)
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
 	else
@@ -488,7 +489,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = cl_cleanup(sdev, &dmab, hext_stream);
+	ret1 = hda_cl_cleanup(sdev, &dmab, hext_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f7a93012b811..36445482a122 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -588,6 +588,12 @@ int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
  */
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev);
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
+int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream);
+struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
+					      unsigned int size, struct snd_dma_buffer *dmab,
+					      int direction);
+int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
+		   struct hdac_ext_stream *hext_stream);
 #define HDA_CL_STREAM_FORMAT 0x40
 
 /* pre and post fw run ops */
-- 
2.30.2

