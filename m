Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31790AE74
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 14:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED720E64;
	Mon, 17 Jun 2024 14:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED720E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629179;
	bh=Unpy0fcgAVV1amIXBoFEhjYt8fI7Z2Vt34a/d1IuTRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJluEwzWu39Kqs/RFv1ssf8XxkVgA///UUZojOBdB7lgYL0ikkeTFoJON3zKQZTkt
	 r5B1Rdi9hhu7YejDWM1TxOacl1b4SiDZNOccyxZ5mKo/fCGAsu6Fxm2S5s68eWx5cG
	 aCr90fAjjWIQq/Eskh5IXqnbDword6W6UTEOYfA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6869DF805BB; Mon, 17 Jun 2024 14:58:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 430A2F805D3;
	Mon, 17 Jun 2024 14:58:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A709F8023A; Mon, 17 Jun 2024 14:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A231CF801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 14:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A231CF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tKPuYKlU
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57c714a1e24so4847608a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629060; x=1719233860;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQpH5thE80wSRqo8VNuFTjz9gxUBUOzFe51cHAyNWJQ=;
        b=tKPuYKlUSjMr/GHWFWw6nggBnAXgQFe0iVx/uvKWIIV0Y5BFCxv6UueL2tTeT65tj0
         s8NvObEpOYNr7dgjju1zLWsnXB1rwEdBIDhvxzG/aDTk1k2oJ9stJLZlx/OtlUGldt2d
         Ue6yY2DH1RA+4K7ftOuW20XgMroKlmhDOc3/k2soxSrEUxI/OclruD7ZGTNry1m8co8y
         zGZ7A1DTXS6zWcyE8pSE2re3tRTo1J5jP1Ow2ZW2yM5yWSwsOKK77WgWrdCFARleTuXZ
         zvRqv1d6YisDwRFk9vag8vaoql61Ok2SGK7/5rw87Qh6hHShrqh3e91cZzZZzhGN6jx/
         wTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629060; x=1719233860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQpH5thE80wSRqo8VNuFTjz9gxUBUOzFe51cHAyNWJQ=;
        b=jSbq2zQadPkkjoz3YD01nkYRNW1F2G+AQczcQTA8fQvmhcxg8Ms9Zew/oPyvMtM9Bl
         f6uV0GMnPurfK+0BvZjKCAJBgvaLi4J9mQFLbUFXPZit1e3thxVAsitzhbcgfw9lNbKe
         shCQbH8ORtZHhkfpFIhLK+yRq9Z8vunG/SvxcpV8r3aDjREEBFd6d4zTNnmvHuSHl+CD
         eH8PhLrdZl0M4u65nOigkj7RU/B40Vn0sDajHITO24J992TQTgZn8lFrzSA4PSn0OmfL
         ms5zjy8dQ3sGkXXCn1R79f+y1NLyuj9R2Xe8b60BLw37BqaiPfAbNQx6VYuUGQXA8E7U
         B22A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE/dRPNZ5nmQnGefXIABh0IckKzEdTbrqtXzU7SS4qJElsVgcZP5tambHU6enykocMKLyhZB8x9lThoyp0UFeKUlADRdwCfJM/c1o=
X-Gm-Message-State: AOJu0Yw2IFP1aF6VTZAD3f4OkO4cVG7cg7g4L9QWT2Su8DuWnDuq3Gdx
	WLtfIytBqRrIqPPReHSW6VjJvm095CmwGzwEmVfX5hpVZ/A3b7W5qC7Up/+sYLU=
X-Google-Smtp-Source: 
 AGHT+IFIpkGDjeitChcxtvy5960jSacHi9eMQgBmL6cQ9MHVVM+dDQzXFL20jMKx9ZwVFpmrLy7w6A==
X-Received: by 2002:a50:d541:0:b0:57c:563b:cc40 with SMTP id
 4fb4d7f45d1cf-57cbd69017cmr5698477a12.25.1718629060139;
        Mon, 17 Jun 2024 05:57:40 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb7439070sm6428860a12.85.2024.06.17.05.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:57:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] ASoC: Constify DAI ops auto_selectable_formats
