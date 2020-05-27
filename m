Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C61E3601
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 04:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72511797;
	Wed, 27 May 2020 04:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72511797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590548374;
	bh=Eo1Vhox/TaiTUeUv5D0A/lsDgNHNUlSajajzW6ATUI8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tc5WhQ7G7hsNLtNRcQVlnJ7YG8JFGr+OV8bBcipEYEywUwwSTooggdTqH2k14tKHY
	 yIOjEChuvAr97XdN+GkwaL3tg3YmJgpaxou/rM7STvVlq4wqy3lpfFTOkggZUNQ7Dv
	 oiTLbdCGF58X0G79YgGY25ARjGezPpxArYUBiVOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBBD0F8016F;
	Wed, 27 May 2020 04:57:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14601F8014E; Wed, 27 May 2020 04:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C60F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 04:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C60F800FF
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6ABE37498ABE6535058E;
 Wed, 27 May 2020 10:57:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 27 May 2020 10:57:25 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH -next] ASoC: mmp-sspa: Fix return value check in
 asoc_mmp_sspa_probe()
Date: Wed, 27 May 2020 03:02:10 +0000
Message-ID: <20200527030210.124393-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/pxa/mmp-sspa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 3e37ab625f8d..4255851c71c1 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -493,13 +493,13 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 			return -ENODEV;
 
 		sspa->rx_base = devm_ioremap(&pdev->dev, res->start, 0x30);
-		if (IS_ERR(sspa->rx_base))
-			return PTR_ERR(sspa->rx_base);
+		if (!sspa->rx_base)
+			return -ENOMEM;
 
 		sspa->tx_base = devm_ioremap(&pdev->dev,
 					     res->start + 0x80, 0x30);
-		if (IS_ERR(sspa->tx_base))
-			return PTR_ERR(sspa->tx_base);
+		if (!sspa->tx_base)
+			return -ENOMEM;
 
 		sspa->clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(sspa->clk))





