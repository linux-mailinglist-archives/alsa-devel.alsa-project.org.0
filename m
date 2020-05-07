Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B641C85F3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 11:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6374417FA;
	Thu,  7 May 2020 11:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6374417FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588844495;
	bh=tuowZEpd0sjnoJSOEuWgwBBbvyRg7Zedl5Heq66lCps=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kgz95zkg4DHPB4LusKbsqribk9whcCc6tIotHokjQUE5J7nGaD0Xe3+ghSWt5O9Lu
	 Q6UWCiLhJw11lX063S2eZFsXzgPT03+s//xLLPC4qtQVhuXWBDexEKB/RsDSl1lvnB
	 u47R8qGJ9VY7RyKVdFvQQgqhp7rYlp3B9b3USUJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DADFF80162;
	Thu,  7 May 2020 11:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C498F8015F; Thu,  7 May 2020 11:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B516CF800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 11:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B516CF800AD
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 489F142A0A6C250BACBC;
 Thu,  7 May 2020 17:39:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 17:39:32 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
Subject: [PATCH -next] ASoC: rt5677: Use devm_snd_soc_register_component()
Date: Thu, 7 May 2020 09:43:35 +0000
Message-ID: <20200507094335.14302-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org
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

Using devm_snd_soc_register_component() can make the code
shorter and cleaner.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/codecs/rt5677-spi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 3f40d2751833..7bfade8b3d6e 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -605,20 +605,15 @@ static int rt5677_spi_probe(struct spi_device *spi)
 
 	g_spi = spi;
 
-	ret = snd_soc_register_component(&spi->dev, &rt5677_spi_dai_component,
-					 &rt5677_spi_dai, 1);
+	ret = devm_snd_soc_register_component(&spi->dev,
+					      &rt5677_spi_dai_component,
+					      &rt5677_spi_dai, 1);
 	if (ret < 0)
 		dev_err(&spi->dev, "Failed to register component.\n");
 
 	return ret;
 }
 
-static int rt5677_spi_remove(struct spi_device *spi)
-{
-	snd_soc_unregister_component(&spi->dev);
-	return 0;
-}
-
 static const struct acpi_device_id rt5677_spi_acpi_id[] = {
 	{ "RT5677AA", 0 },
 	{ }
@@ -631,7 +626,6 @@ static struct spi_driver rt5677_spi_driver = {
 		.acpi_match_table = ACPI_PTR(rt5677_spi_acpi_id),
 	},
 	.probe = rt5677_spi_probe,
-	.remove = rt5677_spi_remove,
 };
 module_spi_driver(rt5677_spi_driver);
 





