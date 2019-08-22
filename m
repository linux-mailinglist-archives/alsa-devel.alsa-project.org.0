Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4999FBF
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:20:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6244D168A;
	Thu, 22 Aug 2019 21:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6244D168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501617;
	bh=KcZJmdHhAGjGlqoGHSTY/+rF1v57yTh0wHU7KBLFNiY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2qTBomcQ83q+nOr4S8WY/tFgK3ZzLZnb+jBOvfFvCCfxyOkgQhTXQ6SHYqUMEFN0
	 zDCPbzS67anh12azoly3Zf+cLH/UhPAp+ZN8LzAoRcRTrEbGg97iVA6PWcB65rRlQK
	 Ecz/e15kPpi3JHmeH+2HpWhdjQCdk08x/NEtHljM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439DBF8077D;
	Thu, 22 Aug 2019 21:06:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 293CDF8070E; Thu, 22 Aug 2019 21:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8681F804CB
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8681F804CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524461"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:10 +0200
Message-Id: <20190822190425.23001-21-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 20/35] ASoC: Intel: Skylake: Remove redundant
	SRAM fields
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

sram0_base and sram1_base are Skylake-specific fields and should not be
part of common sst framework. Moreover, these are completely unused, so
remove them.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h | 2 --
 sound/soc/intel/skylake/bxt-sst.c     | 2 --
 sound/soc/intel/skylake/cnl-sst.c     | 2 --
 sound/soc/intel/skylake/skl-sst.c     | 2 --
 4 files changed, 8 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 53dcd87bab44..a4628a89d47d 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -69,8 +69,6 @@ struct sst_addr {
 	u32 dram_offset;
 	u32 dsp_iram_offset;
 	u32 dsp_dram_offset;
-	u32 sram0_base;
-	u32 sram1_base;
 	void __iomem *lpe;
 	void __iomem *shim;
 	void __iomem *pci_cfg;
diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index fdd94711c3b4..5b46215fbc0f 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -563,8 +563,6 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->fw_ops = bxt_fw_ops;
 	sst->addr.lpe = mmio_base;
 	sst->addr.shim = mmio_base;
-	sst->addr.sram0_base = BXT_ADSP_SRAM0_BASE;
-	sst->addr.sram1_base = BXT_ADSP_SRAM1_BASE;
 
 	sst_dsp_mailbox_init(sst,
 		(BXT_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index d3da23e0ef05..47b991c03742 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -440,8 +440,6 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->fw_ops = cnl_fw_ops;
 	sst->addr.lpe = mmio_base;
 	sst->addr.shim = mmio_base;
-	sst->addr.sram0_base = CNL_ADSP_SRAM0_BASE;
-	sst->addr.sram1_base = CNL_ADSP_SRAM1_BASE;
 
 	sst_dsp_mailbox_init(sst,
 		(CNL_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 191931578fd2..c823936ffd34 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -533,8 +533,6 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst = skl->dsp;
 	sst->addr.lpe = mmio_base;
 	sst->addr.shim = mmio_base;
-	sst->addr.sram0_base = SKL_ADSP_SRAM0_BASE;
-	sst->addr.sram1_base = SKL_ADSP_SRAM1_BASE;
 
 	sst_dsp_mailbox_init(sst,
 		(SKL_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