Date: Mon, 17 Jun 2024 14:57:35 +0200
Message-ID: <20240617125735.582963-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
References: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZJFYSF3AEBUPK6AS7AZXOAI2RIKXV33B
X-Message-ID-Hash: ZJFYSF3AEBUPK6AS7AZXOAI2RIKXV33B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJFYSF3AEBUPK6AS7AZXOAI2RIKXV33B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The static arrays passed as 'auto_selectable_formats' are not modified
by the drivers nor by the core code, so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add missing change to sound/soc/codecs/framer-codec.c (Herve)
---
 sound/soc/codecs/ak4613.c          | 2 +-
 sound/soc/codecs/da7213.c          | 2 +-
 sound/soc/codecs/framer-codec.c    | 2 +-
 sound/soc/codecs/hdmi-codec.c      | 2 +-
 sound/soc/codecs/idt821034.c       | 2 +-
 sound/soc/codecs/pcm3168a.c        | 2 +-
 sound/soc/codecs/peb2466.c         | 2 +-
 sound/soc/generic/test-component.c | 2 +-
 sound/soc/sh/fsi.c                 | 2 +-
 sound/soc/sh/rcar/core.c           | 2 +-
 sound/soc/soc-utils.c              | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 73fb35560e51..551738abd1a5 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -753,7 +753,7 @@ static int ak4613_dai_trigger(struct snd_pcm_substream *substream, int cmd,
  *	SND_SOC_DAIFMT_CBC_CFC
  *	SND_SOC_DAIFMT_CBP_CFP
  */
-static u64 ak4613_dai_formats =
+static const u64 ak4613_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
 
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index a2b328f3b39f..f3ef6fb55304 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1720,7 +1720,7 @@ static int da7213_set_component_pll(struct snd_soc_component *component,
  *	SND_SOC_DAIFMT_CBC_CFC
  *	SND_SOC_DAIFMT_CBP_CFP
  */
-static u64 da7213_dai_formats =
+static const u64 da7213_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index e5fcde9ee308..6f57a3aeecc8 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -238,7 +238,7 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 framer_dai_formats[] = {
+static const u64 framer_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
 
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d3abb7ce2153..74caae52e127 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -715,7 +715,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
  * For example,
  *	${LINUX}/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
  */
-static u64 hdmi_codec_formats =
+static const u64 hdmi_codec_formats =
 	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
 	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
 	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 2cc7b9166e69..cb7a68c799f8 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -860,7 +860,7 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 idt821034_dai_formats[] = {
+static const u64 idt821034_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 3c0e0fdbfc5c..fac0617ab95b 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -562,7 +562,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 pcm3168a_dai_formats[] = {
+static const u64 pcm3168a_dai_formats[] = {
 	/*
 	 * Select below from Sound Card, not here
 	 *	SND_SOC_DAIFMT_CBC_CFC
diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 5dec69be0acb..76ee7e3f4d9b 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -814,7 +814,7 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
 					  &peb2466_sample_bits_constr);
 }
 
-static u64 peb2466_dai_formats[] = {
+static const u64 peb2466_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e4967540a2e1..e9e5e235a8a6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -189,7 +189,7 @@ static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 test_dai_formats =
+static const u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
 	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 84601ba43b7d..087e379aa3bc 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1713,7 +1713,7 @@ static int fsi_dai_hw_params(struct snd_pcm_substream *substream,
  *	SND_SOC_DAIFMT_CBC_CFC
  *	SND_SOC_DAIFMT_CBP_CFP
  */
-static u64 fsi_dai_formats =
+static const u64 fsi_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6bc7027ed4db..63b3c8bf0fde 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1061,7 +1061,7 @@ static int rsnd_soc_dai_prepare(struct snd_pcm_substream *substream,
 	return rsnd_dai_call(prepare, io, priv);
 }
 
-static u64 rsnd_soc_dai_formats[] = {
+static const u64 rsnd_soc_dai_formats[] = {
 	/*
 	 * 1st Priority
 	 *
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index d05e712c9518..20135a8359bf 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -163,7 +163,7 @@ static const struct snd_soc_component_driver dummy_codec = {
  *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
  *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
  */
-static u64 dummy_dai_formats =
+static const u64 dummy_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
-- 
2.43.0

