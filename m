Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6575620C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4A7ADF6;
	Mon, 17 Jul 2023 13:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4A7ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594648;
	bh=HcAiVfX8941SqbdZWvTs/HtG3VAd1/g4g5CgCMgyrEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PpkfHiANVA++DefTV4eApYwGiRH/99nDq/DLo+Z2qfCVAEwi3JIv7RV7bOxfIx1tV
	 yrgMRi1CNFwf4h6ycE7F4+2aJF/AplfnBkOEu5fn8QMG+P1gtw7svjRrVY0zOS0kF0
	 pSM3isN7KfW8T3bpODCzNkLwUeYt4iMOI87DJnfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B68F8061B; Mon, 17 Jul 2023 13:46:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74269F80616;
	Mon, 17 Jul 2023 13:46:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63FB2F805F8; Mon, 17 Jul 2023 13:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA0ECF805BB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA0ECF805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wglx46Ol
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594368; x=1721130368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HcAiVfX8941SqbdZWvTs/HtG3VAd1/g4g5CgCMgyrEQ=;
  b=Wglx46OlnE30ixbd8nemCgPmjAMx/msVl57zTJOQA8jCM6DiGR1UbnN3
   qn96P4nPZbiHnd+fPaOVhWr5Y9MmYb69uvc5XhrP8WH3vTFTSycFCxqSY
   FEpipGZAK+umBGXCTgT5xdBKjqDVIcMGcpUIPuWCNtr6vf3Oi+Apxset0
   U2e/gGW3LVZtGHGS4ZFz1clrbknOvtIycJ/PKlK732/0fwAVOxeXN/x09
   3ugi7C4l1REduEvbtFGLODPwXCygBtbDhT2irKHrzBhEk1wdmFVRvKLzu
   +Jn5mL8UCxudD+p2Lb9B0sw2JfuC3bzWddH0tDt4j/DOBd7ufXz1S97Ah
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363373006"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363373006"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856563"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856563"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:46:04 -0700
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
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 14/15] ASoC: SOF: Intel: Convert to PCI device IDs defines
Date: Mon, 17 Jul 2023 13:45:10 +0200
Message-Id: <20230717114511.484999-15-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IKD4RRWVWIICDJXSKXXAHBDPWIWVIRN5
X-Message-ID-Hash: IKD4RRWVWIICDJXSKXXAHBDPWIWVIRN5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKD4RRWVWIICDJXSKXXAHBDPWIWVIRN5/>
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

