Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7F199F72
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4DB167B;
	Thu, 22 Aug 2019 21:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4DB167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566500956;
	bh=WJ6Wq+hyEk7w5FhXKi32H9YBDPNLa3HKlz/D+kVCJQw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cOqbYSta+G2eEU+SfRCNq0vwKXj4ETNNW/qs78KH3eiPbNGbG/0C53F28/CB/xMSG
	 RcqCODoLneCRBq32p9xEkWhxAxbK7QnykSzn/3GVxLtRvm8YjJhtDRx3ElwOxx2Vlc
	 /snj0G+/qo1O7Z0PDSOe1YTd11UrpmL6W4x9l5sI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC5AF80641;
	Thu, 22 Aug 2019 21:05:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DAC9F805FE; Thu, 22 Aug 2019 21:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69244F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69244F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524240"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:56 +0200
Message-Id: <20190822190425.23001-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 06/35] ASoC: Intel: Skylake: Unhardcode dsp
	cores number
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

While on the quest for unhardcoding the driver, use skl hw_cfg property
instead of hardcoded value to retrieve number of supported dsp cores.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c | 28 -------------------------
 sound/soc/intel/skylake/skl-sst-dsp.c  | 29 +++++++++++++++++++-------
 sound/soc/intel/skylake/skl-sst-dsp.h  |  2 +-
 sound/soc/intel/skylake/skl-sst.c      |  4 +++-
 sound/soc/intel/skylake/skl.h          |  1 -
 5 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index cc949904717e..e4ac1ae777e0 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -170,56 +170,48 @@ static struct skl_dsp_loader_ops bxt_get_loader_ops(void)
 static const struct skl_dsp_ops dsp_ops[] = {
 	{
 		.id = 0x9d70,
-		.num_cores = 2,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
 		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x9d71,
-		.num_cores = 2,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
 		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x5a98,
-		.num_cores = 2,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
 		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
 		.id = 0x3198,
-		.num_cores = 2,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
 		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
 		.id = 0x9dc8,
-		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
 		.id = 0xa348,
-		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x02c8,
-		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x06c8,
-		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 		.cleanup = cnl_sst_dsp_cleanup
@@ -245,7 +237,6 @@ int skl_init_dsp(struct skl_dev *skl)
 	struct skl_dsp_loader_ops loader_ops;
 	int irq = bus->irq;
 	const struct skl_dsp_ops *ops;
-	struct skl_dsp_cores *cores;
 	int ret;
 
 	/* enable ppcap interrupt */
@@ -274,29 +265,10 @@ int skl_init_dsp(struct skl_dev *skl)
 		goto unmap_mmio;
 
 	skl->dsp_ops = ops;
-	cores = &skl->cores;
-	cores->count = ops->num_cores;
-
-	cores->state = kcalloc(cores->count, sizeof(*cores->state), GFP_KERNEL);
-	if (!cores->state) {
-		ret = -ENOMEM;
-		goto unmap_mmio;
-	}
-
-	cores->usage_count = kcalloc(cores->count, sizeof(*cores->usage_count),
-				     GFP_KERNEL);
-	if (!cores->usage_count) {
-		ret = -ENOMEM;
-		goto free_core_state;
-	}
-
 	dev_dbg(bus->dev, "dsp registration status=%d\n", ret);
 
 	return 0;
 
-free_core_state:
-	kfree(cores->state);
-
 unmap_mmio:
 	iounmap(mmio_base);
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 0eecf26986f9..15acbe80711e 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -8,7 +8,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 #include <sound/pcm.h>
-
+#include <linux/slab.h>
 #include "../common/sst-dsp.h"
 #include "../common/sst-ipc.h"
 #include "../common/sst-dsp-priv.h"
@@ -31,18 +31,33 @@ void skl_dsp_set_state_locked(struct sst_dsp *ctx, int state)
  * successful first boot. Hence core 0 will be running and other cores
  * will be reset
  */
-void skl_dsp_init_core_state(struct sst_dsp *ctx)
+int skl_dsp_init_core_state(struct sst_dsp *ctx)
 {
 	struct skl_dev *skl = ctx->thread_context;
+	struct skl_dsp_cores *cores = &skl->cores;
 	int i;
 
-	skl->cores.state[SKL_DSP_CORE0_ID] = SKL_DSP_RUNNING;
-	skl->cores.usage_count[SKL_DSP_CORE0_ID] = 1;
+	cores->count = skl->hw_cfg.dsp_cores;
+	cores->state = kcalloc(cores->count,
+			sizeof(*cores->state), GFP_KERNEL);
+	if (!cores->state)
+		return -ENOMEM;
+
+	cores->usage_count = kcalloc(cores->count,
+			sizeof(*cores->usage_count), GFP_KERNEL);
+	if (!cores->usage_count) {
+		kfree(cores->state);
+		return -ENOMEM;
+	}
+
+	cores->state[SKL_DSP_CORE0_ID] = SKL_DSP_RUNNING;
+	cores->usage_count[SKL_DSP_CORE0_ID] = 1;
 
-	for (i = SKL_DSP_CORE0_ID + 1; i < skl->cores.count; i++) {
-		skl->cores.state[i] = SKL_DSP_RESET;
-		skl->cores.usage_count[i] = 0;
+	for (i = SKL_DSP_CORE0_ID + 1; i < cores->count; i++) {
+		cores->state[i] = SKL_DSP_RESET;
+		cores->usage_count[i] = 0;
 	}
+	return 0;
 }
 EXPORT_SYMBOL_GPL(skl_dsp_init_core_state);
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 06979652985c..2129627e6255 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -202,7 +202,7 @@ int skl_dsp_acquire_irq(struct sst_dsp *sst);
 bool is_skl_dsp_running(struct sst_dsp *ctx);
 
 unsigned int skl_dsp_get_enabled_cores(struct sst_dsp *ctx);
-void skl_dsp_init_core_state(struct sst_dsp *ctx);
+int skl_dsp_init_core_state(struct sst_dsp *ctx);
 int skl_dsp_enable_core(struct sst_dsp *ctx, unsigned int core_mask);
 int skl_dsp_disable_core(struct sst_dsp *ctx, unsigned int core_mask);
 int skl_dsp_core_power_up(struct sst_dsp *ctx, unsigned int core_mask);
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 8a8ecb9a4fc6..163590682e1a 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -589,7 +589,9 @@ int skl_sst_init_fw(struct skl_dev *skl)
 		goto exit;
 	}
 
-	skl_dsp_init_core_state(sst);
+	ret = skl_dsp_init_core_state(sst);
+	if (ret < 0)
+		goto exit;
 
 library_load:
 	if (skl->lib_count > 1) {
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 1f86543fe954..71e69f52b7ab 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -155,7 +155,6 @@ struct skl_machine_pdata {
 
 struct skl_dsp_ops {
 	int id;
-	unsigned int num_cores;
 	struct skl_dsp_loader_ops (*loader_ops)(void);
 	int (*init)(struct device *dev, void __iomem *mmio_base,
 			int irq, const char *fw_name,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
