Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60C800E22
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 16:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4C8E76;
	Fri,  1 Dec 2023 16:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4C8E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701443425;
	bh=mWJwSaSVD3XgzAsTKQAIK+4sHRaSB/e8uBoCOrJJHRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kf1w5LMTfQzSy5ls9Y49OomKGcAg4ufxCIR6gb7+BQJVOaTg9ziwnQMPtIibd2RDs
	 n4zssyBzfWaCMqba67sxepJxEZqHCg6Ueiy1Yn3aJc1fRflJKG+KRVwpuH36BjRRa2
	 R+Dk7lGHFEu68qd4lD7iWWsUC+5eRBx9SGXJyISw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA0FEF805E5; Fri,  1 Dec 2023 16:09:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C96F805F3;
	Fri,  1 Dec 2023 16:09:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E95BF805B0; Fri,  1 Dec 2023 16:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E28EF80166
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 16:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E28EF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TxH1WjYv
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bbb4de875so3093885e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 07:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443342; x=1702048142;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XsLuiRUcl36nuEUQhIDR6/wMADjrm/yz4rDk8pYcHg=;
        b=TxH1WjYv6m67bWVKHr5F7ebHcrSuwaySoLpTEGAWT1RE736xpaAt8fb1+qavAWwTht
         rEOiRrpVweBewTVdpANUJYSFmBslJAi4VH9pB6KHlXsSQjY5htXuhfKFzAXD3sW6gpPQ
         W7Zgh2sGsAWhOWfgUQeYiIoDdL/YkbIUMwKcp+//bxWjnDwtohN8+YFtU9tjVve/2RXm
         NQNHFAJrhW5ONnDrVy3j+2cUOiHy+N/wFbek+uC7dLW+WhzlFr32n0CtKYs2okRW8hdq
         d91cGTZKPp5G9vbPMdnMybk9wfpMelfOf0hsOLXzPcywJWpfkhbcYS6jZpbLR1DGBIT6
         pLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443342; x=1702048142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XsLuiRUcl36nuEUQhIDR6/wMADjrm/yz4rDk8pYcHg=;
        b=womelrEj+1uMvIWZ7UiZtE4W2aPezzhi4FQ4Pb7puevuUe9JqOHuqnumYqKhF8lor9
         DvCLPiD2S9yYcOZrZMMPk3tJMm3sISRq1Euzaq0tzLn/9ykY1R4Iy4sjQsFyHZ4QCnTY
         FOPMZ8ZyhrsgYcLJlbf+IS/JSlhIH6JOV5pavCvI2TAnzjqrmdsTmvFarYxgX381h8LA
         ZTlnMDwe9NYskSsTwUzQplerl/dpusCOJhnzTMEhhdkUYhPpcBD6SSwhlWB4ZqByfsoX
         qiLZDssTm9n4+jLz/a/aHOmeqqS3ZO/yZW0c0IlVkFvbhcEJzmcrvr1BFK5A9JgYP7o8
         tGvg==
X-Gm-Message-State: AOJu0YzIY61rGzyr5ZKa2iEuWLUP+/2saaTi55nx+aVmX+lxoWGwESje
	EukNZoZc5/jzgwA3DNpc/cxcGA==
X-Google-Smtp-Source: 
 AGHT+IEwFSqRwLE0S6z19fYJUigSGSe/Lu9/AOWHA4ZBfp800Zqya6nMl0xRFRT+G2toL+v80OukIA==
X-Received: by 2002:a05:6512:15a4:b0:50b:bd9c:8b0 with SMTP id
 bp36-20020a05651215a400b0050bbd9c08b0mr910702lfb.19.1701443341914;
        Fri, 01 Dec 2023 07:09:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 fs20-20020a05600c3f9400b0040b5517ae31sm8569539wmb.6.2023.12.01.07.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:09:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 01 Dec 2023 16:08:55 +0100
