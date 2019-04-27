Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB522B427
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 19:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7183A15EC;
	Sat, 27 Apr 2019 19:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7183A15EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556387996;
	bh=Vu1gec5JWyiPhJAzTKK6Vq0J5X4kR/7oqhXtRufvihs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IaFzxS283J60wyk29JsBx19D60b5q+3wE3/3iL7HUxCwSkPZte7DnsvRS1GOxKt+2
	 EBiYpnVYr8i8v2NXAvqnqmf6ykgfGZf9frfXJBCy5bskMwzFAZ3L4cCMFRjTcgtBCl
	 +WycY8aWed9GuOBvcGoraQhLR5Gt8DCY0XuzFZnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7D2F8975B;
	Sat, 27 Apr 2019 19:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D64BF896DE; Sat, 27 Apr 2019 19:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8927FF896DD;
 Sat, 27 Apr 2019 19:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8927FF896DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="u29LWhX2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=NOkmFKnF2LL3tBUFsZEFxDyfGz/SzV8Nl3Fa6hHle10=; b=u29LWhX2N3j9
 pwqzXBxqHSiaCgg7YUi+7L8PDpkKxGefLkXkIOc6VErSpZG6M6zuwTD2ilFpm9EyVA02b7OneAjj3
 cKhvmEMegAHl9mrrJGTCQsYaa7KC8YQhW0IpRU+gVOlw/FfSYB2RC1lNZ+uZ3B4qk5BOEUx+QT1qu
 dz2yA=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVD-0004nr-AL; Sat, 27 Apr 2019 17:52:44 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 09A11441D3D; Sat, 27 Apr 2019 18:52:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-20-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175240.09A11441D3D@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:39 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add Build support for SOF core and
	Intel drivers" to the asoc tree
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

   ASoC: SOF: Add Build support for SOF core and Intel drivers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 7e978fa37df7f771a5d02934ff828a0ee36bcf11 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:09:02 -0500
Subject: [PATCH] ASoC: SOF: Add Build support for SOF core and Intel drivers

Build SOF core and Intel-specific drivers.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/Kconfig            |   1 +
 sound/soc/Makefile           |   1 +
 sound/soc/sof/Kconfig        | 141 +++++++++++++++++++++
 sound/soc/sof/Makefile       |  18 +++
 sound/soc/sof/intel/Kconfig  | 230 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/Makefile |  19 +++
 6 files changed, 410 insertions(+)
 create mode 100644 sound/soc/sof/Kconfig
 create mode 100644 sound/soc/sof/Makefile
 create mode 100644 sound/soc/sof/intel/Kconfig
 create mode 100644 sound/soc/sof/intel/Makefile

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index aa35940f5c50..297be0ca3dbc 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -63,6 +63,7 @@ source "sound/soc/rockchip/Kconfig"
 source "sound/soc/samsung/Kconfig"
 source "sound/soc/sh/Kconfig"
 source "sound/soc/sirf/Kconfig"
+source "sound/soc/sof/Kconfig"
 source "sound/soc/spear/Kconfig"
 source "sound/soc/sprd/Kconfig"
 source "sound/soc/sti/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 974fb9821e17..d90ce8a32887 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_SND_SOC)	+= rockchip/
 obj-$(CONFIG_SND_SOC)	+= samsung/
 obj-$(CONFIG_SND_SOC)	+= sh/
 obj-$(CONFIG_SND_SOC)	+= sirf/
+obj-$(CONFIG_SND_SOC)	+= sof/
 obj-$(CONFIG_SND_SOC)	+= spear/
 obj-$(CONFIG_SND_SOC)	+= sprd/
 obj-$(CONFIG_SND_SOC)	+= sti/
diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
new file mode 100644
index 000000000000..eaa380092c3b
--- /dev/null
+++ b/sound/soc/sof/Kconfig
@@ -0,0 +1,141 @@
+config SND_SOC_SOF_TOPLEVEL
+	bool "Sound Open Firmware Support"
+	help
+	  This adds support for Sound Open Firmware (SOF). SOF is a free and
+	  generic open source audio DSP firmware for multiple devices.
+	  Say Y if you have such a device that is supported by SOF.
+	  If unsure select "N".
+
+if SND_SOC_SOF_TOPLEVEL
+
+config SND_SOC_SOF_PCI
+	tristate "SOF PCI enumeration support"
+	depends on PCI
+	select SND_SOC_SOF
+	select SND_SOC_ACPI if ACPI
+	select SND_SOC_SOF_OPTIONS
+	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
+	help
+	  This adds support for PCI enumeration. This option is
+	  required to enable Intel Skylake+ devices
+	  Say Y if you need this option
+	  If unsure select "N".
+
+config SND_SOC_SOF_ACPI
+	tristate "SOF ACPI enumeration support"
+	depends on ACPI || COMPILE_TEST
+	select SND_SOC_SOF
+	select SND_SOC_ACPI if ACPI
+	select SND_SOC_SOF_OPTIONS
+	select SND_SOC_SOF_INTEL_ACPI if SND_SOC_SOF_INTEL_TOPLEVEL
+	select IOSF_MBI if X86
+	help
+	  This adds support for ACPI enumeration. This option is required
+	  to enable Intel Haswell/Broadwell/Baytrail/Cherrytrail devices
+	  Say Y if you need this option
+	  If unsure select "N".
+
+config SND_SOC_SOF_OPTIONS
+	tristate
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+if SND_SOC_SOF_OPTIONS
+
+config SND_SOC_SOF_NOCODEC
+	tristate "SOF nocodec mode Support"
+	help
+	  This adds support for a dummy/nocodec machine driver fallback
+	  option if no known codec is detected. This is typically only
+	  enabled for developers or devices where the sound card is
+	  controlled externally
+	  Say Y if you need this nocodec fallback option
+	  If unsure select "N".
+
+config SND_SOC_SOF_DEBUG
+	bool "SOF debugging features"
+	help
+	  This option can be used to enable or disable individual SOF firmware
+	  and driver debugging options.
+	  Say Y if you are debugging SOF FW or drivers.
+	  If unsure select "N".
+
+if SND_SOC_SOF_DEBUG
+
+config SND_SOC_SOF_FORCE_NOCODEC_MODE
+	bool "SOF force nocodec Mode"
+	depends on SND_SOC_SOF_NOCODEC
+	help
+	  This forces SOF to use dummy/nocodec as machine driver, even
+	  though there is a codec detected on the real platform. This is
+	  typically only enabled for developers for debug purposes, before
+	  codec/machine driver is ready, or to exclude the impact of those
+	  drivers
+	  Say Y if you need this force nocodec mode option
+	  If unsure select "N".
+
+config SND_SOC_SOF_DEBUG_XRUN_STOP
+	bool "SOF stop on XRUN"
+	help
+	  This option forces PCMs to stop on any XRUN event. This is useful to
+	  preserve any trace data ond pipeline status prior to the XRUN.
+	  Say Y if you are debugging SOF FW pipeline XRUNs.
+	  If unsure select "N".
+
+config SND_SOC_SOF_DEBUG_VERBOSE_IPC
+	bool "SOF verbose IPC logs"
+	help
+	  This option enables more verbose IPC logs, with command types in
+	  human-readable form instead of just 32-bit hex dumps. This is useful
+	  if you are trying to debug IPC with the DSP firmware.
+	  If unsure select "N".
+
+config SND_SOC_SOF_DEBUG_FORCE_IPC_POSITION
+	bool "SOF force to use IPC for position update on SKL+"
+	help
+	  This option force to handle stream position update IPCs and run pcm
+	  elapse to inform ALSA about that, on platforms (e.g. Intel SKL+) that
+	  with other approach (e.g. HDAC DPIB/posbuf) to elapse PCM.
+	  On platforms (e.g. Intel SKL-) where position update IPC is the only
+	  one choice, this setting won't impact anything.
+	  if you are trying to debug pointer update with position IPCs or where
+	  DPIB/posbuf is not ready, select "Y".
+	  If unsure select "N".
+
+config SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE
+	bool "SOF enable debugfs caching"
+	help
+	  This option enables caching of debugfs
+	  memory -> DSP resource (memory, register, etc)
+	  before the audio DSP is suspended. This will increase the suspend
+	  latency and therefore should be used for debug purposes only.
+	  Say Y if you want to enable caching the memory windows.
+	  If unsure, select "N".
+
+endif ## SND_SOC_SOF_DEBUG
+
+endif ## SND_SOC_SOF_OPTIONS
+
+config SND_SOC_SOF
+	tristate
+	select SND_SOC_TOPOLOGY
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+	  The selection is made at the top level and does not exactly follow
+	  module dependencies but since the module or built-in type is decided
+	  at the top level it doesn't matter.
+
+config SND_SOC_SOF_PROBE_WORK_QUEUE
+	bool
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+	  When selected, the probe is handled in two steps, for example to
+	  avoid lockdeps if request_module is used in the probe.
+
+source "sound/soc/sof/intel/Kconfig"
+source "sound/soc/sof/xtensa/Kconfig"
+
+endif
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
new file mode 100644
index 000000000000..8f14c9d2950b
--- /dev/null
+++ b/sound/soc/sof/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+
+snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
+		control.o trace.o utils.o
+
+snd-sof-pci-objs := sof-pci-dev.o
+snd-sof-acpi-objs := sof-acpi-dev.o
+snd-sof-nocodec-objs := nocodec.o
+
+obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
+obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
+
+
+obj-$(CONFIG_SND_SOC_SOF_ACPI) += sof-acpi-dev.o
+obj-$(CONFIG_SND_SOC_SOF_PCI) += sof-pci-dev.o
+
+obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
+obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
new file mode 100644
index 000000000000..32ee0fabab92
--- /dev/null
+++ b/sound/soc/sof/intel/Kconfig
@@ -0,0 +1,230 @@
+config SND_SOC_SOF_INTEL_TOPLEVEL
+	bool "SOF support for Intel audio DSPs"
+	depends on X86 || COMPILE_TEST
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+if SND_SOC_SOF_INTEL_TOPLEVEL
+
+config SND_SOC_SOF_INTEL_ACPI
+	tristate
+	select SND_SOC_SOF_BAYTRAIL  if SND_SOC_SOF_BAYTRAIL_SUPPORT
+	select SND_SOC_SOF_BROADWELL if SND_SOC_SOF_BROADWELL_SUPPORT
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_INTEL_PCI
+	tristate
+	select SND_SOC_SOF_MERRIFIELD  if SND_SOC_SOF_MERRIFIELD_SUPPORT
+	select SND_SOC_SOF_APOLLOLAKE  if SND_SOC_SOF_APOLLOLAKE_SUPPORT
+	select SND_SOC_SOF_GEMINILAKE  if SND_SOC_SOF_GEMINILAKE_SUPPORT
+	select SND_SOC_SOF_CANNONLAKE  if SND_SOC_SOF_CANNONLAKE_SUPPORT
+	select SND_SOC_SOF_COFFEELAKE  if SND_SOC_SOF_COFFEELAKE_SUPPORT
+	select SND_SOC_SOF_ICELAKE     if SND_SOC_SOF_ICELAKE_SUPPORT
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_INTEL_HIFI_EP_IPC
+	tristate
+	help
+          This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
+	tristate
+	select SND_SOC_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_INTEL_COMMON
+	tristate
+	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_SOC_SOF_XTENSA
+	select SND_SOC_INTEL_MACH
+	select SND_SOC_ACPI if ACPI
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+if SND_SOC_SOF_INTEL_ACPI
+
+config SND_SOC_SOF_BAYTRAIL_SUPPORT
+	bool "SOF support for Baytrail, Braswell and Cherrytrail"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Baytrail, Braswell or Cherrytrail processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_BAYTRAIL
+	tristate
+	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_BROADWELL_SUPPORT
+	bool "SOF support for Broadwell"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Broadwell processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_BROADWELL
+	tristate
+	select SND_SOC_SOF_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+endif ## SND_SOC_SOF_INTEL_ACPI
+
+if SND_SOC_SOF_INTEL_PCI
+
+config SND_SOC_SOF_MERRIFIELD_SUPPORT
+	bool "SOF support for Tangier/Merrifield"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Tangier/Merrifield processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_MERRIFIELD
+	tristate
+	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_APOLLOLAKE_SUPPORT
+	bool "SOF support for Apollolake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Apollolake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_APOLLOLAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_GEMINILAKE_SUPPORT
+	bool "SOF support for GeminiLake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Geminilake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_GEMINILAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_CANNONLAKE_SUPPORT
+	bool "SOF support for Cannonlake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Cannonlake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_CANNONLAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_COFFEELAKE_SUPPORT
+	bool "SOF support for CoffeeLake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Coffeelake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_COFFEELAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_ICELAKE_SUPPORT
+	bool "SOF support for Icelake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Icelake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_ICELAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_HDA_COMMON
+	tristate
+	select SND_SOC_SOF_INTEL_COMMON
+	select SND_SOC_SOF_HDA_LINK_BASELINE
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+if SND_SOC_SOF_HDA_COMMON
+
+config SND_SOC_SOF_HDA_LINK
+	bool "SOF support for HDA Links(HDA/HDMI)"
+	depends on SND_SOC_SOF_NOCODEC=n
+	select SND_SOC_SOF_PROBE_WORK_QUEUE
+	help
+	  This adds support for HDA links(HDA/HDMI) with Sound Open Firmware
+		  for Intel(R) platforms.
+	  Say Y if you want to enable HDA links with SOF.
+	  If unsure select "N".
+
+config SND_SOC_SOF_HDA_AUDIO_CODEC
+	bool "SOF support for HDAudio codecs"
+	depends on SND_SOC_SOF_HDA_LINK
+	help
+	  This adds support for HDAudio codecs with Sound Open Firmware
+		  for Intel(R) platforms.
+	  Say Y if you want to enable HDAudio codecs with SOF.
+	  If unsure select "N".
+
+endif ## SND_SOC_SOF_HDA_COMMON
+
+config SND_SOC_SOF_HDA_LINK_BASELINE
+	tristate
+	select SND_SOC_SOF_HDA if SND_SOC_SOF_HDA_LINK
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_HDA
+	tristate
+	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
+	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+endif ## SND_SOC_SOF_INTEL_PCI
+
+endif ## SND_SOC_SOF_INTEL_TOPLEVEL
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
new file mode 100644
index 000000000000..b8f58e006e29
--- /dev/null
+++ b/sound/soc/sof/intel/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+
+snd-sof-intel-byt-objs := byt.o
+snd-sof-intel-bdw-objs := bdw.o
+
+snd-sof-intel-ipc-objs := intel-ipc.o
+
+snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
+				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
+				 hda-dai.o hda-bus.o \
+				 apl.o cnl.o
+
+snd-sof-intel-hda-objs := hda-codec.o
+
+obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-intel-byt.o
+obj-$(CONFIG_SND_SOC_SOF_BROADWELL) += snd-sof-intel-bdw.o
+obj-$(CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC) += snd-sof-intel-ipc.o
+obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
+obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
