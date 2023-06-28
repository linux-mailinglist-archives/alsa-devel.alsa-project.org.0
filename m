Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132647411C5
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 14:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6273E3E8;
	Wed, 28 Jun 2023 14:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6273E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687956865;
	bh=95RFg2ewWlGn+771zoKZyRwSjsEe+PYb1VaZIGOtWp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AdywA4l7OB50yS3B+o/bz5VslcXa8KeiG8ibv8rYwUJRjKT/AuQG+Xl3VetAo8fpJ
	 7OKq0Koozl31UDIlhv70o/yCgppaP/Xa37/+58AAwsyJPpzMeqcKjRqzF+CNfZ5R7b
	 lxceBTW0SihikbTbJOlrxPXWRnvSjy4Z7P+9ENP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CFC9F805DF; Wed, 28 Jun 2023 14:51:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C380F805D7;
	Wed, 28 Jun 2023 14:51:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E603F805D8; Wed, 28 Jun 2023 14:51:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49F0FF8027B
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 14:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F0FF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kz6GDcp5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687956652; x=1719492652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=95RFg2ewWlGn+771zoKZyRwSjsEe+PYb1VaZIGOtWp0=;
  b=kz6GDcp5RmI7NZPm1lij5SUf+a1l7idlNuhbDVoIM9oN4KNcQ1Em7id0
   MtMdO5hIqlxYgxoABjzmHfbd+aghdUI2REk4m58i9mNVr1MP2bWTZfrS8
   FpnhrMJCkcJI+LVd2MY1xVEg//9yl9kZAeooAvJdEM7y2WjCbBgSuWki/
   XYQTaqgZMARGtIUSaQsHyFtz/4ODXcju039T8gfNRV2scu1lMFJcn0YXm
   O9PrbCQNF1hrA+kc2RtPUQfEznNexpDKHjvZwi7OPzy7h0MBEU3lbhqe1
   snOVcyFomfGsVShi8hke/Zytn/P0ECBydf/hWoZw71Iv/DTd33i5xCCL+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361875577"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="361875577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 05:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="891035084"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="891035084"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 05:50:25 -0700
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
Subject: [RFC PATCH 3/8] ALSA: hda: Update PCI ID list
Date: Wed, 28 Jun 2023 22:51:30 +0200
Message-Id: <20230628205135.517241-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FE2XUVYEJCUW44RW4LD3NKOATN7R67IJ
X-Message-ID-Hash: FE2XUVYEJCUW44RW4LD3NKOATN7R67IJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FE2XUVYEJCUW44RW4LD3NKOATN7R67IJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header and while at it change to using
PCI_VDEVICE macro, to simplify declarations. This allows to change magic
number PCI vendor IDs to macro ones for all vendors. For Intel devices
use device IDs macros where defined.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 292 +++++++++++++++++++-------------------
 1 file changed, 146 insertions(+), 146 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3226691ac923..0abc3258cada 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -329,17 +329,18 @@ enum {
 #define needs_eld_notify_link(chip)	false
 #endif
 
-#define CONTROLLER_IN_GPU(pci) (((pci)->vendor == 0x8086) &&         \
-				       (((pci)->device == 0x0a0c) || \
-					((pci)->device == 0x0c0c) || \
-					((pci)->device == 0x0d0c) || \
-					((pci)->device == 0x160c) || \
+#define CONTROLLER_IN_GPU(pci) (((pci)->vendor == PCI_VENDOR_ID_INTEL) &&			\
+					(((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_0) ||	\
+					((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_2) ||	\
+					((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_3) ||	\
+					((pci)->device == PCI_DEVICE_ID_INTEL_HDA_BDW) ||	\
 					((pci)->device == 0x490d) || \
 					((pci)->device == 0x4f90) || \
 					((pci)->device == 0x4f91) || \
 					((pci)->device == 0x4f92)))
 
-#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
+#define IS_APL(pci) ((pci)->vendor == PCI_VENDOR_ID_INTEL && \
+					(pci)->device == PCI_DEVICE_ID_INTEL_HDA_APL)
 
 static const char * const driver_short_names[] = {
 	[AZX_DRIVER_ICH] = "HDA Intel",
@@ -571,7 +572,7 @@ static void hda_intel_init_chip(struct azx *chip, bool full_reset)
 	snd_hdac_set_codec_wakeup(bus, false);
 
 	/* reduce dma latency to avoid noise */
-	if (IS_BXT(pci))
+	if (IS_APL(pci))
 		bxt_reduce_dma_latency(chip);
 
 	if (bus->mlcap != NULL)
@@ -2413,199 +2414,198 @@ static void azx_shutdown(struct pci_dev *pci)
 /* PCI IDs */
 static const struct pci_device_id azx_ids[] = {
 	/* CPT */
-	{ PCI_DEVICE(0x8086, 0x1c20),
+	{ PCI_VDEVICE(INTEL, 0x1c20),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },
 	/* PBG */
-	{ PCI_DEVICE(0x8086, 0x1d20),
+	{ PCI_VDEVICE(INTEL, 0x1d20),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },
 	/* Panther Point */
-	{ PCI_DEVICE(0x8086, 0x1e20),
+	{ PCI_VDEVICE(INTEL, 0x1e20),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },
 	/* Lynx Point */
-	{ PCI_DEVICE(0x8086, 0x8c20),
+	{ PCI_VDEVICE(INTEL, 0x8c20),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
 	/* 9 Series */
-	{ PCI_DEVICE(0x8086, 0x8ca0),
+	{ PCI_VDEVICE(INTEL, 0x8ca0),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
 	/* Wellsburg */
-	{ PCI_DEVICE(0x8086, 0x8d20),
+	{ PCI_VDEVICE(INTEL, 0x8d20),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
-	{ PCI_DEVICE(0x8086, 0x8d21),
+	{ PCI_VDEVICE(INTEL, 0x8d21),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
 	/* Lewisburg */
-	{ PCI_DEVICE(0x8086, 0xa1f0),
+	{ PCI_VDEVICE(INTEL, 0xa1f0),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_SKYLAKE },
-	{ PCI_DEVICE(0x8086, 0xa270),
+	{ PCI_VDEVICE(INTEL, 0xa270),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_SKYLAKE },
 	/* Lynx Point-LP */
-	{ PCI_DEVICE(0x8086, 0x9c20),
+	{ PCI_VDEVICE(INTEL, 0x9c20),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
 	/* Lynx Point-LP */
-	{ PCI_DEVICE(0x8086, 0x9c21),
+	{ PCI_VDEVICE(INTEL, 0x9c21),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
 	/* Wildcat Point-LP */
-	{ PCI_DEVICE(0x8086, 0x9ca0),
+	{ PCI_VDEVICE(INTEL, 0x9ca0),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH },
-	/* Sunrise Point */
-	{ PCI_DEVICE(0x8086, 0xa170),
+	/* Skylake (Sunrise Point) */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_SKL),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE },
-	/* Sunrise Point-LP */
-	{ PCI_DEVICE(0x8086, 0x9d70),
+	/* Skylake-LP (Sunrise Point-LP) */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_SKL_LP),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE },
 	/* Kabylake */
-	{ PCI_DEVICE(0x8086, 0xa171),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_KBL),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE },
 	/* Kabylake-LP */
-	{ PCI_DEVICE(0x8086, 0x9d71),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_KBL_LP),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE },
 	/* Kabylake-H */
-	{ PCI_DEVICE(0x8086, 0xa2f0),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_KBL_H),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE },
 	/* Coffelake */
-	{ PCI_DEVICE(0x8086, 0xa348),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_CNL_H),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Cannonlake */
-	{ PCI_DEVICE(0x8086, 0x9dc8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_CNL_LP),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* CometLake-LP */
-	{ PCI_DEVICE(0x8086, 0x02C8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_CML_LP),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* CometLake-H */
-	{ PCI_DEVICE(0x8086, 0x06C8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_CML_H),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0xf1c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_RKL_S),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* CometLake-S */
-	{ PCI_DEVICE(0x8086, 0xa3f0),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_CML_S),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* CometLake-R */
-	{ PCI_DEVICE(0x8086, 0xf0c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_CML_R),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Icelake */
-	{ PCI_DEVICE(0x8086, 0x34c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ICL_LP),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Icelake-H */
-	{ PCI_DEVICE(0x8086, 0x3dc8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ICL_H),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Jasperlake */
-	{ PCI_DEVICE(0x8086, 0x38c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ICL_N),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x4dc8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_JSL_N),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Tigerlake */
-	{ PCI_DEVICE(0x8086, 0xa0c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_TGL_LP),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Tigerlake-H */
-	{ PCI_DEVICE(0x8086, 0x43c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_TGL_H),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* DG1 */
-	{ PCI_DEVICE(0x8086, 0x490d),
+	{ PCI_VDEVICE(INTEL, 0x490d),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* DG2 */
-	{ PCI_DEVICE(0x8086, 0x4f90),
+	{ PCI_VDEVICE(INTEL, 0x4f90),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x4f91),
+	{ PCI_VDEVICE(INTEL, 0x4f91),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x4f92),
+	{ PCI_VDEVICE(INTEL, 0x4f92),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-S */
-	{ PCI_DEVICE(0x8086, 0x7ad0),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ADL_S),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-P */
-	{ PCI_DEVICE(0x8086, 0x51c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ADL_P),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x51c9),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ADL_PS),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x51cd),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ADL_PX),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-M */
-	{ PCI_DEVICE(0x8086, 0x51cc),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ADL_M),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-N */
-	{ PCI_DEVICE(0x8086, 0x54c8),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_ADL_N),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Elkhart Lake */
-	{ PCI_DEVICE(0x8086, 0x4b55),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_EHL_0),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x4b58),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_EHL_3),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Raptor Lake */
-	{ PCI_DEVICE(0x8086, 0x7a50),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_RPL_S),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x51ca),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_RPL_P_0),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x51cb),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_RPL_P_1),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x51ce),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_RPL_M),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	{ PCI_DEVICE(0x8086, 0x51cf),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_RPL_PX),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	/* Meteorlake-P */
-	{ PCI_DEVICE(0x8086, 0x7e28),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_MTL),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Lunarlake-P */
-	{ PCI_DEVICE(0x8086, 0xa828),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_LNL_P),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-	/* Broxton-P(Apollolake) */
-	{ PCI_DEVICE(0x8086, 0x5a98),
+	/* Apollolake (Broxton-P) */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_APL),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
 	/* Broxton-T */
-	{ PCI_DEVICE(0x8086, 0x1a98),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_APL_T),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
 	/* Gemini-Lake */
-	{ PCI_DEVICE(0x8086, 0x3198),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_GML),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
 	/* Haswell */
-	{ PCI_DEVICE(0x8086, 0x0a0c),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_0),
 	  .driver_data = AZX_DRIVER_HDMI | AZX_DCAPS_INTEL_HASWELL },
-	{ PCI_DEVICE(0x8086, 0x0c0c),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_2),
 	  .driver_data = AZX_DRIVER_HDMI | AZX_DCAPS_INTEL_HASWELL },
-	{ PCI_DEVICE(0x8086, 0x0d0c),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_3),
 	  .driver_data = AZX_DRIVER_HDMI | AZX_DCAPS_INTEL_HASWELL },
 	/* Broadwell */
-	{ PCI_DEVICE(0x8086, 0x160c),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_BDW),
 	  .driver_data = AZX_DRIVER_HDMI | AZX_DCAPS_INTEL_BROADWELL },
 	/* 5 Series/3400 */
-	{ PCI_DEVICE(0x8086, 0x3b56),
+	{ PCI_VDEVICE(INTEL, 0x3b56),
 	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_NOPM },
-	{ PCI_DEVICE(0x8086, 0x3b57),
+	{ PCI_VDEVICE(INTEL, 0x3b57),
 	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_NOPM },
 	/* Poulsbo */
-	{ PCI_DEVICE(0x8086, 0x811b),
+	{ PCI_VDEVICE(INTEL, 0x811b),
 	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_BASE |
 	  AZX_DCAPS_POSFIX_LPIB },
 	/* Oaktrail */
-	{ PCI_DEVICE(0x8086, 0x080a),
+	{ PCI_VDEVICE(INTEL, 0x080a),
 	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_BASE },
 	/* BayTrail */
-	{ PCI_DEVICE(0x8086, 0x0f04),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_BYT),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_BAYTRAIL },
 	/* Braswell */
-	{ PCI_DEVICE(0x8086, 0x2284),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_HDA_BSW),
 	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_BRASWELL },
 	/* ICH6 */
-	{ PCI_DEVICE(0x8086, 0x2668),
+	{ PCI_VDEVICE(INTEL, 0x2668),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ICH7 */
-	{ PCI_DEVICE(0x8086, 0x27d8),
+	{ PCI_VDEVICE(INTEL, 0x27d8),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ESB2 */
-	{ PCI_DEVICE(0x8086, 0x269a),
+	{ PCI_VDEVICE(INTEL, 0x269a),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ICH8 */
-	{ PCI_DEVICE(0x8086, 0x284b),
+	{ PCI_VDEVICE(INTEL, 0x284b),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ICH9 */
-	{ PCI_DEVICE(0x8086, 0x293e),
+	{ PCI_VDEVICE(INTEL, 0x293e),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ICH9 */
-	{ PCI_DEVICE(0x8086, 0x293f),
+	{ PCI_VDEVICE(INTEL, 0x293f),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ICH10 */
-	{ PCI_DEVICE(0x8086, 0x3a3e),
+	{ PCI_VDEVICE(INTEL, 0x3a3e),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* ICH10 */
-	{ PCI_DEVICE(0x8086, 0x3a6e),
+	{ PCI_VDEVICE(INTEL, 0x3a6e),
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_INTEL_ICH },
 	/* Generic Intel */
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_ANY_ID),
@@ -2613,133 +2613,133 @@ static const struct pci_device_id azx_ids[] = {
 	  .class_mask = 0xffffff,
 	  .driver_data = AZX_DRIVER_ICH | AZX_DCAPS_NO_ALIGN_BUFSIZE },
 	/* ATI SB 450/600/700/800/900 */
-	{ PCI_DEVICE(0x1002, 0x437b),
+	{ PCI_VDEVICE(ATI, 0x437b),
 	  .driver_data = AZX_DRIVER_ATI | AZX_DCAPS_PRESET_ATI_SB },
-	{ PCI_DEVICE(0x1002, 0x4383),
+	{ PCI_VDEVICE(ATI, 0x4383),
 	  .driver_data = AZX_DRIVER_ATI | AZX_DCAPS_PRESET_ATI_SB },
 	/* AMD Hudson */
-	{ PCI_DEVICE(0x1022, 0x780d),
+	{ PCI_VDEVICE(AMD, 0x780d),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_SB },
 	/* AMD, X370 & co */
-	{ PCI_DEVICE(0x1022, 0x1457),
+	{ PCI_VDEVICE(AMD, 0x1457),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
 	/* AMD, X570 & co */
-	{ PCI_DEVICE(0x1022, 0x1487),
+	{ PCI_VDEVICE(AMD, 0x1487),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
 	/* AMD Stoney */
-	{ PCI_DEVICE(0x1022, 0x157a),
+	{ PCI_VDEVICE(AMD, 0x157a),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_SB |
 			 AZX_DCAPS_PM_RUNTIME },
 	/* AMD Raven */
-	{ PCI_DEVICE(0x1022, 0x15e3),
+	{ PCI_VDEVICE(AMD, 0x15e3),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
 	/* ATI HDMI */
-	{ PCI_DEVICE(0x1002, 0x0002),
+	{ PCI_VDEVICE(ATI, 0x0002),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0x1308),
+	{ PCI_VDEVICE(ATI, 0x1308),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0x157a),
+	{ PCI_VDEVICE(ATI, 0x157a),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0x15b3),
+	{ PCI_VDEVICE(ATI, 0x15b3),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0x793b),
+	{ PCI_VDEVICE(ATI, 0x793b),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0x7919),
+	{ PCI_VDEVICE(ATI, 0x7919),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0x960f),
+	{ PCI_VDEVICE(ATI, 0x960f),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0x970f),
+	{ PCI_VDEVICE(ATI, 0x970f),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0x9840),
+	{ PCI_VDEVICE(ATI, 0x9840),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0xaa00),
+	{ PCI_VDEVICE(ATI, 0xaa00),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa08),
+	{ PCI_VDEVICE(ATI, 0xaa08),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa10),
+	{ PCI_VDEVICE(ATI, 0xaa10),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa18),
+	{ PCI_VDEVICE(ATI, 0xaa18),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa20),
+	{ PCI_VDEVICE(ATI, 0xaa20),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa28),
+	{ PCI_VDEVICE(ATI, 0xaa28),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa30),
+	{ PCI_VDEVICE(ATI, 0xaa30),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa38),
+	{ PCI_VDEVICE(ATI, 0xaa38),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa40),
+	{ PCI_VDEVICE(ATI, 0xaa40),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa48),
+	{ PCI_VDEVICE(ATI, 0xaa48),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa50),
+	{ PCI_VDEVICE(ATI, 0xaa50),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa58),
+	{ PCI_VDEVICE(ATI, 0xaa58),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa60),
+	{ PCI_VDEVICE(ATI, 0xaa60),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa68),
+	{ PCI_VDEVICE(ATI, 0xaa68),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa80),
+	{ PCI_VDEVICE(ATI, 0xaa80),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa88),
+	{ PCI_VDEVICE(ATI, 0xaa88),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa90),
+	{ PCI_VDEVICE(ATI, 0xaa90),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0xaa98),
+	{ PCI_VDEVICE(ATI, 0xaa98),
 	  .driver_data = AZX_DRIVER_ATIHDMI | AZX_DCAPS_PRESET_ATI_HDMI },
-	{ PCI_DEVICE(0x1002, 0x9902),
+	{ PCI_VDEVICE(ATI, 0x9902),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0xaaa0),
+	{ PCI_VDEVICE(ATI, 0xaaa0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0xaaa8),
+	{ PCI_VDEVICE(ATI, 0xaaa8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0xaab0),
+	{ PCI_VDEVICE(ATI, 0xaab0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0xaac0),
+	{ PCI_VDEVICE(ATI, 0xaac0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xaac8),
+	{ PCI_VDEVICE(ATI, 0xaac8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xaad8),
+	{ PCI_VDEVICE(ATI, 0xaad8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xaae0),
+	{ PCI_VDEVICE(ATI, 0xaae0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xaae8),
+	{ PCI_VDEVICE(ATI, 0xaae8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xaaf0),
+	{ PCI_VDEVICE(ATI, 0xaaf0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xaaf8),
+	{ PCI_VDEVICE(ATI, 0xaaf8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab00),
+	{ PCI_VDEVICE(ATI, 0xab00),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab08),
+	{ PCI_VDEVICE(ATI, 0xab08),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab10),
+	{ PCI_VDEVICE(ATI, 0xab10),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab18),
+	{ PCI_VDEVICE(ATI, 0xab18),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab20),
+	{ PCI_VDEVICE(ATI, 0xab20),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab28),
+	{ PCI_VDEVICE(ATI, 0xab28),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab30),
+	{ PCI_VDEVICE(ATI, 0xab30),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-	{ PCI_DEVICE(0x1002, 0xab38),
+	{ PCI_VDEVICE(ATI, 0xab38),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
 	/* GLENFLY */
@@ -2749,15 +2749,15 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_GFHDMI | AZX_DCAPS_POSFIX_LPIB |
 	  AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
 	/* VIA VT8251/VT8237A */
-	{ PCI_DEVICE(0x1106, 0x3288), .driver_data = AZX_DRIVER_VIA },
+	{ PCI_VDEVICE(VIA, 0x3288), .driver_data = AZX_DRIVER_VIA },
 	/* VIA GFX VT7122/VX900 */
-	{ PCI_DEVICE(0x1106, 0x9170), .driver_data = AZX_DRIVER_GENERIC },
+	{ PCI_VDEVICE(VIA, 0x9170), .driver_data = AZX_DRIVER_GENERIC },
 	/* VIA GFX VT6122/VX11 */
-	{ PCI_DEVICE(0x1106, 0x9140), .driver_data = AZX_DRIVER_GENERIC },
+	{ PCI_VDEVICE(VIA, 0x9140), .driver_data = AZX_DRIVER_GENERIC },
 	/* SIS966 */
-	{ PCI_DEVICE(0x1039, 0x7502), .driver_data = AZX_DRIVER_SIS },
+	{ PCI_VDEVICE(SI, 0x7502), .driver_data = AZX_DRIVER_SIS },
 	/* ULI M5461 */
-	{ PCI_DEVICE(0x10b9, 0x5461), .driver_data = AZX_DRIVER_ULI },
+	{ PCI_VDEVICE(AL, 0x5461), .driver_data = AZX_DRIVER_ULI },
 	/* NVIDIA MCP */
 	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID),
 	  .class = PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8,
@@ -2770,9 +2770,9 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_TERA | AZX_DCAPS_NO_64BIT },
 	/* Creative X-Fi (CA0110-IBG) */
 	/* CTHDA chips */
-	{ PCI_DEVICE(0x1102, 0x0010),
+	{ PCI_VDEVICE(CREATIVE, 0x0010),
 	  .driver_data = AZX_DRIVER_CTHDA | AZX_DCAPS_PRESET_CTHDA },
-	{ PCI_DEVICE(0x1102, 0x0012),
+	{ PCI_VDEVICE(CREATIVE, 0x0012),
 	  .driver_data = AZX_DRIVER_CTHDA | AZX_DCAPS_PRESET_CTHDA },
 #if !IS_ENABLED(CONFIG_SND_CTXFI)
 	/* the following entry conflicts with snd-ctxfi driver,
@@ -2786,18 +2786,18 @@ static const struct pci_device_id azx_ids[] = {
 	  AZX_DCAPS_NO_64BIT | AZX_DCAPS_POSFIX_LPIB },
 #else
 	/* this entry seems still valid -- i.e. without emu20kx chip */
-	{ PCI_DEVICE(0x1102, 0x0009),
+	{ PCI_VDEVICE(CREATIVE, 0x0009),
 	  .driver_data = AZX_DRIVER_CTX | AZX_DCAPS_CTX_WORKAROUND |
 	  AZX_DCAPS_NO_64BIT | AZX_DCAPS_POSFIX_LPIB },
 #endif
 	/* CM8888 */
-	{ PCI_DEVICE(0x13f6, 0x5011),
+	{ PCI_VDEVICE(CMEDIA, 0x5011),
 	  .driver_data = AZX_DRIVER_CMEDIA |
 	  AZX_DCAPS_NO_MSI | AZX_DCAPS_POSFIX_LPIB | AZX_DCAPS_SNOOP_OFF },
 	/* Vortex86MX */
-	{ PCI_DEVICE(0x17f3, 0x3010), .driver_data = AZX_DRIVER_GENERIC },
+	{ PCI_VDEVICE(RDC, 0x3010), .driver_data = AZX_DRIVER_GENERIC },
 	/* VMware HDAudio */
-	{ PCI_DEVICE(0x15ad, 0x1977), .driver_data = AZX_DRIVER_GENERIC },
+	{ PCI_VDEVICE(VMWARE, 0x1977), .driver_data = AZX_DRIVER_GENERIC },
 	/* AMD/ATI Generic, PCI class code and Vendor ID for HD Audio */
 	{ PCI_DEVICE(PCI_VENDOR_ID_ATI, PCI_ANY_ID),
 	  .class = PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8,
@@ -2808,7 +2808,7 @@ static const struct pci_device_id azx_ids[] = {
 	  .class_mask = 0xffffff,
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_HDMI },
 	/* Zhaoxin */
-	{ PCI_DEVICE(0x1d17, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
+	{ PCI_VDEVICE(ZHAOXIN, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
-- 
2.34.1

