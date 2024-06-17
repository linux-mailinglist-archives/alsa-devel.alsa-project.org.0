Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23DB90A97E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 11:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1DAA4A;
	Mon, 17 Jun 2024 11:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1DAA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718616370;
	bh=eAgTCVGAV6EPOAUmy1VIh5I91Q873BoEU8+USCkssMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CuaDaL9KjnjED2BexfzlFNNgyOZzCGGuugGVjRC/sA4azLaB5Hok5FF+3LJim8dh7
	 e2FykXkVufEq3+dpqaqhABbBRtAZsLeGuoQ0l8ayBW3q9tze7NyoeQ1DKSrWQec4PI
	 MA7PIO/yR9yYEeqvukpMjNjkI4ml95wd9r5axbr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B4FF805B2; Mon, 17 Jun 2024 11:25:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BC43F805B0;
	Mon, 17 Jun 2024 11:25:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78D99F8023A; Mon, 17 Jun 2024 11:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03CCAF801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 11:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CCAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S9+kE48L
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso633859966b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616117; x=1719220917;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM9IPnP8/0YXyiArT21pvUePu652PEvGsnn6Iiq8wUk=;
        b=S9+kE48L5IHksvpsYZ5JuZnQ3C/RuIQCJlQxJdq+qWwKTEYXpmhLaA2F9GljBGL6hd
         MJVS2AYCT8JYilgZ+273S1aL9VurLz7GwP6pHh2RXzL6BfpW11NQ+RX8jpY234+eMQa4
         0YKXzg8RtzFju9DRsUHpQrgpRjjXNuyekPmR781PEhTcQkj5pRkjSVxt5sUkl//uWMEu
         9SXFT8Qp2f+QwGJpDmmbqpgSljK6Ys1+odOnfFnXgG5zxK4rVtRhAa/eTIeVPluEeJgI
         BUrdihmB6Hzpo+A9p90xtqqhPVvkUzm2FoyIrWk0bow20IZ+cl6vUvpksDwVzGlWU5m2
         1hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616117; x=1719220917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM9IPnP8/0YXyiArT21pvUePu652PEvGsnn6Iiq8wUk=;
        b=rbxTi/GIbDIl+ePtzAn45i3Bl54H5feSM8MHy8RdsQ4I3XlqcQhKU7K8tp/YZ0Vrp0
         AVh2goZ7vrrNMwNJxQQA/V9G3DoidudwQ5XBtKAaIVMjVB6FLdYpxCHPy9ivtVPBX603
         IIGDSE5EWd+16Q0FkBx66l3ac0ttL9BzRrMHeyB104y874L4K9G+zXyU+Cr+dYQYifG7
         lAe9et8LvGcQa85WzM8x+Zrou5XreY/OjIXGAale1GpUsW8OvXBV1XprdvV0oIDQcOPN
         7Z2dMToIwPDTrX3X2MBN9V2H72ZKfHMAX5k85lHeSxGH3kUV/Gwr+9VmE3RVJd594Ski
         1djg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6qrI09bEcvha7hug3yJo7mE2tDt5USnQAI9Km9b4qzo18rig9cYhKcDRR7veykNWhpaqB/blsfg4Yse9MLRrg9qamxqDIf/QucIU=
X-Gm-Message-State: AOJu0Ywr5gQSAfJU9eC6Wlud3P7p/CkYdXbRMva+6tR0JTSPFQ/nMPJ2
	QoEqnNfFnVRxUExZ+TJU+Hg5bRYbYjnNPCkHsKpvkKlsbATeskculvUWV5iBDkU=
X-Google-Smtp-Source: 
 AGHT+IEanYWlM3d9JWU/5k+2u3LYtdAAule1YY6wqrXPIyG+saueZDyCnhT1fyYflEFvgm3euf5OSg==
X-Received: by 2002:a17:906:c1cc:b0:a6f:513a:a65 with SMTP id
 a640c23a62f3a-a6f60d3cdf9mr594368066b.33.1718616116790;
        Mon, 17 Jun 2024 02:21:56 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed359bsm497944966b.137.2024.06.17.02.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:21:56 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: Constify DAI ops auto_selectable_formats
Date: Mon, 17 Jun 2024 11:21:52 +0200
Message-ID: <20240617092152.244981-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
References: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TPUMBRMTO5AAPHFPTXPVL5M4KZDRNRFE
X-Message-ID-Hash: TPUMBRMTO5AAPHFPTXPVL5M4KZDRNRFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPUMBRMTO5AAPHFPTXPVL5M4KZDRNRFE/>
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
 sound/soc/codecs/ak4613.c          | 2 +-
 sound/soc/codecs/da7213.c          | 2 +-
 sound/soc/codecs/hdmi-codec.c      | 2 +-
 sound/soc/codecs/idt821034.c       | 2 +-
 sound/soc/codecs/pcm3168a.c        | 2 +-
 sound/soc/codecs/peb2466.c         | 2 +-
 sound/soc/generic/test-component.c | 2 +-
 sound/soc/sh/fsi.c                 | 2 +-
 sound/soc/sh/rcar/core.c           | 2 +-
 sound/soc/soc-utils.c              | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

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

