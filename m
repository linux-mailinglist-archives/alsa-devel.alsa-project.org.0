Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1FAE88EC
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 13:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DCB22206;
	Tue, 29 Oct 2019 13:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DCB22206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572353977;
	bh=86Go57l+FdPPkHd6y2Oi7b5xLiuor/T1Jg6pN42aONA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ifxt6FwhSBaZgDdSWJclKK0eszOMzLl/GSQl+Ut5xY/fUQ/rVa+utr6+vmBYKda4M
	 +XygQlC/cZJR14eA1TETry7h9d/Y01SBr15fBehRUK2E4CwldvQKJWb9ApEDiMA6/N
	 0Zem/Edvl0Hb0b5rTzXGmCHJwobs1KkFR48XZfQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B845DF8015A;
	Tue, 29 Oct 2019 13:57:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B6FF8044B; Tue, 29 Oct 2019 13:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D61A4F80269
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 13:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D61A4F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WaAYrYZ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Qdy27gZDbjup2hjmsULyToGjIV3KhtcZPWOxlsuPOpc=; b=WaAYrYZ04cdT
 5KZLZis/mqi8rhjUrocDoefWPHknyzOu4PvorbSy3mLuH6dNRzP2ZnIIcl/xS7izHqCWzyjMsyPk+
 cecINy5XScQTLMqtCTBGSj8bTk0DICNMsXEYluYephw5SpqZxCyzzJNvW22OFAiXg1JpeafMDXklK
 28/aE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPR3U-0002DO-Ja; Tue, 29 Oct 2019 12:57:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1AEEB2742157; Tue, 29 Oct 2019 12:57:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20191028173329.29538-1-perex@perex.cz>
X-Patchwork-Hint: ignore
Message-Id: <20191029125700.1AEEB2742157@ypsilon.sirena.org.uk>
Date: Tue, 29 Oct 2019 12:57:00 +0000 (GMT)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF - remove the dead code
	(skylake/kabylake)" to the asoc tree
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

   ASoC: SOF - remove the dead code (skylake/kabylake)

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

From c3ad1092e1069f27d0ca110dcaada8a5435ea3e0 Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Mon, 28 Oct 2019 18:33:29 +0100
Subject: [PATCH] ASoC: SOF - remove the dead code (skylake/kabylake)

Appearently the CONFIG_SND_SOC_SOF_KABYLAKE and CONFIG_SND_SOC_SOF_SKYLAKE
options are not present in Kconfig and 'struct snd_sof_dsp_ops sof_skl_ops'
is not declared in the code, too.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20191028173329.29538-1-perex@perex.cz
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.h   |  1 -
 sound/soc/sof/sof-pci-dev.c | 44 -------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 52a87a47029d..16376f55e420 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -608,7 +608,6 @@ extern struct snd_soc_dai_driver skl_dai[];
  */
 extern const struct snd_sof_dsp_ops sof_apl_ops;
 extern const struct snd_sof_dsp_ops sof_cnl_ops;
-extern const struct snd_sof_dsp_ops sof_skl_ops;
 
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 487b1f29f84d..4de90d04a91b 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -173,42 +173,6 @@ static const struct sof_dev_desc icl_desc = {
 };
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
-static const struct sof_dev_desc skl_desc = {
-	.machines		= snd_soc_acpi_intel_skl_machines,
-	.resindex_lpe_base	= 0,
-	.resindex_pcicfg_base	= -1,
-	.resindex_imr_base	= -1,
-	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
-	.chip_info = &skl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.nocodec_fw_filename = "sof-skl.ri",
-	.nocodec_tplg_filename = "sof-skl-nocodec.tplg",
-	.ops = &sof_skl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
-};
-#endif
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
-static const struct sof_dev_desc kbl_desc = {
-	.machines		= snd_soc_acpi_intel_kbl_machines,
-	.resindex_lpe_base	= 0,
-	.resindex_pcicfg_base	= -1,
-	.resindex_imr_base	= -1,
-	.irqindex_host_ipc	= -1,
-	.resindex_dma_base	= -1,
-	.chip_info = &skl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.nocodec_fw_filename = "sof-kbl.ri",
-	.nocodec_tplg_filename = "sof-kbl-nocodec.tplg",
-	.ops = &sof_skl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
-};
-#endif
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 static const struct sof_dev_desc tgl_desc = {
 	.machines               = snd_soc_acpi_intel_tgl_machines,
@@ -431,14 +395,6 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0xa348),
 		.driver_data = (unsigned long)&cfl_desc},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
-	{ PCI_DEVICE(0x8086, 0x9d71),
-		.driver_data = (unsigned long)&kbl_desc},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
-	{ PCI_DEVICE(0x8086, 0x9d70),
-		.driver_data = (unsigned long)&skl_desc},
-#endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{ PCI_DEVICE(0x8086, 0x34C8),
 		.driver_data = (unsigned long)&icl_desc},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
