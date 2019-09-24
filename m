Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D1BCAD2
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 17:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C84416AB;
	Tue, 24 Sep 2019 17:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C84416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569337470;
	bh=4CNfMuEkQpbwujnTP1KRp7rRravJ2GtkXFFMX9PQOws=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KA0iO9xBE0eWQXDKhWFsRqklrfykH2/CT4RyWjsFdydZh0B/5F+CeJSMJKi043KH7
	 wvlWZUeGAZ+5H7UkcJukNi739fFl2LOFEAI5KL2QQsEmAjH9slnqwi5fK4F3tKYB3X
	 x6oqOMKp7Vkpe6AhV7cuYnQQ7C5WJiHD/xLxLO/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F077BF8045F;
	Tue, 24 Sep 2019 17:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442FDF802BD; Tue, 24 Sep 2019 17:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B564F802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 17:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B564F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="pexGuttK"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190924150231euoutp01653cb1542167656eb4377c0c3ab9155b~HaAGc8Jey2906729067euoutp01d
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 15:02:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190924150231euoutp01653cb1542167656eb4377c0c3ab9155b~HaAGc8Jey2906729067euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569337351;
 bh=Kcx8u3C9GjgjM7Fhh6E8ZKxs1htYdyHkRFX2tVGkFGA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pexGuttKpzBaNu3yU7ElPI3FocCJoJ6EL/xFpEIpaWT4fJXfIgV3MTpZBgQx+/uZ/
 PZtKnPXT2T8difJeBvriKja1Qx+iWdJK/wpyHeTS8tWq9YDfEuP2HxQK0GPa7cGSIV
 NU74pvvId0lMYymPXS8ZpLhNV3PyfhMaRXsP8RCM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190924150230eucas1p2f09b36b872a7eab97a5b6ee644b3aeef~HaAF-IeBg1397913979eucas1p2F;
 Tue, 24 Sep 2019 15:02:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A5.C9.04374.6003A8D5; Tue, 24
 Sep 2019 16:02:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190924150230eucas1p295da8f6aa018aec4acabc068f6e1afa1~HaAFrJu3f0400504005eucas1p26;
 Tue, 24 Sep 2019 15:02:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190924150230eusmtrp1c31cc381d4d44f763f65ed2995c1ff89~HaAFpk90w2674326743eusmtrp1M;
 Tue, 24 Sep 2019 15:02:30 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-f7-5d8a3006c15c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DA.6C.04166.6003A8D5; Tue, 24
 Sep 2019 16:02:30 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190924150229eusmtip2b860a511b3cff6ca7f1f15a704247b76~HaAFE5KwK0655206552eusmtip2E;
 Tue, 24 Sep 2019 15:02:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Tue, 24 Sep 2019 17:01:46 +0200
Message-Id: <20190924150146.15972-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzneV02g65Yg81t+hZXLh5ispj68Amb
 xfwj51gtzp/fwG7x7UoHk8XlXXPYLGac38dk8aB5HZvF2iN32S2WXr/IZNG69wi7xeE37awO
 PB4bPjexeayZt4bRY+esu+wem1Z1snn0bVnF6PF5k1wAWxSXTUpqTmZZapG+XQJXxr3+j2wF
 UzUrLrzYwtLA+Eq+i5GTQ0LARKKheRtjFyMXh5DACkaJpm3ToZwvjBKPOl6wQDifGSVud09n
 7WLkAGu5cDQXIr6cUeL3pQsscB0zLp9mBpnLJmAo0fW2iw3EFhGokzh75gjYWGaBI0wSzfd/
 M4EkhAVKJf5+ecEKYrMIqEpMfr6MEcTmFbCVmL7gOgvEgfISqzccYAZplhBoZpdYcBiiQULA
 RaJxXw+ULSzx6vgWdghbRuL05B4WqAZGiYfn1rJDOD2MEpebZjBCVFlLHD5+EewhZgFNifW7
 9CHCjhJvn1xlhPiTT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiRnC9pBYt/4B
 2GlCArESp5bNYJ3AKDcLYdcCRsZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgank9L/j
 X3cw7vuTdIhRgINRiYfXgbUrVog1say4MvcQowQHs5II7ywZoBBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQbGKYc0/7WHJa2dO3fT/+n3JHWuBuu8Diye
 0jo/9+S6xriI7H3NBWGRks79HhZX2b9NdLbk+VhvpRPIfipCUV5E+vLZniXa8ab5bYdVen/b
 Tnn541WhygP+cxOnz5KW9X6pvnbpp/iun8ybZSpWhvn+OmIkJ3ChwsjE+dtll3/3511mCJez
 eWyoxFKckWioxVxUnAgAEqBpuSEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xe7psBl2xBi/XiVpcuXiIyWLqwyds
 FvOPnGO1OH9+A7vFtysdTBaXd81hs5hxfh+TxYPmdWwWa4/cZbdYev0ik0Xr3iPsFofftLM6
 8Hhs+NzE5rFm3hpGj52z7rJ7bFrVyebRt2UVo8fnTXIBbFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gff6P7IVTNWsuPBiC0sD4yv5LkYODgkB
 E4kLR3O7GLk4hASWMkrM/dHO2sXICRSXkTg5rQHKFpb4c62LDaLoE6PEq8Oz2UESbAKGEl1v
 IRIiAk2MEsc2z2QBcZgFTjFJ3Lg6hRGkSligWGJXw0pmEJtFQFVi8vNlYHFeAVuJ6Quus0Cs
 kJdYveEA8wRGngWMDKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECQ3jbsZ+bdzBe2hh8iFGA
 g1GJh9eBtStWiDWxrLgy9xCjBAezkgjvLBmgEG9KYmVValF+fFFpTmrxIUZToOUTmaVEk/OB
 8ZVXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGx5966qOhnby7N
 O57pJrpAiuud52/PTI0/iTMK73WLn02TPhnqc6lquo/TovCZ/ilBfBN2H3WJm/RngZGn1b5D
 DwNP3Knk7rkQV3zz5t3U47stVwR8mvB3yv6lT6Vaa0JDveZfvlkTmNrTu03U5PbBiU83Tdvz
 O3rmmt39roc3TLKbeIo7m2/rfiWW4oxEQy3mouJEAAKxDPt3AgAA
