Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CE5AE7AA
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1D185D;
	Tue,  6 Sep 2022 14:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1D185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466774;
	bh=aYzwWmDXt9zH1PYb2OulK14MTEOx58y9pgrVJbkIt2o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SyVXnvPiggIJFnxD1SlPP8tKb4pSI7kPIeOQxx2OOdEId74hy5BKzIwPooVxj6jdj
	 /AEY2llPM4Ye6zswJ/7jzIaN3LtYGmHigWNAUKHuEBospJz2V9c6fYUy2/1lHvzWvd
	 bvOlbw0pKxVh3F3cU3A3AjX1Mam1r4jzsrLD2xFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 739B8F80559;
	Tue,  6 Sep 2022 14:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A93DF8055B; Tue,  6 Sep 2022 14:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D24F1F8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24F1F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DH5vqlZ3"
Received: by mail-lf1-x129.google.com with SMTP id bt10so17112697lfb.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sOpMJZzTBxmKg0bL2Da/S0t+3gjvGnp5/eRVN6wwRsY=;
 b=DH5vqlZ3DifzAndE1WGjlqndkv4nMInSyP6CFlEl76F7fCWDZcHAKn9mLr4o3J/eWx
 qAV6M9ZtcA2X3pW5/FTrABXz42GEfA0cf9q0qrkzJupxBUd2mUSWH29FeHkdVc9CRX2U
 dUj/IxfiRCdClux06EmYQRnlpIuKfO64L4//SXxpl6rqxo0iX4nQKUpgOyzlgjFBGl0y
 qFqkJDi0uNUVOa8ocGR5ZVgrHdOSnhF9v4kHsAEhX4O3HWKTdEznPiqAxGs84v0FT5/Y
 bstnJVpF9rV77fD84yTkk1K8XldhEbIyfeESqhSqkxEgb14pLOsDslZrbjs1sWl2kml/
 IPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sOpMJZzTBxmKg0bL2Da/S0t+3gjvGnp5/eRVN6wwRsY=;
 b=ACJeKOpNe+hCmW8WW2zmyidH/Kah7Cnl6b9ABUEtXQiTp97mY6yhUULDH4kVBNrdn9
 AfmbEQtVKu8XUCO8sJkSbbSQqgz5wce8f7X2AX8sLLeLlApqARlKdsM9X1HZIhAhxjSq
 gb0ZK/qgVjYa8p4Jpv00lwnZgzzfcuiFgUtBPi5Tfl5Ou7Bh91/J8d1AA99NkmomuwZz
 I1xk7xZs7lkxfv6AZR+SfdrLcnon7aPR2gy0QwDsBrNASJTnTRtsaUbqrtbKBiMsEW6X
 BN0yUbtkZKPK5BdN9OmTbwoOwq20hPbbgG3NiC7HfVKewvdED3vP9kCpeqI/1GNQ+bB2
 R38w==
X-Gm-Message-State: ACgBeo2CiuxrA8Th/MeBTwOB30JR1XOXmff6xHpmpmGK+hM5gRfUQfX/
 8g8E2ksyDkUoLATN0MhwTK4iPQ==
X-Google-Smtp-Source: AA6agR6CJKjLHiqlHiUhS+ULbbF714b92DT6khPT9a5Rz4zXQvjha6yveYrpJ7N528FZdOnuLpL8Uw==
X-Received: by 2002:a05:6512:3f94:b0:496:5e1b:a1c5 with SMTP id
 x20-20020a0565123f9400b004965e1ba1c5mr2095193lfa.483.1662466625098; 
 Tue, 06 Sep 2022 05:17:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:04 -0700 (PDT)
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
Subject: [PATCH 05/12] arm64: dts: qcom: sdm845: align dai node names with
 dtschema
Date: Tue,  6 Sep 2022 14:16:48 +0200
Message-Id: <20220906121655.303693-6-krzysztof.kozlowski@linaro.org>
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

  qcom/sdm845-xiaomi-beryllium.dtb: dais: 'qi2s@22' does not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c6e2c571b452..308a154d2ec0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -651,7 +651,7 @@ led@5 {
 
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
-	qi2s@22 {
+	dai@22 {
 		reg = <QUATERNARY_MI2S_RX>;
 		qcom,sd-lines = <0 1 2 3>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 82c27f90d300..067559c7f624 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -338,7 +338,7 @@ resin {
 
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
-	qi2s@22 {
+	dai@22 {
 		reg = <QUATERNARY_MI2S_RX>;
 		qcom,sd-lines = <0>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 56a510b150ab..f2ddb2847101 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -544,8 +544,8 @@ resin {
 };
 
 &q6afedai {
-	qi2s@22 {
-		reg = <22>;
+	dai@22 {
+		reg = <QUATERNARY_MI2S_RX>;
 		qcom,sd-lines = <0>;
 	};
 };
-- 
2.34.1

