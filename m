Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768932EB352
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 20:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC45B16A3;
	Tue,  5 Jan 2021 20:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC45B16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609873774;
	bh=CCwcqCBELNKI9MzZqGeaFuhNihgNoTuGLyQUw8ik4rw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCGXS4jIZ5x7GiQJ7cmXLRV3TzJV0+/6znnHRBBopbHraFnCbqarGPc44OE1Xwobh
	 HHtZs3prSuT+IANscCxF0i5mCxlWJ3C0SePW1Va3mpgu84c+TkOvVt6tX/sjo0/c4P
	 Y4VtFqLtan2tJhoKKb+YTFFq+lGslIzsbeUvLVVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C328F80258;
	Tue,  5 Jan 2021 20:08:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AB9DF800FD; Tue,  5 Jan 2021 20:08:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CC0F800FD;
 Tue,  5 Jan 2021 20:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CC0F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uxj2B30+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C22022D6E;
 Tue,  5 Jan 2021 19:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609873710;
 bh=CCwcqCBELNKI9MzZqGeaFuhNihgNoTuGLyQUw8ik4rw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uxj2B30+S9eBiMrEmlWS9mTSaFXRdhYcOseocETPo+885k9vdgT9eK0cUkhurweiz
 rkyJOBnXicQvF/cMgTqkOu3eyblr74G/x8v84Kif0hn3kqEZmV82VitPIKTZ9RKLR7
 c5cimQtYcTL2Q8ps892xx8SGMK4m6EOeWumACxY+tI9LYTFnPR4kHcY0jmOn55Z1Tv
 wtNwa7ZfysLQC/BD3SFprssryDkalA4ANPpxL7cQtVUo5isIoKCzCXtj6PEnrzFr43
 nUEuCPdOsGTrIKaKl1R+/cImdF7Ko0CN3iXPj0gmxDb5bLnoxgMVq+ib5ChwcwEsNW
 hey0O9CPkkVLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: avoid reverse module dependency
Date: Tue,  5 Jan 2021 20:07:38 +0100
Message-Id: <20210105190808.613050-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
References: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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
device in a driver, turning the sof-acpi-dev.c driver into a library.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/Kconfig  |  34 ++--------
 sound/soc/sof/intel/bdw.c    |  51 +++++++++++++--
 sound/soc/sof/intel/byt.c    | 104 +++++++++++++++++++++++++----
 sound/soc/sof/intel/shim.h   |  10 ++-
 sound/soc/sof/sof-acpi-dev.c | 122 ++---------------------------------
 5 files changed, 156 insertions(+), 165 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index ae9ba834814e..ff9266413a06 100644
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
@@ -58,10 +50,12 @@ config SND_SOC_SOF_INTEL_COMMON
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-if SND_SOC_SOF_INTEL_ACPI
+if SND_SOC_SOF_ACPI
 
-config SND_SOC_SOF_BAYTRAIL_SUPPORT
+config SND_SOC_SOF_BAYTRAIL
 	bool "SOF support for Baytrail, Braswell and Cherrytrail"
+	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
+	select SND_INTEL_DSP_CONFIG
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Baytrail, Braswell or Cherrytrail processors.
@@ -75,17 +69,11 @@ config SND_SOC_SOF_BAYTRAIL_SUPPORT
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
+config SND_SOC_SOF_BROADWELL
 	bool "SOF support for Broadwell"
 	select SND_INTEL_DSP_CONFIG
+	select SND_SOC_SOF_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Broadwell processors.
@@ -100,14 +88,6 @@ config SND_SOC_SOF_BROADWELL_SUPPORT
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
 endif ## SND_SOC_SOF_INTEL_ACPI
 
 if SND_SOC_SOF_INTEL_PCI
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 50a4a73e6b9f..542e885733a2 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -15,6 +15,8 @@
 #include <linux/module.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
 #include "../ops.h"
 #include "shim.h"
 #include "../sof-audio.h"
@@ -590,7 +592,7 @@ static struct snd_soc_dai_driver bdw_dai[] = {
 };
 
 /* broadwell ops */
