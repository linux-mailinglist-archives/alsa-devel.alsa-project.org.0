Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9D3A81C5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 16:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C8D1693;
	Tue, 15 Jun 2021 16:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C8D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623765915;
	bh=lO1uIyDf5iTnSKIvzeQEbEJm14qeX3hx0GkNxwFCEIA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKpI/S33BVUZxgYmnaaSV9xfLrV7i2F3Y/z3ofPSP9BEzHCQRLRTFR7wC0PfEq1Bw
	 kQguhaZeQEFbUfC1tENm1MOGpoXtFB5dDY9CNdkoMFeTJ7S5v+iKIIqGEXsdGqzw7m
	 J4XNEYcpUVu3IUXHSBfbnatqqhjZVLN0VXCpjuwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972B7F8016C;
	Tue, 15 Jun 2021 16:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64009F8049E; Tue, 15 Jun 2021 16:03:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6961F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 16:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6961F80113
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G48zc5bpZz1BMWN;
 Tue, 15 Jun 2021 21:58:20 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 22:03:20 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 15 Jun
 2021 22:03:20 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next 1/2] ASoC: qcom: apq8016_sbc: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 15 Jun 2021 22:07:10 +0800
Message-ID: <20210615140711.1676704-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Cc: broonie@kernel.org, lgirdwood@gmail.com
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

Use devm_platform_get_and_ioremap_resource() to simplify
code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/qcom/apq8016_sbc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 270986b2f102..08a05f0ecad7 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -134,7 +134,6 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	struct apq8016_sbc_data *data;
-	struct resource *res;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -151,13 +150,11 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mic-iomux");
-	data->mic_iomux = devm_ioremap_resource(dev, res);
+	data->mic_iomux = devm_platform_ioremap_resource_byname(pdev, "mic-iomux");
 	if (IS_ERR(data->mic_iomux))
 		return PTR_ERR(data->mic_iomux);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "spkr-iomux");
-	data->spkr_iomux = devm_ioremap_resource(dev, res);
+	data->spkr_iomux = devm_platform_ioremap_resource_byname(pdev, "spkr-iomux");
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
-- 
2.25.1

