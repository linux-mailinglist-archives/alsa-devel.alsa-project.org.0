Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2875EE028
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:23:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23CDBE0F;
	Wed, 28 Sep 2022 17:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23CDBE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378590;
	bh=+Yatjh7KVMsul2oKZKA+HstSKGSgnxJbyODO37ZqGAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDyWTvt34FvRFjOX7A8kKTfR+jaCjDkX6IuzvJNow0uvckwHFTRQHcsKbVxYhQeg/
	 w4o1/2gSL3JfutB4vgGdCqQZPIB4X4Mp4cgGIAL3Fp0p1Orp6OA3UhiDjSWR2ts1gJ
	 zs/zLPHAsr+Dxl2SdYWjBKRfogFL1Ds54CsLphDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8217F80558;
	Wed, 28 Sep 2022 17:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07C0BF804FA; Wed, 28 Sep 2022 17:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 994F6F804E2
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 994F6F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rx3XgFKI"
Received: by mail-lj1-x22e.google.com with SMTP id x29so14756004ljq.2
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oafNPI2RebJ690RXvFerRH66MRprlkRm3LjfeDmSHqg=;
 b=rx3XgFKIWsg50FkL77Hcvpne1R2s/UIdEdaD1noN+VnzxE0zgLAftUmiY7vM6NXTbv
 rFGcRIu8Z5JCop6SAJhSUm7RAGmtiOohzi0hc2YfgKVVYW4DCEqnie3CsQBYshX6HcBa
 l8hZpn0SXgZK+sWb+BSVUwydd4d0774BodCPHNP33temGZmZ554mt3VyB/y/XFV+1FDF
 naBkXxDbKZaYDQbiSLjbVq55vTTSANswu+FXaG+GdilhoLjQatT9yS06nq6QlfWXRk0H
 5X4QvMXGPrV5QD2UMWyUpHYW7zzhMHngkKNf5H/SYx8+RdOlm/VP80ZcOKbm08zF1BOJ
 iU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oafNPI2RebJ690RXvFerRH66MRprlkRm3LjfeDmSHqg=;
 b=I06BaTCrFirv8PI5y5yTg3ijtkP68orgffmT4CyVKwU3oCueE8H9mxJDkt7lJQQ6t6
 3S6hRMh8Ka+1dBxXjJLMeo/U+neA1DAlIdjrwq62LDjGBGihDhHMAGhpkCKtICUfh61W
 lGj2UScgIq+9c7blrRQkkeTPcHtBCKLs0upZFV7gSKVauTlOk4vapORVJ9vt1KQUE/Z9
 psixZ83tc7nlJcMEEqkqrAkPthYrZ1NRkVZyUJQLPexe43LuTfgA1RECMiFCei6BBDzY
 +ncUg71NtTc7xgQ5b4qs5A9NdYl06ZiIqDTbqE7NHVSMgipmDdym/P5BOoGsgMnrifsY
 cpsQ==
X-Gm-Message-State: ACrzQf2RzhpkUAgTYK6F61XTn80X0O1dt5xnxs+l2BTWdNz1XjD2pGU9
 CgOsSekNrsjz0T6jRM9zIHofUQ==
X-Google-Smtp-Source: AMsMyM4V25G2u71JmpUD75q/3Ny+L39I7/Urt1oiXNZiTvVJv/6gYVNpMKAK4bpOTvkCuwOIhRu2Cw==
X-Received: by 2002:a05:651c:1115:b0:26d:a0bd:97af with SMTP id
 e21-20020a05651c111500b0026da0bd97afmr4547186ljo.261.1664378438143; 
 Wed, 28 Sep 2022 08:20:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 05/11] arm64: dts: qcom: sdm845: drop unused slimbus dmas
Date: Wed, 28 Sep 2022 17:20:21 +0200
Message-Id: <20220928152027.489543-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

Bindings document only two DMA channels.  Linux driver also does not use
remaining rx2/tx2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2264bba69f84..1213f78a8b7a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3828,9 +3828,8 @@ slim: slim@171c0000 {
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 
-			dmas = <&slimbam 3>, <&slimbam 4>,
-				<&slimbam 5>, <&slimbam 6>;
-			dma-names = "rx", "tx", "tx2", "rx2";
+			dmas = <&slimbam 3>, <&slimbam 4>;
+			dma-names = "rx", "tx";
 
 			iommus = <&apps_smmu 0x1806 0x0>;
 			#address-cells = <1>;
-- 
2.34.1

