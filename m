Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F3B8F96
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 14:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5EC71669;
	Fri, 20 Sep 2019 14:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5EC71669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568981885;
	bh=YngoJSkXz+K3UAUGiheIIYCRAayH/1P2XTHw/mxGVKQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jebn5M+ziOljswDAfyd099dFBdx7KK/zKh8uaC56zXIer3aWauxuTjdj5ncPwi+PH
	 570mPkBEwTI6hP4ubfe9cgLoXk0D0L8K3pp262dFoZmGNd9YReK3ATbTppxrjs3JY1
	 1BgZrxBwbI8ZB815C1q0J9ViUw7UmueOMbGQSyo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E42F805A1;
	Fri, 20 Sep 2019 14:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520BBF80506; Fri, 20 Sep 2019 14:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65F7FF800C7
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 14:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F7FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="cniAC64j"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920121528euoutp02c791e2c1f7d2ada2f0c59977418e634f~GJJGeE-243026830268euoutp02a
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 12:15:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190920121528euoutp02c791e2c1f7d2ada2f0c59977418e634f~GJJGeE-243026830268euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568981728;
 bh=5t6i+MasaTkGBz3VaPNBEYlGcTk2Ng3zUqeDZ2xAtpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cniAC64jaeFwSjm9XDgx+c4MypwdfSg8acwlqhh6EoxUXIruglEnznaVxrUrZ6h+g
 OQ3Nvo8kKy7yBPlm2z975kmnhA1te+KH81EgXcouT9sPRB2E4E39BrMLXXeVryrTUw
 a4vYGb46TuNkz6lDNoFijOIAHGDuTtaTJY0mzAbM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190920121527eucas1p18101214cfe08c210b3d71cf6ccdef18e~GJJFwSsq33273232732eucas1p1n;
 Fri, 20 Sep 2019 12:15:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 84.D3.04374.ED2C48D5; Fri, 20
 Sep 2019 13:15:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920121526eucas1p2e2165c088519094752066db49aa8ae51~GJJEzD_wh1857318573eucas1p27;
 Fri, 20 Sep 2019 12:15:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920121525eusmtrp2eadfaa861208ab3fe2ad41946a3b3ef6~GJJEh1dp-1406614066eusmtrp2F;
 Fri, 20 Sep 2019 12:15:25 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-d4-5d84c2de5499
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.CA.04117.DD2C48D5; Fri, 20
 Sep 2019 13:15:25 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920121525eusmtip25b743618866b65c75ed3ab64294daf83~GJJD7u8kX1487014870eusmtip2k;
 Fri, 20 Sep 2019 12:15:25 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Fri, 20 Sep 2019 14:14:31 +0200
