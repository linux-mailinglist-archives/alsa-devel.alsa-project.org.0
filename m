Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC576BF0C9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 13:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9501731;
	Thu, 26 Sep 2019 13:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9501731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569495866;
	bh=ca2S348QP+0K80id4jeDtz5vndeFKowIZm1Z/zHgoX8=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i+frf7goTTUw4dJbnHUZSI3hLAttXK/u0wszkgUH7iTqJmw8YEFXwbPxeyRim1gj1
	 SQJ5DQ8h9eRSFGWlMCt3D5tqYvt/mAtbWSMWQD/zo2/KFDF8d+QDl0Y1k/XSOyp+ze
	 61iW+etB1w9Go3/Q2v3AYEj81whLD/iheLyby4vM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59039F803F4;
	Thu, 26 Sep 2019 13:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F343BF803F4; Thu, 26 Sep 2019 13:02:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07C4F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 13:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07C4F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="vV+vsVcp"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190926110227euoutp0195e3e93a73f596e7fc61a91252010171~H_BD_e1nw0920109201euoutp01I
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 11:02:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190926110227euoutp0195e3e93a73f596e7fc61a91252010171~H_BD_e1nw0920109201euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569495747;
 bh=T1vG9yJ0SrvHDQJfyMirTT552HaxAD38CrVYzRGiMrA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vV+vsVcpVWomhaEqJilNT2Zsq8sW11jXNZViSCGly36ahapYZoqN+3/yVt0ZrSj3r
 hUK8FJ/KY/amTMFidA1ZdLksfG/I74zS80TZMoJlZCNjNGhzS6UqZtMGTrvVsG7/v9
 e4wN0UE8Q4yvOM8H7HGt/MV7Yr4zOLKBrSrt7i0o=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190926110226eucas1p2a5a0fb04e6ecd1ce99ed81599a1e85d4~H_BDry20e0586305863eucas1p20;
 Thu, 26 Sep 2019 11:02:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 45.D8.04374.2CA9C8D5; Thu, 26
 Sep 2019 12:02:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba~H_BDSjD0z0586305863eucas1p2z;
 Thu, 26 Sep 2019 11:02:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190926110226eusmtrp25ba1e9e4c5004f2f562a43e1a591292b~H_BDK4MpT2039620396eusmtrp2B;
 Thu, 26 Sep 2019 11:02:26 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-5b-5d8c9ac2c1e3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 51.E9.04166.2CA9C8D5; Thu, 26
 Sep 2019 12:02:26 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190926110225eusmtip162bc8419c3a731febe25b42acf6782c0~H_BCiMLpZ2692226922eusmtip1R;
 Thu, 26 Sep 2019 11:02:25 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Thu, 26 Sep 2019 13:02:19 +0200
