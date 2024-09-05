Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A030396DB79
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DE7E72;
	Thu,  5 Sep 2024 16:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DE7E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545827;
	bh=1uqZdGxPQGBnP8j4g6VlFe4rJuLJoGF/D9uni1/dnBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sQI7C5H/ZzP9SypapXjZzYguQJwBCDTNCfrZxPRl8UWlFdNPR/UC4wSB146pFQ8qs
	 XHlXk7LD5IQ6SPThHRUU74jLGI+WqDVuhVSYLQp8utRZRdY3y0/UQ0KSbo0O5keCZF
	 4N9cswIse6/bIHeWe96eHfOJ0NE97dV+HvXiDgY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2BAF80797; Thu,  5 Sep 2024 16:14:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD43F80794;
	Thu,  5 Sep 2024 16:14:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D279BF80611; Thu,  5 Sep 2024 16:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CE9CF805F4
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CE9CF805F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JB+RLusb
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso8811105e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545624;
 x=1726150424; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NInuXK75oVteTq8w9+Oc9GnjLQbH18gVkPWMAJJFJ/U=;
        b=JB+RLusbsEo43Cus8sXyBW9CHLz0BfO1Zlvb019c+xEepBof1aS0G3Iv7LRMad8tWp
         dbDf4bFxB2y4iJjjXf6WEXJ4MOQdMfzxGPd1swz6i6Sh8Vr1vkmQKBkl1eCH+nTO+eoP
         P7+Ah2VmCcAsvYkMxgj0XsYYnnKozBsWP6rIvp70j/ymCFyb+6epFunRtS28v3jFeJ+l
         w1zWe8kr1BPN6rbpMLigGjlkuCHB3/ejRop+XU96Va8uYZOu2+ABdYo/NTKIulIA+LDQ
         MGkIkfCMaZiNc+KT2LJdE3v6qxGdt7ZjJXmrMmMH8GG3YJP+IALFJXYjzFbMJaFC0LUv
         xASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545624; x=1726150424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NInuXK75oVteTq8w9+Oc9GnjLQbH18gVkPWMAJJFJ/U=;
        b=TAGMnxLmZ13IYwpu96K9Yi+gYadTpy8c8oBWq9gTMTRds+zIQMQaRfZ7mpbUH48E6b
         umlIoIeJeptZpbgBgWdFMQ3s+EdFMvEXkVW+CHL7EuLHFSYjnIRkk8uTLsscTbqxHPk2
         j9JylMEss3Rt5sBuFp239+jx/jF+lGmcpeWLD51LeJelGDFwtZKcJgs/1LCbXqOhBnFe
         D375aQDMPohAEZcexd1pXkNndze70w8o4yJC3zcbaaqpeAVY4eVZqNI196aNb1W6xIaw
         rtDehXgDrB+eubkLZwHKmt6SZluqQkiOoYZ7r93FD4G0iVfNdr70yEvdc/z6JArq3L5Q
         Bg4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVg0zgHTeugChcVNCEn2gZKFgC9id7Oef38GuzOCkaskD+lZLAfWLVpmJpZZDFoBIlgHpQcwKotUDa@alsa-project.org
X-Gm-Message-State: AOJu0YyLSIvidhsHs6twXfglBAUVwmpFxSa34y1SklXs7C3Vr+JhWP53
	KObgq+GnVWl0yvRiGZ9t87x07c+xYFcjX/aLveVnqq0AIiN+WtivcCHkOyMgUcv8v/KFRkXQ1bR
	U
X-Google-Smtp-Source: 
 AGHT+IF1Rnp0BlEo/3O3FvtMVAQD9zYxpmEVsCSjem+AnuxVcV5GOUWE75yL3i/75iLee6d74WlhdA==
X-Received: by 2002:a05:600c:4f4e:b0:426:5e8e:aa48 with SMTP id
 5b1f17b1804b1-42c9a36ce9bmr25508875e9.22.1725545624078;
        Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:02 +0200
