Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206335E7F89
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC0B827;
	Fri, 23 Sep 2022 18:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC0B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949906;
	bh=v/BlpdBRXODT5Mp+pnSPWjus4IPHaPr7IeThvwO0PPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfKedPs/WbC4h9kenSFUlQ4KuNrf+CBkf4yNxpiNbc2jIeyiZ0JMceparO9N2EJ4M
	 bDBX6NoX0EhiJobmBcBSWMe7FwmScmUoCpFugeQLFCifPNwYGm6PAL/h1xsKHUvho0
	 3VkeuomPNSeaI62Jv1kbdNcTlurUGKyeMDYgB4jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C54F8055B;
	Fri, 23 Sep 2022 18:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AECA1F80549; Fri, 23 Sep 2022 18:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B07AF80539
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B07AF80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bP+EYhTb"
Received: by mail-lf1-x134.google.com with SMTP id z25so1089088lfr.2
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rQi7cXeOGY/HNtdfUBGhQ3z+Yj+bhensaF8Epr2+VKg=;
 b=bP+EYhTbDFAc/wpZjl1F+uUYw0akkDcMgOciFC6ZrTsiuDtJHRDli2oc+mgz1bjBEB
 bnhvHFeOAwNM2l6f7BThVz+vU96aoGVEJkK5fdG3sgYxl1lmP4B92j3L6yyXFAWWq0+4
 V36Sb4LRJYOLhjOtaFEsrYiwanKnuwGvDtJjQwJWrLS7npcOu8MvFXs5od+poKHQ8ziT
 Ar0hGKSeaxWWuwpO6YDVm10TkyFq1MzJ/ky6K7kq0tmONOPlgnnbJ0vjM3Yjbef7Y+7c
 rtikQwEl5zIMmSRfMvu27qOm9jryi4+IiGImadCpa0rZA9BGdNGOL2F1CXwqMCJfyu5d
 LT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rQi7cXeOGY/HNtdfUBGhQ3z+Yj+bhensaF8Epr2+VKg=;
 b=qHe2Y68sBN9u8JvPjxbq6TKqi8ARTD5dn8SurYnT0PCV2+B0WCVreDK3q/Z7FR6SWv
 p0y3zUAt/JiUP60b87MAQVo3TjJ4rzAPnOYUFj2ufrdQZLP+3RHB+liL8JKXDd6PXrbH
 EsEzeNnR2wQ9poWrUeLT/hR+XHfxubvWFlcLwlh7OPVnhKQSHeI804lTzrRVR6Aq+b/r
 xEOrXAWU87cujjl+J43gxLkxAQI9jXzQKdAck800q8jtdng+3tkrIYzYRh09dwUQVGyl
 U7IAcVPAv3ABFxEKBo5lw6U9AELzlFvHP/lnVriwtB1m+/QfczdybJDc68IDKMkM3sNq
 lqVA==
X-Gm-Message-State: ACrzQf2g6U9lr8xTaZZxcRCA2IMKSh53k4T98JGhc9SChij5IPRL45AV
 sOEX0uinK/BarvuYOQ/aP0+5kg==
X-Google-Smtp-Source: AMsMyM45foDdKrFAiARyJ50xgSYYLky1sNK6COgku8DrtsekyXVpzDgebpoNqHI+fdvo0Gp4kR4Fjg==
X-Received: by 2002:a05:6512:2586:b0:4a0:54f2:772e with SMTP id
 bf6-20020a056512258600b004a054f2772emr1218043lfb.663.1663949774809; 
 Fri, 23 Sep 2022 09:16:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: qcom: msm8996: align node names with DT
 schema
Date: Fri, 23 Sep 2022 18:14:50 +0200
Message-Id: <20220923161453.469179-9-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8b31f4655cb8..341295be7609 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3309,7 +3309,7 @@ slimbam: dma-controller@9184000 {
 			qcom,num-ees = <2>;
 		};
 
-		slim_msm: slim@91c0000 {
+		slim_msm: slim-ngd@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
@@ -3317,7 +3317,7 @@ slim_msm: slim@91c0000 {
 			dma-names = "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			ngd@1 {
+			slim@1 {
 				reg = <1>;
 				#address-cells = <2>;
 				#size-cells = <0>;
-- 
2.34.1

