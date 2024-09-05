Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D9196DB6E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1D8DF6;
	Thu,  5 Sep 2024 16:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1D8DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545784;
	bh=drSScU2kqBTHjL0A8KzaYHR+/F7xoFGHMQYfWWJ7pnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pohHx86JQukjikkVrneIIvQoIJ0vMES1TZd9jiyUL8IXev6Ruex2nY2F8YkUY9u4D
	 m9QfdEKSecg7k+itfuXBicW6wxqwCMyjiChHKq2N7C8CGQlw7e7AV2WhSevO7cSZbB
	 5SM7MKH2+cDsrBbx6gZOeUNdbdjixOFJQvC3djIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B8F2F806DD; Thu,  5 Sep 2024 16:14:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA333F806E8;
	Thu,  5 Sep 2024 16:14:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 200B0F805ED; Thu,  5 Sep 2024 16:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8189F805E8
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8189F805E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JVwnC8pG
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42c828c8863so7070375e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545622;
 x=1726150422; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLGY2r4E5D5nEZeix2orNxNRil3E6loR/QGg/DpFo+A=;
        b=JVwnC8pGRNpSa9lDQYF+mC7d+fM05u9UjhYdkVO9SToNoaCWbUCjSVZtGUNdn0e2bL
         i8y47vfO9n/BBzdR0heHY5ZqPlZKWNRsYPFoim1uaVQ7pZOa8b7YJh8OJJViv8Z72hpG
         Z2xLb/te/2Yyck6FS7MZ9ZLCQKeDVP1EScj1WkoxVWa1hTszC7+dI/dZWSfe09VBq22p
         IvqI2Nt5a14kUP2ftLDsUcj7dDxK3gazPNiYbWeaO/xhfvWtkhYFT+WtBhXKkQkyL0uf
         0PP0RBHtgMrvJmMAFcoasam9TXkLMoGRpU/bT0EjI2l8L3r6oEmOVbph2SL9cizOIeVd
         BS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545622; x=1726150422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLGY2r4E5D5nEZeix2orNxNRil3E6loR/QGg/DpFo+A=;
        b=RuhUW4AFG4wYePb/HWf02iDFCdVYY3qfr6xC3EYvSarfXfawWSAxAp9bTZU3iSrYQU
         NDQ98050bhZXufVJ6j1VlfdekhiFQlKu4Q9xFzWXD3Yaj5PNtPYkK5rhiXDebUzKoLxu
         mwkYiwXzecb6B7PxfIufzy6hYKTZBvzzujfv64fEjZ4R0bPeLKaSGmqbQpcyDPV96ZCm
         fcI8GmNtJ8ykNlY40IO8jXRByv3i4c452oNsAIre35ocS1D8eypfXvRoOPJXix5W7XXh
         UZkBGL7QXX72UMxptn2FBNrJc9mqYs1AD4OwqCYvtX+VsqNMqTKTqDLnRdbF8itgXIq+
         jkRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Q0ToDqvh/9Kh+cElWgIrJU6ytldyiRwkOQLpyHaHRVWbcf6RNDPUbTUO/JiKuy8oVexPJVMb2pTt@alsa-project.org
X-Gm-Message-State: AOJu0YyA4WGC7MIB45vVafJKQZDCZBKIzL6/hoP1+88mXjSZcNGSeLEV
	xHEh4qLiaJGBO24l72q/C/T6Kh7kr9firisqWSPcr5JsxsuW9n5lorGcbHgjb0U=
X-Google-Smtp-Source: 
 AGHT+IEGRCC4e+BbZUypR7krz2a4gQq1qGWOiNgWFE+vKhBXsfkEaZmALu0yOYGqYwZOJmoKA993YQ==
X-Received: by 2002:a05:600c:3d92:b0:42b:afbb:171b with SMTP id
 5b1f17b1804b1-42be48fa9e7mr115228615e9.35.1725545621670;
        Thu, 05 Sep 2024 07:13:41 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:00 +0200
