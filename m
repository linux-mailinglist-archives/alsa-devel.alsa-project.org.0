Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07D5B01C1
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36597164E;
	Wed,  7 Sep 2022 12:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36597164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546038;
	bh=7vwWCNfKHjy4BThutFo9CHxrjqK0PKYige6llxYL3GM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SY3TgjA1vxlhMnu3dr28jKbdTYQIyQnaGo2Lpui8QTzZFVJ6rq6O9lUeIrf3eHDu9
	 RxkH2uhqbYBEm2ZDAmpW/MDBA6PVMpxu6oBF/EaLzzc9fVEpSqV/EXj/JCG6L62zBb
	 DWnZfN9Xxrc1DhVmRm1PydPpNMqSVMoLqk+FZS+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B2EF805C0;
	Wed,  7 Sep 2022 12:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43AD2F80536; Wed,  7 Sep 2022 12:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EFA1F80551
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFA1F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yyAR2FSM"
Received: by mail-lf1-x130.google.com with SMTP id k10so7061277lfm.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Om7NL/8n/AZHbaNF9gisHUFy/iTMOZIGCGU/AWMpqjM=;
 b=yyAR2FSMXExBEjSTTnE4d1l2buPFXE01QRADkyhDi8maXkoZlKZyrO7jjGT+L5phcO
 n7//Hf2E8pDi3V/tJAPZm750UgCYUJGI8QA21af1x4WdzKM6IGDayxT5kJQFtQ24O+ub
 SQDbNGrlEsPE3lW0RtF0CPdNw0xtowKc3Z+46BO/HGx4g+VEg/bENKWOmqfutjF6KkBD
 gK7174juoMdDenx5rMydLULD4DC7AJD+a1OIrqYNKFh9vicpQAzRrqyH4yE1FV0B7Vfi
 7EFx3DjH02YE/qGXN/CWjPonfpcmz1SzWKBVXKjlEjlJG/0dVgOSR60PXFR/Yee7TnKp
 y3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Om7NL/8n/AZHbaNF9gisHUFy/iTMOZIGCGU/AWMpqjM=;
 b=c27vp4xjvO57OchNNZIcUKqL0VN+vv00XzJDM32IJTX6EJFeYYI7Qq34BFXqrKjISb
 c5KnLgYUZM/PdPcfVWs33UkaCS8SrCHqHsog0VZX2AUpeWuCInqWAhk+0y9ImbfxNrmC
 pn1daOKTIVBL4W2sT/w2nl5ZjJs03a1XpygmUCQS5hxFO/Os48oSkDwxA/ME9565xFSV
 /CGYVVSuMvLgP9A7v1aEccnBSaqfu7ynhaAMjI9vbwkWq7btTeWo10VJa2NogJsLDVnI
 xddEwyjJAmtX8MOPZydS6aNfm76m7uX4JCFTKXzefiOCvmGfvC1ZzhrpTC95vQ5qSw0H
 6Wdw==
X-Gm-Message-State: ACgBeo1HRuZqgzRPvNzBLpe5mq4qzXPkLkBJ6uIZu7e47N7/JsQUHyVX
 2R9UbdrFj9ucHrEF93vCDCJMig==
X-Google-Smtp-Source: AA6agR6DqunZMTRvl5zpTEvufNILFw4QbyDoI1vitKQ0AOW8Zi5cVHd/bo8dqxmmVcUIK5w3JMXU0g==
X-Received: by 2002:a05:6512:1683:b0:497:a6f2:1ae5 with SMTP id
 bu3-20020a056512168300b00497a6f21ae5mr874533lfb.7.1662545774311; 
 Wed, 07 Sep 2022 03:16:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 07/14] arm64: dts: qcom: qrb5165-rb5: align dai node names
 with dtschema
Date: Wed,  7 Sep 2022 12:15:49 +0200
Message-Id: <20220907101556.37394-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/qrb5165-rb5.dtb: dais: 'qi2s@16', 'qi2s@20' do not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index bf8077a1cf9a..d39ca3671477 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -867,7 +867,7 @@ &qupv3_id_2 {
 };
 
 &q6afedai {
-	qi2s@16 {
+	dai@16 {
 		reg = <PRIMARY_MI2S_RX>;
 		qcom,sd-lines = <0 1 2 3>;
 	};
@@ -875,7 +875,7 @@ qi2s@16 {
 
 /* TERT I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
-	qi2s@20 {
+	dai@20 {
 		reg = <TERTIARY_MI2S_RX>;
 		qcom,sd-lines = <0>;
 	};
-- 
2.34.1

