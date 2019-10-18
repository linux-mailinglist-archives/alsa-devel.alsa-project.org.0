Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4E1DCDB6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B47166E;
	Fri, 18 Oct 2019 20:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B47166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422529;
	bh=iYqziDK2XEprw+0Pna2CQ1egTAUFdabhw7/Revlmci4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=d/4PYJqc6uVSRtn58XIIamosOGOWaHDhIrXRlgRzhD8JVONereT7SQIwyDOWTsMzq
	 SxRvUYmpYWBOTeu84Q6VVH4Ouu+1AC7PX7IYIKWIYqJSIaBbklkkmU2qhiU6mB3B9a
	 imMHva+OM9GaSmpjHT7H4a8UE5Yv5WMZbDg44EOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8978BF8067C;
	Fri, 18 Oct 2019 20:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97752F80611; Fri, 18 Oct 2019 20:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2004FF805FA
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2004FF805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J4DQxjy7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=lCHGkcA5JrwM2qbr9v3SAkjr/Lxp8j5zYwsCVgBYT6Y=; b=J4DQxjy7heGY
 BgCw33vUcNx/3/WUq51kk4/4QB2Didk6Q++bszeQRumcgExAlBIfprmhUTqXoROaLgyF7KT9GG9Ql
 UwopbTO5fPe9hB6Dqh1L/GKHCZ6oKTr3VhQdQbQYD2YUA0Ulzn7IJ8/7N1o1gpIe9ou6r6oh1pYOW
 5JwnY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeQ-0004En-Oo; Fri, 18 Oct 2019 18:06:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3C2B12743277; Fri, 18 Oct 2019 19:06:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maciej Falkowski <m.falkowski@samsung.com>
In-Reply-To: <20191017100529.4183-1-m.szyprowski@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191018180658.3C2B12743277@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:06:58 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] Applied "dt-bindings: sound: Convert Samsung Exynos
	Odroid XU3/XU4 audio complex to dt-schema" to the asoc tree
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

The patch

   dt-bindings: sound: Convert Samsung Exynos Odroid XU3/XU4 audio complex to dt-schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9ac47908f35ba885eb3b4736c83185f63eef2ed2 Mon Sep 17 00:00:00 2001
From: Maciej Falkowski <m.falkowski@samsung.com>
Date: Thu, 17 Oct 2019 12:05:29 +0200
Subject: [PATCH] dt-bindings: sound: Convert Samsung Exynos Odroid XU3/XU4
 audio complex to dt-schema

Convert Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
to newer dt-schema format.

'clocks' property is unneeded in the bindings and is left undefined in 'properties'.

'samsung,audio-widgets' and 'samsung,audio-routing' are optional from driver
perspective and they are set as unrequired.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
[mszyprow: reordered non-standard properties]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20191017100529.4183-1-m.szyprowski@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
