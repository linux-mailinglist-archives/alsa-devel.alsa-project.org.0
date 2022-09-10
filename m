Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3655B459E
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:17:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBFA16AB;
	Sat, 10 Sep 2022 11:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBFA16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801465;
	bh=SV0ncGJJI4e1o2PsSMiA49Z/fjwv27VyJ4FI8PgXPIg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ooBSoyYu2Awf738Snn4MpvfUjwASpdthdfOueVPHFa5Pve43LZ11uWrnApwKVUSgY
	 2vufdkJyrdkJLjENCqtQHAvJ70j45P5epvKQ76qSk1I/rKOF0N14e+YeGPm+wgH4TG
	 TSVSyEmDfL89LfqKvCSwm9M4oHSipe7CTaNUf3Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8ADDF80549;
	Sat, 10 Sep 2022 11:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 962E7F80553; Sat, 10 Sep 2022 11:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E5BDF800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E5BDF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Rsz6LsFf"
Received: by mail-lj1-x232.google.com with SMTP id l12so4754665ljg.9
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
 b=Rsz6LsFfnqmR36Oevfef1XQ4ctRQDNyk6AVpk3sJ0VocJmtKtRxrJ5Y6wTntgo/KoA
 JdF62sz51+zHvEHuwrevm/Q9/VUqgIZOiOYctiNfsRk86D6O8izzILqyWkzAwgQQaiWC
 Ppgy+mqSeepSFohcshjktqK2HmC+8yR2PWcZSyrqkwPfcWLYwlOg6wLlVrO6EG+mQo7D
 SOS1zvT12yvBziHAFvjhK41reSJoLAWYChP8P6SsqmiB+RIDcj4Me4RhWil8dLoSLMKR
 aFFfOLF9JLW3ff/XLuAuChQWQ1aoLIHnn6thK5Xg8LbORdKEJLEbZrSjb7BKZNPMFR6+
 5kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
 b=ykkY15MIr6K/FxuNcHTUUjzPuTOwjsZ+JxQT1SwRF0L7Dh0cCUT2SrLAv9UaYYaIWW
 QY0GOTUlLkIX00EkMc9Vb/1ydY/GaoEnNHfL/dFV77jFPFmDYRzSSMg06GjGmPTQzAP7
 5IJQXwFxxriyNXohFouvd7772TwE+7JMoFIge/+7QODwUo2/AY9IvCJ1+eiZitkCzTYF
 MISMqzRkyG36HNE5oDOqMzVXHy3aMqb+KVc1Xd6wmoBv7xV5vgLPihJci8fxgRyg8n/W
 dcKQcRM3ENvSNEIS+wclZXzOmopVqD5mNwBkJuLyWg6teS6wM0AzBLv/vjdeht/YzhGT
 I0RQ==
X-Gm-Message-State: ACgBeo2tHio0cWx05eauqOjvKrA7r7AXik9g0VvpHEe7ZK6ebpeW/M+C
 6itwHVeN0iNP9QRpzncwZXFU7jK3KHc3AQ==
X-Google-Smtp-Source: AA6agR7YXCEXY5JmG+5bvoz+TD75A3dMfqQpRqVBeqMKsXkzpNvGzIY3qGRw67lU6pqY35ES7xYGng==
X-Received: by 2002:a2e:bcc7:0:b0:261:8fb3:d4ec with SMTP id
 z7-20020a2ebcc7000000b002618fb3d4ecmr4836085ljp.96.1662801286633; 
 Sat, 10 Sep 2022 02:14:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/15] arm64: dts: qcom: sm8250: use generic name for LPASS
 clock controller
Date: Sat, 10 Sep 2022 11:14:21 +0200
Message-Id: <20220910091428.50418-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

The node names should be generic according to Devicetree specification,
so use "clock-controller" instead of "cc".  The bindings so far did not
define this name (as child of APR service).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 84b4b8e40e7f..6ee8b3b4082c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4799,7 +4799,7 @@ q6afedai: dais {
 							#sound-dai-cells = <1>;
 						};
 
-						q6afecc: cc {
+						q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
-- 
2.34.1

