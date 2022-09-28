Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B295EE023
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491E31631;
	Wed, 28 Sep 2022 17:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491E31631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378567;
	bh=FgK4uA73wWUehsehEBjIEyztws2K2tU1TJ5ahonoKeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlwD1ScAS5l6BAjMCCAFN8E9NzddG2ToFaZZUhhf0lFPVzYLVQ3nGFXMstUodlIjy
	 CG497AYAFQZwwNBpm1c5koZ+MBQM88v5jIqHp/tDmuKd+taMNvPIiwr66Nvpety9WB
	 vpJV9oLBMBfNcHdtwNr3jqmYIvdX46UnhEkjTyaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474D6F80557;
	Wed, 28 Sep 2022 17:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE08F80557; Wed, 28 Sep 2022 17:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA1B3F804FA
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1B3F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pPXCdKtP"
Received: by mail-lf1-x129.google.com with SMTP id i26so20864820lfp.11
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N5iR35AZK7Pq7du6XK86lz6F1DzAFtqNxi6z9fgTPVE=;
 b=pPXCdKtPXCy691JtUyWZcgY9kFLzjkUwm9LKRUJsPt2sL6Us5s97bXSoIPR/pYB2Kd
 3WKqp2DsGQOnj3bEA4bWysKYMSU85xCMNpQk94tQuc1pmK3bO9JZWHqgqtKw4B1nxx98
 4afALGP4IvVFrlfn0zCMm8dDUSwYwRoiFkkKnJVxK0bAgd0A0c2odF6d9yvcQeciZ2yZ
 3L5nEiMx6Ljn9CywCKnheC5KYsY9VeW5mwo8cw6oPI5nrgKxzFPFuJ7Hne5dijXG0fXP
 UDhOYBcTo41pjYar/TbxNtapkFtg//OivNe8/H/Q9QfhmwGC2MS9swr89XJb3wpqDwEb
 OhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N5iR35AZK7Pq7du6XK86lz6F1DzAFtqNxi6z9fgTPVE=;
 b=yfL4sCQ/2zIiXrkn6vkxME3SChjiq3T2BdpQTk88+WN94pKZqr4eRwmGVRJQD5akp+
 q8HD998oTio+nFAvA247pRoag2+vAI4BZosptcw19scNsh100Q1sH+ezEDsN7IC6yBbD
 +WJgFRvIztqnBrl+Yn7euuL1/1N3+Vg0hA/kFAhFtxsfV8xTkixXtH+xJ/qOwHM6G6e6
 0FFKgmCgLTsZbciD0/4PrRpE6Y93OpkNBrxd/Vm/5ibzeD5L/bcZYf3zMKpOb/SKKVbc
 g7KqE0x4EomD0BGQoCW12y5h+iFVK6yoBsEJdRmM1jelOuCKsxg1slQWNs2hNDTgNOrh
 odiA==
X-Gm-Message-State: ACrzQf0aByfYrSidbL83QkxXg89p/4pvm4z8SaBUzfk0ohcsmWsxznKa
 Z55FBqrd1I3OPx50hLBKcJRc5A==
X-Google-Smtp-Source: AMsMyM53pVtExjzequhQZRO9qgs2HsHlqeUIc+D3ThXfCoNdLy4ZlOddGRgUIahVHdpixQ76jJlYXg==
X-Received: by 2002:a05:6512:3b20:b0:498:d7bc:28af with SMTP id
 f32-20020a0565123b2000b00498d7bc28afmr13083842lfv.65.1664378434177; 
 Wed, 28 Sep 2022 08:20:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 02/11] arm64: dts: qcom: msm8996: drop unused slimbus
 reg-mames
Date: Wed, 28 Sep 2022 17:20:18 +0200
Message-Id: <20220928152027.489543-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

Drop undocumented reg-names from slimbus node - there is only one
address range and Linux implementation does not use it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ae31393081dd..903c443a867f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3312,7 +3312,6 @@ slimbam: dma-controller@9184000 {
 		slim_msm: slim@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
-			reg-names = "ctrl";
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&slimbam 3>, <&slimbam 4>,
 				<&slimbam 5>, <&slimbam 6>;
-- 
2.34.1

