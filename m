Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551EB99FB5
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF1D1671;
	Thu, 22 Aug 2019 21:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF1D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501536;
	bh=2EK5LzuYyot0f9KifZeCEhW9jWBpLnY0TkZTIKFkGac=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2Rw5u0gL3Njb6kWhD4qpSwy834rbO8EIffSyCNqYc8dkCF2MbY3M71lUrPMwglQp
	 X9ukfeWgozOMwtfpEg0AxvulPGMz2a7jtkxBxAIog2jd4OkASyd82AKecShbVi6XjG
	 +xUD3kppyWnqxDp7PPH+PtJzggn7GXjz/tffl34M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E39B0F8075C;
	Thu, 22 Aug 2019 21:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AADAAF806E9; Thu, 22 Aug 2019 21:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87DF7F805E0
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87DF7F805E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524419"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:08 +0200
Message-Id: <20190822190425.23001-19-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 18/35] ASoC: Intel: Skylake: Remove window0
	sst_addr fields
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

w0_stat_sz and w0_up_sz are Skylake-specific fields and should not be
part of common sst framework. The latter is also completely unused.
Remove both while declaring global FW register-area size, shared for all
SKL+ platforms.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h | 2 --
 sound/soc/intel/skylake/bxt-sst.c     | 2 --
 sound/soc/intel/skylake/cnl-sst.c     | 2 --
 sound/soc/intel/skylake/skl-debug.c   | 2 +-
 sound/soc/intel/skylake/skl-sst-dsp.h | 1 +
 sound/soc/intel/skylake/skl-sst.c     | 2 --
 6 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 0fe9bebcfb38..53dcd87bab44 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -71,8 +71,6 @@ struct sst_addr {
 	u32 dsp_dram_offset;
 	u32 sram0_base;
 	u32 sram1_base;
-	u32 w0_stat_sz;
-	u32 w0_up_sz;
 	void __iomem *lpe;
 	void __iomem *shim;
 	void __iomem *pci_cfg;
diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index c7961050c2ee..641d5cf4aeb1 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -565,8 +565,6 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->addr.shim = mmio_base;
 	sst->addr.sram0_base = BXT_ADSP_SRAM0_BASE;
 	sst->addr.sram1_base = BXT_ADSP_SRAM1_BASE;
-	sst->addr.w0_stat_sz = SKL_ADSP_W0_STAT_SZ;
-	sst->addr.w0_up_sz = SKL_ADSP_W0_UP_SZ;
 
 	sst_dsp_mailbox_init(sst, (BXT_ADSP_SRAM0_BASE + SKL_ADSP_W0_STAT_SZ),
 			SKL_ADSP_W0_UP_SZ, BXT_ADSP_SRAM1_BASE, SKL_ADSP_W1_SZ);
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 2f10076cc906..64971966af38 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -442,8 +442,6 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->addr.shim = mmio_base;
 	sst->addr.sram0_base = CNL_ADSP_SRAM0_BASE;
 	sst->addr.sram1_base = CNL_ADSP_SRAM1_BASE;
-	sst->addr.w0_stat_sz = CNL_ADSP_W0_STAT_SZ;
-	sst->addr.w0_up_sz = CNL_ADSP_W0_UP_SZ;
 
 	sst_dsp_mailbox_init(sst, (CNL_ADSP_SRAM0_BASE + CNL_ADSP_W0_STAT_SZ),
 			     CNL_ADSP_W0_UP_SZ, CNL_ADSP_SRAM1_BASE,
diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
index 212370bf704c..6781eac13232 100644
--- a/sound/soc/intel/skylake/skl-debug.c
+++ b/sound/soc/intel/skylake/skl-debug.c
@@ -173,7 +173,7 @@ static ssize_t fw_softreg_read(struct file *file, char __user *user_buf,
 {
 	struct skl_debug *d = file->private_data;
 	struct sst_dsp *sst = d->skl->dsp;
-	size_t w0_stat_sz = sst->addr.w0_stat_sz;
+	size_t w0_stat_sz = SKL_FW_REGS_SIZE;
 	void __iomem *in_base = sst->mailbox.in_base;
 	void __iomem *fw_reg_addr;
 	unsigned int offset;
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 9f2dae92c1c9..5a0cb7f3d57e 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -63,6 +63,7 @@ struct skl_dev;
 
 #define SKL_ADSP_W1_SZ			0x1000
 
+#define SKL_FW_REGS_SIZE		PAGE_SIZE
 #define SKL_FW_STS_MASK			0xf
 
 #define SKL_FW_INIT			0x1
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index e9a7b2509b35..7e63c91cea54 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -535,8 +535,6 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->addr.shim = mmio_base;
 	sst->addr.sram0_base = SKL_ADSP_SRAM0_BASE;
 	sst->addr.sram1_base = SKL_ADSP_SRAM1_BASE;
-	sst->addr.w0_stat_sz = SKL_ADSP_W0_STAT_SZ;
-	sst->addr.w0_up_sz = SKL_ADSP_W0_UP_SZ;
 
 	sst_dsp_mailbox_init(sst, (SKL_ADSP_SRAM0_BASE + SKL_ADSP_W0_STAT_SZ),
 			SKL_ADSP_W0_UP_SZ, SKL_ADSP_SRAM1_BASE, SKL_ADSP_W1_SZ);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
