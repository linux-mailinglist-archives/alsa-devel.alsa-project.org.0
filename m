Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0717350F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 11:13:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E66B16D4;
	Fri, 28 Feb 2020 11:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E66B16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582884792;
	bh=YxDv3WSc7Imf/ByZD8WtuoImtT3sOCl0PGqj26JF8X8=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bCMK8a823Kh6r8tlaLO6B+HPMpJrbjPfqFIVKPs+P5mr02WWi1BnWrJXrf2IdTnNi
	 v7kTRfaGSU8bSC6za3eClthmbNrdpw8hLPPgUi7ZitjBCl4RuyzsH5X5WDUUaqpWTg
	 luVHm9Y4DoV40KPrgDeG0fOipCYC1HECVmstklRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5658F80086;
	Fri, 28 Feb 2020 11:11:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FBF9F8014E; Fri, 28 Feb 2020 11:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F606F80086
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 11:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F606F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="WfbUv6mP"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200228101125euoutp02a3e8cea51e952896d9a8b9080daae017~3iTwP-6t40629506295euoutp02W
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 10:11:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200228101125euoutp02a3e8cea51e952896d9a8b9080daae017~3iTwP-6t40629506295euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582884685;
 bh=qXgsjsboVQ3KoL/APoH04DnowWVrJC0A074eRmXaqiQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=WfbUv6mPoi4uaWslcY2tZdvlC8DUBDprcoJ4sxFkHAlkYiVI40P0ZI33K5Z5laiCA
 GnGsIJooiYdGCF5zvQu9LHbQfPyRQnV414zBQRbsuWcred3W4uA7Wr4kBeVSGFuJ2Z
 JiM7VzQBIZmtbgr5Z+RdfkGSoQueIO3ofGwr96Po=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200228101124eucas1p2fe0d7377ad010f6bc54d4f112e1655f3~3iTv6V5WU1789217892eucas1p2U;
 Fri, 28 Feb 2020 10:11:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 53.D7.61286.C47E85E5; Fri, 28
 Feb 2020 10:11:24 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a~3iTvqLPaP0825308253eucas1p1Y;
 Fri, 28 Feb 2020 10:11:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200228101124eusmtrp2f7994aa63a62057ccde3df306880a96b~3iTvpiRm83025730257eusmtrp2d;
 Fri, 28 Feb 2020 10:11:24 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-c7-5e58e74c576a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.D4.08375.C47E85E5; Fri, 28
 Feb 2020 10:11:24 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200228101123eusmtip1b6759ec8e7496638f32ccc847b4a6c6d~3iTvM-CFS3187831878eusmtip1D;
 Fri, 28 Feb 2020 10:11:23 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Date: Fri, 28 Feb 2020 11:11:20 +0100
