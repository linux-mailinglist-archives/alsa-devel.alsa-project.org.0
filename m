Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36853C346A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1331167B;
	Tue,  1 Oct 2019 14:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1331167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569933512;
	bh=xUf2E2Zg7MtLgd55pcjlUbecG9yx7lXeSgmM4wDdPcU=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aN4Yxl4XU5ZQjbxWnL+P3/VvwjFYbXLRBtuL8EQjdaOzYNEwatD0Uf91SVSOBit7U
	 kY1vx7zBfl3xauviVeZ9DOan+7+LXKvk/Y/iLDVf1YlWyQIGcAFO+s9Xy2UYLVVJ5t
	 3HbQIQqxlm5Me5+d9S1rtAIXwUh34xALOujDiVF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E473AF8053A;
	Tue,  1 Oct 2019 14:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEABF80519; Tue,  1 Oct 2019 14:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4A6BF800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 14:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A6BF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ckSan4VK"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191001123637euoutp017e35793321459e11adf5c45bbd1a68ef~JhhuErhn71111811118euoutp01S
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191001123637euoutp017e35793321459e11adf5c45bbd1a68ef~JhhuErhn71111811118euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569933397;
 bh=2CZIhLH33tEifh3ALDvkkJLDMm/NCNj9OqRYGF4YRHk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ckSan4VK7cEsHAvZuvv36CifaRibVleBDm0C3HRMPlZv00wCdmxZNb1E+6ZpolXSv
 7nyC2fKOHOwUXN9Ugx+TmwzTmLR3F+skJ0GH214zzNSuGMH5TvsmfALu8ALrOkI96E
 w6GNEKKd8eLCGr0Js4jo+2TfrYVFgLiRN9mDpmoE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191001123637eucas1p1a5a031dcebe72e27a5623cf58ee42ea4~Jhhtzy6gb1358913589eucas1p1C;
 Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 28.19.04309.558439D5; Tue,  1
 Oct 2019 13:36:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5~JhhtfxpQU2028820288eucas1p27;
 Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191001123637eusmtrp144f2a02a099c64eb7f5304a4055ad78f~JhhtfBv3U0398103981eusmtrp1h;
 Tue,  1 Oct 2019 12:36:37 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-06-5d9348554c06
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.33.04117.558439D5; Tue,  1
 Oct 2019 13:36:37 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191001123636eusmtip2b2bcedc6b7a6d9d900c1886ae301bccc~Jhhs5dkDU0870908709eusmtip2d;
 Tue,  1 Oct 2019 12:36:36 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Tue,  1 Oct 2019 14:36:23 +0200
Message-Id: <20191001123625.19370-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTcRTudx+71+HiOhV/rbIaSQ/IF2UXtNAQvD3+kCDKZOktLyq5abs+
 siDNWJmPtZSaicEITZmYOkVSydl8LDK5CfOFiJUSJJngRPKR5na1/vvO953vfIfDIVF5Ga4g
 UzWZnFbDpiklUqytf1k4dokpVwV/+n6AdgzZELq5ohGnn32dkdAOnQXQgtBE0EuOQoS2TI/g
 dIXQhdANvZME7Zy34nTPz0c4PVS3iER6Mk3OAgnTXjlJMBbzYwnTUp3HGKs2AKNvNQPGafGP
 Ja5KI5K4tNRsTht0OlGa0qFrITJ0vrcHBwUsH4x4FQEPElLH4ZihBC8CUlJO1QHYZ23dKhYB
 FOx6VCycAOpWOiXbFuNoMyIKtQDWLy+Bf5aBj+uoq0tChcDSPj1wYR/qEJyqKHDPRal2BH4b
 nsJcgjcVBy0fTJujSBKjAmD+E7dXRoXDggk7ENP2wfqmbvcakCom4MK7WUIUomGN/hcuYm84
 a2/d4vfAgfISTDQ8ALCkc4IQCwOAU3bT1thw2GMfwl3JKHUENnYEiXQU7Kl+j7poSO2EY3Pu
 K6GbsKzNuEXLYOFDudh9EK6ajYiIFbB4ZgMTMQOnC7vc15JTKtg72okYgH/l/ywTAGbgx2Xx
 6mSOD9VwOYE8q+azNMmBN9LVFrD5KQPr9sW3oGPtug1QJFB6ygw/nqrkOJvN56ptAJKo0kcW
 sVamksuS2Nw7nDY9QZuVxvE2sJvElH6yuzu+xMupZDaTu8lxGZx2W0VID0U+2D/PelQ6VgXm
 d2P8m7AY2wnTRM3zFLz9yquVbgTBNmw56tUz45qSvMtz1wRFWHn+Z8VF75jw3HMJoQHRp4jE
 w82l49HKqKI5r07rvCPyfN9rhfcf68AF8GLBEB83/vL+yaTgW6aq4fUutnbXvZU2c46vc0f6
 3tizDWT/5t7tSoxPYUOOolqe/QvfcePkJQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsVy+t/xe7qhHpNjDW7O4rC4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
 wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsU
 bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexq3Uze0GraMXZs+dZGhivCXYx
 cnJICJhITL++kQnEFhJYyijx/XBBFyMHUFxKYn6LEkSJsMSfa11sXYxcQCWfGCUWvtjCDJJg
 EzCU6D3axwhiiwhoSnTMu80KUsQscJhJYnHHQRaQhLBAuMTNhxOZQIayCKhKNPSD9fIKWEs0
 3T7OCLFAXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgM4m3Hfm7Zwdj1
 LvgQowAHoxIPr8XzibFCrIllxZW5hxglOJiVRHht/kyKFeJNSaysSi3Kjy8qzUktPsRoCrR7
 IrOUaHI+MMLySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwcr7S
 DHqiE7VtuWcq25sN79b8yFyXqnh774ZFAs5t6d0detbROaGLFprdkp/jyDRR0FCs65isbmKr
 ZvqLC/7ssXd0j7kfOl33ZEGB3byCa/Ovmp+qjrXx2S7PdnD1akHGk0GmdzXuec3lYnvm+EF8
 bV3AlldZB8/f/vfq5lz1FcuVZVndHqi8U2Ipzkg01GIuKk4EANvBA+t4AgAA
