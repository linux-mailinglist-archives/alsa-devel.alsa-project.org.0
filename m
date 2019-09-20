Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DBFB9044
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A679167D;
	Fri, 20 Sep 2019 15:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A679167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984674;
	bh=zq5LdPKxonBYcGWFjt2ZGrPcwr5kCPwbfya2Qb+DeZw=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=owRVjcun9oPiGcNPE6/pQHvJFqPg1RVNgyHm6cXwfTouDwCWgmfzziQ7bca5B6jF1
	 xqCELN76UoAl3hXbArdvMDmxzeLgPodL5leFIyjkgC1ngeLk6I4XEAEjv1JHPaNmqW
	 g4kikojg1mpFTlvM/OuYqZ7J0p7cYOG7Apo/22TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AFE0F804FF;
	Fri, 20 Sep 2019 15:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E374F80506; Fri, 20 Sep 2019 15:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84C2EF80146
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C2EF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dWU7/Kea"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130240euoutp01f2948553a94c4cd992af1dc741cc15fb~GJyUipRVs2865728657euoutp01Y
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:02:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130240euoutp01f2948553a94c4cd992af1dc741cc15fb~GJyUipRVs2865728657euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984560;
 bh=BchkBTQspeIDzutFJIeK4Onaadt8x5arqRDNHXthQ7w=;
 h=From:To:Cc:Subject:Date:References:From;
 b=dWU7/KeabY3grQRMH1AXJzuDWbkG7/ZIj1YrDhFJm2j5zeg+VzIyjestwKSS+FJYJ
 EBjMRshInjU16Cm5ZXXJh1eCsQAYnsRCwAtu6NoC6Hb9Ta6uNU6UwzpVdRBp+m9efA
 QDk+b8+6lbHgR4Aafmae9ugNjNGk7G/BIdOjyadc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130239eucas1p2d1302e0a4d05f59e4e90b202a52d0004~GJyTnxGNZ1581315813eucas1p2F;
 Fri, 20 Sep 2019 13:02:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B1.6A.04374.FEDC48D5; Fri, 20
 Sep 2019 14:02:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190920130238eucas1p147fca337fa84592ac7f83760449e26a1~GJySuD2cN2907129071eucas1p12;
 Fri, 20 Sep 2019 13:02:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190920130238eusmtrp13b4c6124a69d5f4b661f35270e78da48~GJyST4JNV0476604766eusmtrp1D;
 Fri, 20 Sep 2019 13:02:38 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-a3-5d84cdef18cb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 92.F0.04117.EEDC48D5; Fri, 20
 Sep 2019 14:02:38 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130237eusmtip204165d8c1eab4b4b8f27c099fc9acc0c~GJyRn90NH1284512845eusmtip2O;
 Fri, 20 Sep 2019 13:02:37 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:09 +0200
Message-Id: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTURz37O7uXkdXjlPyoGY0yliQZhndMkQx5FJfJPpiMmxuFxXdlE0t
 80O6tNR8pdlMlKwMbZmuZctHPphuq0RNNBVUzBQqHxjNBNEyt4v17ffk9z9wSExUjXuTiao0
 Vq2SJYsFQr7JujF8dHUwV3qssxXSYyNmHv2yqgWnK+cWBPRYnhHQD/uHcHp42EDQ62P5PNo4
 P47TVcPdPPpF/wxB21d7cDqvq5+g+5Zv4/RI4xovzI0x2LUCpr16hmCM+gIB86r+BqOr2QZM
 SaseMHajXxRxWXhWwSYnZrDqwNArwoTst1Ys1Q6v/cgdF2SDHKoQkCSCwajpXmIhEJIi2AjQ
 3Gw3nyNrAH0aHMU5YgeoaaoD7DZ+d8k5vQGgtf5N/F+jp81EFAJXUgCDULGlBDiwJzyMZqu0
 zhAGv/NQmaWZ5zA84EW00qxzYj48hEZLtc4FCoag3BmFQ0ZwP3pu6MUcXQR1BKqecqw5jHPo
 66NvGIc90KKtleCwLxqoKOJzhZsAFXVOERwpA2jWVge4VAjqs43gjjUMSlBLRyAnh6PN6WKC
 e6Ybmlxxd8jYDiw36TBOplD+LRGXPog29dz5CHqjOwvbfA4z6IEtx6mLoBT1flgQlAG/6v9b
 dQDogRebrlHGs5oTKvZqgEam1KSr4gPkKUoj2PkxA39sv9pA91acGUASiPdQjDVXKsJlGZpM
 pRkgEhN7UjUntVIRpZBlXmfVKbHq9GRWYwY+JF/sRWW5fI4RwXhZGpvEsqmsetflka7e2SCp
 fMAQfin8Sxw44x/J3HU3jy7hUWG1rhMFTJK8QBIZuj35+Of5fca0gdce0uOtWU83ctxifQOe
 PbE0RKcvx/jET5hc5tWCzgsN8oj1GMv0gVPG2vUhfGtvpT+lUITerwhdnHkn+Xg62upS6k2N
 SoIN78OXJPURb1SSZtd2IRTzNQmyoCOYWiP7C4BdDYgtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsVy+t/xe7rvzrbEGpw8zm1x5eIhJouNM9az
 Wkx9+ITN4krrJkaL+UfOsVqcP7+B3eLblQ4mi02Pr7FazDi/j8li7ZG77Baf3+9ntWjde4Td
 4vCbdlaLiyu+MDnweWz43MTmsXPWXXaPTas62Tw2L6n3mD7nP6NH35ZVjB6fN8kFsEfp2RTl
 l5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZTTsOcZc8Fmg
 4kPLNbYGxkbeLkYODgkBE4m/e5O7GLk4hASWMkocXnSSDSIuJTG/RamLkRPIFJb4c62LDaLm
 E6PEh46/LCAJNgFDid6jfYwgtoiApkTHvNusIEXMAt+ZJA48PskMkhAWCJC4em8ZWBGLgKrE
 5f4mRpAFvALWEi13UyAWyEus3nCAeQIjzwJGhlWMIqmlxbnpucVGesWJucWleel6yfm5mxiB
 gb3t2M8tOxi73gUfYhTgYFTi4fU41hIrxJpYVlyZe4hRgoNZSYR3jmlTrBBvSmJlVWpRfnxR
 aU5q8SFGU6DdE5mlRJPzgVGXVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQim
 j4mDU6qBcdUf9cCSPLu3L+f4n/ltEpuzrObtnoVPS8vm5S18FmY34wOTf1ngy7XG7/+z+d7R
 Nn7Gucfvy+Zb7HUlsi3VxvHKa/z7l89VvfH3pHqJnMf5zdO0y2+WPjX8ohTywU7qkHea5lXf
 Sse/vGGFG5/xPD60UaD6edzru3JOu0/4tBcxLVIqu/3RWImlOCPRUIu5qDgRAGwSqdeCAgAA
