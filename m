Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FA7F6205
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:50:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC04EEAF;
	Thu, 23 Nov 2023 15:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC04EEAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700751015;
	bh=oHPZkGB2+lxc+Hu7wE58PGrnkLEAPNKccodV0RWgue4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=be9AYz/OUO7ZvpFjsYrmUIdA//faJST7+M1O9Lgxou80PVctrtRDihfQoCYVSDrmX
	 wn8XB54nVEP4dfyVa/68c/IcIpx57o9pCXxv/FvW9U3kklgANOKJSgDhKtN49axclF
	 Zdr0uqQVt9/2Xm2UZIrYtphypV9HhHMzHqskno3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E640F805C1; Thu, 23 Nov 2023 15:49:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3344F805C0;
	Thu, 23 Nov 2023 15:49:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60519F8057F; Thu, 23 Nov 2023 15:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE9C0F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 15:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9C0F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TIRVU54A
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so11400321fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 06:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700750962; x=1701355762;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbT4SM/ON1fCDmJeJzaowQV/y/xYkwz5XqPAyX1wOkE=;
        b=TIRVU54AmRZqZUTKwPtOgIwraBePj8o5UenVMHwg8yYKLh/ZaeufV7iuyCk8uTpkZx
         +qpHLJ0McdAf20exqGQtsS5V9I8uafCmHSU5p7EHNdpaEDxT5hG5v0vY47fM5v+7VRw4
         bxWPqD5UndSeEA/82CvhUYnxKXt7V9xwfV1H585z5FTJiy7yGkmMPfCy1LRLLXKZpWBw
         DPuYhhrg+hhRwWU7P+z2m+Z44zRDbwh+Ikb1qdPt+TztplK+olzuGsGvBrCxvgaFNPEm
         AMrae+wW2qTRiFmj0tRtuwmGjLk8hxd2srCQtSYzpkUyUnt/Uv5loatV9vr76Joe+yNr
         UU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750962; x=1701355762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbT4SM/ON1fCDmJeJzaowQV/y/xYkwz5XqPAyX1wOkE=;
        b=cBiytSJJ/QpepgOALKeYyUzUH9Xz8RJhDYB5r/gpg+T+L3b5VUbOhR9i4quA6q/h4B
         pb0zH8UvlJxzAusxt8WxDq5VffGs35bErUQc19Z9NB3xLFChwUWiE2xVYd7X2tcv5KZe
         NqHzzQL2T4fCswpujCL3ipQZ9T5T0CWDwct0vrPy1QIuqc/3R5EAJFcA1xtqK/WZnZJG
         balzuHF4PEeW2GjP3i9aLSUXmFXVSNvcdH+rpP1QoLdI7WYLpZGcemxUZfk/vvrSyhgU
         01kisvUo7zF6cBt+XngCwsOKwCZ/rzmDiAOfO2HA6JfpIiousWqVuNKzJdjSKuvZNA/Q
         4BVQ==
X-Gm-Message-State: AOJu0YxqC5lgfMVtPYKcD/KJetZ30Ld+RgF8Zpfp7r9Y6AtgSVH+rW8E
	aRnM8BYwhUE1495CaUu9fTKvlA==
X-Google-Smtp-Source: 
 AGHT+IHZBJb0pGqihr+j1ZdR1L8Y3ZoR7gyEvPbnBZxUyAfpmn7rAtd3hJi7YAP8z2twRupv25QkSA==
X-Received: by 2002:a2e:7a0f:0:b0:2c8:87d6:1fbb with SMTP id
 v15-20020a2e7a0f000000b002c887d61fbbmr3663797ljc.31.1700750961976;
        Thu, 23 Nov 2023 06:49:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c458400b004094d4292aesm2256135wmo.18.2023.11.23.06.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:49:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Nov 2023 15:49:12 +0100
Subject: [PATCH 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-2-21d4ad9276de@linaro.org>
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
In-Reply-To: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6327;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oHPZkGB2+lxc+Hu7wE58PGrnkLEAPNKccodV0RWgue4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX2Zt9JH1UOmqaZsEEAIMwtoKeYIrJNN/hAds9sns
 pzsO3hqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV9mbQAKCRB33NvayMhJ0Q20D/
 9jaKFy3eXEBgNMRJ0QYmLMcilCqvGjvP3oiJsqz4yVGzG3+dmvtl4InLV0euJ+9fk5OLC0JXTgSy+r
 TL1Lgj7Y9COniVlLlX/BVzI5X8myL5Tvl6L4yASDx44QppNw377YlD/ZaEkH7Akf8r3Af+y1c6fDA1
 uGq5FPcXRh0zbzZ5adM/wNpibl5ef1BScs6M8JQmvKe6u9yHziJJgbrQtcFIo1t5iNCxaiLl5WmZ68
 NcDNY527101/eRVfxsT4iAsbrCFC6G3Pib/S/mSF8DxKCVf9zU2+2qMCORwPgD2v9UoBjgkUzQ12r2
 /E7ofwWT96A2+KAIsXSlhbRBx+EhBDreH+VjmgFJZWbFa+pc/MQPpO06ajFs+9QgT3+nirgoOTBde8
 vtnHJfICjd49KvlB0KXbOw9EvPEbU2GOGKvAjfzpxForcA8Ib+BMcW+3hUV8uPSob5dlNAjBVUICf2
 cVdbxQEhFC1s5icwCQeNiyaRRyt2JUQnWzPp1LjZpyEglXQY5VtevkHHrvilsM/BR/Y9WL73QOqqcP
 eacdWrKrE0WEdwOHrVxD2GXB1jiHketAIF6QvttbcNWHmgeGzuLKP3IxlFGG1aXgBraUq8eF+FdK4R
 mkT5nQ1FNGPloMP+MHo5vtyYKIkp8bFDbsPM2nS55U0Hp3OfdK47qyGR3pGA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: JEAW7H32NHBBH4CX6CO43KKFRJRPE5LZ
X-Message-ID-Hash: JEAW7H32NHBBH4CX6CO43KKFRJRPE5LZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEAW7H32NHBBH4CX6CO43KKFRJRPE5LZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the Qualcomm WCD9390/WCD9395 Audio Codec and the
Soundwire slaves than can be found on Qualcomm SM8650 based platforms.

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
 .../bindings/sound/qcom,wcd939x-sdw.yaml           | 70 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    | 93 ++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
new file mode 100644
index 000000000000..7528c8b100a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd939x-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on WCD9390/WCD9395
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices. This bindings is for the
+  slave devices.
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
+      Specifies static port mapping between slave and master tx ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between slave and master rx ports.
+      In the order of slave port index.
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
+            reg  = <0 4>;
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
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
new file mode 100644
index 000000000000..39c1de6961ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -0,0 +1,93 @@
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
+  It has RX and TX Soundwire slave devices.
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
+    enum:
+      - qcom,wcd9390-codec
+      - qcom,wcd9395-codec
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
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
+      purpose of handling altmode muxing and orientation switching to detecte and
+      enable Audio Accessory Mode.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "qcom,wcd9390-codec";
+        reset-gpios = <&tlmm 32 0>;
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
+            reg  = <0 4>;
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
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...

-- 
2.34.1

