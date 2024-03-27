Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEFB88EB21
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C662B2C07;
	Wed, 27 Mar 2024 17:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C662B2C07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556765;
	bh=E/Sw6yfNhO+wiLFHbAf7k9G0lNRo/XtctqLltSqgEeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qh0CKfdWJ9PnzdtCc1ACT0g6oWLhV05wDMUoNG9jGrgGrKNx6M8X4W8YyR9hJUqzL
	 78g7UxJo+AQTzmpaqTzIrg30Mm+OQKVMndnbvoQ/ALgG/qonvKYBKTpHbHjGbmMAD3
	 pmq41YU2YGy2PJQFDIWMii0ZfAVxqiDQLT+X3HNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E47F80621; Wed, 27 Mar 2024 17:24:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9A1F80616;
	Wed, 27 Mar 2024 17:24:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5A54F80563; Wed, 27 Mar 2024 17:24:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C696F80563
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C696F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ngiLtV6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556676; x=1743092676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E/Sw6yfNhO+wiLFHbAf7k9G0lNRo/XtctqLltSqgEeQ=;
  b=ngiLtV6C5x/aWgahxTcCpQwOIsE/gMXOflVydGthe0F8kh20yps30lXM
   ofiX4XKgEZNENJu9WkjWu6yedL12qJ28PKdkuuGXzcOwTEw0jKNy8XPt9
   SU4Zu+QDuAXfbs1TgWr94SYY4J1jnj4Xut3FPTmhEwcTPSRJ1vGEcMWkt
   BHoM7oV7wG2TkZfmtqoNBSzr0CNBPhuIbRCNIv3BMiL7M5+l7u5saMecS
   6eD1iW+pYAqXoFwknO1CCa3zM+/ihCtUPcRAvL61CufGUvX0olsWHZw5r
   yCZuIBjC2I3V1icFr6O/DZIQomua4lOfNpkJlOqQw66gJiZnmlI51m6ku
   w==;
X-CSE-ConnectionGUID: 67UHXYDwSK28Bsp86to4Qw==
X-CSE-MsgGUID: EQaNuvWISryXV2pP866nsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221503"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821271"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/18] ASoC: Intel: ssp-common: delete module
Date: Wed, 27 Mar 2024 11:23:55 -0500
Message-Id: <20240327162408.63953-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZR2G2QAZW3WN42FM7EKTAMXCHPTPPLGL
X-Message-ID-Hash: ZR2G2QAZW3WN42FM7EKTAMXCHPTPPLGL
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZR2G2QAZW3WN42FM7EKTAMXCHPTPPLGL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Moving all code to snd-soc-acpi-intel-match module and remove the
snd-soc-acpi-intel-ssp-common module.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig                            |  6 ------
 sound/soc/intel/boards/Kconfig                     | 10 +++++-----
 sound/soc/intel/boards/sof_board_helpers.c         |  2 +-
 sound/soc/intel/common/Makefile                    |  5 ++---
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c |  6 +++---
 5 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index e17d1a517567..4b9e498e3303 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -197,12 +197,6 @@ config SND_SOC_ACPI_INTEL_MATCH
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
 
-config SND_SOC_ACPI_INTEL_SSP_COMMON
-	tristate
-	select SND_SOC_ACPI if ACPI
-	# this option provides helpers to detect codec type and is not meant
-	# to be selected by the user.
-
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_INTEL_KEEMBAY
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4d6ef68da130..9f4a85513702 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -500,7 +500,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5650 or rt5682 codec.
@@ -518,7 +518,7 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with cs42l42 codec.
@@ -571,7 +571,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with nau8825 codec.
@@ -623,7 +623,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with Dialog DA7219 I2S audio codec.
@@ -643,7 +643,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
-	select SND_SOC_ACPI_INTEL_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with RT1308/CS35L41 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index ba5be5423626..eb140e13153f 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -635,4 +635,4 @@ MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_SSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index dcd552d815a2..a86457674726 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -15,8 +15,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
 
+snd-soc-acpi-intel-match-objs += soc-acpi-intel-ssp-common.o
+
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
-
-snd-soc-acpi-intel-ssp-common-objs += soc-acpi-intel-ssp-common.o
-obj-$(CONFIG_SND_SOC_ACPI_INTEL_SSP_COMMON) += snd-soc-acpi-intel-ssp-common.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 40b68c20a12a..68da7260fb1d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -79,7 +79,7 @@ snd_soc_acpi_intel_detect_codec_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_MATCH);
 
 enum snd_soc_acpi_intel_codec
 snd_soc_acpi_intel_detect_amp_type(struct device *dev)
@@ -96,7 +96,7 @@ snd_soc_acpi_intel_detect_amp_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_MATCH);
 
 const char *
 snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
@@ -118,7 +118,7 @@ snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_MATCH);
 
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
-- 
2.40.1

