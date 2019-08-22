Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3999F9F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2301669;
	Thu, 22 Aug 2019 21:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2301669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501365;
	bh=dBl/I4SybybrgHUDQAFs8LKc9qtZRHUQ46yJFdfgAxI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rf4ROtM76Mouh3dPKlknuG70XQhF4OuGLfcm2GsJOaue/KRlu77yVK+97eDNeP2eG
	 XaO7t2/TdgLa+P1Ad06QpvsmqENOVGbtImPowyp2Laih6V+xq87Qc39XrqBI8w8fw8
	 UMAiutznjA22aWcZ3XHsxcwGma8wFFDYI4o/EkvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FB1F8071D;
	Thu, 22 Aug 2019 21:06:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE2AF80672; Thu, 22 Aug 2019 21:05:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B64AF805F9
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B64AF805F9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524345"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:04 +0200
Message-Id: <20190822190425.23001-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 14/35] ASoC: Intel: Skylake: Remove
	skl_dsp_acquire_irq
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

With Skylake following the unified sst_dsp init and free flow, there is
no need for custom _acquire_irq function. Framework takes care of this
with constructor for us. Remove redundant handler.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-sst-dsp.c | 14 --------------
 sound/soc/intel/skylake/skl-sst-dsp.h |  1 -
 2 files changed, 15 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 9d8eb1af4798..773b4b562a07 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -418,20 +418,6 @@ int skl_dsp_sleep(struct sst_dsp *ctx)
 }
 EXPORT_SYMBOL_GPL(skl_dsp_sleep);
 
-int skl_dsp_acquire_irq(struct sst_dsp *sst)
-{
-	int ret;
-
-	/* Register the ISR */
-	ret = request_threaded_irq(sst->irq, sst->ops->irq_handler,
-		sst->ops->thread_fn, IRQF_SHARED, "AudioDSP", sst);
-	if (ret)
-		dev_err(sst->dev, "unable to grab threaded IRQ %d, disabling device\n",
-			       sst->irq);
-
-	return ret;
-}
-
 void skl_dsp_free(struct sst_dsp *dsp)
 {
 	struct skl_dev *skl = dsp->thread_context;
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 1d579d59de60..45d99b6b448e 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -196,7 +196,6 @@ int skl_cldma_prepare(struct sst_dsp *ctx);
 int skl_cldma_wait_interruptible(struct sst_dsp *ctx);
 
 void skl_dsp_set_state_locked(struct sst_dsp *ctx, int state);
-int skl_dsp_acquire_irq(struct sst_dsp *sst);
 bool is_skl_dsp_running(struct sst_dsp *ctx);
 
 unsigned int skl_dsp_get_enabled_cores(struct sst_dsp *ctx);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
