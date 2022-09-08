Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321885B1876
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCEEF16E9;
	Thu,  8 Sep 2022 11:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCEEF16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662628949;
	bh=4O73CI9n+EtBHNmMJG+zyDPGJlFJhCqFpH4+gWUSur0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tknWdSrm7ERX22mvkc9tMv3NoZRUu9N9Mk7DNRuxo0GUIQ+xHiBzsWDucgSqQ+0kh
	 aB8hgNyBK611nyVdD1y8OBJfE8aY/RZwEVRXx1ySPz99Oha3ohaFGvm8jfIdtyeduL
	 wi7r1UDGVGBY5h/y7mI78xYYrbDCGPSMg/hFsPk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08EDEF8055C;
	Thu,  8 Sep 2022 11:20:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8390F8053C; Thu,  8 Sep 2022 11:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1295F802A0
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1295F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UhFCavhT"
Received: by mail-lj1-x233.google.com with SMTP id v6so5737236ljj.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
 b=UhFCavhThNh6TxXf4SL58qBR3DKMK3Dy/WVE9vjoVUi2thlgxJN8MvnyCGtnDcrRwm
 RR4DJb2skwIIkAvYmR2omsVfvZlk8eaQAc1Rr9K5yMfxbhk9BSkqh+lhaUV94x3Pq3m+
 H9vcPkfeWSKXDBz/ccPKKcVY/e70v9I5v7ORVfBwRQfNWpBJLR2QkVCGYQDaKoc10dfK
 8hXTyfi0Co5TXfACLqNZhAiFYJiud8uKirjxur0ZZbX3vJK2oplBnsUOQ+LG8V7UEjgg
 A9/v8tmBtsfVdpOhV3fGpxSEWQ4Ib5erExKYR7PQza87uKpa8OslG0ZiWHVvjfbhnyfb
 bw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
 b=UCVv005wTzKSrbmlvK0Hk7UD1IxPed5WnBk1SpfwpT3nKhaRYIvFnFCTcsdM/V8xZv
 SaPaUDO5iKCLng0K2usetjVSLDiifTditVUXbj1M9Nc92sSNCgK4hBTcADmULPBuiopZ
 bIjU4Jojy2JLuMEW9BzjUEeqDxq8Q5nrVoPPsMeq25VhyxkMh17Uetj1yt42TJHHr/0X
 rBhjyObakf8wNhdLoNPqktE3sjVvxJdEEFTNulwmxDRlYMltIXY731zBJzDKEGJAuxMa
 pwaD1/6sxJcehdxmGGiGzhUcLGZB6gm4qRxrCO3UjDHD0De4xsNerBNq/SuJcG7jVKbw
 OAzg==
X-Gm-Message-State: ACgBeo2nPseNtYkZEsr2o+TLZWj7ooFB6zIh7Tk2EdXHmWiCakPINADn
 vgrwbcNGa9M4CLbpxj4nZeZKXw==
X-Google-Smtp-Source: AA6agR4oswiYip5w2ACiDH4yV3mrpCg2LX56swncTmizedMEFYWoLM75WPpWhtzdRZGY9xvblw4x/Q==
X-Received: by 2002:a2e:84d6:0:b0:26b:dce5:2fe5 with SMTP id
 q22-20020a2e84d6000000b0026bdce52fe5mr170472ljh.12.1662628795739; 
 Thu, 08 Sep 2022 02:19:55 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:19:55 -0700 (PDT)
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
Subject: [PATCH v3 04/14] arm64: dts: qcom: msm8996: fix APR services nodes
Date: Thu,  8 Sep 2022 11:19:36 +0200
Message-Id: <20220908091946.44800-5-krzysztof.kozlowski@linaro.org>
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

