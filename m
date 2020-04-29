Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6EC1BD883
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 11:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C0816AA;
	Wed, 29 Apr 2020 11:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C0816AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588153339;
	bh=c8FTL2kAQffp332pA8R6sgGbEdLDmFscdAC8XxyHsnA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zpe7IHUN9a8DZWg3FqVkqlQB3HSkMJFyESD9LLkBw4jzJbX+dMnfNsKEXwSfEh/gj
	 qSg4Yt+vBBef29KxXawTgmzWzZG/6WnC2FRsDn/c5X9MXmd50Qwc9VMi+k+euB/ooq
	 xYBe5qDHtS5WES8xGaz8qky4KbxdA/eRfTDwowZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED012F80232;
	Wed, 29 Apr 2020 11:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C52F8022B; Wed, 29 Apr 2020 11:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by alsa1.perex.cz (Postfix) with ESMTP id 913D1F80217
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 11:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913D1F80217
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75ea94b759d6-addd1;
 Wed, 29 Apr 2020 17:40:05 +0800 (CST)
X-RM-TRANSID: 2ee75ea94b759d6-addd1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.104.146.39])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35ea94b714a2-d9f76;
 Wed, 29 Apr 2020 17:40:04 +0800 (CST)
X-RM-TRANSID: 2ee35ea94b714a2-d9f76
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de
Subject: [PATCH] ASoC: mxs-saif: Add variable dev to simplify code
Date: Wed, 29 Apr 2020 17:40:23 +0800
Message-Id: <20200429094023.12856-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
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

Add variable 'dev' to make the code cleaner in the function
mxs_saif_probe(). And now that the function mxs_saif_mclk_init()
have defined the variables 'ret' as the error returned value,
then it should be used instead in this place.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mxs/mxs-saif.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index dc197883e..f4e441183 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -719,7 +719,7 @@ static int mxs_saif_mclk_init(struct platform_device *pdev)
 		if (ret == -EEXIST)
 			return 0;
 		dev_err(&pdev->dev, "failed to register mclk: %d\n", ret);
-		return PTR_ERR(clk);
+		return ret;
 	}
 
 	ret = of_clk_add_provider(np, of_clk_src_simple_get, clk);
@@ -732,6 +732,7 @@ static int mxs_saif_mclk_init(struct platform_device *pdev)
 static int mxs_saif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct mxs_saif *saif;
 	int irq, ret;
 	struct device_node *master;
@@ -739,7 +740,7 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	if (!np)
 		return -EINVAL;
 
-	saif = devm_kzalloc(&pdev->dev, sizeof(*saif), GFP_KERNEL);
+	saif = devm_kzalloc(dev, sizeof(*saif), GFP_KERNEL);
 	if (!saif)
 		return -ENOMEM;
 
@@ -750,7 +751,7 @@ static int mxs_saif_probe(struct platform_device *pdev)
 		saif->id = ret;
 
 	if (saif->id >= ARRAY_SIZE(mxs_saif)) {
-		dev_err(&pdev->dev, "get wrong saif id\n");
+		dev_err(dev, "get wrong saif id\n");
 		return -EINVAL;
 	}
 
@@ -770,18 +771,17 @@ static int mxs_saif_probe(struct platform_device *pdev)
 			saif->master_id = ret;
 
 		if (saif->master_id >= ARRAY_SIZE(mxs_saif)) {
-			dev_err(&pdev->dev, "get wrong master id\n");
+			dev_err(dev, "get wrong master id\n");
 			return -EINVAL;
 		}
 	}
 
 	mxs_saif[saif->id] = saif;
 
-	saif->clk = devm_clk_get(&pdev->dev, NULL);
+	saif->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(saif->clk)) {
 		ret = PTR_ERR(saif->clk);
-		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
-			ret);
+		dev_err(dev, "Cannot get the clock: %d\n", ret);
 		return ret;
 	}
 
@@ -793,11 +793,11 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	saif->dev = &pdev->dev;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
-			       dev_name(&pdev->dev), saif);
+	saif->dev = dev;
+	ret = devm_request_irq(dev, irq, mxs_saif_irq, 0,
+			       dev_name(dev), saif);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq\n");
+		dev_err(dev, "failed to request irq\n");
 		return ret;
 	}
 
@@ -807,19 +807,19 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	if (saif->id == 0) {
 		ret = mxs_saif_mclk_init(pdev);
 		if (ret)
-			dev_warn(&pdev->dev, "failed to init clocks\n");
+			dev_warn(dev, "failed to init clocks\n");
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
+	ret = devm_snd_soc_register_component(dev, &mxs_saif_component,
 					      &mxs_saif_dai, 1);
 	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed\n");
+		dev_err(dev, "register DAI failed\n");
 		return ret;
 	}
 
-	ret = mxs_pcm_platform_register(&pdev->dev);
+	ret = mxs_pcm_platform_register(dev);
 	if (ret) {
-		dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
+		dev_err(dev, "register PCM failed: %d\n", ret);
 		return ret;
 	}
 
-- 
2.20.1.windows.1



