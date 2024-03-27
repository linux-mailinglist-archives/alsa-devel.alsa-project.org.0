Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E588EB39
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:28:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85FD52C3F;
	Wed, 27 Mar 2024 17:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85FD52C3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556932;
	bh=9NGDWNO1OYr4eGh4Ij3kYUinuMCScDfWokDYzAgk5RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N81RqvRFYv/gphORzUPvl2FKZLw7DhPsla0VhLc86s/dZmRhZXpKH3YS7kW9YeL2e
	 O3U6KfVlDY7HC5KLTLZbMYmPSICdRksAGPtBdWp9DA/f3mj8EjPx8QpyzB5Z6POL7d
	 Zant6lak2oDP6qGJ3WoF9wMPoEOtfvOMfw0RjYU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C0FFF80855; Wed, 27 Mar 2024 17:25:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 369AFF805E0;
	Wed, 27 Mar 2024 17:25:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877B9F806C0; Wed, 27 Mar 2024 17:25:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38738F80579
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38738F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=flRid0Mp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556680; x=1743092680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NGDWNO1OYr4eGh4Ij3kYUinuMCScDfWokDYzAgk5RI=;
  b=flRid0MpA8g/LML2A3T9hgD7G2FXL5pr7BGSZaes4qd6e9hZGqPrfWqd
   aQGtuvKRaTn80Kls65v9PViZEEv9r7/R460MrF8msXkjk+67+mZbmZ/yG
   SC2oL6xeNBVSuLRdj9R5Gru3FYqpgV3z+I2WYZOw/eYYlzxYu1zHwhKZ5
   KNgXg5AUs2kZQo+19YEG60sKySe/JyZZ3RdO3Fs6lvo4Bf+qgUAZ/Cclq
   +eob+2YYA2HC+an9gFV8xiioUmM8MraaviQm1IJEE63OKQRTaxCknOfuA
   x0K5vB39pWz22arxHPvEzVJ28KfAugHdggHC5h6qqchY/Bj4P907y+rxf
   Q==;
X-CSE-ConnectionGUID: Ln8r4S5JQ5mPgfHLVfAa0w==
X-CSE-MsgGUID: jrBEx3ArS8uRBBVaoDaBwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221539"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221539"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821309"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/18] ASoC: Intel: sof_rt5682: mach cleanup for tgl boards
Date: Wed, 27 Mar 2024 11:24:01 -0500
Message-Id: <20240327162408.63953-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZEN4L3JB2Y5U55ZOA3LWEFYBHLMUP4L2
X-Message-ID-Hash: ZEN4L3JB2Y5U55ZOA3LWEFYBHLMUP4L2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEN4L3JB2Y5U55ZOA3LWEFYBHLMUP4L2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a common entry in enumeration table for all rt5682 boards
with/without speaker amplifier. All other tgl_rt5682_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 50 +++++--------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 77226d1eb1cf..161ba532d270 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
@@ -15,11 +16,6 @@ static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static const struct snd_soc_acpi_codecs tgl_codecs = {
-	.num_codecs = 1,
-	.codecs = {"MX98357A"}
-};
-
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
 	.aggregated = 0,
@@ -499,19 +495,9 @@ static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98373"}
-};
-
-static const struct snd_soc_acpi_codecs tgl_rt1011_amp = {
-	.num_codecs = 1,
-	.codecs = {"10EC1011"}
-};
-
 static const struct snd_soc_acpi_codecs tgl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs tgl_lt6911_hdmi = {
@@ -520,27 +506,6 @@ static const struct snd_soc_acpi_codecs tgl_lt6911_hdmi = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
-	{
-		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &tgl_codecs,
-		.sof_tplg_filename = "sof-tgl-max98357a-rt5682.tplg",
-	},
-	{
-		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &tgl_max98373_amp,
-		.sof_tplg_filename = "sof-tgl-max98373-rt5682.tplg",
-	},
-	{
-		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &tgl_rt1011_amp,
-		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
-	},
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
@@ -549,6 +514,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.comp_ids = &tgl_rt5682_rt5682s_hp,
+		.drv_name = "tgl_rt5682_def",
+		.sof_tplg_filename = "sof-tgl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	/* place amp-only boards in the end of table */
 	{
 		.id = "10EC1308",
 		.drv_name = "tgl_rt1308_hdmi_ssp",
-- 
2.40.1

