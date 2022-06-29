Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1B55FB58
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 11:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A31E166C;
	Wed, 29 Jun 2022 11:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A31E166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656493737;
	bh=gGoAnUaGpkqcWkBLVzRPXWX0EJal6RTl9AugfoboFOo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZS5wX/UCp0NTgPvDpzZ436gYSTIL3GMFRr7yKE7PXY67GC/q+ZVx1M+XFerjb+txb
	 yjTq8ARuA1ISUtn24KNSWfQrYKKD9OFgaoh1Re0Y4lM4a2TwvubjF5jUpZ4Ir8GKgV
	 SCxhVQNj+afvF/MwFWF7cCvDCCsfL26ODPa7iAf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D04F8053D;
	Wed, 29 Jun 2022 11:07:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CDD4F8052D; Wed, 29 Jun 2022 11:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44DBEF80245
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 11:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44DBEF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MaLVsYck"
Received: by mail-wm1-x32a.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so795958wmr.0
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLqWKbW2jwJoT9mNlPi4MBFHRkwb+jBW6zLXAKBErh8=;
 b=MaLVsYckZFbAjneDp1wl2bbc1COXSVjuKYl2p1EVBs3dtRA5vY4YysKcEfAe03l6lt
 mjGmfJ1lHWvBIHl76k0usAJgjhTdfVxh0nOAB+J/FbWB9tPhdBOJdddZ2nXK3wh18Ihx
 1YYzEleHO9Rrxnpqmj1jDvnJ3YfVBMqJSAPjpKyZN5mCbSg9d6kzDR+TeqdBssFLDa7i
 ZsgEFV6AN03F3gbA89NV02joCPEen9BeGnRt7V+QsSfQm+1XQfRVpogoOcpt61bIxl9d
 UmUjU/Fvm0iV3e4Pfx3Eci5JMo+WBEn4l7dVeTcV8WlEFTQv8iTYu1eCbSwaOcZAxPMu
 opVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLqWKbW2jwJoT9mNlPi4MBFHRkwb+jBW6zLXAKBErh8=;
 b=PrPZywpIMCo9dhtZkb9OG8Aj5u0bbjO+q1aoiN/M1hL9BtotD/kznNWpcBme0Ocing
 +DmSoPbaaumFKuhZim3nvJNE9zUfzAj3POSBc3AM0u4vgUZznAaFgqH/9Y8enWVOvjoh
 DZwklZJL0kEeQmrtz0gisbGk4Ojqpkj0SF2WoQYxkBZXsyXWxfvIio6sh2exXFKOi3LS
 BnC42Pbm9lPz7Tz2JoKofcKn6+HAcjF7Rp6WHGQu6K8am2zrN6pu+hbqzjJQ8KRZDaRM
 uePyVL+4PT34bm//6dWozvraQzR8Jy647UvxW9FaOlZGn7yfFZJwCDpgFEtTkzWis4kg
 bGVw==
X-Gm-Message-State: AJIora9iFG7JiM7DP33yfAtDcdX4PsIeyt292RVvMk7rblk6Uj25h5Dx
 Oqga6BmiDqJ/G4sxTW5EQFi+EA==
X-Google-Smtp-Source: AGRyM1sDF/x8aEU0SfRrjCu32S9j0ZFkdiKNSRBehEA0uZ6Cr/wxrTUDHyPdd6wQKF7O+2E+9kMjgw==
X-Received: by 2002:a1c:e907:0:b0:3a0:3e42:9c72 with SMTP id
 q7-20020a1ce907000000b003a03e429c72mr2453247wmc.162.1656493625564; 
 Wed, 29 Jun 2022 02:07:05 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a5d530c000000b002185d79dc7fsm15993341wrv.75.2022.06.29.02.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 02:07:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: dt-bindings: Add WSA883x bindings
Date: Wed, 29 Jun 2022 10:06:41 +0100
Message-Id: <20220629090644.67982-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patch adds bindings for WSA883x Smart Speaker Amplifier.
This Amplifier also has a simple thermal sensor for temperature
measurments with speaker protection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wsa883x.yaml          | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
new file mode 100644
index 000000000000..6113f65f2990
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for The Qualcomm WSA8830/WSA8832/WSA8835
+  smart speaker amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  WSA883X is the Qualcomm Aqstic smart speaker amplifier
+  Their primary operating mode uses a SoundWire digital audio
+  interface. This binding is for SoundWire interface.
+
+properties:
+  compatible:
+    const: sdw10217020200
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO spec for Powerdown/Shutdown line to use
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD Supply for the Codec
+
+  '#thermal-sensor-cells':
+    const: 0
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - powerdown-gpios
+  - "#thermal-sensor-cells"
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire-controller@3250000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x3250000 0x2000>;
+
+        speaker@0,1 {
+            compatible = "sdw10217020200";
+            reg = <0 1>;
+            powerdown-gpios = <&tlmm 1 0>;
+            vdd-supply = <&vreg_s10b_1p8>;
+            #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217020200";
+            reg = <0 2>;
+            powerdown-gpios = <&tlmm 89 0>;
+            vdd-supply = <&vreg_s10b_1p8>;
+            #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
+        };
+    };
+
+...
-- 
2.25.1

