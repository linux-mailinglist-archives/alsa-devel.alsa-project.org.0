Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CA32956C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9E1B84A;
	Tue,  2 Mar 2021 01:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9E1B84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614645211;
	bh=e85x1W/zpQ0utCC9NICeSNUZOGkuENuPZvE1DkfafJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qv0hJdbnUGlJJaXWxR0bOUM3OcEe7GEqEkCIK8kWTaSV6z2oP25y6+icsNiqYnuYr
	 YyDFfAJ5nBdZIjQkYl4WiX/MkpsrR1eyP8jvRVuQfejoZBapBK08T9Zbe41r65WMpI
	 gLzDpDYJGP2A61fPl8u+wbhpvVrG2l9vMRAyFNX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4978F802E7;
	Tue,  2 Mar 2021 01:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A762EF802E3; Tue,  2 Mar 2021 01:31:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8CE7F8010B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CE7F8010B
IronPort-SDR: uktnm0XePGQ0kp0K3S1/wR0/eEkho9G963e3rrO7IvUAEDeFN6AeXt/9YCAV6+W4vHF1OuArgI
 qHl1LZ6DWNJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248048775"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248048775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:41 -0800
IronPort-SDR: g+SIeg6XoCdd/mGq/BhochWwnbkvcQRMMCZQdAsQiUUEC0TRZrGOIPU8xMEslXjsDrYWspzFkJ
 TJAK+fFraIdA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="444512548"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: SOF: ACPI: avoid reverse module dependency
Date: Mon,  1 Mar 2021 18:31:20 -0600
Message-Id: <20210302003125.1178419-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arnd@arndb.de, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The SOF-ACPI driver is backwards from the normal Linux model, it has a
generic driver that knows about all the specific drivers, as opposed to
having hardware specific drivers that link against a common framework.

This requires ugly Kconfig magic and leads to missed dependencies as
seen in this link error:

arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_acpi_probe':
sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'

Change it to use the normal probe order of starting with a specific
device in a driver, turning the sof-acpi-dev.c driver into a
library (exported symbols are name-spaced to avoid symbol pollution).

For backwards-compatibility with previous Kconfigs, the default values
for platform drivers uses the top-level ACPI configurations. The
modules were also renamed to allow for gradual transitions in test
scripts.

Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/sof/Kconfig        |   8 ++-
 sound/soc/sof/Makefile       |   2 +-
 sound/soc/sof/intel/Kconfig  |  48 +++++--------
 sound/soc/sof/intel/Makefile |   8 +--
 sound/soc/sof/intel/bdw.c    |  67 ++++++++++++++++--
 sound/soc/sof/intel/byt.c    | 106 +++++++++++++++++++++++++---
 sound/soc/sof/intel/shim.h   |   6 --
 sound/soc/sof/sof-acpi-dev.c | 130 +++--------------------------------
 sound/soc/sof/sof-acpi-dev.h |  16 +++++
 9 files changed, 215 insertions(+), 176 deletions(-)
 create mode 100644 sound/soc/sof/sof-acpi-dev.h

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 3e8b6c035ce3..95f55a0daefb 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -23,15 +23,17 @@ config SND_SOC_SOF_PCI
 config SND_SOC_SOF_ACPI
 	tristate "SOF ACPI enumeration support"
 	depends on ACPI || COMPILE_TEST
-	select SND_SOC_SOF
-	select SND_SOC_ACPI if ACPI
-	select IOSF_MBI if X86 && PCI
 	help
 	  This adds support for ACPI enumeration. This option is required
 	  to enable Intel Broadwell/Baytrail/Cherrytrail devices.
+	  For backwards-compatibility with previous configurations the selection will
+	  be used as default for platform-specific drivers.
 	  Say Y if you need this option.
 	  If unsure select "N".
 
+config SND_SOC_SOF_ACPI_DEV
+	tristate
+
 config SND_SOC_SOF_OF
 	tristate "SOF OF enumeration support"
 	depends on OF || COMPILE_TEST
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 05718dfe6cd2..f88fce23bbc7 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -14,7 +14,7 @@ obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
 obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
 
