Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C4629813
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652801694;
	Tue, 15 Nov 2022 13:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652801694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513854;
	bh=C/eIGPhnTsG/3lpufZnV81iigIHGw1dCAK8d4+aBblY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUz7wbNNrOmrCZ0wcMxnXSdS98KRTqQRgiwHbOMrt9FJNnCmWZORiiJBhuM2809jt
	 La33IzdbcvwXutuD7qe3dl6RekH53Y1qwumsW5aFYH0ZGiiFDUD37aGMjU7yj0JOMa
	 BS8qubPO46anryJK4KJ5K7GTfjg09cr6QTA6g+UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D32DF80558;
	Tue, 15 Nov 2022 13:02:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3822F80542; Tue, 15 Nov 2022 13:02:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FFFF8016D
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FFFF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mk1AG86T"
Received: by mail-lf1-x12a.google.com with SMTP id b3so24074243lfv.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjVM0fa3Mb/OI8tYc5CRvT2v/tfQ7pvhj5fI9h8PquA=;
 b=mk1AG86TXKvX8HICv7twifZbBRi7hYsUcWlIiwjsuqYD6TcEa1Edh4+XewzvwirXJt
 ewBXn3ARW5OzyKpC6Iw/+D9bEGAvJXKS7jb0sAbj5yzBpgYwTccsDnhZWl7z9eflQh9U
 KefXnIU/MBCSVxCXzDvNzM5d4iOKcySbZTZ7qienmj745Uu3fNMerDmK5+lFbAQaL2hE
 Et/N3gJd/LMVB49eEzyAQHHWH6gmYsNf0D20jEO35IBaj3oqDs1TwD1ObuhPxYM96aSh
 sgguyjNjpEtO6wxbo17lFlzTuVnYFxsYm46CQcnAjZdvsUbms5rlFpBKzo75sV5roaTT
 PGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjVM0fa3Mb/OI8tYc5CRvT2v/tfQ7pvhj5fI9h8PquA=;
 b=P/aPb+vunw+Y/BPaLrnj/gqPiZpKKY4101LYXiWaKNn5OuiBe7F77QfnUBjQJxubgm
 4JEU48T6gm5tiYstu3U+gg3b4kbGWw65USOfZepTOHZOlPSKvQWCGiSEqix3wjzNX14E
 2nlFOdmjv3aFmPLlJKBb97Esb6hdsmCffbPuLXaObWMr8RDDSVmdAz8SZOheWDpJZo4b
 TVaQFnRHP/BD/OWhuACPJTkhAY7X/Xc1/WvieH/PkgaJiB/109qJyvj48oFmI6WypT7W
 tSYR3LN8ra2K0AU0bVknmAfgOjxYtULgEmHY7Y/mloUxfUSN54EPiwGCQkjJpFDXTwrl
 QXLA==
X-Gm-Message-State: ANoB5pmEfGLx7CbNuv7Nb9Ae/1NXiYMPEH6A7H7FxnTY8zVh0BSOU14V
 nV0Jqh3XzAkVAdrQGijtM/QiPw==
X-Google-Smtp-Source: AA0mqf5ShHeTijRuh32EOsyOz8zXrSkRLmIrBFOH1Ahx9dbmXAp9rNI68EzOTYhWlTvXJn0wLf4jLw==
X-Received: by 2002:ac2:5044:0:b0:4b0:cca8:bdb3 with SMTP id
 a4-20020ac25044000000b004b0cca8bdb3mr5721268lfm.539.1668513764729; 
 Tue, 15 Nov 2022 04:02:44 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] ASoC: dt-bindings: qcom,
 apr: Add GLINK channel name for SM8450
Date: Tue, 15 Nov 2022 13:02:25 +0100
Message-Id: <20221115120235.167812-2-krzysztof.kozlowski@linaro.org>
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

On SM8450 and SC8280XP with Qualcomm GPR, the GLINK channel name
(qcom,glink-channels) for ADSP is "adsp_apps".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
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

