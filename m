Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB0629821
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1797169A;
	Tue, 15 Nov 2022 13:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1797169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513972;
	bh=5hgvVJE3YzIAvv1zbBbEFExGYS08RkrShnGYJ/rltSs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/IPaDoZcwQ5zoOHCiCWMoGFRmqCi/0AcLfx04cU/C8NTDv8ZpfL3ipRKj+exDUov
	 /sfZAutqyydjZ/XUBbLMbCxj/X3aor2uSarsGw0XkK0NZOdChPHl81hMj5mmQDsYMx
	 1DR4EAMz6e1MtpUJqTVH6bIHHB8FJ1KGH6IrBxlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884A3F805A9;
	Tue, 15 Nov 2022 13:03:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52750F80578; Tue, 15 Nov 2022 13:03:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4041AF80578
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4041AF80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eFOxtUSL"
Received: by mail-lf1-x12d.google.com with SMTP id g12so24121197lfh.3
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjIcwISYizTMd4GfNjSCEyTXmXHAf6CHHATueef/HN8=;
 b=eFOxtUSLZmpzuZ+rOIG8oQ+VUcQiqQP7CPntwlOX5IfDXrOr27TVUvcIeQJKozFIYu
 X45MGLLpJe2FJi9RZZjhs4nfoG6PzrFm8Ml+/PbDJMp/PDoh7Axl0PCfZ++vBjRsTVmj
 CgV3nZtDJ0/rgDCVac5hBKrONLjsXSjjb+nnzB3w+l0rlI3gsJ8cYtwVygTDjYq4XH5D
 j9KkAZCo04xy8GZ/LNuqQO0IYFu5LqKEazZ5VVnq/N8R7tXJ01lCOfuq0rbOeNh53Lbc
 WSqIsj6ZgQ3hEfWCqwpUIGA8UvQ1gUvKzwPYJw2J/T77dsRzpZz0wCminqXR2r/GWHJr
 1x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjIcwISYizTMd4GfNjSCEyTXmXHAf6CHHATueef/HN8=;
 b=7ZBRgyxfk8J1lk/tphWWoI5//OJkZOzGXVJet8+NWto+daeoY7Kjl+uYLUv0qkEmks
 0B+p0nbmP9B1J0DJhT0pjOzKdchikowPpXadQyW1DJy+xIlufDHiUnnyBOhc3wPWOUcM
 Dg+0jrtL9aEql4wgyUEmdHAmkM/q3Z/53pHKn1Et+TjX+GiMABsrYmB+NNm7NgH4zQ7k
 eyX6m7v9+5j8M5MqiJhPwidB6NK4Wavx8arKtKGiZHrR3QnUmfyccnCdF1g5UvkLyGV+
 +jty0uveG+pI2SUhRasy6LV40hX/Ai3umWKgbJp1mCGojOh+bgAQK7GXx3y8VugP2Xax
 qWoQ==
X-Gm-Message-State: ANoB5pnIyyNJ/5RIrQh9Bvi7HbUXwwxbVy32pRd4je+v9MVKTrMMpSOx
 UoQpG23AvSYgA+NR1J0N/bxFyA==
X-Google-Smtp-Source: AA0mqf7zJGKPdafXhGbdYS0VR7Iqoj6lKhMNRCrXLV2on/t88JgLH5dNUEGY8Em3jgBZUTjFhWt4tw==
X-Received: by 2002:ac2:55a9:0:b0:4aa:da5d:dfd8 with SMTP id
 y9-20020ac255a9000000b004aada5ddfd8mr6090205lfg.677.1668513777308; 
 Tue, 15 Nov 2022 04:02:57 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] ASoC: dt-bindings: qcom,
 q6core: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:33 +0100
Message-Id: <20221115120235.167812-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: quic_plai@quicinc.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 quic_srivasam@quicinc.com
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

The APR/GPR bindings with services got complicated so move out the
Q6Core service to its own binding.  Previously the compatible was
documented in qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/sound/qcom,q6core.yaml           | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.yaml b/Documentation/devicetree/bindings/sound/qcom,q6core.yaml
new file mode 100644
index 000000000000..e240712de9ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6core.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Core (Q6Core)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+allOf:
+  - $ref: /schemas/soc/qcom/qcom,apr-services.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6core
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+
+    apr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@3 {
+            compatible = "qcom,q6core";
+            reg = <APR_SVC_ADSP_CORE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+    };
-- 
2.34.1

