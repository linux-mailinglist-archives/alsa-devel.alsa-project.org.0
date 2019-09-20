Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA2B8F95
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 14:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A79166D;
	Fri, 20 Sep 2019 14:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A79166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568981839;
	bh=W2eLq4/RMhZF1yxyytpUOlaGiOjaHX3nZFfKbCUMUdM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgTY40/jccjXwTzU1+ZMpileOYBnKHGtqOiuzFqL7OzOqrNY1Hik1CRDwVb2QIJPn
	 jL/NiOdLqSvzp/MTQxtfaF8o2T6QC8X4AikRtf2zZe98E4t6ZzRIETlSRL+xBogZvK
	 Q86r7EvsbsAAc7H4YXfiLlmZccwaZVDmdv1/ep+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0954F80146;
	Fri, 20 Sep 2019 14:15:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19FFBF80519; Fri, 20 Sep 2019 14:15:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E404EF80146
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 14:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E404EF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="uxLcmLKz"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920121527euoutp01c9aa34ed8f8616921837c1b93812ead5~GJJF0DIeT2649226492euoutp01g
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 12:15:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920121527euoutp01c9aa34ed8f8616921837c1b93812ead5~GJJF0DIeT2649226492euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568981727;
 bh=tX5jVwMHMpIeMs2o0N1LffP2nPaWeoVSu75Ha/QQEvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uxLcmLKzE5qXFNLfcgWnvN3zekSvm2yCzawEKD0Nf/MCf3oXemriI+x5q5nLSJ8pl
 VB5xbJryBfMB4mJtVtaENbV59iE9Iu5nra+Nwrs6vfiElVZFxO3euCtaarkxvyKDt7
 r/1Et+dXJ2yYrW88nJhOSy3Zss+TBCIyV4SOaBWE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920121526eucas1p254a2394a82fbc200acd33fa0d7a2c0af~GJJFKNRvT1857318573eucas1p28;
 Fri, 20 Sep 2019 12:15:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 81.55.04309.ED2C48D5; Fri, 20
 Sep 2019 13:15:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920121525eucas1p27562c205c41200221540b720c9084fb4~GJJEM1F791035610356eucas1p2N;
 Fri, 20 Sep 2019 12:15:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920121525eusmtrp221d95f0f41c2c2c77447b03c6e7a1577~GJJD7jcHx1406614066eusmtrp2D;
 Fri, 20 Sep 2019 12:15:25 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-89-5d84c2dec1fe
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.CA.04117.DD2C48D5; Fri, 20
 Sep 2019 13:15:25 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920121524eusmtip2eeb5da43d4ed2b6d212a5a37e3d5aa97~GJJDXXtVU1487014870eusmtip2j;
 Fri, 20 Sep 2019 12:15:24 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Fri, 20 Sep 2019 14:14:30 +0200
Message-Id: <20190920121431.31678-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfUhTUQDFu3vbe09p8ZqaFw2NQYn5lVH0IpOEhJFGH/4RZDNnPqbppuw5
 P6FMrXSESRDaNDUy06lrLR1q86O5Ws5w2sRSck2wWqEQToplaM6n9t/vnHsO53K5OMJr4Pjh
 6dIcSiYVZfJRT7bujcsSZjOUCQ/UNRPktHqUQ06MG1jk/dk5lGwwrkmLRYORvybKWaS1tw4l
 ayz9LNJeqkbJDuMMRj75MM4ib/YZMXJo/jbnBFegcZaggvb6diDoUc5gAq2qAhVUdqqAwKkN
 OIte9IxKpTLTcylZRHSyZ9qIzYFl6/3z7S1/OMVA66MAHjgkDkGDWY8ogCfOI1oAVHybQhmx
 BGDNWOOGcAJ4d2KRvVmxjk9vVJ4CaLxhZm1VVP31wJ1CiUioWFCgbvYmrsHhqcdsdwghvrOg
 1dnFUQAc9yJiYceS3J1hE3uhQf8bcdtc4jhccZ1nxgJhm2YQcbMHcQ42VWrXtyDRjMGv5jIW
 EzoJdc0KDsNe8IepE2N4N1ztadgolAI4O9qBMeIOgNaSGsCkjsEh0/j6hRAiGD7rjWDsGFix
 1I25bUjsgB8XdrptZA3v6aoRxubC8ls8Jr0PKk3qrdlXY+8RhgXQoXZizPs0AbjqmudUgUDl
 /7FGAFTAl5LTEjFFH5RSeeG0SELLpeLwK1kSLVj7NiMrpqVu0Ps3xQAIHPC3c/fklQp5HFEu
 XSAxAIgjfG9u3eESIY+bKioopGRZl2XyTIo2AH+czfflFm2zJ/IIsSiHyqCobEq2ecrCPfyK
 gQT3T2pdULTHDQgtjY0G07LsJxqbGhXyueuLOFw37Zh85Ii/0G4ObTg6lR/UNuSMjrHJfZ67
 hq8nZOyi33bVLldPFi6eITUvW9/1VRUNXh0bCEuoHQy2Lb9AP80FhSqFqpWCgAch9tPeyUH6
 15WquNJT0qToI8PxtsRLUSkPcT6bThNF7kdktOgf5WoeMTIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42I5/e/4Pd27h1piDWa95be4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
 v2lndeD12PC5ic1jzbw1jB47Z91l99i0qpPNo2/LKkaPz5vkAtii9GyK8ktLUhUy8otLbJWi
 DS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJO33vBXrBHuuLBil+sDYybRLsY
 OTkkBEwkLl+8xdzFyMUhJLCUUWLrkS2sEAkZiZPTGqBsYYk/17rYIIo+MUqcXARRxCZgKNH1
 FiIhItDEKLHx30kWEIdZ4COTRMuTe4xdjBwcwgKuEmu/lII0sAioShza850ZJMwrYCvx72cQ
 xAJ5idUbDjCD2JwCgRJL+jYxgdhCAgESO288ZJvAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66
 XnJ+7iZGYOhvO/Zzyw7GrnfBhxgFOBiVeHgVyptjhVgTy4orcw8xSnAwK4nwzjFtihXiTUms
 rEotyo8vKs1JLT7EaAp000RmKdHkfGBc5pXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
 Tk0tSC2C6WPi4JRqYKz7f+Z7yebGK3+ZTkwoDzJfrLRZhy/x/MWL7TeDbzzNy/Q9HC09RWIl
 q51PzzaDl2Gtt42eS60KOrl6fkNd8qkzJmm3hFM3//Lru22ufeZKoen0/jbWJaafTki+Zd+o
 bKk/e/3S57q285b1T/vOeijrW16Tgn9ij4TEfPPpqZF3D3LedzS780KJpTgj0VCLuag4EQAU
 sYCikwIAAA==
