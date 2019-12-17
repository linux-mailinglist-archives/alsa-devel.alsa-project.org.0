Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E723312374B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 21:28:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D131668;
	Tue, 17 Dec 2019 21:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D131668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576614527;
	bh=BOmCKZ6HuDrovLOhxLXqg2E7+rWtlDe4BebMftCENws=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BLoxh8Yh+jYENj4+xBeiIAYprO4UvZMbvKi8cG0icr6RncCcjTiv3F/O/LagcHKPn
	 YByGMskgIh0BhH0wyJFdr+HgeQfJoxMahWNdfSAZ1SWEw/6t9RdRNGIk9o6mO9vrua
	 h9LYFrRsw3aXevsEm8zwzJUK7CikRxBUg0ZFQf14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C13F802A7;
	Tue, 17 Dec 2019 21:23:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98E99F80278; Tue, 17 Dec 2019 21:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0210F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 21:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0210F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266679231"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 12:22:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 14:22:27 -0600
Message-Id: <20191217202231.18259-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
References: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/8] ASoC: SOF: remove references to Haswell
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

There are no known commercial devices using Haswell, and there is no
support for Haswell in SOF so remove remaining definitions and
structures.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
