Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A91C33A7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 09:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E73316E0;
	Mon,  4 May 2020 09:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E73316E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588577514;
	bh=DAaIvp/yTrJsrQw3Xle2LH6mWH15QBAKPZnsvFV2XNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BMImYKWu+GTTZGRGBlv2ZxnHx1iq+n7towmQeqQ37CUAvS9za8IXrBIEW+Y58TREi
	 sDkRUpYWENacX+mQeauCSbPSCNWD+CjTdUAxJlVdFiaAskN/IxUXJ/rHArGEQkfCYf
	 PxI3h1Nce4XL+8oUVrzh5bywuXd7a8txFZEtip58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A97BF80258;
	Mon,  4 May 2020 09:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C62DF80249; Mon,  4 May 2020 09:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by alsa1.perex.cz (Postfix) with ESMTP id 487B6F800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 487B6F800E5
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65eafc3f5f76-fd171;
 Mon, 04 May 2020 15:27:49 +0800 (CST)
X-RM-TRANSID: 2ee65eafc3f5f76-fd171
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.182.180])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35eafc3f2125-99285;
 Mon, 04 May 2020 15:27:49 +0800 (CST)
X-RM-TRANSID: 2ee35eafc3f2125-99285
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, bgoswami@codeaurora.org, plai@codeaurora.org,
 perex@perex.cz
Subject: [PATCH] ASoC: qcom: Use devm_platform_ioremap_resource_byname() to
 simplify code
Date: Mon,  4 May 2020 15:28:20 +0800
Message-Id: <20200504072820.5328-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
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

Use devm_platform_ioremap_resource_byname() instead of
platform_get_resource_byname() + devm_ioremap_resource().

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/qcom/lpass-cpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dbce7e92b..885c1f2e7 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -417,7 +417,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata;
 	struct device_node *dsp_of_node;
-	struct resource *res;
 	struct lpass_variant *variant;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
@@ -442,9 +441,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	drvdata->variant = (struct lpass_variant *)match->data;
 	variant = drvdata->variant;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
-
-	drvdata->lpaif = devm_ioremap_resource(&pdev->dev, res);
+	drvdata->lpaif = devm_platform_ioremap_resource_byname(pdev,
+						"lpass-lpaif")
 	if (IS_ERR((void const __force *)drvdata->lpaif)) {
 		dev_err(&pdev->dev, "error mapping reg resource: %ld\n",
 				PTR_ERR((void const __force *)drvdata->lpaif));
-- 
2.20.1.windows.1



