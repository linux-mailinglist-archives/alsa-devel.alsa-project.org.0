Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F2B61D9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4F71689;
	Wed, 18 Sep 2019 12:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4F71689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568803939;
	bh=BKeaPgZrEJm0VM1PyJJcX3ZaFUgeMEyuso5wYfKh4jQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwF5vaiFGcBuiYjEcWbznMs6KNX3i7pW+Q8HdRydTQRkp4z6CXzYuucSVSoX6JC4d
	 Vk1Sh+4na9UjSdhglaEwqxF5Fw6X4teAVW1eXvIIJZ925jMnSBtTronesnoetk+liz
	 zAvp1k3BeD9YCvfZbYVz3t7+b7Tpi8BmlmkxiBL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76FC1F8065A;
	Wed, 18 Sep 2019 12:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0086F8053A; Wed, 18 Sep 2019 12:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88EA7F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88EA7F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Tk2fy+L8"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918104703euoutp010d71c6f8e36d4e0c7418a8ffa547ca45~FgpV1iLfj1222412224euoutp01w
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190918104703euoutp010d71c6f8e36d4e0c7418a8ffa547ca45~FgpV1iLfj1222412224euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568803623;
 bh=8JclOj5/ENjUUtbfHxdc3+nnNEUeqg8O48HbeczPPFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tk2fy+L86+of+jC1btwA1nhNJ0lKpf59+DPkRejSRo+N6zcTZK4sqFqT9WGY0yq6f
 Kt84COX1W4TWTsvrNZkooAoUOHjqxkICKK5vlg9aRKsskGyOGdHWMyYYT7kH0yZXou
 sG5woiZ6JHV7M8djMYdK/VAiZr74vvESJU4M9XcM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190918104703eucas1p2e0b96105cc5e9aeace08a4903fdb2ea4~FgpVWSc0H2473924739eucas1p2Y;
 Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 10.E3.04374.62B028D5; Wed, 18
 Sep 2019 11:47:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d~FgpUdVvec2884428844eucas1p2H;
 Wed, 18 Sep 2019 10:47:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190918104701eusmtrp2aa3a3018d2a40fc0a3dfcad7b543585d~FgpUNprFj1555615556eusmtrp2i;
 Wed, 18 Sep 2019 10:47:01 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-50-5d820b26ba4f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.2C.04117.52B028D5; Wed, 18
 Sep 2019 11:47:01 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104700eusmtip13d92c7a9603aa012e9bacba1e9d911ba~FgpTVgWGv0589205892eusmtip1E;
 Wed, 18 Sep 2019 10:47:00 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed, 18 Sep 2019 12:46:30 +0200
