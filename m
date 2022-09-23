Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD95E7F91
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42B8827;
	Fri, 23 Sep 2022 18:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42B8827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949972;
	bh=LUAegXV7qieln7OdYBjHuYIgTWy1X7MavV1M43/Zfzg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=saYIin9lnuMeUwNARlwLfykxdprevgek9LjxTFAKhNfn5H1zomlczvrVZ04h+5C77
	 7qF7gsOUdrQ1IvBEkdHX3pyTDK801oXgplpie3sMgR2o1o53X6CXI0Qc6YhIpeW6Bh
	 /dGWDObTwwBAigLVCzE3aCYzNxbLI1yfnoKv1C8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C2C3F8057B;
	Fri, 23 Sep 2022 18:16:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 800B3F8055A; Fri, 23 Sep 2022 18:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EE2FF80224
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EE2FF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T6RqEtrt"
Received: by mail-lf1-x136.google.com with SMTP id o2so1024508lfc.10
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=O2OpEAAPFwNo068HiZEkERwNKenc5oVwQC2zPGrto2w=;
 b=T6RqEtrtI+OZtEu3SZ1gfjFsTBFVG66Ec3xG99jnU2NdLO3wzBp1iU+QuGTut0MdJH
 sd2V68cAa6px5RDji+IIbWAfBZ7kae1/81NBq+lHICf2TnsJDFANgySfbuaiJG2MzHBf
 QOndLXZHX5qSO+9YP5yyaU+CDLKVKMLkeCrN1gOqmsxqJsuut0GiMuQ5rKLnv3T426xp
 C62QHbPS0EKMlrFgxMseiiCA5HQkS9eaWFQsRYX8eWh0Nhj9+fZCaKhp+r0ySsZPHxpV
 3RNHqpliUaNU+X9yyEweNKM+HuUSwExkhC9+iNq8xJaPi0Z7JVK3sikx+gpZsth9HC9+
 jyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O2OpEAAPFwNo068HiZEkERwNKenc5oVwQC2zPGrto2w=;
 b=M/3r2B55bU2oM4jG1lNP6tjrOeI3ewas0Mj4z03Yx2z4Tnjr4zNa7uRMBAMfn5piIM
 FKBXjsp6JfQ9XJBUcdK5qR3rViTC7Aqg1OyfSd89v9DzOksTqBJwucPtsSPiubcPjOkj
 QOaMvRn9rbkYjOcXTP5rxax22EEfameOjbQAzn89a6zxKoljgi1IPt8gX/0Vc/+5AnDg
 lhkD9m5mUd7jJknfhdrZxNZ2qKsNAdt2fgtqW/ixPAvmbL8Kc5SJYyfRViWtpeojd1dC
 EjI8PU5cq47Nb4Uy6FhRRVf9vUc5/UIWXHJ+g/0ENmTW7Cp30hGKVgy3viuMwNgphJO4
 7mIQ==
X-Gm-Message-State: ACrzQf3QIMDAXpD+fIHOaatZnVRRjWciRveAmsKL4YR0u5A3naSMZ/lr
 J/rvYqvWeHpyCE97JhQRmyn2Qg==
X-Google-Smtp-Source: AMsMyM5SI+ZIibEjrIWvEpRPOE+a4Th3w2+pDwkqoSQTxxVnBD3JN24iNtRFFsou/EJijJKdLZfgRQ==
X-Received: by 2002:a05:6512:6c8:b0:49a:1765:335d with SMTP id
 u8-20020a05651206c800b0049a1765335dmr3432834lff.29.1663949773901; 
 Fri, 23 Sep 2022 09:16:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 07/11] arm64: dts: qcom: sdm8458: align node names with DT
 schema
Date: Fri, 23 Sep 2022 18:14:49 +0200
Message-Id: <20220923161453.469179-8-krzysztof.kozlowski@linaro.org>
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

New slimbus DT schema expect only SLIMbus bus nodes to be named
"slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
called "ngd".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1213f78a8b7a..7b62efb180d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3823,7 +3823,7 @@ qspi: spi@88df000 {
 			status = "disabled";
 		};
 
-		slim: slim@171c0000 {
+		slim: slim-ngd@171c0000 {
 			compatible = "qcom,slim-ngd-v2.1.0";
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
@@ -3835,7 +3835,7 @@ slim: slim@171c0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			ngd@1 {
+			slim@1 {
 				reg = <1>;
 				#address-cells = <2>;
 				#size-cells = <0>;
-- 
2.34.1

