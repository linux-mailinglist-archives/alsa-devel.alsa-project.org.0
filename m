Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AEFDA99C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 12:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3C69F6;
	Thu, 17 Oct 2019 12:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3C69F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571306870;
	bh=dKZ4sHQDyiHzBJDL2Rx07DURe0c0BG1cheWQEMO4m+M=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VbaUmd5v1RczsIkJ8wOxy48/l9eqopzMzBbeFQGamY6gvMIJhWhcRRDCEruCaStmi
	 qw1mguhwwFqlTo7uRgofcv/9MjSMWuNs+Yom+W2Cpvf4cY8m5bg3sCc7XJlcZ/2B/A
	 nOMHt4ThclUtyRgK+u+knRv5i0gYA9vhfE+v057c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77ED4F805FB;
	Thu, 17 Oct 2019 12:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83545F805F5; Thu, 17 Oct 2019 12:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B9ECF80528
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 12:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B9ECF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="SpxaLWr7"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191017100535euoutp02573c115bbf8900dc4d504eda4ff21bab~OZyaXm2Wj0218802188euoutp02i
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 10:05:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191017100535euoutp02573c115bbf8900dc4d504eda4ff21bab~OZyaXm2Wj0218802188euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1571306735;
 bh=zwOlnVoiHkpkS1qISvZUE1+ZuYCNoayDt7eUAU8ghBI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SpxaLWr7ZPq9NqzInHJTitFyGU+CEX3jviIsobqOFhxbg5aUAE5riSxU9pKIWgNq4
 SSV/NE1lvAq7jBSfYWRzbqy9uZFHYTgsnEA+CMxM/jT8xaj3lVObc6pfyDuBov757q
 12OXFShQ/GAr9OFE7oLc5vvAFr57KXqKkBO1qZ7I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191017100534eucas1p29e0e07a46b5522b6a80033f7aa2d0627~OZyZ6eukv2843428434eucas1p2t;
 Thu, 17 Oct 2019 10:05:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EA.8B.04309.EEC38AD5; Thu, 17
 Oct 2019 11:05:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984~OZyZmWJUv1060810608eucas1p1n;
 Thu, 17 Oct 2019 10:05:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191017100534eusmtrp12ed03787e55c280b2d54235283ed3e79~OZyZlku1J0854508545eusmtrp1C;
 Thu, 17 Oct 2019 10:05:34 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-7a-5da83cee35ce
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9E.D2.04166.EEC38AD5; Thu, 17
 Oct 2019 11:05:34 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191017100534eusmtip284f84d249c6e0f6a2f1c1c21abe1f185~OZyZEXyQ41706717067eusmtip2c;
 Thu, 17 Oct 2019 10:05:34 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Thu, 17 Oct 2019 12:05:29 +0200
Message-Id: <20191017100529.4183-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfUhTYRTGe3c/dh1OblP0TUNhMMUgPyLqRhJmEQsKIwUpGbbyMq1tyq5b
 aVI2RW3NUYZNR8O+yLXQbbLEj5Caayu1zU1J/7EmVJQ4I5TIlMp5+/jv9zznnPc5B14CETRj
 iUS5sopWKaVyIc5D+zwrvu2LORZJlmeIoqYCLg7laLdhVNvce5zqdPswyu+3c6lvU80canLw
 Nk61+4c5VKi+B6e63bNc6tfTfi41stCE5UaL7UtaXDxgmuWKe61XcbHBaQXipd7kY9hJXk4p
 LS/X0KrMfad4ZT3eNm7laOaFuVAHqAN6kQ5EEZDcCY0zBo4O8AgBaQFwuuEdlxXLAF7zruKs
 WALwg6tjvUJsjMwYalm/C8DOCQP6b8L30IhF3sXJbKgL6/AIx5GX4OtxN4gwQgY50OmIinAs
 eRZ227+iEUZJEXStGDaYT+bAF75hnN0vBT62P0MiAZBcxWFw4T7GFg7CK4F7XJZj4bzX+Ye3
 wrGbepQdqAdwztfNZYUewEltO2C79sIRbwCL3IOQ6dA2mMna++GrWx2APTMGzoQ3s0vHwNY+
 I8LafNjcKGC7U6HJ2/Mv9vlEEGFZDE195g0WkBL4xNKEXgfJpv9ZdwCwggRazShkNLNDSZ/P
 YKQKRq2UZZypUPSC9f8x9tO73A8G1067AEkAYTT/E9IlEWBSDVOtcAFIIMI4fmfDA4mAXyqt
 rqFVFSUqtZxmXCCJQIUJ/IubQsUCUiatos/RdCWt+lvlEFGJdUD15VBda9bIcZAWnz19Qm0p
 LLGFRH6RrZRfbZUXp/LvfgwOJQ3o196meRzK8cLawjxNujac8uNRU4tRXQbn42tyzUd2p+A4
 dbig6HORVjbcfxl3LfpWMtx5uzRFW/bcCCwUvHGYx5ye77gZyU8ftYQPNKK5R6Ut+Y5QzUsh
 ypRJs7chKkb6GxDdnpcbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsVy+t/xe7rvbFbEGjSuU7K4cvEQk8XGGetZ
 LaY+fMJmMf/IOVaL8+c3sFt8u9LBZHF51xw2ixnn9zFZPGhex2ax9shddov/e3awWxx+087q
 wOOx4XMTm8fOWXfZPTat6mTz6NuyitHj8ya5ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
 E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYx1x6eyF5zSr3j4YCZjA2OPahcjB4eEgInEjb6a
 LkYuDiGBpYwSu/sOsnUxcgLFZSROTmtghbCFJf5c62KDKPrEKPFu71uwIjYBQ4mutxAJEYEm
 Roljm2eygDjMAjeYJPbP6WABqRIWyJBY+Wc7O4jNIqAqcehnH1icV8BG4ui5fVDr5CVWbzjA
 PIGRZwEjwypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAwN127OfmHYyXNgYfYhTgYFTi4Z3A
 uDxWiDWxrLgy9xCjBAezkgjv/JYlsUK8KYmVValF+fFFpTmpxYcYTYGWT2SWEk3OB0ZVXkm8
 oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRs/rR4Q0/Aq6/roxm960
 ZMti7mATcfDcVp5z6pHIuitsO97XLpJt+2h7636ZqLZI7WmBazM1/cR6tVZsShBMYtXdmhya
 267wT35iquyjutoJXxYmzFPPmJ20IbrUWaspa4bpgqk9uiUL738I6r+17OWf4hT3yzMOv50Y
 IrAlZLV/XKZs7JkgJZbijERDLeai4kQA4gOHZnICAAA=
