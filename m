Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146635B01BF
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D04691EF;
	Wed,  7 Sep 2022 12:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D04691EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546007;
	bh=XVZGj+P033LVn8gjSj00T+VeC40UUF3xiKUBPJCysAc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHy2vll5WlvnX9ZlO2SQIkFT0FIHXiR7X2/UmIMb6LAEPegRnnV5XyM3fOcSRv2J9
	 M4N1qX5lT/2/j4ytFPkuVP9swOr6IRS9sem916nmqh9ZkuuRW0riwnYLWJm3dkdn5b
	 Gb4lBbM7UsAISLbZlD5hKEzdbnMZkNwzSaKNOGyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8EA1F805BD;
	Wed,  7 Sep 2022 12:16:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E3FF805B5; Wed,  7 Sep 2022 12:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05DC1F80536
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05DC1F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QUayBXXX"
Received: by mail-lj1-x22a.google.com with SMTP id bn9so15382279ljb.6
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/UI25rqJUxEZV+KxQUPmeT2zHV2+PmX8LADJ48o6xoo=;
 b=QUayBXXXQQifaUr7SvEteJ9XjlPDTTT66Q4Cr4Y2pFZe8xZ2d254ZvhSiA9kRb49ld
 McwmwvCp3p8Tuw+ECr9s5WhumW+6i/VW8oPQ1uhAkTr3/xrUvkCtjBUyW6vkFlI9bDnV
 2WzYIUtI/SQmLTiZnq9dZPqKalruCfa74SFxABL50QhOCNsREOGMEHfwkptLLyqX9X3A
 9JWRuj+r9Z7zGAjLKvB4+mloxi6JkHw8oCGOrRx9jtyPgimyBiWG66gPImowHdFBIGla
 Qc5lqJnIrd37Bi8Osls7UaxBhfZKA7iKmN4bkQl0Vgrr5gkXSVfXWbKl3UAFaZBrQQfc
 IeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/UI25rqJUxEZV+KxQUPmeT2zHV2+PmX8LADJ48o6xoo=;
 b=xyuQlOq6WjPAHeA5C57SItnl42Lzou2kzebdz4EUFpoq0NoViPeJMQdHDbg1T/0/PV
 5aCDWAjDocjWG21QJvZf4e11H4kINFr/PrTsQoE9MJkwEObIZZHhVvV9+S92LvQ7icOQ
 9irisN4dXoGKv/UWzQU1jDDBXW4O5ymVq9FlkB5pHvIxchf60kaW5puYpTPLm6Yofmvb
 bykcXIm3jLG5EYzsVMDbZpv8rqmPtJYTHZVUjrm7dwaKpRJX5owwSLiyYZOca8+0PKkZ
 MokyPOivEkkl3Q/sZ/H/SOcGNZteubRmI+ZVIM6y2r0KO/xoULDeENlRinIB3H5AZcrS
 N8IA==
X-Gm-Message-State: ACgBeo0WbouvtadhQRORuAPnJso9ysTTtqQwrn05IArFoaccc4EPilwa
 8FwLBebSsHFH44TNXqey4uLJAw==
X-Google-Smtp-Source: AA6agR7nOIzZhNtvn8sRXKUjNyuxZEtUpULEKTr10PqSzpitYQCe6cmjzcxlGYW/+BV7LVNfZ/LOeg==
X-Received: by 2002:a2e:7314:0:b0:26a:ca18:60eb with SMTP id
 o20-20020a2e7314000000b0026aca1860ebmr708771ljc.69.1662545772937; 
 Wed, 07 Sep 2022 03:16:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 06/14] arm64: dts: qcom: msm8996: align dai node names with
 dtschema
Date: Wed,  7 Sep 2022 12:15:48 +0200
Message-Id: <20220907101556.37394-7-krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/msm8996-mtp.dtb: dais: 'hdmi@1' does not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index abc17c905bfe..b346ecccb94d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3402,7 +3402,7 @@ q6afedai: dais {
 							#address-cells = <1>;
 							#size-cells = <0>;
 							#sound-dai-cells = <1>;
-							hdmi@1 {
+							dai@1 {
 								reg = <1>;
 							};
 						};
-- 
2.34.1

