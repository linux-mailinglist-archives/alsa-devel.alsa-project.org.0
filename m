Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDBE211
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 14:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD9E1668;
	Mon, 29 Apr 2019 14:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD9E1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556540233;
	bh=ofC5wsu2U1/QLip3f3qujyO04isMRwawVTFdO23SsmI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gQyueRa8/0Ih3oXR+6ijcIPOQCEJcqj0RPsR6BXs9i0G41BVm3xBohQplshbmtXNU
	 MHsd9QfBBr8rbrv3Nk7dBNCiqgUBAu6NS8iHUOVifV7yRt/6l1bDoN60qOh1AvEWw6
	 MH42p3YBDZkPRo71X1vDwvrCzdteniORP2WxpubI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42830F80CAB;
	Mon, 29 Apr 2019 14:15:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 287ACF80CAB; Mon, 29 Apr 2019 14:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D743F80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 14:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D743F80641
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 671BAF2465F76369B807;
 Mon, 29 Apr 2019 20:15:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Mon, 29 Apr 2019 20:15:10 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang
 <zhang.lyra@gmail.com>
Date: Mon, 29 Apr 2019 12:25:12 +0000
Message-ID: <20190429122512.59242-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: sprd: Fix return value check in
	sprd_mcdt_probe()
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

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: d7bff893e04f ("ASoC: sprd: Add Spreadtrum multi-channel data transfer support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/sprd/sprd-mcdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index 28f5e649733d..e9318d7a4810 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -951,8 +951,8 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mcdt->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!mcdt->base)
-		return -ENOMEM;
+	if (IS_ERR(mcdt->base))
+		return PTR_ERR(mcdt->base);
 
 	mcdt->dev = &pdev->dev;
 	spin_lock_init(&mcdt->lock);



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
