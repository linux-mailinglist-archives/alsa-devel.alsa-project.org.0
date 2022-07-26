Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C9B581294
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 14:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35B3215C1;
	Tue, 26 Jul 2022 13:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35B3215C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658836831;
	bh=WZvy09BUqvQyGGFNjyz9Dx7DNLSBPxtBMngA9bHN1qo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YcxJ7fmGk3oOqcA5F4iqJHjg4WtzYzWaIB+/9RMQfKhh6C3jB+xYXylsVyKH+FtHr
	 nWRRZ6XY18glea9oF8gLkPZVH2+sJeqrp+O06ZkeNqJmcsvDYs6rYcK17W4nITWrHN
	 NQ/kV5e2WvzKXquywANcfvRg0ZxizCOiawgR6JlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DE3F80153;
	Tue, 26 Jul 2022 13:59:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD13F8025A; Tue, 26 Jul 2022 13:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93C19F80155
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 13:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C19F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YpYQNziS"
Received: by mail-lf1-x135.google.com with SMTP id bf9so22203090lfb.13
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbbLcikMYE+MXnxTE0IyRsnB8YfOQz4wU6j1hL6TVU8=;
 b=YpYQNziSNDPi/wCGg+oi9mzB1khFmS1f2mCTeoJv0v+/BzUYE7V6QinXkBB2EbTgL2
 +iuqpbaCJbr7n8q126iTIFdfdWCQGPSYMVVS29YYOJ70C/G+y/Y4TOqG+pKs02DXXJdv
 frRe28nip5IbgU1wkNVKaAx3ZU7UyVouxxESfuSjnSKg0OpNEiVOBEUoyb1WioxMY/XD
 vR9/BKAHjQX06WNHLQtBhhokf6sS+VkM3W7IM7+AgnjRJ74ULeDs7cAiMXAXQSmk+0hX
 cqNYcdjQPqp4Dsx3frEJ46+TaXnhug5COomcA2T65UcW73Ioqzf6feEy88o8nnSg/rKZ
 0orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbbLcikMYE+MXnxTE0IyRsnB8YfOQz4wU6j1hL6TVU8=;
 b=lJYvUJ/J5i/WFQGHdalfYmxPAua3KgkqxyAOaC49t9ZeEp0+QOiBVoJhQO68OuSP59
 KxGgBs0qQ8pqzncdBIr8urKXOLIUbLsXmLo4gv4WXdYvWjxOeadshz4nAJ3FgFAEhDnn
 2GouiJfeKg9GT0ethHfiZGZoTUdhsmNWoBo6/2N7a1zmncOW6E6VDj6adPfht84ipIjz
 7kmY6kU7x5cdEz5vyu3ULD8rfLPyyPZ4kiEj9qd+bvX6hz4YY97xTP8FDIWpvGPhLwVQ
 h8iCwgVRj3DZeqPxhMa9QTswNuJQPoDj/9Q42wkBG6km3jzBFpUAJrfp4Bhq7eTgejBy
 EQpA==
X-Gm-Message-State: AJIora+IBIDuEkJWda2uDeh69sHbzU3gCXFR2Udfuo5fDmvY9r2Q6dnH
 zKYejkShmYz3B+4oXuSunW0lrg==
X-Google-Smtp-Source: AGRyM1v35pQlIFP8uSIuV2zi3VN9h5Rd7ZWXuyHKdh5pu2MYS3VHcv19oFsTnHfEbYATIMcatndESw==
X-Received: by 2002:a05:6512:44b:b0:48a:855e:266a with SMTP id
 y11-20020a056512044b00b0048a855e266amr4488849lfk.23.1658836760485; 
 Tue, 26 Jul 2022 04:59:20 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 t4-20020a192d44000000b0048a751c966dsm2697050lft.224.2022.07.26.04.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 04:59:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: qcom,
 wcd934x: use absolute path to other schema
Date: Tue, 26 Jul 2022 13:59:17 +0200
Message-Id: <20220726115917.101371-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Absolute path to other DT schema is preferred over relative one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 9b225dbf8b79..8ca19f2b0b3d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -127,7 +127,7 @@ properties:
 
   gpio@42:
     type: object
-    $ref: ../gpio/qcom,wcd934x-gpio.yaml#
+    $ref: /schemas/gpio/qcom,wcd934x-gpio.yaml#
 
 patternProperties:
   "^.*@[0-9a-f]+$":
-- 
2.34.1

