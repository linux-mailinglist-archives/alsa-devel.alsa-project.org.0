Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065FC25BF66
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB3D167E;
	Thu,  3 Sep 2020 12:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB3D167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130275;
	bh=KDuiiHagd8qS95037gs0PzZwpzyTKe9cgPi4P5btqnw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSRZLXHClaodnp5GLhK7JMY/7vZ7Nwf7sCx6pxx0wAGtnA2ASZhXhJIbLVdnJ3uMZ
	 9B0Q33jzotd6Zj/c/HBQHD1KpAgn0CbPzaN2vaPHSi5RLjiJB497QuEfN4zjWu6+2w
	 E2rwh/bfiVyI3AU9aVb4IwtGOxGwvJbSCoPRoLjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92AC4F802DB;
	Thu,  3 Sep 2020 12:48:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34C24F802DC; Thu,  3 Sep 2020 12:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBE80F802A9
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE80F802A9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90CAAB145;
 Thu,  3 Sep 2020 10:47:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: fsl: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:47:47 +0200
Message-Id: <20200903104749.21435-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104749.21435-1-tiwai@suse.de>
References: <20200903104749.21435-1-tiwai@suse.de>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In ASoC FSL ESAI CPU DAI driver, a
tasklet is still used for offloading the hardware reset function.
It can be achieved gracefully with a work queued, too.

This patch replaces the tasklet usage in fsl esai driver with a simple
work.  The conversion is fairly straightforward.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl_esai.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 79b861afd986..39637ca78cdb 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -41,7 +41,7 @@ struct fsl_esai_soc_data {
  * @extalclk: esai clock source to derive HCK, SCK and FS
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
- * @task: tasklet to handle the reset operation
+ * @work: work to handle the reset operation
  * @soc: soc specific data
  * @lock: spin lock between hw_reset() and trigger()
  * @fifo_depth: depth of tx/rx FIFO
@@ -67,7 +67,7 @@ struct fsl_esai {
 	struct clk *extalclk;
 	struct clk *fsysclk;
 	struct clk *spbaclk;
-	struct tasklet_struct task;
+	struct work_struct work;
 	const struct fsl_esai_soc_data *soc;
 	spinlock_t lock; /* Protect hw_reset and trigger */
 	u32 fifo_depth;
@@ -117,7 +117,7 @@ static irqreturn_t esai_isr(int irq, void *devid)
 				   ESAI_xCR_xEIE_MASK, 0);
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
 				   ESAI_xCR_xEIE_MASK, 0);
-		tasklet_schedule(&esai_priv->task);
+		schedule_work(&esai_priv->work);
 	}
 
 	if (esr & ESAI_ESR_TINIT_MASK)
@@ -708,9 +708,9 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xFCR_xFR, 0);
 }
 
-static void fsl_esai_hw_reset(struct tasklet_struct *t)
+static void fsl_esai_hw_reset(struct work_struct *work)
 {
-	struct fsl_esai *esai_priv = from_tasklet(esai_priv, t, task);
+	struct fsl_esai *esai_priv = container_of(work, struct fsl_esai, work);
 	bool tx = true, rx = false, enabled[2];
 	unsigned long lock_flags;
 	u32 tfcr, rfcr;
@@ -1070,7 +1070,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	tasklet_setup(&esai_priv->task, fsl_esai_hw_reset);
+	INIT_WORK(&esai_priv->work, fsl_esai_hw_reset);
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -1088,7 +1088,7 @@ static int fsl_esai_remove(struct platform_device *pdev)
 	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	tasklet_kill(&esai_priv->task);
+	cancel_work_sync(&esai_priv->work);
 
 	return 0;
 }
-- 
2.16.4

