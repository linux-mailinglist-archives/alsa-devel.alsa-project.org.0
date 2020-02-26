Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE3316FBAE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 11:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 007DF169A;
	Wed, 26 Feb 2020 11:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 007DF169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582711849;
	bh=z8ADW/XV5r2o51NRA2SPw1RzZ+AeTTl1Ko/NyywtSes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+wPKYdW28SpSQnG+V1lbCt2u2aVfbK6yjrkp8OGcAoG3ThOQ947WPHK+70lgviLS
	 /D+rEaa7rGL7572xtpyAebagSW3pXOmwYITF6WG/wZn3taZ/WceWWRAFfeFWVwGOQw
	 pTwDF8fH7OUDjwqH0W2eC0OTXBVG5OZ2mA/JRzDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11BA5F8024A;
	Wed, 26 Feb 2020 11:08:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE786F8014E; Wed, 26 Feb 2020 11:08:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6271EF80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 11:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6271EF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="izdwBI6U"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200226100815euoutp01ef8efd0f677f261d2d327afe9810abbe~26_bTOL1k1266212662euoutp01h
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 10:08:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200226100815euoutp01ef8efd0f677f261d2d327afe9810abbe~26_bTOL1k1266212662euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582711695;
 bh=odmVlu3IWMO2MMx78wYMzn/eBqxQI465FK6+timZniI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=izdwBI6U9t7d3eoTy6CoWcpIM36WAiwjc43sL7Ls9kiwmpmY7ZPwLgqeaYOIUML8A
 kVTMtURN3Otwiex7OQrLdbrJcYP2avOSkd4z/zQj8K2pDIE52t7lh0KQtqM2GqtxWi
 DCgG/FPJP8atm9hWJ1aX/qc8PL2gmCRJ/Fzpxs1U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200226100815eucas1p1c2dfb065e617406e9307e106d61c7a6c~26_bAMare1157311573eucas1p1s;
 Wed, 26 Feb 2020 10:08:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F2.E3.60679.F83465E5; Wed, 26
 Feb 2020 10:08:15 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200226100815eucas1p2f4448e3dea078bfc58a8acdc70340c11~26_auDTQA1144611446eucas1p27;
 Wed, 26 Feb 2020 10:08:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200226100815eusmtrp15a775f2d53936094604fe8484e42dec1~26_atbpbX1384413844eusmtrp1Z;
 Wed, 26 Feb 2020 10:08:15 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-8b-5e56438f08b8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E2.8B.07950.E83465E5; Wed, 26
 Feb 2020 10:08:15 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200226100814eusmtip187073e44d397c1495484d540c13c1121~26_aTCZkw0568105681eusmtip1J;
 Wed, 26 Feb 2020 10:08:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mfd: wm8994: Fix unbalanced calls to
 regulator_bulk_disable()
