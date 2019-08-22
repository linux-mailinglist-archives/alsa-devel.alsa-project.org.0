Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C654C98BAD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 08:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8841664;
	Thu, 22 Aug 2019 08:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8841664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566456668;
	bh=YwVIGrTDnEpMGFQzQ7v5Maz5X3XZsnDuvjqGAwj8eCg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WZzE1Q98MGrYuzfR9NNpC6DSxHvqc3cn9AwjgQiZpkQDXP8Aa+cVFGnxWc9PiK0Nz
	 hSasMEbVU1b/AgyrYyFiVFVLg04X+w3Db2+zb0CBpnY9BYQ6fEm7aCDJlmXSsMqMXU
	 a6WsUuptRngjnSDHfBhOToKIvycO2GDfh6KFvSeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8FF3F80391;
	Thu, 22 Aug 2019 08:49:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 458F2F8036E; Thu, 22 Aug 2019 08:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C3F1F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 08:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3F1F80112
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 67FFFAA4886793855108;
 Thu, 22 Aug 2019 14:49:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 22 Aug 2019 14:49:03 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Maxime
 Ripard" <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Marcus Cooper
 <codekipper@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 22 Aug 2019 06:52:52 +0000
Message-ID: <20190822065252.74028-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH -next] ASoC: sun4i-i2s: Use PTR_ERR_OR_ZERO in
	sun4i_i2s_init_regmap_fields()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9e691baee1e8..2071c54265f3 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1095,10 +1095,7 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 	i2s->field_fmt_sr =
 			devm_regmap_field_alloc(dev, i2s->regmap,
 						i2s->variant->field_fmt_sr);
-	if (IS_ERR(i2s->field_fmt_sr))
-		return PTR_ERR(i2s->field_fmt_sr);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(i2s->field_fmt_sr);
 }
 
 static int sun4i_i2s_probe(struct platform_device *pdev)





_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