-obj-$(CONFIG_SND_SOC_SOF_ACPI) += snd-sof-acpi.o
+obj-$(CONFIG_SND_SOC_SOF_ACPI_DEV) += snd-sof-acpi.o
 obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-of.o
 obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci.o
 
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 4797a1cf8c80..2b062a66f1e7 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -9,14 +9,6 @@ config SND_SOC_SOF_INTEL_TOPLEVEL
 
 if SND_SOC_SOF_INTEL_TOPLEVEL
 
-config SND_SOC_SOF_INTEL_ACPI
-	def_tristate SND_SOC_SOF_ACPI
-	select SND_SOC_SOF_BAYTRAIL  if SND_SOC_SOF_BAYTRAIL_SUPPORT
-	select SND_SOC_SOF_BROADWELL if SND_SOC_SOF_BROADWELL_SUPPORT
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
 config SND_SOC_SOF_INTEL_PCI
 	def_tristate SND_SOC_SOF_PCI
 	select SND_SOC_SOF_MERRIFIELD  if SND_SOC_SOF_MERRIFIELD_SUPPORT
@@ -50,18 +42,25 @@ config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 
 config SND_SOC_SOF_INTEL_COMMON
 	tristate
+	select SND_SOC_SOF
 	select SND_SOC_ACPI_INTEL_MATCH
 	select SND_SOC_SOF_XTENSA
 	select SND_SOC_INTEL_MACH
 	select SND_SOC_ACPI if ACPI
+	select SND_INTEL_DSP_CONFIG
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-if SND_SOC_SOF_INTEL_ACPI
+if SND_SOC_SOF_ACPI
 
-config SND_SOC_SOF_BAYTRAIL_SUPPORT
-	bool "SOF support for Baytrail, Braswell and Cherrytrail"
+config SND_SOC_SOF_BAYTRAIL
+	tristate "SOF support for Baytrail, Braswell and Cherrytrail"
+	default SND_SOC_SOF_ACPI
+	select SND_SOC_SOF_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
+	select SND_SOC_SOF_ACPI_DEV
+	select IOSF_MBI if X86 && PCI
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Baytrail, Braswell or Cherrytrail processors.
@@ -75,17 +74,12 @@ config SND_SOC_SOF_BAYTRAIL_SUPPORT
 	  Say Y if you want to enable SOF on Baytrail/Cherrytrail.
 	  If unsure select "N".
 
-config SND_SOC_SOF_BAYTRAIL
-	tristate
-	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
-	select SND_INTEL_DSP_CONFIG
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-config SND_SOC_SOF_BROADWELL_SUPPORT
-	bool "SOF support for Broadwell"
-	select SND_INTEL_DSP_CONFIG
+config SND_SOC_SOF_BROADWELL
+	tristate "SOF support for Broadwell"
+	default SND_SOC_SOF_ACPI
+	select SND_SOC_SOF_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
+	select SND_SOC_SOF_ACPI_DEV
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Broadwell processors.
@@ -100,15 +94,7 @@ config SND_SOC_SOF_BROADWELL_SUPPORT
 	  Say Y if you want to enable SOF on Broadwell.
 	  If unsure select "N".
 
-config SND_SOC_SOF_BROADWELL
-	tristate
-	select SND_SOC_SOF_INTEL_COMMON
-	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-endif ## SND_SOC_SOF_INTEL_ACPI
+endif ## SND_SOC_SOF_ACPI
 
 if SND_SOC_SOF_INTEL_PCI
 
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 2589111c2fae..f6640fa73636 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
-snd-sof-intel-byt-objs := byt.o
-snd-sof-intel-bdw-objs := bdw.o
+snd-sof-acpi-intel-byt-objs := byt.o
+snd-sof-acpi-intel-bdw-objs := bdw.o
 
 snd-sof-intel-ipc-objs := intel-ipc.o
 
@@ -13,8 +13,8 @@ snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-compress.o
 
 snd-sof-intel-hda-objs := hda-codec.o
 
-obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-intel-byt.o
-obj-$(CONFIG_SND_SOC_SOF_BROADWELL) += snd-sof-intel-bdw.o
+obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-acpi-intel-byt.o
+obj-$(CONFIG_SND_SOC_SOF_BROADWELL) += snd-sof-acpi-intel-bdw.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC) += snd-sof-intel-ipc.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 50a4a73e6b9f..fd5ae628732d 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -15,8 +15,12 @@
 #include <linux/module.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/intel-dsp-config.h>
 #include "../ops.h"
 #include "shim.h"
+#include "../sof-acpi-dev.h"
 #include "../sof-audio.h"
 
 /* BARs */
@@ -590,7 +594,7 @@ static struct snd_soc_dai_driver bdw_dai[] = {
 };
 
 /* broadwell ops */
-const struct snd_sof_dsp_ops sof_bdw_ops = {
+static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	/*Device init */
 	.probe          = bdw_probe,
 
@@ -651,14 +655,69 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 
 	.arch_ops = &sof_xtensa_arch_ops,
 };
-EXPORT_SYMBOL_NS(sof_bdw_ops, SND_SOC_SOF_BROADWELL);
 
-const struct sof_intel_dsp_desc bdw_chip_info = {
+static const struct sof_intel_dsp_desc bdw_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
 };
-EXPORT_SYMBOL_NS(bdw_chip_info, SND_SOC_SOF_BROADWELL);
+
+static const struct sof_dev_desc sof_acpi_broadwell_desc = {
+	.machines = snd_soc_acpi_intel_broadwell_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = -1,
+	.irqindex_host_ipc = 0,
+	.chip_info = &bdw_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-bdw.ri",
+	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
+	.ops = &sof_bdw_ops,
+};
+
+static const struct acpi_device_id sof_broadwell_match[] = {
+	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, sof_broadwell_match);
+
+static int sof_broadwell_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct acpi_device_id *id;
+	const struct sof_dev_desc *desc;
+	int ret;
+
+	id = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!id)
+		return -ENODEV;
+
+	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
+	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
+		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
+	desc = device_get_match_data(dev);
+	if (!desc)
+		return -ENODEV;
+
+	return sof_acpi_probe(pdev, device_get_match_data(dev));
+}
+
+/* acpi_driver definition */
+static struct platform_driver snd_sof_acpi_intel_bdw_driver = {
+	.probe = sof_broadwell_probe,
+	.remove = sof_acpi_remove,
+	.driver = {
+		.name = "sof-audio-acpi-intel-bdw",
+		.pm = &sof_acpi_pm,
+		.acpi_match_table = sof_broadwell_match,
+	},
+};
+module_platform_driver(snd_sof_acpi_intel_bdw_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SND_SOC_SOF_ACPI_DEV);
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 19260dbecac5..2846fdec9d95 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -15,8 +15,12 @@
 #include <linux/module.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/intel-dsp-config.h>
 #include "../ops.h"
 #include "shim.h"
+#include "../sof-acpi-dev.h"
 #include "../sof-audio.h"
 #include "../../intel/common/soc-intel-quirks.h"
 
@@ -822,7 +826,7 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 }
 
 /* baytrail ops */
-const struct snd_sof_dsp_ops sof_byt_ops = {
+static const struct snd_sof_dsp_ops sof_byt_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,
@@ -892,16 +896,14 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
 
 	.arch_ops = &sof_xtensa_arch_ops,
 };
-EXPORT_SYMBOL_NS(sof_byt_ops, SND_SOC_SOF_BAYTRAIL);
 
-const struct sof_intel_dsp_desc byt_chip_info = {
+static const struct sof_intel_dsp_desc byt_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
 };
-EXPORT_SYMBOL_NS(byt_chip_info, SND_SOC_SOF_BAYTRAIL);
 
 /* cherrytrail and braswell ops */
-const struct snd_sof_dsp_ops sof_cht_ops = {
+static const struct snd_sof_dsp_ops sof_cht_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,
@@ -972,16 +974,104 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
 
 	.arch_ops = &sof_xtensa_arch_ops,
 };
-EXPORT_SYMBOL_NS(sof_cht_ops, SND_SOC_SOF_BAYTRAIL);
 
-const struct sof_intel_dsp_desc cht_chip_info = {
+static const struct sof_intel_dsp_desc cht_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
 };