X-CMS-MailID: 20190924150230eucas1p295da8f6aa018aec4acabc068f6e1afa1
X-Msg-Generator: CA
X-RootMTR: 20190924150230eucas1p295da8f6aa018aec4acabc068f6e1afa1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190924150230eucas1p295da8f6aa018aec4acabc068f6e1afa1
References: <CGME20190924150230eucas1p295da8f6aa018aec4acabc068f6e1afa1@eucas1p2.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH] dt-bindings: sound: Convert Samsung Exynos5433
 TM2(E) audio complex with WM5110 codec to dt-schema
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

Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
 .../bindings/sound/samsung,tm2-audio.yaml     | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
deleted file mode 100644
index f5ccc12ddc00..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
-
-Required properties:
-
- - compatible		 : "samsung,tm2-audio"
- - model		 : the user-visible name of this sound complex
- - audio-codec		 : the first entry should be phandle of the wm5110 audio
-			   codec node, as described in ../mfd/arizona.txt;
-			   the second entry should be phandle of the HDMI
-			   transmitter node
- - i2s-controller	 : the list of phandle and argument tuples pointing to
-			   I2S controllers, the first entry should be I2S0 and
-			   the second one I2S1
- - audio-amplifier	 : the phandle of the MAX98504 amplifier
- - samsung,audio-routing : a list of the connections between audio components;
-			   each entry is a pair of strings, the first being the
-			   connection's sink, the second being the connection's
-			   source; valid names for sources and sinks are the
-			   WM5110's and MAX98504's pins and the jacks on the
-			   board: HP, SPK, Main Mic, Sub Mic, Third Mic,
-			   Headset Mic
- - mic-bias-gpios	 : GPIO pin that enables the Main Mic bias regulator
-
-
-Example:
-
-sound {
-	compatible = "samsung,tm2-audio";
-	audio-codec = <&wm5110>, <&hdmi>;
-	i2s-controller = <&i2s0 0>, <&i2s1 0>;
-	audio-amplifier = <&max98504>;
-	mic-bias-gpios = <&gpr3 2 0>;
-	model = "wm5110";
-	samsung,audio-routing =
-		"HP", "HPOUT1L",
-		"HP", "HPOUT1R",
-		"SPK", "SPKOUT",
-		"SPKOUT", "HPOUT2L",
-		"SPKOUT", "HPOUT2R",
-		"Main Mic", "MICBIAS2",
-		"IN1R", "Main Mic";
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
new file mode 100644
index 000000000000..377f8cbe17b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,tm2-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC Exynos5433 TM2(E) audio complex with WM5110 codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,tm2-audio
+
+  model:
+    maxItems: 1
+
+  audio-codec:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+      - items:
+          - description: |
+              phandle of the wm5110 audio codec node,
+              as described in ../mfd/arizona.txt;
+          - description: phandle of the HDMI transmitter node.
+
+  i2s-controller:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+      - items:
+          - description: phandle of the I2S0.
+          - description: phandle of the I2S1.
+
+  audio-amplifier:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the MAX98504 amplifier.
+
+  samsung,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio components.
+      Each entry is a pair of strings, the first being the
+      connection's sink, the second being the connection's
+      source. Valid names for sources and sinks are
+      the WM5110's and MAX98504's pins and the jacks on the
+      board: HP, SPK, Main Mic, Sub Mic, Third Mic, Headset Mic.
+
+  mic-bias-gpios:
+    description: GPIO pin that enables the Main Mic bias regulator.
+    maxItems: 1
+
+required:
+  - compatible
+  - model
+  - audio-codec
+  - i2s-controller
+  - audio-amplifier
+  - samsung,audio-routing
+  - mic-bias-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,tm2-audio";
+        model = "wm5110";
+        audio-codec = <&wm5110>, <&hdmi>;
+        i2s-controller = <&i2s0 0>, <&i2s1 0>;
+        audio-amplifier = <&max98504>;
+        mic-bias-gpios = <&gpr3>;
+        samsung,audio-routing =
+                "HP", "HPOUT1L",
+                "HP", "HPOUT1R",
+                "SPK", "SPKOUT",
+                "SPKOUT", "HPOUT2L",
+                "SPKOUT", "HPOUT2R",
+                "Main Mic", "MICBIAS2",
+                "IN1R", "Main Mic";
+    };
+
-- 
2.17.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
