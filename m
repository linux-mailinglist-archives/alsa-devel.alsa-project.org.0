Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A65B01BB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548691699;
	Wed,  7 Sep 2022 12:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548691699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545973;
	bh=SV0ncGJJI4e1o2PsSMiA49Z/fjwv27VyJ4FI8PgXPIg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G73yyhkM2giDVLtV6R/H/GXREAkoHJlfcd3YBIydaRjvMpZyVFaDldKjrvZALXXaB
	 55KCTwUspDnAlyhTWHynXaQxZtcg0y0ascJ+NXcPSR8mehLXg86odmcZJmP+WIiisX
	 drc//FMDByEhcfhGT+ReP+2jueDNI2bLr/ZFDhRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4AA5F8057D;
	Wed,  7 Sep 2022 12:16:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DEBCF805B3; Wed,  7 Sep 2022 12:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8DB9F80542
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8DB9F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Sf1qMEHp"
Received: by mail-lf1-x12c.google.com with SMTP id x14so6299389lfu.10
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
 b=Sf1qMEHpMyvMOM726UPwmd4tFRVkWl14QmuLSPwXcWWckFo9iNstALB59POadIE3u/
 F4z6QMTShCXZaeHZaFD4RKl2hlR7sNGnoBa5+8K7+ZFhEBx9neK7x13pTAbYvQeS232w
 7R+ZoQUBb2u+2ZUQpdjN2u7ejl8F4+rI0uxB6f6Z4ev9OJLKIzSw8UPB/4KAR99ad/o6
 EZtlx09RAjYbxIODMUR9TrydowX1NenVtzRJZ2fA7I9z9xOzOToR4+92ckfskb5xIy9E
 pC5ayOZDuvvQ9LhpNihN4Bknw/MZVX5C3ayd1eMT+JS3+zKXteUg61uhzMrlufgMWLvf
 xU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
 b=jeJqxwrB6N6XIe8YSbyuBi8b9W2XSU3UQfp486/B4oSXB/7s01bQ5gYwVx5DsSE0AU
 unzIwo2vQ3vGICyxlS+DhJU4PWREVEfSS5NgEisji1C/L0CUG5aLjJYZFEJObTXZ3dxV
 oJsbc19Ic3c5DlSLoSEWwos3OTrznFLYMbLt5/smhvN/8OVNaqjl2ZObm7HJ9FRdX93M
 t3zGB0FKhhdquirSTg/B1kA83GscrmcdU6AQarzcl9WT1ZiMWsqH6ePPtZGP5SPbwyH9
 0+Xl0z7VM6RUjGDRZ4mVak8gd9wTvrxAcJMY5qqfLyivOMt16p/wv2liFLuWylzcFNKg
 +cNg==
X-Gm-Message-State: ACgBeo0LYVtANVm17mBFBVm6LZTfDcQ6FSPpsFqXRc/UlV7qCtjDY0KR
 iAdkGUDu0Te9LFmVBVmwvHkPmQ==
X-Google-Smtp-Source: AA6agR6tnZ/eDnpRKASnvAO3rT5c8S19KCAhnPnR8bkNHZdmAwUtPsbo7BPBgbJoF2jBYLWQZCUFYQ==
X-Received: by 2002:a05:6512:ad0:b0:497:a620:157d with SMTP id
 n16-20020a0565120ad000b00497a620157dmr941660lfu.643.1662545775597; 
 Wed, 07 Sep 2022 03:16:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 08/14] arm64: dts: qcom: sm8250: use generic name for LPASS
 clock controller
Date: Wed,  7 Sep 2022 12:15:50 +0200
Message-Id: <20220907101556.37394-9-krzysztof.kozlowski@linaro.org>
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

