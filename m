Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384F37B0DF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77FC18BC;
	Tue, 11 May 2021 23:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77FC18BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769206;
	bh=MM0P5aCsphC2iqXIYDxspypimk3bqMMpwDZV4L5pczo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTnGSaHz5uvT/KxsUJVTFWWxaf6e85PV/umeh8LAtORjQ5bsZyHyeQtXHLPlt1EE3
	 2ET/NAexnrp0yRUsGpWfoVz7IF96qSOX45SpHoXcYY+BRwmOFEeARXrDBDcGvxGifV
	 neSQ3TiaAbhTMJAKkWkPy3Dbjr281dRYoGFiS22k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32523F800E9;
	Tue, 11 May 2021 23:37:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AFB1F804AE; Tue, 11 May 2021 23:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 315D6F801D5
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 315D6F801D5
IronPort-SDR: j0poJnBxTJQNXBRQNemf50ZH1EGvBvRumxe6cR78FtGacYcujHdYKnXxZgYLdSUZXhe7EvugQF
 ztKDAm9iOkWw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992059"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992059"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:34 -0700
IronPort-SDR: duNHp0NKv9c58qMDV1g4I2KmCFo2V2gZrWPoTIySuye1Q57zX+ToFbXTw0it/W2lP88lSgR0/6
 /eYy2b8btr3Q==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098951"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/9] ASoC: Intel: bxt_da7219_max98357a: shrink platform_id
 below 20 characters
Date: Tue, 11 May 2021 16:37:02 -0500
Message-Id: <20210511213707.32958-5-pierre-louis.bossart@linux.intel.com>
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

Sparse throwns the following warnings:

sound/soc/intel/boards/bxt_da7219_max98357a.c:843:19: error: too long
initializer-string for array of char(no space for nul char)

sound/soc/intel/boards/bxt_da7219_max98357a.c:844:19: error: too long
initializer-string for array of char(no space for nul char)

sound/soc/intel/boards/bxt_da7219_max98357a.c:845:19: error: too long
initializer-string for array of char(no space for nul char)

Fix by using the 'mx' acronyn for Maxim

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c     | 12 ++++++------
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c |  2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c |  2 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 07ae950b0127..8bc95e31e3af 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -840,9 +840,9 @@ static int broxton_audio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bxt_board_ids[] = {
-	{ .name = "bxt_da7219_max98357a" },
-	{ .name = "glk_da7219_max98357a" },
-	{ .name = "cml_da7219_max98357a" },
+	{ .name = "bxt_da7219_mx98357a" },
+	{ .name = "glk_da7219_mx98357a" },
+	{ .name = "cml_da7219_mx98357a" },
 	{ }
 };
 
@@ -866,7 +866,7 @@ MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:bxt_da7219_max98357a");
-MODULE_ALIAS("platform:glk_da7219_max98357a");
-MODULE_ALIAS("platform:cml_da7219_max98357a");
+MODULE_ALIAS("platform:bxt_da7219_mx98357a");
+MODULE_ALIAS("platform:glk_da7219_mx98357a");
+MODULE_ALIAS("platform:cml_da7219_mx98357a");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 398cc771c835..576407b5daf2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -56,7 +56,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "bxt_da7219_max98357a",
+		.drv_name = "bxt_da7219_mx98357a",
 		.fw_filename = "intel/dsp_fw_bxtn.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &bxt_codecs,
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 7f6ef8229969..459ac89f401b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -67,7 +67,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "cml_da7219_max98357a",
+		.drv_name = "cml_da7219_mx98357a",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98357a_spk_codecs,
 		.sof_fw_filename = "sof-cml.ri",
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index aaa9133ab0cf..8c6264622da9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -24,7 +24,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "glk_da7219_max98357a",
+		.drv_name = "glk_da7219_mx98357a",
 		.fw_filename = "intel/dsp_fw_glk.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &glk_codecs,
-- 
2.25.1

