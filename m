Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC834CF3BB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 09:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C5E1732;
	Mon,  7 Mar 2022 09:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C5E1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646642235;
	bh=LiYxJXO7BpAlaOqHrmcW/Ra1rjP/9EQrAWSaoPyrN7Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ItQ0xADI1QCmenfjI7V30Bd7DMRglVFpLNoq/sotvEQhWrFfTWciS9/3w4ArwcE1W
	 gJ5X8rirnDPQ+rUOpvN6LSzzexhTWTKHyUvEKdhF8TfGWuQPnmZv1G6cSpyPdghIKC
	 Jzj8IaGgSYKD1wnA1JWW0BWpipG26FEBngVu7gBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA20F800D1;
	Mon,  7 Mar 2022 09:36:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E704F8013F; Mon,  7 Mar 2022 09:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3683F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 09:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3683F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kSq5RBX4"
Received: by mail-pl1-x633.google.com with SMTP id t19so9571148plr.5
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 00:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=mNiCQomHe3AZpULgmNuzd/nevg4o0tLCGfPqsWacIDg=;
 b=kSq5RBX4GqueV2igKVHKCILxMbbWs7+3aAu+Vpq8k2nZErehVPHkMl7W3dmW4MpcGR
 kuA1JEdVxm1mqyxpKKZ/Z0PNvZ+h/nW5QLJUpuF9sepwi6TYVFwhMLi4cci1AmUk5NB8
 Ccu7E/UsHX7FYUx3/dr6/1w+f23vtFBZgC7u6PjZp40j2Lq6QD/r5C/gRndmIDtTrC0g
 Ds+LAeufJHywwhIgNDp2br/5ML3rm7unqaqsGu4hAWXe6c9ONh34KMKvrwyTTnx0Qr9b
 b3+7ekRl3eLkdnKqx/qU4XM8WlYTM0ju1/wX6FJHm7lgt/1tHSnskXKyQSfXUgmL2lol
 rPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mNiCQomHe3AZpULgmNuzd/nevg4o0tLCGfPqsWacIDg=;
 b=p9m4QPqGotuSYb2DzQwsYwqS9EWO7Gn3Ohrszaeqlm2I3f1R8RDqKe2pJzFECD61ia
 QVcWy+JG3+Wi0WVrzZKQQW9UOuuyYkTFXYuWi2oscegM99HFPdDcwbR4Ad6mJ3Nd4enU
 oVZSkLkYqU6AfjaN6DYz25BAW6AZ958Y/HBq9iiTrXJh2zN8bPXRplLim8ASC7kD2m5b
 Wpb/b6n+lTaOqWJd3bCZ7LKFFUJMRTCdSSGcpZ0b3oLFYFQGFo+8fe6GOvbj9zA+og7w
 zAiHFlM7mNsdtJ2PNTZdc5hib9g1EnzP4xJfdy7CPGw9uhR3wut95xIuDSfIu1KU8Ayp
 XCFA==
X-Gm-Message-State: AOAM532Euv3W11csgTA+GklFaXjkg3TaNT5VKAr14MeNuI9UoekOcQ0C
 ZDdQbOYZwWqRPzAHecOtwPA=
X-Google-Smtp-Source: ABdhPJxOvB200XwC3KbSEeD9yNj4/yZaDfwprj85CYxXE7HWOzQrXXTiuZQc9KJCbRN0m7Ef8wgh/A==
X-Received: by 2002:a17:902:bb8f:b0:151:c488:cd24 with SMTP id
 m15-20020a170902bb8f00b00151c488cd24mr10673839pls.118.1646642158364; 
 Mon, 07 Mar 2022 00:35:58 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 o65-20020a17090a0a4700b001bef5cffea7sm14562495pjo.0.2022.03.07.00.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:35:58 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Jianqun <jay.xu@rock-chips.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: i2s: Fix missing clk_disable_unprepare() in
 rockchip_i2s_probe
Date: Mon,  7 Mar 2022 08:35:52 +0000
Message-Id: <20220307083553.26009-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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
from rockchip_i2s_probe() in the error handling case.

Fixes: 01605ad12875 ("ASoC: rockchip-i2s: enable "hclk" for rockchip I2S controller")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index a6d7656c206e..4ce5d2579387 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -716,19 +716,23 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	i2s->mclk = devm_clk_get(&pdev->dev, "i2s_clk");
 	if (IS_ERR(i2s->mclk)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s master clock\n");
-		return PTR_ERR(i2s->mclk);
+		ret = PTR_ERR(i2s->mclk);
+		goto err_clk;
 	}
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(regs))
-		return PTR_ERR(regs);
+	if (IS_ERR(regs)) {
+		ret = PTR_ERR(regs);
+		goto err_clk;
+	}
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &rockchip_i2s_regmap_config);
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev,
 			"Failed to initialise managed register map\n");
-		return PTR_ERR(i2s->regmap);
+		ret = PTR_ERR(i2s->regmap);
+		goto err_clk;
 	}
 
 	i2s->bclk_ratio = 64;
@@ -768,7 +772,8 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 		i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-
+err_clk:
+	clk_disable_unprepare(i2s->hclk);
 	return ret;
 }
 
-- 
2.17.1

