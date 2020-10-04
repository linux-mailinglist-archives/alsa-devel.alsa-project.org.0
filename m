Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A3F282A23
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D82D85D;
	Sun,  4 Oct 2020 12:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D82D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601806097;
	bh=ba3JuZamVUYcpp0zkXLSK8I9/42IEaEby7fRebXVnVI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umB5hHRB6hYFwqqlWyu6qnX9iv+TVk3BMxUpYoB79l0HKsh83hP212+piHUu/2T63
	 aHj9VHtp6FRkZS/64SH/qQYw+G0rRjy2PIjJzsLbeQOey0ePCAIx9UsyeSUapO9uuN
	 FUAQyzIwszYAT9xIfYehn5Am4KN2cmR06c4i2S0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D87F80340;
	Sun,  4 Oct 2020 12:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50327F8032A; Sun,  4 Oct 2020 12:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5874F802EC
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5874F802EC
IronPort-SDR: IJm3n4Rrw6sKdT3pSid5Y/lVk5VhnX2vDOusYza7eIbehfsLPfQeDAhdI4oAjMEpA1HnMain7Z
 kovNdsdAMaYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="163384008"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="163384008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:02:14 -0700
IronPort-SDR: 35uTvHQ3F6eWvM7vZkeS1+xVs2//p55gPeHqxofFC4WzSe6Dx6Lh3VJg+WWhRok+RMD18WYOXt
 ZY1cF6vRMK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527939"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:02:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/13] ASoC: Intel: Remove unused DSP interface fields
Date: Sun,  4 Oct 2020 12:01:24 +0200
Message-Id: <20201004100128.5842-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004100128.5842-1-cezary.rojewski@intel.com>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
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

