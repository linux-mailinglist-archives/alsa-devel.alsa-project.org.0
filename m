Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E34629825
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:07:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 934C31697;
	Tue, 15 Nov 2022 13:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 934C31697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668514021;
	bh=7q60cUrF/8cqAJSwjr6TgthiUxQbqKCRgHcw21a9F4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnwGCrOctHNF/slbQu7dSdnVTqmDXGZfAqnW+fotIyDhmwC9E0ujToroiWN1hmXvu
	 leM1vV1gIwq24j7uNrJpRRX5RvkPOmhOWkate7o4LmrBCP0lvwXHLw9e3J4KI+bQ1M
	 p4zmVl74TD1CJPbiP6I2tWedlLnFuU4E5FMdVBeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97107F805C4;
	Tue, 15 Nov 2022 13:03:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 620BCF805BE; Tue, 15 Nov 2022 13:03:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 789EBF805B3
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 789EBF805B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HhMszbCi"
Received: by mail-lf1-x135.google.com with SMTP id bp15so24005947lfb.13
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaNhfP/nOLQ48+6TzTDF7R1fJQ8t4XkKM7Atq6L3Heg=;
 b=HhMszbCidv1BjEeyqH+iNPff0dj/tzcenSFpriNx7CLV7PYZcTWKIBiTzXwk/EFCsp
 EjH4nFNH23GhDS2LQpa3VgHid3bsULTh7Lg4AZsAVoniu2iAB4ZDu9+CrqsqZznzVlFE
 CRp9DQL9qlF57NJCWaOva57ewkY5k6csI80ofKF31GymsI4VipYOkKmDKjuxSDm2i4FR
 G3SpZ5cnGmwUzEcn9jaf103ccLQUdiZeW/w9yT/O3+ZC3ACpYIWi58VtTYFPDlM0tBX7
 KZ9XcDCMr4qMVYILY3MAuaL4Ml5s1bzPlIJhg0hOK6rZcWbZoCFVQ1vuakZtLCsbp5UE
 kM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zaNhfP/nOLQ48+6TzTDF7R1fJQ8t4XkKM7Atq6L3Heg=;
 b=lpfq4JZcs31P+NsS5KwLEMsrBRI43ZxbZ8TD/K6ShpEkKQ3r0z+k8wD0HsDXpYZ1Rs
 /IljSQ9hjex+PVAoheR/BdgWf919HyWEKEufYrHlJbQvbIC1eiHufKya5etYZ57g2Gso
 t5PSv/ApzghXroVCZHPEIyhOKj83bljRT4YTojXX4m6xrku5SJnOnrJyT7zY82a2W5Ah
 Ht2aiEVPNfc0mRQ5NLo65cGaH+PZ0XjTp2nzJpVu19+b371eAZS2i8daA1F9mBbxl1ml
 lV0ewXIN/nH4/6l4bGrKjRJGdGP31rWvBbk53f3G3nuA89vi7wLKzxD412IctAVHV0zN
 5nxg==
X-Gm-Message-State: ANoB5pl63mjg/JOr4kkp2kpPHa0Lq5KpFcJ0ASA2RYQZJ7UnWvxKhHuk
 oYHxvi3Lm8UqAu1a5cMsTAUaFw==
X-Google-Smtp-Source: AA0mqf64kKT0ofbo54DaUnDY+YBs9l9fHXVwodgpsd+Yh1/Ebzr2T12keDq5/AyUp3Ez7jpQaMZxUQ==
X-Received: by 2002:ac2:4f15:0:b0:4ad:23ac:94ef with SMTP id
 k21-20020ac24f15000000b004ad23ac94efmr5961832lfr.510.1668513781099; 
 Tue, 15 Nov 2022 04:03:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:03:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] ASoC: dt-bindings: qcom,
 q6apm: Add SM8450 bedais node
Date: Tue, 15 Nov 2022 13:02:35 +0100
Message-Id: <20221115120235.167812-12-krzysztof.kozlowski@linaro.org>
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

On SM8450 and SC8280XP, the Q6APM is a bit different:
1. It is used as a platform DAI link, so it needs #sound-dai-cells.
2. It has two DAI children, so add new "bedais" node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
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

