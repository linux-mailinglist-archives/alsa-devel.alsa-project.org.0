Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9E753AED
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:28:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A0F83B;
	Fri, 14 Jul 2023 14:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A0F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689337709;
	bh=jKFPbTHoA2uU7RWBMJDbq4wYBw/0LJsv7WL6ODM/3Ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y8Iibkcy/e9JZeYOBzzOfHL9hM++0GnkJjrxMqXMDtoeoE0RARGgKDxn8O2pq2j5V
	 sNSpN/5JGiUg92kOTUel5vu4vnOul26L1bU5VdOb+SHpUU1JBxr6f/03obUbKLxxUb
	 mdjizHT5lALzP5M5FCy4BDJs+mHe763TSA5U/cBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F88EF80578; Fri, 14 Jul 2023 14:24:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0D6F805EF;
	Fri, 14 Jul 2023 14:24:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 025DBF805C2; Fri, 14 Jul 2023 14:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 593CEF8053B
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 593CEF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jBsFB6t9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689337450; x=1720873450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jKFPbTHoA2uU7RWBMJDbq4wYBw/0LJsv7WL6ODM/3Ww=;
  b=jBsFB6t9cx8Jv2wLie9T06rKkJ62Zq2n5pNkZrZrD9wsvbuK1cB6tLKc
   7+yrWNlxihTgi7X8EnQA34sF31NCVz5/7hFWMi/e1LH1mGZA0B8ISSxPy
   1wZWqxCDCfOsKlkXB1tiLO23IhIpsD67fTM/nyKfBuoB442voUIKxZzia
   fHJTqkywCAPFzzdSf564Dk5SwJByxgTe4lyB55EbLK250vOdzFVG0c0vA
   1u9jTFv0h8BbLpaVx7rHZP9QGD8fuBZTwzW6sqXg5L41mLLiApk2/tC6b
   LT/OaeTmCgngjOcldkocI8ns2+s3BHlt+drtZEXytR6skotqy9uNRaAQh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429225871"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="429225871"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053034950"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="1053034950"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 05:24:05 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 09/15] ALSA: intel-dsp-config: Convert to PCI device IDs
 defines
Date: Fri, 14 Jul 2023 22:24:51 +0200
Message-Id: <20230714202457.423866-10-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FFH6C63ELW5ETWYRSDJNYDLTIA252B62
X-Message-ID-Hash: FFH6C63ELW5ETWYRSDJNYDLTIA252B62
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFH6C63ELW5ETWYRSDJNYDLTIA252B62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header. Also simplify comments for
Alder Lake and Raptor Lake platforms, as new IDs make it clear what
revision is in use.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # for Intel Tangier ID
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 117 ++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 63 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 5cee995f7a42..48bd1fb06f26 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -50,7 +50,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x119a,
+		.device = PCI_DEVICE_ID_INTEL_SST_TNG,
 	},
 #endif
 /*
@@ -61,7 +61,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x5a98,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Up Squared",
@@ -75,14 +75,14 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x5a98,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
 		.codec_hid =  &essx_83x6,
 	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
 	{
 		.flags = FLAG_SST,
-		.device = 0x5a98,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -103,7 +103,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
 	{
 		.flags = FLAG_SST,
-		.device = 0x9d70,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -116,14 +116,14 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = 0x9d70,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
 	},
 #endif
 /* Kabylake-LP */
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
 	{
 		.flags = FLAG_SST,
-		.device = 0x9d71,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -136,7 +136,7 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = 0x9d71,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
 	},
 #endif
 
@@ -148,7 +148,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x3198,
+		.device = PCI_DEVICE_ID_INTEL_HDA_GML,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -161,7 +161,7 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x3198,
+		.device = PCI_DEVICE_ID_INTEL_HDA_GML,
 		.codec_hid =  &essx_83x6,
 	},
 #endif
@@ -181,7 +181,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x9dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -200,12 +200,12 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x09dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x9dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 	},
 #endif
 
@@ -213,7 +213,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0xa348,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -226,7 +226,7 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0xa348,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
 	},
 #endif
 
@@ -234,7 +234,7 @@ static const struct config_entry config_table[] = {
 /* Cometlake-LP */
 	{
 		.flags = FLAG_SOF,
-		.device = 0x02c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -260,17 +260,17 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x02c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x02c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 	},
 /* Cometlake-H */
 	{
 		.flags = FLAG_SOF,
-		.device = 0x06c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.matches = {
@@ -289,12 +289,12 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x06c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x06c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
 	},
 #endif
 
@@ -302,7 +302,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x34c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -315,12 +315,12 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x34c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x34c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
 	},
 #endif
 
@@ -328,7 +328,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x4dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -341,12 +341,12 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x4dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x4dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
 	},
 #endif
 
@@ -354,7 +354,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0xa0c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -373,16 +373,16 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0xa0c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0xa0c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x43c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_H,
 	},
 #endif
 
@@ -390,78 +390,69 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x4b55,
+		.device = PCI_DEVICE_ID_INTEL_HDA_EHL_0,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
-		.device = 0x4b58,
+		.device = PCI_DEVICE_ID_INTEL_HDA_EHL_3,
 	},
 #endif
 
-/* Alder Lake */
+/* Alder Lake / Raptor Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
-	/* Alderlake-S */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x7ad0,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
 	},
-	/* RaptorLake-S */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x7a50,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_S,
 	},
-	/* Alderlake-P */
 	{
 		.flags = FLAG_SOF,
-		.device = 0x51c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51cd,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PX,
 	},
-	/* Alderlake-PS */
 	{
 		.flags = FLAG_SOF,
-		.device = 0x51c9,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
 		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51c9,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
 	},
-	/* Alderlake-M */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51cc,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_M,
 	},
-	/* Alderlake-N */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x54c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
 	},
-	/* RaptorLake-P */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51ca,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51cb,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
 	},
-	/* RaptorLake-M */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51ce,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
 	},
-	/* RaptorLake-PX */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51cf,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,
 	},
 #endif
 
@@ -542,7 +533,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	const struct config_entry *cfg;
 
 	/* Intel vendor only */
-	if (pci->vendor != 0x8086)
+	if (pci->vendor != PCI_VENDOR_ID_INTEL)
 		return SND_INTEL_DSP_DRIVER_ANY;
 
 	/*
@@ -550,12 +541,12 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	 * for HDMI/DP support, ignore kernel parameter
 	 */
 	switch (pci->device) {
-	case 0x160c: /* Broadwell */
-	case 0x0a0c: /* Haswell */
-	case 0x0c0c:
-	case 0x0d0c:
-	case 0x0f04: /* Baytrail */
-	case 0x2284: /* Braswell */
+	case PCI_DEVICE_ID_INTEL_HDA_BDW:
+	case PCI_DEVICE_ID_INTEL_HDA_HSW_0:
+	case PCI_DEVICE_ID_INTEL_HDA_HSW_2:
+	case PCI_DEVICE_ID_INTEL_HDA_HSW_3:
+	case PCI_DEVICE_ID_INTEL_HDA_BYT:
+	case PCI_DEVICE_ID_INTEL_HDA_BSW:
 		return SND_INTEL_DSP_DRIVER_ANY;
 	}
 
-- 
2.34.1

