Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 800559339F8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8E4839;
	Wed, 17 Jul 2024 11:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8E4839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208886;
	bh=GyHNGl6crgejPZUcF5UFfU1I2URJ1GXezzYJiwmUt7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T/1emZPVIXHzY/DKXU4LX2IngeB3sffKiJB+THdfhsebh4XM1BkrFESBIvwmH4Czm
	 Yp5x3mp2iBARF2ejBanbncybjO3xQ7kFNmi6hqNi2YDA9l92OTuj2tJvT+XP5ff07T
	 Ue71Hw4A/mjz/Kgm7QaaFerVJC0zteCwBiSP+y1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE2AF805F9; Wed, 17 Jul 2024 11:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E86C0F805F0;
	Wed, 17 Jul 2024 11:33:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A93F9F801F5; Wed, 10 Jul 2024 13:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F945F80074
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 13:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F945F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O1y/Q71p
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so7553911e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611627; x=1721216427;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tndFt/m+6Xi7iQuvvSvyVqsOQaEsWMefArV1oOIs2Gs=;
        b=O1y/Q71pSxZzqHsj0wd0+DwFbrpEehv7c86akM+BF/te9dBA77PG3CAvf+Z0iBGniF
         Mwlomzo20Gj+CuYQmGKPZSx6mv5t0QpsdUH5X+YOclkE8s0kALh3Mhup6fkOCNNWv9dW
         IZzSK12TKHtqMYY7QqlGKV/Ol8gHgd57LfCLIULM+WvrYaxZNv+vGGH9gcnhdrgqoC90
         QItYRZ1qZ/+iSxnnFGJ15Nq3pni3C3R+FByHL3J155hN0/u+npJrqJ0B891cCEcE/OyP
         apaCRrGtZ9yioU8evoe8aq/3X4FdeIH0bf32VH2QGKBJgzgkV+qxUS/XygMzChOuc0Af
         4GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611627; x=1721216427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tndFt/m+6Xi7iQuvvSvyVqsOQaEsWMefArV1oOIs2Gs=;
        b=kmsJR3o9ELDAjhKR1l9YJ2ahwhmJrg9N2+QjALtesjaaFT3sphOO51MrwjPmVs9hs0
         1ZNHBGZCwZLDnV/sfOudSK2wcij23pQI8KaH7Bd7RE5u71f19uz/8kyxABQ7xonkUZGy
         82xPGhWUJ3uD7Q4xGaWbfMwi/yh4LfTztkBZuB0NRzG3Y2Gn3GCu/1cLMJQpTqWY/VG7
         4VsnHSM85AbigAGbUiHpteBIUaxkJP4bTfg+UgqwkAMrarn+cXhyRAz1yJVrkBkM++Yt
         MO90wsET2Ay+40gb1Hqp+sTGOrjlhRHtG5AaPDagw04iL2IbyxcnwZEpMRfIru+izWmh
         h/yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjPTE1IDJmpK7ZgYCN3Ct3Sjqbt+LYD2oKe1cSCL1o/KEhTZZRIhenw029tp541uKCNSigTOJTFcB2xEqFXVOHgktYYqLqNS5Ik8k=
X-Gm-Message-State: AOJu0Yz267snzXo8k9ynyluEghbn6jJjyisgwkiEnnysbo55yA8Cw62u
	B4TgkEClcwIQMPMcIqFUFCOeUItGLWTgTx9/Uz9NdsvBb1zoz4pHjjo9iCCcrSE=
X-Google-Smtp-Source: 
 AGHT+IGWe2HWZsTajp3UFPHR9qdU81qRPqrHF9w7b7rKpMjUZoKdSVUGVh8iPNoyMohT9TfK8GN/3g==
X-Received: by 2002:a05:6512:238e:b0:52e:bf53:1c13 with SMTP id
 2adb3069b0e04-52ebf5325c5mr1174068e87.7.1720611626810;
        Wed, 10 Jul 2024 04:40:26 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:40:26 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
