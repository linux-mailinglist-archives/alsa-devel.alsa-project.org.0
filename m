Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F9952A67
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B82972BB6;
	Thu, 15 Aug 2024 10:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B82972BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710407;
	bh=OI0BTlanZ3ouih1Oc8Ys+Q4/CwcrtvqnlxKkb99HXII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z7cB60xN3zvvcTAIPecyBURUWDIXbLNnjHOIbQaMoah7kM95mvusep15myL4MtjBb
	 cnMc7azrJfZnJmUFwKvtsmPU/YzTRS8KOoMateDAS+WgWyOnTx5Y2rbLxy9KmLx7CZ
	 qMRylTvHu7WOB/Cm3QCyxIwZvJJykT3md5wabqa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27D1AF8072C; Thu, 15 Aug 2024 10:24:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC018F8074E;
	Thu, 15 Aug 2024 10:23:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB09FF8023A; Fri,  9 Aug 2024 10:39:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A545BF802DB
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 10:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A545BF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=ralt7BOQ
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ba43b433beso2056177a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192454; x=1723797254;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY4fryrxNkvZgli9BRICsfInr4nHVNsC/F28oVigWAk=;
        b=ralt7BOQiZd7J9S7smASUBg+mQO9lnmiQvPhsFGfJtQQ/NTZr81IgzW8Px9yQ5GmOy
         ezKSp6fJLwW9zdMMOr4wp2St1swPvljdCqHIgB4z/EUzXpSNmMN0IuUgVNZSwgP/tRMc
         tay6TVXkauZ/Xd+wn8TkucxsCOadOwXXUJN8UgTlolfVAFwerAZQ5XiaH/p4rFfJwY+7
         3Cb8QYLydOEihCaGzJCjMO7R8bEk6VBsnD3aFpIpQVkrZJ1Trd4ctgz9q6KgNfiZTc1h
         2uC1guSPMlQKDHjxtJzx4xqHkTvcRswM/db8kwUWUeizJQ5TbjJFQs/2ntRh6JgTnd+W
         PNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192454; x=1723797254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY4fryrxNkvZgli9BRICsfInr4nHVNsC/F28oVigWAk=;
        b=jxciaMDdVZguvL622UM8mPNxMteUqHCZ6GY4Xb3kFEXKfqeLPALDsFt4aC0KDTDLwu
         bPmEd8wcccMLyiU7gxiwrFOZifTdFMsjX/MjOyMTwcdd4leWFvig3Zv9bBEALdEj4I27
         2O36q0LZUcE905PFofbzBKPLeP7thFEAhYYanwSvngXUHst2fo63ncb6ZTTDaWRA065I
         zmcXTRKf92rH9kYWWuillWDjWNVS2H/0GXCOn6jdy3YkzpmsZ5a6D01Bl0AZ7Xc9Gq4K
         RlfJhjcBCz7+swniPmKw76acePrqcKp0EwnzIst2lPFut63pLPdWylgliwBv2F7IdZ40
         qiSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIZVdgK1D4eAFv4q0CbtucZL0R2as+RFEo7rHls9ph3/asO2k1AK6vk/jQdlCmTSHmRiGPVtNcLg0BO7WCp9CpWGA36lwgx8ZJ9RU=
X-Gm-Message-State: AOJu0Yx37pcS3xr91Dr1h8RiZC/Mds3xB2zaa0muSI5WYA8KliRbvE7l
	DmPhjJmbGv0TGWhkwo2KH5Zo64clCwyo0RwM8XyHu7nN73mZDNYY3Ff1Z95x7VI=
X-Google-Smtp-Source: 
 AGHT+IFR/fUi2PxofvVcuUfiPXGSTvHp8HjNo2okFizvskVBpDGatZfaIDw3fHAvXy9BNCnQOZOyKg==
X-Received: by 2002:a05:6402:4309:b0:5a1:b42f:c93 with SMTP id
 4fb4d7f45d1cf-5bd0a588be6mr680639a12.13.1723192454170;
        Fri, 09 Aug 2024 01:34:14 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:59 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-3-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.1
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WXVREVOLCVE6DYW5GUMT7KJZFXRQG4VK
X-Message-ID-Hash: WXVREVOLCVE6DYW5GUMT7KJZFXRQG4VK
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXVREVOLCVE6DYW5GUMT7KJZFXRQG4VK/>
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

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
(from cover letter)
Unfortunately DisplayPort enablement itself for Fairphone 5 is not
upstream yet. This is blocked by DSI display bringup upstream which is
blocked by DSC 1:1:1 not being supported upstream yet and just working
with a hacky patch. Nevertheless, DisplayPort audio was validated
working with no additional sound-related changes so once DisplayPort
gets enabled, sound should also just work upstream.
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 8ab30c01712e..45d4512546fe 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -14,6 +14,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -841,6 +843,12 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@104 {
+		reg = <DISPLAY_PORT_RX>;
+	};
+};
+
 &qup_spi13_cs {
 	drive-strength = <6>;
 	bias-disable;
@@ -914,6 +922,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcm6490-sndcard";
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
+		cpu {
+			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 

-- 
2.46.0

