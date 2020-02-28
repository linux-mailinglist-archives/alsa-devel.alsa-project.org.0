Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48491734E6
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 11:03:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF0116CF;
	Fri, 28 Feb 2020 11:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF0116CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582884225;
	bh=yW90qB/wY6TSTAMI6xfHAhBB2pfovYbXErwvlYsJ5hc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Of2C/5jrj8Frh1b7ILVz2XpqK4xhKJQTETvdNhzAeAK8yJuKVC+UcMW9MMkyNNI0i
	 w5DnvHk25Lk7xyBYwpWl1cxi8CRxYaXh78NWpVBje1QfCx7U0mb6y1EhgQX2sMvQqK
	 cmjrZgE2ahE/fjCZFVFWb/j0EtGnkKAX2paDVwCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8998FF80089;
	Fri, 28 Feb 2020 11:01:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6E0F8014E; Fri, 28 Feb 2020 11:01:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E52F80089
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 11:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E52F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="PIzata/s"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200228100114euoutp01ed2e572d4ffe52ccd66f5fc82fb03d36~3iK4Cx7KB2298522985euoutp01Y
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 10:01:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200228100114euoutp01ed2e572d4ffe52ccd66f5fc82fb03d36~3iK4Cx7KB2298522985euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582884075;
 bh=r7iAjpDLPSMkIvQyWiR/gtZC7/Uvo9W8WiBUY3bIyxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PIzata/sP4ssB420HUNMBxV8UovlTZ/bOsqBbDGF0D0Eluz4VkzaFP7ACpdVCPsC1
 F2aATp9RNdfDcMVKnrNTQSFUEaHzO493qrJG9112JzvkvtC3ruCCGtEiQ692qrIWV5
 P0EDQ6SnR1QdeT0arlG+eGJpiuYuD57VMU9j3uyY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200228100114eucas1p1cf7b49552dc788c951afde0977ae8c62~3iK337i5z0578605786eucas1p1A;
 Fri, 28 Feb 2020 10:01:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E6.C5.60679.AE4E85E5; Fri, 28
 Feb 2020 10:01:14 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200228100114eucas1p23f608fce62f751125d5107721744ce22~3iK3lkMDh1701517015eucas1p2C;
 Fri, 28 Feb 2020 10:01:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200228100114eusmtrp14b1f1d52c6b219b563d9245797aed779~3iK3k73EN1359213592eusmtrp10;
 Fri, 28 Feb 2020 10:01:14 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-0a-5e58e4ea50f4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 93.53.08375.AE4E85E5; Fri, 28
 Feb 2020 10:01:14 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200228100113eusmtip1ab4804ebe72bd37332090963029f9851~3iK3GKNRQ2243522435eusmtip1b;
 Fri, 28 Feb 2020 10:01:13 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: wm8994: Silence warnings during deferred probe
Date: Fri, 28 Feb 2020 11:00:38 +0100
Message-Id: <20200228100038.27748-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228100038.27748-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7qvnkTEGXw6rmdx5eIhJoupD5+w
 WVxp3cRocf/rUUaLb1c6mCwu75rDZrH2yF12i8/v97NaHH7TzurA6bHhcxObx85Zd9k9Nq3q
 ZPO4c20Pm8f0Of8ZPfq2rGL0+LxJLoA9issmJTUnsyy1SN8ugSvjz4JHTAW72CoWNnxgamBc
 w9rFyMkhIWAiMWP7QTBbSGAFo8SE3pQuRi4g+wujxNL2j6wQzmdGiSn7trDAdKy/ewMqsZxR
 Yu6cfexwLRu3TmcEqWITMJToetvFBmKLCMRJLF+8gAmkiFngF6PE50+bmEASwgKeEivW3gVb
 ziKgKrH+yAuwOK+ArcShHx3sEOvkJVZvOMAMYnMK2EmcvP0MbJCEQDe7ROvRXiaIIheJ+Xc3
 QH0kLPHq+BaoZhmJ05N7WCAamhklHp5byw7h9DBKXG6awQhRZS1x59wvoFs5gO7TlFi/Sx8i
 7CjxbudCdpCwhACfxI23giBhZiBz0rbpzBBhXomONiGIajWJWcfXwa09eOESM4TtIXHjchs0
 hCYyStxfuo55AqP8LIRlCxgZVzGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmlNP/jn/Z
 wbjrT9IhRgEORiUe3gU7wuOEWBPLiitzDzFKcDArifBu/BoaJ8SbklhZlVqUH19UmpNafIhR
 moNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVANjzgar/XuNrnJpPV7uECf5Z84TddNFbJrr
 5R5v3fFkY3DEAtePmSt7H/xYyuH56s7qxStXCbaJ7ndlfXxF3ut3tY265IXYjMVlZ9OSLXMy
 l9jbe2X/lbg24VdAl1h8rE7E0RTePrFfv7xNb5Tulw1NOXfk5P3ccqlp4Zu7Mj2/h8zY5iY/
 JfC5EktxRqKhFnNRcSIAZubgjCQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsVy+t/xu7qvnkTEGSx6L2Vx5eIhJoupD5+w
 WVxp3cRocf/rUUaLb1c6mCwu75rDZrH2yF12i8/v97NaHH7TzurA6bHhcxObx85Zd9k9Nq3q
 ZPO4c20Pm8f0Of8ZPfq2rGL0+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DY
 PNbKyFRJ384mJTUnsyy1SN8uQS/jz4JHTAW72CoWNnxgamBcw9rFyMkhIWAisf7uDSCbi0NI
 YCmjRNPDt4wQCRmJk9MaoIqEJf5c62KDKPrEKHF07jSwBJuAoUTXW5AEJ4eIQILEoeUtzCBF
 zAL/GCXePbrJDJIQFvCUWLH2LlgDi4CqxPojL5hAbF4BW4lDPzrYITbIS6zecACsnlPATuLk
 7WdgNUJANUfnPGSewMi3gJFhFaNIamlxbnpusaFecWJucWleul5yfu4mRmB4bzv2c/MOxksb
 gw8xCnAwKvHwLtgRHifEmlhWXJl7iFGCg1lJhHfj19A4Id6UxMqq1KL8+KLSnNTiQ4ymQEdN
 ZJYSTc4Hxl5eSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGbk7D
 ogiT60o1WW/Wfj10oF3LRX9r+f6zL09e665/r7z40+9E8Vwx9VOmSx5qHdvidj+tkv2l45fr
 560k9C1uL/XvM9j1I+L07jeeuU7T1LYs8z0Rx/7v+mR9paCaFwxmKxSmmLUunlkh3bgit2/C
 tXuawUn/dwk9O5Z0vI1hxh++LROeVnyarMRSnJFoqMVcVJwIAM1hzieFAgAA
X-CMS-MailID: 20200228100114eucas1p23f608fce62f751125d5107721744ce22
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228100114eucas1p23f608fce62f751125d5107721744ce22
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228100114eucas1p23f608fce62f751125d5107721744ce22
References: <20200228100038.27748-1-m.szyprowski@samsung.com>
 <CGME20200228100114eucas1p23f608fce62f751125d5107721744ce22@eucas1p2.samsung.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>,
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
clocks in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/wm8994.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 15ce64a48a87..b4d8da8eb479 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4601,7 +4601,8 @@ static int wm8994_probe(struct platform_device *pdev)
 	ret = devm_clk_bulk_get_optional(pdev->dev.parent, ARRAY_SIZE(wm8994->mclk),
 					 wm8994->mclk);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
 		return ret;
 	}
 
-- 
2.17.1

