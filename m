Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6802B60A4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 11:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267E1168A;
	Wed, 18 Sep 2019 11:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267E1168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568800022;
	bh=K0c7urbtCVFkvDWZPVFsVEXdwd580H+AgNMzQQOjoHQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vjuppGKtSWTk+kmdLtRO3YtjsxtrYMJeR/LKi2a3/FWseIInoLvLMvtE+p62jC+3j
	 ErfBZpgjSa5hU0Iau64n3aQbTjWDOc74Dz6RAuZlXB7umdcBp/eyAQeHbolc1aNM2w
	 TYARVeeFXVAXdNSGhj46tgkTDLLFfy6ZLflUVINc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33590F805FE;
	Wed, 18 Sep 2019 11:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74F02F80361; Tue, 17 Sep 2019 14:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2BA0F80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 14:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2BA0F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="JIZSedQM"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190917120636euoutp022d07e1cd736f0cb9ee9c492b95c5fabd~FOFgMzAow1612016120euoutp02c
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 12:06:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190917120636euoutp022d07e1cd736f0cb9ee9c492b95c5fabd~FOFgMzAow1612016120euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568721996;
 bh=F+K6DpAwBVxjsgY/t1njI26Ph1Zyasw/JStH2ygMML8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JIZSedQMus46TOWPAyFxeBmkeG0jCrJpmjgRBW3NJnxS8fyd6GIdtXMawZKnlRDcg
 /lrXiqUfjTD/PdDpCqjMwrlR5KsjNmJJOLeRjoSHaE33Tvb04XKQ94ge1z6fYfNGO5
 Udsjp+gttOK/mxy9VcJAPgMjs2a4MRReJiudAXBg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190917120635eucas1p2478a3be2e7530954dec8e3ac7401df42~FOFflNBmZ0999409994eucas1p2h;
 Tue, 17 Sep 2019 12:06:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 08.C8.04374.B4CC08D5; Tue, 17
 Sep 2019 13:06:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5~FOFe1FmH-0999409994eucas1p2g;
 Tue, 17 Sep 2019 12:06:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190917120634eusmtrp204d933922ebe17ddc87561189e95aa75~FOFem1hc30498804988eusmtrp2S;
 Tue, 17 Sep 2019 12:06:34 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-44-5d80cc4bf6ab
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D5.14.04166.A4CC08D5; Tue, 17
 Sep 2019 13:06:34 +0100 (BST)
