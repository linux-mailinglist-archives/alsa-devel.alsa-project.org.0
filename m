Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5E20365B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 14:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB83416B5;
	Mon, 22 Jun 2020 14:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB83416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592827482;
	bh=tC2xwMmzKVUwgjJ+G57ScG8Yen8hBj0G+9E6hh/31nI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZXIyWxPuDKsFFgO9Rq8etSG9OdNYwgi1jLl7QncHm85KOn/Y8FSfX+Tk3pZUPbImU
	 +IHpZRBK+dyVd1gELqJrA0v3vERXoQElBgL/m/iiifSFMftvJ9IQYNf6JrS9VRQpaX
	 HkUKNcq8VZ34+eVI8I4rW9bqzNajBr8ewks/DcoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 464A5F80162;
	Mon, 22 Jun 2020 14:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99076F8015B; Mon, 22 Jun 2020 14:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8CA3F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 14:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8CA3F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="vxcnk++B"
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 05MC3SgG001221;
 Mon, 22 Jun 2020 21:03:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05MC3SgG001221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1592827409;
 bh=XT5p7CGO0IRfglTH035B6VnJfGMRKyJLc0ZZJHRD7vI=;
 h=From:To:Cc:Subject:Date:From;
 b=vxcnk++Bh/HeR8KH8zvH64uyIKfNlEo5yYtjkH/52X7GM1W6grC2f/fYi44u3aO7Q
 Zc2ON3HRrNHrIwYGTB46c+hVPdBIm7VdJdRPcc0vBkE8AbS4NWlehCVdwMLA3ocXnd
 Fp4+7RwQrjN79zRVo/qK+/fuEDGxCGKISPdVIybR7Brvn/gY4LzKMnRS5+zWFSLvAx
 e2i8LWJkaUDzZ9+fC2LN3MqBFvdpx2HTj6FWUrQeljYW/wiBjM+SB0O6zjgA9uxkNb
 QWf8lMEh5XbIkTZScLcxASeXZ9n1+sgshBXwiDEQC6cw7q3+giUIxNaYP1pejGinkQ
 NPTj859DtiRwg==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: ASoC: Convert UniPhier EVEA codec to json-schema
Date: Mon, 22 Jun 2020 21:03:20 +0900
Message-Id: <20200622120320.454535-1-yamada.masahiro@socionext.com>
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

Convert the UniPhier EVEA sound codec binding to DT schema format.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../sound/socionext,uniphier-evea.yaml        | 62 +++++++++++++++++++
 .../bindings/sound/uniphier,evea.txt          | 26 --------
 2 files changed, 62 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/uniphier,evea.txt

diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
new file mode 100644
index 000000000000..7ac1c0140d5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/socionext,uniphier-evea.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UniPhier EVEA SoC-internal sound codec
+
+maintainers:
+  - <alsa-devel@alsa-project.org>
+
+properties:
+  compatible:
+    const: socionext,uniphier-evea
+
+  reg:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: evea
+      - const: exiv
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: evea
+      - const: exiv
+      - const: adamv
+
+  resets:
+    minItems: 3
+    maxItems: 3
+
+  "#sound-dai-cells":
+    const: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+  - reset-names
+  - resets
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    codec@57900000 {
+        compatible = "socionext,uniphier-evea";
+        reg = <0x57900000 0x1000>;
+        clock-names = "evea", "exiv";
+        clocks = <&sys_clk 41>, <&sys_clk 42>;
+        reset-names = "evea", "exiv", "adamv";
+        resets = <&sys_rst 41>, <&sys_rst 42>, <&adamv_rst 0>;
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/uniphier,evea.txt b/Documentation/devicetree/bindings/sound/uniphier,evea.txt
deleted file mode 100644
index 3f31b235f18b..000000000000
--- a/Documentation/devicetree/bindings/sound/uniphier,evea.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Socionext EVEA - UniPhier SoC internal codec driver
-
-Required properties:
-- compatible      : should be "socionext,uniphier-evea".
-- reg             : offset and length of the register set for the device.
-- clock-names     : should include following entries:
-                    "evea", "exiv"
-- clocks          : a list of phandle, should contain an entry for each
-                    entries in clock-names.
-- reset-names     : should include following entries:
-                    "evea", "exiv", "adamv"
-- resets          : a list of phandle, should contain reset entries of
-                    reset-names.
-- #sound-dai-cells: should be 1.
-
-Example:
-
-	codec {
-		compatible = "socionext,uniphier-evea";
-		reg = <0x57900000 0x1000>;
-		clock-names = "evea", "exiv";
-		clocks = <&sys_clk 41>, <&sys_clk 42>;
-		reset-names = "evea", "exiv", "adamv";
-		resets = <&sys_rst 41>, <&sys_rst 42>, <&adamv_rst 0>;
-		#sound-dai-cells = <1>;
-	};
-- 
2.25.1

