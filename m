Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7F1CD071
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 05:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D6715E4;
	Mon, 11 May 2020 05:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D6715E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589167998;
	bh=wgtV58CgVrAhWp1/Sl8bx6uIdQUbsWhZ1skPMEEHBHo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkEjgXrI+ZpPRUxY4D6CjH9YoQ76v3EZgGeAB3OnHmFmTloeA+SNMuE3EEknYkCDb
	 l+Vu3cBvOco5O/ag7muIqPTeh1iR1ILxFEQ08CVEP4NmfwDErded6F4899M92DnVZ/
	 K2UX9+O8GPymKgBtii2ach0ZrDhZz7gfcTKzdtEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4DE1F800E3;
	Mon, 11 May 2020 05:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0415FF802A8; Mon, 11 May 2020 05:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10019F801F2
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 05:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10019F801F2
IronPort-SDR: XvoUgjKt/454FKAk9HQSgqW56k9buJTEyWd1bB6nubLkUtSuBRDdIH8m0+28DnpD8ub2ebbDEb
 qFxsZYoeLLaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2020 20:28:55 -0700
IronPort-SDR: yC8r2tBV5ROuMOeSXZxfwtj4MP29tz64nAcD0TaUEOHotyyUl2/VwMHPtcwR5MWeilMXiT9lD/
 E4GUtUSfZxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,378,1583222400"; d="scan'208";a="265024252"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2020 20:28:54 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 3/4] ASoC: Intel: Add makefiles and kconfig changes for KeemBay
Date: Mon, 11 May 2020 11:16:03 +0800
Message-Id: <1589166964-8985-4-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
References: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

Add makefile and kconfig changes for KeemBay tlv320aic3204
machine driver and kmb_platform driver.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 sound/soc/intel/Kconfig         |  7 +++++++
 sound/soc/intel/Makefile        |  1 +
 sound/soc/intel/boards/Kconfig  | 15 +++++++++++++++
 sound/soc/intel/boards/Makefile |  4 ++++
 4 files changed, 27 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c8de0bb..bc93448 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -244,6 +244,13 @@ config SND_SOC_ACPI_INTEL_MATCH
 
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
+config SND_SOC_INTEL_KEEMBAY
+	tristate "Keembay Platforms"
+	depends on OF && (ARM64 || COMPILE_TEST)
+	depends on COMMON_CLK
+	help
+	  If you have a Intel Keembay platform then enable this option
+	  by saying Y or m.
 
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 8160520..f5aa32b 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SND_SOC_INTEL_HASWELL) += haswell/
 obj-$(CONFIG_SND_SOC_INTEL_BAYTRAIL) += baytrail/
 obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
 obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
+obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
 
 # Machine support
 obj-$(CONFIG_SND_SOC) += boards/
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 556c310..45f9fe5 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -549,3 +549,18 @@ endif
 
 
 endif ## SND_SOC_INTEL_MACH
+
+if SND_SOC_INTEL_KEEMBAY
+
+config SND_SOC_INTEL_KEEMBAY_TLV320AIC3204_MACH
+	tristate "Keembay with TLV320AIC3204 codec"
+	depends on ARM64 || COMPILE_TEST
+	depends on I2C
+	select SND_SOC_TLV320AIC32X4
+	select SND_SOC_TLV320AIC32X4_I2C
+	help
+	  This adds support for ASoC machine driver for Intel Keembay platforms
+	  with TLV320AIC3204 codec.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+endif ## SND_SOC_INTEL_KEEMBAY
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 1ef6e60..7201d07 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -69,3 +69,7 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ss
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
+
+# Intel KeemBay Machine
+snd-soc-keembay_tlv3204-objs := kmb_tlv3204.o
+obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY_TLV320AIC3204_MACH) += snd-soc-keembay_tlv3204.o
-- 
1.9.1

