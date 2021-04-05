Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608035422E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 14:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE75C16ED;
	Mon,  5 Apr 2021 14:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE75C16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617627015;
	bh=bLeHzdC8i+hpvknIXsxex8JJq8gTrVf/8SMOu0PV4lg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pxVFLj4ww3IG3lYn5cwKe9zDelXA7Whe8r5Bn/GZS+sID3Rlfaf2xhJVjTFaFyCcC
	 GGT58lgRQIY25Mm/gEQz13jGsO/JwTVOsWzw2kgLbbBywARtErBiQQePqhWx4fBWIS
	 VYU52MIY3Oxc11WzUiRSXO5dliP+jfl3CyFbXL/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABC2F8025C;
	Mon,  5 Apr 2021 14:49:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3179F8025C; Mon,  5 Apr 2021 14:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E57AAF80169
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 14:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E57AAF80169
IronPort-SDR: gWnwMA8P3q1t2GlHs4tMkiKiaAsD/6ztQUUdsW6tzjPmWeifgcOZTm1jORWRLkCk827XPuzVKz
 a6evcGxAFfKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="278081139"
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; d="scan'208";a="278081139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 05:49:11 -0700
IronPort-SDR: qaeC/Ocnkj2x4NgMS5xU66vDONGNO1aEIIFlFgwwduLkJQXhroOA4W8oVZSx3jTh0otepjA7Cv
 UQFArmpe5F2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; d="scan'208";a="414280084"
Received: from snappy-s2600wt2r.iind.intel.com ([10.223.163.26])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2021 05:49:08 -0700
From: vamshi.krishna.gopal@intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/2] ASoC: Intel: kbl: Add MST route change to kbl machine
 drivers
Date: Mon,  5 Apr 2021 18:18:34 +0530
Message-Id: <20210405124835.71247-2-vamshi.krishna.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
References: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
Cc: harshapriya.n@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, biernacki@google.com,
 vamshi.krishna.gopal@intel.com, pierre-louis.bossart@intel.com
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

To support MST hdmi audio, modify the current routes to be
based on port in kbl_da7219_max98357a, kbl_da7219_max98927 &
kbl_rt5663_max98927.

Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
---
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 10 ++++++----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 10 ++++++----
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 14 ++++++++++----
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index dc3d897ad280..0e689ec7e11b 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -90,8 +90,9 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Spk", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("DP", NULL),
-	SND_SOC_DAPM_SPK("HDMI", NULL),
+	SND_SOC_DAPM_SPK("HDMI1", NULL),
+	SND_SOC_DAPM_SPK("HDMI2", NULL),
+	SND_SOC_DAPM_SPK("HDMI3", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
 			SND_SOC_DAPM_POST_PMD),
@@ -108,8 +109,9 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "MIC", NULL, "Headset Mic" },
 	{ "DMic", NULL, "SoC DMIC" },
 
-	{ "HDMI", NULL, "hif5 Output" },
-	{ "DP", NULL, "hif6 Output" },
+	{"HDMI1", NULL, "hif5-0 Output"},
+	{"HDMI2", NULL, "hif6-0 Output"},
+	{"HDMI3", NULL, "hif7-0 Output"},
 
 	/* CODEC BE connections */
 	{ "HiFi Playback", NULL, "ssp0 Tx" },
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index cc9a2509ace2..9dfe5bd9180d 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -111,8 +111,9 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("DP", NULL),
-	SND_SOC_DAPM_SPK("HDMI", NULL),
+	SND_SOC_DAPM_SPK("HDMI1", NULL),
+	SND_SOC_DAPM_SPK("HDMI2", NULL),
+	SND_SOC_DAPM_SPK("HDMI3", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
 			SND_SOC_DAPM_POST_PMD),
@@ -126,8 +127,9 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	/* other jacks */
 	{ "DMic", NULL, "SoC DMIC" },
 
-	{ "HDMI", NULL, "hif5 Output" },
-	{ "DP", NULL, "hif6 Output" },
+	{"HDMI1", NULL, "hif5-0 Output"},
+	{"HDMI2", NULL, "hif6-0 Output"},
+	{"HDMI3", NULL, "hif7-0 Output"},
 
 	/* CODEC BE connections */
 	{ "Left HiFi Playback", NULL, "ssp0 Tx" },
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 9a4b3d0973f6..a3de55a3b58d 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -151,6 +151,10 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 	{ "IN1N", NULL, "Headset Mic" },
 	{ "DMic", NULL, "SoC DMIC" },
 
+	{"HDMI1", NULL, "hif5-0 Output"},
+	{"HDMI2", NULL, "hif6-0 Output"},
+	{"HDMI3", NULL, "hif7-0 Output"},
+
 	/* CODEC BE connections */
 	{ "Left HiFi Playback", NULL, "ssp0 Tx" },
 	{ "Right HiFi Playback", NULL, "ssp0 Tx" },
@@ -194,8 +198,9 @@ static const struct snd_kcontrol_new kabylake_5663_controls[] = {
 static const struct snd_soc_dapm_widget kabylake_5663_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("DP", NULL),
-	SND_SOC_DAPM_SPK("HDMI", NULL),
+	SND_SOC_DAPM_SPK("HDMI1", NULL),
+	SND_SOC_DAPM_SPK("HDMI2", NULL),
+	SND_SOC_DAPM_SPK("HDMI3", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
 			SND_SOC_DAPM_POST_PMD),
@@ -211,8 +216,9 @@ static const struct snd_soc_dapm_route kabylake_5663_map[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 	{ "IN1N", NULL, "Headset Mic" },
 
-	{ "HDMI", NULL, "hif5 Output" },
-	{ "DP", NULL, "hif6 Output" },
+	{"HDMI1", NULL, "hif5-0 Output"},
+	{"HDMI2", NULL, "hif6-0 Output"},
+	{"HDMI3", NULL, "hif7-0 Output"},
 
 	/* CODEC BE connections */
 	{ "AIF Playback", NULL, "ssp1 Tx" },
-- 
2.17.1

