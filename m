Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B1638DA8B
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 10:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EEB0169E;
	Sun, 23 May 2021 10:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EEB0169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621759128;
	bh=vwUL/WCTZ/mf3CwAz6VIfQYsS78KkH2Ea/2bNuSJgiI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L9aS3oYPEzp18rilyCNl67qfIalNVyKxGDVYjX6STlQ7ogYs1H6S4YPP8dk4zXVMj
	 A7/e5uNiKFe0uHSsBIsLWCt5BXTi/5rhVlNDl30rz1TVGExf3zLpz1v74w+ow+iKLj
	 YYWpL2jEP6uTkLPOSuFDpoJmDKc0mjr0l0gAcmM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F94F80274;
	Sun, 23 May 2021 10:37:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AC6DF80258; Fri, 21 May 2021 14:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20AC7F801DB
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 14:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20AC7F801DB
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1lk49k-0001uY-5Z; Fri, 21 May 2021 14:21:32 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1lk49i-0000NB-Rf; Fri, 21 May 2021 14:21:30 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1] ASoC: dt-bindings: Convert imx-audmux binding to json
 schema
Date: Fri, 21 May 2021 14:21:29 +0200
Message-Id: <20210521122129.1371-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sun, 23 May 2021 10:37:03 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
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
---
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
index 000000000000..6078ce13bd46
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
+        - enum:
+          - fsl,imx27-audmux
+        - const: fsl,imx21-audmux
+      - items:
+        - enum:
+          - fsl,imx25-audmux
+          - fsl,imx35-audmux
+          - fsl,imx50-audmux
+          - fsl,imx51-audmux
+          - fsl,imx53-audmux
+          - fsl,imx6q-audmux
+          - fsl,imx6sl-audmux
+          - fsl,imx6sll-audmux
+          - fsl,imx6sx-audmux
+        - const: fsl,imx31-audmux
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

