Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E55EE031
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72BB51635;
	Wed, 28 Sep 2022 17:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72BB51635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378665;
	bh=v/BlpdBRXODT5Mp+pnSPWjus4IPHaPr7IeThvwO0PPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hshh8W5UnHgiblMA7EVZYAnioJWhDb9x5HssabE4LrkFOdspwi7ycZ9VbsEni7bsV
	 v3w7f2/RH6c/Z6kfSt06JXF+0sbZGf5O8EwUaR2mujbYBpqWBkkWgyOoN2PBUjlNXR
	 dtBokZwSFfAv/p080TYHG+ovyPqRXwvBseu++V3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57D7FF80589;
	Wed, 28 Sep 2022 17:21:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B552EF80570; Wed, 28 Sep 2022 17:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6E6AF800AA
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E6AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WVkGr8uX"
Received: by mail-lf1-x12b.google.com with SMTP id j16so20913568lfg.1
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rQi7cXeOGY/HNtdfUBGhQ3z+Yj+bhensaF8Epr2+VKg=;
 b=WVkGr8uX6x7t3roYufHT3DLMR6W8mLiM4JJh38Gi0RhH5xJA1sU2eTj83+VR9jl5yo
 gqmqry/hsBbU+yvrfT3z9RM4jlCszIQtw3WE1L/ISCMAp+dbQM/I6els1XyYeWGjR4la
 lTU9VJfZIO8YbhVoDnNrCooTD07h2tg/Yn+dnREZHvlXo1Pmqh8j2jLo3ki0NoRmsbG5
 moRtIrjOoC5t6UeeeYSmmwXGOQYpG6TgBEzULYlQ7a+wGIgqywvwRwo4Gdi5EClrrKIv
 3+fPmmfMC7z9LT9sreAYJONhiOm/KTYdw8ielIezMmxEG2qLOTwchn+Fbv6UBT4MJkbj
 9pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rQi7cXeOGY/HNtdfUBGhQ3z+Yj+bhensaF8Epr2+VKg=;
 b=ab1o4OTXnBpufd6JkaQrhzTxxOxEPCj9UZnv3NFG3DWG7BhIhWIv7fwQHe9KVE7Tub
 WXVTBgngI0dSPScUEj2VTFqBSspEFnLna2dD6QzOeVfHLF4LY0XSd75x1E/Pv2r6stpC
 ShEpFKg5i2cYUZG4ASK/WUEA3gibJvZyqYAZHulOpDC35+OV7kbDHrsHGx287zeA0QML
 G1k0PTsm0wblOk9Y0rKrXcBCJM2n9UnpzRd1oR93aoCLxVEu0wzjULLR9lZpab27tp1d
 sWqBG0vh8vfTAyNqxZo4KJe54LV0t8k+2Hryr/QMltFG0aNbaHBhokeKSx4PLapQovE1
 IR2Q==
X-Gm-Message-State: ACrzQf0uhMuYleP77iz2w3JTRbscKW37hwcKd93ilrFvd7GuXRD6LhjV
 okD+ipPdt6bTz81zjufBiSAJIQ==
X-Google-Smtp-Source: AMsMyM6VehWI9qon+rnG5VScgt7/uupHOCjOgtYrEVVC/9keKEAcBEBBsH/c1adrF8JwLdwReiHzjA==
X-Received: by 2002:a05:6512:3d8c:b0:49a:4872:858 with SMTP id
 k12-20020a0565123d8c00b0049a48720858mr12955333lfv.145.1664378441955; 
 Wed, 28 Sep 2022 08:20:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 08/11] arm64: dts: qcom: msm8996: align node names with DT
 schema
Date: Wed, 28 Sep 2022 17:20:24 +0200
Message-Id: <20220928152027.489543-9-krzysztof.kozlowski@linaro.org>
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

