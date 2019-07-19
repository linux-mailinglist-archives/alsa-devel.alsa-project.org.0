Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602106EBB2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 22:41:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA331703;
	Fri, 19 Jul 2019 22:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA331703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563568902;
	bh=I8oiVgNOKTvCurDWum37fVoy8dlUT/hzuFue04vb0wU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFLpG0KuG4xSr26DwnSWnzmLB72wLvlatquB+rVA16vsc9MItaKYPzTviJ1khGoZ5
	 hFZUVpwAk/Wu/xqZWusKHwq+0SeikWx7l3sR9/d6BdwhhRAMrYNjh5+fz0/14jGpZF
	 rvN/R5g6qzQu+7/gJv+a79cE4Jcx3fnmSUHlL6U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7324FF80448;
	Fri, 19 Jul 2019 22:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79ED0F803CF; Fri, 19 Jul 2019 22:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C73F800C4
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 22:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C73F800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 13:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="176389793"
Received: from hesheppa-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.92.1])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2019 13:37:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 15:37:52 -0500
Message-Id: <20190719203752.11151-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
References: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH v2 5/5] ALSA: hda/intel: stop probe if DMICS
	are detected on Skylake+ platforms
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

The legacy HD-Audio driver cannot handle Skylake+ platforms with
digital microphones. For those platforms, the SOF or SST drivers need
to be used.

This patch provides an automatic way of detecting the presence of
DMICs using NHTL information reported by the BIOS. A kernel kconfig
option or a kernel module parameter provide an opt-in means of
stopping the probe. The kernel would then look for an alternate driver
registered for the same PCI ID to probe.

With this capability, distros no longer have to blacklist
snd-hda-intel, but still need to make sure the SOF/SST drivers are
functional by providing the relevant firmware and topology files in
/lib/firmware/intel

The coexistence between SOF and SST drivers and their dynamic
detection is not addressed by this patch, different mechanisms need to
be used, e.g. DMI-based quirks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/Kconfig     | 10 ++++++++++
 sound/pci/hda/hda_intel.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 35d934309cb2..b5966014b5f7 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -12,6 +12,7 @@ config SND_HDA_INTEL
 	tristate "HD Audio PCI"
 	depends on SND_PCI
 	select SND_HDA
+	select SND_INTEL_NHLT if ACPI
 	help
 	  Say Y here to include support for Intel "High Definition
 	  Audio" (Azalia) and its compatible devices.
@@ -22,6 +23,15 @@ config SND_HDA_INTEL
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-intel.
 
+config SND_HDA_INTEL_DETECT_DMIC
+	bool "DMIC detection and probe abort"
+	depends on SND_HDA_INTEL
+	help
+	  Say Y to detect digital microphones on SKL+ devices. DMICs
+	  cannot be handled by the HDaudio legacy driver and are
+	  currently only supported by the SOF driver.
+	  If unsure say N.
+
 config SND_HDA_TEGRA
 	tristate "NVIDIA Tegra HD Audio"
 	depends on ARCH_TEGRA
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index cb8b0945547c..ae9c13248a1d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -46,6 +46,7 @@
 #include <sound/initval.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
+#include <sound/intel-nhlt.h>
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/firmware.h>
@@ -124,6 +125,7 @@ static char *patch[SNDRV_CARDS];
 static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 					CONFIG_SND_HDA_INPUT_BEEP_MODE};
 #endif
+static bool dmic_detect = IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC);
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
@@ -158,6 +160,8 @@ module_param_array(beep_mode, bool, NULL, 0444);
 MODULE_PARM_DESC(beep_mode, "Select HDA Beep registration mode "
 			    "(0=off, 1=on) (default=1).");
 #endif
+module_param(dmic_detect, bool, 0444);
+MODULE_PARM_DESC(dmic_detect, "DMIC detect on SKL+ platforms");
 
 #ifdef CONFIG_PM
 static int param_set_xint(const char *val, const struct kernel_param *kp);
@@ -2025,6 +2029,25 @@ static const struct hda_controller_ops pci_hda_ops = {
 	.position_check = azx_position_check,
 };
 
+static int azx_check_dmic(struct pci_dev *pci, struct azx *chip)
+{
+	struct nhlt_acpi_table *nhlt;
+	int ret = 0;
+
+	if (chip->driver_type == AZX_DRIVER_SKL &&
+	    pci->class != 0x040300) {
+		nhlt = intel_nhlt_init(&pci->dev);
+		if (nhlt) {
+			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt)) {
+				ret = -ENODEV;
+				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, aborting probe\n");
+			}
+			intel_nhlt_free(nhlt);
+		}
+	}
+	return ret;
+}
+
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
@@ -2055,6 +2078,17 @@ static int azx_probe(struct pci_dev *pci,
 	card->private_data = chip;
 	hda = container_of(chip, struct hda_intel, chip);
 
+	/*
+	 * stop probe if digital microphones detected on Skylake+ platform
+	 * with the DSP enabled. This is an opt-in behavior defined at build
+	 * time or at run-time with a module parameter
+	 */
+	if (dmic_detect) {
+		err = azx_check_dmic(pci, chip);
+		if (err < 0)
+			goto out_free;
+	}
+
 	pci_set_drvdata(pci, card);
 
 	err = register_vga_switcheroo(chip);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
