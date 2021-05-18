Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B763873BB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4080F16AB;
	Tue, 18 May 2021 10:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4080F16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621325057;
	bh=s7e6QAf6A6v247pyw3Ub5IpuYvB27r3UCSHg3lKMMHo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gy/1zZmHIiDL3o4tnWfmGvDtWQknTtGI18Jt0QTOigrdXseKeEiDUFYGHBI3f1hIA
	 bLxoqrNKGb8+JbKjOXpMNZ1BlaYLRSbXA0nkSWOSQpEEEdafv9tv5vJeaIPPjHVd+8
	 lRNmguaSqbDC5gtnzGRP1tMk5QtggSDKXnBn7JdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A59FF804B4;
	Tue, 18 May 2021 10:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91C71F80217; Tue, 18 May 2021 09:56:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE2D6F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 09:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE2D6F80139
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FkpCs1rLnzCtQT;
 Tue, 18 May 2021 15:53:45 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 15:56:30 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 18 May
 2021 15:56:30 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: rk3328: fix missing clk_disable_unprepare() on
 error in rk3328_platform_probe()
Date: Tue, 18 May 2021 15:58:47 +0800
Message-ID: <20210518075847.1116983-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 18 May 2021 10:00:15 +0200
Cc: broonie@kernel.org
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

Fix the missing clk_disable_unprepare() before return
from rk3328_platform_probe() in the error handling case.

Fixes: c32759035ad2 ("ASoC: rockchip: support ACODEC for rk3328")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/codecs/rk3328_codec.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index bfefefcc76d8..758d439e8c7a 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -474,7 +474,8 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 	rk3328->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(rk3328->pclk)) {
 		dev_err(&pdev->dev, "can't get acodec pclk\n");
-		return PTR_ERR(rk3328->pclk);
+		ret = PTR_ERR(rk3328->pclk);
+		goto err_unprepare_mclk;
 	}
 
 	ret = clk_prepare_enable(rk3328->pclk);
@@ -484,19 +485,34 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 	}
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		goto err_unprepare_pclk;
+	}
 
 	rk3328->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &rk3328_codec_regmap_config);
-	if (IS_ERR(rk3328->regmap))
-		return PTR_ERR(rk3328->regmap);
+	if (IS_ERR(rk3328->regmap)) {
+		ret = PTR_ERR(rk3328->regmap);
+		goto err_unprepare_pclk;
+	}
 
 	platform_set_drvdata(pdev, rk3328);
 
-	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_rk3328,
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_rk3328,
 					       rk3328_dai,
 					       ARRAY_SIZE(rk3328_dai));
+	if (ret)
+		goto err_unprepare_pclk;
+
+	return 0;
+
+err_unprepare_pclk:
+	clk_disable_unprepare(rk3328->pclk);
+
+err_unprepare_mclk:
+	clk_disable_unprepare(rk3328->mclk);
+	return ret;
 }
 
 static const struct of_device_id rk3328_codec_of_match[] __maybe_unused = {
-- 
2.25.1

