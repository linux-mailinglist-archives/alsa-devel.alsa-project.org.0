Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40231B9062
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90591670;
	Fri, 20 Sep 2019 15:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90591670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984992;
	bh=TQFjva3F5ZmsSRFpXdu+ekmvlucb4AUmFB2ZiGbXW6Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITSUUOuCfw3Zr7a/QYDB/MFJiYZWD/2HZdjvpSZZOjztv5sjCN6HVmlLI1AnXVmEe
	 sraLgI0ZR/JlQWcWk+LzbA6xPJ1A7QFq+auMds9mWiDAPEWFQtmG5rMFr66Fm3Gp+3
	 xqRSHK0MiMiYUwzv40ILQGNAq3qKWCdHv2p7PkQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C423AF80674;
	Fri, 20 Sep 2019 15:03:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B0CF80679; Fri, 20 Sep 2019 15:03:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ADF4F80673
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ADF4F80673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="reh4OU8r"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130325euoutp02e4c6672619121ce2b2121135acee8242~GJy_xO1Gq2405524055euoutp02j
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190920130325euoutp02e4c6672619121ce2b2121135acee8242~GJy_xO1Gq2405524055euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984606;
 bh=y4Kvy/he22nbkNnh3UtlDLg5F84jBQHhkJan8z/Dg4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=reh4OU8rVu5iGu+lGWWMQfJ7h4gdclU/318CVSIL9C7qMv3GyO4KGpgvCuLQ+0eXs
 cUN8zXJT95fmblWDPwlntoYQeDuFP8vbPecdvWKymx0Ggw2K7k4pj2TtlIYAywyE/i
 tmTDnVXr1S2Cc6455m+JrgoPxMrZlaZciHN3QfGE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130325eucas1p2fc72e9073210a504295088ca09b9013d~GJy_VE9wR1581315813eucas1p2m;
 Fri, 20 Sep 2019 13:03:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BC.DC.04469.D1EC48D5; Fri, 20
 Sep 2019 14:03:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1~GJy9gDx6M2867428674eucas1p1i;
 Fri, 20 Sep 2019 13:03:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920130324eusmtrp258dccde01909620f4f0c634d76513d12~GJy9M3cFN1022710227eusmtrp2H;
 Fri, 20 Sep 2019 13:03:24 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-7d-5d84ce1d21ac
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D9.2B.04166.C1EC48D5; Fri, 20
 Sep 2019 14:03:24 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130323eusmtip273f4ce49ec2238905b885382f032410c~GJy8io9MM1303613036eusmtip29;
 Fri, 20 Sep 2019 13:03:23 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:18 +0200