X-CMS-MailID: 20190920130238eucas1p147fca337fa84592ac7f83760449e26a1
X-Msg-Generator: CA
X-RootMTR: 20190920130238eucas1p147fca337fa84592ac7f83760449e26a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130238eucas1p147fca337fa84592ac7f83760449e26a1
References: <CGME20190920130238eucas1p147fca337fa84592ac7f83760449e26a1@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 00/10] Basic sound support for Arndale board
 / wm8994 updates
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

This patch series adds basic audio support for Exynos5250 SoC based Arndale 
board, the Bluetooth receiver source and HDMI output are not covered yet.

There is also one fix for wm8994 driver related to WM1811 CODEC and wm8994
updates to handle MCLK clocks, similar to patches:
 ae1ea48c5c59 ("ASoC: arizona: Add gating for source clocks of the FLLs")
 7a4413d0dc96 ("ASoC: arizona: Add gating for clock when used for direct MCLK")

The main changes since v1:
 - Fixed bug in "ASoC: wm8994: Add support for MCLKn clock gating" patch
   (thanks to Charles),
 - dropped the MFD part patch and moved getting of clocks to the CODEC driver,
 - Added missing Kconfig entries to patch "ASoC: samsung: arndale: Add 
   support for WM1811 CODEC",
 - Added a patch renaming the driver and a patch for exynos_defconfig.

Sylwester Nawrocki (10):
  ASoC: wm8994: Do not register inapplicable controls for WM1811
  ASoC: samsung: arndale: Add missing OF node dereferencing
  ASoC: wm8994: Add support for setting MCLK clock rate
  ASoC: wm8994: Add support for MCLKn clock gating
  ASoC: samsung: arndale: Simplify DAI link initialization
  ASoC: dt-bindings: Document "samsung,arndale-wm1811" compatible
  ASoC: samsung: arndale: Add support for WM1811 CODEC
  ASoC: samsung: Rename Arndale card driver
  ARM: dts: arndale: Add audio support (WM1811 CODEC boards)
  ARM: exynos_defconfig: Enable Arndale audio driver

 .../devicetree/bindings/sound/arndale.txt     |   5 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |  27 ++-
 arch/arm/configs/exynos_defconfig             |   1 +
 sound/soc/codecs/wm8994.c                     | 199 +++++++++++++---
 sound/soc/codecs/wm8994.h                     |  10 +-
 sound/soc/samsung/Kconfig                     |  12 +-
 sound/soc/samsung/Makefile                    |   4 +-
 sound/soc/samsung/arndale.c                   | 217 ++++++++++++++++++
 sound/soc/samsung/arndale_rt5631.c            | 138 -----------
 9 files changed, 438 insertions(+), 175 deletions(-)
 create mode 100644 sound/soc/samsung/arndale.c
 delete mode 100644 sound/soc/samsung/arndale_rt5631.c

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