-const struct snd_sof_dsp_ops sof_bdw_ops = {
+static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	/*Device init */
 	.probe          = bdw_probe,
 
@@ -651,13 +653,54 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 
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
+static int sof_broadwell_probe(struct platform_device *dev)
+{
+	int ret = snd_intel_acpi_dsp_driver_probe(dev, "INT3438");
+	if (ret != SND_INTEL_DSP_DRIVER_SOF) {
+		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
+	return sof_acpi_probe(dev, &sof_acpi_broadwell_desc);
+}
+
+/* acpi_driver definition */
+static struct platform_driver snd_sof_acpi_driver = {
+	.probe = sof_broadwell_probe,
+	.remove = sof_acpi_remove,
+	.driver = {
+		.name = "sof-audio-broadwell",
+		.pm = &sof_acpi_pm,
+		.acpi_match_table = sof_broadwell_match,
+	},
+};
+module_platform_driver(snd_sof_acpi_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 19260dbecac5..9fa688c7711e 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -15,6 +15,8 @@
 #include <linux/module.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
 #include "../ops.h"
 #include "shim.h"
 #include "../sof-audio.h"
@@ -657,8 +659,6 @@ EXPORT_SYMBOL_NS(tng_chip_info, SND_SOC_SOF_MERRIFIELD);
 
 #endif /* CONFIG_SND_SOC_SOF_MERRIFIELD */
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-
 static void byt_reset_dsp_disable_int(struct snd_sof_dev *sdev)
 {
 	/* Disable Interrupt from both sides */
@@ -822,7 +822,7 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 }
 
 /* baytrail ops */
-const struct snd_sof_dsp_ops sof_byt_ops = {
+static const struct snd_sof_dsp_ops sof_byt_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,
@@ -892,16 +892,14 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
 
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
@@ -972,15 +970,99 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
 
 	.arch_ops = &sof_xtensa_arch_ops,
 };
-EXPORT_SYMBOL_NS(sof_cht_ops, SND_SOC_SOF_BAYTRAIL);
 
-const struct sof_intel_dsp_desc cht_chip_info = {
+static const struct sof_intel_dsp_desc cht_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
 };
-EXPORT_SYMBOL_NS(cht_chip_info, SND_SOC_SOF_BAYTRAIL);
 
-#endif /* CONFIG_SND_SOC_SOF_BAYTRAIL */
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
+	const struct sof_dev_desc *desc = device_get_match_data(&pdev->dev);
+	const struct acpi_device_id *id;
+
+	id = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!id)
+		return -ENODEV;
+
+	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
+	if (ret != SND_INTEL_DSP_DRIVER_SOF) {
+		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
+	dev_dbg(dev, "ACPI DSP detected");
+
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
+static struct platform_driver snd_sof_baytrail_driver = {
+	.probe = sof_baytrail_probe,
+	.remove = sof_acpi_remove,
+	.driver = {
+		.name = "sof-audio-baytrail",
+		.pm = &sof_acpi_pm,
+		.acpi_match_table = sof_baytrail_match,
+	},
+};
+module_platform_driver(snd_sof_baytrail_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 1e0afb5c8720..872116ee622b 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -166,14 +166,12 @@ struct sof_intel_dsp_desc {
 	int ssp_base_offset;		/* base address of the SSPs */
 };
 
+extern const struct dev_pm_ops sof_acpi_pm;
+extern int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc);
+extern int sof_acpi_remove(struct platform_device *pdev);
+
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
index 2a369c2c6551..32654e042ec4 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -36,70 +36,7 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
 
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
@@ -118,40 +55,17 @@ static void sof_acpi_probe_complete(struct device *dev)
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
-	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
-		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
-		return -ENODEV;
-	}
-
-	dev_dbg(dev, "ACPI DSP detected");
-
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
@@ -193,8 +107,9 @@ static int sof_acpi_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(sof_acpi_probe);
 
-static int sof_acpi_remove(struct platform_device *pdev)
+int sof_acpi_remove(struct platform_device *pdev)
 {
 	if (!(sof_acpi_debug & SOF_ACPI_DISABLE_PM_RUNTIME))
 		pm_runtime_disable(&pdev->dev);
@@ -204,33 +119,6 @@ static int sof_acpi_remove(struct platform_device *pdev)
 
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
+EXPORT_SYMBOL_GPL(sof_acpi_remove);
 
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(SND_SOC_SOF_BAYTRAIL);
-MODULE_IMPORT_NS(SND_SOC_SOF_BROADWELL);
-- 
2.29.2

