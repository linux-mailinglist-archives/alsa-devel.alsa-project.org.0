Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D695EE01E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C57BF15E5;
	Wed, 28 Sep 2022 17:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C57BF15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378521;
	bh=uuLGxvUT9hqZoGAtFDEJn8J7m4uUrsvCtbIEhA/9RRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0LzQ6aRyfmOnixegGUAMec4xYDCXlWDdiufWGg3OPTJQQMZuBdWkoKvArc3VD9fJ
	 RglK02x8KSgMmumNjnrqjOhC8RKEbkdTZ0htDSKafd6tg4CHOtXPiFZlzDQ4pwD07g
	 c1T4fqrHaSc5n475kb+3Vb7Gu2CGbwItQQffH3MQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41411F8053A;
	Wed, 28 Sep 2022 17:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 178C2F8053B; Wed, 28 Sep 2022 17:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C714F80109
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C714F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="j25kiT8V"
Received: by mail-lf1-x12c.google.com with SMTP id u18so20854257lfo.8
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=o6z/7qFA6aTihIkRQlQVaaDZnJmWKtOGTISKDfUokng=;
 b=j25kiT8VnKGSOkq1tFxRLGMrqmV7bc5kSuNe6rED5H5ELh4c73c5GGHbrrVWjPVCh/
 zVwCUiI+eY7ke7Dp3Y2qUiSVD4qpSZepTH4XchPvfgxh+SBxTO4yZUILl4dsEphwneCW
 QCiX40qRwnixWarJMF2mfOlCAYzvOCNUthj1Iu1L6nCRNL95WL/DOnR498J5MlYHDi9X
 GDl6kzN4PGLruIhogiKUFvS4XSTJ5vaGPoY6gF2a4z4xyMH3PLCsAq6YYkPDOt/Hv7/o
 lY6nAA8RGrO+922kU2jOVka1sDDuePvKN/uHzF9Ql1/RNtGjFWs5yQN+ZqoMAr+km5hC
 PaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=o6z/7qFA6aTihIkRQlQVaaDZnJmWKtOGTISKDfUokng=;
 b=DrInL/jCDgfIxYMawo9oFgX9OrcKqtW+WUnAhvvwl6NWMPJ8drDUvEUD8BEOWBcbHr
 zvvJtX3frpUrU/qz8uSAxrxg2wg0uqvkMNmqDzxzjDT0WJRq0BwKTGOO8+vqeegO8r1F
 Q7nFDMFUMMcH6L4wlMbjpjFxq6Qga7B+I2C62+ouZ0TgWiPJw2PAIU1P1ZyahEroICAU
 dT6DGsl17Zze9DmUQpo5TkFnptFz5lC7UZ/rJYXusmU6lnYoPjKtjtCWrb5Cu7WTvvc5
 TwoV/3v08aEs9AGjI5yAtIUV22/bwXENuwSndoHowNiahgD2GNye6ugIfhOQPU09Bb78
 0Upg==
X-Gm-Message-State: ACrzQf1KqytxDPNRdaV003tWcDxKrYgwfbYLIE7srYuNHMEAgCnt8Fp/
 q7doQ1E5QeoDVPU6cjD06f5kHQ==
X-Google-Smtp-Source: AMsMyM5iIpHnFvI01xKPQmtcSKnVEWQ7ni5Fcd/dJO7PhSyM7oqJ3Lg4MJHgBgjoyypLJWhp1562Ew==
X-Received: by 2002:a05:6512:1055:b0:49a:de51:5458 with SMTP id
 c21-20020a056512105500b0049ade515458mr13216754lfb.585.1664378432933; 
 Wed, 28 Sep 2022 08:20:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 01/11] arm64: dts: qcom: sdm845: drop unused slimbus
 properties
Date: Wed, 28 Sep 2022 17:20:17 +0200
Message-Id: <20220928152027.489543-2-krzysztof.kozlowski@linaro.org>
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

Drop properties from slimbus node: unneeded status and
downstream-related qcom,apps-ch-pipes/qcom,ea-pc (not documented, not
used).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d761da47220d..9db1fce6b198 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3828,9 +3828,6 @@ slim: slim@171c0000 {
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 
-			qcom,apps-ch-pipes = <0x780000>;
-			qcom,ea-pc = <0x270>;
-			status = "okay";
 			dmas = <&slimbam 3>, <&slimbam 4>,
 				<&slimbam 5>, <&slimbam 6>;
 			dma-names = "rx", "tx", "tx2", "rx2";
-- 
2.34.1