X-CMS-MailID: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
X-Msg-Generator: CA
X-RootMTR: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
References: <CGME20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5@eucas1p2.samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v3 RESEND 1/3] ASoC: samsung: arndale: Simplify
 DAI link initialization
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is only one DAI link so we can drop an unnecessary loop statement.
Use card->dai_link in place of direct static arndale_rt5631_dai[] array
dereference as a prerequisite for adding support for other CODECs.
Unnecessary assignment of dai_link->codecs->name to NULL is removed.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - rebased due to reordering patches in the series
---
 sound/soc/samsung/arndale_rt5631.c | 42 +++++++++++++-----------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index fd8c6642fb0d..004c84fafad9 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -88,36 +88,30 @@ static void arndale_put_of_nodes(struct snd_soc_card *card)
 
 static int arndale_audio_probe(struct platform_device *pdev)
 {
-	int n, ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
 
 	card->dev = &pdev->dev;
+	dai_link = card->dai_link;
+
+	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
+	if (!dai_link->cpus->of_node) {
+		dev_err(&pdev->dev,
+			"Property 'samsung,audio-cpu' missing or invalid\n");
+		return -EINVAL;
+	}
 
-	for (n = 0; np && n < ARRAY_SIZE(arndale_rt5631_dai); n++) {
-		if (!arndale_rt5631_dai[n].cpus->dai_name) {
-			arndale_rt5631_dai[n].cpus->of_node = of_parse_phandle(np,
-					"samsung,audio-cpu", n);
-
-			if (!arndale_rt5631_dai[n].cpus->of_node) {
-				dev_err(&pdev->dev,
-				"Property 'samsung,audio-cpu' missing or invalid\n");
-				return -EINVAL;
-			}
-		}
-		if (!arndale_rt5631_dai[n].platforms->name)
-			arndale_rt5631_dai[n].platforms->of_node =
-					arndale_rt5631_dai[n].cpus->of_node;
-
-		arndale_rt5631_dai[n].codecs->name = NULL;
-		arndale_rt5631_dai[n].codecs->of_node = of_parse_phandle(np,
-					"samsung,audio-codec", n);
-		if (!arndale_rt5631_dai[0].codecs->of_node) {
-			dev_err(&pdev->dev,
+	if (!dai_link->platforms->name)
+		dai_link->platforms->of_node = dai_link->cpus->of_node;
+
+	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
+	if (!dai_link->codecs->of_node) {
+		dev_err(&pdev->dev,
 			"Property 'samsung,audio-codec' missing or invalid\n");
-			ret = -EINVAL;
-			goto err_put_of_nodes;
-		}
+		ret = -EINVAL;
+		goto err_put_of_nodes;
 	}
 
 	ret = devm_snd_soc_register_card(card->dev, card);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
