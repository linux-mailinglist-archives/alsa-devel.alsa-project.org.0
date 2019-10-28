Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750FE77A3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 18:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E711520AC;
	Mon, 28 Oct 2019 18:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E711520AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572284076;
	bh=tYgcxmRyATb0F4DPO9AyclGwIMXyoXq0D/JWeSH6nMY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KS2r8Ce2NWTxnACgDC5h6qH8T5xZh5VULPJrWP2ZrTN5jiBDULrpdbuFN0TOw1gjS
	 w4f28jSEq9iNoVJbc4uhVc8dR33BXQWoLfzRAueh+7KPq5ZDsUo6nkEJeeiisW+8+T
	 0CmTHE8iIkzzFKLNztAemirzpnHeE88j69ATXx8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6CEAF8048F;
	Mon, 28 Oct 2019 18:33:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0258F8044A; Mon, 28 Oct 2019 18:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41304F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 18:33:38 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 39E5DA0040;
 Mon, 28 Oct 2019 18:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 39E5DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572284018; bh=dI21U1HqNhjNL7wb46ZcO7AWwyXnx+hFa1wDknC1Ybc=;
 h=From:To:Cc:Subject:Date:From;
 b=CPmymANQjAy/8TT1E9BLk0jT4CA9irQ2djN/crI4b7X/QukTKHZb5MZVszbUXZpny
 gzSCLL6ox1BQGhcK488jh/Dcg9N++Pyb067sDUHOqSxmASX/3kt/xFtknYNwtur5yA
 iFxw0CIeHhym4Km3P0c8Gi7txz9Bw5zgWle+YZXw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 28 Oct 2019 18:33:33 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Mon, 28 Oct 2019 18:33:29 +0100
Message-Id: <20191028173329.29538-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF - remove the dead code
	(skylake/kabylake)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Appearently the CONFIG_SND_SOC_SOF_KABYLAKE and CONFIG_SND_SOC_SOF_SKYLAKE
options are not present in Kconfig and 'struct snd_sof_dsp_ops sof_skl_ops'
is not declared in the code, too.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.h   |  1 -
 sound/soc/sof/sof-pci-dev.c | 44 -------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 23e430d3e056..f521c48ec2eb 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -596,7 +596,6 @@ extern struct snd_soc_dai_driver skl_dai[];
  */
 extern const struct snd_sof_dsp_ops sof_apl_ops;
 extern const struct snd_sof_dsp_ops sof_cnl_ops;
-extern const struct snd_sof_dsp_ops sof_skl_ops;
 
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 3a9e0e2a150d..bca3fb791a6b 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -168,42 +168,6 @@ static const struct sof_dev_desc icl_desc = {
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
@@ -407,14 +371,6 @@ static const struct pci_device_id sof_pci_ids[] = {
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
