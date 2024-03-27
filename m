Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4531B88EB25
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:26:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9265C2C34;
	Wed, 27 Mar 2024 17:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9265C2C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556781;
	bh=yDo56YJ3v65nLiVuWN5tkYux0pyhJETH/nfYDD7sK1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KgIxvjT0C8mpPiynX8q55PWvVolzuockPsXIfyS1ahp//ZUdPIbhLz88odsad4p1n
	 YtS/VIEqzyKbl6z1TfkNSWGxqlsYRQkyrmhS8CR8Exsa8AbtN2uWjSgKSEOfW8gU7R
	 ppcpRygN4Hcq6YTrMZt0GshSLHN4Z5NrnHDPvyZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5C03F80656; Wed, 27 Mar 2024 17:24:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D8AF80651;
	Wed, 27 Mar 2024 17:24:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B10F805D5; Wed, 27 Mar 2024 17:24:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BA01F802DB
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA01F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KBgAmNsR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556676; x=1743092676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yDo56YJ3v65nLiVuWN5tkYux0pyhJETH/nfYDD7sK1k=;
  b=KBgAmNsR8XXKc3UR54uPFOaOnXt9zxjfyH0dZyGQ0M0PRgbtSgfpUsnb
   Xy700MQnoKMtumYOeVIorviSi/iXRTKXhlYxfXWg1KP9wR/ZAyIPgIyGG
   IRw4ZroI8Qg2aNH/meElqaFyUJahrK8kFdOae6Y1u+priPhJU9bt2YCgv
   vOzYAk02i0ewtbRxFWi0mcM7ntPB+ets7AptfrF7WHCZh1ErrMlBFsJkz
   uejSBDpqBYC8dCifNcizYhdRRX5j4cDPDnJux7/GxL2nAUJV6EQqUymuv
   noN+P4vWmx7A0KN4D8ZOLSrxlLNMpwYX6tQcoOCyzRet/N1TmQ3cUd6lq
   A==;
X-CSE-ConnectionGUID: aDptQ9EXSSiol2+MNNO2cg==
X-CSE-MsgGUID: MDWbNOhjQce/Ol1v/gxBpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221497"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821266"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/18] ASoC: Intel: ssp-common: module name change
Date: Wed, 27 Mar 2024 11:23:54 -0500
Message-Id: <20240327162408.63953-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XQZSEUVPOCAMYFHJ4ABSPQLXO56MWLLZ
X-Message-ID-Hash: XQZSEUVPOCAMYFHJ4ABSPQLXO56MWLLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQZSEUVPOCAMYFHJ4ABSPQLXO56MWLLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

As we applied new naming convention to functions and structures,
changing module name as well to reflect the new naming.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig                            |  6 ++++++
 sound/soc/intel/boards/Kconfig                     | 13 +++++--------
 sound/soc/intel/boards/sof_board_helpers.c         |  2 +-
 sound/soc/intel/common/Makefile                    |  4 ++--
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c |  6 +++---
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 4b9e498e3303..e17d1a517567 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -197,6 +197,12 @@ config SND_SOC_ACPI_INTEL_MATCH
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
 
+config SND_SOC_ACPI_INTEL_SSP_COMMON
+	tristate
+	select SND_SOC_ACPI if ACPI
+	# this option provides helpers to detect codec type and is not meant
+	# to be selected by the user.
+
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_INTEL_KEEMBAY
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b7a6ac4b6c0c..4d6ef68da130 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -41,9 +41,6 @@ config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 config SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	tristate
 
-config SND_SOC_INTEL_SOF_SSP_COMMON
-	tristate
-
 config SND_SOC_INTEL_SOF_BOARD_HELPERS
 	tristate
 
@@ -503,7 +500,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5650 or rt5682 codec.
@@ -521,7 +518,7 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with cs42l42 codec.
@@ -574,7 +571,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with nau8825 codec.
@@ -626,7 +623,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with Dialog DA7219 I2S audio codec.
@@ -646,7 +643,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
-	select SND_SOC_INTEL_SOF_SSP_COMMON
+	select SND_SOC_ACPI_INTEL_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with RT1308/CS35L41 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 8819ab5694bf..ba5be5423626 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -635,4 +635,4 @@ MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_SSP_COMMON);
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 15c8a64368c5..dcd552d815a2 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -18,5 +18,5 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
 
-snd-soc-intel-sof-ssp-common-objs += soc-acpi-intel-ssp-common.o
-obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
+snd-soc-acpi-intel-ssp-common-objs += soc-acpi-intel-ssp-common.o
+obj-$(CONFIG_SND_SOC_ACPI_INTEL_SSP_COMMON) += snd-soc-acpi-intel-ssp-common.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 716243a4fc9a..40b68c20a12a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -79,7 +79,7 @@ snd_soc_acpi_intel_detect_codec_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
 
 enum snd_soc_acpi_intel_codec
 snd_soc_acpi_intel_detect_amp_type(struct device *dev)
@@ -96,7 +96,7 @@ snd_soc_acpi_intel_detect_amp_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_SSP_COMMON);
 
 const char *
 snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
@@ -118,7 +118,7 @@ snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_SSP_COMMON);
 
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
-- 
2.40.1

