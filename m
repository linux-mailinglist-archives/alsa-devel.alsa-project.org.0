Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163528465E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A70C1778;
	Tue,  6 Oct 2020 08:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A70C1778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601967370;
	bh=8CIj06URMQZJVF1w/IIPUlNczti5q+y45WmBL4ok3Jc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1bGVZSoS9oXs/snxwf3IBxuplHuRLY7jtRSoS7XIqTLUaWS4HtJClbeY//w23fiS
	 ycvpdKl5/RdYanw4dNZFpq6Pucdh10X0HrsLogtkCeKFFnid9Jwgi+pHNSevC3G6GJ
	 iAg6QmQp/jxhAOPrIG5AdNPobDy+dHn+77p2YV9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52943F80341;
	Tue,  6 Oct 2020 08:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0EE4F8015B; Tue,  6 Oct 2020 08:50:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F628F802F7
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F628F802F7
IronPort-SDR: lZuC4fyQwqum9HF0AxeezlKFYQm6+B8eBk6PZ97zk+8JrXy6Vxg/UE9zqZnpAkh3L1IMyBEnEQ
 iPWoGyCRNdbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249091318"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="249091318"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 23:50:23 -0700
IronPort-SDR: 6QWFra8puRiQm4XC46y1/Cq54VDY0Dq9nib/6Ra+rsx4lDb+Fk94SFSwF4ACfTt+7f9Y5VRIVZ
 RvXrjJ8Fuh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="315491282"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2020 23:50:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 09/13] ASoC: Intel: Remove unused DSP interface fields
Date: Tue,  6 Oct 2020 08:49:03 +0200
Message-Id: <20201006064907.16277-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006064907.16277-1-cezary.rojewski@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

With redundant DSP operations removed, several fields for structures:
sst_ops, sst_addr and sst_dsp become obsolete. Remove them too.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h | 45 ---------------------------
 1 file changed, 45 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 3787ef07b840..994698ff581e 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -22,26 +22,9 @@
  * DSP Operations exported by platform Audio DSP driver.
  */
 struct sst_ops {
-	/* DSP core boot / reset */
-	void (*boot)(struct sst_dsp *);
-	void (*reset)(struct sst_dsp *);
-	int (*wake)(struct sst_dsp *);
-	void (*sleep)(struct sst_dsp *);
-	void (*stall)(struct sst_dsp *);
-
 	/* Shim IO */
 	void (*write)(void __iomem *addr, u32 offset, u32 value);
 	u32 (*read)(void __iomem *addr, u32 offset);
-	void (*write64)(void __iomem *addr, u32 offset, u64 value);
-	u64 (*read64)(void __iomem *addr, u32 offset);
-
-	/* DSP I/DRAM IO */
-	void (*ram_read)(struct sst_dsp *sst, void  *dest, void __iomem *src,
-		size_t bytes);
-	void (*ram_write)(struct sst_dsp *sst, void __iomem *dest, void *src,
-		size_t bytes);
-
-	void (*dump)(struct sst_dsp *);
 
 	/* IRQ handlers */
 	irqreturn_t (*irq_handler)(int irq, void *context);
@@ -55,20 +38,12 @@ struct sst_ops {
  * Audio DSP memory offsets and addresses.
  */
 struct sst_addr {
-	u32 lpe_base;
-	u32 shim_offset;
-	u32 iram_offset;
-	u32 dram_offset;
-	u32 dsp_iram_offset;
-	u32 dsp_dram_offset;
 	u32 sram0_base;
 	u32 sram1_base;
 	u32 w0_stat_sz;
 	u32 w0_up_sz;
 	void __iomem *lpe;
 	void __iomem *shim;
-	void __iomem *pci_cfg;
-	void __iomem *fw_ext;
 };
 
 /*
@@ -93,7 +68,6 @@ struct sst_dsp {
 	spinlock_t spinlock;	/* IPC locking */
 	struct mutex mutex;	/* DSP FW lock */
 	struct device *dev;
-	struct device *dma_dev;
 	void *thread_context;
 	int irq;
 	u32 id;
@@ -110,27 +84,8 @@ struct sst_dsp {
 	/* mailbox */
 	struct sst_mailbox mailbox;
 
-	/* HSW/Byt data */
-
-	/* list of free and used ADSP memory blocks */
-	struct list_head used_block_list;
-	struct list_head free_block_list;
-
 	/* SST FW files loaded and their modules */
 	struct list_head module_list;
-	struct list_head fw_list;
-
-	/* scratch buffer */
-	struct list_head scratch_block_list;
-	u32 scratch_offset;
-	u32 scratch_size;
-
-	/* platform data */
-	struct sst_pdata *pdata;
-
-	/* DMA FW loading */
-	struct sst_dma *dma;
-	bool fw_use_dma;
 
 	/* SKL data */
 
-- 
2.17.1

