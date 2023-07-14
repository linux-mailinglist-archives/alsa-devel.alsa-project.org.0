Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F531753AEB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D14EE72;
	Fri, 14 Jul 2023 14:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D14EE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689337669;
	bh=6Hi0/au1Z7W8Ae3bYV68XGhs74D1joYSt9bHUr1c1ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PzVgkDrb/xZryAVNrwgdQyUmHiXIbhIdaq1ZN67O9wZT+mZLH1LUzoT5Q09InPPhn
	 J82f8Q5463Tbi2ZbtBY+VRN9uWJpUzw6st6e/T68Ka4oiOE1Q04s4c2Yma9Lvlmzhf
	 RBeZav80PFy5xLJBFX/XGTzUr3ZtGcm/hPg9UYTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DC9BF805D8; Fri, 14 Jul 2023 14:24:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E73AF805D8;
	Fri, 14 Jul 2023 14:24:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FDFFF805AE; Fri, 14 Jul 2023 14:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B278FF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B278FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uz3lWzk1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689337455; x=1720873455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Hi0/au1Z7W8Ae3bYV68XGhs74D1joYSt9bHUr1c1ng=;
  b=Uz3lWzk1BeqRdjKnHrKu9iwjoX9cziih5DFWs33SRO/S3JIGYUlPefdb
   NrBrv7G9+MCJjAnQV3suIUPWxc80d92Koe8IIoJcT4Ctc1M9DmjnYARPU
   c6KGxuqMus1UJHLchtWmDnnpaAmIHOqO1Q8um4tqqFxEvyVwXfJpGCB/f
   AOzmbCWY3zp2aToVBkg0A7bpCz+jPGuhpj05y8On0kMl/nArSMEgHwXP3
   fhTumxOpud2Oj4di9PopBz2bhyCVnc/AMyuLgKtNb9/earBxX9izIWPv7
   QDl6DrPsNWag/MlstNkgLm+bhk3OmwSKBj9SXYPo4EGJ6aPaXzscrp6Qh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429225888"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="429225888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053034977"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="1053034977"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 05:24:11 -0700
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
Subject: [PATCH v3 11/15] ASoC: Intel: avs: Convert to PCI device IDs defines
Date: Fri, 14 Jul 2023 22:24:53 +0200
Message-Id: <20230714202457.423866-12-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 24SLJDUCYWMUXP33VOG5EW6HZKWICY7U
X-Message-ID-Hash: 24SLJDUCYWMUXP33VOG5EW6HZKWICY7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24SLJDUCYWMUXP33VOG5EW6HZKWICY7U/>
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

