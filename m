Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA991B9F84
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 11:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6041666;
	Mon, 27 Apr 2020 11:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6041666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587978909;
	bh=6KcLPfmjYBNKk/TzO2Wv8x2+T1FQFo5y5pG3iHjqK5E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qs+SgaI4lRp/lg/eGfn3/+2GcA9skJRQTIG8wkJ/2gjOpWxpflwo3QH+283Lnxwb7
	 1wrYWug+KyuWcpK3fKtPKvsKFMp+vyziqj04JIPB6KOghwh4U69jPxix0+ldubLZDU
	 TsnMXedbkjKta8AbBNA5y115xKlMswvd6diatqzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E990DF80112;
	Mon, 27 Apr 2020 11:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04C9F8022B; Mon, 27 Apr 2020 11:13:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 15689F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 11:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15689F80112
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5ea6a1bab6b-78e8b;
 Mon, 27 Apr 2020 17:11:22 +0800 (CST)
X-RM-TRANSID: 2eec5ea6a1bab6b-78e8b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5ea6a1b738b-77aae;
 Mon, 27 Apr 2020 17:11:22 +0800 (CST)
X-RM-TRANSID: 2eea5ea6a1b738b-77aae
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: hisilicon: Use IS_ERR() instead of IS_ERR_OR_NULL()
Date: Mon, 27 Apr 2020 17:11:45 +0800
Message-Id: <20200427091145.4268-1-tangbin@cmss.chinamobile.com>
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

In the function hi6210_i2s_probe(), devm_clk_get() doesn't return NULL.
Thus use IS_ERR() to validate the return value instead of IS_ERR_OR_NULL().

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index ab3b76d29..f14ce0253 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -570,12 +570,12 @@ static int hi6210_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->sysctrl);
 
 	i2s->clk[CLK_DACODEC] = devm_clk_get(&pdev->dev, "dacodec");
-	if (IS_ERR_OR_NULL(i2s->clk[CLK_DACODEC]))
+	if (IS_ERR(i2s->clk[CLK_DACODEC]))
 		return PTR_ERR(i2s->clk[CLK_DACODEC]);
 	i2s->clocks++;
 
 	i2s->clk[CLK_I2S_BASE] = devm_clk_get(&pdev->dev, "i2s-base");
-	if (IS_ERR_OR_NULL(i2s->clk[CLK_I2S_BASE]))
+	if (IS_ERR(i2s->clk[CLK_I2S_BASE]))
 		return PTR_ERR(i2s->clk[CLK_I2S_BASE]);
 	i2s->clocks++;
 
-- 
2.20.1.windows.1



