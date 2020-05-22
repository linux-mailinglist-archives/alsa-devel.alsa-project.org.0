Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA8B1DE3B7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 12:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DC01882;
	Fri, 22 May 2020 12:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DC01882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590142155;
	bh=Xre8tCINf9cnmeDWMIevh6PjJ6PYRNDtDsP3/Y4V6W0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=guFkIIm46UErXY+jTteFb2Qt2qC7xoXNsHWiQj/Qi0kOMWrTkWDUBcMJJgAqlPRUF
	 AJ4xCQKj6OrvUrCg9IelMD63DXiY60ytstkFRtTNe6dxLn4IYTBS5EDKwQ3OY994LK
	 xMyWlg/4hbuydTChX2/ApGbWiZyqrnrbenHX92Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81509F801DA;
	Fri, 22 May 2020 12:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5267DF801F9; Fri, 22 May 2020 12:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5332EF80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 12:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5332EF80111
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 56EFF1A324F;
 Fri, 22 May 2020 12:07:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A8B21A3239;
 Fri, 22 May 2020 12:07:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0A9A740318;
 Fri, 22 May 2020 18:07:12 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Date: Fri, 22 May 2020 17:57:24 +0800
Message-Id: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

With dedicated power domain for asrc, power can be disabled after
probe and pm runtime suspend, then the value of all registers need to
be restored in pm runtime resume. So we can merge suspend/resume function
to runtime_suspend/resume function and enable regcache only in end of
probe.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 70 ++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 432936039de4..3ebbe15ac378 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1100,6 +1100,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, asrc);
 	pm_runtime_enable(&pdev->dev);
 	spin_lock_init(&asrc->lock);
+	regcache_cache_only(asrc->regmap, true);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      &fsl_asrc_dai, 1);
@@ -1117,6 +1118,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	struct fsl_asrc_priv *asrc_priv = asrc->private;
 	int i, ret;
+	u32 asrctr;
 
 	ret = clk_prepare_enable(asrc->mem_clk);
 	if (ret)
@@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 			goto disable_asrck_clk;
 	}
 
+	/* Stop all pairs provisionally */
+	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
+			   ASRCTR_ASRCEi_ALL_MASK, 0);
+
+	/* Restore all registers */
+	regcache_cache_only(asrc->regmap, false);
+	regcache_mark_dirty(asrc->regmap);
+	regcache_sync(asrc->regmap);
+
+	regmap_update_bits(asrc->regmap, REG_ASRCFG,
+			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
+			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
+
+	/* Restart enabled pairs */
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
+			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
+
 	return 0;
 
 disable_asrck_clk:
@@ -1155,6 +1175,11 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 	struct fsl_asrc_priv *asrc_priv = asrc->private;
 	int i;
 
+	regmap_read(asrc->regmap, REG_ASRCFG,
+		    &asrc_priv->regcache_cfg);
+
+	regcache_cache_only(asrc->regmap, true);
+
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
 		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
 	if (!IS_ERR(asrc->spba_clk))
@@ -1166,51 +1191,10 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 }
 #endif /* CONFIG_PM */
 
-#ifdef CONFIG_PM_SLEEP
-static int fsl_asrc_suspend(struct device *dev)
-{
-	struct fsl_asrc *asrc = dev_get_drvdata(dev);
-	struct fsl_asrc_priv *asrc_priv = asrc->private;
-
-	regmap_read(asrc->regmap, REG_ASRCFG,
-		    &asrc_priv->regcache_cfg);
-
-	regcache_cache_only(asrc->regmap, true);
-	regcache_mark_dirty(asrc->regmap);
-
-	return 0;
-}
-
-static int fsl_asrc_resume(struct device *dev)
-{
-	struct fsl_asrc *asrc = dev_get_drvdata(dev);
-	struct fsl_asrc_priv *asrc_priv = asrc->private;
-	u32 asrctr;
-
-	/* Stop all pairs provisionally */
-	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
-	regmap_update_bits(asrc->regmap, REG_ASRCTR,
-			   ASRCTR_ASRCEi_ALL_MASK, 0);
-
-	/* Restore all registers */
-	regcache_cache_only(asrc->regmap, false);
-	regcache_sync(asrc->regmap);
-
-	regmap_update_bits(asrc->regmap, REG_ASRCFG,
-			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
-			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
-
-	/* Restart enabled pairs */
-	regmap_update_bits(asrc->regmap, REG_ASRCTR,
-			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
-
-	return 0;
-}
-#endif /* CONFIG_PM_SLEEP */
-
 static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
-- 
2.21.0

