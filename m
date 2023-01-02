Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF665B166
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 12:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3511194DA;
	Mon,  2 Jan 2023 12:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3511194DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672659835;
	bh=uJk19J69WyuaT3QGoJcHPuakrR4E8+B6uYfWAvWpq9s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E2tzjhvd+O7M431red8hLOKINYtGJG9wVkjAS1rlOVSW1qmyTcaTFEK08tU6L1kw1
	 77qlv6iKnO3f7ugxzQcxswSP6TalYE4ZmQN5+4kTS2Ev2HX/VnlNU3OCfXjbum4UpB
	 ABN/uATjhPmPRwXxz/tBaGIDWwO+0RgWCWjSSj4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A040EF80548;
	Mon,  2 Jan 2023 12:42:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94B54F8053D; Mon,  2 Jan 2023 12:42:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 142B7F80507
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 12:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 142B7F80507
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=A3bjAiUW
Received: by mail-lj1-x22f.google.com with SMTP id e13so26262912ljn.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 03:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFU9bGFCZAQ4eLz1sLnNYm1aOcmTTJdAlfZrDIj/g7Q=;
 b=A3bjAiUWya/xZ0diRWE5yhrbPaolWEfSBNiTHT+PTnFaDdZfa6Fw1MqqqS2WfEBbVU
 hwoLb9aP/0r5F8DV0wo9CcyqAIWXWMSY7CaXRnCaxPobzkC12Q/xj0pVb8/SPNwXR6Ge
 9QqCeye/rbd5a2C9i7E++QaV2H9KtHRZhIe5FqJYxjK07+g7GPJns913GKdwbDF6m6kH
 zWLT8h4t3Ki0vMQcgRpVbu/naTjx5JTcvnTrT9Ijo1iZbjh0HSt7jLs6357IYGVdKOMG
 q8CKCWhdzzI+t7/sufVgFF0biouhOZAQ11D85X9Udd+2NXW+AoeAcNM1aJxcslNpTzhE
 TfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFU9bGFCZAQ4eLz1sLnNYm1aOcmTTJdAlfZrDIj/g7Q=;
 b=xGSxd8C4b9InhDWkTvPjPp/IxU8rpMoA9ExhUo0I+HfjaUJEaX10zWYneYHI/0fM+c
 lmsl7oSMluMeHa5uSfER7BbYJesE0X8B2Pjv2dJnlXUvsMdgHXAXskFkXXTnAzijF61l
 rsYbuNK1QURxFy/XUxnBLOb3Nb+kcuKrqYPPIstxGKM9jq/UlctZRQEUXYYEEHzDbQCT
 uRJqfh5lmm3TLSEC2+dDZ+OyaQ2qBwN4ijXdDA6Dwq8Qzn1vlpHGfQf2c+d0r1pmwDON
 EE9qNB3yTdRdiXm24f92ZHkxJGr9GEtstqnEzMULz2MdhIRadJDdnyw5E9T+KqogmSwH
 pI6Q==
X-Gm-Message-State: AFqh2kr9u4W+n9qmkCqq5KQjldnA8KJNUnnLE9rBCa/BTkngQEJ7xWPa
 Kt9fy9K5DYseVF+YTTf0hJolKw==
X-Google-Smtp-Source: AMrXdXvanEqAmzrAU8cnms8NzY+XMBTyfywvWRDhSrQR7ouPlYxDspszcull6A3Kcw/Q592iYn6Vyg==
X-Received: by 2002:a2e:a54d:0:b0:27f:c95e:7619 with SMTP id
 e13-20020a2ea54d000000b0027fc95e7619mr7240352ljn.13.1672659722099; 
 Mon, 02 Jan 2023 03:42:02 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:42:01 -0800 (PST)
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
Subject: [PATCH 5/8] arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper
 WSA881x shutdown GPIO polarity
Date: Mon,  2 Jan 2023 12:41:49 +0100
Message-Id: <20230102114152.297305-5-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f32b7445f7c9..25d167cb5e7f 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -788,7 +788,7 @@ swm: swm@c85 {
 		left_spkr: speaker@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
-			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_LOW>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -796,7 +796,7 @@ left_spkr: speaker@0,3 {
 
 		right_spkr: speaker@0,4 {
 			compatible = "sdw10217211000";
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_LOW>;
 			reg = <0 4>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.34.1

