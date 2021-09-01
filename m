Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B553FDE65
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 17:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052A816F3;
	Wed,  1 Sep 2021 17:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052A816F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630509432;
	bh=+tO90eQQwo1cmhaOc2QXVEmk0yfaqCmshGiUHfGljvg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pIGIdr5QXDwpGrZb7pYmmiUrmkWsrZfabPEkrMWTH/vDDmCIHmpJ16SNT17TKoUG+
	 DQKqDLmZB0swlzQEC8bwzrIKSHfO7VBp5WMIzsh/Fv7eig5Nda4y7FxgIzFOX+mVPZ
	 BP+p7uUU96WO8TW8kBfPsEkvC1lmGzNhxvAw/2qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 237BEF8051B;
	Wed,  1 Sep 2021 17:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 070C6F80254; Wed,  1 Sep 2021 15:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by alsa1.perex.cz (Postfix) with ESMTP id 2FB3CF80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 15:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FB3CF80171
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
 by Forcepoint Email with ESMTPS id F20DEC87C20556AC1684;
 Wed,  1 Sep 2021 21:27:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 21:27:48 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 21:27:48 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Subject: [PATCH] ASoC: mediatek: mt8195: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 1 Sep 2021 21:27:41 +0800
Message-ID: <20210901132742.31714-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex21.internal.baidu.com (172.31.51.15) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Wed, 01 Sep 2021 17:12:34 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 6635c3f72ecc..8c697f41d51d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3057,7 +3057,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8195_afe_private *afe_priv;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	int i, irq_id, ret;
 	struct snd_soc_component *component;
@@ -3078,8 +3077,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-- 
2.25.1

