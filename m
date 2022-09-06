Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53085AE7A8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A3E21616;
	Tue,  6 Sep 2022 14:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A3E21616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466737;
	bh=f9MmtzKcyT+p+flmHLPjyWyp4cAWIcvZWRmouF02Y6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XNNfwqA0AuHH6L8oqP7mc/gsdB/IQSvFkVJ28DOTFTN8mxbgMt+8IjmRNcfUuI32J
	 5aBRMAiJBUPm/TuMvIQV5nPRk+Wm4phKk7v/zdKrXGCWxIEHkuvIxigFtNzVuQTY6Q
	 J27LFvQKzQ2upKAFwRj3kjfaVH204gQNEgS33Voo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2850CF80551;
	Tue,  6 Sep 2022 14:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564F5F80542; Tue,  6 Sep 2022 14:17:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94085F80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94085F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RXai7S+q"
Received: by mail-lj1-x230.google.com with SMTP id bn9so12071533ljb.6
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Hjmn30z7s2eTtMkaCMwmMADdYJlSF9rm+8XosTfoCp8=;
 b=RXai7S+qkruhF7oQokxveyjZl5Ut5RvIVsy3ssk+LE2vNU15qmHeFgXmXItWaTnKkJ
 CC1kIgRgP8Yw23dtgzlrGAi9PDax6Hzix7LTjQZBgUUvb9IWEu2fKibTlYsJ59ciPnif
 tO3l4nMRHL8nl3cuNs2ZJLiIiPfI27yE8YtJUb0bQmfdd7FrPnsTez1Jrxg8W3j7DGTy
 wTJO0g/Le+YTiBnkCKtazTq6asUcShwuS5FlgI2SvN/ffGmxw/6M8TkAaeO1ZnKqcWAU
 UIr6mRJ4WHgZHvDsazM/DO8jQbudRXrZJ2diHNoFErwz5tSHziq6+PJEpktHdvrI8Oky
 CJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Hjmn30z7s2eTtMkaCMwmMADdYJlSF9rm+8XosTfoCp8=;
 b=iYG+nHUVuLkKc64aePopApxdgPLKZXMZo07CR8Euc+bAySbr4rRb0DNAP06dc+eKAM
 Qeap/glo7+H4/Sel4A7RDW9q5uLgvyC/qenLnE5mpXuHvvH/9YERvF9Fg60xis1ZhxH6
 eyzbag1oQazQ+3wXrnK+l95+6em5ZSpg58QrIFQk9Lvrj2CcU58IIwkBzyOvnr8+CmnK
 2697fjJmdSLukw2dY1/VwI9N5HB6hH82qd8Mn+RAg8DhrqiVqtOrgl6/ip3S4w6OymRR
 nNF03hAdBe1nT+mzQ5nDuwMO1GNhJXFWnFC+CXrrV5jBB3Q5yEQ4uFklGwJjRW8hK2+5
 ojpw==
X-Gm-Message-State: ACgBeo362KYQ3X/iYYkNZUgx9oTXYndfY7Q4w/yQsANtqiSZIxvI3tSb
 jbhH6jQkI4B9KHLmoHDw2Y4KnA==
X-Google-Smtp-Source: AA6agR7NPM+qJCIpk0dzGgKMU9iAKaEQX5alLhCnVr1VoZxdvU0lNlotecJJCxRXR2oTSA/3RonqNg==
X-Received: by 2002:a2e:940b:0:b0:268:fa1c:106f with SMTP id
 i11-20020a2e940b000000b00268fa1c106fmr5073674ljh.101.1662466622447; 
 Tue, 06 Sep 2022 05:17:02 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:02 -0700 (PDT)
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
Subject: [PATCH 03/12] arm64: dts: qcom: sm8250: align APR services node names
 with dtschema
Date: Tue,  6 Sep 2022 14:16:46 +0200
Message-Id: <20220906121655.303693-4-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service":

  qcom/sm8250-sony-xperia-edo-pdx203.dtb: remoteproc@17300000: glink-edge:apr:service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index bc773e210023..da9f7a701bc7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4782,13 +4782,13 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					apr-service@3 {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 					};
 
-					q6afe: apr-service@4 {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -4805,7 +4805,7 @@ q6afecc: cc {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -4818,7 +4818,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1

