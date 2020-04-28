Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD71BBBF6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 13:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47807169C;
	Tue, 28 Apr 2020 13:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47807169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588072110;
	bh=MSibdpd57RqcYTDb7TbBxUsQMHL1Nz3HX0bvdBPnRIE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FZ/CbUtowuA6TUc2Cca53h7mZuAvohdeY12yBeaDJDOqLkrfMCLvH+43Q8LfVwkv/
	 1BkS7YIADFxNFH3SW8SuqUoFZipTtROnBYh4HKshWvuVFQT70i3JSN8oxV6hqcErYN
	 90t6EuNF2qrWEYPzLlJaT+PsfEElnSXpJdgJsAkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D8BAF801DB;
	Tue, 28 Apr 2020 13:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 485DCF801DB; Tue, 28 Apr 2020 13:06:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5FF6F8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 13:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5FF6F8010A
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 17C49FA5ABDC1D5E94A3;
 Tue, 28 Apr 2020 19:06:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 19:06:26 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH -next] ASoC: tegra: tegra_wm8903: Use
 devm_snd_soc_register_card()
Date: Tue, 28 Apr 2020 11:07:42 +0000
Message-ID: <20200428110742.110335-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>
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

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/tegra/tegra_wm8903.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 7bf159965c4d..d3ead0213cef 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -351,9 +351,9 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+		dev_err(&pdev->dev, "devm_snd_soc_register_card failed (%d)\n",
 			ret);
 		return ret;
 	}
@@ -361,15 +361,6 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_wm8903_driver_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	return 0;
-}
-
 static const struct of_device_id tegra_wm8903_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8903", },
 	{},
@@ -382,7 +373,6 @@ static struct platform_driver tegra_wm8903_driver = {
 		.of_match_table = tegra_wm8903_of_match,
 	},
 	.probe = tegra_wm8903_driver_probe,
-	.remove = tegra_wm8903_driver_remove,
 };
 module_platform_driver(tegra_wm8903_driver);



