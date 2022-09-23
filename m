Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B35E7F8E
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC3E886;
	Fri, 23 Sep 2022 18:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC3E886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949934;
	bh=OXQfbNNu+mu/4DKzKl83A71WbfkASaaCIZWRoGXghV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4B0JEkPZaQhxQ+GVw/7PGsTrwZgJ16bflVVsn2+t8u6Q3aYHLBQUWBHUha5j8D0t
	 lDmFRjLO+CgFssQPUXlLJ7tmeNgVGfal6cXaSZ/ShHJ79i7mNFn2IdsaT4q8b+e5F3
	 2WXmw9dukqWpBWB9O7FaL0HZVEgLEXNadXxxckO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63FEFF8056F;
	Fri, 23 Sep 2022 18:16:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A83A6F8055B; Fri, 23 Sep 2022 18:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FEF9F80533
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEF9F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PK9B28z0"
Received: by mail-lf1-x130.google.com with SMTP id a3so1031771lfk.9
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BjjTPJSzqgBsq5wMwT+ax/tFG7nlLkeOxNbMd9/sTdQ=;
 b=PK9B28z08bhUKIQgM+yNx9Wz2ylSZRVEfmOQsW+mJVB0NcNNX0BhQFpVZGcnS4Wuo7
 XNB70x4DchMy/KTiKyXIkQPPEqyXaKBOKrx3rgNcbkRmGlIqWLMOcHGwQcRw5RDi5Pxd
 Q03XGAWPYkmybfnO6SoChG2NrYyRcpOoz2+eSdYbAyvpgsnxaBNHkch3HRxex1zG0day
 mJt4wtUWnXCCYQQxqZSHDa2mSGDgdJxyb8N/KMxV9bTxkNEnUeteOU+WKj4D1i58zE9t
 axWIQ1VHUPJNnpXmRU99tTSnF0GQZASHrPD0fPybzLhBGDikJO6gQ0wdnVzts6UKXBpg
 hvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BjjTPJSzqgBsq5wMwT+ax/tFG7nlLkeOxNbMd9/sTdQ=;
 b=DLGslh0dExJ3MKwuNCNi3gwLw1wqW5//EMOIfuiGGbz1qmkTsOPykcRYg0hKbgOiCV
 lHG2hsM7zqkqNv5DR8eFy3F0KSNmsrN8lPKBAHcwKzE9e8gofmxsEgJAnoKYmBLCGrzX
 o6FLlvquF/F5Km0T67k7VoHq2p43TtBfOkMgMBDf+29IVgEGF2H4w0OigbBzOj5EKKJv
 p9/oYjt9cYS2s01rA8+VugsGUgyRfABkMYuUw45qkanlGZC1Gz/yq2KbQmZBNnV5J43B
 9617a7l0V70ZcxbCm6aM9hpYAIjgiUsDOq2JA9791qZkksQZL8OoZgf8vUAtWhsDRrv2
 dEkQ==
X-Gm-Message-State: ACrzQf03ETinzY6Dvto00lBzM4JJ8EGmLQTtGHE91Pk2dHr+BO61SQuQ
 5HREiQP/g3DHw93q9qloeB/nOQ==
X-Google-Smtp-Source: AMsMyM4yHwMG3ruTD0WvINGKfD4sELqhnfdUFK2QastRqloWz8MQ19+ebjdIznviMQ8MP2sJziO0SA==
X-Received: by 2002:a05:6512:3d17:b0:497:9e34:94f2 with SMTP id
 d23-20020a0565123d1700b004979e3494f2mr3391894lfv.285.1663949771853; 
 Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: qcom: sdm845: drop unused slimbus dmas
Date: Fri, 23 Sep 2022 18:14:47 +0200
Message-Id: <20220923161453.469179-6-krzysztof.kozlowski@linaro.org>
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

Bindings document only two DMA channels.  Linux driver also does not use
remaining rx2/tx2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

