Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6F5B1884
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E13D16D2;
	Thu,  8 Sep 2022 11:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E13D16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629017;
	bh=SV0ncGJJI4e1o2PsSMiA49Z/fjwv27VyJ4FI8PgXPIg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ce9VsUDdGXqeepbJYJp7gl1rFXKcNdDTx7Qj4lh+cyb5FTx7xTJh2kRo+vIWffjXY
	 nDXtMi/HnDH/XZyHduihT3HW22Bdmkmf5CtJkKnmTLtE04jJ3zxEhcQx/pnJEQWMO8
	 obHGE+AN2rplxUYCUJiKCc001FEqCEDKW8guLfoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD607F8058C;
	Thu,  8 Sep 2022 11:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67273F8057B; Thu,  8 Sep 2022 11:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8502CF8053D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8502CF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eVOLIW0j"
Received: by mail-lj1-x231.google.com with SMTP id p5so6094762ljc.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
 b=eVOLIW0jxAzVmlkmIbnvK2aSkpKg/2XmlleU+EkV3uBV5z3psBN00RQs0ccy2YDjO9
 DmpQInSSQOFdxywzsACE9UvcsQDnOtNbOy7iqGVwxNDpJs5jQ9g/IWz9QAu2Fh844h1P
 6TVHS2MRkMZOazSS7dcjj/h13R3Ug3g6N0pzGQdPfxKU8oxC6p0GEkFr2b4bFFwBeyLi
 BjzAKSlnvvqqBLWP7D08JIKtxEfvoqNqQsdwIn2KFseKddVSgvpdhxntUxjDPcBUpLnD
 RqauW4GBdfCI37nToJHaxMeyztxZUfdGw/5lNiQg1ICkn3PYclKQJQpp3H6C1ZqtuyO7
 euKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
 b=aygBsX0tIlsfDV6PiILR0KkVQcirnkUF2k4SE/LFngJuq0mweG8VWSYkUkBV7YI0v7
 tKyzl5IjF4TAQ3i2KE7COQp+/XtmD6E6G1LzYL1uV/F5ztmqXIKho8uwnR/Gp+Z0DXdu
 LrKIqg1n8GLhmthdi0N+mGWuYvn+CK4Ee6qJSIlmEGfFJratABp8ls9gHkHr2U9qiTb3
 YqDlfGmLXy6t5qDxoXVBy07IY8zc+xAvrwFVOZV8KcmQl8rI3CextWJR5d8ToBlQgfhF
 8n4Zc48hjZt04BdHHYxLlBHI56IryvWM1DnF01uRkO4qO8Dkc3Qtcsu9QMza/juQKZZV
 qm1w==
X-Gm-Message-State: ACgBeo2SnY5H6kL6/+yk9VZmJWGDSlLrwvt05GrN2M5Eh7YlDyDNdbw5
 +7kSrJlOqWRJnhs5hTPX+AfvqCifKiPMhQ==
X-Google-Smtp-Source: AA6agR7SvoJrTW/AcLEkiVmjJFApQ/aR06fIu8LCosGVJ2W7ZDnn9+22+z9f0tPqXWGQugKKZfm3Pw==
X-Received: by 2002:a2e:a790:0:b0:25e:cb61:c1a with SMTP id
 c16-20020a2ea790000000b0025ecb610c1amr2108771ljf.177.1662628800642; 
 Thu, 08 Sep 2022 02:20:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:00 -0700 (PDT)
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
Subject: [PATCH v3 08/14] arm64: dts: qcom: sm8250: use generic name for LPASS
 clock controller
Date: Thu,  8 Sep 2022 11:19:40 +0200
Message-Id: <20220908091946.44800-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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

