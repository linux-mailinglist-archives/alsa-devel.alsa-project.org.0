Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657785E7F84
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E3F829;
	Fri, 23 Sep 2022 18:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E3F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949879;
	bh=FgK4uA73wWUehsehEBjIEyztws2K2tU1TJ5ahonoKeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PG9yEUxkyBxh4w6uHi/v1VoqQaWlmjKRRYliRHdLYwliLk7sO4pJdqlF4lvlbYMOL
	 V7quFGgWDRdCTXDMMfDojpc5sZt7+Sblqjkj1U5xy1VsMTlSi4Pe7QRHVR3byaZcYs
	 +EfMsB/yRzlUXLThdZTt1+fjf9r4XIGsnmEZiAG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE57F80553;
	Fri, 23 Sep 2022 18:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 161C0F8053B; Fri, 23 Sep 2022 18:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FC7EF80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC7EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="esctpbQw"
Received: by mail-lf1-x12e.google.com with SMTP id u18so1039585lfo.8
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N5iR35AZK7Pq7du6XK86lz6F1DzAFtqNxi6z9fgTPVE=;
 b=esctpbQw2L3nGmKzQHGVd6EzyWPg/sXJ7LJj8Kx3kxp68EOVvSaBIDrHwjrIMxpPM3
 0/crjbEOQuOiO458/IQEDdK0odsu/xkzAq5jBxKUy5hRoGKwypNT9sy7Lz5CAqNy+qAG
 U5Px2Lkfk3Wtv2jHMd08qlymxL9xjSMA+30WMsUEKc+f5jGp+aIo52jSgBbepftg1tyQ
 KUrbmsCCws2dgRIW0LFX+5mb2WzATEC4fjb95XRce9d/wsMiW5BWf4VVAot5AH9PaH21
 HyV3AHsFBCsK5HJu0UwJWjoKiGd0O2WJNV9W6HnB229ruWUGEOihEv2l3cmwulPIzmZ+
 NaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N5iR35AZK7Pq7du6XK86lz6F1DzAFtqNxi6z9fgTPVE=;
 b=0NRbXOG9Voun22m+XaFvtZhQwF1VUT/kxyEeugUW1NlHo/HnIl5GuhaVyl8idN11Sq
 B6Z7YK1XqqfJGHn7e/IOqSvQ2SwZjyZAVB6hEuEsCbgqIe/dPi12c/Xdryrb5xQWZipm
 XVn2wJYNG+4fKi9XiUC09MzCJX93QpRDmeiqVOfmxvM+yw+dXHDSktIVBap6I3DI2CZ4
 hc+JCFreiEe+8N2awtyrdOMnhF9OIkRVG+yPETBo4dviDSOn17zG+v1zm5UPS/5UBoWB
 wIqt1hYienLzX284+quWHZO9gwMEleCs8dblDsOr6Pw7fKDaF9hPGnjSxLlEPMoc5Zru
 o8Pw==
X-Gm-Message-State: ACrzQf3kjzTR0DDn0UXwibVcQCzwptAOw/z5xgxB0/UKuOqMHkt68XLK
 zb8PLtfUyG8N7dnVQuxwN3coRA==
X-Google-Smtp-Source: AMsMyM6OCdxpQT454Mu9Hj9QhhUmeqWXf80XpGOikOQDBkMj48ZwjGoID0Cq3agtQ4nPGDXl9cZXAg==
X-Received: by 2002:a05:6512:1112:b0:49b:4e7b:9752 with SMTP id
 l18-20020a056512111200b0049b4e7b9752mr3364249lfg.685.1663949769026; 
 Fri, 23 Sep 2022 09:16:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: qcom: msm8996: drop unused slimbus reg-mames
Date: Fri, 23 Sep 2022 18:14:44 +0200
Message-Id: <20220923161453.469179-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
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

Drop undocumented reg-names from slimbus node - there is only one
address range and Linux implementation does not use it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ae31393081dd..903c443a867f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3312,7 +3312,6 @@ slimbam: dma-controller@9184000 {
 		slim_msm: slim@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
-			reg-names = "ctrl";
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&slimbam 3>, <&slimbam 4>,
 				<&slimbam 5>, <&slimbam 6>;
-- 
2.34.1

