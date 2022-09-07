Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E75B01B0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788791689;
	Wed,  7 Sep 2022 12:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788791689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545894;
	bh=gwGzUnyqwxADtFDpLbCtGAkQewewQwECB+I25X6miAE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VC5hzkaSdYW3v1MBc87XabqoWW1ywtTEY4iVx2rBP411+L4yDQKNdVFxZ1c5GMeXJ
	 O2Lq0OvwBjHxQM/oYGYxc6vMgLA8fAdSGKQExdNg60PVyigCw4XtclnkI+y1cqO5tb
	 Hz1ML0g0itx9YKOU63Z2BBamnf+qyAAprarBfWog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E26F2F8057A;
	Wed,  7 Sep 2022 12:16:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3393F80528; Wed,  7 Sep 2022 12:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFBC3F80535
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBC3F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AT/9rjiA"
Received: by mail-lf1-x132.google.com with SMTP id a8so85442lff.13
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8QkNF8EHcAEMbV0p0CldmJdisF79bfeyCTRVHy2ZadQ=;
 b=AT/9rjiALq4axC819gsn6/Nazj3lemyc6pePeYxp9VIO3dQ1aKy3xqyPEDqQ2H7f/s
 cCSZpsW0k423aaXO5jGpNJISvDZ5I1W0tRBAExb8rL8ve7rbkhtVBlDsvVtX1IHG5Cfw
 LZzzDiDKKAuigd3xi9QPQhZiplGFJWrXQ1OI3AlqRsO8+ATDcsSLgKoHtMcl8ZO9U1A6
 G7v3VBX4GpFfjRITnCl+G6MtFxN49OCkP3xkNEpJQT7CUb+1BII8KxPRQBMVT9pSVlrm
 J4zq476YmHyKaw45OFFbzwts/1/am8SRwcsBva1+BO+60JCtke30J+imMVbCG/TUMqWi
 1wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8QkNF8EHcAEMbV0p0CldmJdisF79bfeyCTRVHy2ZadQ=;
 b=k/czW4uMExcVlpcS2lpB5+u0kTowWPnAJdp5DbaAqjR+qEjS3h40kVc7XfK34WQTUF
 /jyuWft/YYTT9ploOcI8O/FKup+/HC6zWZUUsqjEcMcY3GNGhm3LAXEx20r+A47VxDa0
 82Z/nuxJHy7VWbmO9L/NEATinqFK2quCFdzv7xfPl/7mCKESvtGPxc7W7llaWym1FicB
 A+I1r8cu3Bu3Cma8lCnEDKKtA0vkj5Ttp5vpqXBaOA/cFR5jsqr0dySpinrykT/ucHLU
 lB/qjvbNG40EwFZIYtQnb2e98StZcfeZ6XVbieOYaE3KVHCf2ewXpJmVACbYK/sPpQOF
 bPPg==
X-Gm-Message-State: ACgBeo02JveNkz4FSwUhsvUdUdz3cjPnrLU38tdzTh/7iNO9dH0RvsdF
 aFyOSiK60SRr2HoqWfkYrhyOhw==
X-Google-Smtp-Source: AA6agR5LmZKga4iWytzN3ERlPtDAjjyhJOYh+OiKqcsYZw1SEjnzH86sfehXmLXrTJKzwSHQUhf2lQ==
X-Received: by 2002:a05:6512:3f19:b0:492:fdaa:b535 with SMTP id
 y25-20020a0565123f1900b00492fdaab535mr796161lfa.267.1662545767357; 
 Wed, 07 Sep 2022 03:16:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 02/14] arm64: dts: qcom: sdm845: align APR services node
 names with dtschema
Date: Wed,  7 Sep 2022 12:15:44 +0200
Message-Id: <20220907101556.37394-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

