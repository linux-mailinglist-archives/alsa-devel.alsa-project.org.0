Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AA65B16B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 12:45:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBE494DB;
	Mon,  2 Jan 2023 12:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBE494DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672659908;
	bh=gr5jlaG4gSwl0XZpix1LBFuRuYV40JFp9nWq/SzIAAE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rWvN2CqCvYzny8lPcnSLdqNqb5iav7aWWtGYHwdFpREJLSSqWEI7G2tdLHhZSLCyB
	 97VWuRF+u+Y9o/OT1W3o9YEbTqLA/3t6PCP8JgdozUYFhji6mCxzIqUHRgJxixaWuw
	 hg0f4KuwbXIccmKOgxO3hS6r7V8nUFYFV03W8fa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3034EF80588;
	Mon,  2 Jan 2023 12:42:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22588F80571; Mon,  2 Jan 2023 12:42:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BDC9F80543
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 12:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BDC9F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KPenZeSb
Received: by mail-lf1-x134.google.com with SMTP id bf43so41252330lfb.6
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 03:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhbiyazKqrVG6CgQo0Lo7FTo8Pu36wyTx9eEnoPfuPs=;
 b=KPenZeSbjXIiU2I1mwvFnabRBJSzvy4GXBXa8vjN1r0VIuumtfAXVFLeumSTbBxbFD
 qCghJbdlfn+GmQ3dym2GQW7cIVES2d/hQp6ItUTb8Ib2i/Oi4WvLcbd3dIePeuA37MNg
 xxn8dFloOYzWkWHGCQ7dNNmrV+Q1noZsHqwrvwK583jCFzVSz9i775OMzFIjmVk0Hto4
 8qzd9AIYtReGsWFxqfoP2MDYnbdHkqdhIzUE5Bbl33F5pHvh6KRUn3gtCAyvfChJM3Cz
 +DtCECE6eZINTvzzrEEd+dTDTTrGcuNwIt8dIBYve1T7Dem4fFREPLPQcq7VS1IF5htf
 nQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhbiyazKqrVG6CgQo0Lo7FTo8Pu36wyTx9eEnoPfuPs=;
 b=LQ0oUpUbdztX68zkCrHcsj5TOXvx74t55+E5Z+9/B6XPui7njCGzsAldx+arfsmZ6o
 OAWTQzI0ZhOzl0Dp80OnizDEEgt9oXXmR3ShUh7C7HQoVY3+6YVQOxar8xWCop94NOga
 UHz3M7KYgvfGLM9gpT5VMU7mw7k7+hH21qamPXpvgs5hEc/UekeZVbI2JYKzV0WvW05x
 pDjRT3svHzO56w/0fLSW8dZFz7VP3BjxFnm2mI/A7Cn2mI3uAa0BkpLnR5cB7DmGDsTr
 hdTRqaaSrGhfocSDI5wHyraGw0H2Epdpp9DsJxn3cirQN1OK73vTpb0W6qbWfFmBkd9v
 jQrQ==
X-Gm-Message-State: AFqh2kp0XK41eaLbAjdNTK0qrIzueikIj8oy5EsEdsSUgTHUmtXPUAAv
 Tf9hvvOUAtC5XWTEf7yJuOEJQw==
X-Google-Smtp-Source: AMrXdXthvx+Tv+Pa7lEwdml7FHR3ul82K2m0m6TNS12fV3YlrUqv4uDKYlm0E/geyZfaWdwgBVRUJw==
X-Received: by 2002:ac2:599d:0:b0:4b5:b8a9:b42c with SMTP id
 w29-20020ac2599d000000b004b5b8a9b42cmr10424407lfn.17.1672659725890; 
 Mon, 02 Jan 2023 03:42:05 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:42:05 -0800 (PST)
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
Subject: [PATCH 8/8] arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x
 shutdown GPIO polarity
Date: Mon,  2 Jan 2023 12:41:52 +0100
Message-Id: <20230102114152.297305-8-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8c64cb060e21..5c510d59c054 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1010,7 +1010,7 @@ &swr0 {
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrLeft";
 		#sound-dai-cells = <0>;
@@ -1019,7 +1019,7 @@ left_spkr: speaker@0,3 {
 	right_spkr: speaker@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrRight";
 		#sound-dai-cells = <0>;
-- 
2.34.1

