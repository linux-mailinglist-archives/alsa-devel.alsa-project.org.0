Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2B65B168
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 12:44:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10B3D9489;
	Mon,  2 Jan 2023 12:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10B3D9489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672659857;
	bh=d6wy+DLXm/oBYF0ABKbi6hXm0Pyz/2ch1ldCXyNNY9g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GSwYJw2xlG4qSKcZc84TL8ZEGvfh9LV2VWJ/UTeOaM78ReIHocR+jI+JWSDYoiN5D
	 eFrkoVrf5BhkMEcuKTXpCMs7riEr8GuVefIbC3+Njae9I/PBFUY4oyATDgS+q26cVq
	 U4xlm73kbbpelXu+OfUP2ocGjuU0KACbn35NWKaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B4A1F80563;
	Mon,  2 Jan 2023 12:42:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5B9F80508; Mon,  2 Jan 2023 12:42:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B180F80508
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 12:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B180F80508
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pAESxmZq
Received: by mail-lf1-x134.google.com with SMTP id b3so41260379lfv.2
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 03:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7DFtOEQGDvLwuUrCQkDtvWR1xrXOtoaEkWgZ64uacE=;
 b=pAESxmZqzAulg8x3sh2OZEaZmiaXyD7bnR4gfS0oPCHgWp7B9PaNXpAl2QtI4rLYjB
 2CavhcZ5REDROwzAIu0bJwpx60tFdY6w+H1KNuXe418nv5U7R7ZBGe68tsBJjzQJpOTA
 c9y5j3H9QzHDJkuIcdKK0wCB7+xONDKBiqa7btuO41Vw+stxTM7gtUMo+yuyMidqm5c1
 dg7cycmzXZJTHUfmFqCmXHlnY4U2BVO23JVM6Phd/N8DBhEEK56DL1Xv+Jj1GOaVujoq
 Q4IUTCWRrp0yv+Y+bQMpU7AvL8Kg+vOe85MwXs0l0vIXf04nRstEVdb2aHUNJyfHVMzy
 IAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7DFtOEQGDvLwuUrCQkDtvWR1xrXOtoaEkWgZ64uacE=;
 b=k0g83G+5Q0IIXoNXaGYdlSbIxgKHbSKCXOcMwbSuOiAwx9QMCxcTE5bwRhdYEMUv55
 YFwtD1wVACniNKLUrFL/YNI1IWAx+xVRG3cP97viPE+bsRf2pO45Yc+mmqAlFbvSsy2I
 KV8U2O9mXhKQvl4rmSsKw69sEkTybDonxNhGkcaDOxccuSlqn8juuEyUFmYJX3EZi5Cd
 nDFQHUhsbiuEGG+GrrXd6f3D9mBtp0A0LqElRC4trdjUJYidYoKQSPIGMGZHWV3mPepo
 hA62+Z+5eTEgEqyhOh1aKj/klsDbU6ncJdAwJPbZMx/Am90Dj9qK/BZjlm3Y7rlNb5zS
 KZlg==
X-Gm-Message-State: AFqh2kop81rtuYi6KCmCg6cEtFUGR7UBlqrO0PO+yVNiuuNNBDe28DiP
 P2HYoA+G9UpeyU4/g5VZqpCZiQ==
X-Google-Smtp-Source: AMrXdXslY2koB25fyMJHnXJFmB+megTwdgyGhMXZZ7fR0vwUCEuuWNE0R9xXrSbXYX+L5ifophOJwg==
X-Received: by 2002:a05:6512:3d0a:b0:4a4:68b7:d65c with SMTP id
 d10-20020a0565123d0a00b004a468b7d65cmr12398011lfv.67.1672659723363; 
 Mon, 02 Jan 2023 03:42:03 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:42:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 6/8] arm64: dts: qcom: sdm850-samsung-w737: Use proper WSA881x
 shutdown GPIO polarity
Date: Mon,  2 Jan 2023 12:41:50 +0100
Message-Id: <20230102114152.297305-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
References: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux drivers were updated to
handle proper flag, correct the DTS.

The change is not backwards compatible with older Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index daca1e0ad62a..1980080fffa7 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -720,7 +720,7 @@ swm: swm@c85 {
 		left_spkr: speaker@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
-			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_LOW>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -728,7 +728,7 @@ left_spkr: speaker@0,3 {
 
 		right_spkr: speaker@0,4 {
 			compatible = "sdw10217211000";
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_LOW>;
 			reg = <0 4>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.34.1

