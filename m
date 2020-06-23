Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2EB2050F6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 13:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692E017AF;
	Tue, 23 Jun 2020 13:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692E017AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592912508;
	bh=PHv6RMWA0CB8IW+CPXkgSL5ROW0cigmoL/UVZhECOt8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C++violVAJJbhe1YRBBjMfIlh/BI4l0JaEVRYMnatP66ZNfn4CsQlsDAOFXgBKM8g
	 oE8hzmcjFIx763Gl94ct0qAAbOgeN17NsJF/GgEHRgxxXHAVptliSFe6gT/5cySCzu
	 sk0+Ol8Ta4Og6hSLZxeUnIQBexs5jlQ9JtAcM5A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F241F800B2;
	Tue, 23 Jun 2020 13:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6065F80234; Tue, 23 Jun 2020 13:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCC4FF800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 13:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC4FF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="MBl6WMP9"
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 05NBdQcO015338;
 Tue, 23 Jun 2020 20:39:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 05NBdQcO015338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1592912367;
 bh=EQR5jz5Ak267spsKF3ptXzFmAIfZKKdNNqltK1FNhao=;
 h=From:To:Cc:Subject:Date:From;
 b=MBl6WMP9adRnYFLrrJkyqoyppk+BUFmKK6oIMZCxoQgKR+qeQm87sOAI8TELXzp/p
 dE5cjfY6chpBz57ArwADg3D/AT8bFm/JnTMJHHdW0Z2nKmv94VxV/wYofC3qXj1sQd
 bLLaaBeA2oOlNHYEDraW1Q9nWCb8GPeCRRiEd0pb3eSsN8klDL7hyC9cidtcnoXdyC
 WpQzUXovcvwNIPmD2nETSwwZ9eipi0EFRHtI04RixvDXpFb1+dX6GgJYEOIENVVkEI
 XqC88Q7N7+9W/+kM0jC+e8nA7CiA0QdfNU/QkcKDXaPhUDXU09lYT4xb3znh+4gZpG
 tTjnZk1zCyS2Q==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: ASoC: Convert UniPhier AIO audio system to
 json-schema
Date: Tue, 23 Jun 2020 20:39:15 +0900
Message-Id: <20200623113915.791386-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: - <alsa-devel@alsa-project.org>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Convert the UniPhier AIO audio system binding to DT schema format.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Add schema for subnode 'port'

 .../sound/socionext,uniphier-aio.yaml         | 81 +++++++++++++++++++
 .../bindings/sound/uniphier,aio.txt           | 45 -----------
 2 files changed, 81 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/uniphier,aio.txt

diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
new file mode 100644
index 000000000000..4987eb91f2ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/socionext,uniphier-aio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UniPhier AIO audio system
+
+maintainers:
+  - <alsa-devel@alsa-project.org>
+
+properties:
+  compatible:
+    enum:
+      - socionext,uniphier-ld11-aio
+      - socionext,uniphier-ld20-aio
+      - socionext,uniphier-pxs2-aio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    const: aio
+
+  clocks:
+    maxItems: 1
+
+  reset-names:
+    const: aio
+
+  resets:
+    maxItems: 1
+
+  socionext,syscon:
+    description: |
+      Specifies a phandle to soc-glue, which is used for changing mode of S/PDIF
+      signal pin to output from Hi-Z. This property is optional if you use I2S
+      signal pins only.
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  "#sound-dai-cells":
+    const: 1
+
+patternProperties:
+  "^port@[0-9]$":
+    type: object
+    properties:
+      endpoint: true
+    required:
+      - endpoint
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+  - reset-names
+  - resets
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    audio@56000000 {
+        compatible = "socionext,uniphier-ld20-aio";
+        reg = <0x56000000 0x80000>;
+        interrupts = <0 144 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_aout>;
+        clock-names = "aio";
+        clocks = <&sys_clk 40>;
+        reset-names = "aio";
+        resets = <&sys_rst 40>;
+        #sound-dai-cells = <1>;
+        socionext,syscon = <&soc_glue>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/uniphier,aio.txt b/Documentation/devicetree/bindings/sound/uniphier,aio.txt
deleted file mode 100644
index 4ce68ed6f2f2..000000000000
--- a/Documentation/devicetree/bindings/sound/uniphier,aio.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Socionext UniPhier SoC audio driver
-
-The Socionext UniPhier audio subsystem consists of I2S and S/PDIF blocks in
-the same register space.
-
-Required properties:
-- compatible      : should be one of the following:
-		    "socionext,uniphier-ld11-aio"
-		    "socionext,uniphier-ld20-aio"
-		    "socionext,uniphier-pxs2-aio"
-- reg             : offset and length of the register set for the device.
-- interrupts      : should contain I2S or S/PDIF interrupt.
-- pinctrl-names   : should be "default".
-- pinctrl-0       : defined I2S signal pins for an external codec chip.
-- clock-names     : should include following entries:
-                    "aio"
-- clocks          : a list of phandle, should contain an entry for each
-                    entry in clock-names.
-- reset-names     : should include following entries:
-                    "aio"
-- resets          : a list of phandle, should contain an entry for each
-                    entry in reset-names.
-- #sound-dai-cells: should be 1.
-
-Optional properties:
-- socionext,syscon: a phandle, should contain soc-glue.
-                    The soc-glue is used for changing mode of S/PDIF signal pin
-                    to Output from Hi-Z. This property is optional if you use
-                    I2S signal pins only.
-
-Example:
-	audio {
-		compatible = "socionext,uniphier-ld20-aio";
-		reg = <0x56000000 0x80000>;
-		interrupts = <0 144 4>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_aout>;
-		clock-names = "aio";
-		clocks = <&sys_clk 40>;
-		reset-names = "aio";
-		resets = <&sys_rst 40>;
-		#sound-dai-cells = <1>;
-
-		socionext,syscon = <&sg>;
-	};
-- 
2.25.1

