Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08CDA99B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 12:07:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F541612;
	Thu, 17 Oct 2019 12:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F541612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571306820;
	bh=feQUXuttJVQ8jlc5gAmL2TI7pp/p2KSqX7rGGL3wLj0=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cgYHvQKmJErxi9nBnYygO9TJl8feCKe6Tfa4ZmBYJ7qeq5OwMdkJtdunSGZkjUCjA
	 krHJoJOubPPJDh9LT+RshPMzU+IEe4ofvmpigREY1+3pEJD/upDryEdZVbxu8tHOuY
	 P/k/oI3bW4465nFZsE0hLv5RXWdfsOjIIKli2Tts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE7FBF805AA;
	Thu, 17 Oct 2019 12:05:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B742F80528; Thu, 17 Oct 2019 12:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C92F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 12:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C92F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="agjScbws"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191017100515euoutp02e3a2a6d116e2a8d5d248c7192213e80b~OZyHaavv10174901749euoutp02c
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 10:05:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191017100515euoutp02e3a2a6d116e2a8d5d248c7192213e80b~OZyHaavv10174901749euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1571306715;
 bh=WZzHqq1DVw7L/gU03idhKnRpdfEeIrjG/o5hYZyD5YI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=agjScbwsSzh4afHs0XsUpjzKcamQ8yFlyI9kTIbWCWaz9SixrT7lrUhGbbXyAxIlO
 NngDEzSih31gaK4BJyoFavUd6OCGqVJ434pDdoZlVSwCpi/SO/4V7de3U9NPXoUbdu
 zH3ua0Z6S3chxZRKzdMt9/n7ezXp9LExz2RwUIFU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191017100514eucas1p134d3dcf94ce16229e1732bdec6aa6be9~OZyHFrQpE2229722297eucas1p1f;
 Thu, 17 Oct 2019 10:05:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8D.7B.04309.ADC38AD5; Thu, 17
 Oct 2019 11:05:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191017100514eucas1p2e189e26e887c9cdd2209357c91846641~OZyGyuWql2843028430eucas1p2R;
 Thu, 17 Oct 2019 10:05:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191017100514eusmtrp1efebf268c33c61a8dfbc80fa7073cf98~OZyGx_qTC0791507915eusmtrp1A;
 Thu, 17 Oct 2019 10:05:14 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-43-5da83cda55ed
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 96.06.04117.ADC38AD5; Thu, 17
 Oct 2019 11:05:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191017100513eusmtip176430d2a89cb3f0183793dcb1118bfe0~OZyGLXaaA1893918939eusmtip1w;
 Thu, 17 Oct 2019 10:05:13 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Thu, 17 Oct 2019 12:05:06 +0200
Message-Id: <20191017100506.4036-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd1bNitiDdYe0ba4cvEQk8XGGetZ
 LaY+fMJmMf/IOVaL8+c3sFt8u9LBZHF51xw2ixnn9zFZPGhex2ax9shddov/e3awWxx+087q
 wOOx4XMTm8fOWXfZPTat6mTz6NuyitHj8ya5ANYoLpuU1JzMstQifbsErozvF+4xFxzRqXh9
 4xZjA+MfxS5GTg4JAROJ5jUTmLsYuTiEBFYwSmyavpMdwvnCKPHs4mVWkCohgc+MEh+WwXV8
 +XYWqmg5o0TXnRcIHbPuHwLrYBMwlOh628UGYosI1EmcPXOEEcRmFrjEJLFlIyeILSxQIbHy
 RidYnEVAVWL/orvsIDavgI3EvH0QvRIC8hKrNxwAu09C4D+bxL7WxywQCReJZ70bmSFsYYlX
 x7ewQ9gyEqcn97BANDQzSjw8t5YdwulhlLjcNIMRospa4vDxi0CncgCdpCmxfpc+RNhR4tS5
 tYwgYQkBPokbbwUhjuaTmLRtOjNEmFeio00IolpNYtbxdXBrD164BHWOh8SGNU8ZISEXK/Fr
 +w72CYxysxB2LWBkXMUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYPk7/O/5lB+OuP0mH
 GAU4GJV4eF8wL48VYk0sK67MPcQowcGsJMI7v2VJrBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe
 aoYH0UIC6YklqdmpqQWpRTBZJg5OqQZG60smH+J3BB4STr1/+toHptNPVRLlhepW+cd/971w
 ujG8OnVancy0utxUzqaPaed5mnOv1EpaPZ3bL91+R/TWFO8Pt34q6zbo2tX31asZ/b568uFz
 2zbhsO5PCozlnGJloue+h+kwZi5TnJLB4Xfzg/WPzYd+u5xsu3u1MEu26U2l5t15744rsRRn
 JBpqMRcVJwIA7YPiyhsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsVy+t/xu7q3bFbEGpw6L2px5eIhJouNM9az
 Wkx9+ITNYv6Rc6wW589vYLf4dqWDyeLyrjlsFjPO72OyeNC8js1i7ZG77Bb/9+xgtzj8pp3V
 gcdjw+cmNo+ds+6ye2xa1cnm0bdlFaPH501yAaxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnfL9xjLjiiU/H6xi3GBsY/il2MnBwSAiYSX76d
 Ze9i5OIQEljKKLH55UFGiISMxMlpDawQtrDEn2tdbBBFnxglFjbsZwZJsAkYSnS9hUiICDQx
 ShzbPJMFxGEWuMEksX9OB5DDwSEsUCbRtNIFpIFFQFVi/6K77CA2r4CNxLx9IM0gG+QlVm84
 wDyBkWcBI8MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwMDdduznlh2MXe+CDzEKcDAq8fC+
 YF4eK8SaWFZcmXuIUYKDWUmEd37Lklgh3pTEyqrUovz4otKc1OJDjKZAyycyS4km5wOjKq8k
 3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+OEmZrJNWffS835m7Zr
 5T7fJRviXffcWK3+9pHZNAYLZk3xhzE9ckEXHrB+XatkvZfvzeoD/2a4iFifZs4Krd+7ceZu
 026G+OPX3eufTclyWshRfqoqOO5a6D2xddxLXvqGzYi+tNCEP9ZiJ7ftI9/3F1bJnWZ08zjc
 /Eyr5cTNc2o973fu9hJWYinOSDTUYi4qTgQA5RldUXICAAA=
