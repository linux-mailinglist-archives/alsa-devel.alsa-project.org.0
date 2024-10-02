Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E4F995168
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B40B6A;
	Tue,  8 Oct 2024 16:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B40B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397388;
	bh=VK3mA+AhP1mrvIRSe3pu3j8qw4QKvKCuPM781iHQdpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NxaIc5LQza8v35mdPt91wXNNEzMZOqNz2eprVdOyhPT5jMYUfRVFMRtr6/l8hsv7c
	 4Omo2r9ygCS/d7cE9E2jiT5QaJNtBRUWmA/AfqZjfoRuQSFDn14eqkBQ2dPI5rSR4/
	 cas1osTHYvNzGIk6NM4rB1cnh4094XU5q4YTLhL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63892F806BD; Tue,  8 Oct 2024 16:21:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DDA1F806B9;
	Tue,  8 Oct 2024 16:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE768F80536; Wed,  2 Oct 2024 04:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1A2FF80518
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A2FF80518
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vBvIAva5
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso71592266b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835633; x=1728440433;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzwSX8KKGAPRaj5lljRiy6wNpS+zMVuqbW0wkWepzfk=;
        b=vBvIAva5u+61WwZ9GLIkccCk4LsquA5h/aeQJcGyHyNStLFPKF9AdTjkClR43e5a/r
         oz1u7aji/1wpLZnejzOeDd1tsRjdHhsf9FYo6GwYgAGl0mPnq7zZAhAV41nj2WUTCQsZ
         bXOLhBR1mVlBdafaL1kvUF01FEvJ2ZN7RTbD2DS3VTJk3OpI0ndptO3aJimCKzJCEmQy
         fK8SrWVmjwAvEFBGIplj5Okxkdj3vD5WxK5QsUPnEJx6hOodqKasXYTLlUwT0fdK13/d
         W3FB1jdQ1tsSoVs88JUYMoIzz5k7+YQ7jSvt0YIHq//x2Y/DXcEqJ9HnA3W2Z/CP8eQz
         vdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835633; x=1728440433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzwSX8KKGAPRaj5lljRiy6wNpS+zMVuqbW0wkWepzfk=;
        b=kcguX3/eMDKsPTt0tS2X0NBTf5f1cDPni8PCdKYrjone+1WsZGjv3H/S6bCLKlzw01
         TsruJ3Chwgui6CtzibfcNuEVkkHHm6qcgIyvuM6XOLY2MAsTv79E7SH+007UpabZsuPF
         8iMTMn2sRKfwHdCbu0PKi+0ZSKKXqRl6JdlqrrkWFetfyIUafyB21bEpd4eKBu9EI3AE
         AKB6arXWqA4A9UTpecU6gainbBVDZZyFgJLoyquJpqWkNtH8DbobTozYE248jSEH1V8A
         KJuvf1d6xtstNw6rA2cXxSbXi7B82BxZSA11OrrXxSCJLa8u3CRKsAAdxO3Zw9n4ljfE
         su8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnEOWl8AMWgvbV2YdJUI66tpq20kOssEAigkxC+ZU8EO9mgj7Y/sNV9GCYuGn9gWq7KajfZc7rWM6g@alsa-project.org
X-Gm-Message-State: AOJu0YwppaxZj4J2jewB+QAKK057U6N+RTfGHYyZDh6aZzz3SH13XWbI
	P+LZjmRPU7oJSJH7W4k9nkUWB6R8hPZPzqvwOblmNj8Tj2xJnIHrQC9OoR4LCs8=
X-Google-Smtp-Source: 
 AGHT+IGZ5ivi7b3Y/1bXAvJ8gbbuRZ08q/qwpCO5zK4rpaNumj2OK1NNdOIgEbMH7T44U5eW8iMtBQ==
X-Received: by 2002:a17:907:3ea8:b0:a8d:2bc7:6331 with SMTP id
 a640c23a62f3a-a967c0b46bemr535600666b.27.1727835632904;
        Tue, 01 Oct 2024 19:20:32 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: qrb4210-rb2: add description of
 lpi_i2s2 pins
Date: Wed,  2 Oct 2024 03:20:14 +0100
Message-ID: <20241002022015.867031-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TGK64LXFIL7JCXTI2CWAGTHRQ3ZDUE54
X-Message-ID-Hash: TGK64LXFIL7JCXTI2CWAGTHRQ3ZDUE54
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGK64LXFIL7JCXTI2CWAGTHRQ3ZDUE54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is required to enable to HDMI audio playback on
QRB4210 RB2 board.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1888d99d398b..7731681688d5 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -634,6 +634,42 @@ sdc2_card_det_n: sd-card-det-n-state {
 	};
 };
 
+&lpass_tlmm {
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pin {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1 {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
+
 &uart3 {
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
 			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.45.2

