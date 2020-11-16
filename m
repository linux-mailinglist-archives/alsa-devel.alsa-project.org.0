Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBA82B45D5
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 15:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1FA31688;
	Mon, 16 Nov 2020 15:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1FA31688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605537056;
	bh=qK4169f7zsNtPv6gdYfrcVFs7k/2xxsw+/1gEP1uFd8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BDQs0ApOEiITHx9wJ+mEaee6yuZxSUd968FgaNaIJ/eGTlv+uBJwDZ84eWWPym++u
	 LI7hqadH/gMG/J+pnuodRDW5YG3oHi1diA6RJ079l776ehxmkTXvZh332j2/VmyOTI
	 B3wzsqafTpLg4GgO1XSQDcT6eYhtN3LmhUxwKPSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB55F8016C;
	Mon, 16 Nov 2020 15:29:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D55B8F80168; Mon, 16 Nov 2020 15:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4DBBF8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 15:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DBBF8014A
IronPort-SDR: LrrGVsXAu2thT+mRgn6Fzjnd8X2GQzD+L8c6siKLiEKY5v4dsMQ8Su3ZK75ud+QnHfl7rR7s/y
 LATtdIis7FrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="168175686"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="168175686"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 06:29:03 -0800
IronPort-SDR: m0ZVckjZnnw72PF6kHiWWVEpErRlH9EtPJGd9L3mmcCxcAUspD9NLrGWYXRTUBIcHNzeBFtzDR
 J+O64kE7XKvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="533429474"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2020 06:29:00 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: initial support for Alderlake-S
Date: Mon, 16 Nov 2020 16:26:42 +0200
Message-Id: <20201116142642.2106067-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

Add Kconfig entries, PCI ID and chip info for Alderlake-S product.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 16 ++++++++++++++++
 sound/soc/sof/intel/hda.h   |  1 +
 sound/soc/sof/intel/tgl.c   | 16 ++++++++++++++++
 sound/soc/sof/sof-pci-dev.c | 21 +++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index b233302f05e4..b607dba5fb2a 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -29,6 +29,7 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_TIGERLAKE   if SND_SOC_SOF_TIGERLAKE_SUPPORT
 	select SND_SOC_SOF_ELKHARTLAKE if SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 	select SND_SOC_SOF_JASPERLAKE  if SND_SOC_SOF_JASPERLAKE_SUPPORT
+	select SND_SOC_SOF_ALDERLAKE   if SND_SOC_SOF_ALDERLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
@@ -269,6 +270,21 @@ config SND_SOC_SOF_JASPERLAKE
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
+config SND_SOC_SOF_ALDERLAKE_SUPPORT
+	bool "SOF support for Alderlake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Alderlake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_ALDERLAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_INTEL_DSP_CONFIG
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1bc4dabdd394..75954e642c5e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -742,6 +742,7 @@ extern const struct sof_intel_dsp_desc tgl_chip_info;
 extern const struct sof_intel_dsp_desc tglh_chip_info;
 extern const struct sof_intel_dsp_desc ehl_chip_info;
 extern const struct sof_intel_dsp_desc jsl_chip_info;
+extern const struct sof_intel_dsp_desc adls_chip_info;
 
 /* machine driver select */
 void hda_machine_select(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 0278b67de1ec..bdcc66d0df78 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -151,3 +151,19 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+const struct sof_intel_dsp_desc adls_chip_info = {
+	/* Alderlake-S */
+	.cores_num = 2,
+	.init_core_mask = BIT(0),
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
+EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 8f62e3487dc1..f2a107481336 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -284,6 +284,23 @@ static const struct sof_dev_desc jsl_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
+static const struct sof_dev_desc adls_desc = {
+	.machines		= snd_soc_acpi_intel_hda_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &adls_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-adl-s.ri",
+	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
+	.ops = &sof_tgl_ops,
+};
+#endif
+
 static const struct dev_pm_ops sof_pci_pm = {
 	.prepare = snd_sof_prepare,
 	.complete = snd_sof_complete,
@@ -490,6 +507,10 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&ehl_desc},
 	{ PCI_DEVICE(0x8086, 0x4b58),
 		.driver_data = (unsigned long)&ehl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
+	{ PCI_DEVICE(0x8086, 0x7ad0),
+		.driver_data = (unsigned long)&adls_desc},
 #endif
 	{ 0, }
 };
-- 
2.28.0

