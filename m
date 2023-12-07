Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C980858E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 11:33:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614E682B;
	Thu,  7 Dec 2023 11:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614E682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701945200;
	bh=0LLfLDAQFtlrB7IqgMI8aCNjNHjAX0Bhqf4tIIU1h7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9kXFooWS/QcIFFWvM1ZDPr0GbIkcNVx0FcQlvfTXKWsKrtFSE3b4qkCVlkI5C4+o
	 xvNXbrz58WT6lUVBWD5chDT6QOic22vo6fDEjO/s2+2ZPzlsUvniio19STPeQ59wcO
	 EhdAPfHaPnPc0YtjQqdwicakMojMq+xcXFZonGb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A247F805BA; Thu,  7 Dec 2023 11:32:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A6EF8055B;
	Thu,  7 Dec 2023 11:32:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC854F802BE; Thu,  7 Dec 2023 11:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B907F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 11:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B907F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yl38ESe/
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso8080405e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Dec 2023 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701944895; x=1702549695;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVtT1o+t0tKDmILk8gvdRnnlvPZrdnTYAkN5DRsTOpI=;
        b=yl38ESe/wmD4wqKoModmXlOZn5XEZuIjEdX1RWcdNqeEb2VGsH4lwxyvSM9eXp88qP
         vNZHZRwUP2WiyfdQynwdBKrQmGDAsRuJdD/CGbss8QCBh8ADPwAQEkULs8F1wsH8LJ6M
         0/jiGhBXrkw8tNLqGq32erqxSILKYOAPmE6VP0frLtPknX4A1IrThhv3KFDTUcsL264B
         L5Ybml0lBuj0tYijyrj0pkXtc8bRN4hr6JpXXYPnjMjxkvKXW77+SBrD92HqByEENSX1
         K6CqHKK/EEqhT/+gM+EA7KfJNP+t7IvGQnCGsGFjA39OEr5wrdNmIfgPJqXfVSzVITuw
         ZStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701944895; x=1702549695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVtT1o+t0tKDmILk8gvdRnnlvPZrdnTYAkN5DRsTOpI=;
        b=wV08iIKCshE/vEqJzMDMJRV9aYsPWm1y8eN1Qn1oG53QUzYgJ5p8z8LzfBNoqXznIX
         o3QXYhSqb1k3JkXDzvIAnTHHciVGqFucZh9jdL8OliVq11kwos6BEom7zhrROdP8Jkq8
         fAU67dav8K+SXvxRp2FdEqluN8ib5728ggj24vE49a5u51Sz6ctUScgPsj0GzVPwDTFc
         86l/yTzHzWQ40niTVYZAos2iWq5/xmNJ2/rwwJlD+43pv2RQH5CZfXYhZhs3X8LOAF0D
         IArwtO0vD9axpuOXWHMkBV+6jvHecujKAzcLBDHHSVTW+UJzzndemVlcrEDicoA4hTRx
         PI2Q==
X-Gm-Message-State: AOJu0YxO32VukNPKrVLDjX2Axqe1S2Dmk+Ht6QRuhUXweHNyDrkxrKW3
	y7iPBb53vR0xbAQI7c+Kb1obFA==
X-Google-Smtp-Source: 
 AGHT+IHl+b992JPbFSXy1jgEXsS8wbOJH03yy6Hwz/Z+syis8E5TtNjY/HnCnfS/8GiMmOnwC936mg==
X-Received: by 2002:a05:600c:2147:b0:405:1c19:b747 with SMTP id
 v7-20020a05600c214700b004051c19b747mr1393535wml.15.1701944894844;
        Thu, 07 Dec 2023 02:28:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 d2-20020adfe2c2000000b003333d2c6420sm1073412wrj.74.2023.12.07.02.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:28:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 11:28:05 +0100
Subject: [PATCH v3 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-2-6df9585ec7c8@linaro.org>
References: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
In-Reply-To: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
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
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6511;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0LLfLDAQFtlrB7IqgMI8aCNjNHjAX0Bhqf4tIIU1h7I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcZ45FXg8rU/eEYYOTsPNXmbVdk0qxIN5V6qnMyQA
 ieSdHhKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXGeOQAKCRB33NvayMhJ0aInD/
 9XwnFXvXDjY73jtGGcVzmSCf5pEkjxUYQ75US7BGIZRXEoNl3x/bpl2DkFWsiuKB0glPmTw0q9Zc7p
 Q98jMZ03ZLAIioMNzYyrCurfnifbnza8UURB06deZPnn5BtY3kA0mr2CuOmsfUcS5RIaT6iWXNoeDz
 f94m8I8dy9nOwDxj5BZ0s/HBIRvHSVKY2P1EcB/I1qm8ymlAkwvyK0rYbcCoFL/5HZjWPAubbmL5He
 J90quzAVhWPN78Uor3ASD8Yo0oZxii4zykBgevHKjIj9qE/nwSS6IGszpLC8tT9mTA3KTMsQ1PdmUf
 lvnghduxNbC4SA5cTdf9YXREVMC+3tYH31ewWSSZCYobb1AYipJR6PtQo0CxFki7AMyEUZ+ldihTVk
 pSH6dBwguzjO7fVE/Kf96nNmlyeRAtTcsiMTlJhWZ5dgndq4grBzR7Mxg4WHhcE+dTockS9xdkF8Hu
 zuAZ0vNvYAHROKx659D8eki36jmlxDCt2PMPr5djKz5XS5uhwMCng7HjzA2KMt3cNXc9O40FSFdHWD
 0iiN3i9DcB4WuWDMNW5orS6K76o5KgtUVbJ3NDti00n3tZde9I3pFICAtDTKXf2vyRGCAVPO2onLtG
 yMDE8R1/+YYPRBQ3cWZu5tXYBGyv60q7y/9v3DEmMK3pzjc2n5h6kJLM59YA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: CWLRMJNUPFYRI3V5ACKUZBIQI5Z7SF4W
X-Message-ID-Hash: CWLRMJNUPFYRI3V5ACKUZBIQI5Z7SF4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWLRMJNUPFYRI3V5ACKUZBIQI5Z7SF4W/>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

