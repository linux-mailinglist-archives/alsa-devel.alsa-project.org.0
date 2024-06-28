Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A506E91BC5C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:12:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0574D2355;
	Fri, 28 Jun 2024 12:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0574D2355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719569536;
	bh=+/S4oEpOVrDy/MErgYZK3QlF9tlGNIxFq9HMRBhfBvs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qrMrfGFdYGHIJzJ3EFdBTiQWLF1wgZ7csl2DFc6pOe0P8ZRWyr1cIgE8Dic6zU0MC
	 mvoUZ1ayzFME/61iQlIh11DxLVhuqy77YAR9Is1h58SnP6bMdyzSqRXYL10wrgRRoU
	 /oicAmJJ65DzQyvjU1XYasFSOMUhtToY2QVD3sAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3876F805AE; Fri, 28 Jun 2024 12:11:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E3BF805AE;
	Fri, 28 Jun 2024 12:11:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C49F80423; Fri, 28 Jun 2024 12:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB696F800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 12:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB696F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LGCkMmr5
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e72224c395so4385811fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569491; x=1720174291;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KM8DD+cslID7pkEl7Dub+wrgxyjLr4VeNk8hahbUqJQ=;
        b=LGCkMmr5MgJe+NY61vcBmzZWE4ZoTFFNOYX1WkvmnetutaFlpQbm3htUPFfKXb0D8r
         nqKECbhIfhTLsMbmAFX3TMbR+V4vKy55kbWyL7AZPZPBzYwZLMAh6N+f+ftqK1zyMHq+
         yak6a4YZpTX8VfSB/2x4HS3RZAq7b0PmMJTCLrb2KymYl3sIzO5bv9jbuu+2vytoz2O4
         EGUaKE+ydlxs/LJQ029UMNuzJ3srrdmr08qxIfA2RrbF/Ufkugc9b1IyQRhc6CF5+u//
         G6phGDTtWo7Cka73LfPQ5U5Czw6LlB+bkJhotKCUWytfBLIZKJbyFNZdYzDc6ptIYJlK
         N2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569491; x=1720174291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KM8DD+cslID7pkEl7Dub+wrgxyjLr4VeNk8hahbUqJQ=;
        b=FTrKWnxRmN9Q4WiEy3+zFRX6N3jzq/VYRS2pxGUKVfEyShz+b9N5Ck0l0jGJnzMWr4
         7jl3vEnXOheJWZ0FOKcf5Vo6LETPQN162GT2XrvidVmFxJGGlXZ+71CyRW5o1RR4dS7j
         RvIAIErhQe+1uVh3Mw/MuNuPkJGfRp8xo1DyjbA37Rmw0uGsHmJEkmwtPtP5wt9bXEXN
         8+8xXIKRy0/25xUcTyU91v670KP89qzEqjBn9dMjXWLxOBq7P0nshqdbIUCwBgP9PONP
         KiZc02B6VpGVHoQwvUzKhqC/SKEatJa4S8noDZCgXMdLavxF9sbN/6v0KT36AmXBinW9
         hAUg==
X-Gm-Message-State: AOJu0YyH0ohrEpjkeBRzcikxj09WsvBGNmaIWP+T8FkF2eUP1Z0Pfa2C
	G3ImL4sSUBt1ZgYykzPPwMpkLJZIwy1R4V7i1wnIOOA+ZiU3m5+cUKEOzzeMBAg=
X-Google-Smtp-Source: 
 AGHT+IHGFbihiK4LC17Z1HPkdsgv7xrg5O3Etzoo9ELEAqXsyotSeiGHHEDWd+tDnW/Vp67/PjINYA==
X-Received: by 2002:a05:651c:19a2:b0:2ec:616e:1c92 with SMTP id
 38308e7fff4ca-2ec616e1e74mr107676391fa.2.1719569475239;
        Fri, 28 Jun 2024 03:11:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] ASoC: codecs: lpass-rx-macro: Few code cleanups
