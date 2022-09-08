Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0205B1870
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:21:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B77516D1;
	Thu,  8 Sep 2022 11:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B77516D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662628899;
	bh=xdo9lmGeLXAv3Uldv/tBrNhXsh0pfCzfN8Hx3NTqIRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TjwFqTiOivL75A/VIjn/aTDebbqqiyD4lWwgmvyzbPi19h4ALF+saJc6F3sCd8Q+h
	 H0DxPN/G/OCfe+25HE6YIuuXcQa3gCTixZ43bGSHmqIGg3sDPAf9FBawDzvrfQ1IB9
	 JOUjp++JD10PFgf95VxGhe3tYW7YMvG5Aurvl13g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC65AF8053B;
	Thu,  8 Sep 2022 11:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4809F8016D; Thu,  8 Sep 2022 11:20:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD18FF80217
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD18FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mz1nOyoP"
Received: by mail-lf1-x12c.google.com with SMTP id a8so5107708lff.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
 b=mz1nOyoP37jh56mySK5T5ZNqYhB2Ic/IVtSuKQEKhErsxKpm4x7/moKKo8zi8GhN3n
 khCGL/+PmEQOxTGKfkwnNTr05Nrl/6tgeIdNGgRxL66BjwSjslLse4Wk/k7heQx1xNo9
 s6ck/qfuQJJFjegy7QlFYNkhKz2a19gnb+FJCXn8hkddT+iXDLMaqYN6mvimnzozPo07
 NSHNBTteDHNdErJNbJumjbNT+SJLFxes0XpM5Kj0v6KHvwMmpXfaJtyKXeBDpHuvYqqc
 btPvj0RGYBtheOCQdaMKxrvHdnV4U9JZw9p6ThTO460Nlr1aQJ+pQrFon6lXqPT7b7NT
 LUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
 b=fABWcJAr2sMuNkrYuptkJn5AOXHwwZMZucryiwCjoEWsGnQMOo8DTwPq5j6f+PAo0F
 Fg/gXTgF+JJc7frk1ID7w66A4DBQUSkEoVA9+pfTIAnX7nigj4k14FzNKT5ziOJkOKfk
 E9C5vOIIKsYd0FtFRKXPmYp42gHrbEz5tGWC1oa8q6hwzeRK+NaH4jVptjPAVV3ibeMj
 UUwlo0VZvkF/d8Z2SynQFpFASHHepdAlp6F9yW2iQxKiAZy6hatv9FovPMsOIqRVzShO
 rgSi/OkKe+lf7D4NSx/1tO17HBt9dKJlrFPC9KibHiwmDDHg5kvs3/keNBRmEXQpB4/l
 nhKg==
X-Gm-Message-State: ACgBeo2fPoDUQxc+PbstZO0VIUterRIIv3xFs91agmnzi+NmNrXyKkat
 hcYNL165Gm3Rtm1jJ+EfJH9AHw==
X-Google-Smtp-Source: AA6agR7ANpjBLhgqWrVldq72JM9kG4HVM9XczR/1gYtZOchyJWU4P/uTQWBQ4FtMnyOArTx6n32D7g==
X-Received: by 2002:a19:911c:0:b0:497:9d9e:c2a2 with SMTP id
 t28-20020a19911c000000b004979d9ec2a2mr2479005lfd.458.1662628791911; 
 Thu, 08 Sep 2022 02:19:51 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:19:51 -0700 (PDT)
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
Subject: [PATCH v3 01/14] arm64: dts: qcom: sdm630: align APR services node
 names with dtschema
Date: Thu,  8 Sep 2022 11:19:33 +0200
Message-Id: <20220908091946.44800-2-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service":

  qcom/sdm850-lenovo-yoga-c630.dtb: remoteproc-adsp: glink-edge:apr: 'apr-service@3', 'apr-service@4', 'apr-service@7', 'apr-service@8', 'qcom,glink-channels', 'qcom,intents' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 9ae6610af93a..3cd1f40b44fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2224,12 +2224,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: apr-service@4 {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -2240,7 +2240,7 @@ q6afedai: dais {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -2252,7 +2252,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1

