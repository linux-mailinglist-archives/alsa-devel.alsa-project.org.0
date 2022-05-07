Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9751E37F
	for <lists+alsa-devel@lfdr.de>; Sat,  7 May 2022 04:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7DA16F6;
	Sat,  7 May 2022 04:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7DA16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651889748;
	bh=QKfPKig+kqUGBNElpOABv1DRMUCZ/O9aE/aqH+zkcUY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eKN6jkIFe0FCyzYWRLiA3grfS3ZSDmW8LOg0FAjVRGFBRwlYp/CH3UJP4TUyzhv+7
	 5IBUghTfCCCuJ5JJLflcj1Dt1FHL873KnEBe8mO73thvVjPw3hhI1C2lpQQfLajHI2
	 Yp2nOL4F2+i2xVZDvZfVggo/T7xdRRXuP3eVndqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF60F800D3;
	Sat,  7 May 2022 04:14:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B0BF80155; Sat,  7 May 2022 04:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DD4F80054
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 04:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DD4F80054
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kw9t25f3zzGnxg;
 Sat,  7 May 2022 10:11:54 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 7 May
 2022 10:14:39 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <trevor.wu@mediatek.com>,
 <arnd@arndb.de>
Subject: [PATCH v2 -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
Date: Sat, 7 May 2022 10:14:24 +0800
Message-ID: <20220507021424.12180-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Cc: YueHaibing <yuehaibing@huawei.com>, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
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

sound/soc/mediatek/mt8195/mt8195-mt6359.c:1639:32: warning: ‘mt8195_mt6359_max98390_rt5682_card’ defined but not used [-Wunused-variable]
 1639 | static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card = {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/mediatek/mt8195/mt8195-mt6359.c:1634:32: warning: ‘mt8195_mt6359_rt1011_rt5682_card’ defined but not used [-Wunused-variable]
 1634 | static struct mt8195_card_data mt8195_mt6359_rt1011_rt5682_card = {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/mediatek/mt8195/mt8195-mt6359.c:1629:32: warning: ‘mt8195_mt6359_rt1019_rt5682_card’ defined but not used [-Wunused-variable]
 1629 | static struct mt8195_card_data mt8195_mt6359_rt1019_rt5682_card = {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since all users of this driver do need CONFIG_OF anyway, there is no
need to save a few bytes on kernel builds while CONFIG_OF disabled, so
just remove the #ifdef to fix this warning.

Fixes: 86a6b9c9dfff ("ASoC: mediatek: mt8195: add machine support for max98390 and rt5682")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: remove #ifdef block as Arnd suggested
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index f90675f14d60..54a00b0699b1 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1626,7 +1626,6 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_OF
 static struct mt8195_card_data mt8195_mt6359_rt1019_rt5682_card = {
 	.name = "mt8195_r1019_5682",
 	.quirk = RT1019_SPEAKER_AMP_PRESENT,
@@ -1657,7 +1656,6 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	},
 	{},
 };
-#endif
 
 static const struct dev_pm_ops mt8195_mt6359_pm_ops = {
 	.poweroff = snd_soc_poweroff,
@@ -1667,9 +1665,7 @@ static const struct dev_pm_ops mt8195_mt6359_pm_ops = {
 static struct platform_driver mt8195_mt6359_driver = {
 	.driver = {
 		.name = "mt8195_mt6359",
-#ifdef CONFIG_OF
 		.of_match_table = mt8195_mt6359_dt_match,
-#endif
 		.pm = &mt8195_mt6359_pm_ops,
 	},
 	.probe = mt8195_mt6359_dev_probe,
-- 
2.17.1

