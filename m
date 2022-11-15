Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42C629815
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA23169E;
	Tue, 15 Nov 2022 13:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA23169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513883;
	bh=pNqnYc7LPCO16eaETGeyhK87xkQ1+Etz1AAwSjTZj88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkG/QFZX6/NKhXgKyCc99grhJm0SrxasFQNSd/VZJfcRFK6xwuTtZpG56bf2P26fT
	 0B1kSTFGS3GTDToCv1AlfIzuK6koSSoFjZ8DRRvNhj9suG3kFjxup9y8z1ZIuyayAx
	 xk4oFVefYcrnvKsK98TZ7kztKXTndH9O89NXuZ+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E48F80567;
	Tue, 15 Nov 2022 13:02:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC91F80563; Tue, 15 Nov 2022 13:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24976F80171
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24976F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JPZ0fHXe"
Received: by mail-lf1-x136.google.com with SMTP id r12so24081829lfp.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0wP3pJrxOd4FjAX8XSZyGxgmfCQJkYV5Ck9FfoWKRI=;
 b=JPZ0fHXec/ZF/rA3HkGmGyehGPHZM9rbEoGqsffUFGeQMmXp3Ney2ECVlRBTTvF/y8
 +pNosN+QkbcBiSkN0rrBSyQm1+/aZ/Br74oxuIc7jpzoJmYpYifSyt/yRKa6+Scl9S3i
 l7+N7WnlJjjGqEHO10JkXKCo/o6X92wzYX2FRxZLf2O7+DlaOHsLUHWA+XoD+Jqtd69k
 lmmhz9hfz0Wee5smnR1Hgk8N78hQymSXnzbFfPWPBpOiQDlBbbOmHW2icdjsB1TKw11B
 9eBeKB8IweOHAVAbbV9NJm2Vr3/BUddEON8gInLRZY8EeFhhlIb87NLlPU4v7HnQivBF
 mw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0wP3pJrxOd4FjAX8XSZyGxgmfCQJkYV5Ck9FfoWKRI=;
 b=tqrTdhuNv8sZc4OZzEWixEYXSHusP5t4bzrLOcMu4AVCLrLCrigK67ch75M1pH4frW
 cSEvDHfa3V04htLQODtENkgYPJCRQ/kYfcssHUzqH4v+zioedjKcxzgj85EjZuJEz5FB
 DzOrXf/8GhiDFKWu5YZuze9GxFHxth18ymL+2SLXqg+I1WnS6h2wbWXH/QcZ2p+ep6he
 ROZKYepqqzJTD9vc5Eoog0FNnt2gfw0bp1baWIYAjLSg9KP5oPfavJALxDkiaabP6S8F
 /Q7BT/D2NkgkhfQuH2Rth2/OQSYfEvHoWOocOmsymEjyBAt9NJ5T/y4RJ3nxPs5Bq1dD
 tKQw==
X-Gm-Message-State: ANoB5plEsLJkUoGSciD/wgfLz/WTh8aLszgR9N5ZgcqJQQ9iFC3IXXpr
 1xor+gtmf3xLj6pfdO7LfaVe/w==
X-Google-Smtp-Source: AA0mqf5UI7DsIxp+KqIgTlBJuKyeNzWpW0asfBEJr2NReqjc3Tg+JWNZjnnWBNyOhqneIvVMq6Raig==
X-Received: by 2002:ac2:58d5:0:b0:4a6:4e24:b2dc with SMTP id
 u21-20020ac258d5000000b004a64e24b2dcmr6403652lfo.456.1668513767694; 
 Tue, 15 Nov 2022 04:02:47 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] ASoC: dt-bindings: qcom,
 apr: Correct and extend example
Date: Tue, 15 Nov 2022 13:02:27 +0100
Message-Id: <20221115120235.167812-4-krzysztof.kozlowski@linaro.org>
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

Correct the APR/GPR example:
1. Use consistent 4-space indentation,
2. Add required properties to services nodes, so the binding check
   passes once schema for these services is improved,
3. Add few other properties as APR/GPR is part of a GLINK edge:
   qcom,glink-channels and qcom,intents.
4. Drop unnecessary services, to make the example compact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch.

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 61 ++++++++++++-------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 1fab1d9a2dad..4209c6314996 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -142,31 +142,35 @@ examples:
     apr {
         compatible = "qcom,apr-v2";
         qcom,domain = <APR_DOMAIN_ADSP>;
+        qcom,glink-channels = "apr_audio_svc";
+        qcom,intents = <512 20>;
         #address-cells = <1>;
         #size-cells = <0>;
 
         q6core: service@3 {
-          compatible = "qcom,q6core";
-          reg = <APR_SVC_ADSP_CORE>;
-          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+            compatible = "qcom,q6core";
+            reg = <APR_SVC_ADSP_CORE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
         };
 
-        q6afe: service@4 {
-          compatible = "qcom,q6afe";
-          reg = <APR_SVC_AFE>;
-          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-        };
-
-        q6asm: service@7 {
-          compatible = "qcom,q6asm";
-          reg = <APR_SVC_ASM>;
-          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-        };
-
-        q6adm: service@8 {
-          compatible = "qcom,q6adm";
-          reg = <APR_SVC_ADM>;
-          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        service@4 {
+            compatible = "qcom,q6afe";
+            reg = <APR_SVC_AFE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            clock-controller {
+                compatible = "qcom,q6afe-clocks";
+                #clock-cells = <2>;
+            };
+
+            dais {
+                compatible = "qcom,q6afe-dais";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+                /* ... */
+            };
+            /* ... */
         };
     };
 
@@ -175,12 +179,25 @@ examples:
     gpr {
         compatible = "qcom,gpr";
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        qcom,glink-channels = "adsp_apps";
+        qcom,intents = <512 20>;
         #address-cells = <1>;
         #size-cells = <0>;
 
         service@1 {
-          compatible = "qcom,q6apm";
-          reg = <GPR_APM_MODULE_IID>;
-          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+            compatible = "qcom,q6apm";
+            reg = <GPR_APM_MODULE_IID>;
+            #sound-dai-cells = <0>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            dais {
+                compatible = "qcom,q6apm-dais";
+                iommus = <&apps_smmu 0x1801 0x0>;
+            };
+
+            bedais {
+                compatible = "qcom,q6apm-lpass-dais";
+                #sound-dai-cells = <1>;
+            };
         };
     };
-- 
2.34.1