-EXPORT_SYMBOL_NS(cht_chip_info, SND_SOC_SOF_BAYTRAIL);
+
+/* BYTCR uses different IRQ index */
+static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
+	.machines = snd_soc_acpi_intel_baytrail_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = 2,
+	.irqindex_host_ipc = 0,
+	.chip_info = &byt_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-byt.ri",
+	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
+	.ops = &sof_byt_ops,
+};
+
+static const struct sof_dev_desc sof_acpi_baytrail_desc = {
+	.machines = snd_soc_acpi_intel_baytrail_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = 2,
+	.irqindex_host_ipc = 5,
+	.chip_info = &byt_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-byt.ri",
+	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
+	.ops = &sof_byt_ops,
+};
+
+static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
+	.machines = snd_soc_acpi_intel_cherrytrail_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = 2,
+	.irqindex_host_ipc = 5,
+	.chip_info = &cht_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-cht.ri",
+	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
+	.ops = &sof_cht_ops,
+};
+
+static const struct acpi_device_id sof_baytrail_match[] = {
+	{ "80860F28", (unsigned long)&sof_acpi_baytrail_desc },
+	{ "808622A8", (unsigned long)&sof_acpi_cherrytrail_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, sof_baytrail_match);
+
+static int sof_baytrail_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct sof_dev_desc *desc;
+	const struct acpi_device_id *id;
+	int ret;
+
+	id = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!id)
+		return -ENODEV;
+
+	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
+	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
+		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
+	desc = device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -ENODEV;
+
+	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
+		desc = &sof_acpi_baytrailcr_desc;
+
+	return sof_acpi_probe(pdev, desc);
+}
+
+/* acpi_driver definition */
+static struct platform_driver snd_sof_acpi_intel_byt_driver = {
+	.probe = sof_baytrail_probe,
+	.remove = sof_acpi_remove,
+	.driver = {
+		.name = "sof-audio-acpi-intel-byt",
+		.pm = &sof_acpi_pm,
+		.acpi_match_table = sof_baytrail_match,
+	},
+};
+module_platform_driver(snd_sof_acpi_intel_byt_driver);
 
 #endif /* CONFIG_SND_SOC_SOF_BAYTRAIL */
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SND_SOC_SOF_ACPI_DEV);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 1e0afb5c8720..529f68d0ca47 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -167,13 +167,7 @@ struct sof_intel_dsp_desc {
 };
 
 extern const struct snd_sof_dsp_ops sof_tng_ops;
-extern const struct snd_sof_dsp_ops sof_byt_ops;
-extern const struct snd_sof_dsp_ops sof_cht_ops;
-extern const struct snd_sof_dsp_ops sof_bdw_ops;
 
-extern const struct sof_intel_dsp_desc byt_chip_info;
-extern const struct sof_intel_dsp_desc cht_chip_info;
-extern const struct sof_intel_dsp_desc bdw_chip_info;
 extern const struct sof_intel_dsp_desc tng_chip_info;
 
 struct sof_intel_stream {
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index cc2e257087e4..1fec0420f662 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -12,12 +12,12 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
-#include <sound/intel-dsp-config.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/sof.h>
 #include "../intel/common/soc-intel-quirks.h"
 #include "ops.h"
+#include "sof-acpi-dev.h"
 
 /* platform specific devices */
 #include "intel/shim.h"
@@ -36,74 +36,12 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
 
 #define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-static const struct sof_dev_desc sof_acpi_broadwell_desc = {
-	.machines = snd_soc_acpi_intel_broadwell_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_imr_base = -1,
-	.irqindex_host_ipc = 0,
-	.chip_info = &bdw_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.default_fw_filename = "sof-bdw.ri",
-	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
-	.ops = &sof_bdw_ops,
-};
-#endif
-
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-
-/* BYTCR uses different IRQ index */
-static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
-	.machines = snd_soc_acpi_intel_baytrail_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_imr_base = 2,
-	.irqindex_host_ipc = 0,
-	.chip_info = &byt_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.default_fw_filename = "sof-byt.ri",
-	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
-	.ops = &sof_byt_ops,
-};
-
-static const struct sof_dev_desc sof_acpi_baytrail_desc = {
-	.machines = snd_soc_acpi_intel_baytrail_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_imr_base = 2,
-	.irqindex_host_ipc = 5,
-	.chip_info = &byt_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.default_fw_filename = "sof-byt.ri",
-	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
-	.ops = &sof_byt_ops,
-};
-
-static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
-	.machines = snd_soc_acpi_intel_cherrytrail_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_imr_base = 2,
-	.irqindex_host_ipc = 5,
-	.chip_info = &cht_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
-	.default_fw_filename = "sof-cht.ri",
-	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
-	.ops = &sof_cht_ops,
-};
-
-#endif
-
-static const struct dev_pm_ops sof_acpi_pm = {
+const struct dev_pm_ops sof_acpi_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
 			   snd_sof_runtime_idle)
 };