Subject: [PATCH 11/13] ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-11-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1uqZdGxPQGBnP8j4g6VlFe4rJuLJoGF/D9uni1/dnBU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byHCX1aj4AmJj1Q1JWPzGMx85ey7eOOxJr+R
 rAU5MJYHhGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hwAKCRDm/A8cN/La
 he0WD/9ZWAdHLFmtFB3mqYO/QGvuN52rpe1DwhCaM2ZCwcGDXqJ2yN32wMIZlvW2Ws2qBR7xuJq
 mZ6HjgYXOG0wJIW3Pe9fiUdRSxdJM7ILbnodGi7Mpb1b8f9TITFHjR9OCxaskxFs6MlMTsovZco
 TyhNEo7x4TbKgjNxELQKMqvTW4A7XA/Uz05XKJ1Ys0tZ/AsiJccuDCmv0Igy5VezRVRubCOjzwz
 A+2bUFPbOtq0OPrKr8Z2tfZkjKdR0RDuNcEV0SGtwWIijxxhlEy+eidNFq1tzVQbTTcPzNHObnu
 /iU5f7f3tExu0ipT1WcGmJrb6WePR8T5r/iQul8HGDekZnPnXDFutlqNZZsX5EYdOajvF4klddC
 mP7PzOAG0QHyZkgwOU7JwrwetBknkEeeA+KFAMKU/30+Q6bWsIXE9UDjBR9ZvxgWts8ey+nP8/o
 Z8LKus8tsEv23crdsPdSGzxJNQuC0x2SqBhoqk9e+Lk2qECPJorgQHhIANw6BMd0Mp43ugYA7J8
 zqWrr6BzE3JtJKGjfH+Lyad+DpAmzLHAjEsoE9nvV8ZP9qdQq473Tbn1ePNgDQjkEdndiv5N2HA
 bUJdAvFHiQqTxVq/x7icSTe7dOwERMEm0XEF05xTExrKh1d8lbdlaIqbjp2sZbXHoI7Sy4/dOtC
 FIFFrECzeVOEwHg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: JDFFIESX7I2OXQMI35O5HZ6ZM3RKRTR4
X-Message-ID-Hash: JDFFIESX7I2OXQMI35O5HZ6ZM3RKRTR4
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDFFIESX7I2OXQMI35O5HZ6ZM3RKRTR4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint lists was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/sunxi/sun4i-codec.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index a2618ed650b0..25af47b63bdd 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -577,28 +577,12 @@ static int sun4i_codec_hw_params(struct snd_pcm_substream *substream,
 					     hwrate);
 }
 
-
-static unsigned int sun4i_codec_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000,
-	44100, 48000, 96000, 192000
-};
-
-
-static struct snd_pcm_hw_constraint_list sun4i_codec_constraints = {
-	.count  = ARRAY_SIZE(sun4i_codec_src_rates),
-	.list   = sun4i_codec_src_rates,
-};
-
-
 static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &sun4i_codec_constraints);
-
 	/*
 	 * Stop issuing DRQ when we have room for less than 16 samples
 	 * in our TX FIFO
@@ -626,6 +610,13 @@ static const struct snd_soc_dai_ops sun4i_codec_dai_ops = {
 	.prepare	= sun4i_codec_prepare,
 };
 
+#define SUN4I_CODEC_RATES (			\
+		SNDRV_PCM_RATE_8000_48000 |	\
+		SNDRV_PCM_RATE_12000 |		\
+		SNDRV_PCM_RATE_24000 |		\
+		SNDRV_PCM_RATE_96000 |		\
+		SNDRV_PCM_RATE_192000)
+
 static struct snd_soc_dai_driver sun4i_codec_dai = {
 	.name	= "Codec",
 	.ops	= &sun4i_codec_dai_ops,
@@ -635,7 +626,7 @@ static struct snd_soc_dai_driver sun4i_codec_dai = {
 		.channels_max	= 2,
 		.rate_min	= 8000,
 		.rate_max	= 192000,
-		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rates		= SUN4I_CODEC_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.sig_bits	= 24,
@@ -646,7 +637,7 @@ static struct snd_soc_dai_driver sun4i_codec_dai = {
 		.channels_max	= 2,
 		.rate_min	= 8000,
 		.rate_max	= 48000,
-		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rates		= SUN4I_CODEC_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.sig_bits	= 24,
@@ -1233,7 +1224,6 @@ static const struct snd_soc_component_driver sun4i_codec_component = {
 #endif
 };
 
-#define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
 #define SUN4I_CODEC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S32_LE)
 

-- 
2.45.2

