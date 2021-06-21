Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047033AF669
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 21:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8579216B3;
	Mon, 21 Jun 2021 21:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8579216B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624304797;
	bh=gAj/13MBLTb50lCV6nsJCUK1ggcllCK+S9dJqO+tnEc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKFOyA+vo1/CbuRO30D8qDpn85QoMmrdjgg+JXkQrRAziK/JZwGAAO03LB11nOnIm
	 IG0joJ1hG8AHrS68gLZ8w2tnfhG+92kGusqWCU41Ih76Jqo2FmFm8ugXj9Pc6oYxXo
	 EDQeZTKavItMNct9yRO9pkwKcvWLhDB2kABvxDCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51DE9F8051C;
	Mon, 21 Jun 2021 21:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A2D6F804E0; Mon, 21 Jun 2021 21:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3918F804D9
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 21:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3918F804D9
IronPort-SDR: BDEKO2VfDqaIyFpFVfkynZDIkj+R2EbOrTUUx9gGsBcDo8eB626ae+QCf8PGfk+EcqqwxNxHFm
 DXIqW6EvT8XQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="203903344"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="203903344"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:26 -0700
IronPort-SDR: 2cOeFk0lB4OQEKzLbPW7mDjllCMxtR/YJ2R1sSRwaC+Xx4G3NXIzQC8ymasQwI6CpZQCxNXN/V
 bYhieSpih3vQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="486619093"
Received: from gwhaugh-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.175.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 09/10] ASoC: Intel: use MODULE_DEVICE_TABLE with
 platform_device_id tables
Date: Mon, 21 Jun 2021 14:40:56 -0500
Message-Id: <20210621194057.21711-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
References: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hulk Robot <hulkci@huawei.com>, broonie@kernel.org,
 Zou Wei <zou_wei@huawei.com>
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

When we have a platform_device_id table, we can use
MODULE_DEVICE_TABLE to automatically generate the modalias. As a
result we can remove the manual insertion of MODULE_ALIAS.

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Zou Wei <zou_wei@huawei.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c       |  4 +---
 sound/soc/intel/boards/bxt_rt298.c                  |  3 +--
 sound/soc/intel/boards/ehl_rt5660.c                 |  2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c       |  2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c       |  2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c        |  5 +----
 sound/soc/intel/boards/kbl_rt5660.c                 |  2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c        |  3 +--
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c |  2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c     |  3 +--
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c       |  3 +--
 sound/soc/intel/boards/skl_rt286.c                  |  3 +--
 sound/soc/intel/boards/sof_cs42l42.c                |  3 +--
 sound/soc/intel/boards/sof_da7219_max98373.c        |  2 --
 sound/soc/intel/boards/sof_rt5682.c                 | 10 ----------
 15 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 8bc95e31e3af..e67ddfb8e469 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -845,6 +845,7 @@ static const struct platform_device_id bxt_board_ids[] = {
 	{ .name = "cml_da7219_mx98357a" },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, bxt_board_ids);
 
 static struct platform_driver broxton_audio = {
 	.probe = broxton_audio_probe,
@@ -866,7 +867,4 @@ MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:bxt_da7219_mx98357a");
-MODULE_ALIAS("platform:glk_da7219_mx98357a");
-MODULE_ALIAS("platform:cml_da7219_mx98357a");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 32a776fa0b86..47f6b1523ae6 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -649,6 +649,7 @@ static const struct platform_device_id bxt_board_ids[] = {
 				(unsigned long)&geminilake_rt298 },
 	{}
 };
