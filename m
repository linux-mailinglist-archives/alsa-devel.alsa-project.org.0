Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA45AE7AB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5CFD15C3;
	Tue,  6 Sep 2022 14:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5CFD15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466787;
	bh=bbWa+B6HEK3BnZMvKDXAs3soHsVyx+S6ZewmVIpdIJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSM3kvWtQ+/2FuCjrPEe4FFzZutjnsVcQWFzq160A+1aDG4HvRcq3h6LAlM5uPBS2
	 l0qrGykiXVfFUMFiAx1jmS+IplDV8vm/NR9WhPPiBEUJlWWMI2e3DAc/mLdicUleIS
	 QCHpml5iAfB0Zc4GyTeEYHj5VqCNhdTsyd1TJIaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E17F80564;
	Tue,  6 Sep 2022 14:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFA42F80563; Tue,  6 Sep 2022 14:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474C8F80537
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474C8F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jD2je3of"
Received: by mail-lf1-x134.google.com with SMTP id z25so17112890lfr.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Olx2xfEl0PLpI3+3+5Qjw680apGzpUP0gS3Mnyx3230=;
 b=jD2je3ofjQyfg/jOh+LKalUVOeBAAwrbkYEw21Sy5iOwMAdmX9y5mHP53gRvgVND6B
 EvGMCz2fygVPNQWXs8kWLOct/tEKZzBrabZxXRYqsYU6lAtic8byQZqKWL/c/mSjwmWb
 HJIekXpLhTd64mrGYRTulWsVj+73kjg6lVZ/s6U7k8B/ATZq1ydF9iml+OrPWHb83MGf
 /yT5LyvlmjZKTulVOpEzsXzzjQinCIfvydt+CIz95iR9zwB7Q9GtF5YwVDVrC65fC/Fq
 e41P1BghT2SnBLR0EyEaU/iYipZ5gdePZbdgyOtM1jMdgpYim/uRiewF9TKYib7rQJ0r
 mHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Olx2xfEl0PLpI3+3+5Qjw680apGzpUP0gS3Mnyx3230=;
 b=5JcYEejqxB1hLM1hVYOXwEOXIGpHZCnqZa7QcQisjy/gHOPZDgq3Z7sO0d8BOTJOod
 8j1WX/quBZC3CEHFZvp86vSpOqyuA0SaPzAtF3K2/wbks81Yt9r8QR7hfwi+XbnDsunt
 /7SZpTK9ekn9/AuVxIF/cSrbqT0rq1cPOnLqbpC5yBRgobBEMt9rdP4FWyub6qyzE366
 RV6KTDowKU4028HhHd0cHyFrY2bfoEghsKZRQHOcuqaFG+9Qw+R0RCk0rV+ASGZnlIqq
 tNsV7szLhTjyMgPU9DOZpuZYa1eiqg/f4EGVQXmqLPTdjdRJIqU/3shxyqHdFU38xGgH
 cphA==
X-Gm-Message-State: ACgBeo0LdnOKPM+fBgdTp61V3Hw67EOMSD4QfutDBOJ8svScORwX6Rpr
 TdIx2vfIlEhHhqfmpvxWvy5juA==
X-Google-Smtp-Source: AA6agR5TML3s8NoEL5itQJnrQzTJ3E7pKRUH2G3Fd4S7hT94Gg7+NWiCuPmzmzxU5jNAYCnta6P3sg==
X-Received: by 2002:a05:6512:3503:b0:496:517:5802 with SMTP id
 h3-20020a056512350300b0049605175802mr4379125lfs.83.1662466628883; 
 Tue, 06 Sep 2022 05:17:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 08/12] arm64: dts: qcom: sm8250: use generic name for LPASS
 clock controller
Date: Tue,  6 Sep 2022 14:16:51 +0200
Message-Id: <20220906121655.303693-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index da9f7a701bc7..da340159c0f1 100644
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

