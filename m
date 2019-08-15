Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763538F1D7
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12BBE166A;
	Thu, 15 Aug 2019 19:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12BBE166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889378;
	bh=f1OM+va5DcHmCBnBRHqi/GqNR+nhsCYF91s2ekR3LtU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UaWthCvyjNdtCTX1f0EUtLIEDR0mqk417Yh8C0PUQZH9RjVa8c07+ilDFvfZxFzMs
	 gFSfHevmqpMwf6ndl8jsJl2r4tZi7W74QYpCU7cRzcoRJCsEQkgdg7ywdIlcKKtGBk
	 BRhJLQq9SWHkK69Nqw4CBTw9FklNyLT8FwC+5pHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA1DDF80612;
	Thu, 15 Aug 2019 19:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBD84F805FE; Thu, 15 Aug 2019 19:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FE0BF8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE0BF8015B
Received: by mail-wm1-f98.google.com with SMTP id f72so1873533wmf.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=K4AZDv4qLVSyMO4SwdPYeOIJRtfNK0gZj7gqJK97MvM=;
 b=qun2de3yYvaY1voh3DHw4/ghkDDCmb/A9okRfrwy4H96wVlvtDtAkL/8bwGsxoWzwR
 dsgQiEbCxnoh8US4bGZDlvaj4bPCmeS3rcH+eE+CD8aVV+AVkO7vn5xjs80VFDCiMv84
 XquGHlX7E8Ndg5j4HCQ+rSn4Ozn0bTn9lYmagz1cElPp71qaMk1JgBcobTgjaCuF/HFk
 rywtzuHsaoVQ9G7WQkyxFtKL3TvMJbBfQ+u+Cf3J0x399eCKAilB+V6c9CoGx39wZi+Q
 kLCjQzPlf+l/Q5T3b/h1Okdpc+eUuU8wS5vNslqpHepmTintYkhAV2aUEArti+a9261/
 CwNQ==
X-Gm-Message-State: APjAAAX5zI4IopUUppqnif2/T5WsF6kh6Drrt0vkYH4L33S/y1Ewf7hQ
 YJIkxEZAynEyeN58avIhIQyLhwLz6APV/9aMjIRv+ar2DDmgK1KKnVn/luBxXVq4rA==
X-Google-Smtp-Source: APXvYqwpBuJCLF3dCDsaUsmHnCpviHR/Du0aKe8q2ZxjKyfEghGfc8/vjtKRkT8rRmq4RiB89iln3DNhVO7V
X-Received: by 2002:a7b:c8cb:: with SMTP id f11mr3770990wml.138.1565889262003; 
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id e6sm70169wrv.88.2019.08.15.10.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:21 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKP-00050o-JM; Thu, 15 Aug 2019 17:14:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A76E22742B9E; Thu, 15 Aug 2019 18:14:20 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pan Xiuli <xiuli.pan@linux.intel.com>
In-Reply-To: <20190815155749.29304-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171420.A76E22742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:20 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: initial support for Elkhart
	Lake" to the asoc tree
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

   ASoC: SOF: Intel: initial support for Elkhart Lake

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 6173269038e98408c27cfb438ff07d463fbd0b33 Mon Sep 17 00:00:00 2001
From: Pan Xiuli <xiuli.pan@linux.intel.com>
Date: Thu, 15 Aug 2019 10:57:49 -0500
Subject: [PATCH] ASoC: SOF: Intel: initial support for Elkhart Lake

Add Kconfig, PCI ID and chip info for EHL platform.

Note that the core mask is different from previous platforms, only
Core0 can be controlled by the host. Additional patches will be
required for multi-core functionality.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815155749.29304-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/Kconfig | 16 ++++++++++++++++
 sound/soc/sof/intel/cnl.c   | 16 ++++++++++++++++
 sound/soc/sof/intel/hda.h   |  1 +
 sound/soc/sof/sof-pci-dev.c | 22 ++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 0dc5da661b61..889b6202d054 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_COMETLAKE_LP if SND_SOC_SOF_COMETLAKE_LP_SUPPORT
 	select SND_SOC_SOF_COMETLAKE_H if SND_SOC_SOF_COMETLAKE_H_SUPPORT
 	select SND_SOC_SOF_TIGERLAKE   if SND_SOC_SOF_TIGERLAKE_SUPPORT
+	select SND_SOC_SOF_ELKHARTLAKE if SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -228,6 +229,21 @@ config SND_SOC_SOF_TIGERLAKE
           This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
+	bool "SOF support for ElkhartLake"
+	help
+          This adds support for Sound Open Firmware for Intel(R) platforms
+          using the ElkhartLake processors.
+          Say Y if you have such a device.
+          If unsure select "N".
+
+config SND_SOC_SOF_ELKHARTLAKE
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
index 5de281fcc122..4ddd73762d81 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -311,3 +311,19 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
 EXPORT_SYMBOL(tgl_chip_info);
+
+const struct sof_intel_dsp_desc ehl_chip_info = {
+	/* Elkhartlake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL(ehl_chip_info);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index cbb431f7835d..5591841a1b6f 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -600,5 +600,6 @@ extern const struct sof_intel_dsp_desc cnl_chip_info;
 extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
 extern const struct sof_intel_dsp_desc tgl_chip_info;
+extern const struct sof_intel_dsp_desc ehl_chip_info;
 
 #endif
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 9f92504ad5b4..d66412a77873 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -221,6 +221,24 @@ static const struct sof_dev_desc tgl_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
+static const struct sof_dev_desc ehl_desc = {
+	.machines               = snd_soc_acpi_intel_ehl_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &ehl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-ehl.ri",
+	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
 static const struct dev_pm_ops sof_pci_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
@@ -406,6 +424,10 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 	{ PCI_DEVICE(0x8086, 0xa0c8),
 		.driver_data = (unsigned long)&tgl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
+	{ PCI_DEVICE(0x8086, 0x4b55),
+		.driver_data = (unsigned long)&ehl_desc},
 #endif
 	{ 0, }
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