Message-Id: <20190920130218.32690-10-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0gUYRSG+2ZndkZpZdwV/NJSWoowyk1ZYSKRiqKhX6HUj8xq0kGXvO54
 D9S8tZptFpriBTfvGnlZxWtqueoGgYtiJoipua15ScPV6ELaTmP17znved/vHA4fIZLWYS6E
 KjKWVUcy4XKxPdox8t10/MBoZtCJtj47amJsEKFai5sxqnDeLKYmsvSAqhgaxSiTqQWnvk5o
 EEq/MIlRxaZ+hHo+NINT1vUBjMrqG8Ipw+o9jBqr30ROO9At1nQx3V0yg9P6xhwx3VadSheV
 7QBa294IaKve7RJ+1d43hA1XxbNqhd9N+7Ds3mEs+qljYvX4OpoGtiW5gCAgqYQ9W665wI6Q
 kvUA6ivRXGBv400ANzKmgVBYAWwunxTzLj6Q19uCCYk6ABcX9v1LrGlrUb4hJr3gg2Et4NmJ
 PAJni9Mx3iQilxCYP9yE8A0ZeQV26N7+eQklD0Pj9ADOs4T0hd8sJiBMc4fPWl6KeLaz6UtT
 lQj/ECT1OLQU/sAE0zk4vKxDBZbBZWM7LvB+uNNdsRvIALa9p3GhyAdw1qjbHXEKGoxjGH8N
 EekBm3sUgnwGfswz4MKRHODUZ0deFtnwcUeRSJAlUJMtFdyH4M/GIkRgF3jfvLO7Dg21JTmI
 cKGHAH54+gnPB+4l/4fpAGgEzmwcFxHKcl6RbIInx0RwcZGhnsFREXpg+z5vto0bXWBr/NYg
 IAkg3yuhRzKDpBgTzyVFDAJIiOROkjKf9CCpJIRJSmbVUTfUceEsNwhcCVTuLLmzZy5QSoYy
 sextlo1m1X+7CGHnkgaaGhT0r5h3A/O9j3KXV5Sta4p4WUrVeb8ep83o8pTVFweLZYn+K4ZS
 g9nxfYUbo/RgzCtYoKfqbP/dy5ak7pquzoSw1E6ppkqnyVY2oF9KS5+sF3jEuF57daEhgfHR
 LdaeVDYEeHuHzF0vuGgJ6alJVkcdMwUXyOpU/gFlr41ylAtjvI6K1BzzGwqJZI86AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4PV2Zcy2xBsumCVhcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GW27j7IWLBSs
 WHLpPUsD4z/eLkZODgkBE4me3RtYuxi5OIQEljJKPO6aAeRwACWkJOa3KEHUCEv8udbFBmIL
 CXxilHj2MBvEZhMwlOg92scIYosIaEp0zLsNNodZ4DuTxIHHJ5lB5ggLhEg8vMsHUsMioCpx
 /PZ+dhCbV8BG4sez84wQ8+UlVm84wAxicwLFX95YxASxy1ri9L697BMY+RYwMqxiFEktLc5N
 zy021CtOzC0uzUvXS87P3cQIjIRtx35u3sF4aWPwIUYBDkYlHt4FJ1pihVgTy4orcw8xSnAw
 K4nwzjFtihXiTUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGCU5pXEG5oamltYGpobmxubWSiJ
 83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYIxZY7Ih9eLfByvZ4vvcqnjSHBY6hK3d+mXihRLJ
 O1mJd73Xu63pn1a80LpDtk/WSIXxbdSCtevClbsmOfClzvufUfBsVvbSUyXyOTMyAhbMXiwl
 8y2sLcnuZ9WVZ0JTNdurLjgdW6AULNu9aNkOoxChySGvSpaFpyseVzkY4td96MlU7wlVa5RY
 ijMSDbWYi4oTAX30pqWaAgAA
X-CMS-MailID: 20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1
X-Msg-Generator: CA
X-RootMTR: 20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130324eucas1p118bfab45306a29752bf4c1cfdd8f61a1@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 09/10] ARM: dts: arndale: Add audio support
 (WM1811 CODEC boards)
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

Add sound node and the clock configurations for the I2S controller
for audio support on the Exynos5250 SoC Arndale boards with
WM1811 based audio daughter board.

We need to increase drive strength of the I2S bus, otherwise
the audio CODEC doesn't work. Likely the CODEC's master clock
is the main issue here.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - moved &clock, &clock_audss parts to preserve alphabetical order
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index dc6fa6fe83f1..7247efe2ec12 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5250.dtsi"
 
 / {
@@ -135,6 +136,12 @@
 		};
 	};
 
+	sound {
+		compatible = "samsung,arndale-wm1811";
+		samsung,audio-cpu = <&i2s0>;
+		samsung,audio-codec = <&wm1811>;
+	};
+
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -151,6 +158,16 @@
 	};
 };
 
+&clock {
+	assigned-clocks = <&clock CLK_FOUT_EPLL>;
+	assigned-clock-rates = <49152000>;
+};
+
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-parents = <&clock CLK_FOUT_EPLL>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
@@ -502,9 +519,11 @@
 &i2c_3 {
 	status = "okay";
 
-	wm1811a@1a {
+	wm1811: codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
+		clocks = <&i2s0 CLK_I2S_CDCLK>;
+		clock-names = "MCLK1";
 
 		AVDD2-supply = <&main_dc_reg>;
 		CPVDD-supply = <&main_dc_reg>;
@@ -540,9 +559,15 @@
 };
 
 &i2s0 {
+	assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
+	assigned-clock-parents = <&clock_audss EXYNOS_I2S_BUS>;
 	status = "okay";
 };
 
+&i2s0_bus {
+	samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
+};
+
 &mixer {
 	status = "okay";
 };
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
