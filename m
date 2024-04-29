Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B808B573D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 13:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3DB82A;
	Mon, 29 Apr 2024 13:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3DB82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714391781;
	bh=8hlbxDVsli5Uho2Dc9zk1d5MLlzWuHE+5PgzBXH717k=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UbgJUcOiYVT4rDt6Ijwrx9Sngv0uEV4KZUrFrcQuRNwoBQiRyn0b7Nq6acPyxR3ZH
	 +k0BRrPjZj4V+BJoWPaQZX7a8bLoxBqZOVC3Aurd+Dduv8wbpO1+sGHIqqfFQTFMfs
	 hXKNS7p3BeUbjcXo1htPg9Kke12Xp57bffqGRS6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70DD7F805E6; Mon, 29 Apr 2024 13:55:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 816B0F805CA;
	Mon, 29 Apr 2024 13:55:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4946F8055B; Mon, 29 Apr 2024 13:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3920F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 13:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3920F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aZR8m5Tw
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a51f9ad7684so304370566b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391337; x=1714996137;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgF7uDK3ODdULvp2AprCnsXD0Ii385XkEkpICxLIUP8=;
        b=aZR8m5Twk1B9BUBGvqg2n0PBuJ2HjkVCGdEQY6ZCGOmOhq+xB1GymXNKEV4RI5LHMC
         TZokq/m/YXrPEq6VH7FHwxEw2w3P3Fjqjp7RgUr8o4gicf4inEsYzKnDP3FL4h9g+hLP
         idDlC/znZAGw4g01wTYPd5DPRNsE1kBDMLKtJ4+XaYkoRXF6dBF3XD0SBiM4yuxe2i7T
         cI8GwqeHnW8Fy4M3p7EKHV9gkMUvvVckjL+5HRLHDe7rPC7eqIFsT0D2myOsRYDCnQir
         0E99kgfiZHEdBQ/N0v1gT1ta75bgTQW1mybEH7yTYCQlgrZr7lf8ST8eIyWNTa1f4tHn
         uuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391337; x=1714996137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgF7uDK3ODdULvp2AprCnsXD0Ii385XkEkpICxLIUP8=;
        b=ou75a2De1pPYibFCcYE2ZfJYfQgwcAAFAglRetsIeKpv1hGF875gPQSXkGIhM8ClXN
         Y0nQLiE9BIpqQaFtntUGEfqmmhztA6hqO6loeyRiC02eheoIqxhXcE788mnRqufXY/RR
         vo6ozAaKoYV2KNhrsTFc+Vopk/017r2ogghjAmJtXOLV+VXvelBp+4QbHOr8JJ2U6BVR
         ylJLuyCtAJEHkh+DrG/VETbrDGeSgXSUDV3fcP9XbRjUzEMMGucXHn2VTtwwX9APtBW0
         evxyYSiMMBGKqUCvyzeuIxwUiQlvskITbT++ZGDaF1+5mkAPK7Pylpig33JiCpT7YrFk
         3PCA==
X-Gm-Message-State: AOJu0YzrOe4WadLWS9HKHLSzqXAw8GNLQG5RfAjDp1pvQikdBjq03S51
	WdATgNLmBygPPn4fV8OafYjYjDiUYZmkL+ClPzT/3r6fGU+m6rnFU3mNeep14Mo=
X-Google-Smtp-Source: 
 AGHT+IFMulAQp2dFZ0Q7CZL4pR5DvDvO/9NEVxfbIybQWLY3FZZ5OUXvmdGImHkWL/GlP/fLlPTrQA==
X-Received: by 2002:a50:99c7:0:b0:572:3f41:25aa with SMTP id
 n7-20020a5099c7000000b005723f4125aamr8735212edb.11.1714391336676;
        Mon, 29 Apr 2024 04:48:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: Constify static snd_pcm_hardware
Date: Mon, 29 Apr 2024 13:48:45 +0200
Message-Id: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2JL2YC/x3MQQqDQAwAwK9Izg1sFwXrV8RDyMaaQ7OSFFsQ/
 96lx7nMCSGuEjB1J7gcGlqt4X7rgDeyp6CWZsgp96nPDzSkqIxcLd4YVnDnF27k5UMuuCYaqMg
 4DkzQjt1l1e//n5fr+gFMAIkPbwAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8hlbxDVsli5Uho2Dc9zk1d5MLlzWuHE+5PgzBXH717k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kgxXlqNnnMKJpg2EaIkw0QWwus3XmTLMuWB
 hWfdwwddXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIAAKCRDBN2bmhouD
 14MsD/4wk/fFPGuo07Tc6t4ZBVVny/yf56kqMyV3UPs7GTN7fgENz4Vs5Gin8llVwv9nvvbIrfh
 cBrBJ53HMb7tMNtKDhoCjXLKV6y/XFF3OcjnUu8dFKF9+HWsntLk2pUa7XZf/m3xuCoFz+I2+2X
 FtEvt7tK7J1L1CbOP082IC4ZkhfTVvhN7VjqiC1AcntknqAwCKb5II6RAtl044X2cAgHBFXI7B1
 Qo/+a8PGKa0K0uBnIoHoNp75nHACjabA/jn601auP/o6zvNEBbjmG/1jviOgBIo6/+12fvjPqxx
 E9EcND0vFAI4b2W8IiR2Xg4uWuTtkzGOQ8gVmSQMUY/Xqhgulo8rrUYpnIV5JlSObZpNZstIdHZ
 3di//AnjPfGRIgVC0kO6jiOPGtCi/WnZe8zyg1tkArBgsmXLIXbuACRbR90yWnYeWGk0Ny8w76f
 T0pJ7kVVgxhVy84se9GzdxXC3V4bBs8KB0UmtCrmfQTKLG/ZcYUIptvLIejPfxSNAnOYcSN4XMu
 DF8BifoTInlQ+Xw9QYLBMmT5zOa2kXfIiS04T/C0Z55+ur3NPpX35/hwD93URXyFfrBLnClmjbo
 PHSEi6tWOFhgJAg8kZWEuqJOx4/8mOJxKL+LiIkCVek5bgHt7OxbuIiY10JdZB1Gy6BujtRGdnc
 RzHz8OsHOxt8zBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 7M3JYPYXMOIHNBP6UTUOJ3CSHKEBOEAO
X-Message-ID-Hash: 7M3JYPYXMOIHNBP6UTUOJ3CSHKEBOEAO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7M3JYPYXMOIHNBP6UTUOJ3CSHKEBOEAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No dependencies.

Static 'struct snd_pcm_hardware' is not modified by few drivers and its
copy is passed to the core, so it can be made const for increased code
safety.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: qcom: Constify static snd_pcm_hardware
      ASoC: fsl: Constify static snd_pcm_hardware
      ASoC: meson: Constify static snd_pcm_hardware
      ASoC: uniphier: Constify static snd_pcm_hardware

 sound/soc/fsl/imx-pcm-rpmsg.c    | 2 +-
 sound/soc/meson/aiu-fifo-i2s.c   | 2 +-
 sound/soc/meson/aiu-fifo-spdif.c | 2 +-
 sound/soc/meson/aiu-fifo.h       | 2 +-
 sound/soc/meson/axg-fifo.c       | 2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 sound/soc/uniphier/aio-dma.c     | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: ebbaba914053d8bcadd7d64eb8d2555299509a27
change-id: 20240429-n-asoc-const-snd-pcm-hardware-f0a5ade885ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

