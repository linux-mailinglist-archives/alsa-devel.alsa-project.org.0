Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8172625999
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:39:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866641697;
	Fri, 11 Nov 2022 12:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866641697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166784;
	bh=rJjL43GO0syW+vzAHX9QSOk1UZeP3Ug2kXCOM43Eoto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hww+zieZeAriYutswcSM3ZrXzZ9pu1gvuW0NIDg1l3n27qXqXjANoGoQzH7Tl+fBC
	 DItMl/d4hO94+2xKNOTQhGyID9OTnZqaW9hxf5Oaxg5qOOGMFapOBMdyax/VNaEnyl
	 2inj4rEoYO3oRJT/w2hi2992r+4QnFRO085KFmME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB8AF80558;
	Fri, 11 Nov 2022 12:36:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD34DF80563; Fri, 11 Nov 2022 12:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFE9FF80536
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE9FF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xVCLNlN9"
Received: by mail-lf1-x136.google.com with SMTP id d6so7889759lfs.10
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+DBxwlSpUyj8lGt+IYb/lufNjAzDcecLdKZpM26350=;
 b=xVCLNlN9wYe+LKsEBRt77PDlL/q8IAYF63JYB5lSSfMFs84t+7wF58gGCa/h9z81Xa
 2U0T8RbljMgHOwvugy2GY7dPPrjnhD9j7mUacdYMcZeS7/3II5eQ/ygKB3bNAtqhLyE+
 +T0VxAZoWW8T1QN6NSsd66Cz0fA8ORrYx3Hlx1x04L070iJb1LhD/bTPrpdkzUgnAJi9
 lv6dvkp20qsj+JrFUekCd1oH1DCybnMVvd+GL+fzgMSPvYPKQ4A41IyqhPJJUgQnXf71
 5yBDqGUTGX2ANXztXXctpT6I4yNpTr6cXL6W6IlQebPwqLWj4ZJg5dimgtf3vCbc4Pu1
 TOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+DBxwlSpUyj8lGt+IYb/lufNjAzDcecLdKZpM26350=;
 b=qZ8dvWe9wHvhW+Y01pPVwigjSDyCrVN8fzrIwrL5Wu5Tqp8YTJvD7aj76/Bs5nS7Y1
 nZmHaYGbYNlF9XwRKzkzeRg2PoZh4yBu94oCj4wIrP0vBtrpWBwmjN3BSyQFEqGNODsj
 NwGhYk3U3lVtcfvMeJ5mj9JgXhtu7Wr1r3fQxG7SoPAjkO7sWtSJ1dGxiOVKcoNkToNc
 kV3NxURWNxr+mRRKPJteFPe5vqfq+fVuNM77DOK+E6VIvgegZVcHuuyi9Yc630HD0hua
 nXHzXX8R20idf8zAFdO4C0dXQKZ9u8wZQ4W2Lp/ovAeaImGTK9dWySOHF5erlmagW9xd
 NF2w==
X-Gm-Message-State: ANoB5pn6h9cnqu2oXumFm4gZ5vV6RSJYGi+Evr0KqR+PsuUVdRdKKklW
 pOdvQyL5kEERBr7viZjAvIOq2A==
X-Google-Smtp-Source: AA0mqf7ZN5G00D3X6MrSb4PtP9e42Wf0Nocjk8XCHEej02zqN2gKndXuNJE3QsxPmkI8wRnr0T37pw==
X-Received: by 2002:a05:6512:3e1a:b0:4b0:25f9:14e6 with SMTP id
 i26-20020a0565123e1a00b004b025f914e6mr577507lfv.604.1668166580125; 
 Fri, 11 Nov 2022 03:36:20 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node
Date: Fri, 11 Nov 2022 12:35:47 +0100
Message-Id: <20221111113547.100442-11-krzysztof.kozlowski@linaro.org>
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

On SM8450 and SC8280XP, the Q6APM is a bit different:
1. It is used as a platform DAI link, so it needs #sound-dai-cells.
2. It has two DAI children, so add new "bedais" node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6apm.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
index 7acb832aa557..cd434e8268ce 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -18,14 +18,24 @@ properties:
     enum:
       - qcom,q6apm
 
+  bedais:
+    type: object
+    $ref: /schemas/sound/qcom,q6apm-lpass-dais.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP audio ports
+
   dais:
     type: object
     $ref: /schemas/sound/qcom,q6apm-dai.yaml#
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
+  - bedais
   - dais
 
 unevaluatedProperties: false
@@ -41,11 +51,17 @@ examples:
         service@1 {
             reg = <GPR_APM_MODULE_IID>;
             compatible = "qcom,q6apm";
+            #sound-dai-cells = <0>;
             qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 
             dais {
                 compatible = "qcom,q6apm-dais";
                 iommus = <&apps_smmu 0x1801 0x0>;
             };
+
+            bedais {
+                compatible = "qcom,q6apm-lpass-dais";
+                #sound-dai-cells = <1>;
+            };
         };
     };
-- 
2.34.1

