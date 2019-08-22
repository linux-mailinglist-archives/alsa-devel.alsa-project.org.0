Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDC9A008
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29CA6169B;
	Thu, 22 Aug 2019 21:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29CA6169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566502193;
	bh=HD/VPoOww6Rm7gQULEK40OFi7FEiYofqXpFrGB+9bpU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2sY0rkbuoKRfOlbO0At3fCxFV86AJ+A+tJv2DwY1GF+7TV7xZbn13hp3pbq3jsw6
	 h0su5DMsTjQZaRSR6roiX2T1aJzk/2rhNByrkPMH0tegWLYYBeue88nFPTfHqU9Hju
	 UfSJLuJL0B/KqyUFalnUj92hsygM7pKfWub/uMIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABDAF89614;
	Thu, 22 Aug 2019 21:07:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD56BF80750; Thu, 22 Aug 2019 21:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47302F8067A
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47302F8067A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524629"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:23 +0200
Message-Id: <20190822190425.23001-34-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 33/35] ASoC: Intel: Skylake: Privatize SST init
	handlers
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

With initialization order repaired, sst_ops::init overloads can be
privatized for Skylake platofmrs. Let's do so.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c     | 25 ++++++++++++-------------
 sound/soc/intel/skylake/cnl-sst-dsp.h |  2 --
 sound/soc/intel/skylake/cnl-sst.c     | 25 ++++++++++++-------------
 sound/soc/intel/skylake/skl-sst-dsp.h |  2 --
 sound/soc/intel/skylake/skl-sst.c     | 23 +++++++++++------------
 5 files changed, 35 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 79728e418176..1edc38069615 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -533,18 +533,7 @@ static const struct skl_dsp_fw_ops bxt_fw_ops = {
 	.load_library = bxt_load_library,
 };
 
-struct sst_ops apl_sst_ops = {
-	.irq_handler = skl_dsp_sst_interrupt,
-	.thread_fn = skl_dsp_irq_thread_handler,
-	.write = sst_shim32_write,
-	.read = sst_shim32_read,
-	.ram_read = sst_memcpy_fromio_32,
-	.ram_write = sst_memcpy_toio_32,
-	.init = bxt_sst_dsp_init,
-	.free = skl_dsp_free,
-};
-
-int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
+static int bxt_sst_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 {
 	struct skl_dev *skl = sst->thread_context;
 	void __iomem *mmio;
@@ -578,7 +567,17 @@ int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(bxt_sst_dsp_init);
+
+struct sst_ops apl_sst_ops = {
+	.irq_handler = skl_dsp_sst_interrupt,
+	.thread_fn = skl_dsp_irq_thread_handler,
+	.write = sst_shim32_write,
+	.read = sst_shim32_read,
+	.ram_read = sst_memcpy_fromio_32,
+	.ram_write = sst_memcpy_toio_32,
+	.init = bxt_sst_init,
+	.free = skl_dsp_free,
+};
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Broxton IPC driver");
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 7810ae11954a..a1ea242e9539 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -87,6 +87,4 @@ void cnl_ipc_op_int_enable(struct sst_dsp *ctx);
 void cnl_ipc_op_int_disable(struct sst_dsp *ctx);
 bool cnl_ipc_int_status(struct sst_dsp *ctx);
 
-int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
-
 #endif /*__CNL_SST_DSP_H__*/
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 58efeb6c8a8a..360e54d3c587 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -409,18 +409,7 @@ static int cnl_ipc_init(struct device *dev, struct skl_dev *cnl)
 	return 0;
 }
 
-struct sst_ops cnl_sst_ops = {
-	.irq_handler = cnl_dsp_sst_interrupt,
-	.thread_fn = cnl_dsp_irq_thread_handler,
-	.write = sst_shim32_write,
-	.read = sst_shim32_read,
-	.ram_read = sst_memcpy_fromio_32,
-	.ram_write = sst_memcpy_toio_32,
-	.init = cnl_sst_dsp_init,
-	.free = cnl_dsp_free,
-};
-
-int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
+static int cnl_sst_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 {
 	struct skl_dev *cnl = sst->thread_context;
 	void __iomem *mmio;
@@ -449,7 +438,17 @@ int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(cnl_sst_dsp_init);
+
+struct sst_ops cnl_sst_ops = {
+	.irq_handler = cnl_dsp_sst_interrupt,
+	.thread_fn = cnl_dsp_irq_thread_handler,
+	.write = sst_shim32_write,
+	.read = sst_shim32_read,
+	.ram_read = sst_memcpy_fromio_32,
+	.ram_write = sst_memcpy_toio_32,
+	.init = cnl_sst_init,
+	.free = cnl_dsp_free,
+};
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Cannonlake IPC driver");
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index a3714b706b8e..3294826d5cf7 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -206,8 +206,6 @@ int skl_dsp_get_core(struct sst_dsp *ctx, unsigned int core_id);
 int skl_dsp_put_core(struct sst_dsp *ctx, unsigned int core_id);
 
 int skl_dsp_boot(struct sst_dsp *ctx);
-int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
-int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
 int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
 		int lib_count);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 8e1d02e29a32..209f45e3d5d0 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -505,17 +505,7 @@ static const struct skl_dsp_fw_ops skl_fw_ops = {
 	.unload_mod = skl_unload_module,
 };
 
-struct sst_ops skl_sst_ops = {
-	.irq_handler = skl_dsp_sst_interrupt,
-	.write = sst_shim32_write,
-	.read = sst_shim32_read,
-	.ram_read = sst_memcpy_fromio_32,
-	.ram_write = sst_memcpy_toio_32,
-	.init = skl_sst_dsp_init,
-	.free = skl_dsp_free,
-};
-
-int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
+static int skl_sst_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 {
 	struct skl_dev *skl = sst->thread_context;
 	void __iomem *mmio;
@@ -541,7 +531,16 @@ int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(skl_sst_dsp_init);
+
+struct sst_ops skl_sst_ops = {
+	.irq_handler = skl_dsp_sst_interrupt,
+	.write = sst_shim32_write,
+	.read = sst_shim32_read,
+	.ram_read = sst_memcpy_fromio_32,
+	.ram_write = sst_memcpy_toio_32,
+	.init = skl_sst_init,
+	.free = skl_dsp_free,
+};
 
 int skl_sst_init_fw(struct skl_dev *skl)
 {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
