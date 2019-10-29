Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E55EAE8707
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 12:31:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA02F2226;
	Tue, 29 Oct 2019 12:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA02F2226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572348691;
	bh=pEYC0Op9MaZrpVz5BX7C9dMnjnXo4meKD/zHalNavtE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIrdwftwq4Irzp+TH1lkgW+IYDFZR0w0RT19puhLd8g0v+d5cIEJSNDUbHveuPn84
	 H93jFnKw+zpKO2weO9tY86mLQnQwPbqHWU7uZDFeXJh0ZW8mwCGh3VY0NLVUwm4a/m
	 mLX5BUtOd5633tXcgsTxvc8Krl3pJ8DDvBkuO9+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F008F805FC;
	Tue, 29 Oct 2019 12:29:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9543F80392; Tue, 29 Oct 2019 12:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11440F8015A
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 12:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11440F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PU3WiNMq"
Received: by mail-wr1-x434.google.com with SMTP id p4so13212250wrm.8
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 04:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=180LRLtVibZuNEGVjJ0cua0pIuWoyx489HZ44l4xhjA=;
 b=PU3WiNMq4xmp4SOp6Nym7RsV7fF+pmSZrVhFa9Gghmlmjgf+AD0zD45oHeA/l0A9hd
 dncbpaNvA995dWoQzYXMncMDHWjUz2K8lA2llvlp3SUG9GF9KX/AILx286Giop9GPLYs
 VrQ+D1Ck9AbEKVZy+EqhtjTLkXLu+6cCvfD+j6dJmaOCgZUmJYTPoIsVO1cpLRDb4kDt
 x8PvNumAgLUgcSLWhwLYtWnM5OlbC0DjZcxsOx4jUxNRlPNFTJe2gkVRvCD4YXaplNvJ
 I983YTh9IAr2CrcP1nYaUEkvSTknzLXbW9/CkHu3DuIT6+tJi4jmB/nZeuZG6IqvZbHV
 LWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=180LRLtVibZuNEGVjJ0cua0pIuWoyx489HZ44l4xhjA=;
 b=Zr3lUZ87IknKFmbCtBkh1gLD5ca0XrxEIXAi8pDbzAqCjXZoJ60YOKCPWrwSnCfjSB
 7jzUZj6cOxut+fIagbsEWMYRkFnVjLfO2ie7EN7YLQGvpENATiiRHce/RKUx4YG9tSun
 L7XEI08PBVBEk5VHVlyqk1V69EaaLhDUC6kpltHq0gZTGQoDtubVhEjyfdql7zoHjzXW
 4J1oLVuHPQ2wyyEkhN91v9q4QWj8Ci/L1HKZwQBdM+6bAYQ+zTe9v9rZf3ZNuah2eqgI
 wFNnQpa64WNl+LUiAmLQO2B8AT4P2KG9U5bxaO/BKgo5nN+4MX8gMrjptS1ZZ8Y6Y6zZ
 Ugjw==
X-Gm-Message-State: APjAAAVRoSKafi1az0q8btlcaw+TJV4ezXZjgkgtaxSMZdnQahJmQh91
 1cSz0ASCJsjK4hY5WvPkYvnT0Q==
X-Google-Smtp-Source: APXvYqz/VlwMWdr1F9+5qfi54fdp3VoiqQnl4Rgoi5UDLE6O6zU2YfnT5c/Y4aEp2jbXV2z6+j0JDQ==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr18948240wrs.360.1572348532034; 
 Tue, 29 Oct 2019 04:28:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 04:28:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Tue, 29 Oct 2019 11:26:50 +0000
Message-Id: <20191029112700.14548-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 01/11] ASoC: dt-bindings: add dt bindings
	for WCD9340/WCD9341 audio codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings for wcd9340/wcd9341 audio codec which can
support both SLIMbus and I2S/I2C interface.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd934x.yaml          | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
new file mode 100644
index 000000000000..d6cfde6597db
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
+  It has in-built Soundwire controller, pin controller, interrupt mux and
+  supports both I2S/I2C and SLIMbus audio interfaces.
+
+properties:
+  compatible:
+    const: slim217,250
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  slim-ifc-dev:
+    description: SLIMBus Interface device phandle
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-buck-sido-supply:
+    description: A reference to the 1.8V SIDO buck supply
+
+  vdd-rx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-tx-supply:
+    description: A reference to the 1.8V tx supply
+
+  vdd-vbat-supply:
+    description: A reference to the vbat supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-micbias-supply:
+    description: A reference to the micbias supply
+
+  qcom,micbias1-microvolts:
+    description: micbias1 voltage between 1800000 - 2850000 microvolts
+
+  qcom,micbias2-microvolts:
+    description: micbias2 voltage between 1800000 - 2850000 microvolts
+
+  qcom,micbias3-microvolts:
+    description: micbias3 voltage between 1800000 - 2850000 microvolts
+
+  qcom,micbias4-microvolts:
+    description: micbias4 voltage between 1800000 - 2850000 microvolts
+
+  clock-output-names:
+    const: mclk
+
+  clock-frequency:
+    description: Clock frequency of output clk in Hz
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#sound-dai-cells':
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description: |
+      WCD934x subnode for each slave devices. Bindings of each subnodes
+      depends on the specific driver providing the functionality and
+      documented in their respective bindings.
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - slim-ifc-dev
+  - interrupts
+  - interrupt-controller
+  - clock-frequency
+  - clock-output-names
+  - qcom,micbias1-microvolts
+  - qcom,micbias2-microvolts
+  - qcom,micbias3-microvolts
+  - qcom,micbias4-microvolts
+  - "#interrupt-cells"
+  - "#clock-cells"
+  - "#sound-dai-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    codec@1,0{
+        compatible = "slim217,250";
+        reg  = <1 0>;
+        reset-gpios = <&tlmm 64 0>;
+        slim-ifc-dev  = <&wcd9340_ifd>;
+        #sound-dai-cells = <1>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <54 4>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        #clock-cells = <0>;
+        clock-frequency = <9600000>;
+        clock-output-names = "mclk";
+        qcom,micbias1-microvolts = <1800000>;
+        qcom,micbias2-microvolts = <1800000>;
+        qcom,micbias3-microvolts = <1800000>;
+        qcom,micbias4-microvolts = <1800000>;
+        clock-names = "extclk";
+        clocks = <&rpmhcc 2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pinctrl@42 {
+            reg = <0x42 0x2>;
+        };
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
