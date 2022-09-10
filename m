Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E65B4599
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A8916A0;
	Sat, 10 Sep 2022 11:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A8916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801395;
	bh=4O73CI9n+EtBHNmMJG+zyDPGJlFJhCqFpH4+gWUSur0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbxS6B6fw+oPap45tb/oNLbJjH4/N9lIfbTzuaimHOQdIob+knAljFVKjPg87tEqq
	 6t/hBoxLl3NRcX60dkz/hIJskJuoMgPpJJpUSUto4FW8DMaMejucma9X1H98diCTig
	 1E+c1AHzwhfVQ6R7pNVPF4dN/B5VqwoGyccsCAUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F5D8F80536;
	Sat, 10 Sep 2022 11:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A04B5F80553; Sat, 10 Sep 2022 11:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DD1DF8047D
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD1DF8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qapQdR93"
Received: by mail-lf1-x130.google.com with SMTP id w8so6680065lft.12
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
 b=qapQdR93gzt4lPJoXQlVruTuS+4kJX83gbfxa2T5nD2Wwx+Ht6d9bHZvJYPv59WtFM
 c2a7f8tUYS+v1Tyu8CRrtcSu7J2enNj2vpqPnIavoPOOICP8lLxf1FyZLyO6kgEfTccg
 Q/MzgXgDP0KeB8p5obXwWx4qFLj9Jti3OII1xbZnBsL7JCWuzPEwElV2Hm5+z62u1MzN
 hywbl5tCEhDJE7gXzf+0SWkrLqQEHtTeLBYnwgqdRC0wLVLkCga7E1M49bY+XIYlluTK
 i6+lZt8S+FdI3eF7opOWe7OolgIUMIQ73dnW/GTQz7lsQ0XjgvqPEFjTyKAzRTMQj1P3
 LYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
 b=JpfkqDRvd5XumEIGhVzf2UQ0HSHA6OO/QbqyWg0cZ05Y//y6NnoUBD+dW4UIGkf9s4
 ikz1zEMVo59fOy7YYE79Rb4sek7Mx9NEf7ZwiRLANvXRVXSJKG+g+Ao6MtPTxeSXStCh
 AEYU4ppU1MFfR+mIuZT+z3prIzBBjjeSKNToEOWDMGM3bXbRHz0WoRQwFb8bMcxOexav
 Y7kfuscqkpfB3wacgrmKDTIPJJ7V/TNQKfpw0ydB2QRXwE5/AcCKXWrTcRrOh99wftPI
 78g1PInTVRjTpDcgirAQ3FyNLoJyMTRGc+yRno0rxcQV6/7gDy0UN38J+oE5dl0prtnq
 3VlQ==
X-Gm-Message-State: ACgBeo1X4u/MWJwZiivQK71kO30atoSeQLtbtw+L4bB7W1BpyYT5VXCy
 iF7dp6snE7YXCgyfymvK/vGyXw==
X-Google-Smtp-Source: AA6agR4l2NZ8pJM/3UHjTEf3fdyvalMImuyUUBO6xqTNHaSx5tAYbye1qsPA1VZwrA2gqRLq7RNayg==
X-Received: by 2002:a05:6512:b12:b0:492:daa9:75ea with SMTP id
 w18-20020a0565120b1200b00492daa975eamr6415903lfu.297.1662801281512; 
 Sat, 10 Sep 2022 02:14:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:41 -0700 (PDT)
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
Subject: [PATCH v4 04/15] arm64: dts: qcom: msm8996: fix APR services nodes
Date: Sat, 10 Sep 2022 11:14:17 +0200
Message-Id: <20220910091428.50418-5-krzysztof.kozlowski@linaro.org>
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

