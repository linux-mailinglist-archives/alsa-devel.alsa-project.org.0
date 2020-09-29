Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685928005F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:44:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E5317DB;
	Thu,  1 Oct 2020 15:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E5317DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601559873;
	bh=RijWQc1HSliR73j+qwbECOiWLO6guYMdkLOKiosWK8g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e0LplvXZvvKXaQRSc0GJ0pwpt18V1I3iGK4T98y5Zlf+0DZzOzmhE8hUPujkpKyVP
	 LnBh5l6n0GJMrhHnPcsW9swff46ZLxFNFU0+aHAqNuJrtnR25+Ldz8Bb5dqj0RD+JR
	 DmjnzxSvmFfBP3trgpVeJRl0JY9p0u2o3777Iku8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 966AEF802F9;
	Thu,  1 Oct 2020 15:40:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D846F802BD; Tue, 29 Sep 2020 13:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3716F801DB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 13:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3716F801DB
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AA783C771E4471C79FAD;
 Tue, 29 Sep 2020 19:29:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 29 Sep 2020 19:29:35 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH -next] ASoC: soc-core: use devm_snd_soc_register_card()
Date: Tue, 29 Sep 2020 19:29:33 +0800
Message-ID: <20200929112933.46977-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:08 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Qinglang
 Miao <miaoqinglang@huawei.com>
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

Using devm_snd_soc_register_card() can make the code
shorter and cleaner.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 sound/soc/soc-core.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 74df22486..ea3986a46 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1994,16 +1994,7 @@ static int soc_probe(struct platform_device *pdev)
 	/* Bodge while we unpick instantiation */
 	card->dev = &pdev->dev;
 
-	return snd_soc_register_card(card);
-}
-
-/* removes a socdev */
-static int soc_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-	return 0;
+	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 int snd_soc_poweroff(struct device *dev)
@@ -2047,7 +2038,6 @@ static struct platform_driver soc_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe		= soc_probe,
-	.remove		= soc_remove,
 };
 
 /**
-- 
2.23.0

