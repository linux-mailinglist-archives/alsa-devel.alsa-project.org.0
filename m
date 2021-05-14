Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734738076A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 12:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD721793;
	Fri, 14 May 2021 12:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD721793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620988578;
	bh=DDoVwHJswjCHMxYrjMgN+/453iYHewyRWAS+fkUXFHc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+RfltxU6/3l4vScCQPRsd2OYLzFInS3MTakSUAXGd2FwmAjpTTKbc+f2ElPv2Krz
	 SgZiYtsDMXdbnI7BAfJS2MwYXjlAJqYOpJ/N/rmbEDEprS/YdMkSt0KLCoRqG0I9pU
	 kMJW9jKXnExM0ejf1c/VCskN8s297FAMqFOfX5VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6E9F80424;
	Fri, 14 May 2021 12:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C42DF802CA; Fri, 14 May 2021 12:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F569F800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 12:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F569F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="v8Qa6dnj"
Received: by mail-wr1-x431.google.com with SMTP id a4so29600358wrr.2
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6IVmdNErSbJCcWPJI67FAC2+nK9/b0e6sFSeGCLR6M=;
 b=v8Qa6dnjq9wMEWz+442c0OQVXsnPNHAxBHFxyyCcYfQhFjpY/c0+hJkqRY/I0KXxa+
 izOjIc4eH2DNbruP6LE7htolLLU27jcZFCXuT2bnBPDnaNttxq0fnOq91JbC3HP1U89t
 uj0ZT6vVqwn6z5jY/jmHt9W4VV27SrCyp7AlbbH6an6rDxY63+dyvWtGX8bap5cuHUIy
 PqbhWsUto1/Q4ZuUG8htxUauIk+qyGaxWHsAGO02HqXNgYeSZ6nUHHzBtUcwDXImVfWC
 0QYaLyV0lTsG0QOrlrUkFbyllIoe9zvVgsGrc6e7mx3AUCeJvNMppnLOU3R6w4nedYxE
 woUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6IVmdNErSbJCcWPJI67FAC2+nK9/b0e6sFSeGCLR6M=;
 b=E+rCEdHvj7qcfqamrD+xeA/Q/+K5IOpVD8OAvRl6E1WM3vzPenJT3L6v2CPyisXyYe
 GzqkGuv/R6lf3WvVvqwNEhcjM4eWrAWWLQzuP0yMeAZqxUuCjq4JV7d9qJAgcQfahmMj
 adociX8MX5o7YfErr3zzX7vD3CVpFJJiJ/6ueEwNY77PIVvMVo0KCwiHJ+FLR3ULywLO
 L6GDX9xbY1zYetNalQvCbl+4h7MMzHEXpVQi5oyR0BUtbh7R9xSsdysseOJ2DXPTLoLA
 o1gNuy0FQBvCXYe7tx/olWsU/edMMWIoPYlkkT9dhFetmenfTWeUL19VQJanzc0LrCnM
 5zEw==
X-Gm-Message-State: AOAM531poKiUzUv/3UsZy22N7Y7aER/DoYHMMh9uanE0Imb0n72Y93i+
 OSG6pOBXb1SA2QzcC/8zi+PZxQ==
X-Google-Smtp-Source: ABdhPJyGmsyH267lT761uXW0aAKfR+k8LUXdJU2rItvkhxcZy2MUXzqL/A3o1mU+ZJA+9eeU4D9HIg==
X-Received: by 2002:adf:f212:: with SMTP id p18mr20455322wro.318.1620988470155; 
 Fri, 14 May 2021 03:34:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id k16sm5015498wmi.44.2021.05.14.03.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 03:34:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 1/9] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
Date: Fri, 14 May 2021 11:33:57 +0100
Message-Id: <20210514103405.29927-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210514103405.29927-1-srinivas.kandagatla@linaro.org>
References: <20210514103405.29927-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire device RX and
TX respectively, supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs, MBHC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd938x.yaml          | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
new file mode 100644
index 000000000000..d62d99981ea8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd938x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WCD9380/WCD9385 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9380-codec
+      - qcom,wcd9385-codec
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-rxtx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description: A reference to Soundwire rx device phandle
+
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias4-microvolt:
+    description: micbias4 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,hphl-jack-type-normally-closed:
+    description: Indicates that HPHL jack switch type is normally closed
+    type: boolean
+
+  qcom,ground-jack-type-normally-closed:
+    description: Indicates that Headset Ground switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-headset-vthreshold-microvolt:
+    description: Voltage threshold value for headset detection
+    minimum: 0
+    maximum: 2850000
+
+  qcom,mbhc-headphone-vthreshold-microvolt:
+    description: Voltage threshold value for headphone detection
+    minimum: 0
+    maximum: 2850000
+
+  qcom,mbhc-buttons-vthreshold-microvolt:
+    description:
+      Array of 8 Voltage threshold values corresponding to headset
+      button0 - button7
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reset-gpios
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - qcom,micbias4-microvolt
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "qcom,wcd9380-codec";
+        reset-gpios = <&tlmm 32 0>;
+        #sound-dai-cells = <1>;
+        qcom,tx-device = <&wcd938x_tx>;
+        qcom,rx-device = <&wcd938x_rx>;
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,micbias4-microvolt = <1800000>;
+        qcom,hphl-jack-type-normally-closed;
+        qcom,ground-jack-type-normally-closed;
+        qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+    };
+
+    /* ... */
+
+    soundwire@3210000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03210000 0x2000>;
+        wcd938x_rx: codec@0,4 {
+            compatible = "sdw20217010d00";
+            reg  = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010d00";
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.21.0

