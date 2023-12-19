Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885878187CD
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13918E85;
	Tue, 19 Dec 2023 13:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13918E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702990022;
	bh=0LLfLDAQFtlrB7IqgMI8aCNjNHjAX0Bhqf4tIIU1h7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z7TADC3gDK7GIOT6frcr7e354NmhGBKUpE0dTYsAx4e3Ic3fe/Sk+miW11rfKwndh
	 8jAprVL5N/1+glabJA/y039yqDcxabYVC5Vm3MIpkYemuBwS1v8rMg6nZsaIHQbKXC
	 WuaTj2g0uLx6Nln86q3ppxmoYhMpOPRfItohK8tQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25185F805F8; Tue, 19 Dec 2023 13:46:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0363F805F5;
	Tue, 19 Dec 2023 13:46:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5088DF805B6; Tue, 19 Dec 2023 13:45:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84619F80212
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84619F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ou+8mbVd
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3366827ca79so2032505f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702989941; x=1703594741;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVtT1o+t0tKDmILk8gvdRnnlvPZrdnTYAkN5DRsTOpI=;
        b=ou+8mbVd7uUEC4P6UZHHSNwfOyi289LnJqa2XTawIDRasb30ov7J7NWuw0Au4tzdBk
         joCDPtRL1qWGDiobE9z1x94dYV8yY5OanLJrAWwckMbRuoYw6SYQHXimUqtKTqnMw8d8
         p+sYbb2Oke4yqH9n45j4gFtgxQwqw2ymd14BB0FMLpwqqGL9qzQZnTAAVTvm+glUijY9
         iNglatARGKycvIb4r2XqugFbb7m4zrmDiJFTfP0WHT2rgCetH6RRWTZhTLtPYUmv43ck
         D90QJd/q13SytdKqBc3ValOjRMwPVbIjTAQ3wMm+fASDihRY5Wisy5/p+hDc29o1oqGZ
         aZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702989941; x=1703594741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVtT1o+t0tKDmILk8gvdRnnlvPZrdnTYAkN5DRsTOpI=;
        b=AyO+i8XLgQ+bVu6Jh1weDZid/3iONc6JEbynq50A5hrYMej1HAxxJdllWyKjd2kyGD
         xB3bmPRv2UWKhGTtnYeAoQrlVhx8SFwOD2XgAVg6Rd1sI59QzCbp4tdmZjyU1rfkorwk
         FEhlaKV1qEqhXs01Klo+4qlruIdw4F/oKyCV0RDGDm2LaCU8/dXwV9yGjvmRPSfjDDvw
         jNRkUv07sm0SZqdHcHU0PsuspoeNBeqB2Sor2nQxBpUN2O/+iCKkOfleDFgEL83iktZK
         qUehFZiH9FkEkPySEg9uezHv1Airdw2zRpiKKVaeO2XuKHcuBt2uZPsh/vC9Pas/JP5Y
         pGmw==
X-Gm-Message-State: AOJu0YzuOyQ4GZQIz2/BPKn27UfdnaeVdqn43yN/aCCjre+BVpkwMyaI
	vYOazSg9rdJgpzLDi8+zekRFVGBCDa8yWpEc46FsmXu3
X-Google-Smtp-Source: 
 AGHT+IFs/As/kW7MX2pDy9hw2W4vSIGWR1TWT+kJoS+NBkCgTmfHmTEJSuRF2EhgTyZUJR1YGE84HA==
X-Received: by 2002:adf:e28c:0:b0:333:4a78:c5ee with SMTP id
 v12-20020adfe28c000000b003334a78c5eemr8973734wri.48.1702989941371;
        Tue, 19 Dec 2023 04:45:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00336673a4153sm5975782wrs.80.2023.12.19.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:45:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Dec 2023 13:45:35 +0100
Subject: [PATCH v4 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231219-topic-sm8650-upstream-wcd939x-codec-v4-2-1c3bbff2d7ab@linaro.org>
References: 
 <20231219-topic-sm8650-upstream-wcd939x-codec-v4-0-1c3bbff2d7ab@linaro.org>
In-Reply-To: 
 <20231219-topic-sm8650-upstream-wcd939x-codec-v4-0-1c3bbff2d7ab@linaro.org>
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6511;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0LLfLDAQFtlrB7IqgMI8aCNjNHjAX0Bhqf4tIIU1h7I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlgZBwMtQJsKtZA5SdSkwQMyD4v1IvNNjzOnYgKBWY
 T6IC+N2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZYGQcAAKCRB33NvayMhJ0eFCD/
 9c5idiJKm97/or80tFBP4QZQME0S+NjFkYRaSivbeIkSyLCez+2ByGA4wu0Frw+ZK9OK3JbR3FqNPT
 ve6SN308k3zfQoGoyASe5WJn6O4HVW0FBayuy6YnuwUYtf2CTeEOCDISxYkELnIT/ThNsjfjOTPIxG
 ysLv5R+sFySGCujhKS92xDlZmaHwMQhJUTsixCBJ4UqFqGeXUDIYf8iCqWULhKpgdHwENG8p6HYgoa
 osfE87otnucpeqjA/mtl9ooiYCaEEjT/GXx4Ey6XEtdDZTDfAstGAKky5ZB2On/0QKb7/ACHGXF85+
 wbkj5aehuE4F+VYdh8KxyqgzQ3fVa0qs/KX8hK5uKaIUOxv62tEsRtMokm9j2x0zMC3+ia7Elhq/8E
 /+oL6+SllD+1/tSbQHcSXPYA1L3xJXwpjFXNbtNPb8BM+Y4tSY5be018BNGihlEJ0HeY1MJWo5qkey
 VIThUfyplJ7AlIBuqNb+fcBGZTaIj3zIemvFmgcxSaeKhAiecIO2SExvNChs1s21d0Mz/BoTu2lkDX
 9GpjT6pnZWTYjIdM3CJ6UDc1YT1z1qKI8WGbyK2ENfIEfNjztecV3U0mTezfmg4lJDP56xmMu3p+Ar
 fy6dznCzxtu3CnNfE3xgx5RQJjpmoS1SU0+2ATCy+Yc2ukEMlwhP7HEww5rA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: 7LRHX3IUK47HZM3QUQYUTCHU5RGTZ5W3
X-Message-ID-Hash: 7LRHX3IUK47HZM3QUQYUTCHU5RGTZ5W3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LRHX3IUK47HZM3QUQYUTCHU5RGTZ5W3/>
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

