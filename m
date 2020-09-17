Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6871726D93B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 12:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38431665;
	Thu, 17 Sep 2020 12:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38431665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600339177;
	bh=3TJcmMh4WnaGqOrn/1/w4tv1IKh58GKpZUctp7Rj9r4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RLXkgIFZawzhCRYv136xfCq6P8bw3rRToDfM94gALMmiH+ZKZSrwZVgIJA323emdW
	 sbsfqvzoaBiex88Fc+NkkkWZQGq4kAeBsOaLCC/dUAQI26yClk+q3E4nQzLYnYhIxt
	 Ae8LZxyCx49xWJ+7tVBNZo7c0SEH9PK3Rt2Xr82U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E94F80212;
	Thu, 17 Sep 2020 12:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04851F80212; Thu, 17 Sep 2020 12:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 448DCF8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 448DCF8013A
IronPort-SDR: MegbVTGpyezqrpyeRmjWAsIgVFP22iPCs4i4ivro0iGqB23zrbsBq12W2pRg4yPJsfOcO7iIar
 qq1rxaWjZ1WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139673524"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="139673524"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:37:39 -0700
IronPort-SDR: e1y/IwiClDvpcUYEtlaAWs35L0xErxM3ekkFxqrQo67nmhvgZPVJWp2CFpdcWizRGZ8917Uvx0
 ayv6ClGoqhDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="483694815"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 17 Sep 2020 03:37:37 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: Add support for tgl-h
Date: Thu, 17 Sep 2020 13:36:09 +0300
Message-Id: <20200917103609.2559916-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, Rander Wang <rander.wang@intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

SOF will support tgl-h and tgl-lp in different FW binaries due to
hardware difference, so create another dev_desc entry with FW name
of sof-tgl-h.ri and dsp_desc named tglh_chip_info for tgl-h.

Fixes: c8d2e2bfaeffa ("ASoC: SOF: Intel: add PCI IDs for ICL-H and TGL-H")
Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.h   |  1 +
 sound/soc/sof/intel/tgl.c   | 16 ++++++++++++++++
 sound/soc/sof/sof-pci-dev.c | 18 +++++++++++++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f0f8f95c082b..659868da4068 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -737,6 +737,7 @@ extern const struct sof_intel_dsp_desc cnl_chip_info;
 extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
 extern const struct sof_intel_dsp_desc tgl_chip_info;
+extern const struct sof_intel_dsp_desc tglh_chip_info;
 extern const struct sof_intel_dsp_desc ehl_chip_info;
 extern const struct sof_intel_dsp_desc jsl_chip_info;
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index f8d04fd66ceb..0278b67de1ec 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -135,3 +135,19 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+const struct sof_intel_dsp_desc tglh_chip_info = {
+	/* Tigerlake-H */
+	.cores_num = 2,
+	.init_core_mask = 1,
+	.host_managed_cores_mask = BIT(0),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 3ec380945466..8c53f6935417 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -223,6 +223,22 @@ static const struct sof_dev_desc tgl_desc = {
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
+
+static const struct sof_dev_desc tglh_desc = {
+	.machines               = snd_soc_acpi_intel_tgl_machines,
+	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &tglh_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-tgl-h.ri",
+	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
+	.ops = &sof_tgl_ops,
+};
 #endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
@@ -457,7 +473,7 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
 		.driver_data = (unsigned long)&tgl_desc},
 	{ PCI_DEVICE(0x8086, 0x43c8), /* TGL-H */
-		.driver_data = (unsigned long)&tgl_desc},
+		.driver_data = (unsigned long)&tglh_desc},
 
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
-- 
2.27.0