+EXPORT_SYMBOL_NS(sof_acpi_pm, SND_SOC_SOF_ACPI_DEV);
 
 static void sof_acpi_probe_complete(struct device *dev)
 {
@@ -118,41 +56,19 @@ static void sof_acpi_probe_complete(struct device *dev)
 	pm_runtime_enable(dev);
 }
 
-static int sof_acpi_probe(struct platform_device *pdev)
+int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc)
 {
 	struct device *dev = &pdev->dev;
-	const struct acpi_device_id *id;
-	const struct sof_dev_desc *desc;
 	struct snd_sof_pdata *sof_pdata;
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
 
-	id = acpi_match_device(dev->driver->acpi_match_table, dev);
-	if (!id)
-		return -ENODEV;
-
-	if (IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)) {
-		ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
-		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
-			dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
-			return -ENODEV;
-		}
-	}
 	dev_dbg(dev, "ACPI DSP detected");
 
 	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
 	if (!sof_pdata)
 		return -ENOMEM;
 
-	desc = device_get_match_data(dev);
-	if (!desc)
-		return -ENODEV;
-
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
-		desc = &sof_acpi_baytrailcr_desc;
-#endif
-
 	/* get ops for platform */
 	ops = desc->ops;
 	if (!ops) {
@@ -194,44 +110,20 @@ static int sof_acpi_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(sof_acpi_probe, SND_SOC_SOF_ACPI_DEV);
 
-static int sof_acpi_remove(struct platform_device *pdev)
+int sof_acpi_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+
 	if (!(sof_acpi_debug & SOF_ACPI_DISABLE_PM_RUNTIME))
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(dev);
 
 	/* call sof helper for DSP hardware remove */
-	snd_sof_device_remove(&pdev->dev);
+	snd_sof_device_remove(dev);
 
 	return 0;
 }
-
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id sof_acpi_match[] = {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-	{ "80860F28", (unsigned long)&sof_acpi_baytrail_desc },
-	{ "808622A8", (unsigned long)&sof_acpi_cherrytrail_desc },
-#endif
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, sof_acpi_match);
-#endif
-
-/* acpi_driver definition */
-static struct platform_driver snd_sof_acpi_driver = {
-	.probe = sof_acpi_probe,
-	.remove = sof_acpi_remove,
-	.driver = {
-		.name = "sof-audio-acpi",
-		.pm = &sof_acpi_pm,
-		.acpi_match_table = ACPI_PTR(sof_acpi_match),
-	},
-};
-module_platform_driver(snd_sof_acpi_driver);
+EXPORT_SYMBOL_NS(sof_acpi_remove, SND_SOC_SOF_ACPI_DEV);
 
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(SND_SOC_SOF_BAYTRAIL);
-MODULE_IMPORT_NS(SND_SOC_SOF_BROADWELL);
diff --git a/sound/soc/sof/sof-acpi-dev.h b/sound/soc/sof/sof-acpi-dev.h
new file mode 100644
index 000000000000..5c2b558d2ace
--- /dev/null
+++ b/sound/soc/sof/sof-acpi-dev.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __SOUND_SOC_SOF_ACPI_H
+#define __SOUND_SOC_SOF_ACPI_H
+
+extern const struct dev_pm_ops sof_acpi_pm;
+int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc);
+int sof_acpi_remove(struct platform_device *pdev);
+
+#endif
-- 
2.25.1

