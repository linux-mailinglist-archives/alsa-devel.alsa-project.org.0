Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E92DDB904D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85768167A;
	Fri, 20 Sep 2019 15:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85768167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984731;
	bh=2bNEuv0gTDIPMUflvttitow8yKSvLMV2TWdYBxRhYKo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2whnCTGzXQJ51JeuhSnVTK3KQxya7mAByjDUZaTFEZkad1PTXTOSM9VdCtJ4EvMa
	 u5tu9vQ7V+6G7kHGIO+3EdFW8iQ8M+Y6DUm1eE0cBnbLyJYHrDwx4E8EK8NFfj4FhN
	 Vbhu8ZLMyapC0FXSWzhIwoiAawbM5DYVkFGg2FNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02AB3F805F7;
	Fri, 20 Sep 2019 15:03:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67D1BF805F7; Fri, 20 Sep 2019 15:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B1C9F80527
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1C9F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Ff88J1td"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130316euoutp01a8be7f2b202e201a94791d015bdb4547~GJy2H6rN53082730827euoutp01K
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130316euoutp01a8be7f2b202e201a94791d015bdb4547~GJy2H6rN53082730827euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984596;
 bh=O7OOSSyg4ncp0f1qYwjipjHwKNj05omUU3Za47h6MfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ff88J1tdbFQqED8KbNGMx3sah7uQXWSyEPSAs5c1AlfMYayVi5bvvsNOCSvnKgaIU
 yuWKSM1j0TCEEiCPJftxY26k5r7w9LajeZ6DM7J4ku1mdtagbv2iOH0GU6mlFvkQoU
 O9IwcIPBbvF2yf4WB58YvExdqNKwo3R33nsmC+kM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130316eucas1p2af5a0f541665aaf6b6f6fa6dd426523a~GJy1nMX141582615826eucas1p2i;
 Fri, 20 Sep 2019 13:03:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1A.7A.04374.31EC48D5; Fri, 20
 Sep 2019 14:03:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130315eucas1p2a31543214fedcdfe86196f176f554a35~GJy0vMJU01583815838eucas1p2s;
 Fri, 20 Sep 2019 13:03:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920130314eusmtrp2debf3d8bd97e77174d28cf3a23768c3a~GJy0d_KiG1022710227eusmtrp2v;
 Fri, 20 Sep 2019 13:03:14 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-29-5d84ce13b5b8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.1B.04166.21EC48D5; Fri, 20
 Sep 2019 14:03:14 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130314eusmtip2253356ff28a6e76712cd490adbc522d3~GJyzx2xhA1336913369eusmtip2w;
 Fri, 20 Sep 2019 13:03:14 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:11 +0200
