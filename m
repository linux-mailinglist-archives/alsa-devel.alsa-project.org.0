Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9274EFBD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1683F820;
	Tue, 11 Jul 2023 15:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1683F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689080466;
	bh=rbfp/ATGi8YL1NhYsnv9rDVDnh7mPVl04cteWEUCpLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hQgHy3l6m7+cAzLeTwwfQN7y6gIhfB6Bp3rsxUdh/HWBGFT94GEbdTcuLoIT2RTzv
	 4TM5apnv7jRknbETaDOjEzD5maQIGpUSweYdjjNvCvaKRYNRJYZZyQabgnyjr8yeqg
	 R/Cyqbtk1BOrjbbDph8uAXLrgyH0cnJ4Hk+pQBgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5897DF805D7; Tue, 11 Jul 2023 14:57:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EEFBF805E7;
	Tue, 11 Jul 2023 14:57:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E6FBF805D4; Tue, 11 Jul 2023 14:57:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A5811F8024E
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5811F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ltPls+cT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689080267; x=1720616267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rbfp/ATGi8YL1NhYsnv9rDVDnh7mPVl04cteWEUCpLs=;
  b=ltPls+cT2Qsz6zc7zT5VYZbpAAwGcEzTOAryOgNmpUdcXngAckjBFdV/
   jq9bafTUPtjJaXomjT73w07JJ4sUhMIgDSlFsSHNKz7IL8Nu0ZvDdQ5rE
   I2n2vFqRH1HzR/b2xPmmJ7bK6i03ZHdsoX/ZxzgMG7mfY4mKgAB0vUU41
   C0YcxuiqpwTQBOdlEksHYPoJ4XnBv/CNCO+gNHEkIFo7PH2b/FSE/1MDw
   xcgvZvs3gqGSrlr45BwQfGOpNc5mWMJL1kGRqsteaXMLcS4KIt0A/5DHu
   FggDb1hQszaYhAIYUvIgypmBxtBy9xynEIWmTATRcQen7lNXWRkkgNzly
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367187582"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367187582"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834666843"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834666843"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 05:57:41 -0700
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
Subject: [PATCH 13/13] ASoC: Intel: sst: Convert to PCI device IDs defines
Date: Tue, 11 Jul 2023 14:57:26 +0200
Message-Id: <20230711125726.3509391-14-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CMDI6T5DDZT2NPAZT7ICCYG5KM5WDMBQ
X-Message-ID-Hash: CMDI6T5DDZT2NPAZT7ICCYG5KM5WDMBQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CMDI6T5DDZT2NPAZT7ICCYG5KM5WDMBQ/>
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
 sound/soc/intel/atom/sst/sst.c     | 3 ++-
 sound/soc/intel/atom/sst/sst.h     | 1 -
 sound/soc/intel/atom/sst/sst_pci.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index a0d29510d2bc..f582e0737778 100644
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
@@ -174,7 +175,7 @@ int sst_driver_ops(struct intel_sst_drv *sst)
 {
 
 	switch (sst->dev_id) {
-	case SST_MRFLD_PCI_ID:
+	case PCI_DEVICE_ID_INTEL_ADSP_TNG:
 	case SST_BYT_ACPI_ID:
 	case SST_CHV_ACPI_ID:
 		sst->tstamp = SST_TIME_STAMP_MRFLD;
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 4d37d39fd8f4..6670aaf9aca4 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -20,7 +20,6 @@
 
 /* driver names */
 #define SST_DRV_NAME "intel_sst_driver"
-#define SST_MRFLD_PCI_ID 0x119A
 #define SST_BYT_ACPI_ID	0x80860F28
 #define SST_CHV_ACPI_ID	0x808622A8
 
diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index 4058b4f80a0c..9098076d6c72 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -32,7 +32,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 
 	/* map registers */
 	/* DDR base */
-	if (ctx->dev_id == SST_MRFLD_PCI_ID) {
+	if (ctx->dev_id == PCI_DEVICE_ID_INTEL_ADSP_TNG) {
 		ctx->ddr_base = pci_resource_start(pci, 0);
 		/* check that the relocated IMR base matches with FW Binary */
 		ddr_base = relocate_imr_addr_mrfld(ctx->ddr_base);
@@ -173,7 +173,7 @@ static void intel_sst_remove(struct pci_dev *pci)
 
 /* PCI Routines */
 static const struct pci_device_id intel_sst_ids[] = {
-	{ PCI_VDEVICE(INTEL, SST_MRFLD_PCI_ID), 0},
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADSP_TNG), 0},
 	{ 0, }
 };
 
-- 
2.34.1

