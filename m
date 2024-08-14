Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3F9516E5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 10:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F98238B;
	Wed, 14 Aug 2024 10:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F98238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723625141;
	bh=DyZHuMxRbS1WG4IuStBEf62M5sG8sNh4freCORNmw9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nmCqeb1jgCLPl6cW3/9AItLrC6RFiRZWn0fEEL8zJyi55F/KA9CuyQynggqtlkMP+
	 NopenkDW6edFPLkASATfRh2GAqdS06MwnP3p3bsxGBY5GYzI5GZ5+DNUL+D/vjQ1er
	 OuX2b5CnFHbhFYdQK+74p66UcuM3JVs+aC6M0uwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1B4DF805FB; Wed, 14 Aug 2024 10:44:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37245F805CA;
	Wed, 14 Aug 2024 10:44:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0A44F805A1; Wed, 14 Aug 2024 10:40:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC1C3F80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC1C3F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OuRZo7BJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624806; x=1755160806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DyZHuMxRbS1WG4IuStBEf62M5sG8sNh4freCORNmw9w=;
  b=OuRZo7BJDMUvGfUWzExq/gLli7YCorZrkxN9E+WCDEh5XSif2DvARDlh
   E/k/Bra5XaEVV36iSfWThFmN9RKOTugEY6H+zATxRpdHae7CXplVXzlRS
   YyytzGZPZC4XVAarB3vAAmmFIpKjkTyvx2cd9yLMEZCWsDEbeVRg1Kh5V
   b80JydAtrUQvmbKoV9++nGiV1bpCg6te3R8SlbHxYUEPh2DRqGu3RbEjG
   VIJ1GNjoe4Wgvpswy4BwTi4WEk4g9TwVG3uyYN7/TMRR87XrVkTA6qHmd
   WAr8zfUp89VhvMVum8wu//7/0wS0Ec/y4FJix495/Y29WMsksufKMBltb
   g==;
X-CSE-ConnectionGUID: 0liv1fOvQvalbI6jNojBFw==
X-CSE-MsgGUID: SbhMZsQ9QUunomRZip/xsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735110"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:00 -0700
X-CSE-ConnectionGUID: PhWAmF+5ROqGi0Ot9ZNnYg==
X-CSE-MsgGUID: QPVBvanSRt6pT1JvJafZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63867889"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:39:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 01/14] ALSA: hda: Move SST device entries to AVS
Date: Wed, 14 Aug 2024 10:39:16 +0200
Message-Id: <20240814083929.1217319-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QRXDNOY5RQBMDTFVBC4RNW6A4NAVUDIH
X-Message-ID-Hash: QRXDNOY5RQBMDTFVBC4RNW6A4NAVUDIH
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRXDNOY5RQBMDTFVBC4RNW6A4NAVUDIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The avs-driver succeeds the skylake-driver. It suppots all
configurations of its predecessor and more. Reflect that in the existing
selection table.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 111 ++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 61 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 913880b09065..f018bd779862 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -56,10 +56,59 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 /*
- * Apollolake (Broxton-P)
+ * Skylake, Kabylake, Apollolake
  * the legacy HDAudio driver is used except on Up Squared (SOF) and
  * Chromebooks (SST), as well as devices based on the ES8336 codec
  */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
+	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
+	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
 		.flags = FLAG_SOF,
@@ -81,66 +130,6 @@ static const struct config_entry config_table[] = {
 		.codec_hid =  &essx_83x6,
 	},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
-	{
-		.flags = FLAG_SST,
-		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-#endif
-/*
- * Skylake and Kabylake use legacy HDAudio driver except for Google
- * Chromebooks (SST)
- */
-
-/* Sunrise Point-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
-	{
-		.flags = FLAG_SST,
-		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
-	},
-#endif
-/* Kabylake-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
-	{
-		.flags = FLAG_SST,
-		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
-	},
-#endif
 
 /*
  * Geminilake uses legacy HDAudio driver except for Google
-- 
2.25.1

