Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBCD071C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 08:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D361657;
	Wed,  9 Oct 2019 08:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D361657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570602078;
	bh=BKwJ9YecFbNgy9/ZPFvIacoekH6/TPx9uDEOduWypIw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jcJg62gS2L2WnHmdAy2oF8hN5pPN0ZYau9jpUYyATdzD+RuSA4RH3DSShVAcWGPYE
	 dk6udufuRAtSPJlkUXkf/VEgKaGksGN3TZS9SDmM11svGtR3WIn8+36tqBXAF1FMrf
	 8yJWlOYdl7qOS3DnNjrEPffEZZ4QPOKUKXrPONIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F46F802FB;
	Wed,  9 Oct 2019 08:19:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33DD5F802BE; Wed,  9 Oct 2019 08:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5579DF80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 08:19:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5D493A003F;
 Wed,  9 Oct 2019 08:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5D493A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1570601967; bh=zG42OQO2ZyMUDelUpBMHzD1VC4FNl6/JWvYXzBTDX6Q=;
 h=From:To:Cc:Subject:Date:From;
 b=5uYniG8ax377mZiirFN1RYLFU3I/tya48wEq0csx1/vqgR2m9brRxu3mQzwO8knDn
 qOZGIr3paNxsya2pQu1cmz8ugkazojKZFzxBwX+OCNDi0uMJSwzpeWybYZ9zwd0o/q
 VFEfQlOybaIuZEGlu+1Qdd9DUpX4jffhMeS8HjkQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  9 Oct 2019 08:19:22 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Wed,  9 Oct 2019 08:19:07 +0200
Message-Id: <20191009061907.29152-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v4] ALSA: hda: add Intel DSP configuration /
	probe code
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

For distributions, we need one place where we can decide
which driver will be activated for the auto-configation of the
Intel's HDA hardware with DSP. Actually, we cover three drivers:

* Legacy HDA
* Intel SST
* Intel Sound Open Firmware (SOF)

All those drivers registers similar PCI IDs, so the first
driver probed from the PCI stack can win. But... it is not
guaranteed that the correct driver wins.

This commit changes Intel's NHLT ACPI module to a common
DSP probe module for the Intel's hardware. All above sound
drivers calls this code. The user can force another behaviour
using the module parameter 'dsp_driver' located in
the 'snd-intel-dspcfg' module.

This change allows to add specific dmi checks for the specific
systems. The examples are taken from the pull request:

  https://github.com/thesofproject/linux/pull/927

Tested on Lenovo Carbon X1 7th gen.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/intel-dsp-config.h |  34 +++++
 sound/hda/Kconfig                |  10 +-
 sound/hda/Makefile               |   4 +-
 sound/hda/intel-dsp-config.c     | 249 +++++++++++++++++++++++++++++++
 sound/hda/intel-nhlt.c           |   3 -
 sound/pci/hda/Kconfig            |  11 +-
 sound/pci/hda/hda_intel.c        |  49 ++----
 sound/soc/intel/Kconfig          |   2 +-
 sound/soc/intel/skylake/skl.c    |  19 +--
 sound/soc/sof/intel/Kconfig      |   2 +-
 sound/soc/sof/sof-pci-dev.c      |   6 +
 11 files changed, 321 insertions(+), 68 deletions(-)
 create mode 100644 include/sound/intel-dsp-config.h
 create mode 100644 sound/hda/intel-dsp-config.c

diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
new file mode 100644
index 000000000000..c36622bee3f8
--- /dev/null
+++ b/include/sound/intel-dsp-config.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  intel-dsp-config.h - Intel DSP config
+ *
+ *  Copyright (c) 2019 Jaroslav Kysela <perex@perex.cz>
+ */
+
+#ifndef __INTEL_DSP_CONFIG_H__
+#define __INTEL_DSP_CONFIG_H__
+
+struct pci_dev;
+
+enum {
+	SND_INTEL_DSP_DRIVER_ANY = 0,
+	SND_INTEL_DSP_DRIVER_LEGACY,
+	SND_INTEL_DSP_DRIVER_SST,
+	SND_INTEL_DSP_DRIVER_SOF,
+	SND_INTEL_DSP_DRIVER_LAST = SND_INTEL_DSP_DRIVER_SOF
+};
+
+#if IS_ENABLED(CONFIG_SND_INTEL_DSP_CONFIG)
+
+int snd_intel_dsp_driver_probe(struct pci_dev *pci);
+
+#else
+
+static inline int snd_intel_dsp_driver_probe(struct pci_dev *pci)
+{
+	return SND_INTEL_DSP_DRIVER_ANY;
+}
+
+#endif
+
+#endif
diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 3d33fc1757ba..b0c88fe040ee 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -34,6 +34,12 @@ config SND_HDA_PREALLOC_SIZE
 	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
 
 config SND_INTEL_NHLT