Date: Wed, 10 Jul 2024 12:36:08 +0100
Message-ID: <20240710113833.39859-4-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: rayyan.ansari@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7VN5KLNRQOUAJFZAXA2EXEA6XNCE44MW
X-Message-ID-Hash: 7VN5KLNRQOUAJFZAXA2EXEA6XNCE44MW
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:33:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VN5KLNRQOUAJFZAXA2EXEA6XNCE44MW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove old txt bindings and add apq8096 soundcard entry to existing
dt schema.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1 -> v2: added r-b tag to commit message

 .../bindings/sound/qcom,apq8096.txt           | 128 ------------------
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 2 files changed, 1 insertion(+), 128 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
deleted file mode 100644
index e1b9fa8a5bf8..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
+++ /dev/null
@@ -1,128 +0,0 @@
-* Qualcomm Technologies APQ8096 ASoC sound card driver
-
-This binding describes the APQ8096 sound card, which uses qdsp for audio.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,apq8096-sndcard"
-
-- audio-routing:
-	Usage: Optional
-	Value type: <stringlist>
-	Definition:  A list of the connections between audio components.
-		  Each entry is a pair of strings, the first being the
-		  connection's sink, the second being the connection's
-		  source. Valid names could be power supplies, MicBias
-		  of codec and the jacks on the board:
-		  Valid names include:
-
-		Board Connectors:
-			"Headphone Left"
-			"Headphone Right"
-			"Earphone"
-			"Line Out1"
-			"Line Out2"
-			"Line Out3"
-			"Line Out4"
-			"Analog Mic1"
-			"Analog Mic2"
-			"Analog Mic3"
-			"Analog Mic4"
-			"Analog Mic5"
-			"Analog Mic6"
-			"Digital Mic2"
-			"Digital Mic3"
-
-		Audio pins and MicBias on WCD9335 Codec:
-			"MIC_BIAS1"
-			"MIC_BIAS2"
-			"MIC_BIAS3"
-			"MIC_BIAS4"
-			"AMIC1"
-			"AMIC2"
-			"AMIC3"
-			"AMIC4"
-			"AMIC5"
-			"AMIC6"
-			"AMIC6"
-			"DMIC1"
-			"DMIC2"
-			"DMIC3"
-
-- model:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The user-visible name of this sound card.
-
-- aux-devs
-	Usage: optional
-	Value type: <array of phandles>
-	Definition: A list of phandles for auxiliary devices (e.g. analog
-		    amplifiers) that do not appear directly within the DAI
-		    links. Should be connected to another audio component
-		    using "audio-routing".
-
-= dailinks
-Each subnode of sndcard represents either a dailink, and subnodes of each
-dailinks would be cpu/codec/platform dais.
-
-- link-name:
-	Usage: required
-	Value type: <string>
-	Definition: User friendly name for dai link
-
-= CPU, PLATFORM, CODEC dais subnodes
-- cpu:
-	Usage: required
-	Value type: <subnode>
-	Definition: cpu dai sub-node
-
-- codec:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: codec dai sub-node
-
-- platform:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: platform dai sub-node
-
-- sound-dai:
-	Usage: required
-	Value type: <phandle with arguments>
-	Definition: dai phandle/s and port of CPU/CODEC/PLATFORM node.
-
-Obsolete:
-	qcom,model: String for soundcard name (Use model instead)
-	qcom,audio-routing: A list of the connections between audio components.
-			    (Use audio-routing instead)
-
-Example:
-
-audio {
-	compatible = "qcom,apq8096-sndcard";
-	model = "DB820c";
-
-	mm1-dai-link {
-		link-name = "MultiMedia1";
-		cpu {
-			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-		};
-	};
-
-	hdmi-dai-link {
-		link-name = "HDMI Playback";
-		cpu {
-			sound-dai = <&q6afe HDMI_RX>;
-		};
-
-		platform {
-			sound-dai = <&q6adm>;
-		};
-
-		codec {
-			sound-dai = <&hdmi 0>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b2e15ebbd1bc..c9076dcd44c1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard
+          - qcom,apq8096-sndcard
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
-- 
2.45.2

