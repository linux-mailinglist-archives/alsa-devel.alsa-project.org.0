Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157015EE02A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD550163F;
	Wed, 28 Sep 2022 17:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD550163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378597;
	bh=P5sgxQwL30CjeqUJkajH4E0CUPxIvOOScUMxW7bV9lU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVMX5jZvCMfm3fsdCrhvWgOnNC533msMitysU6hKC8ElOAVKcf/nqe0pN9ry3EDpM
	 BuPqxP6JhHinluFwvcEzME3fqfzrYxdEiZa6yschaeIvrGtF77qC1GdnHr2PPFboWa
	 0E22ptvHVa6Dcmv5cZ6eWSeMCJVekgdoEfvQuDeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8655FF80566;
	Wed, 28 Sep 2022 17:20:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ACB2F804EC; Wed, 28 Sep 2022 17:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E9FDF80537
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9FDF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QDsG7hY/"
Received: by mail-lf1-x12e.google.com with SMTP id a2so20871644lfb.6
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Fxkwow1Xm3fK1Et6nbVH+mRVG5q33XL6HKbPhtZeFeU=;
 b=QDsG7hY/7DZUkGD0YGTss7p+Xl18GN0cleD581EklbcIouPa0r0TkAgn5K9ZVrJITc
 g0rVFZBHbBBLnqWC0IJqcb8ZSDxkMF1/g1Bm2nkrwrTuVNO9hAZ0Wu5TkYPmUU35F3b0
 fTep1WP2xVVMm7KEItmd6+E6v586wx3YjpWBGw8ToWsV1k7uwUtGhW/d49CCir+E3fh/
 1f6Mh3KQokkceYmXX6aJuY3b6OktaLmFXQsxJ5eK+QogciKQTw2UN1jeh6/7k+f1Yx2O
 qZynMwepNFnFOdGbUMtEvgFc96xLoYr3SXKK/GFGyQ611F28dDvjOPNT4p3VQ+Xb8Fbt
 E4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Fxkwow1Xm3fK1Et6nbVH+mRVG5q33XL6HKbPhtZeFeU=;
 b=AESv1ua7AS6PJR/G2rWP2H6uesxLucCjWS1chOLkuYG3O00FRKDzXy08ImdXtBA7yz
 smflllUDGpUtVoAgZEH9zczAfaE4PkcpCTQi77Ad35XSnXLD/KI7dOW6GkwPa6ubh4jx
 KVT40ajbxRkpgoNe/3yfAS2olQm1wlRfxRERyLGR/CbpKS2EwlLAqVPBcNNJ7+4/4lMu
 4MjhR5AEPXwp/T6FJ85b+LL6P/vaVKpZ8kl+0+tfSWI8c/wh3Ousn5XHxUP3xpWDdA1i
 YTlMNWk8n31tPFt03l8YewAbN4CSQUKwmmQwcGeI1l7QM+ebgVyVwAAUor2cBB5GBWAr
 NYnw==
X-Gm-Message-State: ACrzQf1nXYCBJJdPI/erYeR8EYG1NJq5zzFyz8QcL+T/JUT8K9XSxKtL
 Brm8JruyBwYNxJJqadFdAWXf/A==
X-Google-Smtp-Source: AMsMyM7MEmEEYjwpUyW2Aqu4/Zc0FmSboH2I7oUiVISmK/R94LcrgrOzhmd4P11ngCZB4ztwJgHsFg==
X-Received: by 2002:a05:6512:1285:b0:499:af40:afaa with SMTP id
 u5-20020a056512128500b00499af40afaamr13346756lfs.540.1664378439345; 
 Wed, 28 Sep 2022 08:20:39 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 06/11] arm64: dts: qcom: msm8996: drop unused slimbus dmas
Date: Wed, 28 Sep 2022 17:20:22 +0200
Message-Id: <20220928152027.489543-7-krzysztof.kozlowski@linaro.org>
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

Bindings document only two DMA channels.  Linux driver also does not use
remaining rx2/tx2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2c5908d104f7..8b31f4655cb8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3313,9 +3313,8 @@ slim_msm: slim@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&slimbam 3>, <&slimbam 4>,
-				<&slimbam 5>, <&slimbam 6>;
-			dma-names = "rx", "tx", "tx2", "rx2";
+			dmas = <&slimbam 3>, <&slimbam 4>;
+			dma-names = "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ngd@1 {
-- 
2.34.1

