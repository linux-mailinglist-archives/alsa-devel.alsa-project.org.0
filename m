Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47E256854
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 16:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5115A1890;
	Sat, 29 Aug 2020 16:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5115A1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598711499;
	bh=E1hVAd3lBjehhCh0G784FFWukEKouWeGXwdRL4oXW8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihTaRwmJJ7j4Q4oOXPU9VLKCSYTPCcVBs8epqNCUZWOHFGzFlPljI1W/MJNTSuRV0
	 KwKkrrghwzEb0L188QGaXxpE89u+5LPRUkndALJudVU2hbkkM6ja2wcZdcpHMV6Xlk
	 lv/Uh0fPtmBYXt3grYPdMpkEfD+/DcGo9dMzCEac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFD2F80308;
	Sat, 29 Aug 2020 16:26:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AAE8F80307; Sat, 29 Aug 2020 16:26:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432D3F80305
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 16:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432D3F80305
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cr7yPnmX"
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C0B120C56;
 Sat, 29 Aug 2020 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598711158;
 bh=E1hVAd3lBjehhCh0G784FFWukEKouWeGXwdRL4oXW8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cr7yPnmX9yXVCWjvWHUOp+ejxR44jkEQyY9aMINktokMsSu/4DwnEwjMCRLZlaZFO
 fXGE90a1K6Vfo1IOeauMfcjbYBAcVHFtknsboKDm3U8sYTRtNVlPDlCzgYhzItH0Fw
 6eb20eRaUV3JnU5yvHoy9DHW6KrvvOvaM5SksL6w=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: [RFT 09/10] arm64: dts: exynos: Correct port of USB-C connector node
 on Exynos5433 TM2
Date: Sat, 29 Aug 2020 16:25:00 +0200
Message-Id: <20200829142501.31478-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
References: <20200829142501.31478-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

The USB-C connector bindings require port@0.  Such port was already
described in DTS but outside of the connector itself.  Put it into
proper place to fix dtbs_check warnings like:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: musb_connector: ports: 'port@0' is a required property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested on HQ. Please kindly review and test.

Best regards,
Krzysztof
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 6246cce2a15e..bab6c1addd5f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -871,6 +871,13 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
+					port@0 {
+						reg = <0>;
+						muic_to_usb: endpoint {
+							remote-endpoint = <&usb_to_muic>;
+						};
+					};
+
 					port@3 {
 						reg = <3>;
 						musb_con_to_mhl: endpoint {
@@ -879,14 +886,6 @@
 					};
 				};
 			};
-
-			ports {
-				port {
-					muic_to_usb: endpoint {
-						remote-endpoint = <&usb_to_muic>;
-					};
-				};
-			};
 		};
 
 		regulators {
-- 
2.17.1

