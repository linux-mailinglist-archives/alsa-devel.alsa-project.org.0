Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598805EE02F
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:23:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 043AC163E;
	Wed, 28 Sep 2022 17:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 043AC163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378635;
	bh=h7bJe1aaqRVDiS5yDhSup8h7F+h7Cp7Pp1fSw8JdqOM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbkgZ7kHuPImC8SI2js7Dlyy+KqgRatoxaiSzhnQ3GaWgnXaESOMbtPAwCLf6D8Bt
	 6vXlD4unhQ8Y5IxATXa3BTjsh+xMj9Vl02y4NPwmu6CXB8BQMns5BEjbIdI/w01oiy
	 nZrewCcMIIfUUXvKGTHlYA1/TGUU0fkReO0AxrKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B85BF8057B;
	Wed, 28 Sep 2022 17:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E30F80578; Wed, 28 Sep 2022 17:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D3BF80109
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D3BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R+WzAjrw"
Received: by mail-lf1-x12c.google.com with SMTP id u18so20854955lfo.8
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ofHed6JKbGC+4Jz+O/EarTAHvckHPCUIcHhSeApLDCY=;
 b=R+WzAjrwXTKPt8JG0qQdtm0I3rM7cfNLmDoEhnuIP8T/UbqBz3qRX79XWlmipO8fZs
 m44HIDV+rzWoJ4wYItiHwHGVVBsUHlaUE/wMrz51vIbYB0T26jX8SUP7Hq9THE8NARkB
 +/80SWdHfsV51S93BS6f22IDvkVUYzKlMIUI0yFmpOAnr7SdOYgPiWhbUAZKH8rfQEJI
 dI1hDMULcC/euipaSFDx8t4EbSqpJ+r1uctDSGn2EsG5kRb2I8jSdjU0WAKmh185gm37
 VWMwr7IIFd1Brag/Q53nJxcxMl465g6b542tdhABXgA5sieAbtjS8RTPUOdsGKYoRPoj
 Bo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ofHed6JKbGC+4Jz+O/EarTAHvckHPCUIcHhSeApLDCY=;
 b=lGq07P+xITdjc7fx9xkDfHz+IkTmXUgQ/UN9s4WW5OECBX9F7O5QpUYxVpNJmRwc16
 AjJd9XxvpdZUdqQxWLBxCmWxocqQvfy0mo+t2PEvQA9iAwSd7iQ6sTp4WWlTrQ94odzZ
 jd/uiSyL+wz28wITUnAroSTRgp4RIcaypnuCZDE2Q0TgQfW9Kr852WJxtCh7jofzOuYk
 muB/lUu7ggX/7J1eTbRscUP5cTWmz3Ix9yJDgloooqq1N4Rg+ezCEKjM0tpDA+pIz0Fh
 pmqbRdwrIrKLoDGvmNBGsdCEnY72boVn6vDug77Ju7jEspvWKhe+0nFCL7GSSMXAfICB
 ZvAQ==
X-Gm-Message-State: ACrzQf00J+XgN8gvX/1vkmSmA9s1ang6F+G/8MEsVViGtqFEpaalKgpp
 itNJ7bxQjmGj1x2C7dVq65UUIw==
X-Google-Smtp-Source: AMsMyM5hx9BsNx3ycsMIfsneHfvlKV199tp4F1osXnDzUTkIn2J7KpBFTyiictm0nkFeygHz5tz+tA==
X-Received: by 2002:a05:6512:1327:b0:4a0:4539:cad8 with SMTP id
 x39-20020a056512132700b004a04539cad8mr11692293lfu.460.1664378443391; 
 Wed, 28 Sep 2022 08:20:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 09/11] dt-bindings: slimbus: convert bus description to DT
 schema
Date: Wed, 28 Sep 2022 17:20:25 +0200
Message-Id: <20220928152027.489543-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Convert the SLIMbus bus description bindings to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/slimbus/bus.txt       | 60 ------------
 .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  2 -
 .../bindings/slimbus/slim-qcom-ctrl.txt       |  3 -
 .../devicetree/bindings/slimbus/slimbus.yaml  | 95 +++++++++++++++++++
 4 files changed, 95 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/slimbus.yaml

