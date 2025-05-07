Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522FAB7F9F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B40C61899;
	Thu, 15 May 2025 09:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B40C61899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295618;
	bh=9du/cqVmLABi3S4H7ZzYui0a7J0RxPnHiR8v0eg+GN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CeUil//UIHmHzqjEDVLgxCgYpZ0v//AvvUGVfQ2o8Dh+3P4SvWl7M9WMhP+8XSxnU
	 OneFNg2GVDtwMDtyiw2UtxJGfEGrZIN4507ElqrvWMjrh663cL4MJog30WK+iqLp/A
	 UPiX6r25MyRXwVbbqLaCJfZMmsmvQuiESv8SydPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01EC2F89918; Sun, 11 May 2025 16:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C73F8990D;
	Sun, 11 May 2025 16:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E376BF8A026; Wed,  7 May 2025 10:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25EBCF89E26
	for <alsa-devel@alsa-project.org>; Wed,  7 May 2025 10:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25EBCF89E26
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=B3N0D+eb
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so597467566b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 May 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604929; x=1747209729;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=B3N0D+ebr7uyA3vsd7cyWDUeh2C58WSpe71mL0CV7IgsapfAvl8H1dYivjEDw827oE
         3Y4Hhx6xRBENHcMErGshToARTMCLpuMAb2zwAiGyOvvCqq91WU6wvCuFXXeXqvo+z5LP
         1X/Y1RCTeFPvp91BkuxfVDVxuB6nGBVB58CwmwvCPT89eGUCFo4nMATWFHiuY1HUNHUH
         dSds1w4NiCBttD7PgRyGT3Gf4zRugahvULNanMTaTndMnjsCfdMkP0dgQvI92f/mgJ2m
         TTc7ajYSTNwkGetoh7tYeQbdrBpMEcCasIq6MVg2LlC+8hm/25O4pY4LfR6OP9bss3pU
         dGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604929; x=1747209729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=SQw+Idf325d5qXuCmDE1TlN4+2RgcjfHJ1PvQ09D3GJRDItX/pzrVqf0hNor33o4yD
         qi2uU3coQlr6/p4QQ0Br46GrQei5eqSCMSdzCbsYnQ0E4EVj2ma71yro8wK9Bhq5s14R
         o8ncT/CB+qxnOMLRBDLQc05e+I9b32p+y9QgmKxqZYy4RA2cM71AzkEKvlCBA5GNzt3f
         tJgN80XCO5ikLdEwLaTawOhCztoD2KLjVUxORjZXuAkL1ndk8wUR6zHrgMpd0Gd2iLUz
         4P5jlS1mGSFlfafQky7ebIbAExFGwAtpFvgKdJF3TbUTzjI9VS7HqgZ+9mgUDjEXN2qb
         tX9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhvyWrQj4wO4wajkw0hI+dSLmLYZnDwZoE13FADeTvjaOyxp2eOc5SXPht351CKL4A+MkAu2sdka2Q@alsa-project.org
X-Gm-Message-State: AOJu0Yw+0n1qcFB0vS3z16x+1/mtdNIIyKcRetTcM0sJjVWHtSKnOHGI
	SiSrapKkzU56YtSrJaHfyxJUo8QNQ8TlLswTYLIFA3a290xG0UuG0AW7/c2FNYU=
X-Gm-Gg: ASbGnctgPLgCCsLWDoLE/i+Z7CrrPxBAg1eGxx9pZR2RyRAWY4nzsfXBa6YJUmJWXy7
	AdsByRuTzV2l8AQqWupZHPaBuMRmVggA8MnsUwPEEao0mHV0lrwoY0subBbQHxKfl5U2Dkcf+3z
	64Hdri6cVw8S1EsS0SlFR6HPjx7d85cdM7Z9U1j/9ZgyKXDQKnUVPZ/w2Igk6d9rWP8mvURyC64
	tQ9xsO9jXoVPkZHj51eAH+cyQAmWnM2aAGczMfTvDyO93qCp09iA/ae+WBUoeBSz/os4G4JwukZ
	U45ibgK+2rAZ1AerxtViCYrj2/Ns2cu3bGwQ/z0jknmQ54qedEzBr9xD/0b3DqKCPFMW9an/hpR
	KMIdpufo7qEh85A==
X-Google-Smtp-Source: 
 AGHT+IHag0H2cbbPyO4b5Fnqc17Ebpqc1RQXUqG6LtKmBXIShvnF4nzFMo2lTa0qFSCUZEOEH+300A==
X-Received: by 2002:a17:907:d48f:b0:ad1:e7ed:c1c5 with SMTP id
 a640c23a62f3a-ad1e8d5f6c8mr200591666b.59.1746604929014;
        Wed, 07 May 2025 01:02:09 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:41 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-5-4098e918a29e@fairphone.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BNHNQETOH6MWBDVZCKGQHAAC7DSFWDJU
X-Message-ID-Hash: BNHNQETOH6MWBDVZCKGQHAAC7DSFWDJU
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNHNQETOH6MWBDVZCKGQHAAC7DSFWDJU/>
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

