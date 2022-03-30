Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820524ECDC9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE381A47;
	Wed, 30 Mar 2022 22:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE381A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671688;
	bh=aAUqSmW6XkCA6aP1LCihLXXsOlY+IckZB/cQyjzqU08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDd2SLRlmgTH/sijeVwcGKF8AQASk2YxBA1VufvfCQWH4FrdWsql6C2XNQVuuwRlK
	 Uy/CZcPUMhRKfKEma7gDOV5ZrjH15kNiyEbR9Ybw8a+0RW1Z1ncumm+jobdGMpeKVR
	 sr8KNBrzrrbwKTrQ3XnjNa9wbFxq8PXtLjNVQBWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 803EDF80506;
	Wed, 30 Mar 2022 22:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA54F8051A; Wed, 30 Mar 2022 22:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91F11F80253
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F11F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nE+Q5wjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671581; x=1680207581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aAUqSmW6XkCA6aP1LCihLXXsOlY+IckZB/cQyjzqU08=;
 b=nE+Q5wjS0lrDAeN52dsNAQq1nDhhufZRpTEqYDLcD0N1adnp/1npULT+
 9n0vB0TYHLFYl/W212YrkVx9zcOsOLD2LjvU0l5leqEObOkzutHwl9fr5
 ICHLo9qC1fPc2qsMcxUm46XFPJIW4t8uDJp/VdY/Cj5jplLMCXB+JOEaM
 Gdp2j7DXE/gIG4zGr+KPVv0ZSPr7a0ZQd0azmjQcnpGTIZfZRmNFXnDCT
 f1k8DU71o8jya8gdrcb6nF8JTWNQzvUkd0iSPcQxqtHAlbY59PM4veK5Z
 oXQpoGHT3rAxeJj2zFNECKbSFZZBH2nzY/NPHLDQvYTQEHiTbaiIGAb7/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819823"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045016"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:35 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/11] ASoC: SOF: Intel: hda-loader: Use local snd_dma_buffer
Date: Wed, 30 Mar 2022 13:19:16 -0700
Message-Id: <20220330201926.1330402-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

There is no reason to use the sdev->dmab and sdev->dmab_bdl as the buffers
are only used locally: allocated used and freed in the same function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 2ac5d9d0719b..697d18a41a6e 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -313,6 +313,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	struct hdac_ext_stream *iccmax_stream;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct firmware stripped_firmware;
+	struct snd_dma_buffer dmab_bdl;
 	int ret, ret1;
 	u8 original_gb;
 
@@ -328,7 +329,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 
 	/* prepare capture stream for ICCMAX */
 	iccmax_stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-					  &sdev->dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
+					  &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
 	if (IS_ERR(iccmax_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
 		return PTR_ERR(iccmax_stream);
@@ -340,7 +341,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * Perform iccmax stream cleanup. This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = cl_cleanup(sdev, &sdev->dmab_bdl, iccmax_stream);
+	ret1 = cl_cleanup(sdev, &dmab_bdl, iccmax_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: ICCMAX stream cleanup failed\n");
 
@@ -395,6 +396,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	const struct sof_intel_dsp_desc *chip_info;
 	struct hdac_ext_stream *hext_stream;
 	struct firmware stripped_firmware;
+	struct snd_dma_buffer dmab;
 	int ret, ret1, i;
 
 	if ((sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT) &&
@@ -419,13 +421,13 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	/* prepare DMA for code loader stream */
 	hext_stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-					&sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
+					&dmab, SNDRV_PCM_STREAM_PLAYBACK);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
 		return PTR_ERR(hext_stream);
 	}
 
-	memcpy(sdev->dmab.area, stripped_firmware.data,
+	memcpy(dmab.area, stripped_firmware.data,
 	       stripped_firmware.size);
 
 	/* try ROM init a few times before giving up */
@@ -486,7 +488,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = cl_cleanup(sdev, &sdev->dmab, hext_stream);
+	ret1 = cl_cleanup(sdev, &dmab, hext_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
-- 
2.25.1

