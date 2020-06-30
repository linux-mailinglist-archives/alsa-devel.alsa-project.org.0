Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F120F65F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 15:56:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63AB8168C;
	Tue, 30 Jun 2020 15:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63AB8168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593525395;
	bh=Dt279n77PQEKR/xibJdj9C4GoeEAmjEDVyBI3b1IscE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JRWTx+Z3VuDEGriMPvSuopMvbFC6rPbnhM7dMIK3PzOE+SOiX9lKhlesW5I80SDZt
	 rX6wgJN9KEFsttxyxydZhWQyQi5fCiURIlQC3WgAOZ5wMJ2PsBvUzdokkTFhOi22JN
	 HCHGUrgcDm4MyjEUXHybXbqqBHCOY8y1K2ivbY2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89988F800EA;
	Tue, 30 Jun 2020 15:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C22ADF801F2; Tue, 30 Jun 2020 15:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14DFAF80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 15:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14DFAF80135
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05UDsJKI069879;
 Tue, 30 Jun 2020 22:54:19 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp);
 Tue, 30 Jun 2020 22:54:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp)
Received: from localhost.localdomain (121.252.232.153.ap.dti.ne.jp
 [153.232.252.121]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05UDsFJk069836
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 30 Jun 2020 22:54:19 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: sound: convert rk3328 codec binding to yaml
Date: Tue, 30 Jun 2020 22:54:12 +0900
Message-Id: <20200630135412.718447-1-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
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

This patch converts Rockchip rk3328 audio codec binding to DT schema.
And adds description about "mclk" clock and fixes some errors in
original example.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/rockchip,rk3328-codec.txt  | 28 --------
 .../bindings/sound/rockchip,rk3328-codec.yaml | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
deleted file mode 100644
index 1ecd75d2032a..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Rockchip Rk3328 internal codec
-
-Required properties:
-
-- compatible: "rockchip,rk3328-codec"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- rockchip,grf: the phandle of the syscon node for GRF register.
-- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
-- clock-names: should be "pclk".
-- spk-depop-time-ms: speak depop time msec.
-
-Optional properties:
-
-- mute-gpios: GPIO specifier for external line driver control (typically the
-              dedicated GPIO_MUTE pin)
-
-Example for rk3328 internal codec:
-
-codec: codec@ff410000 {
-	compatible = "rockchip,rk3328-codec";
-	reg = <0x0 0xff410000 0x0 0x1000>;
-	rockchip,grf = <&grf>;
-	clocks = <&cru PCLK_ACODEC>;
-	clock-names = "pclk";
-	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
-	spk-depop-time-ms = 100;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
new file mode 100644
index 000000000000..525b48c2f5de
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3328-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk3328 internal codec
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3328-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for audio codec
+      - description: clock for I2S master clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the GRF register.
+
+  spk-depop-time-ms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 200
+    description:
+      Speaker depop time in msec.
+
+  mute-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for external line driver control (typically the
+      dedicated GPIO_MUTE pin)
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - rockchip,grf
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/rk3328-cru.h>
+    codec: codec@ff410000 {
+      compatible = "rockchip,rk3328-codec";
+      reg = <0xff410000 0x1000>;
+      clocks = <&cru PCLK_ACODECPHY>, <&cru SCLK_I2S1>;
+      clock-names = "pclk", "mclk";
+      rockchip,grf = <&grf>;
+      mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
+      spk-depop-time-ms = <100>;
+      #sound-dai-cells = <0>;
+    };
-- 
2.27.0

