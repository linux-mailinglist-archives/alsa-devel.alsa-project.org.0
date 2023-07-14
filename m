Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD833753925
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E807EAE9;
	Fri, 14 Jul 2023 12:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E807EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689332450;
	bh=g0WaMz10MmiDZgZOz+x0E2A2UYntgNbZ+38tvXaJXpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p9YrUPUk+iT7wrmi7VOTmfsQ8XkUIc68q6GXlHOR4sn1N/MYsf+9dXpo3R6PJglb2
	 XBOR8WWzz864ZLBd4UQNAgExGhz6F0Fe8Q4Rn4wRh7EnRzhhvew7SgpDtg/+pKz6Q/
	 leayVvgA6nq5sR3x1NblPnDmeXXcHftppg3n3RWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC2B9F8062E; Fri, 14 Jul 2023 12:56:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDBC4F8061F;
	Fri, 14 Jul 2023 12:56:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 012EFF805E4; Fri, 14 Jul 2023 12:56:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F18E2F80571
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 12:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18E2F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k07j/kqH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689332150; x=1720868150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g0WaMz10MmiDZgZOz+x0E2A2UYntgNbZ+38tvXaJXpM=;
  b=k07j/kqH+IAeT81Qb1/lOYU4AhCaETjkvNhcjKBt6fdAOKG+HnEeU0PS
   TtwSRTfJltl1RCGziuLd1Y80m/6kTZ2TSNnbxRDCLm6lmaGRqhdcRKjCL
   /dzeRwopjYke6m53ctOpGciggnw3G9XEpsa2VKHSBsMR5yr40GI1EPpi9
   a0aVHp0YvCay7gkkaVsKJmLRz/8UTACX60rMFd4wEN7JBQEhi43YPhSGD
   2zwu5SoYSbLzPoGQY8TvQ1374XyLI2lKVbk+ZN1lQA+1Cb52/kQE4jWrs
   hYjazq29U7mM0YMj1c29fAs9kzAr0q9WifmyfDK6P+rbKbXUqP0gYIaWb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364321262"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="364321262"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722365649"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="722365649"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 03:55:45 -0700
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
Subject: [PATCH v2 15/15] ASoC: Intel: sst: Convert to PCI device IDs defines
Date: Fri, 14 Jul 2023 20:56:15 +0200
Message-Id: <20230714185615.370597-16-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NXHUNBFTLWURKLYYYXN2UUXW3LWHWV4S
X-Message-ID-Hash: NXHUNBFTLWURKLYYYXN2UUXW3LWHWV4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXHUNBFTLWURKLYYYXN2UUXW3LWHWV4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst.c     | 7 ++++---
 sound/soc/intel/atom/sst/sst.h     | 3 ---
 sound/soc/intel/atom/sst/sst_pci.c | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index a0d29510d2bc..74614f9b086a 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/firmware.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
 #include <linux/async.h>
@@ -174,9 +175,9 @@ int sst_driver_ops(struct intel_sst_drv *sst)
 {
 
 	switch (sst->dev_id) {
-	case SST_MRFLD_PCI_ID:
-	case SST_BYT_ACPI_ID:
-	case SST_CHV_ACPI_ID:
+	case PCI_DEVICE_ID_INTEL_SST_TNG:
+	case PCI_DEVICE_ID_INTEL_SST_BYT:
+	case PCI_DEVICE_ID_INTEL_SST_CHV:
 		sst->tstamp = SST_TIME_STAMP_MRFLD;
 		sst->ops = &mrfld_ops;
 		return 0;
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 4d37d39fd8f4..eab374bf0066 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -20,9 +20,6 @@
 
 /* driver names */
 #define SST_DRV_NAME "intel_sst_driver"
-#define SST_MRFLD_PCI_ID 0x119A
-#define SST_BYT_ACPI_ID	0x80860F28
-#define SST_CHV_ACPI_ID	0x808622A8
 
 #define SST_SUSPEND_DELAY 2000
 #define FW_CONTEXT_MEM (64*1024)
diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index 4058b4f80a0c..7ed142bb3dc0 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -32,7 +32,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 
 	/* map registers */
 	/* DDR base */
-	if (ctx->dev_id == SST_MRFLD_PCI_ID) {
+	if (ctx->dev_id == PCI_DEVICE_ID_INTEL_SST_TNG) {
 		ctx->ddr_base = pci_resource_start(pci, 0);
 		/* check that the relocated IMR base matches with FW Binary */
 		ddr_base = relocate_imr_addr_mrfld(ctx->ddr_base);
@@ -173,7 +173,7 @@ static void intel_sst_remove(struct pci_dev *pci)
 
 /* PCI Routines */
 static const struct pci_device_id intel_sst_ids[] = {
-	{ PCI_VDEVICE(INTEL, SST_MRFLD_PCI_ID), 0},
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_SST_TNG), 0},
 	{ 0, }
 };
 
-- 
2.34.1

