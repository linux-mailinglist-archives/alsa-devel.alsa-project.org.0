Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA0D7F6207
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB68EA3;
	Thu, 23 Nov 2023 15:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB68EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700751037;
	bh=yoA01tN8/L/jgLkjgq1/s38Ou2t4BLwdvsTsvsrj/Io=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g/SOmzWfq/RpWMbAksmSLWkO2J5vInLL9pbeae4NbxqLoP5oCidOSun1RxfWjME7b
	 eG3L2kHHwxzJgacvhjGHwYpdm5uMPGqO0kuDnofhEjyP/FzSsNfrNDdyRmWHN9MeSt
	 Y0mWOwTVnUWLb62CqgbVCA5Sl5ICLUFbOZb6zR14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4A77F805F2; Thu, 23 Nov 2023 15:49:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3807FF805E6;
	Thu, 23 Nov 2023 15:49:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B638F805AB; Thu, 23 Nov 2023 15:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E9C2F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 15:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E9C2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=woff4wGR
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so6195135e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 06:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700750961; x=1701355761;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZWTqgsgWzaK75L+0U9rJsSdfaajRQ0ut3mz4cFUXu8=;
        b=woff4wGRsDQBjdiDOaOHVlzewEOYqw/MAgcMXkt42bXUQsLxcZFkaTbhLPuzOLDQ9K
         WW3M4eNXb4Qt0srOCUjET+RxpCiZ39p76ARw7K3RL9LdXXaEa6gusn+q5xNtagQaLdYL
         /KQAW3P6R935zZ06iDSgS+YKQyrO9FTRecTpuA0i3PH5fQYcETqW01v3EgTdQuDIEXZF
         xywYlwZ4YCeK3lxqUdBou5jMwx5Sd818IvZMpywJyH0ImDELJ+P1so/v4MOW0V50JZIt
         n/T/YO/gyw57VIouC7CCE5rippxKlVfbc12de3CKHcbylKsN6eb6547dcJTrP+xJN9GF
         Zqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750961; x=1701355761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZWTqgsgWzaK75L+0U9rJsSdfaajRQ0ut3mz4cFUXu8=;
        b=k0Ww7/0x6OOw/F02pSWkfG3BbmWsI1xuhCih0jeSy+4wfKDwVuhiZkH2azpqmC+pqm
         KLU7zeyNxKtm/5+A5JqmiKAlJhQN8VTMzhKltV1a6c29tzioXHFxqqso0YXxEkcBbkBI
         l4DfzxUXAPB3DBmgoFN7oegfPqc3BkWj5/HOAYpDM9ZCuo2iFdz2MKzYV5CC3JjHKUVu
         /GE/+YER5zd4s1UADWwvitu8gejwmO6tTeYZIyhs17FgXQ9wLKaJ+XWLCrlIvsmR28sQ
         bEwzh0e1zyEjfGUh86y/3jnqRH4pa/yQyGIziN76GHA7wZZPYr/ZjJitaE0s+SUnA0Cb
         CbOA==
X-Gm-Message-State: AOJu0YyT3Dlu7cwmtqsCI8NyLv6YszD+Y5vhav/yLTwZvEYsgyONiRBT
	XFdWn7E7NHsx1JawoDRM8hJZiw==
X-Google-Smtp-Source: 
 AGHT+IGZYcsaeMxn1BVCfbTOaMT83JBKpgKn8R82PHg64xukcZRjri8qba7xdupntONYfpYoUovw1Q==
X-Received: by 2002:a05:600c:35c7:b0:409:2c35:7b3e with SMTP id
 r7-20020a05600c35c700b004092c357b3emr4990540wmq.8.1700750960882;
        Thu, 23 Nov 2023 06:49:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c458400b004094d4292aesm2256135wmo.18.2023.11.23.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:49:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Nov 2023 15:49:11 +0100
Subject: [PATCH 1/5] ASoC: dt-bindings: qcom,wcd938x: move out common
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-1-21d4ad9276de@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6235;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yoA01tN8/L/jgLkjgq1/s38Ou2t4BLwdvsTsvsrj/Io=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX2ZsFXGUeuLwuBsVkVyZm2O/+Vk3euqPozCjk2c3
 3HPFPm6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV9mbAAKCRB33NvayMhJ0bxkD/
 9teH13nf5T/dZ/TOUjWcSSe4hG/WcHyebysMUBk6iuyh2DLDMVtIhrhQc/uTYlfsmGVZQjRZOzO2zt
 eAhiyX0m35Y9avzMIboSBpB7bpE82iO5dfJhDZKTK3AWKDw9Lw3HMb0bEoQNbPCVOJpC90N1h/37C/
 XZZVDhU1/QlhGDeYwPG/oF4giNQDDRtQ9QYO8npO6pHRLyQ2kJV7JCiyE4S+ky+xLVXssrHuWwp5/6
 DgeugAr465UIeJRZXU8iwDSm89XsgQ8BW0a7/MgNu/ZfuDT/C/MZ1F4rqwUhVH4jpE+o3jqTVAJc9g
 e3z07wiHLcbAt3DGKi/BTcMw0xzQW3XT/EiQKd8L4MNmC6AEv5h01yk0y98cI6XjEdL137DBfi+EoB
 NkBSiUEZM6uoe/kvIpB+U4oyMYndYnl2/7311ukQ8JONe9eqAcDPScEEtO4DZYaSArS2t2Av1HU31g
 d/02V8VeiNrKV8fq8zogbCMcDA9DpXTta7oEx9G56+GdBj5NbTkwE1EgqMWer48nzelZ8FUf1LgoKi
 DxTRFrZx2C1c38yRsu+cDPkz/a+fQAyJJZZ2kUmw2trleqAxgaqGwv4PTMFiob20BapTt495fkXwQy
 kRuNwD8IxVLZp6sXhBIBsGI5zC2xjQoz2+Fi7hwKanrcF11Dl+F6SigCFQSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: MBBBESE5OGC5Q2DGUGZUATBIKQMOORX2
X-Message-ID-Hash: MBBBESE5OGC5Q2DGUGZUATBIKQMOORX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBBBESE5OGC5Q2DGUGZUATBIKQMOORX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move out common properties from qcom,wcd938x bindings in preparation
of adding Qualcomm WCD939x bindings sharing most of the properties.

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

