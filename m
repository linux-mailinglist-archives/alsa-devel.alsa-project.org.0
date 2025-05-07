Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A741AB7F3D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A16761668;
	Thu, 15 May 2025 09:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A16761668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293915;
	bh=dtOaJQoNaf+2+Orucnur3ieXlStFPrTYojY1S++i2ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fg3mLAO2TrTZ/zJkwwKpR1xQU12DpdnXhnJuoHMWLH211b4vVhXf5JwvZ7QwAjUf2
	 KTqaNREsNwl/YgDbb/ZZY+N0XwNJTzkfWZ784aUhFNFWqDfm3R5wmN038ISHf/IAs8
	 IE+jsaLrfk2x03Aog4wD4XzQGBro4eYzjwvVmBpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E4EF898B9; Sun, 11 May 2025 16:33:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74866F898B8;
	Sun, 11 May 2025 16:33:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B2CCF89ED9; Wed,  7 May 2025 10:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EDE6F89E26
	for <alsa-devel@alsa-project.org>; Wed,  7 May 2025 10:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDE6F89E26
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=DF3RYEvK
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso10112299a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 May 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604926; x=1747209726;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ymrf5p3qgNDjGKRM25KEk8X6NW8oIyoL8sa280xKMjs=;
        b=DF3RYEvKzGVPG4haaB5FHQFK+YW66E5SSf6DFXuEdTPYrsRHEoRucDWIhiWbK4Z6Dc
         4+PqRTWJopoK5dGRrXbCMphzU6XoxfJw9jIDsZpNVt0GRXJIy39Jw6SjzXckw0Wpy9oT
         KcUEJB2UFUsCZtOMUbF+kgx4XEggEeXsItYLqukAd3kmVDLWEHaDlemzdoQIsIu/e+r3
         5NFqJxoQOy64Aax9BQmfn+Bkxzi37zRKjJ4Ct5QV6BOe5MCl1C1MKtZIwlPiH2Pcsrs0
         klfjDjhuYQUuB2ussotfn8HHsyoZzTcLXOP/hnprg+fYwX+H/gxNO+mrzdhImkceajxM
         sXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604926; x=1747209726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymrf5p3qgNDjGKRM25KEk8X6NW8oIyoL8sa280xKMjs=;
        b=ekjfDu74/BL2SuIjH+yqXX9tH0k1o7XpP/KU5K1xm/fwBZpAVYCd/8r5u06TaFi3E4
         1NuWeICUJZEkf9u3UrPTSihFj44pnVDhOyLTmeTrfUi8vDecljDCKNhVlCrIWMpJrQwa
         Fk4FfBgmn4KPbxwy5PrWeoeOm1cBL2yXKkbJhVxQ+nTvOa1+0y8AeIiJWwMDm6THN6Bb
         ExMEagTHnUSbRlnlERhxQQEjxKxekNabdTS4l7LLgIF0oaFsvchLQQxlSPcooTaL2Ii2
         20HK4k290uavLk68l9PFKOZDEGxU43vvgir4pMT1mPnnl2vp9TcSGq5cL2l2+JX29yN0
         Vl/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxnyMF+uV351phve0nzRm12Yyoq9fr+L6NbkBLKgYbJzYFofNtG5rPpgmVqDfM7BYu61UljCBZlduz@alsa-project.org
X-Gm-Message-State: AOJu0Yy8a9xjGyStGOqPkSa0rAHf5GFbtOF3cRwUBRhSE6zOYsDUXwoL
	CpWBrWrVc0UC3F+8U28uSIVc4pTXgZYscSteVi4p5oIIltrCaZ4SU9iDZCRtwyI=
X-Gm-Gg: ASbGncve1fepNW3/g03FuEW2BE5Xpp2QB7yPXHCVi4l9nC0kGboTUG+Z8hAyvquL8TC
	Aom+/APNhlGWEQ0BpYnPdaAKDbkEjVA1AnUOGtDhymYBcWLajFH7riK0mkAsw1KpLn/AbmCH4no
	NEs8hLcgezWjrI4e/J8J/UQhhYSqtPoTxisc7WtQXOM8uyFyGc/6F4//jvQlYDJk8HWXZIM6nW4
	/fxtRLNgqnLAnLvADVocXg6bjDXDw+m7zRxv5+hg6uueUasLmaUs68oOuVlxzR3b4+WMhMpX+7P
	byrY/hulM/nc3cVRHYAIHNUrzcCkN/u0EZPJBn3CoUjltShBgAYA1hBIXZAtfmJZZKl949EigL0
	/kFpMrSARL9+68w==
X-Google-Smtp-Source: 
 AGHT+IGAPyH7HbVPqCuUPV9BaAjaKKOy0NfeuaFEjKeL5N0COS2GXXpBkjPupozhJr/p6eoyikdoYQ==
X-Received: by 2002:a17:906:730d:b0:acb:b9ab:6d6f with SMTP id
 a640c23a62f3a-ad1e8e3556amr228314466b.38.1746604926286;
        Wed, 07 May 2025 01:02:06 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:38 +0200
Subject: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6QTDJAYKSBLO6PLCYPFUOI7GBJZ4L4VF
X-Message-ID-Hash: 6QTDJAYKSBLO6PLCYPFUOI7GBJZ4L4VF
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QTDJAYKSBLO6PLCYPFUOI7GBJZ4L4VF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
Srinivas Kandagatla, and since no (known) UCM has been written yet this
should not break anything.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0

