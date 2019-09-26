Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E23ABF269
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FDD71746;
	Thu, 26 Sep 2019 14:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FDD71746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569499434;
	bh=HUCnz4L+Qr5VBHCKwx2RTHAjN5Q7BNr4HYiS1zHcNPg=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Aq2MKmlRboe20AGmR1tVF1mntM4d+dR1TsardMEF91GLYbCK333ySNchOiKIvCluh
	 j6RqPKl5lAK77f4XxCrKPCOkaLWJHf8utpf+8swsRTSZ1APLr3kQ1o8X5dZfFei6/k
	 vfuiHWcyKAOnpTj9NZUOdzPuck/tNfEqFvA9hAWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F6CF8048D;
	Thu, 26 Sep 2019 14:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 191A4F8048D; Thu, 26 Sep 2019 14:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C59B7F80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59B7F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="FXLPtu5M"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190926120222euoutp0290f5f09dd547c6cee0978f0781fb7b67~H_1YXeC2h0835108351euoutp022
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 12:02:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190926120222euoutp0290f5f09dd547c6cee0978f0781fb7b67~H_1YXeC2h0835108351euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569499342;
 bh=VEV0/iaFoeW20MntKkcdN0/wf7pATj10AKaP15fvTAM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=FXLPtu5MMr5/O5egyvAUNmIwbc5MUxZOHp9qXMJ0a3bem22BWH8slnEnzWs62qsA2
 E1O+gl8wu5ut53mK2c0+FTTFNClsYl7ojOkBVCMP11BFMExtOjy0wQLvqdGsHqaL+Q
 WqcLCVyZF2nRzjc8NtsWT4M2oSgB31BnFScc8CqM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190926120222eucas1p196b3d04460cd05752b710e06d817055e~H_1YEfVFJ3149731497eucas1p1L;
 Thu, 26 Sep 2019 12:02:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DB.D2.04469.DC8AC8D5; Thu, 26
 Sep 2019 13:02:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4~H_1XwDoI_0103801038eucas1p19;
 Thu, 26 Sep 2019 12:02:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190926120221eusmtrp16ac7b14ae730d565073971e092a45278~H_1XwBox_0281402814eusmtrp1L;
 Thu, 26 Sep 2019 12:02:21 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-f8-5d8ca8cd4271
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F0.81.04166.DC8AC8D5; Thu, 26
 Sep 2019 13:02:21 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190926120221eusmtip14f7b1d97bb3abb01e350d7ffe0829b3a~H_1XNXMir2594225942eusmtip1M;
 Thu, 26 Sep 2019 12:02:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Thu, 26 Sep 2019 14:02:10 +0200
Message-Id: <20190926120210.8544-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduzned2zK3piDeavtrS4cvEQk8XUh0/Y
 LOYfOcdqcf78BnaLb1c6mCwu75rDZjHj/D4miwfN69gs1h65y26x9PpFJovWvUfYLQ6/aWd1
 4PHY8LmJzWPNvDWMHjtn3WX32LSqk82jb8sqRo/Pm+QC2KK4bFJSczLLUov07RK4Mr72vWAr
 +KZVceBIC1MD42LFLkZODgkBE4lz894wdjFycQgJrGCUeHypBcr5wiix6d4yJgjnM6PE1rtX
 mLsYOcBa+jp4IOLLGSW+Hf+I0NH28jwbyFw2AUOJrrddYLaIQJ3E2TNHwIqYBY4wSTTf/80E
 khAWqJBYMOMuC8hUFgFVib39+SBhXgEbidtrDzFB3CcvsXrDAWaQXgmBdnaJuxsOs0EkXCRO
 LJ4HVSQs8er4FnYIW0bi9OQeFoiGZkaJh+fWskM4PYwSl5tmMEJUWUscPn6RFWQzs4CmxPpd
 +hBhR4nLk44xQrzJJ3HjrSBImBnInLRtOtT3vBIdbUIQ1WoSs46vg1t78MIlZgjbQ+LU278s
 ILaQQKzE3VfXGCcwys1C2LWAkXEVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYCI5/e/4
 px2MXy8lHWIU4GBU4uE9ENYdK8SaWFZcmXuIUYKDWUmE1zeyJ1aINyWxsiq1KD++qDQntfgQ
 ozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QDY/7b48aTX36ZsejzVlWbRsnSS1Gx1RJF
 e2SfyR718OWfw+X+tK/lhZ/m6Zd2Cb+XluyV3hwXerld7Pm2Q5t3LSuIDVMOMhPyMTM+d/tk
 gqfYIkWNL52lH/1mvBXMDs2uF9oseCDqxuvEUtMChagX7K9uiQbk93NM89t+zzxdRKOwcl6Z
 w7cUJZbijERDLeai4kQAvSQMRSADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xu7pnV/TEGlxqUre4cvEQk8XUh0/Y
 LOYfOcdqcf78BnaLb1c6mCwu75rDZjHj/D4miwfN69gs1h65y26x9PpFJovWvUfYLQ6/aWd1
 4PHY8LmJzWPNvDWMHjtn3WX32LSqk82jb8sqRo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr72vWAr+KZVceBIC1MD42LFLkYODgkB
 E4m+Dp4uRk4OIYGljBJbZ5WA2BICMhInpzWwQtjCEn+udbF1MXIB1XxilDix7SkjSIJNwFCi
 6y1EQkSgiVHi2OaZLCAOs8ApJokbV6eAVQkLlEn8bF/LBrKNRUBVYm9/PkiYV8BG4vbaQ0wQ
 G+QlVm84wDyBkWcBI8MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwPDdduzn5h2MlzYGH2IU
 4GBU4uE9ENYdK8SaWFZcmXuIUYKDWUmE1zeyJ1aINyWxsiq1KD++qDQntfgQoynQ7onMUqLJ
 +cDYyiuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwNjryftJftPS
 9Ryrs9o3brvc55pu1bjb/tGMExoLX0hs+V0ps33qnmN3Nntl5h1dHLV+Dl992+3zLV67zj1c
 cIMpalp0n7tS9pad/7fX59y1ZZrBLSC282vb20P2DjtXztk/if/5HqOGoiO62cdXce5f0HXm
 gmxMalLNehXbfNtHyQcr21XmtP9WYinOSDTUYi4qTgQAghDln3UCAAA=
X-CMS-MailID: 20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4
X-Msg-Generator: CA
X-RootMTR: 20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4
References: <CGME20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4@eucas1p1.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH v2] dt-bindings: sound: Convert Samsung
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
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added type and description and removed number of items from 'model' property.

Best regards,
Maciej Falkowski
---
 .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
 .../bindings/sound/samsung,tm2-audio.yaml     | 84 +++++++++++++++++++
 2 files changed, 84 insertions(+), 42 deletions(-)
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
index 000000000000..62b5b9a1dec0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
@@ -0,0 +1,84 @@
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