Message-Id: <20200228101120.28819-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djPc7o+zyPiDG5/0LS4cvEQk8XUh0/Y
 LM6f38BuMeP8PiaLtUfuslscftPOanFxxRcmB3aPDZ+b2Dw2repk8+jbsorR4/MmuQCWKC6b
 lNSczLLUIn27BK6MVYv/MBdM0K3oeXaNrYHxu2oXIyeHhICJxLMTB1i6GLk4hARWMEr8vtHG
 BpIQEvjCKNF2TwYi8ZlRYm7XUXaYjtltb1khEssZJQ6/vscM13FiegCIzSZgKNH1tgtskoiA
 k8TMOe/ZQBqYBc4wSlz8183UxcjBISzgKdE9wQGkhkVAVWJHF0iYk4NXwFbi1fP3zBDL5CVW
 bzjADNIrIXCZTWLzxw9QV7hI3JpygAnCFpZ4dXwLVFxG4v/O+UwQDc2MEg/PrWWHcHoYJS43
 zWCEqLKWuHPuFxvIFcwCmhLrd+mDmBICjhJv78VDmHwSN94KghQzA5mTtk1nhgjzSnS0CUHM
 UJOYdXwd3NaDFy5BlXhIzNwkDAmRWIl1l54wTmCUm4WwaQEj4ypG8dTS4tz01GLDvNRyveLE
 3OLSvHS95PzcTYzA6D/97/inHYxfLyUdYhTgYFTi4V2wIzxOiDWxrLgy9xCjBAezkgjvxq+h
 cUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUwRjCz153X
 jD/mtuHtMZH21YurLzqLsjrc+3Zuy+/95X+iZ32Otd99Zc4yyTlin5cWHE05pDmva6Ws+7PM
 9xy5OgrG259cZIwWZje6fmynJY+d9u4amb3p8+1Yla8+sXm9MWRaoff7diYZmyPVgbumL2X3
 era/mGXR7q+su2eJL/08m20eV4rvXSWW4oxEQy3mouJEAM86DGb6AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xu7o+zyPiDHZMkrC4cvEQk8XUh0/Y
 LM6f38BuMeP8PiaLtUfuslscftPOanFxxRcmB3aPDZ+b2Dw2repk8+jbsorR4/MmuQCWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MVYv/MBdM
 0K3oeXaNrYHxu2oXIyeHhICJxOy2t6xdjFwcQgJLGSVaZ29jgkjISJyc1sAKYQtL/LnWxQZR
 9IlR4tPFL2wgCTYBQ4mut11gtoiAi8SXzj3MIEXMAhcYJZZe2c3excjBISzgKdE9wQGkhkVA
 VWJHVzfYAl4BW4lXz98zQyyQl1i94QDzBEaeBYwMqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3
 MQJDb9uxn5t3MF7aGHyIUYCDUYmHd8GO8Dgh1sSy4srcQ4wSHMxKIrwbv4bGCfGmJFZWpRbl
 xxeV5qQWH2I0BVo+kVlKNDkfGBd5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtS
 i2D6mDg4pRoY9QLOzPbaaOF4/Kb5TO8bW4v31ek8Lyp+kVsl2VD0euPmu4y+TmtShJMWvc/W
 fZ/YuXLRjr7/itrTT7Ptrdcp/C8Q3vk5Y+viSo34Q91726bMXnzu0gnOfd9fXvS33K5jYdDG
 ZtX62HxSofip1TXeBzerTz3gKsf57on+9qhfcRcObOhct3z2DSWW4oxEQy3mouJEAEXAMLJT
 AgAA
X-CMS-MailID: 20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

Don't confuse user with meaningless warning about the failure in getting
resources and registering card in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/arndale.c        | 4 +++-
 sound/soc/samsung/littlemill.c     | 2 +-
 sound/soc/samsung/lowland.c        | 2 +-
 sound/soc/samsung/odroid.c         | 4 +++-
 sound/soc/samsung/smdk_wm8994.c    | 2 +-
 sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
 sound/soc/samsung/snow.c           | 4 +++-
 sound/soc/samsung/speyside.c       | 2 +-
 sound/soc/samsung/tm2_wm5110.c     | 3 ++-
 sound/soc/samsung/tobermory.c      | 2 +-
 10 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index d64602950cbd..6e6d67d6e0ab 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -174,7 +174,9 @@ static int arndale_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card() failed: %d\n", ret);
 		goto err_put_of_nodes;
 	}
 	return 0;
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 59904f44118b..2f2f83a8c23a 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -325,7 +325,7 @@ static int littlemill_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 098eefc764db..fcc7897ee7d0 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -183,7 +183,7 @@ static int lowland_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index f0f5fa9c27d3..30c7e1bc2a30 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -311,7 +311,9 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-		dev_err(dev, "snd_soc_register_card() failed: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "snd_soc_register_card() failed: %d\n",
+				ret);
 		goto err_put_clk_i2s;
 	}
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 28f8be000aa1..8fa5f6b387ad 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -178,7 +178,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
 
 	return ret;
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index 2e3dc7320c62..6e44f7927852 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -118,7 +118,7 @@ static int snd_smdk_probe(struct platform_device *pdev)
 
 	smdk_pcm.dev = &pdev->dev;
 	ret = devm_snd_soc_register_card(&pdev->dev, &smdk_pcm);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card failed %d\n", ret);
 
 	return ret;
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index f075aae9561a..bebcf0a4d608 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -216,7 +216,9 @@ static int snow_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card failed (%d)\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index ea0d1ec67f01..8f175f204eb7 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -330,7 +330,7 @@ static int speyside_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 10ff14b856f2..043a287728b3 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -611,7 +611,8 @@ static int tm2_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-		dev_err(dev, "Failed to register card: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to register card: %d\n", ret);
 		goto dai_node_put;
 	}
 
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index fdce28cc26c4..1aa3fdb4b152 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -229,7 +229,7 @@ static int tobermory_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
 
-- 
2.17.1

