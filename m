Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41C800E20
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 16:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EBDA4E;
	Fri,  1 Dec 2023 16:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EBDA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701443382;
	bh=Uglg24nZY1C7ElRVJ4NCgzh7HTGQqFA6AMsN4Ezv9Kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rddFTlMsOU2olzjysqXGY8f0DtmbBM/+vwdgl9f9j0oCzJkyAFav25wawuem+prhE
	 W5U0mYKD1M2AWt1fGtB0XXFgKXvIRVcc+7NhOsEC4s5VFu8ljjrrY1EMxeTnKITUKI
	 cSWOk4SsTDguQ1fut3UnDqh0adynJmK9CxY58MlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11D00F80580; Fri,  1 Dec 2023 16:09:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED8B5F80571;
	Fri,  1 Dec 2023 16:09:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D90BAF8025A; Fri,  1 Dec 2023 16:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2517DF800F5
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 16:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2517DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=otAg74Hi
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bca79244fso3148979e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443341; x=1702048141;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qINiKytCFGh2MDywcjo0UyglJ8pj6SdN9F5fHmVcUK4=;
        b=otAg74HipLr9YKF1Bd7EqREwUecDy5hAEloSHxpKORMBx8eYAmvriYkQzrvgOo5FnM
         IvqCtDoz1vYxoDsg7FpdQ+D1G1SKUnambMeynFf7xOnZF0drovFMcMAp76jGus4Ka3En
         rKFUUaGleCrToR9acE7Vt+TDd19vSBjiLlibGRNVr4xEKhW5wEjWBUyaDu5KBHSeeRiy
         +v8cR8+yp9rl/Td0N6kdJTfPLR3okW/52DTAnafghf7fqwx1LZr4/wfU1kWAXD4re0g6
         RHeiSfHG2+cBT9v/ugrGgeLBkeGxhQ4uAVrb6QdqqgN8VoTwIGXlbVEgcqRAm1qsIJC0
         Fgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443341; x=1702048141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qINiKytCFGh2MDywcjo0UyglJ8pj6SdN9F5fHmVcUK4=;
        b=v4/K7PvXyPe/f6erPRsIEVeuLHrKuhj2G9q3XJZzfv41aiRK6thJgksB44U4TH2jgw
         P4SI7AiM6Sdxu5JjOgK50PSwJk0hAyEau+HJq52cJigmoBFoxCwAP06jSYNsGf+63WoF
         fXB1DQMIF/BWjNROgHxOXOi8JghKi9uW3S2idl/SJ2kTf6DJ8lQS+OP1S4u8UCjiNe5z
         zT12o3Y5bxvHd2admiq3xnuisVM4Hli71fxW/K+VD2Z1kLNOG5Qmzfa5O0vQmzZ3gzVG
         jpKTzFsfdtsNrMSNRpdoyVY94vCki6PlU1M9QpLtlju/ht8yPPqPu2CNgBGV3cJqdioY
         6ltg==
X-Gm-Message-State: AOJu0YwrA8LRGenG+HhPmK33zokbV5x596obsGSW0kbkuKl3CdaURXyT
	aEcT4BtIG0qzdQcXcgSGjnYwGQ==
X-Google-Smtp-Source: 
 AGHT+IGHOPx3B0lJnuEJxE+A1iPYVcIo65FUUu5Hufal2K09q0kYkzSqSA9rbKAvK2xS1blzox1Y8A==