Received: from AMDC2459.digital.local (unknown [106.120.51.95]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190917120633eusmtip1d575e4d8348d03e071cb08485b0a87ab~FOFeA4bdY2136821368eusmtip1S;
 Tue, 17 Sep 2019 12:06:33 +0000 (GMT)
From: Maciej Falkowski <m.falkowski@samsung.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Tue, 17 Sep 2019 14:06:27 +0200
Message-Id: <20190917120627.28357-1-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917111413.22711-1-m.falkowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSbUhTYRTHe+69u7uOZtc58EFn0kCiIDVndCGTyqCL9sEvBSqWN72o5Kbt
 qmlSzkydFqlBmpIvEelac6kT38IlS5IsmuL7WyjtizFDmRnGsna9Rt9+//85/+ccDg+BylpE
 /kSGJofVaphMJS7Bet5v24/FftIlhc09w6h582cRNTluQ6jHKw6cah72SLu9Q0xtTeoRamLg
 KU49sVsRarnEjFPtw0ti6sXMOEKVDg6LqXfOchE1bthEznjTHa67OG1qMgG6v2FJTHcZK3D6
 YbcR0K6ug3F4giQylc3MyGO1oVHJkvTy1lEsu12e3zPkRnTgpU8l8CIgGQHv99qxSiAhZKQB
 wJ3+70AQmwBa6hZwQbgAtK1Oi/9FDA79XqQNwKpVB8IXdiMlxVKecTIMVjkHMZ7l5B1YU9uE
 8gGUXAFwcdC1+5IvGQfNLVMinjEyGBaPbuz6UjISrk/UIcK0IPiqYwjl2Ys8DRvnf4sE3yiG
 nStEJSA8fB46DecE2xd+G+neW1QB//Q3I0JLIZzeCuRXgOQ9AGdq13Ch5xR0G2twvgclj8DX
 A6GCfRY+mOK35KPecHZt91qoBx/11KGCLYX6MpmAwdBZnSQEA2Cp6S0QmIb1+tK9C1YD6Kof
 Q6pBUMP/WS0AGIEfm8up01hOpWFvhnCMmsvVpIWkZKm7gOfffNwZ+dEHrO5rNkASQLlfOmsp
 SpKJmDyuQG0DkECVcmncbY8lTWUKbrHarKva3EyWs4EAAlP6SQv3LSfKyDQmh73Ostms9l8V
 Ibz8dWAuvyzoV0k3arKqLitKy674mDu/LjwvSVEcms1oOqHVyQryqizWeA23daBYNTGVziXE
 bhd8MNKNjHzkcGLFyfkv6/Ftvsn4pcDQ8J/hF6Sq6AVanxqjm+4be1OUERFjqeZiWkWNs3aF
 ZsOB66PcfZaAG9FIb4AfqrjoNbCoxLh05vhRVMsxfwGoNQoJMwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4XV2vMw2xBlfXC1rcWneO1eLKxUNM
 FlMfPmGzmH8EyD1/fgO7xbcrHUwWl3fNYbOYcX4fk8WD5nVsFmuP3GW3WHr9IpNF694j7BaH
 37SzWlxc8YXJgc9jw+cmNo8189YweuycdZfdY9OqTjaPvi2rGD0+b5ILYIvSsynKLy1JVcjI
 Ly6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy2hfdoqlYK1IxbYDf5ga
 GFcKdjFyckgImEiseNLB0sXIxSEksJRRouPeJkaIhLTE/msf2SFsYYk/17rYIIo+MUr03V/C
 BpJgEzCQ6H+zF6xbRKCJUWL+zZ9gDrPAW0aJlh2HmECqhAX8JB719YCNYhFQlWg8BTGWV8BG
 4sPl6UwQK+QlVm84wAxicwrYSsy99ZcVxBYCqln65Az7BEa+BYwMqxhFUkuLc9Nziw31ihNz
 i0vz0vWS83M3MQIjYduxn5t3MF7aGHyIUYCDUYmH98Cphlgh1sSy4srcQ4wSHMxKIrwBtfWx
 QrwpiZVVqUX58UWlOanFhxhNgY6ayCwlmpwPjNK8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC
 6YklqdmpqQWpRTB9TBycUg2MeVf/TrVJiJh5qHbKduFA3iWCxinJinPWX241VKxfxvxNwZ8n
 /9PuktZDDWFTjUzaOErFQ16yff+Y7NDPMZvLKPRn+UY/ySNz1YQPMEfpf0h045GYyHHn5EFT
 obRJtwprNi/j/iKimLCvZ8b5F7LrNc6Zb0p/Ih2RcPcY56O2xs/y1htuuPMpsRRnJBpqMRcV
 JwIAt7uxd5oCAAA=
X-CMS-MailID: 20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5
X-Msg-Generator: CA
X-RootMTR: 20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5
References: <20190917111413.22711-1-m.falkowski@samsung.com>
 <CGME20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5@eucas1p2.samsung.com>
X-Mailman-Approved-At: Wed, 18 Sep 2019 11:43:26 +0200
Cc: mark.rutland@arm.com, m.falkowski@samsung.com, sbkim73@samsung.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org, a.hajda@samsung.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 2/2] dt-bindings: sound: Convert Samsung
 SMDK audio complex
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

Convert Samsung SMDK audio complex to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added missing Signed-off-by certificate
---
 .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
 .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
deleted file mode 100644
index 4686646fb122..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Samsung SMDK audio complex
-
-Required properties:
-- compatible : "samsung,smdk-wm8994"
-- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
-- samsung,audio-codec: The phandle of the WM8994 audio codec
-Example:
-
-sound {
-		compatible = "samsung,smdk-wm8994";
-
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&wm8994>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
new file mode 100644
index 000000000000..a66c0dfdeb57
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,smdk-wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC SMDK audio complex
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sangbeom Kim <sbkim73@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: "samsung,smdk-wm8994"
+
+  samsung,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the Samsung I2S0 controller
+
+  samsung,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8994 audio codec
+
+required:
+  - compatible
+  - samsung,i2s-controller
+  - samsung,audio-codec
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,smdk-wm8994";
+        samsung,i2s-controller = <&i2s0>;
+        samsung,audio-codec = <&wm8994>;
+    };
+
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