Subject: [PATCH v2 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-2-94ed814b25aa@linaro.org>
References: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
In-Reply-To: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6444;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mWJwSaSVD3XgzAsTKQAIK+4sHRaSB/e8uBoCOrJJHRY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlafcI+CFIkmDxQv6JZxNpc6BcOs7M809vJRw7TPfG
 /EvKkRCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWn3CAAKCRB33NvayMhJ0UVaD/
 sHUXq/75jcU9Ng/rmV7whQfVTtgNB2acYdQtrZ8iBTn0wGGknC0tDN3aqCLnZ2zRBfNaLdgE8dBmDI
 O/39aGdQyi6x+pqYLwt/lFitMMq/+bf7e9F3/aVicanNTR4ysPZwDsrSKdsNYTEzlZlYW+BVsSjXbQ
 ync93+UUsFxHwFsTjVV0tZ95rfbvb6LAMTueaOKN8IQRmMgmVp8bEY/sTjwBjf6o/KhR4GvU7B+Xc2
 8eF6JtANnWXhkeoXrR++ZLAPZWveKSuN7mTS4Rh6ksfzvPOhgla6zY6HiBxBHhxagNVUc6N4uxxMOp
 Sl4r79yy4ftpBXE/Dts8kJYp3OV9sZUaZeVANieeexsC63PT8Qlt0dRwO//h46RT288rnuavTj8kU6
 eIwYIKwNWQwARBOy/ib1CMbCRoHu2SH36XVJtrd3L0CX7/gVHsJ7H3KptN7YiDPt/HNNOpBhe5t/Qq
 wG9cpgYaU24zaLxFkRNU2o5nSNxhxseYSkW7Rh0xeVa/wZlsPdd9Av2cstubywxF6HOQ0HSLsskuOb
 xuoArFp0xGyFB/gWbXB7pMhjVSdjBsCXTGnsfjQZUIIdrrW7REjJKz7Y4OjQ8QF7Yfzz76UUmCKgw2
 DTPDmPA1ny4AKWIRuf4iIqK7xVbNECeC6fpSLPXp/9Iisn+OkYdhe9kyvQMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: XBWZ3VJD5LBKV3SS6FWQP7QMVPBNW44L
X-Message-ID-Hash: XBWZ3VJD5LBKV3SS6FWQP7QMVPBNW44L
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBWZ3VJD5LBKV3SS6FWQP7QMVPBNW44L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the Qualcomm WCD9390/WCD9395 Audio Codec and the
Soundwire devices than can be found on Qualcomm SM8650 based platforms.

The Qualcomm WCD9390/WCD9395 Audio Codec communicates
with the host SoC over 2 Soundwire links to provide:
- 4 ADC inputs for up to 5 Analog Microphones
- 4 DMIC inputs for up to 8 Digital Microphones
- 4 Microphone BIAS
- Stereo Headphone output
- Mono EAR output
- MBHC engine for Headset Detection

The WCD9390/WCD9395 IC has separate I2C subsystem for USB-C
DP Altmode/Audio Accessory mode Mux which is not documented
here but requires port/endpoint graph and properties to handle
Altmode/Audio Accessory switch and orientation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/qcom,wcd939x-sdw.yaml           | 69 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    | 96 ++++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
new file mode 100644
index 000000000000..67ed7701b5d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd939x-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire devices on WCD9390/WCD9395
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire devices. This bindings is for the devices.
+
+properties:
+  compatible:
+    const: sdw20217010e00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of device port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3210000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03210000 0x2000>;
+        wcd938x_rx: codec@0,4 {
+            compatible = "sdw20217010e00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5 6>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010e00";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
new file mode 100644
index 000000000000..6e76f6a8634f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd939x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9380/WCD9385 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire devices.
+  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
+  accessible over an I2C interface.
+  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
+  subsystems are external to the IC, thus requiring DT port-endpoint graph description
+  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
+
+allOf:
+  - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,wcd9390-codec
+      - items:
+          - const: qcom,wcd9395-codec
+          - const: qcom,wcd9390-codec
+
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD939x Codec node to USB MUX subsystems for the
+      purpose of handling altmode muxing and orientation switching to detect and
+      enable Audio Accessory Mode.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    codec {
+        compatible = "qcom,wcd9390-codec";
+        reset-gpios = <&tlmm 32 IRQ_TYPE_NONE>;
+        #sound-dai-cells = <1>;
+        qcom,tx-device = <&wcd939x_tx>;
+        qcom,rx-device = <&wcd939x_rx>;
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
+        wcd939x_rx: codec@0,4 {
+            compatible = "sdw20217010e00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5 6>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010e00";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...

-- 
2.34.1

