Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD537B0E9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:41:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A1118A0;
	Tue, 11 May 2021 23:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A1118A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769307;
	bh=AoqjbS3mDs5OFjF0yzbAMihKewQIG5o+B9Wwh0+jsWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHWWjy5V9Mb9yGjI4RePYuVMppwBJUgo5te/CPrL5k1EtuACdtOqQgIf2d8mHAnL7
	 f+/neSyb4u9h1KsTen/WieQP+LMjiakDiaN4sGwnohVDxyQI5dQg4DfhR2BM48cmin
	 iQ4BrxVTi//wwEU41/njc6s2NAOlypsci7+mCKd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5AE4F804E2;
	Tue, 11 May 2021 23:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFD4F80245; Tue, 11 May 2021 23:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EE5CF80279
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EE5CF80279
IronPort-SDR: QKqQG/WN1oDlJkbjOEuVHNAPoQ1FIQObQADRcxB4HqeC2lXAcQLxsgUPmR2YOeGJaOMqoV63R8
 VZHOImzLc8ng==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992076"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992076"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:36 -0700
IronPort-SDR: xRXqO0CTG9vySdAYRceWE2sFKCdxNUq2v39BgjYLiy21bOiYYPv7kO5d1fNsWlkA6hfDIAI9r1
 HUe/GHzdDcMw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098981"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/9] ASoC: Intel: sof_da7219_max98373: shrink platform_id
 below 20 characters
Date: Tue, 11 May 2021 16:37:05 -0500
Message-Id: <20210511213707.32958-8-pierre-louis.bossart@linux.intel.com>
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

Sparse throws the following warning:

sound/soc/intel/boards/sof_da7219_max98373.c:438:25: error: too long
initializer-string for array of char(no space for nul char)

Fix by using 'mx' acronym for Maxim.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_da7219_max98373.c      | 8 ++++----
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 0604d25e745f..c49641724f9a 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -431,11 +431,11 @@ static int audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id board_ids[] = {
 	{
-		.name = "sof_da7219_max98373",
+		.name = "sof_da7219_mx98373",
 		.driver_data = (kernel_ulong_t)&card_da7219_m98373,
 	},
 	{
-		.name = "sof_da7219_max98360a",
+		.name = "sof_da7219_mx98360a",
 		.driver_data = (kernel_ulong_t)&card_da7219_m98360a,
 	},
 	{ }
@@ -455,6 +455,6 @@ module_platform_driver(audio)
 MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:sof_da7219_max98360a");
-MODULE_ALIAS("platform:sof_da7219_max98373");
+MODULE_ALIAS("platform:sof_da7219_mx98360a");
+MODULE_ALIAS("platform:sof_da7219_mx98373");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 885f6002fe53..3586ce72c42c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -37,7 +37,7 @@ static struct snd_soc_acpi_codecs mx98360a_spk = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "DLGS7219",
-		.drv_name = "sof_da7219_max98373",
+		.drv_name = "sof_da7219_mx98373",
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-da7219.tplg",
 		.machine_quirk = snd_soc_acpi_codec_list,
@@ -45,7 +45,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "sof_da7219_max98360a",
+		.drv_name = "sof_da7219_mx98360a",
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
 	},
-- 
2.25.1