-	tristate
+	bool
 	# this config should be selected only for Intel ACPI platforms.
-	# A fallback is provided so that the code compiles in all cases.
\ No newline at end of file
+	# A fallback is provided so that the code compiles in all cases.
+
+config SND_INTEL_DSP_CONFIG
+	tristate
+	select SND_INTEL_NHLT if ACPI
+	# this config should be selected only for Intel DSP platforms.
+	# A fallback is provided so that the code compiles in all cases.
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index 8560f6ef1b19..e3903e8f2d97 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -14,5 +14,5 @@ obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
 #extended hda
 obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
 
-snd-intel-nhlt-objs := intel-nhlt.o
-obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o
+snd-intel-dspcfg-objs := intel-dsp-config.o intel-nhlt.o
+obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
new file mode 100644
index 000000000000..d9f6d9e872b4
--- /dev/null
+++ b/sound/hda/intel-dsp-config.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Jaroslav Kysela <perex@perex.cz>
+
+#include <linux/bits.h>
+#include <linux/dmi.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <sound/core.h>
+#include <sound/intel-dsp-config.h>
+#include <sound/intel-nhlt.h>
+
+static int dsp_driver;
+
+module_param(dsp_driver, int, 0444);
+MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
+
+#define FLAG_SST		BIT(0)
+#define FLAG_SOF		BIT(1)
+#define FLAG_SOF_ONLY_IF_DMIC	BIT(16)
+
+struct config_entry {
+	u32 flags;
+	u16 device;
+	const struct dmi_system_id *dmi_table;
+};
+
+/*
+ * configuration table
+ * - the order of similar PCI ID entries is important!
+ * - the first successful match will win
+ */
+static const struct config_entry config_table[] = {
+/* Cometlake-LP */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
+	{
+		/* prefer SST */
+		.flags = FLAG_SST,
+		.device = 0x02c8,
+	},
+#elif IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x02c8,
+	},
+#endif
+/* Cometlake-H */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
+	{
+		.flags = FLAG_SST,
+		.device = 0x06c8,
+	},
+#elif IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x06c8,
+	},
+#endif
+/* Merrifield */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x119a,
+	},
+#endif
+/* Broxton-T */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x1a98,
+	},
+#endif
+/* Geminilake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x3198,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
+	{
+		.flags = FLAG_SST,
+		.device = 0x3198,
+	},
+#endif
+/* Icelake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x34c8,
+	},
+#endif
+/* Elkhart Lake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x4b55,
+	},
+#endif
+/* Appololake (Broxton-P) */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x5a98,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Up Squared",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+					DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
+				}
+			},
+			{}
+		}
+	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
+	{
+		.flags = FLAG_SST,
+		.device = 0x5a98,
+	},
+#endif
+/* Cannonlake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x9dc8,
+	},
+#endif
+/* Sunrise Point-LP */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x9d70,
+	},
+#endif
+/* Kabylake-LP */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x9d71,
+	},
+#endif
+/* Tigerlake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0xa0c8,
+	},
+#endif
+/* Coffelake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0xa348,
+	},
+#endif
+};
+
+static const struct config_entry *snd_intel_dsp_find_config
+		(struct pci_dev *pci, const struct config_entry *table, u32 len)
+{
+	u16 device;
+
+	device = pci->device;
+	for (; len > 0; len--, table++) {
+		if (table->device != device)
+			continue;
+		if (table->dmi_table && !dmi_check_system(table->dmi_table))
+			continue;
+		return table;
+	}
+	return NULL;
+}
+
+static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
+{
+	struct nhlt_acpi_table *nhlt;
+	int ret = 0;
+
+	nhlt = intel_nhlt_init(&pci->dev);
+	if (nhlt) {
+		if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt))
+			ret = 1;
+		intel_nhlt_free(nhlt);
+	}
+	return ret;
+}
+
+int snd_intel_dsp_driver_probe(struct pci_dev *pci)
+{
+	const struct config_entry *cfg;
+
+	if (dsp_driver > 0 && dsp_driver <= SND_INTEL_DSP_DRIVER_LAST)
+		return dsp_driver;
+
+	/* Intel vendor only */
+	if (snd_BUG_ON(pci->vendor != 0x8086))
+		return SND_INTEL_DSP_DRIVER_ANY;
+
+	/*
+	 * detect DSP by checking class/subclass/prog-id information
+	 * class=04 subclass 03 prog-if 00: no DSP, use legacy driver
+	 * class=04 subclass 01 prog-if 00: DSP is present
+	 *  (and may be required e.g. for DMIC or SSP support)
+	 * class=04 subclass 03 prog-if 80: use DSP or legacy mode
+	 */
+	if (pci->class == 0x040300)
+		return SND_INTEL_DSP_DRIVER_LEGACY;
+	if (pci->class != 0x040100 && pci->class != 0x040380) {
+		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDA legacy driver\n", pci->class);
+		return SND_INTEL_DSP_DRIVER_LEGACY;
+	}
+
+	dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
+
+	/* find the configuration for the specific device */
+	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
+	if (!cfg)
+		return SND_INTEL_DSP_DRIVER_ANY;
+
+	if (cfg->flags & FLAG_SOF) {
+		if (cfg->flags & FLAG_SOF_ONLY_IF_DMIC) {
+			if (snd_intel_dsp_check_dmic(pci)) {
+				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
+				return SND_INTEL_DSP_DRIVER_SOF;
+			}
+		} else {
+			return SND_INTEL_DSP_DRIVER_SOF;
+		}
+	}
+
+	if (cfg->flags & FLAG_SST)
+		return SND_INTEL_DSP_DRIVER_SST;
+
+	return SND_INTEL_DSP_DRIVER_LEGACY;
+}
+EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel DSP config driver");
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index daede96f28ee..097ff6c10099 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -102,6 +102,3 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 	return dmic_geo;
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_get_dmic_geo);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel NHLT driver");
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index dae47a45b2b8..bd48335d09d7 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -12,7 +12,7 @@ config SND_HDA_INTEL
 	tristate "HD Audio PCI"
 	depends on SND_PCI
 	select SND_HDA
