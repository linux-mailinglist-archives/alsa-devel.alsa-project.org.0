Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5E88EB32
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:28:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5AF2C17;
	Wed, 27 Mar 2024 17:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5AF2C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556897;
	bh=bqI6k1vmLPj9eqdEJ9jrqBRuXrfpW9+m6fOT7gzV0Kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WiJ6UEWkMWW1t1HXV173rV04alpk0Jq+Y+Ji2f7e4Ppp5yPB6W48QIVOuPi52cqea
	 4OYpON+lqkqoTcnRfZ/1T647lFkcTnpV1ZIAZRRhiYyUhiQkUrN2GeiqC0faPYdgGE
	 ZGEJsj6dlxLFi7tVbxyZnZC7B4QbgZKNBGuzNynM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C7DDF80759; Wed, 27 Mar 2024 17:25:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17383F80759;
	Wed, 27 Mar 2024 17:25:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0BF0F80694; Wed, 27 Mar 2024 17:25:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF773F8055C
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF773F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Nuz+64Kf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556680; x=1743092680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bqI6k1vmLPj9eqdEJ9jrqBRuXrfpW9+m6fOT7gzV0Kw=;
  b=Nuz+64Kf8aHUWbBkRZ3uiF0XaHgCfTkpqYopyk555QmLJfJFcu2To6bl
   CLN6NsIIiM1UCIOQz7rvtjUrZ5PkqC8EWyV3ByQSG2I+KaR/X5Zfiq9w/
   0mnDPBejL/4dZ3+SWAJ9FPpig5J56Z3Xl8c1jjuHmAkoYy2IdBqASMqrL
   vZFy2skCnSWaA2G5y0pJJUhwBZ97MNxwrp108O0KpxKOX9FCEPN5NY9yT
   gZg6IGVcH0X3alCDDWnGzBImoPV8B9Fw087cPuWKKM7qfjqFrf4awpGaA
   9PcAqnx+Tsq72JnMb+00PK0Tcj71nV49DLy3OrT+giJ7pInrnSEzHgHhG
   g==;
X-CSE-ConnectionGUID: s6gp5eeyRTm0WYKtXf4www==
X-CSE-MsgGUID: DPNTeA8HRXeEAc34VEvHJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221529"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821300"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/18] ASoC: Intel: sof_nau8825: mach cleanup for rpl boards
Date: Wed, 27 Mar 2024 11:23:59 -0500
Message-Id: <20240327162408.63953-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQUVZGJ5QBR6MEK3GEB6S2WUHVVJV7JU
X-Message-ID-Hash: MQUVZGJ5QBR6MEK3GEB6S2WUHVVJV7JU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQUVZGJ5QBR6MEK3GEB6S2WUHVVJV7JU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a common entry in enumeration table for all nau8825 boards
with/without speaker amplifier. All other rpl_nau8825_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 43 ++++++-------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 77c917897c8d..44be9077b4e0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -7,6 +7,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
@@ -365,21 +366,11 @@ static const struct snd_soc_acpi_codecs rpl_max98360a_amp = {
 	.codecs = {"MX98360A"},
 };
 
-static const struct snd_soc_acpi_codecs rpl_max98373_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98373"}
-};
-
 static const struct snd_soc_acpi_codecs rpl_lt6911_hdmi = {
 	.num_codecs = 1,
 	.codecs = {"INTC10B0"}
 };
 
-static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
-	.num_codecs = 1,
-	.codecs = {"NVTN2012"}
-};
-
 static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
 	.num_codecs = 1,
 	.codecs = {"RTL1019"}
@@ -400,27 +391,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
 	},
-	{
-		.id = "10508825",
-		.drv_name = "rpl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_max98373_amp,
-		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "rpl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_max98360a_amp,
-		.sof_tplg_filename = "sof-rpl-max98360a-nau8825.tplg",
-	},
-	{
-		.id = "10508825",
-		.drv_name = "rpl_nau8825_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_nau8318_amp,
-		.sof_tplg_filename = "sof-rpl-nau8318-nau8825.tplg",
-	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
 		.drv_name = "rpl_rt5682_def",
@@ -450,6 +420,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.id = NAU8825_ACPI_HID,
+		.drv_name = "rpl_nau8825_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
 		.drv_name = "rpl_lt6911_hdmi_ssp",
-- 
2.40.1