X-CMS-MailID: 20190920121525eucas1p27562c205c41200221540b720c9084fb4
X-Msg-Generator: CA
X-RootMTR: 20190920121525eucas1p27562c205c41200221540b720c9084fb4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920121525eucas1p27562c205c41200221540b720c9084fb4
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920121525eucas1p27562c205c41200221540b720c9084fb4@eucas1p2.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH 1/2] ARM: dts: exynos: split phandle in dmas
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
 arch/arm/boot/dts/exynos5250.dtsi | 14 +++++++-------
 arch/arm/boot/dts/exynos5410.dtsi |  6 +++---
 arch/arm/boot/dts/exynos5420.dtsi | 14 +++++++-------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index fc966c10cf49..44fdaad68f7c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -586,9 +586,9 @@
 			compatible = "samsung,s5pv210-i2s";
 			status = "disabled";
 			reg = <0x03830000 0x100>;
-			dmas = <&pdma0 10
-				&pdma0 9
-				&pdma0 8>;
+			dmas = <&pdma0 10>,
+				<&pdma0 9>,
+				<&pdma0 8>;
 			dma-names = "tx", "rx", "tx-sec";
 			clocks = <&clock_audss EXYNOS_I2S_BUS>,
 				<&clock_audss EXYNOS_I2S_BUS>,
@@ -606,8 +606,8 @@
 			compatible = "samsung,s3c6410-i2s";
 			status = "disabled";
 			reg = <0x12D60000 0x100>;
-			dmas = <&pdma1 12
-				&pdma1 11>;
+			dmas = <&pdma1 12>,
+				<&pdma1 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S1>, <&clock CLK_DIV_I2S1>;
 			clock-names = "iis", "i2s_opclk0";
@@ -621,8 +621,8 @@
 			compatible = "samsung,s3c6410-i2s";
 			status = "disabled";
 			reg = <0x12D70000 0x100>;
-			dmas = <&pdma0 12
-				&pdma0 11>;
+			dmas = <&pdma0 12>,
+				<&pdma0 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S2>, <&clock CLK_DIV_I2S2>;
 			clock-names = "iis", "i2s_opclk0";
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index e6f78b1cee7c..a4b03d4c3de5 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -222,9 +222,9 @@
 		audi2s0: i2s@3830000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x03830000 0x100>;
-			dmas = <&pdma0 10
-				&pdma0 9
-				&pdma0 8>;
+			dmas = <&pdma0 10>,
+				<&pdma0 9>,
+				<&pdma0 8>;
 			dma-names = "tx", "rx", "tx-sec";
 			clocks = <&clock_audss EXYNOS_I2S_BUS>,
 				<&clock_audss EXYNOS_I2S_BUS>,
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 7d51e0f4ab79..2c131ad78c09 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -434,9 +434,9 @@
 		i2s0: i2s@3830000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x03830000 0x100>;
-			dmas = <&adma 0
-				&adma 2
-				&adma 1>;
+			dmas = <&adma 0>,
+				<&adma 2>,
+				<&adma 1>;
 			dma-names = "tx", "rx", "tx-sec";
 			clocks = <&clock_audss EXYNOS_I2S_BUS>,
 				<&clock_audss EXYNOS_I2S_BUS>,
@@ -455,8 +455,8 @@
 		i2s1: i2s@12d60000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x12D60000 0x100>;
-			dmas = <&pdma1 12
-				&pdma1 11>;
+			dmas = <&pdma1 12>,
+				<&pdma1 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
 			clock-names = "iis", "i2s_opclk0";
@@ -471,8 +471,8 @@
 		i2s2: i2s@12d70000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x12D70000 0x100>;
-			dmas = <&pdma0 12
-				&pdma0 11>;
+			dmas = <&pdma0 12>,
+				<&pdma0 11>;
 			dma-names = "tx", "rx";
 			clocks = <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
 			clock-names = "iis", "i2s_opclk0";
-- 
2.17.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
