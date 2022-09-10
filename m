Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071B5B4591
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2194416AD;
	Sat, 10 Sep 2022 11:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2194416AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801372;
	bh=gwGzUnyqwxADtFDpLbCtGAkQewewQwECB+I25X6miAE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CkTeukUwROkuNz075G66BTT4CdtJspepQMb+otZcTidTzuOrldSZSuRwrNLtG/KpM
	 BwPV/82z0/pkxFQ4KuxguZmAom0rOWbUoC3OqEvyuW/b3umU6ibBw0MsaRaW3IkuEP
	 UUTtvzD8CvHrYIhsa2ebBLCNy+HRYWRHjhydKz0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B467F80538;
	Sat, 10 Sep 2022 11:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B524F8016B; Sat, 10 Sep 2022 11:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 904E8F8016B
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 904E8F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yyBttUYu"
Received: by mail-lj1-x231.google.com with SMTP id z20so4770120ljq.3
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8QkNF8EHcAEMbV0p0CldmJdisF79bfeyCTRVHy2ZadQ=;
 b=yyBttUYuH4tygXW9qJQM11T+7T0n/4wrSezsTZBpgSmRMRNGIA1xoEodyTIncSJJLV
 GmIGoZnDkFYAkb6S7I7Sc3NJdyFWoU+RJiyPmMLQUOvJhPbgef/PwaPDKOjftN4PqwVB
 8wsZEMpQf8rx77PeUwc+Dxe8Bfc3vdDuvPqqnLG4Jy5ETuKR/y7ffILB/Z9itZmgnnpD
 d3SWYysVCP629T/Pj8f87jqkM47+FM4DhdkD2uCR9I/YzzRnpfvQ7DPudQoPenp6/Vo/
 Wy2hjQNtX3xjMNv3n/h2xG1H4JgHKtc//MkclS6ejBswuNJXAzPBXlksKkPlw7bK1XmE
 7Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8QkNF8EHcAEMbV0p0CldmJdisF79bfeyCTRVHy2ZadQ=;
 b=xq1O8SB4QQQ/aAIlBZXzr7CXZyjEAIEfQ0UHr6mcnOw2PrlTwLKj4P/79WUn/ZjC1T
 qMfN5mYJGQIA8JbK8yPeF1m/TgGQRe1zj2CSnRvfl7k0S8D2upnpmAVAlzEIKguG3BAt
 q6Zp0tMt4a/ueLh+TR9EVbFQPlV89B6VvctpjqucP1ZmXbccSBSoeVAtiKmvYz7CmP+C
 QMCLo1Rg3WBZQ4fbGdON46KvP4weSn6hSUnyTww6ZMNsUIaiHJPdNAH/N+ohBiqA0nmr
 +bWCB/bJyGAmBLvsGDDR9LdGZ3yrvB1izqHfCfGo/G7SaqHttDnkNu5kqyjRywhIUiyg
 MK3A==
X-Gm-Message-State: ACgBeo0ag45KiPMLUO3GfyzMmlHGbMttyKxK9Q95HEjcpcvN59z3endr
 0oG150HgpOC0tJTL+snz+kZqwg==
X-Google-Smtp-Source: AA6agR7v11ee1WBu70O5QlG0YOmv4myZzh9DgvTOA74X3aEZRne8qOWVCMTlTMzzFtsUC/6E2bJRdQ==
X-Received: by 2002:a2e:8ed9:0:b0:26b:e22c:5e71 with SMTP id
 e25-20020a2e8ed9000000b0026be22c5e71mr2189554ljl.15.1662801279171; 
 Sat, 10 Sep 2022 02:14:39 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:38 -0700 (PDT)
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
Subject: [PATCH v4 02/15] arm64: dts: qcom: sdm845: align APR services node
 names with dtschema
Date: Sat, 10 Sep 2022 11:14:15 +0200
Message-Id: <20220910091428.50418-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Steev Klimaszewski <steev@kali.org>
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

DT schema expects APR services node names to be "service":

  qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@15700000: glink-edge:apr:service@4: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 347c3abc117b..627e32515d29 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -767,13 +767,13 @@ apr {
 				#size-cells = <0>;
 				qcom,intents = <512 20>;
 
-				apr-service@3 {
+				service@3 {
 					reg = <APR_SVC_ADSP_CORE>;
 					compatible = "qcom,q6core";
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 				};
 
-				q6afe: apr-service@4 {
+				q6afe: service@4 {
 					compatible = "qcom,q6afe";
 					reg = <APR_SVC_AFE>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -785,7 +785,7 @@ q6afedai: dais {
 					};
 				};
 
-				q6asm: apr-service@7 {
+				q6asm: service@7 {
 					compatible = "qcom,q6asm";
 					reg = <APR_SVC_ASM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -798,7 +798,7 @@ q6asmdai: dais {
 					};
 				};
 
-				q6adm: apr-service@8 {
+				q6adm: service@8 {
 					compatible = "qcom,q6adm";
 					reg = <APR_SVC_ADM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1