-	select SND_INTEL_NHLT if ACPI
+	select SND_INTEL_DSP_CONFIG
 	help
 	  Say Y here to include support for Intel "High Definition
 	  Audio" (Azalia) and its compatible devices.
@@ -23,15 +23,6 @@ config SND_HDA_INTEL
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-intel.
 
-config SND_HDA_INTEL_DETECT_DMIC
-	bool "DMIC detection and probe abort"
-	depends on SND_HDA_INTEL
-	help
-	  Say Y to detect digital microphones on SKL+ devices. DMICs
-	  cannot be handled by the HDaudio legacy driver and are
-	  currently only supported by the SOF driver.
-	  If unsure say N.
-
 config SND_HDA_TEGRA
 	tristate "NVIDIA Tegra HD Audio"
 	depends on ARCH_TEGRA
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 240f4ca76391..a916963822e0 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -46,7 +46,7 @@
 #include <sound/initval.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
-#include <sound/intel-nhlt.h>
+#include <sound/intel-dsp-config.h>
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/firmware.h>
@@ -124,7 +124,7 @@ static char *patch[SNDRV_CARDS];
 static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 					CONFIG_SND_HDA_INPUT_BEEP_MODE};
 #endif
-static bool dmic_detect = IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC);
+static bool dsp_driver = 1;
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
@@ -159,8 +159,9 @@ module_param_array(beep_mode, bool, NULL, 0444);
 MODULE_PARM_DESC(beep_mode, "Select HDA Beep registration mode "
 			    "(0=off, 1=on) (default=1).");
 #endif
-module_param(dmic_detect, bool, 0444);
-MODULE_PARM_DESC(dmic_detect, "DMIC detect on SKL+ platforms");
+module_param(dsp_driver, bool, 0444);
+MODULE_PARM_DESC(dsp_driver, "Allow DSP driver selection (bypass this driver) "
+			     "(0=off, 1=on) (default=1)");
 
 #ifdef CONFIG_PM
 static int param_set_xint(const char *val, const struct kernel_param *kp);
@@ -2020,25 +2021,6 @@ static const struct hda_controller_ops pci_hda_ops = {
 	.position_check = azx_position_check,
 };
 
