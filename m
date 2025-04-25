Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDF3AB7FB0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9900F62820;
	Thu, 15 May 2025 09:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9900F62820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295891;
	bh=9du/cqVmLABi3S4H7ZzYui0a7J0RxPnHiR8v0eg+GN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YqH+cl0Yei8AkqN1mV+jPMpw+J6DWpR580c7N097y/QMLFFpXz2s2Wr/E9I1m7/pU
	 3Ga1bxF03YtNf0Vi7BCQSKQNSNd2uyknjFzssNLdS6y0++LdB01qs1gpqn2MG8gYim
	 m0Llrj4bKrr8oJLT9PPVc82aqDDXE4WpctozOwZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2C30F89707; Sun, 11 May 2025 16:32:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81388F89708;
	Sun, 11 May 2025 16:32:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAFFEF95BEC; Fri, 25 Apr 2025 10:07:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFEDEF95BD9
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 10:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFEDEF95BD9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=uDc0vcL5
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so18058605e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568458; x=1746173258;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=uDc0vcL5Q72J4ED23iKUlz7PqFFRUWrKlCMTP5Sm0xcsfiZmr7s2hIDLzGZ8GAmeIO
         lev1UXmDLQ8WzkqcfkbLs0T8YuaES15JlVeQ9NOsxy1u4ktYckLqR+59ESjB1GuAqNb8
         aZDHBJfjrG1Skz/NBMrPIYtZIsLKwuPLWUzQtlwD9JYLGE6PtH124K0l7VC3gnc8FW0o
         TzY6apV1ab6Khd7kAaWkiwjVrBanAc+CvkdXNiYp+fSHFN0HkckJiHTuqwPn4QqO5VjT
         3Rqf6Upa3Kcie9Qni6POGS/AtN+P6wbWwk70GNLEAEk1/ZzzMnPuBxcjFph0kL6QPCoR
         IM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568458; x=1746173258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=k0yk4Mewgk27V61UoPc+ivBIOsaR7wywEPZ3IUd02OCj8pvBMpl+dNzNk3R3d7bdI2
         Vh7QM0tUIvcOyqZVHfQyRuhzBfQOy3BBndR6InGc8VLdffx5/9tyBCJbmpdiwZ9ksTPj
         Ow0YhhM/9O+59koLnhN+m/GO2G9Y8jhrLy79ZoqB5z060Z+Zwc3538BIb9VT69Onw4bg
         Y1xTZZkqqXtYBQ82XuGMV1JU9NWedts5wyU6DC9lAfWzrMf2CZaFqEM8zYqmS0aKgfy6
         /TvOTXFnGNphFmDERZ+DJQAunOk84sB7k7BxuUCzAnScu8DSoBYGNnYL3Ftlk6XAhIQw
         19Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe7Yv97Kk2hnmey71pz5Ct2C5YSf54HWCmn7luga9P0d4YtMhSHKfECX9t8x1rRHk9M2dn7Ooauc2R@alsa-project.org
X-Gm-Message-State: AOJu0YyH0TkQy2IMg4ZzzeTvxqwa5XyTHnN51+fSSj+IRnY9zdJxEfEe
	1MfOeKqiUCWbPzRklFpL+gzxnMwl1Oe4DMTcbeE5RLe9dI81D7fcvnXlKUo67fY=
X-Gm-Gg: ASbGncvXjyTHnBMiEGpRbbDPiiTcJwbTgFXndSbz5YO3WpwbLFiN36qRxASPsnDwhna
	iSxINltQ1pvS/bDKmLMcR2+mAwL69PU42vJCR6hFIc4EvWll6i3lSJQ7eqPkbbx4iUKGgu4BCel
	QkGwO4DQzymc4pjiiFGvTHvOCk4kcc3xi1cvLM/mdWNUJ9Cg6hxeOl/oXHn2x4lwk3rzQ7L4WDU
	NinSWeh7NgXa9zq8WPFpKPZSF97jyFJCXgwWsDE1RTjw92TnDOzMOL3fJsEcgfwN9r3lrWOrDSc
	We8WBdc9my8f5twIdI/TbIsq2da7VP3vgzpLYjFF1Nydx7xQmIWl+FfuecyrLG1cYlhEzHYBZ8X
	hy0dmuu1cob+zaj3icUDP6wGr1BEyhQNr6eQNhF2OV9MyuJGB980g5Xf4
X-Google-Smtp-Source: 
 AGHT+IG/sz31Wny+TtyIaDzEEdUt0YMeO0mUdD924acJQ9OoByTsHsI0o1wsRu2TPR3UpEE0kePClQ==
X-Received: by 2002:a05:600c:58d7:b0:43d:fa5f:7d04 with SMTP id
 5b1f17b1804b1-4409c52a44dmr43791425e9.16.1745568457579;
        Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
Received: from [100.64.0.4]
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:29 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-5-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RGOEL5IWLK3RVN7657TD4D7QFG2WVLR7
X-Message-ID-Hash: RGOEL5IWLK3RVN7657TD4D7QFG2WVLR7
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGOEL5IWLK3RVN7657TD4D7QFG2WVLR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

In user space just the following route needs to be set (e.g. using
ALSA UCM):

  amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1

Afterwards one can play audio on the MultiMedia1 sound device, e.g.:

  aplay -D plughw:0,0 test.wav

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 9e8f9fb57c4723a24704a8239a86c6081910916b..e115b6a52b299ef663ccfb614785f8f89091f39d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -14,6 +14,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -1147,6 +1149,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp5-sndcard";
+	model = "Fairphone 5";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	displayport-rx-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 

-- 
2.49.0

