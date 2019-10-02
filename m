Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5156AC86D2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 12:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D310F1664;
	Wed,  2 Oct 2019 12:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D310F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570013933;
	bh=KoJazTQimzWBxKRICr7OHQrTqdikE+S8NvYOZNDAzko=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t/+SybNY6VLaPD78QkkyrPqZ8Dxe+wb2DufEI29oNDJIM9cWwxmAGMrKX1Kh6XfiS
	 MuwTCcGVj9+OYuDKpgupyjPuDSntSwN8cZ2CZ2cAtUeaxqQQC1XU45bV9E/B++JDR0
	 +ayxQk0Kl2rCEoPvPdTJXab5hT3OseAiZsjw0kvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0549F805F9;
	Wed,  2 Oct 2019 12:57:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 698A9F803D5; Wed,  2 Oct 2019 12:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CBC7F803D5
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 12:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CBC7F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="pH/hcB1e"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191002105705euoutp021b4d3093d66c852004f72528121d0080~Jz0GdCBce2188421884euoutp02v
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 10:57:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191002105705euoutp021b4d3093d66c852004f72528121d0080~Jz0GdCBce2188421884euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1570013825;
 bh=TFmVNOfrv+yK5zpukqFg/VF/zWtyEJHig9qIFw+ejZU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pH/hcB1e4qA2LLqasiLhqGnj6pwvJZetAcDj9PXPC5TXagklUF7LJHroGSryDoe6c
 4U9XsRHhsGchAp3zDPLwjTqFL7csSunJJlQNiLrsjOsHQUjYV/WNiT4L6VelFrBvfa
 NtpQoZbCkbrFi01dfKl5HdRHwh7+s/DFNqP+6Ems=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191002105705eucas1p1cc956a6b544e69b912bdd4913150bd64~Jz0GRd0OA1562815628eucas1p1R;
 Wed,  2 Oct 2019 10:57:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 86.86.04309.182849D5; Wed,  2
 Oct 2019 11:57:05 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191002105705eucas1p1561d6fb9c9b7355047868e589f6a25c8~Jz0F6Fq1G1561615616eucas1p1J;
 Wed,  2 Oct 2019 10:57:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191002105705eusmtrp1ad55a810643357f673f36ea8cd3f8e49~Jz0F5PqA10038800388eusmtrp1W;
 Wed,  2 Oct 2019 10:57:05 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-ba-5d9482815aa9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4B.15.04117.182849D5; Wed,  2
 Oct 2019 11:57:05 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191002105704eusmtip2b813a5bb473d4ee57442ca68cef4d2ad~Jz0FT-Nxg0110001100eusmtip2B;
 Wed,  2 Oct 2019 10:57:04 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed,  2 Oct 2019 12:56:50 +0200
Message-Id: <20191002105652.24821-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7qNTVNiDY5cV7S4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
 wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AexWWTkpqTWZZapG+XwJXx
 6McT1oK/ohUv/i1ha2DcL9TFyMkhIWAi8at1K3MXIxeHkMAKRolZHzcwQjhfGCX+HZzLAuF8
 ZpQ4NeUMI0zLlh0b2CASyxklVv+eygzXcrl3KQtIFZuAoUTv0T6wDhEBMYnbczqZQWxmgVNM
 Ek/e2HQxcnAICwRJLHltChJmEVCVaFv7FqyVV8Ba4mbPKahl8hKrNxwAmy8h0M0u0bfvARtE
 wkXi+uaPUEXCEq+Ob2GHsGUkTk/uYYFoaGaU6Nl9mx3CmcAocf/4AqgOa4nDxy+yglzBLKAp
 sX6XPkTYUWLH0l6wsIQAn8SNt4IQN/NJTNo2nRkizCvR0QYNOxWJ36umM0HYUhLdT/6zQNge
 Etv7W1hBbCGBWIm+6VdYJzDKzULYtYCRcRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZg
 Qjn97/iXHYy7/iQdYhTgYFTi4W0ImhwrxJpYVlyZe4hRgoNZSYTX5s+kWCHelMTKqtSi/Pii
 0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTBycUg2Mi469bdf/NfnAHq/5EV49XHtd
 gs+xK4i9WFfj9yZ/6oObk+ZpsKcyqSfJyFRe59t0b6mdWLDNd9kzXU3nbPnfz65PSSkSVn09
 k/X7qpTJSTNOWlT8rXkdvm3Lu2VLD28+Yqub0uRgqsTzLEb1m+XqByf3/N0Yzel/1cja/0+r
 wzedk5VtvImzlFiKMxINtZiLihMBmkKUYSQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsVy+t/xe7qNTVNiDXp3cVhcuXiIyWLjjPWs
 FlMfPmGzuNK6idHi/PkN7BbfrnQwWWx6fI3VYsb5fUwWa4/cZbf4/H4/q8XhN+2sFhdXfGFy
 4PHY8LmJzWPnrLvsHptWdbJ5bF5S7zF9zn9Gj74tqxg9Pm+SC2CP0rMpyi8tSVXIyC8usVWK
 NrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt49OMJa8Ff0YoX/5awNTDuF+pi
 5OSQEDCR2LJjAxuILSSwlFHi5GvNLkYOoLiUxPwWJYgSYYk/17qASriASj4xSnz4+YMdJMEm
 YCjRe7SPEcQWERCTuD2nkxmkiFngGpPEplmPWUASwgIBEi1PlrCC2CwCqhJta9+CxXkFrCVu
 9pxihNggL7F6wwHmCYw8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgSG8bZjP7fsYOx6
 F3yIUYCDUYmHtyFocqwQa2JZcWXuIUYJDmYlEV6bP5NihXhTEiurUovy44tKc1KLDzGaAi2f
 yCwlmpwPjLG8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MUW/4
 NxR4z3F/f9orQ4HLVr+AQ92uLn/+xidWz4S4K/2kBX6qbQrYEq/Gayy0xPWRog+HsPt5UTbN
 WpF8jbXvUiw67ue9/bfwstuvma4Lsy+15x5cqv9tW2bfxWWMs/Ved9ipCBu8tnG7ov45KJPn
 2KomD5Og7+8FHt9ZI526uqZGs9Xi9zslluKMREMt5qLiRACtDIJreQIAAA==
X-CMS-MailID: 20191002105705eucas1p1561d6fb9c9b7355047868e589f6a25c8
X-Msg-Generator: CA
X-RootMTR: 20191002105705eucas1p1561d6fb9c9b7355047868e589f6a25c8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002105705eucas1p1561d6fb9c9b7355047868e589f6a25c8
References: <CGME20191002105705eucas1p1561d6fb9c9b7355047868e589f6a25c8@eucas1p1.samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v4 1/3] ASoC: samsung: arndale: Simplify DAI
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
Based on for-next branch from
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound

Changes since v2:
 - none.

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
