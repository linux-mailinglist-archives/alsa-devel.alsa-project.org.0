Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA815AE7C7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58F5084D;
	Tue,  6 Sep 2022 14:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58F5084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466808;
	bh=UTDjLVrZ3JUXEPKxBzXfx0QkwHM5JxbAcMhc7Gbk6uY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0yqwP+bKTUghgmf/hzwhVxZ5+1Vql+N831j2cxapDirCVK85KHnY5Civ1FAiuZ0E
	 FhpkZfa5JN0RqPbQpwn3iI2/4tkkoU5TYAzjy1IBsdac6j8TRwxzgOUHDCWHf8mknJ
	 wnvDEJ0LmY/i8d818whldKVh+jQMCbSrjyU4KCgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E512AF80568;
	Tue,  6 Sep 2022 14:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDB77F80537; Tue,  6 Sep 2022 14:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4CAAF80538
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CAAF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zA/Is61C"
Received: by mail-lj1-x230.google.com with SMTP id x10so12086644ljq.4
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sO81WKVtvhIgo2awJD1gSAd3Fv0gIwfzf8ud+NOPFUk=;
 b=zA/Is61CE5bwxBiHloK3TAgpudaZLFTV6Sfj1ly97/3GgtrzDrFspytWbFmkZPqzer
 bOcUr4VgIleXFvfmNENrx4ZBAgBcLrfqYXR83M8IPCUACtkpFoQgQAsjWH8cPzvWWScj
 nMsT3G2XV4YT19VRieAeB8xwBJ9JmYzGwV00JoYyMCCdZYNdDYWWIaZ2csRSD1ubTzSN
 RuOJbAmwkNWIynzqWbZ9IGqZrphsa0KSV3E/lFhoMT/eTtKW/KHBauY9tKrJNGuTeiAt
 EdVFjEYI3TN8nLgh7hUVsCp+J+CpMGTC3g9K8aXG2eLU+HlRNJwNr7mDz2xLSzLg99xR
 u2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sO81WKVtvhIgo2awJD1gSAd3Fv0gIwfzf8ud+NOPFUk=;
 b=0Pgq1fDLnut1qT5L1V358tJuE/Js6xXMX1s6SeCTf0Szm8nnmcvvnUOgGcRrn8YV8X
 l3UJECDa4Wl/1J92niPfMJ2X5u8/5WmoKADyFB7sGb0nSUIF3vniTxRZLGg2elJNnTTm
 q7hM2d/Pep+dC39twxFUcMjJFQmWwZt9yujiBcSF9yMqLTSomb/LxpiOW/eVvqUhhkF9
 NEN7pdhiD+jBpkO/m8dmNZ6XGJPtiIPyHbpr0Tt40P/Zk9hrTXMSpgmtAI4WRGhZk3qa
 XPCM3nbhrv9wNv9ms29oD8T0Q18wSvDTko8gkEuNdZ/Db/M2esnin4juFjNVYA8GSwgS
 dlvA==
X-Gm-Message-State: ACgBeo2y/jYitq8f9OdU30TVcOH3DeVPCWzFg1h2omtFHnso9s2XwPAC
 DAsy0I5lN2V7GJsjZOhSqcf5jw==
X-Google-Smtp-Source: AA6agR7RIrgLDHUTYfwwRRK/fTmffBGAkqOcgbq1by/s92F8cpNx7SME6oPPKVkSdiZHXg+WY2DWjg==
X-Received: by 2002:a2e:9e48:0:b0:261:c713:37dd with SMTP id
 g8-20020a2e9e48000000b00261c71337ddmr15094251ljk.385.1662466627595; 
 Tue, 06 Sep 2022 05:17:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:07 -0700 (PDT)
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
Subject: [PATCH 07/12] arm64: dts: qcom: qrb5165-rb5: align dai node names
 with dtschema
Date: Tue,  6 Sep 2022 14:16:50 +0200
Message-Id: <20220906121655.303693-8-krzysztof.kozlowski@linaro.org>
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

  qcom/qrb5165-rb5.dtb: dais: 'qi2s@16', 'qi2s@20' do not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index bf8077a1cf9a..d39ca3671477 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -867,7 +867,7 @@ &qupv3_id_2 {
 };
 
 &q6afedai {
-	qi2s@16 {
+	dai@16 {
 		reg = <PRIMARY_MI2S_RX>;
 		qcom,sd-lines = <0 1 2 3>;
 	};
@@ -875,7 +875,7 @@ qi2s@16 {
 
 /* TERT I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
-	qi2s@20 {
+	dai@20 {
 		reg = <TERTIARY_MI2S_RX>;
 		qcom,sd-lines = <0>;
 	};
-- 
2.34.1