diff --git a/Documentation/devicetree/bindings/slimbus/bus.txt b/Documentation/devicetree/bindings/slimbus/bus.txt
deleted file mode 100644
index bbe871f82a8b..000000000000
--- a/Documentation/devicetree/bindings/slimbus/bus.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-SLIM(Serial Low Power Interchip Media Bus) bus
-
-SLIMbus is a 2-wire bus, and is used to communicate with peripheral
-components like audio-codec.
-
-Required property for SLIMbus controller node:
-- compatible	- name of SLIMbus controller
-
-Child nodes:
-Every SLIMbus controller node can contain zero or more child nodes
-representing slave devices on the bus. Every SLIMbus slave device is
-uniquely determined by the enumeration address containing 4 fields:
-Manufacturer ID, Product code, Device index, and Instance value for
-the device.
-If child node is not present and it is instantiated after device
-discovery (slave device reporting itself present).
-
-In some cases it may be necessary to describe non-probeable device
-details such as non-standard ways of powering up a device. In
-such cases, child nodes for those devices will be present as
-slaves of the SLIMbus controller, as detailed below.
-
-Required property for SLIMbus child node if it is present:
-- reg		- Should be ('Device index', 'Instance ID') from SLIMbus
-		  Enumeration  Address.
-		  Device Index Uniquely identifies multiple Devices within
-		  a single Component.
-		  Instance ID Is for the cases where multiple Devices of the
-		  same type or Class are attached to the bus.
-
-- compatible	-"slimMID,PID". The textual representation of Manufacturer ID,
-	 	  Product Code, shall be in lower case hexadecimal with leading
-		  zeroes suppressed
-
-Optional property for SLIMbus child node if it is present:
-- slim-ifc-dev	- Should be phandle to SLIMBus Interface device.
-		  Required for devices which deal with streams.
-
-SLIMbus example for Qualcomm's slimbus manager component:
-
-	slim@28080000 {
-		compatible = "qcom,apq8064-slim", "qcom,slim";
-		reg = <0x28080000 0x2000>,
-		interrupts = <0 33 0>;
-		clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
-		clock-names = "iface", "core";
-		#address-cells = <2>;
-		#size-cell = <0>;
-
-		codec_ifd: ifd@0,0{
-			compatible = "slim217,60";
-			reg = <0 0>;
-		};
-
-		codec: wcd9310@1,0{
-			compatible = "slim217,60";
-			reg = <1 0>;
-			slim-ifc-dev  = <&codec_ifd>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
index e94a2ad3a710..7c3d9eb6af5d 100644
--- a/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
+++ b/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
@@ -5,8 +5,6 @@ with SLIMBus slaves directly over the bus using messaging interface and
 communicating with master component residing on ADSP for bandwidth and
 data-channel management
 
-Please refer to slimbus/bus.txt for details of the common SLIMBus bindings.
-
 - compatible:
 	Usage: required
 	Value type: <stringlist>
diff --git a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
index 922dcb8ff24a..6d955e129f90 100644
--- a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
+++ b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
@@ -4,9 +4,6 @@ master component.
 
 Required properties:
 
- - #address-cells - refer to Documentation/devicetree/bindings/slimbus/bus.txt
- - #size-cells	- refer to Documentation/devicetree/bindings/slimbus/bus.txt
-
  - reg : Offset and length of the register region(s) for the device
  - reg-names : Register region name(s) referenced in reg above
 	 Required register resource entries are:
diff --git a/Documentation/devicetree/bindings/slimbus/slimbus.yaml b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
new file mode 100644
index 000000000000..22513fb7c59a
--- /dev/null
+++ b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/slimbus/slimbus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SLIM (Serial Low Power Interchip Media) bus
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  SLIMbus is a 2-wire bus, and is used to communicate with peripheral
+  components like audio-codec.
+
+properties:
+  $nodename:
+    pattern: "^slim(@.*|-[0-9a-f])*$"
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^.*@[0-9a-f]+,[0-9a-f]+$":
+    type: object
+    description: |
+      Every SLIMbus controller node can contain zero or more child nodes
+      representing slave devices on the bus. Every SLIMbus slave device is
+      uniquely determined by the enumeration address containing 4 fields::
+      Manufacturer ID, Product code, Device index, and Instance value for the
+      device.
+
+      If child node is not present and it is instantiated after device
+      discovery (slave device reporting itself present).
+
+      In some cases it may be necessary to describe non-probeable device
+      details such as non-standard ways of powering up a device. In such cases,
+      child nodes for those devices will be present as slaves of the SLIMbus
+      controller.
+
+    properties:
+      compatible:
+        pattern: "^slim[0-9a-f]+,[0-9a-f]+$"
+
+      reg:
+        maxItems: 1
+        description: |
+          Pair of (device index, instande ID), where::
+           - Device index, which uniquely identifies multiple devices within a
+             single component.
+           - Instance ID, can be used for the cases where multiple devices of
+             the same type or class are attached to the bus.
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: true
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+    #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        slim@28080000 {
+            compatible = "qcom,apq8064-slim", "qcom,slim";
+            reg = <0x28080000 0x2000>, <0x80207c 4>;
+            reg-names = "ctrl", "slew";
+            interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
+            clock-names = "iface", "core";
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            audio-codec@1,0 {
+                compatible = "slim217,60";
+                reg = <1 0>;
+            };
+        };
+    };
-- 
2.34.1

