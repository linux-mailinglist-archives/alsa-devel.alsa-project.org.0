Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF974EFC3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FAB41F1;
	Tue, 11 Jul 2023 15:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FAB41F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689080517;
	bh=bl/zYgzCi3o2blRR5uBjNAGlQOwq1q6m2wvBNMtj8IM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tg1pcKBdXM3TKxNAInSMjwUsZVoDnoG/pNSdaSWbNbzkqr+ooFVi37tPGxdJX4OU/
	 TlZMLhQooiH37/7weLtPo5Rv1TAn5PVYxNbLsqSDHNzp5T3zA3rFsP/ZH6WWcWBzBz
	 4hdKA2WsaXOFGhpke9+qwH+Sni6yTSIbFswciZOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32BF4F8055B; Tue, 11 Jul 2023 14:59:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 870C6F80558;
	Tue, 11 Jul 2023 14:59:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 293D5F8027B; Tue, 11 Jul 2023 14:59:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C27FF8057F
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C27FF8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OHoAoBF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689080254; x=1720616254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bl/zYgzCi3o2blRR5uBjNAGlQOwq1q6m2wvBNMtj8IM=;
  b=OHoAoBF5j1e6biyErCWOehiOj5d7pIsQ9oRqhJr5XnN4Jqhy9yWodpA3
   w7MckoHW/FvrgfKb9set60MonBsi56kq3JIM4I7M36G2NBIDBrOKaFcir
   9mER2OQGx+nDEYpXxLRs5v9MeZ2VUr5v+TqfWUgAd84+SbDNJLfpuj3w1
   xQKf2bPdU65Sqd8+SRFxmCIgviAZcr6xBXTDdTw4WtzUBXPTEi1/pZGkj
   6hFDqB2DCirUgGfhx9CHPgGaL9zlBnZTqY2zQqk5x/JyAVeyIMZ9hCvxC
   zdFVI95A4cL+cPf3oeuRsKYrnk95u/G8P3klG2sK8aMiWoRvVQSIDE38W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367187503"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367187503"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834666738"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834666738"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 05:57:30 -0700
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
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 09/13] ASoC: Intel: avs: Convert to PCI device IDs defines
Date: Tue, 11 Jul 2023 14:57:22 +0200
Message-Id: <20230711125726.3509391-10-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KNWTRKPAVMGDF4736RN7C7AJGP26N4V5
X-Message-ID-Hash: KNWTRKPAVMGDF4736RN7C7AJGP26N4V5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNWTRKPAVMGDF4736RN7C7AJGP26N4V5/>
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
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 637501850728..859b217fc761 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -745,14 +745,14 @@ static const struct avs_spec apl_desc = {
 };
 
 static const struct pci_device_id avs_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x9d70), (unsigned long)&skl_desc }, /* SKL */
-	{ PCI_VDEVICE(INTEL, 0xa170), (unsigned long)&skl_desc }, /* SKL-H */
-	{ PCI_VDEVICE(INTEL, 0x9d71), (unsigned long)&skl_desc }, /* KBL */
-	{ PCI_VDEVICE(INTEL, 0xa171), (unsigned long)&skl_desc }, /* KBL-H */
-	{ PCI_VDEVICE(INTEL, 0xa2f0), (unsigned long)&skl_desc }, /* KBL-S */
-	{ PCI_VDEVICE(INTEL, 0xa3f0), (unsigned long)&skl_desc }, /* CML-V */
-	{ PCI_VDEVICE(INTEL, 0x5a98), (unsigned long)&apl_desc }, /* APL */
-	{ PCI_VDEVICE(INTEL, 0x3198), (unsigned long)&apl_desc }, /* GML */
+	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_H, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S, &skl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &apl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_GML, &apl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
-- 
2.34.1

