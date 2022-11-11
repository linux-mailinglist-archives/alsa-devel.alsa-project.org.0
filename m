Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629262598C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4DB01680;
	Fri, 11 Nov 2022 12:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4DB01680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166658;
	bh=Ta+I9q/MUuMhvuyas3TInxObcUkyJulu+D2Dyl7mM60=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQFf5AtDBnbh4OxZtw6sfE1kDuJx+WDgB0ulmpXkDMISHocn2InDGIEGnRytFdE68
	 qy8I8IWDa1RoDyHh2/zMjC2Y5lrKjtwiC/VwSgkvwxEsoyXW32rR90DkoY80Q/D8xi
	 xu2e5CBLDwdf5IXUd00nDdXmdZ8QkVU8MuPtAOHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C27E6F8055C;
	Fri, 11 Nov 2022 12:36:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65CBEF80557; Fri, 11 Nov 2022 12:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8874F80249
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8874F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZKPSdCvU"
Received: by mail-lf1-x136.google.com with SMTP id g12so7946732lfh.3
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfDjuOFKuz/+4/FzdYKlkZ69vw3btOLkFXgVYX8IZ2M=;
 b=ZKPSdCvUfQ+4rklV7ZSQx16ScC7V9kumpSo9BjsV6LnyloCLaVJ0dngjVBxr2Hrsi9
 CGxOF33E70rP/rRnCRF3ajRGc+9YR3Awm3keIdj2ZgASSdkXf+xl8sNp37DQVJoiI8tG
 ap1SPP0dszpnLauFUhO8RNiJK4/ulw1xjyuVcsit+/mIRq61CS3VhBuM5IN3jvBqacXC
 gBYEnGamrMtxDAvrv9u1+auXJglZnqICiRf2Od33ETCZf1X7eYyDmv29e1KWnUvteexq
 oUdS7E9y7s61aYxZX+VxcgW8PTnTjgh9oUe7om7qXU/acYbauoEfdzIdPE9sv0XiR7QM
 Jjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfDjuOFKuz/+4/FzdYKlkZ69vw3btOLkFXgVYX8IZ2M=;
 b=xZ7Ma4Pu0nD962dHgXKnujDvaU26XUABI7nmiXrZ2mlMn5enLMKvNRKHpdmNivFsDx
 VguTOxmFDSkbl1IwFKeyfOop1JLSxmgBjviraUfFostP0xQIEV+tZy/n/fpQFqwyzCAt
 FPADC8ed7SY0aqFmgR7A4tZUID5BkI3nF9pvwH7niTWQOxUzaIpmjzqfNwVKiCkUDCqR
 0rqAxOvs5Q9k3cyDjgCUcU9pFDyrNjwlAUwNs38oJnbsTGSvdjaT6zrDndobrckcUg5/
 PdzOM2K6hRdL8RGH99W2m2+7wbwPNCVD1sqNcbw7LaMrqESDss5cOfuOHYFMLL06FNTR
 r0zA==
X-Gm-Message-State: ANoB5pl3y/9PuctuHJBRny5Wx1T/SlhVNeJaxfFo7GLNPSaZPBpEdpeP
 zMPFpiik55oQ4s/HdvAMul3RM6NaXpvNqQ==
X-Google-Smtp-Source: AA0mqf7GsQcfMEHOYwYQHodGjXvbjYjvJ5JL9FA5oZ6eESNpG+IMCWd0C8dHIroXSuERvZiHyVxWaQ==
X-Received: by 2002:ac2:5b5b:0:b0:4aa:148d:5168 with SMTP id
 i27-20020ac25b5b000000b004aa148d5168mr545004lfp.561.1668166569837; 
 Fri, 11 Nov 2022 03:36:09 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] ASoC: dt-bindings: qcom,
 apr: Add GLINK channel name for SM8450
Date: Fri, 11 Nov 2022 12:35:38 +0100
Message-Id: <20221111113547.100442-2-krzysztof.kozlowski@linaro.org>
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

On SM8450 and SC8280XP with Qualcomm GPR, the GLINK channel name
(qcom,glink-channels) for ADSP is "adsp_apps".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index f47491aab3b1..0a7a34cb2497 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -58,8 +58,7 @@ properties:
   qcom,glink-channels:
     $ref: /schemas/types.yaml#/definitions/string-array
     description: Channel name used for the communication
-    items:
-      - const: apr_audio_svc
+    maxItems: 1
 
   qcom,intents:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -203,7 +202,15 @@ allOf:
             - qcom,gpr
     then:
       properties:
+        qcom,glink-channels:
+          items:
+            - const: adsp_apps
         power-domains: false
+    else:
+      properties:
+        qcom,glink-channels:
+          items:
+            - const: apr_audio_svc
 
   - if:
       required:
-- 
2.34.1

