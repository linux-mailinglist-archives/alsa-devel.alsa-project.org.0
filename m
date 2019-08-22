Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C399FC0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F801688;
	Thu, 22 Aug 2019 21:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F801688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501661;
	bh=DFCkarALHwTHLX7oTMBjtlZ6EN2+pJCWR0OBWFqxvtk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vcknrgDhqA7AykMc4jh3OueGNKSdZdp6L9J60ZT5WeYmWl2YGRSO5/EPNZ3mLPs0m
	 0u3IoymLSSOkixY0eDgnipR5Vq7dd5mwR6GiJJDS5HK/iHhJGdS5KaUeNqIxRUMxwH
	 UWp9yFCcJHZWr5JgxmrMWH1R/s+9XVtkqLS3pRz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EE6F80793;
	Thu, 22 Aug 2019 21:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9560F8070E; Thu, 22 Aug 2019 21:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1925F80633
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1925F80633
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524489"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:11 +0200
Message-Id: <20190822190425.23001-22-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 21/35] ASoC: Intel: Expose ACPI loading members
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

No framework should know upfront about specifics of its inheriting
members. sst-acpi contains Baytrail and Haswell specific data. In order
to prevent circular dependency, it's compiled into separate module.

Let's do it right and obey inheritance rule. As a first step, elevate
sst-acpi members so they could be shared by Haswell and
Baytrail-specific handlers - this is to prevent code duplication.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-acpi.c | 23 ++++-------------------
 sound/soc/intel/common/sst-dsp.h  | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
index 0e8e0a7a11df..42f9b02f2ea3 100644
--- a/sound/soc/intel/common/sst-acpi.c
+++ b/sound/soc/intel/common/sst-acpi.c
@@ -19,23 +19,6 @@
 #define SST_WPT_DSP_DMA_ADDR_OFFSET	0x0FE000
 #define SST_LPT_DSP_DMA_SIZE		(1024 - 1)
 
-/* Descriptor for setting up SST platform data */
-struct sst_acpi_desc {
-	const char *drv_name;
-	struct snd_soc_acpi_mach *machines;
-	/* Platform resource indexes. Must set to -1 if not used */
-	int resindex_lpe_base;
-	int resindex_pcicfg_base;
-	int resindex_fw_base;
-	int irqindex_host_ipc;
-	int resindex_dma_base;
-	/* Unique number identifying the SST core on platform */
-	int sst_id;
-	/* DMA only valid when resindex_dma_base != -1*/
-	int dma_engine;
-	int dma_size;
-};
-
 struct sst_acpi_priv {
 	struct platform_device *pdev_mach;
 	struct platform_device *pdev_pcm;
@@ -71,7 +54,7 @@ static void sst_acpi_fw_cb(const struct firmware *fw, void *context)
 	return;
 }
 
-static int sst_acpi_probe(struct platform_device *pdev)
+int sst_acpi_probe(struct platform_device *pdev)
 {
 	const struct acpi_device_id *id;
 	struct device *dev = &pdev->dev;
@@ -157,8 +140,9 @@ static int sst_acpi_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(sst_acpi_probe);
 
-static int sst_acpi_remove(struct platform_device *pdev)
+int sst_acpi_remove(struct platform_device *pdev)
 {
 	struct sst_acpi_priv *sst_acpi = platform_get_drvdata(pdev);
 	struct sst_pdata *sst_pdata = &sst_acpi->sst_pdata;
@@ -170,6 +154,7 @@ static int sst_acpi_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(sst_acpi_remove);
 
 static struct sst_acpi_desc sst_acpi_haswell_desc = {
 	.drv_name = "haswell-pcm-audio",
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index 63c29bb45cf1..a2ac7998fbdb 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -166,6 +166,27 @@
 #define SST_PMCS_PS_MASK	0x3
 
 struct sst_dsp;
+struct platform_device;
+
+/* Descriptor for setting up SST platform data */
+struct sst_acpi_desc {
+	const char *drv_name;
+	struct snd_soc_acpi_mach *machines;
+	/* Platform resource indexes. Must set to -1 if not used */
+	int resindex_lpe_base;
+	int resindex_pcicfg_base;
+	int resindex_fw_base;
+	int irqindex_host_ipc;
+	int resindex_dma_base;
+	/* Unique number identifying the SST core on platform */
+	int sst_id;
+	/* DMA only valid when resindex_dma_base != -1*/
+	int dma_engine;
+	int dma_size;
+};
+
+int sst_acpi_probe(struct platform_device *pdev);
+int sst_acpi_remove(struct platform_device *pdev);
 
 /*
  * SST Platform Data.
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
