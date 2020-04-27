Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43F1B9F99
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 11:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAE01672;
	Mon, 27 Apr 2020 11:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAE01672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587979037;
	bh=4Vlp/SDMrdHfUmdKGrUDCbX741GSN5Vg7Ox1EYP2Y0k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RrJevt8Ms6WCkxKmAEnk9JeArUF+BSC+bjXF9R68l/8gHK9QtFePKGRNS6OWiO5av
	 8UYM0X+lNBvn1eTCVbj9MXoXYL6FqYGko+hbW6O78VbNxifZbKwJKWxxdFAn2U7ixG
	 dfcFRsX6BPr9rumBfBDUUQAkUPosVdAuxwRAFhrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C2BF80232;
	Mon, 27 Apr 2020 11:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F716F8022B; Mon, 27 Apr 2020 11:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id ECAB4F80217
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 11:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECAB4F80217
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35ea6a292d8d-7917e;
 Mon, 27 Apr 2020 17:14:58 +0800 (CST)
X-RM-TRANSID: 2ee35ea6a292d8d-7917e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5ea6a28c769-78073;
 Mon, 27 Apr 2020 17:14:55 +0800 (CST)
X-RM-TRANSID: 2eea5ea6a28c769-78073
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: hisilicon: Use the defined variable to clean code
Date: Mon, 27 Apr 2020 17:15:20 +0800
Message-Id: <20200427091520.12412-1-tangbin@cmss.chinamobile.com>
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

Use the defined variable "dev" to make the code cleaner.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index f14ce0253..fd5dcd6b9 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -547,7 +547,7 @@ static int hi6210_i2s_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
+	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
 		return -ENOMEM;
 
@@ -562,28 +562,28 @@ static int hi6210_i2s_probe(struct platform_device *pdev)
 	i2s->base_phys = (phys_addr_t)res->start;
 	i2s->dai = hi6210_i2s_dai_init;
 
-	dev_set_drvdata(&pdev->dev, i2s);
+	dev_set_drvdata(dev, i2s);
 
 	i2s->sysctrl = syscon_regmap_lookup_by_phandle(node,
 						"hisilicon,sysctrl-syscon");
 	if (IS_ERR(i2s->sysctrl))
 		return PTR_ERR(i2s->sysctrl);
 
-	i2s->clk[CLK_DACODEC] = devm_clk_get(&pdev->dev, "dacodec");
+	i2s->clk[CLK_DACODEC] = devm_clk_get(dev, "dacodec");
 	if (IS_ERR(i2s->clk[CLK_DACODEC]))
 		return PTR_ERR(i2s->clk[CLK_DACODEC]);
 	i2s->clocks++;
 
-	i2s->clk[CLK_I2S_BASE] = devm_clk_get(&pdev->dev, "i2s-base");
+	i2s->clk[CLK_I2S_BASE] = devm_clk_get(dev, "i2s-base");
 	if (IS_ERR(i2s->clk[CLK_I2S_BASE]))
 		return PTR_ERR(i2s->clk[CLK_I2S_BASE]);
 	i2s->clocks++;
 
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &hi6210_i2s_i2s_comp,
+	ret = devm_snd_soc_register_component(dev, &hi6210_i2s_i2s_comp,
 					 &i2s->dai, 1);
 	return ret;
 }
-- 
2.20.1.windows.1



