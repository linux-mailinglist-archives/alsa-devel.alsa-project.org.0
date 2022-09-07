Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0BB5B01AC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DEC515C3;
	Wed,  7 Sep 2022 12:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DEC515C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545875;
	bh=xdo9lmGeLXAv3Uldv/tBrNhXsh0pfCzfN8Hx3NTqIRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIYnNMuS1qfXQAGvFfBwTFR+gLfZDRImwIHWMKjpgwkNDjZpzn9Q+uXlSC9Agfox7
	 KdM4xlZZUBUtLZMK6jzKu1C3YSE3xVu/qWpRSIh+UAJ/o/7WpAj4cTpLnrCeo8eJiD
	 pFcHRxIs6uRJG3GZNC8gvlNqoEHVtel93+r5cbN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5455F80528;
	Wed,  7 Sep 2022 12:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7382EF80527; Wed,  7 Sep 2022 12:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF54F80249
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF54F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zw7LF+v/"
Received: by mail-lf1-x136.google.com with SMTP id z25so21698144lfr.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
 b=zw7LF+v/GSLMvrb4j4VoXsv5Ndiyq17UrNjLf6ZHflRLbgAEm7sK3GcwD0JMS/OElJ
 3/OYfsGF/OiEcF9c/1CN/H8hvQnGdzhmF6geF/7yqi71PP9SF/ukFEZP3f1dfEwTo98z
 gpYpl1l+vr3g3k1s79HybNOQtaDKMUhUrmmZV9AH9IY65XFQ9Xgyz127hmEW1VK2DO4W
 f4zw/5dR/IzUII0RjLirDuBLqHxWty2WAEWM9fD4Yqb23BBqgtIXqCVDmZzexmB8CoCj
 q2APQ0q1LHNAt9nn8l/Q1w9BmlWVz0jRgWpiqIEjIbZ4LEkzUx2HzUqvN/n5rJcK0ewQ
 h3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
 b=sRoCV9zHX7byt5mK2Jdnhb0bxlgpvkkM18YKhGUy197ZmajzrC4vcc8dDUNYshFCIY
 tfAJER9UOvKYwauZVgz9AlmsfvN7oZi0WR3dmVt7eHkL6Viab1L0P1/ZMA9JOPXtfPEZ
 umBOUwo1mBKjK9252VaU4FlHdus8PMSaviE/ADrKrVZzmf22qPLi5ZAey5EfmetXIWAx
 qHl/iahrGnEGSEH0P62cmD1S0PpWiVI68XCQ/SqRy9RQae+YzWxfggPjZwWPKvvugWe4
 8LQ3Li3Gha9/HgetlrRqkGSw3po3agiosfUXiz9/x2yhvKAI5YRM6KvC+5su3Fy+DMgm
 /sug==
X-Gm-Message-State: ACgBeo1H2sgvrGR2zr7/jGcp7s/uGrsK0dc8j+Qx8cDXOJgdFvzw97gC
 ZoVIfIUg1NB2/8ZWu81eNB2IaA==
X-Google-Smtp-Source: AA6agR6awmhGQ57KqfVEWjXn9QT2nqWu9hWZ169t7LkCnwnlpe3HEgAaREW54MCDCv35aCRH3s/VmQ==
X-Received: by 2002:a05:6512:3f14:b0:47d:e011:f19b with SMTP id
 y20-20020a0565123f1400b0047de011f19bmr826474lfa.427.1662545765991; 
 Wed, 07 Sep 2022 03:16:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 01/14] arm64: dts: qcom: sdm630: align APR services node
 names with dtschema
Date: Wed,  7 Sep 2022 12:15:43 +0200
Message-Id: <20220907101556.37394-2-krzysztof.kozlowski@linaro.org>
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

