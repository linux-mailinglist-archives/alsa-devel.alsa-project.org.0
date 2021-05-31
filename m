Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FF39559F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 08:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8678784C;
	Mon, 31 May 2021 08:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8678784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622443786;
	bh=lw4a5Q5vhRSQw/77uutfzwO4FGqp/4ECYF1DLGcl1RE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u9Ex1v/Agj5uvnw1eoHlPozMqDoIL0BSh/HeaAgx59OY11XBU/+o1fGYnssHyrk/R
	 tJawPsBP2PFLooLmfhIljEuL28vOVXCBnTNjpBJltMS6GoXxkfQTSy6cqNjgnsHEZj
	 UDjip2EMmsV1ZUEUbAg11gHlwAzqVwLlR37q5Zps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16925F80161;
	Mon, 31 May 2021 08:48:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 477EDF80161; Mon, 31 May 2021 08:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B668F80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 08:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B668F80161
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1lnbiM-00075e-5c; Mon, 31 May 2021 08:47:54 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1lnbiL-0002Kp-0x; Mon, 31 May 2021 08:47:53 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] ASoC: dt-bindings: Convert imx-audmux binding to json
 schema
Date: Mon, 31 May 2021 08:47:52 +0200
Message-Id: <20210531064752.8809-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Convert the imx-audmux binding to DT schema format using json-schema

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
changes v2:
- fix yamllint warnings

 .../devicetree/bindings/sound/imx-audmux.txt  |  28 -----
 .../devicetree/bindings/sound/imx-audmux.yaml | 119 ++++++++++++++++++
 2 files changed, 119 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audmux.txt
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audmux.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.txt b/Documentation/devicetree/bindings/sound/imx-audmux.txt
deleted file mode 100644
index 2db4dcbee1b9..000000000000
--- a/Documentation/devicetree/bindings/sound/imx-audmux.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Freescale Digital Audio Mux (AUDMUX) device
-
-Required properties:
-
-  - compatible		: "fsl,imx21-audmux" for AUDMUX version firstly used
-			  on i.MX21, or "fsl,imx31-audmux" for the version
-			  firstly used on i.MX31.
-
-  - reg			: Should contain AUDMUX registers location and length.
-
-An initial configuration can be setup using child nodes.
-
-Required properties of optional child nodes:
-
-  - fsl,audmux-port	: Integer of the audmux port that is configured by this
-			  child node.
-
-  - fsl,port-config	: List of configuration options for the specific port.
-			  For imx31-audmux and above, it is a list of tuples
-			  <ptcr pdcr>. For imx21-audmux it is a list of pcr
-			  values.
-
-Example:
-
-audmux@21d8000 {
-	compatible = "fsl,imx6q-audmux", "fsl,imx31-audmux";
-	reg = <0x021d8000 0x4000>;
-};
diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
new file mode 100644
index 000000000000..dab45c310670
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/imx-audmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Digital Audio Mux device
+
+maintainers:
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx27-audmux
+          - const: fsl,imx21-audmux
+      - items:
+          - enum:
+              - fsl,imx25-audmux
+              - fsl,imx35-audmux
+              - fsl,imx50-audmux
+              - fsl,imx51-audmux
+              - fsl,imx53-audmux
+              - fsl,imx6q-audmux
+              - fsl,imx6sl-audmux
+              - fsl,imx6sll-audmux
+              - fsl,imx6sx-audmux
+          - const: fsl,imx31-audmux
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: audmux
+
+patternProperties:
+  "^mux-[0-9a-z]*$":
+    type: object
+    properties:
+      fsl,audmux-port:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Integer of the audmux port that is configured by this child node
+
+      fsl,port-config:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          List of configuration options for the specific port.
+          For imx31-audmux and above, it is a list of tuples ptcr pdcr.
+          For imx21-audmux it is a list of pcr values.
+
+    required:
+      - fsl,audmux-port
+      - fsl,port-config
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    audmux@21d8000 {
+        compatible = "fsl,imx6q-audmux", "fsl,imx31-audmux";
+        reg = <0x021d8000 0x4000>;
+    };
+  - |
+    audmux@10016000 {
+        compatible = "fsl,imx27-audmux", "fsl,imx21-audmux";
+        reg = <0x10016000 0x1000>;
+        clocks = <&clks 1>;
+        clock-names = "audmux";
+
+        mux-ssi0 {
+            fsl,audmux-port = <0>;
+            fsl,port-config = <0xcb205000>;
+        };
+
+        mux-pins4 {
+            fsl,audmux-port = <2>;
+            fsl,port-config = <0x00001000>;
+        };
+    };
+  - |
+    #include <dt-bindings/sound/fsl-imx-audmux.h>
+    audmux@21d8000 {
+        compatible = "fsl,imx6q-audmux", "fsl,imx31-audmux";
+        reg = <0x021d8000 0x4000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_audmux>;
+
+        mux-ssi1 {
+            fsl,audmux-port = <0>;
+            fsl,port-config = <
+                IMX_AUDMUX_V2_PTCR_SYN		0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
+                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
+              >;
+        };
+
+        mux-pins3 {
+            fsl,audmux-port = <2>;
+            fsl,port-config = <
+                IMX_AUDMUX_V2_PTCR_SYN          IMX_AUDMUX_V2_PDCR_RXDSEL(0)
+                0                               IMX_AUDMUX_V2_PDCR_TXRXEN
+              >;
+        };
+    };
-- 
2.29.2

