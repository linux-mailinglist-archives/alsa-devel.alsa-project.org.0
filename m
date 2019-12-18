Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332E12530E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317F9167C;
	Wed, 18 Dec 2019 21:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317F9167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700366;
	bh=UjklLKk2ImP4BDH8mBpQd7nxwpzCst9eI/bQ2JgaOkY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Pzmkp0XuJ6b8/U9TGjD+geRautA+zWEfp+w6S9NJQtnbRwdOtI5hsdSMBnBmh6o2c
	 l5YIKqzqGiPOMsEKK1/+WXqK4GxKXQj7TPI3eAQPM94Dn6YBOY3JGyMPLGLVJ5LbZ8
	 nnsun54n88O1kHUMAMxFqK5GYi1qf/uNpmxk8FS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65BB7F80360;
	Wed, 18 Dec 2019 21:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1F3AF8034D; Wed, 18 Dec 2019 21:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 998B6F80347
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:06:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 998B6F80347
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F77F31B;
 Wed, 18 Dec 2019 12:06:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B13073F67D;
 Wed, 18 Dec 2019 12:06:12 -0800 (PST)
Date: Wed, 18 Dec 2019 20:06:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191217202231.18259-5-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191217202231.18259-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: remove references to Haswell" to
	the asoc tree
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

   ASoC: SOF: remove references to Haswell

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 1fa44098b683312b426bd05f1bfc0b5b1fa7860a Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 17 Dec 2019 14:22:27 -0600
Subject: [PATCH] ASoC: SOF: remove references to Haswell

There are no known commercial devices using Haswell, and there is no
support for Haswell in SOF so remove remaining definitions and
structures.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191217202231.18259-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig        |  2 +-
 sound/soc/sof/intel/shim.h   |  6 ++----
 sound/soc/sof/sof-acpi-dev.c | 20 --------------------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 71a0fc075a63..827b0ec92522 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -28,7 +28,7 @@ config SND_SOC_SOF_ACPI
 	select IOSF_MBI if X86 && PCI
 	help
 	  This adds support for ACPI enumeration. This option is required
-	  to enable Intel Haswell/Broadwell/Baytrail/Cherrytrail devices
+	  to enable Intel Broadwell/Baytrail/Cherrytrail devices
 	  Say Y if you need this option
 	  If unsure select "N".
 
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index f7a3f62e45d4..daaf3364c177 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -12,7 +12,7 @@
 #define __SOF_INTEL_SHIM_H
 
 /*
- * SHIM registers for BYT, BSW, CHT, HSW, BDW
+ * SHIM registers for BYT, BSW, CHT, BDW
  */
 
 #define SHIM_CSR		(SHIM_OFFSET + 0x00)
@@ -38,7 +38,7 @@
 #define SHIM_PWMCTRL		0x1000
 
 /*
- * SST SHIM register bits for BYT, BSW, CHT HSW, BDW
+ * SST SHIM register bits for BYT, BSW, CHT, BDW
  * Register bit naming and functionaility can differ between devices.
  */
 
@@ -169,13 +169,11 @@ struct sof_intel_dsp_desc {
 extern const struct snd_sof_dsp_ops sof_tng_ops;
 extern const struct snd_sof_dsp_ops sof_byt_ops;
 extern const struct snd_sof_dsp_ops sof_cht_ops;
-extern const struct snd_sof_dsp_ops sof_hsw_ops;
 extern const struct snd_sof_dsp_ops sof_bdw_ops;
 
 extern const struct sof_intel_dsp_desc byt_chip_info;
 extern const struct sof_intel_dsp_desc cht_chip_info;
 extern const struct sof_intel_dsp_desc bdw_chip_info;
-extern const struct sof_intel_dsp_desc hsw_chip_info;
 extern const struct sof_intel_dsp_desc tng_chip_info;
 
 struct sof_intel_stream {
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index d8ed6bfa5ce7..9100d7c70bb2 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -35,23 +35,6 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
 
 #define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HASWELL)
-static const struct sof_dev_desc sof_acpi_haswell_desc = {
-	.machines = snd_soc_acpi_intel_haswell_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_imr_base = -1,
-	.irqindex_host_ipc = 0,
-	.chip_info = &hsw_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.default_fw_filename = "sof-hsw.ri",
-	.nocodec_tplg_filename = "sof-hsw-nocodec.tplg",
-	.ops = &sof_hsw_ops,
-	.arch_ops = &sof_xtensa_arch_ops
-};
-#endif
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.machines = snd_soc_acpi_intel_broadwell_machines,
@@ -213,9 +196,6 @@ static int sof_acpi_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id sof_acpi_match[] = {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HASWELL)
-	{ "INT33C8", (unsigned long)&sof_acpi_haswell_desc },
-#endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