Message-Id: <20190926110219.6144-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd1Ds3piDdrea1pcuXiIyWLqwyds
 FvOPnGO1OH9+A7vFtysdTBaXd81hs5hxfh+TxYPmdWwWa4/cZbdYev0ik0Xr3iPsFofftLM6
 8Hhs+NzE5rFm3hpGj52z7rJ7bFrVyebRt2UVo8fnTXIBbFFcNimpOZllqUX6dglcGT+X32Ev
 2MhVsan3PHsD4yWOLkYODgkBE4k9nxm7GLk4hARWMEqce32MBcL5wihxeN0S9i5GTiDnM6PE
 ztmiMA2zp0LVLGeUmHviByNcw53mGWANbAKGEl1vu9hAbBGBOomzZ46AFTELHGGSaL7/mwkk
 ISxgJ3F8bQ8LiM0ioCrx8vQSsAZeARuJKRtugNVICMhLrN5wgBmkWUKgmV3i39mTzBAJF4mv
 /3oYIWxhiVfHt7BD2DIS/3fOZ4JqYJR4eG4tO4TTwyhxuWkGVIe1xOHjF1lBHmIW0JRYv0sf
 IuwoceXNVhaIP/kkbrwVBAkzA5mTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5egTvOQ+LP6Hisk
 5GIlDvYuYZnAKDcLYdcCRsZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgWnk9L/jX3cw
 7vuTdIhRgINRiYf3QFh3rBBrYllxZe4hRgkOZiURXt/Inlgh3pTEyqrUovz4otKc1OJDjNIc
 LErivNUMD6KFBNITS1KzU1MLUotgskwcnFINjLFybCdDTugHlQkdv5Yd0flwwp+Mn+EmoVEC
 D3hehYlcDtVP3vft3voDh8qeqR7ZdqdZWOi8ZQBzjK8b555DB6fEJwYcPNOdse66yJ9122p1
 50juMHh2iCMq/8C1UtVVtq9i/nf2d3iyWNQVps3KksvfF3Qx7x+L1wcN380z3jhVRxX1Tirv
 VWIpzkg01GIuKk4EAFo3rPUfAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xu7qHZvXEGnTOZLW4cvEQk8XUh0/Y
 LOYfOcdqcf78BnaLb1c6mCwu75rDZjHj/D4miwfN69gs1h65y26x9PpFJovWvUfYLQ6/aWd1
 4PHY8LmJzWPNvDWMHjtn3WX32LSqk82jb8sqRo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mn4uv8NesJGrYlPvefYGxkscXYwcHBIC
 JhKzp7J0MXJxCAksZZTo6G4FcjiB4jISJ6c1sELYwhJ/rnWxQRR9YpT4+2whE0iCTcBQoust
 REJEoIlR4tjmmWCjmAVOMUncuDqFEaRKWMBO4vjaHrCxLAKqEi9PL2EDsXkFbCSmbLjBBLFC
 XmL1hgPMExh5FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAgM4W3Hfm7ewXhpY/AhRgEO
 RiUe3gNh3bFCrIllxZW5hxglOJiVRHh9I3tihXhTEiurUovy44tKc1KLDzGaAi2fyCwlmpwP
 jK+8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2ManbsrZOVu5bp
 8lzX+s25PsXg2fQrJyb/apkSyOkqOSnjOsfKvY89WFSeajr3vK7af3FToU6p0M7uWIfzlez8
 G2TvumeyPT+8pE8qWu4h47WVCltaw2q59220EGY5m+Xy+8M00z0u96coifP8Upj7fGXUIfVk
 JfUtxsdv/JvzWDt59coHSZxblViKMxINtZiLihMBXlom33cCAAA=
X-CMS-MailID: 20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba
X-Msg-Generator: CA
X-RootMTR: 20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba
References: <CGME20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba@eucas1p2.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH v2] ASoC: samsung: i2s: Document clocks macros
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

From: Maciej Falkowski <m.falkowski@samsung.com>

Document clocks macros with their description
from 'Documentation/devicetree/bindings/sound/samsung-i2s.txt'

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added proper commit message and description
- Moved comments to the right side

Best regards,
Maciej Falkowski
---
 include/dt-bindings/sound/samsung-i2s.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/sound/samsung-i2s.h b/include/dt-bindings/sound/samsung-i2s.h
index 77545f14c379..250de0d6c734 100644
--- a/include/dt-bindings/sound/samsung-i2s.h
+++ b/include/dt-bindings/sound/samsung-i2s.h
@@ -2,8 +2,14 @@
 #ifndef _DT_BINDINGS_SAMSUNG_I2S_H
 #define _DT_BINDINGS_SAMSUNG_I2S_H
 
-#define CLK_I2S_CDCLK		0
-#define CLK_I2S_RCLK_SRC	1
-#define CLK_I2S_RCLK_PSR	2
+#define CLK_I2S_CDCLK		0 /* the CDCLK (CODECLKO) gate clock */
+
+#define CLK_I2S_RCLK_SRC	1 /* the RCLKSRC mux clock (corresponding to
+				   * RCLKSRC bit in IISMOD register)
+				   */
+
+#define CLK_I2S_RCLK_PSR	2 /* the RCLK prescaler divider clock
+				   * (corresponding to the IISPSR register)
+				   */
 
 #endif /* _DT_BINDINGS_SAMSUNG_I2S_H */
-- 
2.17.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
