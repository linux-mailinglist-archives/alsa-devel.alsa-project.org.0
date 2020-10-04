Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DD282A28
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77551845;
	Sun,  4 Oct 2020 12:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77551845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601806227;
	bh=4iDilHsQ/nsnCMDy/AkeIUDI66CLwqkM2W/UZK31AFo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gEqkOTE49YQHIjp5bEA4rPlw2Un9oe4UzaeNPgkE8tURkjYhzO9CGNpPo7OtOHwZr
	 h0gvTV0ggjj8/N/E6BWXWqcn0F4HyzaMH47KDSNeq89dZQtAbQL8hSueZpna3PZqJ8
	 382TVecGgKFENMUqC2nRw46r3m28ZT0uD8MXKFfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9054F80361;
	Sun,  4 Oct 2020 12:02:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1349BF80334; Sun,  4 Oct 2020 12:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B6A1F80316
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B6A1F80316
IronPort-SDR: wB1bJiGsDIwngFau4Ce0WU3Js/REHeVBJs/HdNNlv2H+k+PIdjd8zwaH4CKFQv09yS8omDN+EO
 cP1LjVLsSiBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="163384023"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="163384023"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:02:25 -0700
IronPort-SDR: EV09XQNQ8bN+EPkYMeVJc7KConPIMElgSQPARhrP/4DCCxkIwxY25ktrahK9BPRQYKKpyl5BR6
 lfzaL2X2exAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527974"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:02:22 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/13] ASoC: Intel: Remove sst_pdata structure
Date: Sun,  4 Oct 2020 12:01:27 +0200
Message-Id: <20201004100128.5842-13-cezary.rojewski@intel.com>
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

struct sst_pdata is unused among remaining /sound/soc/intel solution so
remove it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h |  2 +-
 sound/soc/intel/common/sst-dsp.h      | 28 ---------------------------
 sound/soc/intel/skylake/skl-sst-dsp.c |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 7d9834509f4a..5a5ce5069f9f 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -27,7 +27,7 @@ struct sst_ops {
 	irqreturn_t (*irq_handler)(int irq, void *context);
 
 	/* SST init and free */
-	int (*init)(struct sst_dsp *sst, struct sst_pdata *pdata);
+	int (*init)(struct sst_dsp *sst);
 	void (*free)(struct sst_dsp *sst);
 };
 
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index 021a36b2398a..f111fd3f334b 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -26,34 +26,6 @@ struct sst_dsp_device {
 	void *thread_context;
 };
 
-/*
- * SST Platform Data.
- */
-struct sst_pdata {
-	/* ACPI data */
-	u32 lpe_base;
-	u32 lpe_size;
-	u32 pcicfg_base;
-	u32 pcicfg_size;
-	u32 fw_base;
-	u32 fw_size;
-	int irq;
-
-	/* Firmware */
-	const struct firmware *fw;
-
-	/* DMA */
-	int resindex_dma_base; /* other fields invalid if equals to -1 */
-	u32 dma_base;
-	u32 dma_size;
-	int dma_engine;
-	struct device *dma_dev;
-
-	/* DSP */
-	u32 id;
-	void *dsp;
-};
-
 /* SHIM Read / Write */
 void sst_dsp_shim_write(struct sst_dsp *sst, u32 offset, u32 value);
 u32 sst_dsp_shim_read(struct sst_dsp *sst, u32 offset);
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 225706d148d8..4ae3eae0d1fd 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -422,7 +422,7 @@ struct sst_dsp *skl_dsp_ctx_init(struct device *dev,
 
 	/* Initialise SST Audio DSP */
 	if (sst->ops->init) {
-		ret = sst->ops->init(sst, NULL);
+		ret = sst->ops->init(sst);
 		if (ret < 0)
 			return NULL;
 	}
-- 
2.17.1

