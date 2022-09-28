Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9045EE02D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:23:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB1B1607;
	Wed, 28 Sep 2022 17:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB1B1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378616;
	bh=JGIU6MNEd9NHNGhXLtvXKhXENLwa/yVY+uTsXrEsF+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YP1s7HpyZinDdvmohnLoxAInjeqkZxEAdq/4vAhReuOzmNJSyg0Sha71uYR4Oi3X8
	 CcpfALttK5xkz9uyt/fCEyLtkqGb59aWDbFmm256q5zzj0wmTZXqQkz1to70vx6q4M
	 uszkeYcpiOTbw/0gkhJChXv7pkW6g52uH2jCkeEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52257F80567;
	Wed, 28 Sep 2022 17:20:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CE0BF8054A; Wed, 28 Sep 2022 17:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C55EF80272
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C55EF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TjKchRv1"
Received: by mail-lj1-x22f.google.com with SMTP id c7so14666560ljm.12
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TEIMEXNTxGqg9FIJuHmUEfN/3H8rW2QISPKmzsdVbpo=;
 b=TjKchRv1sYiCNIUDblEuXE9d6Nj96yZW/Bh9Qej8oMyDXeA77J4kB/PuR76nS/tiVM
 oEQCWLmlxPE3hB/qi9W1xjJl8xdlW4WsSpmGfBYtR/+2MsgRXGMCxEb1UxEeqsZLvr86
 yeqH4UeaUu5w0/wb059HYxvKgulk+NI5GfgSVZdRrmjLqJacQvYOHPP8rNXpOwkvX4Hl
 sgOCwdzF/UyruhNlNtlK7bpMVqLLP0BqcXuuEpSTgnzRnfcyqsMGiT6B++ycGbJg2OIi
 2WX+rSANiH2RI8mPypmUgo2i5DxXFR3tp2u9fsQvzjUlaQR5pH4sh1uT5Bw5QHMjYcv6
 RZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TEIMEXNTxGqg9FIJuHmUEfN/3H8rW2QISPKmzsdVbpo=;
 b=jR4KdI1p/vJfzCHZDNnBU+aFVJzpkGLI570bSOqqkMdpmLQDfzNRT+ws+nEwA1Ricv
 b+3gOCOy6tZZGyn/G3lPsyAS2PwcJGNpNSEaMZwWsXCSrFS0ngy0SOppKFov6/ZzOzcq
 tjrY4yhMWf6QDcaOoBpy6RzBtwqcWJ94egTEU5/9maIMBNQdZnnYJp4Go7hU0k10nL4B
 0RxA9UV6MYpHlmEexN4xDXeE5uq+HtogOOXzwXB2iS4AsOf/KhL+nXtS8DyxA5nDRXnR
 Nh6VN0PWHxgBiQpGu04jtZduRGVAa1N7bXfro+tIOYf/b+6Tda4rtDoKc1Mxq7f1H+xZ
 wAxA==
X-Gm-Message-State: ACrzQf2ewiKj0AEcBxVKHhwJy7zCf1ZERI4mmFMT0DMF3/BiN/DZP0BY
 2q+lpamYoNsCzp6dOQjh5U6a0g==
X-Google-Smtp-Source: AMsMyM7+YZABGg/Lo00PPHcxbrg2EdO5N0fmX8+9Tr2tA7ji3CsUjnRVUG53N/o/sfg2V7DVXPi2og==
X-Received: by 2002:a05:651c:90a:b0:25d:57c9:30c4 with SMTP id
 e10-20020a05651c090a00b0025d57c930c4mr11361507ljq.386.1664378440868; 
 Wed, 28 Sep 2022 08:20:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 07/11] arm64: dts: qcom: sdm845: align node names with DT
 schema
Date: Wed, 28 Sep 2022 17:20:23 +0200
Message-Id: <20220928152027.489543-8-krzysztof.kozlowski@linaro.org>
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

New slimbus DT schema expect only SLIMbus bus nodes to be named
"slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
called "ngd".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1213f78a8b7a..7b62efb180d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3823,7 +3823,7 @@ qspi: spi@88df000 {
 			status = "disabled";
 		};
 
-		slim: slim@171c0000 {
+		slim: slim-ngd@171c0000 {
 			compatible = "qcom,slim-ngd-v2.1.0";
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
@@ -3835,7 +3835,7 @@ slim: slim@171c0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			ngd@1 {
+			slim@1 {
 				reg = <1>;
 				#address-cells = <2>;
 				#size-cells = <0>;
-- 
2.34.1

