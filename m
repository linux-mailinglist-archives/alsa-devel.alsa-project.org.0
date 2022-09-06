Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7D5AE7C9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82CAF163C;
	Tue,  6 Sep 2022 14:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82CAF163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466819;
	bh=sY4xAQwBISzvPGCuH2qFyjkTMD0W2oOyDsw5Uhtmzag=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IdfFpM3rgooanxHunEPwjFEUg4G6WACieCsbcVSpe2WYXAjPEsVgB/ToS28Mdk7LC
	 rewxl41H8dHMYqa+GKLFEBiVMmRE+5GxadpB4CV9dqRz+ZLw098GbRUg65M1JM8VXO
	 qxzcbngB6XkYALOUO50iaTa1LElPNPKHL4Y08zgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 706C0F80579;
	Tue,  6 Sep 2022 14:17:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D87A0F80538; Tue,  6 Sep 2022 14:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11AC9F80536
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AC9F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ywef0Q5j"
Received: by mail-lj1-x22c.google.com with SMTP id w19so12064304ljj.7
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=s7n5H179EHltl//tf656gfcONYELR4s9Z+s2z1U6Gm0=;
 b=ywef0Q5jictPM6qCJWGxeygAXu5gLbMk6gIfqK1eL5GbuAI4lxMFMLqNf+Dw5lZZdG
 YXTNWNakNwIg4km+c5/omQIBi93fFpD+1C2qlZ+eWZPIuTzyg1V6y8MC4sVEvQDdPWjJ
 WUSXSPp8ljLxxsXPjYNQDrswbSR797sFK5uVlzqe9E8v8kHhPCmkhtA6xiJ6eILn/dP9
 Vh8jre9RteSozSoMQHLl5+Nan+5QbHXkR0Y2Z8fiHZMZIgN5bw1LEej1q8JcI++JHCNH
 Ij3EtYRT5GEiQdCATcUjorZjHSD0c5j/pvxegZ0ZxgHfi4u1+AGX1XJ7Tgus9ApXP/NO
 raCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s7n5H179EHltl//tf656gfcONYELR4s9Z+s2z1U6Gm0=;
 b=AUupIY1TDNscJgbRLg6YPrLk5U4hEgMAFbXV9ifnTZCYTpCf4yQBKoirKgNb7Cr3Q5
 rFBtoTyDmweXAdI62/2Sx/wF7Kji9JfQBn+sC3RWPTg3SbBHnXivp6knCnTjido90lDJ
 yDtA2jYW+YC6MfcWe1Wr+gcvsaF3E01HJjSPHLF3r/C6YN2cqIw2muh9Bd8oBjMOUtyG
 Izn4oz8godHPvNdvo2HjmAQpKGlJrZpHLEihWCiAyk4ylXMGc+XxWuASYEWW1x7GEPWA
 69stxggxC6ePpyQC1RBuQnPsjJvfUoEvNCNfam+Opj+IW2DWCndlgokL1y5ehLoTRx6R
 oAKw==
X-Gm-Message-State: ACgBeo0KWb3pjRX2Kwh0IntN4tnTLopLtUEkwrpbbKMGKtTevkye5uDh
 LQI2dQ/GYxzb5Eu2dvYc9a7lEA==
X-Google-Smtp-Source: AA6agR7yVDfxdDSu56xjFhDOAW4R57WFX7r6p+IlD/xKVIj2xWws5UrhbgmXrgq+NOExDDMVpzj8Ig==
X-Received: by 2002:a2e:b88f:0:b0:25f:efa1:a966 with SMTP id
 r15-20020a2eb88f000000b0025fefa1a966mr15014624ljp.67.1662466626433; 
 Tue, 06 Sep 2022 05:17:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:06 -0700 (PDT)
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
Subject: [PATCH 06/12] arm64: dts: qcom: msm8996: align dai node names with
 dtschema
Date: Tue,  6 Sep 2022 14:16:49 +0200
Message-Id: <20220906121655.303693-7-krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/msm8996-mtp.dtb: dais: 'hdmi@1' does not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8dd4f6d09330..273e41c27942 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3401,7 +3401,7 @@ q6afedai: dais {
 							#address-cells = <1>;
 							#size-cells = <0>;
 							#sound-dai-cells = <1>;
-							hdmi@1 {
+							dai@1 {
 								reg = <1>;
 							};
 						};
-- 
2.34.1