X-Received: by 2002:a05:6512:1246:b0:50b:d174:56cc with SMTP id
 fb6-20020a056512124600b0050bd17456ccmr1219711lfb.21.1701443340699;
        Fri, 01 Dec 2023 07:09:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 fs20-20020a05600c3f9400b0040b5517ae31sm8569539wmb.6.2023.12.01.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:09:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 01 Dec 2023 16:08:54 +0100
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,wcd938x: move out common
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-1-94ed814b25aa@linaro.org>
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
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6302;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Uglg24nZY1C7ElRVJ4NCgzh7HTGQqFA6AMsN4Ezv9Kk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlafcI4Ga7OWPE8BXAb9PIogtXejM+uW+T/MI/2m1o
 FGTYhZeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWn3CAAKCRB33NvayMhJ0VGGD/
 0c7jnn7TDI6xr5iGFu7eIbI7AMIL8aH0+Z/0raMGJ6OFUQl7hhYQ7t1woKKo+F9ljKMVOaF3ZObEqB
 j8RZPBObxZF+iTb982sixL4tz7NHkjIO+4ScYxLLTAJKpa3+WQh5E+GDfjuvjpvAzPhpgwnXMfEApm
 KI/9F1vQDmE8/e5wP8XAqh/rGjwkaU1GAnX9Fogbtgliwb+9/oG60W9cLLjXJvbF1KruymiPl9+205
 aolB3tAXvCf84Kt/E5nimEa80UzrgDS7irOonN12iFip75liCPcRPmMqAOoCuuvKPoxKfRlZZwi8uf
 6x7uPyV9ozDnJRlFcftx+fCNnCZ1Ufiv8+kPZzdMthiAnTz9fwrGQkWsnj1g38Y/M+b0gfneT6LMIv
 WitZZLi4141bwbqzcNZGI/QNOEmii0vxrxs+XlZxRFSffGhl4qik9hCJ1WVOBlrUI74Q4d35MVkdJK
 tJzvZTc0qNUq07C7n98I0fsouztQ4Du0oFiBhSIVNgROSi4HqQC9V58FX3Eviocfk+J4DEu1HRfgrs
 l6RYwE3QCzZ6gIOY9qhKcHiz+F/BW/X/J2aHEtWErapmRzWP6CBW9+tuootL4ISDCL9r+jtaLjqpQ8
 pNUqGRpXVDB2L3ml+B/yJAg+k/9PZIwrKOGZSSAp0cXU5ugFIXdHkv82d0pA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: AAEYYSQX64QZ4KOIPXR7MALX5HH5MVEK
X-Message-ID-Hash: AAEYYSQX64QZ4KOIPXR7MALX5HH5MVEK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AAEYYSQX64QZ4KOIPXR7MALX5HH5MVEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move out common properties from qcom,wcd938x bindings in preparation
of adding Qualcomm WCD939x bindings sharing most of the properties.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    | 81 +-----------------
 .../bindings/sound/qcom,wcd93xx-common.yaml        | 95 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 018565793a3e..de333d07d469 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -15,6 +15,7 @@ description: |
 
 allOf:
   - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
 
 properties:
   compatible:
@@ -22,92 +23,12 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
-  reset-gpios:
-    description: GPIO spec for reset line to use
-    maxItems: 1
-
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
 
-  vdd-buck-supply:
-    description: A reference to the 1.8V buck supply
-
-  vdd-rxtx-supply:
-    description: A reference to the 1.8V rx supply
-
-  vdd-io-supply:
-    description: A reference to the 1.8V I/O supply
-
-  vdd-mic-bias-supply:
-    description: A reference to the 3.8V mic bias supply
-
-  qcom,tx-device:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: A reference to Soundwire tx device phandle
-
-  qcom,rx-device:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: A reference to Soundwire rx device phandle
-
-  qcom,micbias1-microvolt:
-    description: micbias1 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,micbias2-microvolt:
-    description: micbias2 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,micbias3-microvolt:
-    description: micbias3 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,micbias4-microvolt:
-    description: micbias4 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,hphl-jack-type-normally-closed:
-    description: Indicates that HPHL jack switch type is normally closed
-    type: boolean
-
-  qcom,ground-jack-type-normally-closed:
-    description: Indicates that Headset Ground switch type is normally closed
-    type: boolean
-
-  qcom,mbhc-headset-vthreshold-microvolt:
-    description: Voltage threshold value for headset detection
-    minimum: 0
-    maximum: 2850000
-
-  qcom,mbhc-headphone-vthreshold-microvolt:
-    description: Voltage threshold value for headphone detection
-    minimum: 0
-    maximum: 2850000
-
-  qcom,mbhc-buttons-vthreshold-microvolt:
-    description:
-      Array of 8 Voltage threshold values corresponding to headset
-      button0 - button7
-    minItems: 8
-    maxItems: 8
-
-  '#sound-dai-cells':
-    const: 1
-
 required:
   - compatible
-  - reset-gpios
-  - qcom,tx-device
-  - qcom,rx-device
-  - qcom,micbias1-microvolt
-  - qcom,micbias2-microvolt
-  - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
-  - "#sound-dai-cells"
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
new file mode 100644
index 000000000000..f78ba148ad25
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd93xx-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for Qualcomm WCD93xx Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
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
+  vdd-mic-bias-supply:
+    description: A reference to the 3.8V mic bias supply
+
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
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
+    minItems: 8
+    maxItems: 8
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - reset-gpios
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - qcom,micbias4-microvolt
+  - "#sound-dai-cells"
+
+additionalProperties: true

-- 
2.34.1

