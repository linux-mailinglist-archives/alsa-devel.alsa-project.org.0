Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C988EB2F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:27:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBB82C0C;
	Wed, 27 Mar 2024 17:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBB82C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556863;
	bh=L/rMKeb7bryjkvewzg2n9FkK/ylWO2IYooTwSLchRGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQgJT5nMcQVebrf9+tQHrKugorQpNtPWcxVshDIE7SbFfTnKRXVIvi9S0KQzrGBmx
	 5uuk2T98m0Z7kZkiAZyCRzUsane8puVsvq/p7rfefzBUkGThBXs7DANlBwFbHygVqF
	 8DoDgEtr/ic2GE0lGliz2LU5QPg2XVDTUkVApAAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D690FF806F0; Wed, 27 Mar 2024 17:25:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 795B8F806D4;
	Wed, 27 Mar 2024 17:25:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A17BEF805AC; Wed, 27 Mar 2024 17:25:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2FBBF801EB
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FBBF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=caJXT7Md
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556682; x=1743092682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L/rMKeb7bryjkvewzg2n9FkK/ylWO2IYooTwSLchRGY=;
  b=caJXT7MdGJXloSpXejvoBGR/tVQZsZCafyqPgortu3rV5gkT/UgfvQQP
   rwiL9lXBfuezQH9BesKLpROc3q01mlwGdgKc9F1V5sBFDzgSetOWFMp2C
   5C3Xuk6XT6xs9wSkKnrqc7haIOpxLDBVnG+n0zJVXYrzb/ozIdejgBBdU
   SJ6CTmwOu06Z+w1PICpLqwWC5eaMaLHsLRh8jMIOgoE8G7XmfdmO6hi2I
   bZbZzYmSP0loOb8LkRYYZHqILeULwrV6i+78SXCgOqZ6ohhw1RMLjgf+P
   NuTFArGkxKzsxJ9yzi+GnHCWgheFjPXGHaaB2ReY3HiEhk/t2Pby4UBKZ
   Q==;
X-CSE-ConnectionGUID: 9/T3wVw8TpGFQXBgH0NCCQ==
X-CSE-MsgGUID: vgZB/1kqQ56IgSe57i1xsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221546"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821313"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/18] ASoC: Intel: sof_rt5682: mach cleanup for adl boards
Date: Wed, 27 Mar 2024 11:24:02 -0500
Message-Id: <20240327162408.63953-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DCNQJ3PAVJNJKCOOFADGLP3RXQQ7MOER
X-Message-ID-Hash: DCNQJ3PAVJNJKCOOFADGLP3RXQQ7MOER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCNQJ3PAVJNJKCOOFADGLP3RXQQ7MOER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add two common entries in enumeration table for all rt5682/rt5650
boards with/without speaker amplifier. All other adl_rt5682_def
entries become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 71 ++++---------------
 1 file changed, 15 insertions(+), 56 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index f8b8864b5ec6..9ac9310dd2be 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -448,11 +448,6 @@ static const struct snd_soc_acpi_link_adr adl_chromebook_base[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_codecs adl_max98373_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98373"}
-};
-
 static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -465,7 +460,7 @@ static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
 
 static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
@@ -473,29 +468,12 @@ static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
 	.codecs = {"RTL1019"}
 };
 
-static const struct snd_soc_acpi_codecs adl_max98390_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98390"}
-};
-
 static const struct snd_soc_acpi_codecs adl_lt6911_hdmi = {
 	.num_codecs = 1,
 	.codecs = {"INTC10B0"}
 };
 
-static struct snd_soc_acpi_codecs adl_rt5650_amp = {
-	.num_codecs = 1,
-	.codecs = {"10EC5650"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98373_amp,
-		.sof_tplg_filename = "sof-adl-max98373-rt5682.tplg",
-	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_mx98357_rt5682",
@@ -503,13 +481,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_max98357a_amp,
 		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
 	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
-	},
 	{
 		.id = "10508825",
 		.drv_name = "adl_rt1019p_8825",
@@ -517,20 +488,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-nau8825.tplg",
 	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_rt1019p_amp,
-		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
-	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98390_amp,
-		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
-	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_rt5682_c1_h02",
@@ -538,11 +495,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_lt6911_hdmi,
 		.sof_tplg_filename = "sof-adl-rt5682-ssp1-hdmi-ssp02.tplg",
 	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.sof_tplg_filename = "sof-adl-rt5682.tplg",
-	},
 	{
 		.id = "10134242",
 		.drv_name = "adl_mx98360a_cs4242",
@@ -565,13 +517,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
-	{
-		.id = "10EC5650",
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_rt5650_amp,
-		.sof_tplg_filename = "sof-adl-rt5650.tplg",
-	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "adl_da7219_def",
@@ -589,6 +534,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = RT5650_ACPI_HID,
+		.drv_name = "adl_rt5682_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	{
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_rt5682_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "CSC3541",
-- 
2.40.1

