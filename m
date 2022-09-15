Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C325B9B76
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:58:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C271219FE;
	Thu, 15 Sep 2022 14:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C271219FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663246686;
	bh=S4fHf/uBiIVh6nJLxyMt761S7wfDT7Mm6rK0jppVPhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Prpub/sdDfcaRLp2tm7MbRqew8V09oKgDng7MQvB3cNvhc8o+szYQ+CKqSwL1IvmA
	 uDN/DmLr/w5vhGiqPQHo3OBFlOUu/Ui2efdO1SbnvO38M+NnSO8WM/rAous80UWxLL
	 rQGvfGSD3bSckCLLvkylnyIAJJRjT/JDEbBzx8F8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E59F80238;
	Thu, 15 Sep 2022 14:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09350F80238; Thu, 15 Sep 2022 14:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA185F80238
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA185F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vkG472mn"
Received: by mail-wr1-x430.google.com with SMTP id c11so30735421wrp.11
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dGW/xqrLlvyfRA2Og6cgZhYC9ChkIds6ZcWKdAIYiaA=;
 b=vkG472mnaa9rO5OnORsSKuzZKJ0n3y0S3uW+2fosrV1bYuVrCN7R2lAqmv4ThZaeLh
 GzQl3HknIRILNHYa2W4TlAX9MrXhpJP+MR5374yjMHCgVbNcAG+AX/79uzDpqY/iiYwD
 yJGxUhZIz/AYetdRnvkk1Y7LChFZvJF/TMc5TT8lqozG5UcUGBxWLylRgXFjy2poMqrd
 FiXyyDF9u/mshGmcXuSmNIWKuZ4xzStLn3XCq6eIk9S2atqvGTXgQKsqWfE+ahYwDFSc
 JsqmKlyecZRfIbBtVxyh5ZO+veiJfNNHxI3mCDD/0kRifcsM/0wRhiAY5H8Yu5Tks2EI
 b62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dGW/xqrLlvyfRA2Og6cgZhYC9ChkIds6ZcWKdAIYiaA=;
 b=nNqkpuEXNqHAK2/Lr9MHQevUYx/d36kzxnWOlXq5a1Mab8BkUzVoo8pQge3nFyE/Zo
 bm3g661Cqhv2NmLMEgwbAgh9OR4qxLP10lo3Bm9xt7vt1JrXZi53CVFyw8jrApEfk77h
 P/tolkkcMqKKHAzwrr1kEuIZ9O75dJGVNaIX0TUtMVYaKX5s9swkoNXUZSKM2ltQ3yqG
 1ThP6B3mbgf6vaeYVjC4cB7ngMpVFCcr2716Y8aiyEgpe/2XXuDT4/AaJnCZp1MWzPl8
 By/ZXHOEUaPIaYECvQF5RRu7wVNYGQAfKKHePI3B1ICYp1v45BGczGt5ncZ/50VphIb3
 +D+w==
X-Gm-Message-State: ACgBeo3Zl9+wSSNNz9LTD73a46KRzuSOtykm3JmyUZqX9Qyjg+Puteq1
 UVnKcrjB4VHLbnEA65b8dxeAFXQftXbl4A==
X-Google-Smtp-Source: AA6agR6CtKCYoQaagDp2fybzX9QOC1iHKi3CcXoXjAMmmG+fxC5phPkk1d2XMnfAzx2/pyFy1nSDgQ==
X-Received: by 2002:a05:6000:1546:b0:22a:b31f:6c8d with SMTP id
 6-20020a056000154600b0022ab31f6c8dmr11221979wry.275.1663246583642; 
 Thu, 15 Sep 2022 05:56:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003a845621c5bsm2764776wms.34.2022.09.15.05.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:56:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 2/4] ASoC: dt-bindings: qcom,
 sm8250: add compatibles for sm8450 and sm8250
Date: Thu, 15 Sep 2022 13:56:09 +0100
Message-Id: <20220915125611.22473-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
References: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

Add compatibles for sm8450 and sm8250xp based soundcards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a3a4289f713e..58b9c6463364 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
+      - qcom,sm8450-sndcard
+      - qcom,sc8280xp-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

