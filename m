Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F268C0EA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40331E4;
	Mon,  6 Feb 2023 16:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40331E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675696002;
	bh=xj7MQynLBpo+XB3+sKlUiA5fGyS2Apw1llbssqMWXzo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=J2VPyKB2Kzu73A10G0+Nm+lRGCuAAFjAt/v+u0WDzJ/bE9jOlt5KkAJNMX4ij0dyK
	 G8XG63AJlgc16/atWFKwivZ7tD6ITHrG5EwSlhuBLlaf76BCA/gxGnAiiltRJc8OKj
	 gzbKznCUi4wWwSvRSURrFBsBpx53GMnWjOHVM9xY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0664F800E3;
	Mon,  6 Feb 2023 16:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A42E4F804F1; Mon,  6 Feb 2023 16:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0900F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0900F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wyheIegP
Received: by mail-wr1-x42c.google.com with SMTP id k13so3251274wrh.8
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=amhvuQJiOyM43SbMnQxHq99ru2XL4cfNPHdX1Hxtb1E=;
 b=wyheIegPWInE+xuWRmetJaDQ6503y6u+ZY4Z/UZOQjNiKTXIDL9x4feew6EE7T8u97
 ZzuCwIHrchMRL8gxV+f9j9YMxTO2FGa+vCzRrj5o5rSKyH2DGEiZ5gTFY8ysGLPw+7QD
 5JkqDA+GzCE5VrVW3k3d2VoLwqjNaRiJiaiU0G0xbh53O4hoLaSVcMy11OooGTv5ftIb
 jnUFO7yWjmptevIW67Fwx0V/tzyylKvZSsFvjU5KH9UCGMqi81UaotxPDh6o8+7CzSmx
 Oqv+TC5CYH9Ocaiz9pl0mX6/S0uycTWNiJpdfFKChHlE7/JX5UU2cBCua/Oisf8JN3SF
 YWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=amhvuQJiOyM43SbMnQxHq99ru2XL4cfNPHdX1Hxtb1E=;
 b=4HT53crgg/dSpPC2AcaotQT8jOqTDR/1TTJMQwsHkfS5KxwEG7CojXm4Ac2gcIx+bp
 jU4s3zMj/Ou+NFEiJns5eKr/A4cgJ+sW5ruMxYBrJxz9zGQg9CKC/pIQtmgmzh6Sti9j
 z7roYWc2CPRWr2zeYhUwwXJ44LVzKVVGZJ4bgUK0+xQ/t952k/4t7aVZMGfiY2s9DcPa
 W3qt5WeBo048ibNwTydw+EAG95Sz7fN5ndp1U28may/U5dNaz/KaGn6FQ0ttV8LC0WEH
 jHkj1RpIc2kAis7AowVyrbtRhFj6kAEslo4E1exnLUmmCPxYoPkdkyduQskuFDlDMK0i
 WhrA==
X-Gm-Message-State: AO0yUKVXitP+4+iCKbw6n432uuGcaachva/F1ueVSH5nOcL7UcR/wSkW
 UmACs7yAya4slwyZR24T9Whxmg==
X-Google-Smtp-Source: AK7set87ORlIh4onmuZwhL5ZeCR/96bwUDAU2cystvVCwMKhtFZxhlwVf6cQZ1UtL61nGykNveZhfg==
X-Received: by 2002:adf:e192:0:b0:2bd:fd81:b503 with SMTP id
 az18-20020adfe192000000b002bdfd81b503mr18911355wrb.1.1675695937848; 
 Mon, 06 Feb 2023 07:05:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b002bfb8f829eesm9543492wry.71.2023.02.06.07.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:05:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: qcom,
 q6apm-dai: adjust iommus for SM8550 ADSP
Date: Mon,  6 Feb 2023 16:05:32 +0100
Message-Id: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It seems that SM8550 ADSP remote processor uses two IOMMUs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index a53c9ef938fa..cdbb4096fa44 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,q6apm-dais
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
-- 
2.34.1

