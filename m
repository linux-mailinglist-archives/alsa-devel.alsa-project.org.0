Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5062599D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4288C1679;
	Fri, 11 Nov 2022 12:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4288C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166808;
	bh=7Qc+zu2JA8GKpVNnJvfc3xNXhqsk5hhmmWpReGpw/+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLbJ+ieoLYCZIZW0ZnBCCwxEN9g1Jdjat/QvlHR/H4pPbZfzvYo4eOYjAcXIZWRpQ
	 UW4NkP/83bnCdSDSAlBIN2HjtAYHV3OLNJmi4HT/ixBhdTqahk5kjkxAlP+HtsGTgn
	 nGtQn7jnHRBtLHREa82hmDSFGV1r6XymoG7cCfZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF386F805B3;
	Fri, 11 Nov 2022 12:36:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F146F805A8; Fri, 11 Nov 2022 12:36:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1607EF80558
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1607EF80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s2gI4VxU"
Received: by mail-lf1-x12a.google.com with SMTP id l12so7922449lfp.6
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IE0XX0QezEMZ/aKTh/HTXAG3MFrHP8nMS3WLzX4ya5U=;
 b=s2gI4VxUfsIKi0pZhF8MIqrbWNCRSvmA7zTOsT2Vi56Km8Hv93CZubsQjOikGkw0Wg
 9zkS5VWib0yrQg5nMWImgwH5ZCZ+biHj+ayJLw4m3VjPx+EBus/mYaPI4myaYuA89if6
 qXJjpQcXUCJ6NllRC+dSxXhOSNtosHTJyFpcLrCL/frgy4GhO3SkUPLdPtHiaMDXw1cn
 11Vbyx806/xRyLzJZVoVsWPcfPvtjtQJshR+HfSIG1ji0K14Bj83yf0RwySzaH3eLIQL
 8xvMkBEWTz1+BPLIAAS+kd34b/wxoKW35i2yMi9GW4CCY0pHLP8hEZ06/WM0cVKqOoYj
 HmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IE0XX0QezEMZ/aKTh/HTXAG3MFrHP8nMS3WLzX4ya5U=;
 b=UdpktpjTpLiQJWWgotkC1elEkd8Ju5XkA7bkAZBF3NwszWmFd0fan7Tkof5hUt7OTi
 HfpYQcLfQrgdgKy1MQthlkWjoJvNJ3v1GIsUde19vFBQvHKhT0jlblRR5jgv2DckAVDk
 h4EAwO8nheref6U/nfNps5rrJP90U9Wbmw/fsbl7S+fef/85qNZgyMFETR2tZf+s6eWu
 YQerAOPpD6Rs3NLXMuWy+0Gfht/PWs9BIyeBqxSrqdPl3tWJST0J2FZp+s7MgCd5oQ0Y
 K6nsBsdgYFz9aJRMRsQN0eRnHUQGR4S66OeG/Hj+4nxpHSfRmjnMjxAPbQ5tIvBnPMe9
 0ZlQ==
X-Gm-Message-State: ANoB5plHs2xRs78oBqemFhUHXoaPOKAnxvHrfjFys28GllV+UOiqgHJp
 JEJ8Rke05OiG/UDe4KKIV+J9MA==
X-Google-Smtp-Source: AA0mqf6AKOgt1YOV3uAwJC6iu43pL9hvefRdn2Rq9U+9FjpDIzZP5m5frQd5HcLJuLfQGTLfRaHouQ==
X-Received: by 2002:ac2:5ded:0:b0:4a2:b387:8b19 with SMTP id
 z13-20020ac25ded000000b004a2b3878b19mr568219lfq.284.1668166578907; 
 Fri, 11 Nov 2022 03:36:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] ASoC: dt-bindings: qcom,
 q6apm-lpass-dais: Split to separate schema
Date: Fri, 11 Nov 2022 12:35:46 +0100
Message-Id: <20221111113547.100442-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