Date: Fri, 28 Jun 2024 12:10:54 +0200
Message-Id: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC6MfmYC/5WNSw6CMBQAr0K69pm2IL+V9zAsavuAl2AftkI0h
 LtbuYHLmcXMJiIGwijabBMBV4rEPoE+ZcKOxg8I5BILLXUhS13BvYCn5QeYxRHDNJsYwbJDC3Z
 C45c5gq5UdemVk2XTixSaA/b0Pia3LvFI8cXhczxX9bN/5VcFEtBhrupGOZ3X14m8CXzmMIhu3
 /cvDY1I39UAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+/S4oEpOVrDy/MErgYZK3QlF9tlGNIxFq9HMRBhfBvs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfow6hXMAhvr9f3euJp7I7UGeii4vjsSCL5dyf
 0dQcDhU8YaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MOgAKCRDBN2bmhouD
 1/h/EACK/mT4hTlY/Gsqi924GgxMfmmCjxJcsbhVBxXqRdk5McOUeZeimSfM2jk1Qa7xwV9mtLv
 aH7mlwTsvWvXGhnzc89zVqSNPTLcxbRcTp2kzw/hcqLLkxhrUQ4bH9HKAOKDj28EEZ9KMnokauc
 eFiJFEy97/wP1P5mIU7ZL/u/luEqJgQReRYBS6JFCyPpn1rl/b5rSzUrbW6pQImR7hXdHyrgsxr
 ceSTCaMDFHcVeAq1lhrkItJn3+7SmNb07GYWfU90xK2uZ2LlmBgRMBILPn3ZSvsBkDP8dnoKrt2
 iPtTOo37byd0B5QlbG6FIF6qrFQP06gTLKg/MNxvQhckNZSK00eScFrwC/XLWHyEm6is+Vl2RoR
 msxHrNi81U4g51Ysb2SynbI2U9p4kdwLw5bkOWYiN8p7wUgSD0KoTclVKgDBu1yu8QxHaNy4lmB
 tWSXEGuj735nnWP7ldjj+qqXKOxP4wuMV83ksIJZ95HdTH5O7a6omqNiiGHdVK8miTgmjNrgmZf
 xAHgRqk5EAuvf6vMkh/WRRJW0ciWFaMIKvF9VcdfqJtHxdcinZUWBwL2gW5FMEMPKb8LQE69HB3
 bbXaeiPZiNM+XGFBzSTjLIuH67VlePOCwN1OXJqG/CmCisjpS2Jbnxnfusr+nPsphoA803YA90j
 NKZIK/tDtcY7Uaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: LVPRL3QQW46SLMFG5FNY4PKAZVJWBXJ5
X-Message-ID-Hash: LVPRL3QQW46SLMFG5FNY4PKAZVJWBXJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVPRL3QQW46SLMFG5FNY4PKAZVJWBXJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes in v2:
- Use cleanup.h instead of devm(), therefore not adding Dmitry's review.
- New patch #5.
- Link to v1: https://lore.kernel.org/r/20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org

Improve a bit the Qualcomm LPASS RX macro driver and align similar parts
of code with LPASS WSA macro driver for consistency.

No external dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      ASoC: codecs: lpass-rx-macro: Simplify with cleanup.h
      ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets
      ASoC: codecs: lpass-wsa-macro: Simplify with cleanup.h

 include/sound/soc-dapm.h           |  2 +-
 sound/soc/codecs/lpass-rx-macro.c  | 31 +++++++++++++++++++------------
 sound/soc/codecs/lpass-wsa-macro.c | 22 ++++++++++------------
 sound/soc/soc-dapm.c               |  2 +-
 4 files changed, 31 insertions(+), 26 deletions(-)
---
base-commit: feca1ff0cd5ab7bc3990ec5a387d81d4dff88068
change-id: 20240627-b4-qcom-audio-lpass-codec-cleanups-27175f1d069f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

