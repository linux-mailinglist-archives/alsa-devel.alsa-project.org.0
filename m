Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6610241DF3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 18:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B6FB165E;
	Tue, 11 Aug 2020 18:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B6FB165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597162472;
	bh=H/HhnVxxGtkfTjxqvE5TSiMDWQayKKG/SMzMso2B1/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLggGpG7ZPkrKu8M59fshGsfqb7ij/EZFxNAQoKb+ZnPsSJRGP6VHfoA7+88429pN
	 1JTi1tCRuiZqicMI0h8HiliO4yQCQip7go5zxThOTfdKtQmx5SwpokKhrcL6cM8BKL
	 MGM5L+VKZTjop/ln/YBFsRrictCdAXbAmjZ3LYwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44E3AF80343;
	Tue, 11 Aug 2020 18:07:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E84AF802FE; Tue, 11 Aug 2020 18:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6CC5F8014C
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 18:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6CC5F8014C
IronPort-SDR: rfrD6LO/av+4b0NDtXm31/AAXoqVKM5cJV3NDiF39l7eqr0szIfXGMnjpXswjcd+qvfFnMiqqC
 zr4ksUr7Pudw==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="153734054"
X-IronPort-AV: E=Sophos;i="5.76,300,1592895600"; d="scan'208";a="153734054"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 09:07:09 -0700
IronPort-SDR: d2bhCfG82Cgn9plAl9DJk74cj4QKfbdk5ax2LDq8iqiB7P3t/AORfzGh1fFiGFKG92qOAMqwuP
 RKzjjuPSlcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,300,1592895600"; d="scan'208";a="317777805"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 09:07:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 09/13] ASoC: Intel: Select catpt and deprecate haswell
Date: Tue, 11 Aug 2020 18:06:06 +0200
Message-Id: <20200811160610.32735-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811160610.32735-1-cezary.rojewski@intel.com>
References: <20200811160610.32735-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

Prevent sound/soc/intel/haswell code compile and select catpt instead as
a recommended solution. Userspace-exposed members are compatible with
what is exposed by deprecated solution thus no harm is done. The only
visible difference is the newly added 'Loopback Mute' kcontrol.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        | 22 +++++++++++-----------
 sound/soc/intel/Makefile       |  2 +-
 sound/soc/intel/boards/Kconfig |  8 ++++----
 sound/soc/intel/catpt/Makefile |  6 ++++++
 4 files changed, 22 insertions(+), 16 deletions(-)
 create mode 100644 sound/soc/intel/catpt/Makefile

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 82805a8681e5..4a18e8f83eeb 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -47,21 +47,21 @@ config SND_SOC_INTEL_SST_FIRMWARE
 	# Haswell/Broadwell/Baytrail legacy and will be set
 	# when these platforms are enabled
 
-config SND_SOC_INTEL_HASWELL
-	tristate "Haswell/Broadwell Platforms"
+config SND_SOC_INTEL_CATPT
+	tristate "Haswell and Broadwell"
 	depends on SND_DMA_SGBUF
 	depends on DMADEVICES && ACPI
-	select SND_SOC_INTEL_SST
-	select SND_SOC_INTEL_SST_ACPI
-	select SND_SOC_INTEL_SST_FIRMWARE
+	select DW_DMAC_CORE
 	select SND_SOC_ACPI_INTEL_MATCH
 	help
-	  If you have a Intel Haswell or Broadwell platform connected to
-	  an I2S codec, then enable this option by saying Y or m. This is
-	  typically used for Chromebooks. This is a recommended option.
-	  This option is mutually exclusive with the SOF support on
-	  Broadwell. If you want to enable SOF on Broadwell, you need to
-	  deselect this option first.
+	  Enable support for Intel(R) Haswell and Broadwell platforms
+	  with I2S codec present. This is a recommended option.
+	  Say Y or m if you have such device.
+	  If unsure, say N.
+
+config SND_SOC_INTEL_HASWELL
+	tristate
+	select SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_BAYTRAIL
 	tristate "Baytrail (legacy) Platforms"
diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 04ee48204fc9..c88c615f85f7 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -3,9 +3,9 @@
 obj-$(CONFIG_SND_SOC) += common/
 
 # Platform Support
-obj-$(CONFIG_SND_SOC_INTEL_HASWELL) += haswell/
 obj-$(CONFIG_SND_SOC_INTEL_BAYTRAIL) += baytrail/
 obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
+obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
 obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
 obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
 
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d96fc1313434..f4358c33059b 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -26,7 +26,7 @@ config SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES
 	  interface.
 	  If unsure select N.
 
-if SND_SOC_INTEL_HASWELL
+if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
 	tristate "Haswell Lynxpoint"
@@ -40,9 +40,9 @@ config SND_SOC_INTEL_HASWELL_MACH
 	  Say Y or m if you have such a device.
 	  If unsure select "N".
 
-endif ## SND_SOC_INTEL_HASWELL
+endif ## SND_SOC_INTEL_CATPT
 
-if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
+if SND_SOC_INTEL_CATPT || SND_SOC_SOF_BROADWELL
 
 config SND_SOC_INTEL_BDW_RT5650_MACH
 	tristate "Broadwell with RT5650 codec"
@@ -83,7 +83,7 @@ config SND_SOC_INTEL_BROADWELL_MACH
 	  Ultrabook platforms.
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
-endif ## SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
+endif ## SND_SOC_INTEL_CATPT || SND_SOC_SOF_BROADWELL
 
 if SND_SOC_INTEL_BAYTRAIL
 
diff --git a/sound/soc/intel/catpt/Makefile b/sound/soc/intel/catpt/Makefile
new file mode 100644
index 000000000000..0717190106d9
--- /dev/null
+++ b/sound/soc/intel/catpt/Makefile
@@ -0,0 +1,6 @@
+snd-soc-catpt-objs := device.o dsp.o loader.o ipc.o messages.o pcm.o fs.o
+
+# tell define_trace.h where to find the trace header
+CFLAGS_device.o := -I$(src)
+
+obj-$(CONFIG_SND_SOC_INTEL_CATPT) += snd-soc-catpt.o
-- 
2.17.1