-static int azx_check_dmic(struct pci_dev *pci, struct azx *chip)
-{
-	struct nhlt_acpi_table *nhlt;
-	int ret = 0;
-
-	if (chip->driver_type == AZX_DRIVER_SKL &&
-	    pci->class != 0x040300) {
-		nhlt = intel_nhlt_init(&pci->dev);
-		if (nhlt) {
-			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt)) {
-				ret = -ENODEV;
-				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, aborting probe\n");
-			}
-			intel_nhlt_free(nhlt);
-		}
-	}
-	return ret;
-}
-
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
@@ -2056,6 +2038,16 @@ static int azx_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
+	/*
+	 * stop probe if another Intel's DSP driver should be activated
+	 */
+	if (dsp_driver) {
+		err = snd_intel_dsp_driver_probe(pci);
+		if (err != SND_INTEL_DSP_DRIVER_ANY &&
+		    err != SND_INTEL_DSP_DRIVER_LEGACY)
+			return -ENODEV;
+	}
+
 	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
@@ -2069,17 +2061,6 @@ static int azx_probe(struct pci_dev *pci,
 	card->private_data = chip;
 	hda = container_of(chip, struct hda_intel, chip);
 
-	/*
-	 * stop probe if digital microphones detected on Skylake+ platform
-	 * with the DSP enabled. This is an opt-in behavior defined at build
-	 * time or at run-time with a module parameter
-	 */
-	if (dmic_detect) {
-		err = azx_check_dmic(pci, chip);
-		if (err < 0)
-			goto out_free;
-	}
-
 	pci_set_drvdata(pci, card);
 
 	err = register_vga_switcheroo(chip);
diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 01c99750212a..9ad89d56092b 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -215,7 +215,7 @@ config SND_SOC_INTEL_SKYLAKE_COMMON
 	select SND_SOC_INTEL_SST
 	select SND_SOC_HDAC_HDA if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
 	select SND_SOC_ACPI_INTEL_MATCH
-	select SND_INTEL_NHLT if ACPI
+	select SND_INTEL_DSP_CONFIG
 	help
 	  If you have a Intel Skylake/Broxton/ApolloLake/KabyLake/
 	  GeminiLake or CannonLake platform with the DSP enabled in the BIOS
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 141dbbf975ac..58ba3e9469ba 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -27,6 +27,7 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_codec.h>
 #include <sound/intel-nhlt.h>
+#include <sound/intel-dsp-config.h>
 #include "skl.h"
 #include "skl-sst-dsp.h"
 #include "skl-sst-ipc.h"
@@ -987,22 +988,10 @@ static int skl_probe(struct pci_dev *pci,
 
 	switch (skl_pci_binding) {
 	case SND_SKL_PCI_BIND_AUTO:
-		/*
-		 * detect DSP by checking class/subclass/prog-id information
-		 * class=04 subclass 03 prog-if 00: no DSP, use legacy driver
-		 * class=04 subclass 01 prog-if 00: DSP is present
-		 *   (and may be required e.g. for DMIC or SSP support)
-		 * class=04 subclass 03 prog-if 80: use DSP or legacy mode
-		 */
-		if (pci->class == 0x040300) {
-			dev_info(&pci->dev, "The DSP is not enabled on this platform, aborting probe\n");
+		err = snd_intel_dsp_driver_probe(pci);
+		if (err != SND_INTEL_DSP_DRIVER_ANY &&
+		    err != SND_INTEL_DSP_DRIVER_SST)
 			return -ENODEV;
-		}
-		if (pci->class != 0x040100 && pci->class != 0x040380) {
-			dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, aborting probe\n", pci->class);
-			return -ENODEV;
-		}
-		dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
 		break;
 	case SND_SKL_PCI_BIND_LEGACY:
 		dev_info(&pci->dev, "Module parameter forced binding with HDaudio legacy, aborting probe\n");
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 479ba249e219..8a5d5c0f95f2 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -286,7 +286,7 @@ config SND_SOC_SOF_HDA
 	tristate
 	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
 	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
-	select SND_INTEL_NHLT if ACPI
+	select SND_INTEL_DSP_CONFIG
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index d66412a77873..3a9e0e2a150d 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
+#include <sound/intel-dsp-config.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/sof.h>
@@ -277,6 +278,11 @@ static int sof_pci_probe(struct pci_dev *pci,
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
 
+	ret = snd_intel_dsp_driver_probe(pci);
+	if (ret != SND_INTEL_DSP_DRIVER_ANY &&
+	    ret != SND_INTEL_DSP_DRIVER_SOF)
+		return -ENODEV;
+
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
 	/* get ops for platform */
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
