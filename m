Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D28E22EF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 162DC1658;
	Wed, 23 Oct 2019 20:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 162DC1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857078;
	bh=nJeY0BBJeHxeymmgtK/gHMtjL7zi0CzGIRMGguHvDdA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oewbMe2d273S0/LL+RzX6gAbUKbHfOug/83zCGhQ7YJzVkQGgYODnJFXVFQA1xUsJ
	 YPcOQlGYq+hO1jIvP9QRLlZ58mZveGSqwQT6J9nStSogLNTQqDMgfqiAopVzuwDgnh
	 nSM8roVyTiPNjqzRvPvpZrMdVG709kY+UGAKyvF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62574F805FF;
	Wed, 23 Oct 2019 20:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A1C7F805FE; Wed, 23 Oct 2019 20:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8246F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8246F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VDSwYMKi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=e8czRQyb7+ORL6ys22KV/0SV9Pw4dt+JhCfSFagW2rg=; b=VDSwYMKixtMq
 M9H5FhObCOsRu3MJgWorOxy4MfehKTZ4cItHYAK+lf4OvmDQn2f0aYOYcnkz/jtmz0CxJhs/iq6BN
 eonnFfAyPPtdCDP7HP0g+EOdLNz/zn/2npI3vZWTbD7VbBGl0TJ0VGDzoWxRTQ5c3ShstU9dDuJaN
 VAxr0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLnh-0001Ak-Vk; Wed, 23 Oct 2019 18:56:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 620502743293; Wed, 23 Oct 2019 19:56:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pan Xiuli <xiuli.pan@linux.intel.com>
In-Reply-To: <20191022194705.23347-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191023185605.620502743293@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:05 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: initial support to
	JasperLake." to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: initial support to JasperLake.

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6fd9903527bf103167004022a0199b8fac1b8b29 Mon Sep 17 00:00:00 2001
From: Pan Xiuli <xiuli.pan@linux.intel.com>
Date: Tue, 22 Oct 2019 14:47:05 -0500
Subject: [PATCH] ASoC: SOF: Intel: initial support to JasperLake.

Add Kconfig, PCI ID and chip info for JSL platform.
The DSP only has 2 cores for this platform.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191022194705.23347-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/Kconfig | 16 ++++++++++++++++
 sound/soc/sof/intel/cnl.c   | 17 +++++++++++++++++
 sound/soc/sof/intel/hda.h   |  1 +
 sound/soc/sof/sof-pci-dev.c | 22 ++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index d62f51d33be1..342f22a7c64f 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -29,6 +29,7 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_COMETLAKE_H if SND_SOC_SOF_COMETLAKE_H_SUPPORT
 	select SND_SOC_SOF_TIGERLAKE   if SND_SOC_SOF_TIGERLAKE_SUPPORT
 	select SND_SOC_SOF_ELKHARTLAKE if SND_SOC_SOF_ELKHARTLAKE_SUPPORT
+	select SND_SOC_SOF_JASPERLAKE  if SND_SOC_SOF_JASPERLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -244,6 +245,21 @@ config SND_SOC_SOF_ELKHARTLAKE
           This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_JASPERLAKE_SUPPORT
+	bool "SOF support for JasperLake"
+	help
+          This adds support for Sound Open Firmware for Intel(R) platforms
+          using the JasperLake processors.
+          Say Y if you have such a device.
+          If unsure select "N".
+
+config SND_SOC_SOF_JASPERLAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+          This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 4ddd73762d81..5b97bdfba823 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -327,3 +327,20 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
 EXPORT_SYMBOL(ehl_chip_info);
+
+const struct sof_intel_dsp_desc jsl_chip_info = {
+	/* Jasperlake */
+	.cores_num = 2,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0) |
+				HDA_DSP_CORE_MASK(1),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL(jsl_chip_info);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 23e430d3e056..ea02bf40cb25 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -604,5 +604,6 @@ extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
 extern const struct sof_intel_dsp_desc tgl_chip_info;
 extern const struct sof_intel_dsp_desc ehl_chip_info;
+extern const struct sof_intel_dsp_desc jsl_chip_info;
 
 #endif
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 030f2cb06921..4adbb27c76c5 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -245,6 +245,24 @@ static const struct sof_dev_desc ehl_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
+static const struct sof_dev_desc jsl_desc = {
+	.machines               = snd_soc_acpi_intel_jsl_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &jsl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-jsl.ri",
+	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
 static const struct dev_pm_ops sof_pci_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
@@ -423,6 +441,10 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0x34C8),
 		.driver_data = (unsigned long)&icl_desc},
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
+	{ PCI_DEVICE(0x8086, 0x38c8),
+		.driver_data = (unsigned long)&jsl_desc},
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
 	{ PCI_DEVICE(0x8086, 0x02c8),
 		.driver_data = (unsigned long)&cml_desc},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
