Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A21B6E9E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 09:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443E01699;
	Fri, 24 Apr 2020 09:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443E01699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587711923;
	bh=uHwqAm/wCjvDc6Ob2inEso9BM5vID9H7oN7DwxobKWc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GREXCwdo8SlBgijSEvcwB74Yxd1hSokJk544vnHlDxF5iBMPddzuhebZGhYFP7WzD
	 WypKJHtE8nkb1DlTh45nR1+ySsfcpuxwTOo3I7atcZl5Sk+fc4KvdrVd5Zy0nh3M9k
	 Dclw0s/fBOOsLYSGjQmJvjZgHja0PrZJkF5ZyEP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F7AEF800BE;
	Fri, 24 Apr 2020 09:03:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA45BF80142; Fri, 24 Apr 2020 09:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D0ADF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 09:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0ADF800BE
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DACB1205243;
 Fri, 24 Apr 2020 09:03:29 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 666D9204FE9;
 Fri, 24 Apr 2020 09:03:25 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 121E74034F;
 Fri, 24 Apr 2020 15:02:32 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_esai: Remove the tasklet
Date: Fri, 24 Apr 2020 14:54:06 +0800
Message-Id: <1587711246-27226-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Remove tasklet for it may cause the reset operation
can't be handled immediately, then there will be
endless xrun interrupt.

Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index c7a49d03463a..1ad0859da5e2 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -32,7 +32,6 @@
  * @extalclk: esai clock source to derive HCK, SCK and FS
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
- * @task: tasklet to handle the reset operation
  * @lock: spin lock between hw_reset() and trigger()
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
@@ -56,7 +55,6 @@ struct fsl_esai {
 	struct clk *extalclk;
 	struct clk *fsysclk;
 	struct clk *spbaclk;
-	struct tasklet_struct task;
 	spinlock_t lock; /* Protect hw_reset and trigger */
 	u32 fifo_depth;
 	u32 slot_width;
@@ -74,6 +72,8 @@ struct fsl_esai {
 	char name[32];
 };
 
+static void fsl_esai_hw_reset(struct fsl_esai *esai_priv);
+
 static irqreturn_t esai_isr(int irq, void *devid)
 {
 	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
@@ -87,7 +87,7 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
 	    esai_priv->reset_at_xrun) {
 		dev_dbg(&pdev->dev, "reset module for xrun\n");
-		tasklet_schedule(&esai_priv->task);
+		fsl_esai_hw_reset(esai_priv);
 	}
 
 	if (esr & ESAI_ESR_TINIT_MASK)
@@ -674,9 +674,8 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xFCR_xFR, 0);
 }
 
-static void fsl_esai_hw_reset(unsigned long arg)
+static void fsl_esai_hw_reset(struct fsl_esai *esai_priv)
 {
-	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
 	bool tx = true, rx = false, enabled[2];
 	unsigned long lock_flags;
 	u32 tfcr, rfcr;
@@ -1034,9 +1033,6 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	tasklet_init(&esai_priv->task, fsl_esai_hw_reset,
-		     (unsigned long)esai_priv);
-
 	pm_runtime_enable(&pdev->dev);
 
 	regcache_cache_only(esai_priv->regmap, true);
@@ -1050,10 +1046,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 static int fsl_esai_remove(struct platform_device *pdev)
 {
-	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
-
 	pm_runtime_disable(&pdev->dev);
-	tasklet_kill(&esai_priv->task);
 
 	return 0;
 }
-- 
2.21.0

