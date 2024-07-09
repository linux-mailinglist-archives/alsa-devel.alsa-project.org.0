Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E792BEF3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6012232;
	Tue,  9 Jul 2024 17:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6012232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540632;
	bh=3PoSvU8RpFcazekfoaaScSpR1wxv8/6f43Gz5oYx63w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eLHXg3a4k/he/9mn8UB4nnJKbAMjnoA2k/QQDtJQi2Rev1TjVOV7UJy3aCcS6BDZG
	 v8n3OBjUSACyI7C1opEcf48KJNgMYcbXUmVA9pA4xMdnRRWLwbwByZRbyNv18YxqFi
	 rMoA7Ln69SCPCh75O2vFnPjOQKLJ+GGOgzySQmSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF882F80677; Tue,  9 Jul 2024 17:55:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A9CF80637;
	Tue,  9 Jul 2024 17:55:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238DBF804FC; Tue,  9 Jul 2024 17:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36AEBF801F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 17:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36AEBF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dY7dVEI6
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42671a676c7so7905555e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jul 2024 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538931; x=1721143731;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr3GSFWqoAD9HFFPG7fGztnMb9LgjvrtTWNplj4lKO0=;
        b=dY7dVEI6EK6zNHetS6iXXz0D1iNjM4NDP1ZfSM3sDUD1O09jMJm2vxDEUbhyyPh1Zr
         nt/0wVDnhiYPDXoRXoNC+VvKdNV1e0bWCm0VU0M5AvJAmnWsRG6KiZWhFYuc7KINLA2N
         tt3bOaKi/JZC4zPMrd82UBWmKnpFRJkpajprLi83fX8AJMvPRNeBiyz/wk0pLwc2mOP4
         XEOmjdiwx+yvj6Z2no3COZGsv0W+a0nh1/aR+Z/sW9Q6qON7ymIIN3lt9CchkBOcV4VA
         16BrzlXSmj5c7YZ8O4PEozuBhssMD/YOTMDbhd4lByMWM8jR2zZbuhuaGwZECy8nRNbC
         FZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538931; x=1721143731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr3GSFWqoAD9HFFPG7fGztnMb9LgjvrtTWNplj4lKO0=;
        b=qxzRnbcy6h96AT/XYBXIPq9mT6/2OhNWOkFEOtT2z5ngdrUP1IIXXm2Q44TEkY6Je0
         BDMNqICUwWp55S8kMbYtDn8YVNw2oT+ZsGI0/DO9tSuJvgOgxuhq82/XCI2MwJLVcBQC
         XwLRYI0P3oN61OE/Gc7YFWjz8nnAh19sL6JfYlAwkucxbxuUDe9fqoixz3uvsvc99k4s
         h4DCDDIU/lT2XQmxL06nj6GWzDhF/qTEWteMeCVRTvuw4PHaPwHLkLhgksOApInewTnT
         JRPlLT6yiuMlIzjKMrH5znP/Ryhq54fMFoGMiuX8j/0l4UIFVZOcj7oDDhbqWQHy+eWN
         ouOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/ZMbwDWiqA5o9L0gsiJCycW+u64wan/+m83S+9PLq5Lq6NbhenQ6luYaDto5KQDQ40fNgq7VqT375lPU93VxYy9mEaiwDquEFO8s=
X-Gm-Message-State: AOJu0YzeerIvAEhS2hmvBuCJezDSX92Gb0iJmtqELEKCAdc+2HDGY/Zn
	D5UK5GOvxaz7wds4qAgzNhaJads3UQFrJL1gVTfnIDJLwCcuDVIkefhAxwXdO7Y=
X-Google-Smtp-Source: 
 AGHT+IF4NFy7/t/rb7zZIftACNCfbYCcto8cUw9zZFhNxIMxce8lrJOhUjAw1tc171MTvAxJ5BdJSA==
X-Received: by 2002:a05:600c:6d4:b0:426:6b85:bafb with SMTP id
 5b1f17b1804b1-426707db6e7mr16978265e9.20.1720538931001;
        Tue, 09 Jul 2024 08:28:51 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5a32sm45883775e9.24.2024.07.09.08.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:50 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
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
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
Date: Tue,  9 Jul 2024 16:24:43 +0100
Message-ID: <20240709152808.155405-3-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709152808.155405-1-rayyan.ansari@linaro.org>
References: <20240709152808.155405-1-rayyan.ansari@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: rayyan.ansari@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5LYFC3ZQRCPWY6G4TAYJGXQIH3UEQO6V
X-Message-ID-Hash: 5LYFC3ZQRCPWY6G4TAYJGXQIH3UEQO6V
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:55:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LYFC3ZQRCPWY6G4TAYJGXQIH3UEQO6V/>
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
---
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

