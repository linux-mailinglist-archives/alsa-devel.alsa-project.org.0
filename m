Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B14D9F57
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 16:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3008018E5;
	Tue, 15 Mar 2022 16:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3008018E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647359563;
	bh=W1rVvpRm3s1Tv74xzLLvf2qCMAmvOeaoIXzf9dWgcQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T8jolS4LNDx0CFo5JdDuia7PpJ4JRbeYgx+e9i9I/6oxXvZD8qkvuPtVKuKZDQ32n
	 +OYN4eDkLB01RMoa7gbsk3FG4Er2pmQtJ+apM0MrdO5+Qqh8Ib6kvfYgJ0w7T/SpEA
	 zltT7OreDc2SpryiNuzMzKKBp4uBmdmjNRY+TYU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEC6F8024C;
	Tue, 15 Mar 2022 16:51:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15000F801F7; Tue, 15 Mar 2022 16:51:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F11C2F80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 16:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F11C2F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="oNkOQkbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647359457; x=1678895457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rKR8R2xrvVMhCLJudTmph3ry8li11n/7voUDkq7zraY=;
 b=oNkOQkbEkeLO6qoL2UkaSqjfh98JgmkXnRS4j0A1b5JtztQnE+rSStNJ
 pLCZ18G+CKy9Id/5EUDF5A0ROW7t5Bkjk0qXK0okA6BFl+q+yBrxLo8aL
 8ftU1g6tlrZGZ0xo4437zzu4Ky6g2UNtzaQ4ZgNrMKkvvjmJXO9hmig+5 E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 08:50:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:50:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 08:50:38 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 08:50:32 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v11 1/7] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
Date: Tue, 15 Mar 2022 21:20:07 +0530
Message-ID: <1647359413-31662-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Change generic lpass lpi pincotrol bindings file to SoC specific file,
to distinguish and accomadate other SoC specific dt bindings.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 133 ---------------------
 .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 133 +++++++++++++++++++++
 2 files changed, 133 insertions(+), 133 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
deleted file mode 100644
index 5c5542f..0000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
+++ /dev/null
@@ -1,133 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
-
-maintainers:
-  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
-
-properties:
-  compatible:
-    const: qcom,sm8250-lpass-lpi-pinctrl
-
-  reg:
-    minItems: 2
-    maxItems: 2
-
-  clocks:
-    items:
-      - description: LPASS Core voting clock
-      - description: LPASS Audio voting clock
-
-  clock-names:
-    items:
-      - const: core
-      - const: audio
-
-  gpio-controller: true
-
-  '#gpio-cells':
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
-#PIN CONFIGURATION NODES
-patternProperties:
-  '-pins$':
-    type: object
-    description:
-      Pinctrl node's client devices use subnodes for desired pin configuration.
-      Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
-
-    properties:
-      pins:
-        description:
-          List of gpio pins affected by the properties specified in this
-          subnode.
-        items:
-          oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9])$"
-        minItems: 1
-        maxItems: 14
-
-      function:
-        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data, qua_mi2s_ws,
-                qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
-                dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
-                i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
-        description:
-          Specify the alternative function to be configured for the specified
-          pins.
-
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-            0: No adjustments
-            1: Higher Slew rate (faster edges)
-            2: Lower Slew rate (slower edges)
-            3: Reserved (No adjustments)
-
-      bias-pull-down: true
-
-      bias-pull-up: true
-
-      bias-disable: true
-
-      output-high: true
-
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
-allOf:
-  - $ref: "pinctrl.yaml#"
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/sound/qcom,q6afe.h>
-    lpi_tlmm: pinctrl@33c0000 {
-        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
-        reg = <0x33c0000 0x20000>,
-              <0x3550000 0x10000>;
-        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-        clock-names = "core", "audio";
-        gpio-controller;
-        #gpio-cells = <2>;
-        gpio-ranges = <&lpi_tlmm 0 0 14>;
-    };
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
new file mode 100644
index 0000000..06efb13
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
+  Low Power Island (LPI) TLMM block
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  LPASS LPI IP on most Qualcomm SoCs
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-lpi-pinctrl
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9])$"
+        minItems: 1
+        maxItems: 14
+
+      function:
+        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data, qua_mi2s_ws,
+                qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
+                dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
+                i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
+                dmic3_data, i2s2_data ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      slew-rate:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+            0: No adjustments
+            1: Higher Slew rate (faster edges)
+            2: Lower Slew rate (slower edges)
+            3: Reserved (No adjustments)
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    lpi_tlmm: pinctrl@33c0000 {
+        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
+        reg = <0x33c0000 0x20000>,
+              <0x3550000 0x10000>;
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 14>;
+    };
-- 
2.7.4

