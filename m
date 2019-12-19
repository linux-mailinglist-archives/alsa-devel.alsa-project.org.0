Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16427125E7C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 11:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF96950;
	Thu, 19 Dec 2019 11:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF96950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576749965;
	bh=4GuhMq2ELnYq4Kvh33ApurO3UK3M7DFk1NE1pfRL9F0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5PnVqtd26mudcE8S9R4xitn25uyKr7Aqa1k0rrvz5N0s8+hx5Xyukb1YxVVXy4t5
	 GTiYRcmgeE9aJXLsyDB67xgrPPU6V9Ilu2Bfw4QPITjb9hwwkWBNjPM/DarGdSMdNc
	 oem9kOj8J3CdeZEmqvlJfL+meZhiHkN6WQ3wbi8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97205F8025A;
	Thu, 19 Dec 2019 11:03:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D01F80253; Thu, 19 Dec 2019 11:03:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D2FF80059
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D2FF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F+b10E0P"
Received: by mail-wr1-x434.google.com with SMTP id y17so5350942wrh.5
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 02:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JxDh75uEh0RK6rR9f3O8ETEE0JCmuUTTTLAdzg4vg4=;
 b=F+b10E0P/rEuYzq6APab/vnJ6ESHK8IvIhXydEcSowDIDfm096W0vZ9GJUSLhMjcKK
 qO1g+Bc5FC8QoqQ9grAgEiaGeQfujM/OKI/icfXehUAcG5N1jS1+RcuXkNk2r/IQFUVz
 OfOPWeifptDiCPeV2DHQJCQwRUi9ektCAfaF+2xDLUAlm1pvNhBwHNQF9Fg0G866kMgT
 ZE8UMaQp1wLmWNuK8yKfq3RssFmEZHunDoM4gHVgALz0uu7K3IVRuiDwVSTFWAsvImbZ
 sRFlyN/tCSHVufFWAVh9iS2yLLQlw+jhNGpeVidm6kctkrJWzaxKyWy5mM1VgmQBOTMj
 NHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JxDh75uEh0RK6rR9f3O8ETEE0JCmuUTTTLAdzg4vg4=;
 b=ZOX6UN6lUBULm9Uq8iH/V3d/YCFuNyEfc1phLoPMlZkPw9xGSlEl1PR538TNS6SKVc
 zIqXdN16lxUy//QgJSRx9cs+kNPbZxkYSXxNCNAl8sdFQZFty0CECvk3lz7rdOHbYVe7
 BgzTX12M/4MKCSKgjF2DyoZg0qehOoQNM66R2DgFJxmIWIGIf4TLHdVnytzR2FXW8v4l
 rX0UwNC+LkxzjxY7B0M31AuFNkvXVfZ71yV3nElqzRzN5FSMXSTB6RA3QSXNV6Mvpi3v
 yysuPaTyMKAYMVm3aZZ1i5oHZ62jS7jf8h9gLH0A3/p6Y/AVHF72anxqvBX+ldnJLO5g
 qPqw==
X-Gm-Message-State: APjAAAUjpK+TOe9HB6GC3xwVtuFE5cOdmloCU3c53Jbe5seZ0wwXqHyT
 pbxb+5+gXpitZQh05FhEAubkYg==
X-Google-Smtp-Source: APXvYqyegcxV6oGwljFm9wPUDvBhI6sOff8tD6KLNO+HAoMV0+lkQFS2LxsduDUsWRPDdbDujmEgPg==
X-Received: by 2002:adf:f20b:: with SMTP id p11mr8155358wro.195.1576749814904; 
 Thu, 19 Dec 2019 02:03:34 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q15sm6041164wrr.11.2019.12.19.02.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:03:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Thu, 19 Dec 2019 10:03:27 +0000
Message-Id: <20191219100328.14850-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219100328.14850-1-srinivas.kandagatla@linaro.org>
References: <20191219100328.14850-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v9 1/2] dt-bindings: ASoC: Add WSA881x bindings
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

This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
Amplifier. This Amplifier also has a simple thermal sensor for
over temperature and speaker protection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,wsa881x.yaml          | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
new file mode 100644
index 000000000000..ea44d03e58ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  WSA8810 is a class-D smart speaker amplifier and WSA8815
+  is a high-output power class-D smart speaker amplifier.
+  Their primary operating mode uses a SoundWire digital audio
+  interface. This binding is for SoundWire interface.
+
+properties:
+  compatible:
+    const: sdw10217201000
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO spec for Powerdown/Shutdown line to use
+    maxItems: 1
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
+  - powerdown-gpios
+  - "#thermal-sensor-cells"
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@c2d0000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x0c2d0000 0x2000>;
+
+        speaker@0,1 {
+            compatible = "sdw10217201000";
+            reg = <0 1>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217201000";
+            reg = <0 2>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
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
