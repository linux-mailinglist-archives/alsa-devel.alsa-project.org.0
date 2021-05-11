Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8032C37B0E5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D6618CF;
	Tue, 11 May 2021 23:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D6618CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769239;
	bh=N8Sb/K0iyzEAp881t9/fCCZzkq6Rxv80MJbARSckZkA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1Mjdl5ZQzXsTS+yVYPKYcarTPJ5+BWLh3B+3yrYDuxm3xzs1JURNQnetUaEgoYK3
	 4KU2ZNpwmGQXbCpzPpQJ1MOQniai1TqmYG/N8xzZ8UuyysuK6JUp9fboMbIqki7N7v
	 QMACr4adLZSR/AzX8YhCZ+20SaoiAPMw4mWXjE5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB0E6F804B2;
	Tue, 11 May 2021 23:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50161F804AC; Tue, 11 May 2021 23:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E9AEF80163
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E9AEF80163
IronPort-SDR: kC2kS+ba5Y0UVXkzLEVyKYomm6pmlUko97Ow+jgD19mzVCfVS+55DFd1bWiee1e2I7+Ks87ryH
 2vsuQfpLzp6w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992046"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:31 -0700
IronPort-SDR: fidgH40AfG0RtD8ts7cvlx8zincD33uG4g4k6CuzBoi7LnMN0aJQgmUxgEjDJb5jiOFrSxWGlw
 vKTJeVSwHaKw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098924"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/9] ASoC: Intel: sof_rt5682: shrink platform_id names below
 20 characters
Date: Tue, 11 May 2021 16:37:00 -0500
Message-Id: <20210511213707.32958-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
References: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>
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

Some Chromebooks machine driver aliases exceed 20 characters, which
leads to sparse warnings:

sound/soc/intel/boards/sof_rt5682.c:959:25: error: too long
initializer-string for array of char(no space for nul char)

sound/soc/intel/boards/sof_rt5682.c:989:25: error: too long
initializer-string for array of char(no space for nul char)

sound/soc/intel/boards/sof_rt5682.c:1039:25: error: too long
initializer-string for array of char(no space for nul char)

Fix by using the 'mx' shortcut for Maxim platforms (already used in
platform firmware)

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 20 +++++++++----------
 .../intel/common/soc-acpi-intel-adl-match.c   |  4 ++--
 .../intel/common/soc-acpi-intel-jsl-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f3d370517101..cc1a03fc6bdf 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -956,7 +956,7 @@ static const struct platform_device_id board_ids[] = {
 		.name = "sof_rt5682",
 	},
 	{
-		.name = "tgl_max98357a_rt5682",
+		.name = "tgl_mx98357a_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
@@ -975,7 +975,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "tgl_max98373_rt5682",
+		.name = "tgl_mx98373_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
@@ -986,7 +986,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "jsl_rt5682_max98360a",
+		.name = "jsl_rt5682_mx98360a",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
@@ -1025,7 +1025,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "adl_max98373_rt5682",
+		.name = "adl_mx98373_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
@@ -1036,7 +1036,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "adl_max98357a_rt5682",
+		.name = "adl_mx98357a_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
@@ -1063,14 +1063,14 @@ MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_rt5682");
-MODULE_ALIAS("platform:tgl_max98357a_rt5682");
+MODULE_ALIAS("platform:tgl_mx98357a_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015");
-MODULE_ALIAS("platform:tgl_max98373_rt5682");
-MODULE_ALIAS("platform:jsl_rt5682_max98360a");
+MODULE_ALIAS("platform:tgl_mx98373_rt5682");
+MODULE_ALIAS("platform:jsl_rt5682_mx98360a");
 MODULE_ALIAS("platform:cml_rt1015_rt5682");
 MODULE_ALIAS("platform:tgl_rt1011_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015p");
-MODULE_ALIAS("platform:adl_max98373_rt5682");
-MODULE_ALIAS("platform:adl_max98357a_rt5682");
+MODULE_ALIAS("platform:adl_mx98373_rt5682");
+MODULE_ALIAS("platform:adl_mx98357a_rt5682");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 39ac6d52106f..b01aa6ba050f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -245,7 +245,7 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.id = "10EC5682",
-		.drv_name = "adl_max98373_rt5682",
+		.drv_name = "adl_mx98373_rt5682",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98373_amp,
 		.sof_fw_filename = "sof-adl.ri",
@@ -253,7 +253,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "adl_max98357a_rt5682",
+		.drv_name = "adl_mx98357a_rt5682",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98357a_amp,
 		.sof_fw_filename = "sof-adl.ri",
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 73fe4f89a82d..885f6002fe53 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -67,7 +67,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "jsl_rt5682_max98360a",
+		.drv_name = "jsl_rt5682_mx98360a",
 		.sof_fw_filename = "sof-jsl.ri",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mx98360a_spk,
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index b5f05b81a584..91cffc3d2f18 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -323,7 +323,7 @@ static const struct snd_soc_acpi_codecs tgl_rt1011_amp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.id = "10EC5682",
-		.drv_name = "tgl_max98357a_rt5682",
+		.drv_name = "tgl_mx98357a_rt5682",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &tgl_codecs,
 		.sof_fw_filename = "sof-tgl.ri",
@@ -331,7 +331,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "tgl_max98373_rt5682",
+		.drv_name = "tgl_mx98373_rt5682",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &tgl_max98373_amp,
 		.sof_fw_filename = "sof-tgl.ri",
-- 
2.25.1

