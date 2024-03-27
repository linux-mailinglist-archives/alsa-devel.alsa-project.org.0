Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37688EB38
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:28:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D172C29;
	Wed, 27 Mar 2024 17:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D172C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556931;
	bh=Ir7vtaKEGyf7DswIMMovVREmiqNtlXRIc3iQIBZQ54k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j2q2+7oia1OZ+CdBlh7SjN1Aa6UHs8RBbG9DlViq9ODCTsXywFKr3AFwCOO55+kvH
	 zNzVB4ZHd/2ftrpXVD0ceLl1jCxCSZ1tTSlYxLhOUEUtRO7+ANycWl6yNXE6woDIud
	 fXqbNqRfr2GtPKArVMwHGsCdv+tmvoMkCRcuMNHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B5EF80852; Wed, 27 Mar 2024 17:25:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 119F4F80808;
	Wed, 27 Mar 2024 17:25:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1CD0F806B5; Wed, 27 Mar 2024 17:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42BE8F8057B
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42BE8F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bhyM2A2w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556682; x=1743092682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ir7vtaKEGyf7DswIMMovVREmiqNtlXRIc3iQIBZQ54k=;
  b=bhyM2A2wtm70azqcPv8YC2lTez1VqSfhWC7meOT7PDVWKDJZ8npL2O/J
   cwCcdBrrDAANb3izry9DfCwtTOCpUhItkR+wr5tFCPcIIKVOVpgAnj1T/
   3Msx4Uu53GOYVHZcGNdHUtuksBZXdNZCKrUwbhm/QIpJbB6S+tdFzODqm
   evtdfUIPW82wcFTxnSQWldRuU7wInwlDvxBE9h4MxpJCH2xBKzmJk4GR7
   DaiXsuN7QTukDYRZIw2UdzCRxkd2EZUZYJ6zLnpJSrg9v+fnYgpi8VKoW
   6o/CxdKzV5wAwwAFUYu9OXS1L79UBW18SrNRkJBDvi6gZAe78IY5kR602
   Q==;
X-CSE-ConnectionGUID: Cey6kWspSPWCicHHuwdyPg==
X-CSE-MsgGUID: 6ZZ3zYd9QQOocKane1VWKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221559"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821328"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/18] ASoC: Intel: sof_rt5682: mach cleanup for mtl boards
Date: Wed, 27 Mar 2024 11:24:04 -0500
Message-Id: <20240327162408.63953-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VNHA5B2TE6G7JUAY2UVUEPKGYS4X7IDR
X-Message-ID-Hash: VNHA5B2TE6G7JUAY2UVUEPKGYS4X7IDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNHA5B2TE6G7JUAY2UVUEPKGYS4X7IDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add two common entries in enumeration table for all rt5682/rt5650
boards with/without speaker amplifier. All other mtl_rt5682_def
entries become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 40 +++++++------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 0125e81af9e1..7f422848a3ba 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -21,14 +21,9 @@ static const struct snd_soc_acpi_codecs mtl_max98360a_amp = {
 	.codecs = {"MX98360A"}
 };
 
-static const struct snd_soc_acpi_codecs mtl_rt1019p_amp = {
-	.num_codecs = 1,
-	.codecs = {"RTL1019"}
-};
-
 static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs mtl_essx_83x6 = {
@@ -41,11 +36,6 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
-static const struct snd_soc_acpi_codecs mtl_rt5650_amp = {
-	.num_codecs = 1,
-	.codecs = {"10EC5650"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
@@ -61,13 +51,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_max98360a_amp,
 		.sof_tplg_filename = "sof-mtl-max98360a-rt5682.tplg",
 	},
-	{
-		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_rt1019p_amp,
-		.sof_tplg_filename = "sof-mtl-rt1019-rt5682.tplg",
-	},
 	{
 		.comp_ids = &mtl_essx_83x6,
 		.drv_name = "mtl_es83x6_c1_h02",
@@ -83,13 +66,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
-	{
-		.id = "10EC5650",
-		.drv_name = "mtl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_rt5650_amp,
-		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
-	},
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
@@ -100,6 +76,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = RT5650_ACPI_HID,
+		.drv_name = "mtl_rt5682_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	{
+		.comp_ids = &mtl_rt5682_rt5682s_hp,
+		.drv_name = "mtl_rt5682_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
-- 
2.40.1