Subject: [PATCH 09/13] ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-9-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=drSScU2kqBTHjL0A8KzaYHR+/F7xoFGHMQYfWWJ7pnE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byF5Z7tNiZhe6e816749oi0zUTNuNg77PRA8
 jsKC/9KehyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hQAKCRDm/A8cN/La
 hbCND/9QmZRemz2Otghu3R9RnK3p2ChrnyTSdSBbVXRpvQu/8ZIqU4Co8aEGyMpZhAzh+ZuourF
 QXKy8b8BOGlBLpuvtssdH83C857coUohvv9CGY5KiaznFQNnFAFO8G9pLCGrmLnSktHRYT3E6UE
 RNKE9tQXZNDwele7SVDxFKC5H5cmBcOBo35DAhZUCC159eSbvPmJ2LRb1eHgVwEHA4+u+uaKH0B
 7FxNeK3JSYRbXU6Bic8nvp8GBMwYUvqahENbQG/vqG4FZqpHuXfVXwqcCJYfTLtVo6CgJhbb3KN
 xFgGKl5P9noIkOjIsK2TcWjCgQvCx2k05xiBjiwIHLQjVxuSSCULF0dp1uT8462NSn5Wlq/a72o
 WuVevmzC5mcpPSm7VVTmxDgBEsyoQfydLTw0p67qMvlBQGEBv0MKgEAp0GFgxu5dX4NmYQmvgi8
 Noo9s1SYgOHLvx38mjsM4MfZ8hQ2KUBiAhVIZwrxY3prg+t55nyv7hrbebTdEeXXacxmkb+0/HH
 UeGw9nMm8XZggMrqc4OkHYSVSL+X30tj2m8zbuyEkpVrOnM5jZqRku0n/p8muHSAaXrH3gXFW7Q
 K1e/20qPKuebTTG9S/YrlyLCQBL1VzQF4nQfwwFaXHlvwGUO5F5toZYfcCK451E5lTMSAxb1Csb
 oFNIoD886sMAeSA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: 4XMZX425APZ6SEOWXNO4TDFF7VR22MOO
X-Message-ID-Hash: 4XMZX425APZ6SEOWXNO4TDFF7VR22MOO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XMZX425APZ6SEOWXNO4TDFF7VR22MOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint list was necessary to support 12kHz, 24kHz and
128kHz. These rates are now available through SNDRV_PCM_RATE_12000,
SNDRV_PCM_RATE_24000 and SNDRV_PCM_RATE_128000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/intel/avs/pcm.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index c76b86254a8b..afc0fc74cf94 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -471,16 +471,6 @@ static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_h
 static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	static const unsigned int rates[] = {
-		8000, 11025, 12000, 16000,
-		22050, 24000, 32000, 44100,
-		48000, 64000, 88200, 96000,
-		128000, 176400, 192000,
-	};
-	static const struct snd_pcm_hw_constraint_list rate_list = {
-		.count = ARRAY_SIZE(rates),
-		.list = rates,
-	};
 	int ret;
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
@@ -492,10 +482,6 @@ static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &rate_list);
-	if (ret < 0)
-		return ret;
-
 	/* Adjust buffer and period size based on the audio format. */
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, hw_rule_param_size, NULL,
 			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -1332,7 +1318,9 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
-				  SNDRV_PCM_RATE_KNOT,
+				  SNDRV_PCM_RATE_12000 |
+				  SNDRV_PCM_RATE_24000 |
+				  SNDRV_PCM_RATE_128000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
@@ -1343,7 +1331,9 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
-				  SNDRV_PCM_RATE_KNOT,
+				  SNDRV_PCM_RATE_12000 |
+				  SNDRV_PCM_RATE_24000 |
+				  SNDRV_PCM_RATE_128000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |

-- 
2.45.2

