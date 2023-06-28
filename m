Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD37411B3
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 14:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1CA9F6;
	Wed, 28 Jun 2023 14:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1CA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687956815;
	bh=nhJdx+gQkO+DhQGYkTpN0kiioR+GimInwgcOdzEXLAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f7VigLhKQXA3S26Pkh442UzUcuizBsaoZWizfs7Rgrr4i9DnMkmzmi9gjDZdXmkGA
	 RluDF805J1s2BjjfL+UzIX1xCvAtfWZzLPztYDF95CwpoeJiB2TczxTga/1iMUwXNv
	 7V0n/C8W4TqBgSpp/6WcCPcaUnw/5g9IJJsaIjl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 333B4F80588; Wed, 28 Jun 2023 14:51:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE506F805B1;
	Wed, 28 Jun 2023 14:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D9EF8058C; Wed, 28 Jun 2023 14:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E85CF80534
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 14:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E85CF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CLHOklPe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687956656; x=1719492656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nhJdx+gQkO+DhQGYkTpN0kiioR+GimInwgcOdzEXLAg=;
  b=CLHOklPebelNVeSI++KSo8CDfTowgvBFfjwUbWaOAE0nfhSSxhIdQTqC
   f7fCDebbGAzZv/N531F64h056PDLKkH6hJzDf4F5UinSTrfQecBOCAKEP
   RFy/jL6KI8BVfFAJQQj/9GxkUeIAfPenBpEO6QiVUYwwkF3T1hnPtwZW3
   P/WzmmaOQY3Dd+w0xF5HZhWlxzfavCDmKkDWqfF2YSTaicFNY00edROeF
   gkpYs5jdTUW5YO96nAsdnAhrNpdcaxLbmg6nMRQpxeMxSI5HpbfmCEpV+
   j3bNNjoX8Iwhq9kn8XTxpCB/x+rVXQYtKNlH0yA1V1wOZIhLU9UKmx4Hm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361875606"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="361875606"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 05:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="891035129"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="891035129"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 05:50:37 -0700
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
Subject: [RFC PATCH 7/8] ASoC: Intel: Skylake: Update PCI ID list
Date: Wed, 28 Jun 2023 22:51:34 +0200
Message-Id: <20230628205135.517241-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HFQWG4RMEESRANGU2LUX7D4IOEJONRDE
X-Message-ID-Hash: HFQWG4RMEESRANGU2LUX7D4IOEJONRDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFQWG4RMEESRANGU2LUX7D4IOEJONRDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header and while at it change to using
PCI_DEVICE_DATA macro, to simplify declarations.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/skylake/skl-messages.c | 16 ++++++------
 sound/soc/intel/skylake/skl.c          | 36 +++++++-------------------
 2 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index d31509298a0a..fc2eb04da172 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -169,7 +169,7 @@ static struct skl_dsp_loader_ops bxt_get_loader_ops(void)
 
 static const struct skl_dsp_ops dsp_ops[] = {
 	{
-		.id = 0x9d70,
+		.id = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
 		.num_cores = 2,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
@@ -177,7 +177,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
-		.id = 0x9d71,
+		.id = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
 		.num_cores = 2,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
@@ -185,7 +185,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
-		.id = 0x5a98,
+		.id = PCI_DEVICE_ID_INTEL_HDA_APL,
 		.num_cores = 2,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
@@ -193,7 +193,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
-		.id = 0x3198,
+		.id = PCI_DEVICE_ID_INTEL_HDA_GML,
 		.num_cores = 2,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
@@ -201,7 +201,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
-		.id = 0x9dc8,
+		.id = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
@@ -209,7 +209,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
-		.id = 0xa348,
+		.id = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
@@ -217,7 +217,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
-		.id = 0x02c8,
+		.id = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
@@ -225,7 +225,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
-		.id = 0x06c8,
+		.id = PCI_DEVICE_ID_INTEL_HDA_CML_H,
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 998bd0232cf1..b17bce07e401 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -608,8 +608,8 @@ struct skl_clk_parent_src *skl_get_parent_clk(u8 clk_id)
 static void init_skl_xtal_rate(int pci_id)
 {
 	switch (pci_id) {
-	case 0x9d70:
-	case 0x9d71:
+	case PCI_DEVICE_ID_INTEL_HDA_SKL_LP:
+	case PCI_DEVICE_ID_INTEL_HDA_KBL_LP:
 		skl_clk_src[0].rate = 24000000;
 		return;
 
@@ -1145,44 +1145,28 @@ static void skl_remove(struct pci_dev *pci)
 /* PCI IDs */
 static const struct pci_device_id skl_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
-	/* Sunrise Point-LP */
-	{ PCI_DEVICE(0x8086, 0x9d70),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_skl_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP,	&snd_soc_acpi_intel_skl_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
-	/* BXT-P */
-	{ PCI_DEVICE(0x8086, 0x5a98),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_bxt_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_APL,	&snd_soc_acpi_intel_bxt_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
-	/* KBL */
-	{ PCI_DEVICE(0x8086, 0x9D71),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_kbl_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP,	&snd_soc_acpi_intel_kbl_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
-	/* GLK */
-	{ PCI_DEVICE(0x8086, 0x3198),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_glk_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_GML,	&snd_soc_acpi_intel_glk_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CNL)
-	/* CNL */
-	{ PCI_DEVICE(0x8086, 0x9dc8),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_LP,	&snd_soc_acpi_intel_cnl_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CFL)
-	/* CFL */
-	{ PCI_DEVICE(0x8086, 0xa348),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_H,	&snd_soc_acpi_intel_cnl_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
-	/* CML-LP */
-	{ PCI_DEVICE(0x8086, 0x02c8),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP,	&snd_soc_acpi_intel_cnl_machines) },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
-	/* CML-H */
-	{ PCI_DEVICE(0x8086, 0x06c8),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_H,	&snd_soc_acpi_intel_cnl_machines) },
 #endif
 	{ 0, }
 };
-- 
2.34.1