Message-Id: <20190920130218.32690-3-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHe8/Z2ZnDyes0fDFJW0kXUNMMTildwOD0zSAJCqmlBy95a8d7
 mLq8mzqi0kxQTJmt1LVEpjOX23Rd1YGEEKamXxRN5rQSL2vbsfr2e/7v//k/z/vyCnCxkvAV
 JKVlMrI0aYqEL+T1jmyMBXmNlsQefzwTRk1YDBj1qqGboB7NzvOpiVINoJpNowQ1NqYmqZ8T
 FRilmftCUA1jgxjVaZoiKduKnqBK35hIyrhUTlCWjjXsnAettsn5dF/jFElrVJV8+nVbIV3f
 ZAd0bY8K0DbN/mjyqjAynklJymZkIWduCBOHtopBRpl3rtzaQRSBOVgF3AQIhqNFUzXfyWLY
 AZB8vaAKCB28BpC1XU1whQ0gfeuAoxC4Otp1dzldCVCZ9Sn419Hf1oI5o/gwFNUM1wIne8PD
 aLpB7krC4QKGFMNdLpMXjEHrz8ddzIOB6NdSMelkEYxAze/UgNvPH71Qv8Wd7AYj0cJkK+YM
 QlBDoqLZHcCtFIXs5Qzn90KL5h6SYz9k72ve9d8D6L7uK8kVCoCmzS27EyKQ0Wxx3Q2HR1F3
 fwgnn0eLKj3O5XugyWVPp4w78EFv/a4sQhVlYs59CG2q6jGOfVH1vJ3HMY2+G1f43APVAfRE
 UYcrgH/j/2EtAKiAD5PFpiYw7Ik0JieYlaayWWkJwXHpqRrg+D4fd8zrWjC4ddMAoABI3EX0
 SEmsmJBms3mpBoAEuMRb1HRSHisWxUvz8hlZ+nVZVgrDGsA+AU/iI7qzZ+aaGCZIM5lbDJPB
 yP6eYgI33yLA01X2KtiKbt2PrCjPusUr44nPfEtXPzVaNzaXt0dDB4J6krvDP7t/u3zKL0Ab
 fNa+emHE64BxYNtALscdCSFv/47GpZ2BJNRVXtQeTM4vaH54ur+yR3kpBgZEavOjZ/UvLXHv
 8+jW3LAuxwjR3iFjpDVDmWNxm1bk1nwozJDw2ERp6DFcxkr/ADLVQG46AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4PV2hcy2xBkvmmFhcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GQf/NDIWtIlU
 NH1cwdrA+Figi5GDQ0LARGLp7rouRi4OIYGljBI7f19mhIhLScxvUepi5AQyhSX+XOtiA7GF
 BD4xSrx+WgtiswkYSvQe7WMEsUUENCU65t1mBZnDLPCdSeLA45PMIAlhgWCJXfd3s4DYLAKq
 Et/fNLKD2LwC1hLzT2xghFggL7F6wwGwek4BG4mXNxYxQSyzlji9by/7BEa+BYwMqxhFUkuL
 c9Nziw31ihNzi0vz0vWS83M3MQIjYduxn5t3MF7aGHyIUYCDUYmHd8GJllgh1sSy4srcQ4wS
 HMxKIrxzTJtihXhTEiurUovy44tKc1KLDzGaAh01kVlKNDkfGKV5JfGGpobmFpaG5sbmxmYW
 SuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYCz5XbOp7xZebW+vtJfGi5s+FhCrd5Xy1Fw+p
 JLtJhZxtrTT+EGX4IlR9QRxvlkPHP+k6yyq2spvSVoFiP8wM7j3lqzy2RHmdnUjBd+EiMf8L
 SoLB/re0pO8wejmbVC+ZV5Nm32hlMXHbd1ER/7qJVy17dxc+ifDZtYRVULLuzieXJK0rU5VY
 ijMSDbWYi4oTAaCSHPeaAgAA
X-CMS-MailID: 20190920130315eucas1p2a31543214fedcdfe86196f176f554a35
X-Msg-Generator: CA
X-RootMTR: 20190920130315eucas1p2a31543214fedcdfe86196f176f554a35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130315eucas1p2a31543214fedcdfe86196f176f554a35
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130315eucas1p2a31543214fedcdfe86196f176f554a35@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 02/10] ASoC: samsung: arndale: Add missing
 OF node dereferencing
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

Ensure there is no OF node references kept when the driver
is removed/unbound.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - rebased to beginning of the series
---
 sound/soc/samsung/arndale_rt5631.c | 34 ++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index c213913eb984..fd8c6642fb0d 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -5,6 +5,7 @@
 //  Author: Claude <claude@insginal.co.kr>
 
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 
@@ -74,6 +75,17 @@ static struct snd_soc_card arndale_rt5631 = {
 	.num_links = ARRAY_SIZE(arndale_rt5631_dai),
 };
 
+static void arndale_put_of_nodes(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	for_each_card_prelinks(card, i, dai_link) {
+		of_node_put(dai_link->cpus->of_node);
+		of_node_put(dai_link->codecs->of_node);
+	}
+}
+
 static int arndale_audio_probe(struct platform_device *pdev)
 {
 	int n, ret;
@@ -103,18 +115,31 @@ static int arndale_audio_probe(struct platform_device *pdev)
 		if (!arndale_rt5631_dai[0].codecs->of_node) {
 			dev_err(&pdev->dev,
 			"Property 'samsung,audio-codec' missing or invalid\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_put_of_nodes;
 		}
 	}
 
 	ret = devm_snd_soc_register_card(card->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
+		goto err_put_of_nodes;
+	}
+	return 0;
 
-	if (ret)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
-
+err_put_of_nodes:
+	arndale_put_of_nodes(card);
 	return ret;
 }
 
+static int arndale_audio_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+
+	arndale_put_of_nodes(card);
+	return 0;
+}
+
 static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
 	{ .compatible = "samsung,arndale-rt5631", },
 	{ .compatible = "samsung,arndale-alc5631", },
@@ -129,6 +154,7 @@ static struct platform_driver arndale_audio_driver = {
 		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
 	},
 	.probe = arndale_audio_probe,
+	.remove = arndale_audio_remove,
 };
 
 module_platform_driver(arndale_audio_driver);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
