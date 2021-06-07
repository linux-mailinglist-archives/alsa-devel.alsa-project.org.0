Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB139E9C2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A75C169B;
	Tue,  8 Jun 2021 00:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A75C169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623106128;
	bh=1IhfP99VwYU7/nxkBOG2YWt1WDdUhTST0gTdOl4iW/k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HT0n2dePc77kRfCMU+B88NVnCPRmTUs5jjgQrJOiIgUGx83wogFzoL5bnB6guZ0U8
	 V3DEmaUT47QEYVzrtr38gFQnx1G01WarJBuizaNZdOD3mDdipRKVX2Z1KgAxbOCpzv
	 1jOliIEzbJW+MeX66HTvQ9RjUAvhHJVakOFRhZb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A6CF804CF;
	Tue,  8 Jun 2021 00:47:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBBAF8032C; Tue,  8 Jun 2021 00:47:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ABA3F8020D
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ABA3F8020D
IronPort-SDR: bzbvTi6K0YZmxdnUcD9Slqml2zcPVBzLplurCVo3assXoeo/R00MVVx5aWYfjuPQkcSnhUK8c7
 honFHxmvVV8w==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185102174"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185102174"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:49 -0700
IronPort-SDR: r9BbUwP1wO0Lz5WC4W5pFgGtbmwlTU2O3Ovb4LlD1sHIedhpv7+PwjgbHfdWNYcLszUD0GB+cb
 7Iz5uXOPaL8g==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="637437082"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: Intel: sof_rt5682: shrink platform_id names below
 20 characters
Date: Mon,  7 Jun 2021 17:46:31 -0500
Message-Id: <20210607224638.585486-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
References: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>
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
index 3e69feaf052b..ca95e01b0ef9 100644
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
@@ -1064,14 +1064,14 @@ MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
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
index 22c465f1d5d8..8905f1a1ec91 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -283,7 +283,7 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.id = "10EC5682",
-		.drv_name = "adl_max98373_rt5682",
+		.drv_name = "adl_mx98373_rt5682",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98373_amp,
 		.sof_fw_filename = "sof-adl.ri",
@@ -291,7 +291,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
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

