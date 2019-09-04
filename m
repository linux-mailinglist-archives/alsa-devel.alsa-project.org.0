Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF9A7D14
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 09:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5037168D;
	Wed,  4 Sep 2019 09:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5037168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567583614;
	bh=dP0YX6LhLpC7FpsBhGxOnwx9PNZzQ94ALE8Zupkcki8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L9Aie4cWVHueIe2rrmdJYOWI0J3iM5Gshw80UZY46byVgJ1l/q2Dpiboyx+ckJd71
	 0i9g+dXziOlVi5BcuJAAReEWBmFjIjtjv4yqY77OxNuSrxLHgKdqlD8sZ+hrDPbOmf
	 NPgCpzDUz48cKKQXyosueHSm4SdHG3zkgaS1XS4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68891F803D6;
	Wed,  4 Sep 2019 09:51:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E4E1F8011E; Wed,  4 Sep 2019 09:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A73CF8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 09:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A73CF8011E
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D9DDC2BFE7CBBDF45D4D;
 Wed,  4 Sep 2019 15:51:37 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 15:51:29 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <akshu.agrawal@amd.com>, <yuzhao@google.com>,
 <yuehaibing@huawei.com>, <tglx@linutronix.de>
Date: Wed, 4 Sep 2019 15:48:33 +0800
Message-ID: <20190904074833.23572-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: amd: use
	devm_platform_ioremap_resource() to simplify code
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

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/amd/acp-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index d26653f..52225b4 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1251,8 +1251,7 @@ static int acp_audio_probe(struct platform_device *pdev)
 	if (!audio_drv_data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	audio_drv_data->acp_mmio = devm_ioremap_resource(&pdev->dev, res);
+	audio_drv_data->acp_mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(audio_drv_data->acp_mmio))
 		return PTR_ERR(audio_drv_data->acp_mmio);
 
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
