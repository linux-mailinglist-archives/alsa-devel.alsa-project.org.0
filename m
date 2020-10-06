Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5374284667
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71C951776;
	Tue,  6 Oct 2020 08:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71C951776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601967501;
	bh=wYISL1lttkFluCko7BcOtf6doVG70oGVVf8Nz9Pd0FE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZ4cOT0BLC70+uFNgrjTgP+bw6Lk3IYo4vLCQ3h3zuTR1qr8K87vXsPNHtKBivla1
	 /dC6y6W8PQ6hxGmLm2bPvWWJPUuA1WJs8qO/hP+EM1QDisEkotLLNaxsSFI+vnVzC9
	 JCwtAuJuh1VSRqLMViIsmFgGwK/9aRHBwkRNH2cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6615EF80367;
	Tue,  6 Oct 2020 08:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53300F8034A; Tue,  6 Oct 2020 08:50:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79795F80337
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79795F80337
IronPort-SDR: R/m5ugD7NcISgdGpe16EcvAXJ7/oEQh+n8xuXS70X9jvOM7V0EduxNPqrM0nkRpR2iw/f2dINA
 vHgwifHGfnVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249091387"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="249091387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 23:50:40 -0700
IronPort-SDR: Gw7Lep+ZbpHan7pk20CT2OprvTTzb2+tqkxC6Y9am0XVo5EE9jICMwfZQeero789xnyLRn+G5u
 4lYfQxvkTJZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="315491341"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2020 23:50:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 13/13] ASoC: Intel: Remove sst_dsp_get_thread_context
Date: Tue,  6 Oct 2020 08:49:07 +0200
Message-Id: <20201006064907.16277-14-cezary.rojewski@intel.com>
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

While sst_dsp_get_thread_context() is declared as solution-agnostic, it
is only used by /skylake/ solution. Majority of thread_context field
usages are direct accesses. Improve code cohesiveness and convert to
single usage model.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h | 5 -----
 sound/soc/intel/skylake/cnl-sst.c     | 2 +-
 sound/soc/intel/skylake/skl-sst-ipc.c | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 5a5ce5069f9f..de2b44568feb 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -98,9 +98,4 @@ struct sst_dsp {
 	struct snd_dma_buffer dmab;
 };
 
-static inline void *sst_dsp_get_thread_context(struct sst_dsp *sst)
-{
-	return sst->thread_context;
-}
-
 #endif
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 355a7b116886..fcd8dff27ae8 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -311,7 +311,7 @@ static struct sst_ops cnl_ops = {
 static irqreturn_t cnl_dsp_irq_thread_handler(int irq, void *context)
 {
 	struct sst_dsp *dsp = context;
-	struct skl_dev *cnl = sst_dsp_get_thread_context(dsp);
+	struct skl_dev *cnl = dsp->thread_context;
 	struct sst_generic_ipc *ipc = &cnl->ipc;
 	struct skl_ipc_header header = {0};
 	u32 hipcida, hipctdr, hipctdd;
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 667cdddc289f..7a425271b08b 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -489,7 +489,7 @@ void skl_ipc_process_reply(struct sst_generic_ipc *ipc,
 irqreturn_t skl_dsp_irq_thread_handler(int irq, void *context)
 {
 	struct sst_dsp *dsp = context;
-	struct skl_dev *skl = sst_dsp_get_thread_context(dsp);
+	struct skl_dev *skl = dsp->thread_context;
 	struct sst_generic_ipc *ipc = &skl->ipc;
 	struct skl_ipc_header header = {0};
 	u32 hipcie, hipct, hipcte;
-- 
2.17.1

