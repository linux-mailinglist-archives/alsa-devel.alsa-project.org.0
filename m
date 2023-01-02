Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616D65B169
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 12:44:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665ED94BC;
	Mon,  2 Jan 2023 12:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665ED94BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672659876;
	bh=8Zhx6l+qF/fWOqGhxfTMp+MsBvcZpLVs/f2y2lBwBbA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ogHKRr71wuB2GTQzzSJzD5LO7g3NbieeYrJD0QC9wUcvz9uVh36Wz9yVwQHS/03Ut
	 aKz6q3YumtCmNMB/xZZqrsS/1JBVt1NBCL8hTPu1KBWAJK2q9B+PsO31Qdi1EnBP89
	 Jeyeb55pb5W0OKzmtnzJjC2DDKYhP0nlJiCnUfI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4A7F80543;
	Mon,  2 Jan 2023 12:42:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 162ADF80551; Mon,  2 Jan 2023 12:42:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09972F8032D
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 12:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09972F8032D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zqwcpag5
Received: by mail-lf1-x12e.google.com with SMTP id g13so41223153lfv.7
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 03:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0DGttLpYO77MEtgPKeJIho/3p0G8MvI4IyRdGCB7vI=;
 b=zqwcpag510R0I1O97o6VuVZ7eDegAgifXOQ6W3qLAzENOo8o5qW4rN02gCLAL6dCsu
 2up8OZSLUB52nq77A6YT/Cn8+3bwlzh65dK0BuXJ/yf9BbkmocISqvy3/YFOz5PN0ms3
 LNBJAao0LkVySQAdAqQTKxYPoz8Bti1VKoKKN691D6hEVgX5JHjhncSMwWmYt41eueFp
 Bkr+iuNDg1KfXAjvSJem4BQmHAiTMKQEMofOWgGFfvukDZKK2efqVXZcDzHPq1C+bjIC
 9ou629mojNGDu9SLn1cOVK3U5kv/bx2gUXOSMvBHnPfs6F385ErLc81fHO7dR8ezmH+3
 16ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s0DGttLpYO77MEtgPKeJIho/3p0G8MvI4IyRdGCB7vI=;
 b=28g3kyvNK/h+OWbPDdVgjUJr7/9v0HDG4vrh02oSvJ2JlkB9BBpxS3tRR+qWbnla+C
 yQ73aSVKa7yxHG/uHD1ySB7eb+OON2bizLbhNHz75GCcvp1fEQQ+AbcLI66ZEMtnDTq/
 52X8mzSSVZjRlQefBpTmlrKb0U6B1GWanDajHyZ0A5QB2EFA8AyfnHG7BBGBsKrQq+xr
 RZ1aveY3xpDNK1PY3VZEJf21M6yZnog8AVnpTO7uXP7zsduLzUKhzj2RPpV+uXj+gFMf
 DHvfBvs1FIRzxx+sXaqmhKqvToS3VcXB4uBy4G0Rvc+g6bt9bKkKrqUnrKv73eyCn2c3
 3tgg==
X-Gm-Message-State: AFqh2kpUk2MzSWeo65omn+Vo1GhdMl3xPDyE1zn4sIPe3kH/VLD5gEfb
 yyl3+MhaveAeKv3/Di1C81oY9A==
X-Google-Smtp-Source: AMrXdXvQ4GlhI7AwL8ZBSeQBpJlW54TbgMV0HW6QzbLTFQGu4if90hQWSqplHqqN7UVJYKnBOJGYzQ==
X-Received: by 2002:a05:6512:3f19:b0:4cb:780:813a with SMTP id
 y25-20020a0565123f1900b004cb0780813amr8558425lfa.13.1672659724660; 
 Mon, 02 Jan 2023 03:42:04 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:42:04 -0800 (PST)
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
Subject: [PATCH 7/8] arm64: dts: qcom: sm8250-mtp: Use proper WSA881x shutdown
 GPIO polarity
Date: Mon,  2 Jan 2023 12:41:51 +0100
Message-Id: <20230102114152.297305-7-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 3ed8c84e25b8..f3669c1a311e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -760,7 +760,7 @@ &swr0 {
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
-		powerdown-gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrLeft";
 		#sound-dai-cells = <0>;
@@ -769,7 +769,7 @@ left_spkr: speaker@0,3 {
 	right_spkr: speaker@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
-		powerdown-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 127 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrRight";
 		#sound-dai-cells = <0>;
-- 
2.34.1