Message-Id: <20190920121431.31678-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920121431.31678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUhTcRzv997esdHqNQV/mFeLotODil5UkqA0pCAKExStZz5UciqbRxqE
 uKY2Qs0jZdmUojSb17ThjMQ25wrBZa6alqagVB5gzCPTNOcz++9zffl8+fIlUZEGcycTklJZ
 WRKTKMYFPH33ovXwsPF2lH+N6Tg92NCL0bY+I0KXjY7hdFXXGrVamwh63paP0P3tlThdYe1A
 6BFFA07Xdw0R9JNPfQitfNVF0KapPOyMUNLkyMElWo0WSAzqIUKiq7uDSwpa64DEofO6gEcI
 TsWyiQnprMwv8KogXjlXwUuZ4t/QznVj2WCJUAGShNRR+NmYogICUkTVAvh9fABwZBZA80zx
 BnEAuKR5xlMB/vqEofQbwRk1AOryCnmbI7PqZsSZwqkAqJpW4U7sSt2Cbwcer4dQ6gcC+x0v
 MKfhQp2FGmMv6sQ8ag9UlnNLCanT8Ms8wrV5w+dNnesRPhUIy1ZnUE5/REBby3YOB0NFjZbg
 sAucsLRuYA+4aqhCnL2QUgA42ltPcOQugP05FYBLnYQmSx/mLEap/bCx3Y+Tg+BgfTXgjrQN
 2qd3OGV0DRbry1FOFsL8XBGX3gvVlobN2tfv3m+sKYEmxy+Eu48dwJ7GD7wi4K3+X1YNQB1w
 Y9Pk0jhWfiSJzfCVM1J5WlKc77VkqQ6sfU3PimWuDXQsxxgBRQLxVqFPhiJKhDHp8kypEUAS
 FbsKK4/lRImEsUxmFitLviJLS2TlRrCT5IndhDe3jESKqDgmlb3Osims7J+LkHz3bIAJfr6c
 7zyxGuMXEJ1VePngZE1mdO5DBl/88/TNcHhEZ7dH/GTkodIxh7n0gdoe6j6+a+Vj5wK2uzlu
 LDzLYqgNWS5ZabENzoUVm5l20ULjvbbp1IJ9sZ5f/S+dK7LzzRNhmqBgL+lvFx99cki9/nyo
 zFTC75F6XsxQytjtnvfFPHk8E3AAlcmZvzSDN0sxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42I5/e/4Pd27h1piDR7PMbW4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
 v2lndeD12PC5ic1jzbw1jB47Z91l99i0qpPNo2/LKkaPz5vkAtii9GyK8ktLUhUy8otLbJWi
 DS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJav85gKXjDWbHm6zHWBsbf7F2M
 nBwSAiYSO6c8B7K5OIQEljJK3PmylhEiISNxcloDK4QtLPHnWhcbRNEnRolTN3exgSTYBAwl
 ut5CJEQEmhglNv47yQLiMAt8ZJJoeXIPbJSwgLvEvEPnmEFsFgFVidbpILs5OHgFbCXufGOC
 2CAvsXrDAbASTgE7ian/PzBDbGthlOj/+ZFxAiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ
 +bmbGIHhv+3Yzy07GLveBR9iFOBgVOLhVShvjhViTSwrrsw9xCjBwawkwjvHtClWiDclsbIq
 tSg/vqg0J7X4EKMp0FETmaVEk/OBsZlXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1
 tSC1CKaPiYNTqoFxDmPiHbX+1avfJ6uxH+Ngdtt7T5HrxNS0Dq+La1Ttdjz5O6nSrCt+nWLn
 rbxOpc5N1Wef354Y1/+y6SNzjfKBItVyO7frF+LYND6/KebZnbzQoY9Jc4La0oP9RVf5ww8E
 3H8edE382MNp1/1FU54GTs6LvLvCRHGzyEIvLoeLJ8tWduabz1yjxFKckWioxVxUnAgAslOU
 T5UCAAA=
X-CMS-MailID: 20190920121526eucas1p2e2165c088519094752066db49aa8ae51
X-Msg-Generator: CA
X-RootMTR: 20190920121526eucas1p2e2165c088519094752066db49aa8ae51
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920121526eucas1p2e2165c088519094752066db49aa8ae51
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <20190920121431.31678-1-m.szyprowski@samsung.com>
 <CGME20190920121526eucas1p2e2165c088519094752066db49aa8ae51@eucas1p2.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH 2/2] arm64: dts: exynos: split phandle in dmas
	property
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

Change representation of phandle array as then
dt-schema counts number of its items properly.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ba66ea906f60..ba1800c6aaf1 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1452,7 +1452,7 @@
 		i2s1: i2s@14d60000 {
 			compatible = "samsung,exynos7-i2s";
 			reg = <0x14d60000 0x100>;
-			dmas = <&pdma0 31 &pdma0 30>;
+			dmas = <&pdma0 31>, <&pdma0 30>;
 			dma-names = "tx", "rx";
 			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_I2S1>,
@@ -1811,7 +1811,7 @@
 			i2s0: i2s@11440000 {
 				compatible = "samsung,exynos7-i2s";
 				reg = <0x11440000 0x100>;
-				dmas = <&adma 0 &adma 2>;
+				dmas = <&adma 0>, <&adma 2>;
 				dma-names = "tx", "rx";
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
-- 
2.17.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