Message-Id: <20190918104634.15216-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djP87pq3E2xBtt6dS2uXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9igum5TU
 nMyy1CJ9uwSujBO3NrAX9ItWPJmn3MD4SLCLkZNDQsBEYt70zcxdjFwcQgIrGCU2/t3PCOF8
 YZR4e/sdC4TzmVFi2ZGzLDAt+w89YINILGeUaDv4gB2u5fuSM6wgVWwChhK9R/sYQWwRATGJ
 23M6wZYwC/xhknj7dxbYKGGBIIlvz5cygdgsAqoSH9ZfAGvgFbCW2LbzCBvEOnmJ1RsOMIPY
 nAI2Ep8uPAC7SUJgG7vE3Qu9UEUuEnMfLmOFsIUlXh3fwg5hy0j83zmfCaKhmVGiZ/dtdghn
 AqPE/eMLGCGqrCUOH78I1M0BdJ+mxPpd+hBhR4nlr9czg4QlBPgkbrwFBxkzkDlp23SoMK9E
 R5sQRLWKxO9V05kgbCmJ7if/ocHlIXG45Tk0hPqBtv6ezTqBUX4WwrIFjIyrGMVTS4tz01OL
 jfNSy/WKE3OLS/PS9ZLzczcxAhPQ6X/Hv+5g3Pcn6RCjAAejEg+vxNmGWCHWxLLiytxDjBIc
 zEoivAG19bFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUa
 GG8tY2qwWLhJWaGzSP9Sb2J9edQFf903KtYdwb/+Za1oKQidWizw00StXst70g+GuBlzXD5E
 u01bs/jjXOt36/b/du2dv5Pn8cs/W5KuFdavsA+fyOaRZqBTUHxwvZuCZbfdQuH6Sl5pnVWc
 h38VbT98s4o/dcGuydNlJpkmfzgaG9gvNLdnkhJLcUaioRZzUXEiAPOSki08AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV1V7qZYg9btShZXLh5istg4Yz2r
 xdSHT9gsrrRuYrSYf+Qcq8X58xvYLb5d6WCy2PT4GqvFjPP7mCzWHrnLbvH5/X5Wi9a9R9gt
 Dr9pZ7W4uOILkwOfx4bPTWweO2fdZffYtKqTzWPzknqP6XP+M3r0bVnF6PF5k1wAe5SeTVF+
 aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexolbG9gL+kUr
 nsxTbmB8JNjFyMkhIWAisf/QA7YuRi4OIYGljBIHZu5n7GLkAEpIScxvUYKoEZb4c60LquYT
 o8ScDyuYQBJsAoYSvUf7GEFsEQExidtzOplBipgFupgl3u/4xQqSEBYIkJi84jYbiM0ioCrx
 Yf0FsAZeAWuJbTuPsEFskJdYveEAM4jNKWAj8enCAxYQWwioZsGxaYwTGPkWMDKsYhRJLS3O
 Tc8tNtIrTswtLs1L10vOz93ECIyFbcd+btnB2PUu+BCjAAejEg+vxNmGWCHWxLLiytxDjBIc
 zEoivAG19bFCvCmJlVWpRfnxRaU5qcWHGE2BjprILCWanA+M07ySeENTQ3MLS0NzY3NjMwsl
 cd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxLDL6yn8yXuMl/f0Xqp8zTUsXiUyUWScw/X7bC
 /PQ32yuJ8habo2SYmV/uzpqUtiJN6fm7vCcZ0+bKn/2WpaAubzBh73PdT3vMvy9bLj1J2tWX
 /1NDzazA2iTxB8XCNq/nuq72MQoPKMtvnSN/wm693k6m9HlzpMM+6V7Wnrpf76zYTpOo7HAl
 luKMREMt5qLiRAANYwJMmwIAAA==
X-CMS-MailID: 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d
X-Msg-Generator: CA
X-RootMTR: 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104702eucas1p213070d06c69c4836d15d071b1926e60d@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v1 5/9] ASoC: samsung: arndale: Simplify DAI
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

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/arndale_rt5631.c | 42 ++++++++++++------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index c213913eb984..c5c8e3b5772f 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -76,41 +76,33 @@ static struct snd_soc_card arndale_rt5631 = {
 
 static int arndale_audio_probe(struct platform_device *pdev)
 {
-	int n, ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
 
 	card->dev = &pdev->dev;
+	dai_link = card->dai_link;
 
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
-			"Property 'samsung,audio-codec' missing or invalid\n");
+	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
+	if (!dai_link->cpus->of_node) {
+		dev_err(&pdev->dev, "Property 'samsung,audio-cpu' missing or invalid\n");
 			return -EINVAL;
-		}
 	}
 
-	ret = devm_snd_soc_register_card(card->dev, card);
+	if (!dai_link->platforms->name)
+		dai_link->platforms->of_node = dai_link->cpus->of_node;
+
+	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
+	if (!dai_link->codecs->of_node) {
+		dev_err(&pdev->dev,
+			"Property 'samsung,audio-codec' missing or invalid\n");
+		return -EINVAL;
+	}
 
+	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
+		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
 
 	return ret;
 }
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
