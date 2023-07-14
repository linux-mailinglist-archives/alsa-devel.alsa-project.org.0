Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B5753AFD
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2799EDEF;
	Fri, 14 Jul 2023 14:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2799EDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689337780;
	bh=ekNwv98jwJrvBpOPazw7qyPi9c2zelcSvTeCXojIHUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Br5E/UYcyY6WvrkVxJzfyJZ4Ci1ntcR4cm1u0/aisYPDIFpThAANio7AK7g/p2N2y
	 8B5pEgtRy+CeiOmDKoldXsZESkwv96r0Hyi5F5ey70tmPkiaVO8FfSeYTm6QJB9lKL
	 Gw4IFKAG4FiCcYEnK2eG4fOS0Q+Wi8TktqfbJFMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AD85F80630; Fri, 14 Jul 2023 14:25:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1840CF80621;
	Fri, 14 Jul 2023 14:25:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73EAFF805F0; Fri, 14 Jul 2023 14:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28647F80578
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28647F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XP2Mc726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689337465; x=1720873465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ekNwv98jwJrvBpOPazw7qyPi9c2zelcSvTeCXojIHUk=;
  b=XP2Mc726qVTn/ZNtlChWgQ+dG0gA7Z+R6KHyJgKH0K8ZuBw0mCCe5F0l
   L4CZLcZwBAYVHYSbv/XtIuaWoYiUWBNqyL3zDI+i/2S0IauGaACQPifmd
   iXH+1Om1htWJcldgfstpZdbV8saP6q7X7Jvj7Tj71cv6fG+ZI8LxK8JYt
   dj4m/l1m+NPcZ1yp+pxZOD8uSpOcY9/5RcouNIVx7F/G8st4SkHYTJGo1
   VJr+uNAq5nb0kcIOpSdw/ydd0iHbbYXAGNxQbLeO5KMctAJI2qL25Ker7
   ZSnej3CmR5x6qFC1x3ssIOtOFPotTTgPrp3/T+mYhyYB0UbF7C7qLEFof
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429225919"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="429225919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053035011"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="1053035011"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 05:24:20 -0700
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
Subject: [PATCH v3 14/15] ASoC: SOF: Intel: Convert to PCI device IDs defines
Date: Fri, 14 Jul 2023 22:24:56 +0200
Message-Id: <20230714202457.423866-15-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZR2T6MPDMAZ4IRRLHQ2P77SPZP34CLPG
X-Message-ID-Hash: ZR2T6MPDMAZ4IRRLHQ2P77SPZP34CLPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZR2T6MPDMAZ4IRRLHQ2P77SPZP34CLPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header and while at it change to using
PCI_DEVICE_DATA() macro, to simplify declarations.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/sof/intel/pci-apl.c |  6 ++---
 sound/soc/sof/intel/pci-cnl.c | 15 ++++--------
 sound/soc/sof/intel/pci-icl.c | 12 ++++------
 sound/soc/sof/intel/pci-mtl.c |  3 +--
 sound/soc/sof/intel/pci-skl.c |  6 ++---
 sound/soc/sof/intel/pci-tgl.c | 45 ++++++++++++-----------------------
 sound/soc/sof/intel/pci-tng.c |  3 +--
 7 files changed, 30 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index bc3ad64baec5..460f87f25dac 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -85,10 +85,8 @@ static const struct sof_dev_desc glk_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	{ PCI_DEVICE(0x8086, 0x5a98), /* BXT-P (ApolloLake) */
-		.driver_data = (unsigned long)&bxt_desc},
-	{ PCI_DEVICE(0x8086, 0x3198), /* GeminiLake */
-		.driver_data = (unsigned long)&glk_desc},
+	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &bxt_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_GML, &glk_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 8895508a0be6..e2c50e7b0aa7 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -120,16 +120,11 @@ static const struct sof_dev_desc cml_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	{ PCI_DEVICE(0x8086, 0x9dc8), /* CNL-LP */
-		.driver_data = (unsigned long)&cnl_desc},
-	{ PCI_DEVICE(0x8086, 0xa348), /* CNL-H */
-		.driver_data = (unsigned long)&cfl_desc},
-	{ PCI_DEVICE(0x8086, 0x02c8), /* CML-LP */
-		.driver_data = (unsigned long)&cml_desc},
-	{ PCI_DEVICE(0x8086, 0x06c8), /* CML-H */
-		.driver_data = (unsigned long)&cml_desc},
-	{ PCI_DEVICE(0x8086, 0xa3f0), /* CML-S */
-		.driver_data = (unsigned long)&cml_desc},
+	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_LP, &cnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_H, &cfl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP, &cml_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_H, &cml_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S, &cml_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 5fb5a820693e..0a65df3ed9e2 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -86,14 +86,10 @@ static const struct sof_dev_desc jsl_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	{ PCI_DEVICE(0x8086, 0x34C8), /* ICL-LP */
-		.driver_data = (unsigned long)&icl_desc},
-	{ PCI_DEVICE(0x8086, 0x3dc8), /* ICL-H */
-		.driver_data = (unsigned long)&icl_desc},
-	{ PCI_DEVICE(0x8086, 0x38c8), /* ICL-N */
-		.driver_data = (unsigned long)&jsl_desc},
-	{ PCI_DEVICE(0x8086, 0x4dc8), /* JSL-N */
-		.driver_data = (unsigned long)&jsl_desc},
+	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_LP, &icl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_H, &icl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_N, &jsl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_JSL_N, &jsl_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index e276e1e37fed..7868b0827e84 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -52,8 +52,7 @@ static const struct sof_dev_desc mtl_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	{ PCI_DEVICE(0x8086, 0x7E28), /* MTL */
-		.driver_data = (unsigned long)&mtl_desc},
+	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, &mtl_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 5e69af6eed34..a6588b138a8c 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -69,10 +69,8 @@ static struct sof_dev_desc kbl_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	/* Sunrise Point-LP */
-	{ PCI_DEVICE(0x8086, 0x9d70), .driver_data = (unsigned long)&skl_desc},
-	/* KBL */
-	{ PCI_DEVICE(0x8086, 0x9d71), .driver_data = (unsigned long)&kbl_desc},
+	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP, &kbl_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index ca37ff1bbd2a..d688f9373fb2 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -284,36 +284,21 @@ static const struct sof_dev_desc rpl_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
-		.driver_data = (unsigned long)&tgl_desc},
-	{ PCI_DEVICE(0x8086, 0x43c8), /* TGL-H */
-		.driver_data = (unsigned long)&tglh_desc},
-	{ PCI_DEVICE(0x8086, 0x4b55), /* EHL */
-		.driver_data = (unsigned long)&ehl_desc},
-	{ PCI_DEVICE(0x8086, 0x4b58), /* EHL */
-		.driver_data = (unsigned long)&ehl_desc},
-	{ PCI_DEVICE(0x8086, 0x7ad0), /* ADL-S */
-		.driver_data = (unsigned long)&adls_desc},
-	{ PCI_DEVICE(0x8086, 0x7a50), /* RPL-S */
-		.driver_data = (unsigned long)&rpls_desc},
-	{ PCI_DEVICE(0x8086, 0x51c8), /* ADL-P */
-		.driver_data = (unsigned long)&adl_desc},
-	{ PCI_DEVICE(0x8086, 0x51c9), /* ADL-PS */
-		.driver_data = (unsigned long)&adl_desc},
-	{ PCI_DEVICE(0x8086, 0x51ca), /* RPL-P */
-		.driver_data = (unsigned long)&rpl_desc},
-	{ PCI_DEVICE(0x8086, 0x51cb), /* RPL-P */
-		.driver_data = (unsigned long)&rpl_desc},
-	{ PCI_DEVICE(0x8086, 0x51cc), /* ADL-M */
-		.driver_data = (unsigned long)&adl_desc},
-	{ PCI_DEVICE(0x8086, 0x51cd), /* ADL-P */
-		.driver_data = (unsigned long)&adl_desc},
-	{ PCI_DEVICE(0x8086, 0x51ce), /* RPL-M */
-		.driver_data = (unsigned long)&rpl_desc},
-	{ PCI_DEVICE(0x8086, 0x51cf), /* RPL-PX */
-		.driver_data = (unsigned long)&rpl_desc},
-	{ PCI_DEVICE(0x8086, 0x54c8), /* ADL-N */
-		.driver_data = (unsigned long)&adl_n_desc},
+	{ PCI_DEVICE_DATA(INTEL, HDA_TGL_LP, &tgl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_TGL_H, &tglh_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_EHL_0, &ehl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_EHL_3, &ehl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_S, &adls_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_S, &rpls_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_P, &adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PS, &adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_0, &rpl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_1, &rpl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_M, &adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PX, &adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M, &rpl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX, &rpl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_N, &adl_n_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 8c22a00266c0..4ae4fe17cc0b 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -225,8 +225,7 @@ static const struct sof_dev_desc tng_desc = {
 
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
-	{ PCI_DEVICE(0x8086, 0x119a),
-		.driver_data = (unsigned long)&tng_desc},
+	{ PCI_DEVICE_DATA(INTEL, SST_TNG, &tng_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.34.1

