Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD78995166
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBEF826;
	Tue,  8 Oct 2024 16:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBEF826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397373;
	bh=ric+SLdIOtDdMn/bjY4ZV6JUUhcdjPFI79OUCHUnDgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akrcipdkNusaFE7kAdPusYxvXGz7Nf/QV5zS5TBi1VLhOrDyq2EOCLIDugwXWonNc
	 dONSVpMXKv1ZeOx18WvtVWCHuhBORHEzXUHxaqugMwzAbnCmXbT7xWuEX3U7xxXuMZ
	 RyBJSdCgwfzYMFpIxk1uoJV3wrXGzlKMK7gCMIao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 822AEF80699; Tue,  8 Oct 2024 16:21:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB83F806A1;
	Tue,  8 Oct 2024 16:21:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06E1CF80508; Wed,  2 Oct 2024 04:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D50BF8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D50BF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vZMoUZGH
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so1140355566b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 19:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835629; x=1728440429;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIw3pjujevMfYCBuBjwX4+AVabirKPTZ9D57CaVG3PI=;
        b=vZMoUZGHXliC3Fic1lac6q/SiuCN7fCZwxRf6syY7R1Zh2uRjhS8/X+ohX/UEH+DGo
         c+d4gYECNIRMSdZWHR10TaQ3HxDO0cekxYKrgY/P+3mNod2p/0Qo29FTVo8WzSFiHbI8
         1BetKE73vVM1snbVPoH/pGGfEV3Ebjlvwvzd+qr53Y/8bMHA0FKcCCDA6srCxQfRYQWK
         wRZ3z8HoEXAE4Hu1LqjhDsmaSjDDDZNjPNbC0VJLsWhcuTOkdG82d3m5h98pCNKWTPdv
         WudwmvUfyRvRsQ8QHNxvB3liZFlE4Q6M3+JUS4Bn0EKa8uig/rZ7UR3+z+A7paUSTbxs
         AYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835629; x=1728440429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIw3pjujevMfYCBuBjwX4+AVabirKPTZ9D57CaVG3PI=;
        b=GuwoDSqzDQfCbQCwA6YQ6pRI232LritxQXxrd0CCBu1YIi4a6TJ7ZZYGXpITK4hwmW
         t8D7YGiBzXoliSRq9jvtIb3S0keJdZr/ZQqMGQunImU3f/cpwS7kAqxNu9GY2LCUARVt
         Vwx2aMLOy0pQunCBlM/lydoPs14sVqR9bU4vbpr0kmh1DkmB6wzm5CdWlvtvP04tIZDm
         KGkF5WbABk86AAaasbzkgYWls+BCTm2Kfi05IGN5ivQQIAXIg9YHMA6rS7ygYH+iD3XO
         F55yaLfcOzb96JbxmC7nziK4Bo6Bgnhsm1sPpWDb/BQkvrJPy+BC5TQLbGCcA0vFw722
         vMCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDegl+phNUJOxE/WmWv1eD4NYYYKpVOqp2M3JoVzmtkoFKlzIZWumr/9h+LTRHk88mwxanZI0b3c1W@alsa-project.org
X-Gm-Message-State: AOJu0YwH7UFgwowtiE8uOBN563PJRfrYe27Uky7xgYFGA1lYvBy5dQGJ
	AMoZvwisndb8mtZe1PlNILloha33aYwek/zbdSsLm+2Ea+TIDbmqmUxnIovuakA=
X-Google-Smtp-Source: 
 AGHT+IEVv1yZPyk7AlihJhG5VqeeKRdBXm8rwVDjskcD7VkJNBZU1ibp+Au9f/NNatFh5EVKsuyquQ==
X-Received: by 2002:a17:907:7da0:b0:a80:f358:5d55 with SMTP id
 a640c23a62f3a-a98f824f579mr132293266b.33.1727835629204;
        Tue, 01 Oct 2024 19:20:29 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:28 -0700 (PDT)
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
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Wed,  2 Oct 2024 03:20:13 +0100
Message-ID: <20241002022015.867031-6-alexey.klimov@linaro.org>
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
Message-ID-Hash: WKQ7MTGFJECKWVOSKRR6VQHNGNJJHW4R
X-Message-ID-Hash: WKQ7MTGFJECKWVOSKRR6VQHNGNJJHW4R
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKQ7MTGFJECKWVOSKRR6VQHNGNJJHW4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI)
pin controller device node required for audio subsystem on
Qualcomm QRB4210 RB2.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index c5add8f44fc0..37c0e963e739 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sm6115.dtsi"
 
 &CPU0 {
@@ -36,3 +37,18 @@ &CPU6 {
 &CPU7 {
 	compatible = "qcom,kryo240";
 };
+
+&soc {
+	lpass_tlmm: pinctrl@a7c0000 {
+		compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+		reg = <0x0 0xa7c0000 0x0 0x20000>,
+		      <0x0 0xa950000 0x0 0x10000>;
+
+		clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "audio";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&lpass_tlmm 0 0 26>;
+	};
+};
-- 
2.45.2