Date: Wed, 26 Feb 2020 11:08:02 +0100
Message-Id: <20200226100802.16384-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226100802.16384-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsWy7djP87r9zmFxBhemClpcuXiIyWLjjPWs
 FlMfPmGzuP/1KKPF5V1z2CzWHrnLbnH4TTurA7vHhs9NbB6bVnWyedy5tofNo2/LKkaPz5vk
 AlijuGxSUnMyy1KL9O0SuDKmbLzMXvCfu2JOYy9zA+MMri5GTg4JAROJ2zPOs3UxcnEICaxg
 lOjae4cFwvnCKDFh1VZGCOczo8T3E+uZYFouL2mFalnOKNF0cRtCy6trJ1lAqtgEDCW63nax
 gdgiArYSr3c0gBUxC9xklNhxpw+sSFggXKLp0jewsSwCqhJHrp0Gs3mBGm5v7GGGWCcvsXrD
 ASCbg4NTwE7i6fFMiPBrNonVv5QhbBeJOW8nsULYwhKvjm9hh7BlJE5P7gHbKyHQzCjx8Nxa
 dginh1HictMMRogqa4k7536xgSxgFtCUWL9LHyLsKDHt/BsmkLCEAJ/EjbeCIGFmIHPStunM
 EGFeiY42IYhqNYlZx9fBrT144RJUiYfE4gZDSPBMZJSYd/IE2wRG+VkIuxYwMq5iFE8tLc5N
 Ty02ykst1ytOzC0uzUvXS87P3cQITBKn/x3/soNx15+kQ4wCHIxKPLwvOEPjhFgTy4orcw8x
 SnAwK4nwbvwKFOJNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNT
 qoGxwe+LkF+jyatzZuc5e//8dLc5I8W7d6egZgg7s1G739bJE+MzEu8duMbscy71dOOmTUkb
 qrIXL5r0zl+syblT5tevnssB/25HdP1a8MbO7e3/mkvZ+256BxSZyrRqpS23Y3qlfU7zdRd3
 eWGpaLz7WdVgm8J3G3xcCxeJnn+uJPHi09xzfg5KLMUZiYZazEXFiQBy8kOvDgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsVy+t/xu7r9zmFxBl+KLK5cPMRksXHGelaL
 qQ+fsFnc/3qU0eLyrjlsFmuP3GW3OPymndWB3WPD5yY2j02rOtk87lzbw+bRt2UVo8fnTXIB
 rFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GVM2
 XmYv+M9dMaexl7mBcQZXFyMnh4SAicTlJa1sXYxcHEICSxklOr5tZ4NIyEicnNbACmELS/y5
 1gVV9IlRYu+LHmaQBJuAoUTX2y6wBhEBe4kHv/6B2cwCdxklrrz2A7GFBUIlpm+6yQRiswio
 Shy5dhrM5hWwlbi9EWKOhIC8xOoNB4BsDg5OATuJp8czQcJCQCWrrx1lncDIt4CRYRWjSGpp
 cW56brGRXnFibnFpXrpecn7uJkZgwG479nPLDsaud8GHGAU4GJV4eF9whsYJsSaWFVfmHmKU
 4GBWEuHd+BUoxJuSWFmVWpQfX1Sak1p8iNEU6KaJzFKiyfnAaMoriTc0NTS3sDQ0NzY3NrNQ
 EuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cC4zNPoSKVT9xZn5Qcyt1YXRFZ88K41vDD9xL7n
 11h0BH/ofg18Wbnvw9lPr4trvl0QN1mQf2HebasM1Q8nBd/VZS0NCzilrW564rBEfcjZlSWB
 HUzXd2kZK86NesHp1LJUpHiz8He+V30eDw0/31hnmq11Jngnm9XEwkshyy98tNm1+qdljUii
 EktxRqKhFnNRcSIAdJuZPm4CAAA=
X-CMS-MailID: 20200226100815eucas1p2f4448e3dea078bfc58a8acdc70340c11
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200226100815eucas1p2f4448e3dea078bfc58a8acdc70340c11
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226100815eucas1p2f4448e3dea078bfc58a8acdc70340c11
References: <20200226100802.16384-1-m.szyprowski@samsung.com>
 <CGME20200226100815eucas1p2f4448e3dea078bfc58a8acdc70340c11@eucas1p2.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
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

When runtime PM is enabled, regulators are being controlled by the
driver's suspend and resume callbacks. They are also unconditionally
enabled at driver's probe(), and disabled in remove() functions. Add
more calls to runtime PM framework to ensure that the device's runtime
PM state matches the regulators state:
1. at the end of probe() function: set runtime PM state to active, so
there will be no spurious call to resume();
2. in remove(), ensure that resume() is called before disabling runtime PM
management and unconditionally disabling the regulators.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mfd/wm8994-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 737dede4a95c..69d973ec42bf 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -584,6 +584,7 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 		goto err_irq;
 	}
 
+	pm_runtime_set_active(wm8994->dev);
 	pm_runtime_enable(wm8994->dev);
 	pm_runtime_idle(wm8994->dev);
 
@@ -603,7 +604,9 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 
 static void wm8994_device_exit(struct wm8994 *wm8994)
 {
+	pm_runtime_get_sync(wm8994->dev);
 	pm_runtime_disable(wm8994->dev);
+	pm_runtime_put_noidle(wm8994->dev);
 	wm8994_irq_exit(wm8994);
 	regulator_bulk_disable(wm8994->num_supplies, wm8994->supplies);
 	regulator_bulk_free(wm8994->num_supplies, wm8994->supplies);
-- 
2.17.1