+MODULE_DEVICE_TABLE(platform, bxt_board_ids);
 
 static struct platform_driver broxton_audio = {
 	.probe = broxton_audio_probe,
@@ -665,6 +666,4 @@ MODULE_AUTHOR("Ramesh Babu <Ramesh.Babu@intel.com>");
 MODULE_AUTHOR("Senthilnathan Veppur <senthilnathanx.veppur@intel.com>");
 MODULE_DESCRIPTION("Intel SST Audio for Broxton");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:bxt_alc298s_i2s");
-MODULE_ALIAS("platform:glk_alc298s_i2s");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 00773d17d578..d5235c294c4c 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -304,6 +304,7 @@ static const struct platform_device_id ehl_board_ids[] = {
 	{ .name = "ehl_rt5660" },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, ehl_board_ids);
 
 static struct platform_driver snd_ehl_rt5660_driver = {
 	.driver = {
@@ -319,5 +320,4 @@ module_platform_driver(snd_ehl_rt5660_driver);
 MODULE_DESCRIPTION("ASoC Intel(R) Elkhartlake + rt5660 Machine driver");
 MODULE_AUTHOR("libin.yang@intel.com");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:ehl_rt5660");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 9b92625288cb..71fe26a1b701 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -625,6 +625,7 @@ static const struct platform_device_id glk_board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, glk_board_ids);
 
 static struct platform_driver geminilake_audio = {
 	.probe = geminilake_audio_probe,
@@ -641,5 +642,4 @@ MODULE_DESCRIPTION("Geminilake Audio Machine driver-RT5682 & MAX98357A in I2S mo
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:glk_rt5682_mx98357a");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 7ca3347dbd2e..14b625e947f5 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -650,6 +650,7 @@ static const struct platform_device_id kbl_board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, kbl_board_ids);
 
 static struct platform_driver kabylake_audio = {
 	.probe = kabylake_audio_probe,
@@ -666,4 +667,3 @@ module_platform_driver(kabylake_audio)
 MODULE_DESCRIPTION("Audio Machine driver-DA7219 & MAX98357A in I2S mode");
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:kbl_da7219_mx98357a");
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 4b7b4a044f81..a31a7a7bbf66 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -1175,6 +1175,7 @@ static const struct platform_device_id kbl_board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, kbl_board_ids);
 
 static struct platform_driver kabylake_audio = {
 	.probe = kabylake_audio_probe,
@@ -1191,7 +1192,3 @@ module_platform_driver(kabylake_audio)
 MODULE_DESCRIPTION("Audio KabyLake Machine driver for MAX98927/MAX98373 & DA7219");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:kbl_da7219_max98927");
-MODULE_ALIAS("platform:kbl_max98927");
-MODULE_ALIAS("platform:kbl_da7219_max98373");
-MODULE_ALIAS("platform:kbl_max98373");
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 3a9f91b58e11..289ca39b8206 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -548,6 +548,7 @@ static const struct platform_device_id kbl_board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, kbl_board_ids);
 
 static struct platform_driver kabylake_audio = {
 	.probe = kabylake_audio_probe,
@@ -564,4 +565,3 @@ module_platform_driver(kabylake_audio)
 MODULE_DESCRIPTION("Audio Machine driver-RT5660 in I2S mode");
 MODULE_AUTHOR("Hui Wang <hui.wang@canonical.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:kbl_rt5660");
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index a3de55a3b58d..a3e040a249f6 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -1039,6 +1039,7 @@ static const struct platform_device_id kbl_board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, kbl_board_ids);
 
 static struct platform_driver kabylake_audio = {
 	.probe = kabylake_audio_probe,
@@ -1056,5 +1057,3 @@ MODULE_DESCRIPTION("Audio Machine driver-RT5663 & MAX98927 in I2S mode");
 MODULE_AUTHOR("Naveen M <naveen.m@intel.com>");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:kbl_rt5663");
-MODULE_ALIAS("platform:kbl_rt5663_m98927");
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index f95546c184aa..dd38fdaf2ff5 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -837,6 +837,7 @@ static const struct platform_device_id kbl_board_ids[] = {
 	{ .name = "kbl_r5514_5663_max" },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, kbl_board_ids);
 
 static struct platform_driver kabylake_audio = {
 	.probe = kabylake_audio_probe,
@@ -853,4 +854,3 @@ module_platform_driver(kabylake_audio)
 MODULE_DESCRIPTION("Audio Machine driver-RT5663 RT5514 & MAX98927");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:kbl_r5514_5663_max");
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index 55802900069a..e3a1f04a8b53 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -673,6 +673,7 @@ static const struct platform_device_id skl_board_ids[] = {
 	{ .name = "kbl_n88l25_m98357a" },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, skl_board_ids);
 
 static struct platform_driver skylake_audio = {
 	.probe = skylake_audio_probe,
@@ -689,5 +690,3 @@ module_platform_driver(skylake_audio)
 MODULE_DESCRIPTION("Audio Machine driver-NAU88L25 & MAX98357A in I2S mode");
 MODULE_AUTHOR("Rohit Ainapure <rohit.m.ainapure@intel.com");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:skl_n88l25_m98357a");
-MODULE_ALIAS("platform:kbl_n88l25_m98357a");
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 0c734f3a9364..adf5992a9ec5 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -717,6 +717,7 @@ static const struct platform_device_id skl_board_ids[] = {
 	{ .name = "kbl_n88l25_s4567" },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, skl_board_ids);
 
 static struct platform_driver skylake_audio = {
 	.probe = skylake_audio_probe,
@@ -737,5 +738,3 @@ MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_DESCRIPTION("Intel Audio Machine driver for SKL with NAU88L25 and SSM4567 in I2S Mode");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:skl_n88l25_s4567");
-MODULE_ALIAS("platform:kbl_n88l25_s4567");
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 5a0c64a83146..75dab5405380 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -548,6 +548,7 @@ static const struct platform_device_id skl_board_ids[] = {
 	{ .name = "kbl_alc286s_i2s" },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, skl_board_ids);
 
 static struct platform_driver skylake_audio = {
 	.probe = skylake_audio_probe,
@@ -565,5 +566,3 @@ module_platform_driver(skylake_audio)
 MODULE_AUTHOR("Omair Mohammed Abdullah <omair.m.abdullah@intel.com>");
 MODULE_DESCRIPTION("Intel SST Audio for Skylake");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:skl_alc286s_i2s");
-MODULE_ALIAS("platform:kbl_alc286s_i2s");
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 8919d3ba3c89..42aadf801f72 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -488,6 +488,7 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, board_ids);
 
 static struct platform_driver sof_audio = {
 	.probe = sof_audio_probe,
@@ -503,7 +504,5 @@ module_platform_driver(sof_audio)
 MODULE_DESCRIPTION("SOF Audio Machine driver for CS42L42");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:sof_cs42l42");
-MODULE_ALIAS("platform:glk_cs4242_max98357a");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index d702a8dfa241..896251d742fe 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -456,6 +456,4 @@ module_platform_driver(audio)
 MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:sof_da7219_mx98360a");
-MODULE_ALIAS("platform:sof_da7219_mx98373");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ca95e01b0ef9..39217223d50c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1063,15 +1063,5 @@ MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
 MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:sof_rt5682");
-MODULE_ALIAS("platform:tgl_mx98357a_rt5682");
-MODULE_ALIAS("platform:jsl_rt5682_rt1015");
-MODULE_ALIAS("platform:tgl_mx98373_rt5682");
-MODULE_ALIAS("platform:jsl_rt5682_mx98360a");
-MODULE_ALIAS("platform:cml_rt1015_rt5682");
-MODULE_ALIAS("platform:tgl_rt1011_rt5682");
-MODULE_ALIAS("platform:jsl_rt5682_rt1015p");
-MODULE_ALIAS("platform:adl_mx98373_rt5682");
-MODULE_ALIAS("platform:adl_mx98357a_rt5682");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-- 
2.25.1

