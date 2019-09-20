Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41CB9059
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E823C166A;
	Fri, 20 Sep 2019 15:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E823C166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984879;
	bh=xUf2E2Zg7MtLgd55pcjlUbecG9yx7lXeSgmM4wDdPcU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IuNiNjxnLzSTgzfI9ai0zD1wktbP/qHcvZFvrZQ6N2D934nCSSs8R/4CJM/EV789f
	 uSLrIeKtO69UyDTCkU+4NT2IFalt5oJRw4zPehYn0/IwDE1mJsoCWoUAdYlebXmOk5
	 SS43FIgwZnOp9GlEAcw+azaELuitCrdgG3haENIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20E43F8063C;
	Fri, 20 Sep 2019 15:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58D3DF805FD; Fri, 20 Sep 2019 15:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C321BF805F7
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C321BF805F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="QFOBsiPm"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130320euoutp01c8883f2d4f809eacb9e130b59bbace5f~GJy5dTxC53082730827euoutp01O
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130320euoutp01c8883f2d4f809eacb9e130b59bbace5f~GJy5dTxC53082730827euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984600;
 bh=2CZIhLH33tEifh3ALDvkkJLDMm/NCNj9OqRYGF4YRHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QFOBsiPm9Oxb/dseMa2Tm0jwQzOHg/sxAcQ9QfZvxG6ZPgERcLSCpdD95HGdBwQZl
 NFTuRqs/6ggu/lfUmC0VlCH9jj6xt5Q5gRMWyvVogi8Cnto25Zap1h0LmQMWuDSadB
 3baezP7ErAKjO4g7/3x3Hj501ztojIH7v52Ff/G0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130319eucas1p2f2c54466421940a071da7c93405b4477~GJy4xcFp81580715807eucas1p2U;
 Fri, 20 Sep 2019 13:03:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 80.DB.04309.71EC48D5; Fri, 20
 Sep 2019 14:03:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a~GJy39A3Km2903729037eucas1p1L;
 Fri, 20 Sep 2019 13:03:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920130318eusmtrp27be8c090e90af22cfc22aaf9ecdf99bd~GJy38ZHrG1022710227eusmtrp28;
 Fri, 20 Sep 2019 13:03:18 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-e8-5d84ce171652
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 46.2B.04166.61EC48D5; Fri, 20
 Sep 2019 14:03:18 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130317eusmtip2dea228b66b0e249c407a03b71d7e9c6c~GJy3OJBHT1336913369eusmtip2z;
 Fri, 20 Sep 2019 13:03:17 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:14 +0200
Message-Id: <20190920130218.32690-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzH+z7PPfc8d3X2dJjvROwmpkTI9oShxvb8V5PZCtMjz7D86s6P
 ZJVxV5fETeS62UiGzoTzo1wr7RyXxM0SyoyW1hQxZ5qp5DzX+u/9/bzfr897++xLoOIWzJlI
 y8xhpZlMuoQv5PUObY4ddRqTJxxrnhdRE+MGhOpUt2NU9acFPjWh0AGqzjiGUWZzB05tTCgR
 Svd5EqPU5pcI1WacxSnLSj9GKV4YcWpg6RZGjbesIxF2dIelmE/3aWZxWqe9zae7Gm/QNbXb
 gC7v1gLaojt4Bj8vDE1m09PyWKlf2AVhql7RhWcrHK+Mjpp5RWByfykQEJA8Ds1bKrwUCAkx
 2QJg64IcsRpich3AzuXTnGEB8KtcgfwjmpQNPM5oBtD4o8mG7xBPSz+g1hSf9Id3B8uBVTuQ
 XnBOXYxZQyi5iEDV4JPdVfZkDJR/V+4CPPIQnHlkhQlCRIbA4seXuTY32NrxajciIEPh4nQD
 Yt0DSR0O378dxrhQJCx/VwU4bQ+/mbpxTrvA7b46G1ACYNnzGZx7qACcM9XbiBA4YBrHrM0o
 6Q3b9X7c+CT80v+GZx1D0g5OL+8eDN2Rlb01KDcWQeVNMZf2gFvaGtuFnOGdhW0ep2nY2fbb
 dq0KAMc0C6gKuGn+l9UDoAVObK4sI4WVBWSy+b4yJkOWm5niezErQwd2/s/IH9P6M6D/lWQA
 JAEk+0T1r+UJYozJkxVkGAAkUImDqDaoOEEsSmYKrrLSrERpbjorM4ADBE/iJCrcMx8nJlOY
 HPYSy2az0n8uQgici0Bl9Ep7ODO87b3We983KsvNhTYETI30FOafmCphVtUEtRHr8jGIHx/4
 c/OUj4d7yBFhwlBSmCEG8w0PjLxmCjsnr+6J9iJd9f5UPu6qqVx62KjVrFqke9NmjFUDK1Fr
 D3xiPZX39J5nEyuW/BzjguMFXv1lEQL368ErOnmVWcKTpTL+h1GpjPkLY/srmTsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4PV2xcy2xBm9vKlpcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GbtaN7MXtIpW
 nD17nqWB8ZpgFyMnh4SAicSyjkUsXYxcHEICSxkl7m5sZOti5ABKSEnMb1GCqBGW+HOtiw2i
 5hOjxJ+1p5hBEmwChhK9R/sYQWwRAU2Jjnm3WUGKmAW+M0kceHwSrEhYIEhi7tZtTCA2i4Cq
 xO3FN5lBFvAKWEs0rSyEWCAvsXrDAbByTgEbiZc3FoGVCwGVnN63l30CI98CRoZVjCKppcW5
 6bnFhnrFibnFpXnpesn5uZsYgbGw7djPzTsYL20MPsQowMGoxMO74ERLrBBrYllxZe4hRgkO
 ZiUR3jmmTbFCvCmJlVWpRfnxRaU5qcWHGE2BbprILCWanA+M07ySeENTQ3MLS0NzY3NjMwsl
 cd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYwCi7WmHG5gK+jgFXDetDJtls3/q2Jt3Hln0vRZ
 t0vMybyeKiWtuS7VUu6wl4TqEoFjky/JMOfbpPrtaIuSimMsrJub8sHu3mrztH9h/3j3XL6j
 Z5kWPttZNkwpvy2juXTh+/NHJLfWOnrpT0oqnB/xgf2l1mUV65W59ot1BG9tdvASCfe9pMRS
 nJFoqMVcVJwIAGErJnKbAgAA
X-CMS-MailID: 20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a
X-Msg-Generator: CA
X-RootMTR: 20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 05/10] ASoC: samsung: arndale: Simplify DAI
 link initialization
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
