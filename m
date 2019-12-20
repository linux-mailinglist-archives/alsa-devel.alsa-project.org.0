Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDDD127A74
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 13:00:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412ED1657;
	Fri, 20 Dec 2019 12:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412ED1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576843216;
	bh=4GuhMq2ELnYq4Kvh33ApurO3UK3M7DFk1NE1pfRL9F0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3c3IWbGaH+7IFGzhvxb546XXC+p1oYySi6Xnqimrl1VQ33+KDolhquLMV9nqcvV4
	 y1cuXLBHVRVGLztG+9vY1JWLrw1vFLXX7nWKhyZVczyIbsTc4C2B6hT31xuK1h46UU
	 EXNVrvkEGNqCzo2tiSX/T5r8GRYzc+xetymyDmPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED8FF80266;
	Fri, 20 Dec 2019 12:57:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96C64F8015A; Fri, 20 Dec 2019 12:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93BCAF800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 12:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BCAF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fsFMY6Ue"
Received: by mail-wr1-x444.google.com with SMTP id z7so9114177wrl.13
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 03:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JxDh75uEh0RK6rR9f3O8ETEE0JCmuUTTTLAdzg4vg4=;
 b=fsFMY6UeVPAIm6t1GsEHWp1ZoMVv3CBBr3hsBQ6kf8iONGzXRx8pPXZPp7NAbopTHi
 YqsD816Zy09P8N2L36pxgs5c2gS+/dXyvBlIdKpG3J60GVisfbh+digQ1N/qguj/aJme
 hymIVNVQVdlT1o5juG5URujVg4U5FNYbAWKIbmKSd4HSnaDnsChGzkATQosJIxvd/VGD
 mgjXMbQahY3AsMrsSrdSr/MFg5A5iNfcYzYIIxEbi/IO67ophztAUuoJyHjlyYuePJvv
 9J01JR1PRJYdaNFXhgFQtYlPl0/rkb0aYsUkieYMu1vhbxktKamOYLzNHA6kxB5RIsZw
 jOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JxDh75uEh0RK6rR9f3O8ETEE0JCmuUTTTLAdzg4vg4=;
 b=KxQPquEFYfZJC6bS6+/N28RBUWsu9jTc+sLjcMLln8/8awnvAdW9tZxblJ/SI/B32s
 It7h5M8VMiEP0HoKgmp5XK8K6wL5Q/zstbiQwE86HKTPInO0QVQhQSywXf/LzJlnTcA4
 Xfqlhbo78q2p41Nq3Oa6bKRu/pqOoFHxcmHFIyhZONjOLVLoFca+j2RkizW+h677dGWi
 6AJyQj1Z2ulssoi3rILmYQ1b3rRDUH2c214n7sQkQngvXFOgy7ozyOpd8W00D9L6aNao
 apDgP4KNBkeV8QevHmvat3QYzzxmdxikNY4xrVYGHYmxkdN+7k4N1DIsYYw1TwysTCOu
 NzlQ==
X-Gm-Message-State: APjAAAXIpE9Z6DzUAKbHmlKmILA0DwJd9xgi2oWy5qOVWiGVekjJjpYH
 jWXugP+HWiU7N/VrzayIuiBHFw==
X-Google-Smtp-Source: APXvYqzzZEGZ0tEGNK6b39FMYJ9t/d6diKovWhJVA25pa5MqQdca4W5ey+0D1FgQVZwRj1BpWtW+EQ==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr14508129wro.375.1576843065690; 
 Fri, 20 Dec 2019 03:57:45 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z124sm2644386wmc.20.2019.12.20.03.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 03:57:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Fri, 20 Dec 2019 11:56:28 +0000
Message-Id: <20191220115629.8293-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191220115629.8293-1-srinivas.kandagatla@linaro.org>
References: <20191220115629.8293-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v10 1/2] dt-bindings: ASoC: Add WSA881x bindings
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