X-CMS-MailID: 20191017100514eucas1p2e189e26e887c9cdd2209357c91846641
X-Msg-Generator: CA
X-RootMTR: 20191017100514eucas1p2e189e26e887c9cdd2209357c91846641
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191017100514eucas1p2e189e26e887c9cdd2209357c91846641
References: <CGME20191017100514eucas1p2e189e26e887c9cdd2209357c91846641@eucas1p2.samsung.com>
Cc: Rob Herring <robh@kernel.org>, Maciej Falkowski <m.falkowski@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH v3] dt-bindings: sound: Convert Samsung
 Exynos5433 TM2(E) audio complex with WM5110 codec to dt-schema
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

Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
[mszyprow: reordered non-standard properties, added list of values
 for widgets, minor other fixes]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../bindings/sound/samsung,tm2-audio.txt      | 42 --------
 .../bindings/sound/samsung,tm2-audio.yaml     | 99 +++++++++++++++++++
 2 files changed, 99 insertions(+), 42 deletions(-)
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
index 000000000000..c9178d928ad4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
@@ -0,0 +1,99 @@
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
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  i2s-controller:
+    allOf:
+    - $ref: /schemas/types.yaml#/definitions/phandle-array
+    - items:
+       - description: phandle of the I2S0.
+       - description: phandle of the I2S1.
+
+  audio-codec:
+    allOf:
+    - $ref: /schemas/types.yaml#/definitions/phandle-array
+    - items:
+       - description: |
+            phandle of the wm5110 audio codec node,
+            as described in ../mfd/arizona.txt;
+       - description: phandle of the HDMI transmitter node.
+
+  audio-amplifier:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the MAX98504 amplifier.
+
+  mic-bias-gpios:
+    description: GPIO pin that enables the Main Mic bias regulator.
+    maxItems: 1
+
+  samsung,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio components.
+      Each entry is a pair of strings, the first being the
+      connection's sink, the second being the connection's
+      source. Valid names for sources and sinks are:
+      the WM5110's pins:
+         "HPOUT1L",
+         "HPOUT1R",
+         "HPOUT2L",
+         "HPOUT2R",
+         "HPOUT3L",
+         "HPOUT3R",
+      MAX98504's pins:
+         "SPKOUT"
+      and the jacks on the board:
+         "HP",
+         "SPK",
+         "RCV",
+         "Main Mic",
+         "Sub Mic",
+         "Third Mic",
+         "Headset Mic".
+
+required:
+  - compatible
+  - model
+  - i2s-controller
+  - audio-codec
+  - audio-amplifier
+  - mic-bias-gpios
+  - samsung,audio-routing
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,tm2-audio";
+        model = "wm5110";
+        i2s-controller = <&i2s0 0>, <&i2s1 0>;
+        audio-codec = <&wm5110>, <&hdmi>;
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
