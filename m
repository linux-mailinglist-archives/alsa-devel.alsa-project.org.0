Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E84732032AA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 11:02:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78BC0167D;
	Mon, 22 Jun 2020 11:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78BC0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592816522;
	bh=hAgZ3gAwQBmm6gPcVt10dv5eMHYKFMWG6Po4cLXNWqc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ORaQPD/vj9ERKqeLca2OEGr5G2Oq7WRFRnI7I8tIRv/ROtm7O+LwHIjz1za8SMer5
	 qiU7fDedfRYaKNz33/WovIdh1DnSX8gpkK90HqvuaMxM7XNCkcQFdxLoeK4GnvTQB2
	 yIKZhcLEq7Wtfys5gUds0sdlSHajdrAqekAbgd5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A5AF80157;
	Mon, 22 Jun 2020 11:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1049AF8015B; Mon, 22 Jun 2020 11:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43194F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 11:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43194F8010E
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 900BE1A0B85;
 Mon, 22 Jun 2020 11:00:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 66EB51A0B76;
 Mon, 22 Jun 2020 11:00:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 26CA8402CA;
 Mon, 22 Jun 2020 16:59:59 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_mqs: Fix unchecked return value for
 clk_prepare_enable
Date: Mon, 22 Jun 2020 16:48:45 +0800
Message-Id: <1592815725-853-1-git-send-email-shengjiu.wang@nxp.com>
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

Fix unchecked return value for clk_prepare_enable.

And because clk_prepare_enable and clk_disable_unprepare should
check input clock parameter is NULL or not, then we don't need
to check it before calling the function.

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 0c813a45bba7..69aeb0e71844 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -265,12 +265,20 @@ static int fsl_mqs_remove(struct platform_device *pdev)
 static int fsl_mqs_runtime_resume(struct device *dev)
 {
 	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
+	int ret;
 
-	if (mqs_priv->ipg)
-		clk_prepare_enable(mqs_priv->ipg);
+	ret = clk_prepare_enable(mqs_priv->ipg);
+	if (ret) {
+		dev_err(dev, "failed to enable ipg clock\n");
+		return ret;
+	}
 
-	if (mqs_priv->mclk)
-		clk_prepare_enable(mqs_priv->mclk);
+	ret = clk_prepare_enable(mqs_priv->mclk);
+	if (ret) {
+		dev_err(dev, "failed to enable mclk clock\n");
+		clk_disable_unprepare(mqs_priv->ipg);
+		return ret;
+	}
 
 	if (mqs_priv->use_gpr)
 		regmap_write(mqs_priv->regmap, IOMUXC_GPR2,
@@ -292,11 +300,8 @@ static int fsl_mqs_runtime_suspend(struct device *dev)
 		regmap_read(mqs_priv->regmap, REG_MQS_CTRL,
 			    &mqs_priv->reg_mqs_ctrl);
 
-	if (mqs_priv->mclk)
-		clk_disable_unprepare(mqs_priv->mclk);
-
-	if (mqs_priv->ipg)
-		clk_disable_unprepare(mqs_priv->ipg);
+	clk_disable_unprepare(mqs_priv->mclk);
+	clk_disable_unprepare(mqs_priv->ipg);
 
 	return 0;
 }
-- 
2.21.0

