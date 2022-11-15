Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB69629824
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:06:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABF8A16BF;
	Tue, 15 Nov 2022 13:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABF8A16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668514000;
	bh=CRrvV5x7AnjBjwx3ew0dyYujXVmLbshTzuRKsBUPP5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPw4flis7BwBfm2L6QxYsI08u4fAo873y4zB3M1ThXuBm7z178D/YzAwjyTBpwGia
	 cuByZl2ACQfixcuXfChUbqK2avSGN6ynJCT2UrwJXGGhuFpal3reSJXf+fSWqpLHO9
	 Vvh9ATbFc2kD8iXAIF5hBxlw738Ryr1gn8KMFP/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0287F805B1;
	Tue, 15 Nov 2022 13:03:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7602F805BA; Tue, 15 Nov 2022 13:03:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 359A3F805B1
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 359A3F805B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="anf744Ex"
Received: by mail-lj1-x22e.google.com with SMTP id d3so17236873ljl.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkOf/mQUlsAzKnqG9ceUWMbAjAhQi8V3atO61+Os6Co=;
 b=anf744ExR0fZsJ1I1OyvBXNU1H4MLAI7O2S1l1uefyxIpkbuEbViN251I+wha2NBEu
 wMXyVd/8/HUQOu8O/wOVe26LDSRCRD4pSiP5/+UICaxguM9E19p4okgTjWRNRj7YJomf
 vPGYjFLmqGBffiECXKg0kucezF7nWUpNe3VO1nnBBbiGcLEvqRiA9Bzc9SnxzpZvUeNT
 AkBq/dxBdGOyzFURgAzbYYgfLg1FJbPLyfXtmrfmH380IyYqgISaBZGyAtDIZeOQQALy
 nNMJtsJURx4mIb1SF8JXmasPAfXnwiSKyk9OCJbBNkpWKGnSa8tk3gcQfIaod0Pb1IUJ
 /imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkOf/mQUlsAzKnqG9ceUWMbAjAhQi8V3atO61+Os6Co=;
 b=HWsgILHSyh0WaYcNFvvknkLZGjQokmAGfA3YChWQ7HhxDQdkcc/bzu4nIiwFRDWFwi
 g2OB/4xBLRQpYY3SPYZfzmbdlKoDGuvsfG5h8s+5WXwYBBRYu39h9tgTKj8nxFWJRlkX
 RIgieh85JTB4w7nsiagnv4jdXj8qf9cerW02u3hJ0+3zDU3qwBHDq7/g35frKRmrx8ee
 rWF9Fvix2mWVxhTIzpgA+3ozVagNT/x+0Sbpf6xgCF0fllXWbLfmA0HIvhbFMHAfCJgz
 o8++jzClsTkHonxv6y6CW0IcedYActKDe4/OGU0BaTN/7bXEnrdg8BcdJt1pGIpV8UR1
 CWBA==
X-Gm-Message-State: ANoB5pl2zJgtkG3do8BlFatCfh2mM17acGOeSZJmeTCiVropZwXD4bXX
 yeEIcrQsp++iYuAmx+mM9LU9vQ==
X-Google-Smtp-Source: AA0mqf65mLd6kXKx0FhGMnC9RBT7gtZlpsoxDFQEamw0DjHir+5klbOIYdLhqIrx3mUeZn2XxjklOA==
X-Received: by 2002:a2e:b706:0:b0:277:d75:f1de with SMTP id
 j6-20020a2eb706000000b002770d75f1demr6146907ljo.272.1668513778946; 
 Tue, 15 Nov 2022 04:02:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] ASoC: dt-bindings: qcom,
 q6apm-lpass-dais: Split to separate schema
Date: Tue, 15 Nov 2022 13:02:34 +0100
Message-Id: <20221115120235.167812-11-krzysztof.kozlowski@linaro.org>
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

The Qualcomm DSP LPASS Audio DAIs are a bit different than Qualcomm DSP
Audio FrontEnd (Q6AFE) DAIs - they do not use children nodes for each
DAI.  None of other properties from qcom,q6dsp-lpass-ports.yaml apply
here as well, so move the qcom,q6apm-lpass-dais compatible to its own
binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 32 +++++++++++++++++++
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  1 -
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
new file mode 100644
index 000000000000..4b3ce779206b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6apm-lpass-dais.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DSP LPASS (Low Power Audio SubSystem) Audio Ports
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6apm-lpass-dais
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    dais {
+        compatible = "qcom,q6apm-lpass-dais";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index b202692f1756..d8ebf2e528d2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -16,7 +16,6 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-dais
-      - qcom,q6apm-lpass-dais
 
   '#sound-dai-cells':
     const: 1
-- 
2.34.1

