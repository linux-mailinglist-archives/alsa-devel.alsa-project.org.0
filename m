Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24917CFE08
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 17:37:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A7B82B;
	Thu, 19 Oct 2023 17:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A7B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697729821;
	bh=eUAKUz4YO8Xz0F8S0fshm9MDqf6cMfgxetxviE2JtMs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mt/dI6B+qdSEzpvbJ/JEaFIIhCXR12bVULnCRnK5FFUKGJPMf8SMgwQT9bx/PBlsS
	 ofAExrCE8U/1XUE/48Hqe7r9M6POYTO/wrL1xoIYqT0UUEfOX9BwMt4tTB9jZkYVzo
	 gPU5y8fWSf9M593w/a3rPRJy8lvW6ezrScQLAvJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C118AF80553; Thu, 19 Oct 2023 17:36:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C3F1F8025F;
	Thu, 19 Oct 2023 17:36:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1886F8027B; Thu, 19 Oct 2023 17:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DD2DF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 17:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD2DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fbBx7lS6
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so13427477a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697729760; x=1698334560;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tulhhblHrcCah8iPxnvKfrb/Qib8qF8UaGqM5t3jbq0=;
        b=fbBx7lS63ynn2pBTXx0TD9Xjw34MBDPgzTDPFv/kNIzE5jzVtxgi11VzPAGXH/VKVW
         vkvvL99/yWz4TxRq3RcjdnHNf+hIK/bzOqOdM6JDEhesXb2EmX3Q0Hf9D0LPh8h5Zchj
         HYIgvXiFQvkikXy3i9kK/A7KtvgiGb54Whph++FGsjUbS4I2XGL30OGNJgTGjPXM+D47
         JT/3zVf4DMa38DGuzIbeJMNa4QYO7+eUd4soE7eTyf8j17tGtyvIuXHKOg+kxRMCN3B1
         z23I4YkBu19N2uNTiFONlqzc2gS+odV1HCZ9p1243f0Zw4hq2oZ4ptkSxsnah2ALu9iU
         iRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729760; x=1698334560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tulhhblHrcCah8iPxnvKfrb/Qib8qF8UaGqM5t3jbq0=;
        b=OOW37zi2dwp1HbzANHq3KPZGczbXrKRlOPSNDc4UFuLWULQH+N1syKWoF4F3qLa08F
         6KYVD2onA5OGRxrILBttNkPs0dN2zholAsIF+nl4L+hdRNJhB7qrlDk4gciJqyiCgsj3
         f6NB26YYq4YL4pNKf80olQ/oaBFFEekPK2aZ75tZ8u+coqpBxYEijThCoalSc1iqQSEA
         Wr52ZPLpXptJmyazlXHBNg3KH2fSM1srnG8I8GABgqq6B/gioAVbo3UUFNZxKNVqNDqJ
         EdqGb6KrQsDbzRqU6+XQ9JiprjYX+1OvjaSf/4mp+arqicX4bVtPceQKpaeLXtBpFsuc
         H20A==
X-Gm-Message-State: AOJu0Yyp1oqmD7g71Pm3TEwRCaE9rfz4xjZGjisQOiV3je3DwWBJVDm/
	iaW2IP86a3Ii3tfLGC6Dhgp5Yg==
X-Google-Smtp-Source: 
 AGHT+IGNhUCwSgjJIlC+Kc1pNz6Qg02U10hXnQsaMQCy/FidnXeNoyfRdij7ZAi4eWS4G4DjWbAC/w==
X-Received: by 2002:a05:6402:2741:b0:53d:8320:efcb with SMTP id
 z1-20020a056402274100b0053d8320efcbmr2430553edd.36.1697729760130;
        Thu, 19 Oct 2023 08:36:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 c64-20020a509fc6000000b0053ebafe7a60sm4743875edf.59.2023.10.19.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:35:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add WSA2 audio
 ports IDs
Date: Thu, 19 Oct 2023 17:35:40 +0200
Message-Id: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RHKCYNQN6ODSN6JJOMN337UAVSVWUOMS
X-Message-ID-Hash: RHKCYNQN6ODSN6JJOMN337UAVSVWUOMS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHKCYNQN6ODSN6JJOMN337UAVSVWUOMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add defines for audio ports used on Qualcomm WSA2 LPASS (Low Power
Audio SubSystem).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 39f203256c4f..c5ea35abf129 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -139,6 +139,11 @@
 #define DISPLAY_PORT_RX_5	133
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
+#define WSA2_CODEC_DMA_RX_0	136
+#define WSA2_CODEC_DMA_TX_0	137
+#define WSA2_CODEC_DMA_RX_1	138
+#define WSA2_CODEC_DMA_TX_1	139
+#define WSA2_CODEC_DMA_TX_2	140
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.34.1

