Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5A8756211
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF19E74;
	Mon, 17 Jul 2023 13:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF19E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594668;
	bh=+ns55PFsbF+pwy5bfcAnX7Qwt8Z8NXqqD7EMZ+8zZrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZEf/tkBYI2DQ/l5ttQGAWTd2F58DFI1nX2Up8b16lk63MmjcnpQqclSEz9Xowm1kq
	 hMp1scS3YbuckC0PlGySV7TcLbErZXd3rW7XoTW4ZLaawgZp3B5sENFG46BKHhlT2e
	 tO0/28L4d5hdGf6lvQX4fernKZdwKMZDp0J4KiSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C29A0F8061C; Mon, 17 Jul 2023 13:46:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5DBF80620;
	Mon, 17 Jul 2023 13:46:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED766F80600; Mon, 17 Jul 2023 13:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08529F80494
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08529F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cRRd+DhC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594372; x=1721130372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+ns55PFsbF+pwy5bfcAnX7Qwt8Z8NXqqD7EMZ+8zZrg=;
  b=cRRd+DhC1fd7DldwR380iXTEN8EcoNPTn2mfziQWq4nSbe6GEKaaoCAQ
   IuOn3RgItEDDRDoglMdCJMYXxGqKb4GFIKbtpvjKhC5bssoM+q3RAbG3a
   joGXiC/LEa0pdUeU5x2VdAwqP/I8kKjqW8Lx5vDsRDG+MG8KamFfydd9b
   MRujgEtxo1hLQJceBL+gTeOaSQun9J/Qzl7dQSm83CCu01M59vQptZlC/
   WFh6QsgUmPIJb4u7xegbJhjXG+5oR2/4mAfaRaTCmbLhlUIJDpk6/CiA/
   R0x90iHha/rRXc8QNrWbuyFrPJxqdkhzxP0aJuhrsxhnEKHdbon9us05S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363373026"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363373026"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856581"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856581"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:46:07 -0700
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
Subject: [PATCH v4 15/15] ASoC: Intel: sst: Convert to PCI device IDs defines
Date: Mon, 17 Jul 2023 13:45:11 +0200
Message-Id: <20230717114511.484999-16-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AT47AVDC2D6QPLB3SCARW2R7W4K5H2HZ
X-Message-ID-Hash: AT47AVDC2D6QPLB3SCARW2R7W4K5H2HZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AT47AVDC2D6QPLB3SCARW2R7W4K5H2HZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header. BSW replaces CHV, as 0x22a8
was added in PCI header as BSW ID for consistency, as they are same
(similar) platforms. The ACPI IDs are used only internally and lower
16 bits uniquely define the device as vendor ID for Intel is 8086 for
all of them. Use PCI_DEVICE_DATA() to match PCI device to be consistent
with other Intel audio drivers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst.c     | 14 ++++++++++----
 sound/soc/intel/atom/sst/sst.h     |  7 ++-----
 sound/soc/intel/atom/sst/sst_pci.c |  4 ++--
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index a0d29510d2bc..e0357d257c6c 100644
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
+	case PCI_DEVICE_ID_INTEL_SST_BSW:
 		sst->tstamp = SST_TIME_STAMP_MRFLD;
 		sst->ops = &mrfld_ops;
 		return 0;
@@ -221,8 +222,13 @@ static void sst_init_locks(struct intel_sst_drv *ctx)
 	spin_lock_init(&ctx->block_lock);
 }
 
+/*
+ * Driver handles PCI IDs in ACPI - sst_acpi_probe() - and we are using only
+ * device ID part. If real ACPI ID appears, the kstrtouint() returns error, so
+ * we are fine with using unsigned short as dev_id type.
+ */
 int sst_alloc_drv_context(struct intel_sst_drv **ctx,
-		struct device *dev, unsigned int dev_id)
+		struct device *dev, unsigned short dev_id)
 {
 	*ctx = devm_kzalloc(dev, sizeof(struct intel_sst_drv), GFP_KERNEL);
 	if (!(*ctx))
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 4d37d39fd8f4..126903e126e4 100644
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
@@ -358,7 +355,7 @@ struct sst_fw_save {
 struct intel_sst_drv {
 	int			sst_state;
 	int			irq_num;
-	unsigned int		dev_id;
+	unsigned short		dev_id;
 	void __iomem		*ddr;
 	void __iomem		*shim;
 	void __iomem		*mailbox;
@@ -523,7 +520,7 @@ int sst_register(struct device *);
 int sst_unregister(struct device *);
 
 int sst_alloc_drv_context(struct intel_sst_drv **ctx,
-		struct device *dev, unsigned int dev_id);
+		struct device *dev, unsigned short dev_id);
 int sst_context_init(struct intel_sst_drv *ctx);
 void sst_context_cleanup(struct intel_sst_drv *ctx);
 void sst_configure_runtime_pm(struct intel_sst_drv *ctx);
diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index 4058b4f80a0c..d1e64c3500be 100644
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
+	{ PCI_DEVICE_DATA(INTEL, SST_TNG, 0) },
 	{ 0, }
 };
 
-- 
2.34.1

