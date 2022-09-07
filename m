Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2744B5B01B5
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D931B1685;
	Wed,  7 Sep 2022 12:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D931B1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545922;
	bh=4O73CI9n+EtBHNmMJG+zyDPGJlFJhCqFpH4+gWUSur0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXzLTyoHFQFxdKY40wBxofol2+icuRMDz1C22IWEDT0KavWlnuNAcNBjSebNM5eFv
	 /Ltw8DAK0RiZbOmgem7VwuGKlqXS6uMxBYX1zVmXOjHheigZrICOjw5tNGNyIvsTRi
	 bB7s0Pd5wDFxFWSmN1md4G6OBhmY18RcFZEsz3f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEFFF805AC;
	Wed,  7 Sep 2022 12:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63213F805AA; Wed,  7 Sep 2022 12:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE8F1F804B1
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE8F1F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F+T18O7i"
Received: by mail-lf1-x135.google.com with SMTP id w8so21619657lft.12
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
 b=F+T18O7i1RR3RmnLodjnbrXR4Ld1HD4FYmpTjxTsAKaHH8c8XtjwcUOmyQba73z37w
 CQDItukJUP65Qdg0f2pXpHgPuv0MYhPsYwwx+tswenTByeHg6S+VI1tNl6A3eYRK8RxQ
 dkr2i2BZhFDNmfqITk+OXeaIhC4teIpEv2Dc9CNaXP0n07RsXrlLkxwU3f0FLhJbWL5L
 0ddmgoCM/boRUTLDHQTg8lhjQerJ+EMvZWBqIm7GzkCQu0bqjwJD5phi3I/Q4iR4rMM5
 Z2crU6iRdflUza1bi09FoWMotYFWeZdPN4f/jT/bBX8Ror6Rb+1cn9VC4E0X5pXC9g1k
 LlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
 b=7P7SwPhe/VZknjTl4mGPfub6hT2b9hggWNUg9xcU+/Ri+sdkMu+zLPob8QgCeh3I6K
 /ocZtA+zFCpHhV35CzbZ0p55fV5/V8LKhyMTrJGjlCN/T3fkvtTRO2XQOJd8MtV/CAyC
 pgH7M3jbhN/GhB4aNUSYt5ArlLUvwtliWoyiwRTQSfrW53aVlsk1cm+4eN3ZBOS3BUKb
 LS9NQPaODVgHEH8VaBVe4jNrmY1yw44DjMd3hvBW2QPjHtqp69UhF2gUt/HOEYGedRZR
 jcX1l7bcMj0paUkXX1qB56/gaevRFNn38GG1ZH5YX8J0bMbh9XGWtzCwz3XQ8Qa84zUq
 TEYw==
X-Gm-Message-State: ACgBeo2qI+w9aTIx54nGY3hfzEYKDdDG1rG6IzUfr7NcW4qYG9gPKfa8
 MAoTadF6v3PtmI2t1xwfPlYXlw==
X-Google-Smtp-Source: AA6agR62nrQ6HPltqeNhqkdVFoggD8qRZIG68KGK6gXuvRJCmVSgv9rIlppYQJZP7PeYZi5RbQESIg==
X-Received: by 2002:ac2:4f02:0:b0:496:d15:ea89 with SMTP id
 k2-20020ac24f02000000b004960d15ea89mr827601lfr.69.1662545770290; 
 Wed, 07 Sep 2022 03:16:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 04/14] arm64: dts: qcom: msm8996: fix APR services nodes
Date: Wed,  7 Sep 2022 12:15:46 +0200
Message-Id: <20220907101556.37394-5-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service" and to have an
unit address (as it has a "reg" property):

  qcom/msm8996-xiaomi-gemini.dtb: apr: 'power-domains', 'q6adm', 'q6afe', 'q6asm', 'qcom,smd-channels' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1e6b70582866..abc17c905bfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3389,12 +3389,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: q6afe {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -3408,7 +3408,7 @@ hdmi@1 {
 						};
 					};
 
-					q6asm: q6asm {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -3420,7 +3420,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: q6adm {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1

