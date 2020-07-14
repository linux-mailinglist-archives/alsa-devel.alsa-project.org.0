Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F78421EB12
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 10:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFB31673;
	Tue, 14 Jul 2020 10:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFB31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594714360;
	bh=oCWplq/pf+AP33lyQhjIlLJx6r5dYu32JkewtZFvhrU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W736DCkbyMJhecmK7T5Lxv80AnGR8uEVzjCcIUGNxmaDhGSb2M7way3FEPuzrsQ5n
	 IkF2e7yy1O6BMDqmZfvD5fyU2YYIZujzA/QFiTxK1PMje9J8C3WfmWW9DpqNf7UDxL
	 FH0ZzNPgcBYyUl/Ztf9mHuzFs2r/hdsfDvPrkseM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 799AAF800E5;
	Tue, 14 Jul 2020 10:10:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406A8F8020C; Tue, 14 Jul 2020 10:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17334F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 10:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17334F800E5
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06E8A6nX049094;
 Tue, 14 Jul 2020 17:10:06 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Tue, 14 Jul 2020 17:10:06 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (121.252.232.153.ap.dti.ne.jp
 [153.232.252.121]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06E8A1Zq049060
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 Jul 2020 17:10:06 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: sound: convert ROHM BD28623 amplifier binding to
 yaml
Date: Tue, 14 Jul 2020 17:09:59 +0900
Message-Id: <20200714081000.177914-1-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This patch converts ROHM BD28623UMV class D speaker amplifier binding
to DT schema.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/rohm,bd28623.txt           | 29 ---------
 .../bindings/sound/rohm,bd28623.yaml          | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.yaml

diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.txt b/Documentation/devicetree/bindings/sound/rohm,bd28623.txt
deleted file mode 100644
index d84557c2686e..000000000000
--- a/Documentation/devicetree/bindings/sound/rohm,bd28623.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-ROHM BD28623MUV Class D speaker amplifier for digital input
-
-This codec does not have any control buses such as I2C, it detect format and
-rate of I2S signal automatically. It has two signals that can be connected
-to GPIOs: reset and mute.
-
-Required properties:
-- compatible      : should be "rohm,bd28623"
-- #sound-dai-cells: should be 0.
-- VCCA-supply     : regulator phandle for the VCCA supply
-- VCCP1-supply    : regulator phandle for the VCCP1 supply
-- VCCP2-supply    : regulator phandle for the VCCP2 supply
-
-Optional properties:
-- reset-gpios     : GPIO specifier for the active low reset line
-- mute-gpios      : GPIO specifier for the active low mute line
-
-Example:
-
-	codec {
-		compatible = "rohm,bd28623";
-		#sound-dai-cells = <0>;
-
-		VCCA-supply = <&vcc_reg>;
-		VCCP1-supply = <&vcc_reg>;
-		VCCP2-supply = <&vcc_reg>;
-		reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
-		mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
new file mode 100644
index 000000000000..acd8609252b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rohm,bd28623.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD28623MUV Class D speaker amplifier for digital input
+
+description:
+  This codec does not have any control buses such as I2C, it detect
+  format and rate of I2S signal automatically. It has two signals
+  that can be connected to GPIOs reset and mute.
+
+maintainers:
+  - Katsuhiro Suzuki <katsuhiro@katsuster.net>
+
+properties:
+  compatible:
+    const: rohm,bd28623
+
+  "#sound-dai-cells":
+    const: 0
+
+  VCCA-supply:
+    description:
+      regulator phandle for the VCCA (for analog) power supply
+
+  VCCP1-supply:
+    description:
+      regulator phandle for the VCCP1 (for ch1) power supply
+
+  VCCP2-supply:
+    description:
+      regulator phandle for the VCCP2 (for ch2) power supply
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for the active low reset line
+
+  mute-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for the active low mute line
+
+required:
+  - compatible
+  - VCCA-supply
+  - VCCP1-supply
+  - VCCP2-supply
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    codec {
+      compatible = "rohm,bd28623";
+      #sound-dai-cells = <0>;
+
+      VCCA-supply = <&vcc_reg>;
+      VCCP1-supply = <&vcc_reg>;
+      VCCP2-supply = <&vcc_reg>;
+      reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+      mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+    };
-- 
2.27.0

