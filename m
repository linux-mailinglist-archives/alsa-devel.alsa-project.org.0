Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE77411B1
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 14:52:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D358486E;
	Wed, 28 Jun 2023 14:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D358486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687956767;
	bh=hTPnRTkUwtolsem3NBvw6aT8UGluL8QrPCNkqZtcnBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YJ5DVZSRzAF9woSbRnYR7zEAlE4fbtUmS6jcyZ+Ow2z/ZQdTBVRGqFn2WxwJm8lBk
	 8xIyus1Zxbd8rjnlrqSsnQ0sIFi5kpZcXtyj4XK2DcphPjNGdwcPv/u6BQDKSpxWz0
	 jS63VcCG6/6ZaOlvHkBO6tvXnelSwiGMtOIXfArA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E5FFF80580; Wed, 28 Jun 2023 14:51:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D20B7F80535;
	Wed, 28 Jun 2023 14:51:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E4BF8057E; Wed, 28 Jun 2023 14:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ABDFF80212
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 14:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABDFF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LVdLsGvp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687956652; x=1719492652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hTPnRTkUwtolsem3NBvw6aT8UGluL8QrPCNkqZtcnBI=;
  b=LVdLsGvp0JMj8hx9u8PkHO7fSkLHHubTZQdcZFrQXAgRFYcW+1lLNfEd
   I9rf33bsnk4Ltlz6GnI77u3undHaHfY2pcc2YhFYjd/7vUgvPMtlRzAlH
   N8XzEbL2lb8DZZWz5tHOnsz7pgAx1iCBEsF9m1nwdeqgNIYScMOTH59Hl
   Torr7eD5Un3nrrqTDjREAVGJ5Wi/GZWQS1yIQDykwnVZykNfjo5JBxb1i
   3UJfRDPtr+aodfrRrmFVD/JkkmIhtMrR+kPn5BlDazSX0eG+wZ2QcwdYN
   TsdG9mt4lanP7Gg56Kvoo81kDZo3Nh/JLH1Yx4TguPZ7zG2aGXTmHLUYk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361875569"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="361875569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 05:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="891035062"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="891035062"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 05:50:21 -0700
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
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 2/8] ALSA: intel-dsp-config: Update PCI ID list
Date: Wed, 28 Jun 2023 22:51:29 +0200
Message-Id: <20230628205135.517241-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PSG7CVSKVHXHPNOLA5XARE4Y7USZAYVF
X-Message-ID-Hash: PSG7CVSKVHXHPNOLA5XARE4Y7USZAYVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSG7CVSKVHXHPNOLA5XARE4Y7USZAYVF/>
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

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 119 ++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 64 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 317bdf6dcbef..b3fbaf5eda3e 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -50,14 +50,14 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x119a,
+		.device = PCI_DEVICE_ID_INTEL_HDA_MRFLD,
 	},
 #endif
 /* Broxton-T */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x1a98,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL_T,
 	},
 #endif
 /*
@@ -68,7 +68,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x5a98,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Up Squared",
@@ -82,14 +82,14 @@ static const struct config_entry config_table[] = {
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
@@ -110,7 +110,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
 	{
 		.flags = FLAG_SST,
-		.device = 0x9d70,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -123,14 +123,14 @@ static const struct config_entry config_table[] = {
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
@@ -143,7 +143,7 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = 0x9d71,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
 	},
 #endif
 
@@ -155,7 +155,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x3198,
+		.device = PCI_DEVICE_ID_INTEL_HDA_GML,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -168,7 +168,7 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF,
-		.device = 0x3198,
+		.device = PCI_DEVICE_ID_INTEL_HDA_GML,
 		.codec_hid =  &essx_83x6,
 	},
 #endif
@@ -188,7 +188,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x9dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -207,12 +207,12 @@ static const struct config_entry config_table[] = {
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
 
@@ -220,7 +220,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0xa348,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -233,7 +233,7 @@ static const struct config_entry config_table[] = {
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0xa348,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
 	},
 #endif
 
@@ -241,7 +241,7 @@ static const struct config_entry config_table[] = {
 /* Cometlake-LP */
 	{
 		.flags = FLAG_SOF,
-		.device = 0x02c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -267,17 +267,17 @@ static const struct config_entry config_table[] = {
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
@@ -296,12 +296,12 @@ static const struct config_entry config_table[] = {
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
 
@@ -309,7 +309,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x34c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -322,12 +322,12 @@ static const struct config_entry config_table[] = {
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
 
@@ -335,7 +335,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0x4dc8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -348,12 +348,12 @@ static const struct config_entry config_table[] = {
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
 
@@ -361,7 +361,7 @@ static const struct config_entry config_table[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 	{
 		.flags = FLAG_SOF,
-		.device = 0xa0c8,
+		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
 				.ident = "Google Chromebooks",
@@ -380,16 +380,16 @@ static const struct config_entry config_table[] = {
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
 
@@ -397,78 +397,69 @@ static const struct config_entry config_table[] = {
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
 
@@ -549,7 +540,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	const struct config_entry *cfg;
 
 	/* Intel vendor only */
-	if (pci->vendor != 0x8086)
+	if (pci->vendor != PCI_VENDOR_ID_INTEL)
 		return SND_INTEL_DSP_DRIVER_ANY;
 
 	/*
@@ -557,12 +548,12 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
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

