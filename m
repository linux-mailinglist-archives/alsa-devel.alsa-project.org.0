Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC6C313C1E
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFEAA169B;
	Mon,  8 Feb 2021 19:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFEAA169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612807422;
	bh=wZPshLqGR2Le1bMG/am1PfeNZZwaf74QF6887B0Gi5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXN5Y4i0MYUbC5LEEUaOD6WZHqnjk8EZr0Yr/HAv3YWw201kQzoBP6FwGLATX10AC
	 bk0PjFRnIzTUeZD5yp8THn/zxrE47jxUCmJEav9JOivAxHtolHBDyf1DqvcYtuJVDg
	 FsQpXMYCUjbkF9FKpihUfAICf1/Q2rUI0NnD9jF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A273CF80277;
	Mon,  8 Feb 2021 19:02:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC1FF8026C; Mon,  8 Feb 2021 19:02:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36CC2F8022B
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:01:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36CC2F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="L3IgZ7BE"
Received: by mail-wm1-x32c.google.com with SMTP id u14so14000482wmq.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=L3IgZ7BE8UKYs5RN65jeJ5VyW1p1R3WssltervwC6FLLvOnOEFrY2xAFKjnITTdgkB
 KDLyfDFvKateRh4yZtt+XaAqvBJiDzrEKP25V7lH/T5cEKnmcAaLQ5HBH9ro6BzqHNRU
 NKYhPboaEv1MbqrNu0wxE+RgiNRaVfwaY6WjdX/NAiMPtYKEENSGv/+SKSqd+OlutZkw
 4OwYLg/jyuqY1h548ESf3tqrLU7MJVQvpVp8ik1b+NNwFcth30Xk2ALLJIqwbT2OI/9W
 B7niNfhg8hgm2QjBD6EeS1eKK3vYOGIN11CL4gWJ0mCvhDE3xqWBcyO7LyVas0ep17NY
 bDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=KbpIX5gSFfAdK8I3Ug+MelCJY4ZUTLvLPnN8J3/FOQl6SQ+QTloJJYTPS3sbwSdg5f
 Vsxw4k7TrWkNSq+CeLopsblLho+Wpfb7p7jOJTgB7uNCBOdIgAgHkOWsQuyFBoaSAS1M
 E6v13+9M8Sy3i4WivhMndce0UD2dg/6Smg8eQSScqQKRkMXbqmf2A5x3XVCF+C/CbmRc
 QxkPmE1C/VnMVlpHdJdL8tOOnnjP1kP0m5juVaP1W4+7ukf4jo9Rb0+SMbGNhXo3943q
 lMmN7Lu1ewx3sFBrGQSZvRfDpg+HGTJbPP3xb0sWnrn0WCyOTVd9a7bVQSLfSdcIymNO
 HzZw==
X-Gm-Message-State: AOAM530w0ssOdF19Zz+kd8RZDI1hnQcxNt/u/KvbeS/OAGOGQw42MFj+
 h7dlTZg8lh3/k32XQ9VbmtoFOw==
X-Google-Smtp-Source: ABdhPJxCZi8H1CydVhCZfqpCFVFhs9A4rb4nG+DOMBKxnKEbl3LV8R30QFkuR1U+WZjKFHv9VJp9kw==
X-Received: by 2002:a1c:67c4:: with SMTP id b187mr15837322wmc.17.1612807315064; 
 Mon, 08 Feb 2021 10:01:55 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l2sm21194937wmq.17.2021.02.08.10.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:01:54 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 1/7] ASoC: qcom: dt-bindings: add bindings for lpass rx
 macro codec
Date: Mon,  8 Feb 2021 18:01:03 +0000
Message-Id: <20210208180109.518-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210208180109.518-1-srinivas.kandagatla@linaro.org>
References: <20210208180109.518-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
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

This binding is for LPASS has internal codec RX macro which is
for connecting with SoundWire RX codecs like WCD938x.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
new file mode 100644
index 000000000000..443d556caa69
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-rx-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) RX Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-rx-macro
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: npl
+      - const: macro
+      - const: dcodec
+      - const: fsgen
+
+  clock-output-names:
+    items:
+      - const: mclk
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    codec@3200000 {
+      compatible = "qcom,sm8250-lpass-rx-macro";
+      reg = <0x3200000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&audiocc 0>,
+               <&audiocc 1>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&vamacro>;
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-output-names = "mclk";
+    };
-- 
2.21.0

