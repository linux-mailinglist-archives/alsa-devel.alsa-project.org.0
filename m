Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7513655D12
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 13:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCC2D681;
	Sun, 25 Dec 2022 12:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCC2D681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671969639;
	bh=CxfcHYS9gwZjj6fDbQH0CTM/pvsqnMcJ6eK+yjrQDJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=h2TomDEonrNLULTAhdDrYiX8K6PN+OxadNyyf/w/8Wlp2ePvsFu48lt5ooaL6lZQu
	 NTZGU+CxdEO9d+elYbsLrb1QXYAw+4qc3+ij5pClooO9fANb+iUm/J4KVUSUS9A2J6
	 KWuCy+7jICZy3de09fF9cICF16ZX/Y38wg4z2rJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60D8FF80245;
	Sun, 25 Dec 2022 12:59:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D91FF804B0; Sun, 25 Dec 2022 12:59:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13938F804E4
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 12:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13938F804E4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zmGNYtMf
Received: by mail-lf1-x12b.google.com with SMTP id bq39so5076929lfb.0
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAptk8rLRuc++EiVR2BhzhCRqBC2cNP+rXcT62Z3QGY=;
 b=zmGNYtMf+5LhzdwQftQDvVNNA+RobLBX7wcSRBRTkkHfTsvmtclRPocgH99ckU6EEf
 /FNaC0s/R6TrtcQwNhwLNn/Rki4cxAp0Yw0rl4Vx9vzLWOqjlExQM3fxMIq5hksaBH0h
 tE5yriELlFD4ok3T7NDt+I9ET4DSYmNg1wfcFwHovXFtoyiG32sSaHlvYZmO06A3rWyt
 6Iqh7CGU4I2TP0G/jAxsyUS4/JeHga/Be8UcfftZYmKyS+Pbmjl5mxrvY/5lA6TBn2IS
 t/dFTyAqNMZi/Yr++hRXj2w5gVcUm7SbzdmQNpHWChxxg6UzhIfXZ+9ryY6aWiqJeUt7
 YeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FAptk8rLRuc++EiVR2BhzhCRqBC2cNP+rXcT62Z3QGY=;
 b=Qpj4fVw7fC3E6Wns6l1UVw24BbhHxzvLqm2N3W5HB4/9sPfcsCRrhokz0WVQhjsmmo
 DoAYqNb2X/re+CD/JbCqsauyaIzKv4fQLM1i2fWD3w3rdJrs31tEjOiJjPYqKxoTDxK5
 FXXACNyMqDOEFVe1LuqGqgimKEw9s1YTIRwBKuf2UHLDZSfiPNjqLDjFf02SBTIaPY+6
 ZQS4J22CxiOYYCBFAnnmQDnfuODKLn47nhOhmSD5Zv6niNohk6A9fr86fgr8wiumQaLc
 qXj59CM1Qtta2xMfZQiUkRWPnncB6yJmusWAA2igRz9QTXctXTgjGHprRfeqzSEjIq/+
 /B1A==
X-Gm-Message-State: AFqh2kqDI92PqwCo0v5FsKKx9wc+qEgSnImbos8zrLMX2S7qscrkjaew
 MqvrwqJCo4EG4UkVS4m645W19g==
X-Google-Smtp-Source: AMrXdXvKd6pNRzuYv6mW/WnS7/IrdvhA/uDP7T3G8ajivWpzKMEAQFkTnJiW5WQJvksyCUsiPMMYLg==
X-Received: by 2002:ac2:562d:0:b0:4b5:670e:b708 with SMTP id
 b13-20020ac2562d000000b004b5670eb708mr3708603lff.14.1671969552074; 
 Sun, 25 Dec 2022 03:59:12 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b17-20020ac25e91000000b004cb061887b5sm128819lfq.126.2022.12.25.03.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 03:59:11 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom,
 lpass-tx-macro: correct clocks on SC7280
Date: Sun, 25 Dec 2022 12:59:07 +0100
Message-Id: <20221225115907.55250-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221225115907.55250-1-krzysztof.kozlowski@linaro.org>
References: <20221225115907.55250-1-krzysztof.kozlowski@linaro.org>
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

On SC7280 ADSP bypassed platform, there are only three clocks for TX
macro.  This is already reflected in "clock-names" but not in "clocks"
property:

  sc7280-herobrine-zombie-lte.dtb: codec@3220000: clocks: [[219, 8], [219, 7], [220]] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 66431aade3b7..da5f70910da5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -30,7 +30,9 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 5
+    oneOf:
+      - maxItems: 3
+      - maxItems: 5
 
   clock-names:
     oneOf:
-- 
2.34.1