X-CMS-MailID: 20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984
X-Msg-Generator: CA
X-RootMTR: 20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984
References: <CGME20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984@eucas1p1.samsung.com>
Cc: Rob Herring <robh@kernel.org>, Maciej Falkowski <m.falkowski@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH v2] dt-bindings: sound: Convert Samsung Exynos
 Odroid XU3/XU4 audio complex to dt-schema
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

Convert Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
to newer dt-schema format.

'clocks' property is unneeded in the bindings and is left undefined in 'properties'.

'samsung,audio-widgets' and 'samsung,audio-routing' are optional from driver
perspective and they are set as unrequired.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
[mszyprow: reordered non-standard properties]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../bindings/sound/samsung,odroid.txt         | 54 -----------
 .../bindings/sound/samsung,odroid.yaml        | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
deleted file mode 100644
index e9da2200e173..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
-
-Required properties:
-
- - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
-		"hardkernel,odroid-xu4-audio" - for Odroid XU4 board (deprecated),
-		"samsung,odroid-xu3-audio" - for Odroid XU3 board (deprecated),
-		"samsung,odroid-xu4-audio" - for Odroid XU4 board (deprecated)
- - model - the user-visible name of this sound complex
- - clocks - should contain entries matching clock names in the clock-names
-    property
- - samsung,audio-widgets - this property specifies off-codec audio elements
-   like headphones or speakers, for details see widgets.txt
- - samsung,audio-routing - a list of the connections between audio
-   components;  each entry is a pair of strings, the first being the
-   connection's sink, the second being the connection's source;
-   valid names for sources and sinks are the MAX98090's pins (as
-   documented in its binding), and the jacks on the board
-
-   For Odroid X2:
-     "Headphone Jack", "Mic Jack", "DMIC"
-
-   For Odroid U3, XU3:
-     "Headphone Jack", "Speakers"
-
-   For Odroid XU4:
-     no entries
-
-Required sub-nodes:
-
- - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
-    controller
- - 'codec' subnode with a 'sound-dai' property containing list of phandles
-    to the CODEC nodes, first entry must be corresponding to the MAX98090
-    CODEC and the second entry must be the phandle of the HDMI IP block node
-
-Example:
-
-sound {
-	compatible = "hardkernel,odroid-xu3-audio";
-	model = "Odroid-XU3";
-	samsung,audio-routing =
-		"Headphone Jack", "HPL",
-		"Headphone Jack", "HPR",
-		"IN1", "Mic Jack",
-		"Mic Jack", "MICBIAS";
-
-	cpu {
-		sound-dai = <&i2s0 0>;
-	};
-	codec {
-		sound-dai = <&hdmi>, <&max98090>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
new file mode 100644
index 000000000000..c6b244352d05
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,odroid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: hardkernel,odroid-xu3-audio
+
+      - const: hardkernel,odroid-xu4-audio
+        deprecated: true
+
+      - const: samsung,odroid-xu3-audio
+        deprecated: true
+
+      - const: samsung,odroid-xu4-audio
+        deprecated: true
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  cpu:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandles to the I2S controllers
+
+  codec:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: |
+          List of phandles to the CODEC nodes,
+          first entry must be corresponding to the MAX98090 CODEC and
+          the second entry must be the phandle of the HDMI IP block node.
+
+  samsung,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio
+      components;  each entry is a pair of strings, the first being the
+      connection's sink, the second being the connection's source;
+      valid names for sources and sinks are the MAX98090's pins (as
+      documented in its binding), and the jacks on the board.
+      For Odroid X2: "Headphone Jack", "Mic Jack", "DMIC"
+      For Odroid U3, XU3: "Headphone Jack", "Speakers"
+      For Odroid XU4: no entries
+
+  samsung,audio-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      This property specifies off-codec audio elements
+      like headphones or speakers, for details see widgets.txt
+
+required:
+  - compatible
+  - model
+  - cpu
+  - codec
+
+examples:
+  - |
+    sound {
+        compatible = "hardkernel,odroid-xu3-audio";
+        model = "Odroid-XU3";
+        samsung,audio-routing =
+                "Headphone Jack", "HPL",
+                "Headphone Jack", "HPR",
+                "IN1", "Mic Jack",
+                "Mic Jack", "MICBIAS";
+
+        cpu {
+            sound-dai = <&i2s0 0>;
+        };
+
+        codec {
+            sound-dai = <&hdmi>, <&max98090>;
+        };
+    };
+
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
