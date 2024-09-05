Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5596DB69
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68FF9825;
	Thu,  5 Sep 2024 16:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68FF9825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545750;
	bh=JZU8jHCoVhWoac780UCorUbM0BqAjQdqy8oNh22CxhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mLdmMHvIkdoe5wonJZHVl9zQW3nk96kCCtWz2/Ar+zMRpiL/sOj4dZpXpv9SH6Tbi
	 RoQO4UDrm1IL8t6tJKthXM1PeaOpN9iRgSoVdUTFhLS5LLKfIvg3ukhhSFLoAUPf5t
	 ZqQ9yU7/QpWD1HO70xSEhGjNOP8w6ktI7rcOIjCI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 638BFF806AE; Thu,  5 Sep 2024 16:14:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91045F806A9;
	Thu,  5 Sep 2024 16:14:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14A87F805D8; Thu,  5 Sep 2024 16:13:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A5FBF8032D
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5FBF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Za67Ejjx
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42bbd16fca8so7759365e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545618;
 x=1726150418; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfaUW45B+7KlIF+mUGq7uC7AFp3mgjyj9XJFdT/ylM8=;
        b=Za67EjjxC0bwEP//8cEBqLu89wVo6FKCyqVLN9EooYkgZk6HZZhXV5LanIFZY5WjF7
         LQXesPXsBizdBU8dvlEopBFGy5Quv+yourl/F6wYTUhTFsrgHiMfbhkySsZvclXybrWV
         65fuf7dnyX1YXTjjdCoVorBi9NMp/ESXILb0TeT31wr+zswuBsxCZnedK+bIj1SARhJn
         Dmz/V6uyM7p1NwEjySi6d2QgqxR5rm2YyCyNohkAJeFPus+v7O4Rjc0F0zzmDGxu1Kau
         7BMPa5SS+SF6wFpm90OB7Iae7mBHV61La1WwehDPPb75FHVjGqy3nGEZGOTrY6dJrxqN
         xd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545618; x=1726150418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfaUW45B+7KlIF+mUGq7uC7AFp3mgjyj9XJFdT/ylM8=;
        b=V1akpLTKeLxaRn+T1UGMJ0/rCMVE06TM7y0f6c0SvBSW5uFVYC1yoHYNFZ+AyTv72Q
         ztlmrcD661Tb+8ZbJlhUoHzE4iVuUcTUHjzFAdUWnIjoMSBwLjyOguy+6tO3UCCYQWGN
         UawO6hO4Su1noGTw6py3D7+u/z/zxq8FL0QCjqX/RO+KWZm1bMg4zasIrnZzXG5Gc6Go
         pwc6YKQ/7dLocbgF9CePkoL+2TFECJ37zwZydhgFbaA7awBDj52PXPn3Ypa3JpkGbwTp
         qGXqYC1BleuqQSnbT1H7Lx9PTnb+Hf+fh/Tyw3DzLHWDq35dZ6TyQrOYXuYpWHOX0cKp
         Ephw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnmTOnCgRUH1Po3ABsx38oX0jdWEvxPelw94NtdmfW2MTq2ctgyjEitJsHOwoNNKmRVqJDATs6lof3@alsa-project.org
X-Gm-Message-State: AOJu0YzbdlbUG8sYfh3wTpJsfhfBLKBCD/2eQNRL9TgMUrNNJrMlcR7Y
	d/9/c1FKsirZwcyYwEkPrv5fc+AXJyuBJov6biPjOtRS+2IUgfgRi3L/9HS7s3Q=
X-Google-Smtp-Source: 
 AGHT+IGtEzlkmi1X9qAKFgSrVIwQmTXSMDlgcMdhQ2tpsl988QCRJs9wFHdgsZEawo3apfr7sYtKiA==
X-Received: by 2002:a05:600c:502b:b0:42b:a2fd:3e52 with SMTP id
 5b1f17b1804b1-42c880f40a3mr88769815e9.22.1725545618149;
        Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:57 +0200
Subject: [PATCH 06/13] ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-6-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JZU8jHCoVhWoac780UCorUbM0BqAjQdqy8oNh22CxhQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byC+AUfKGYETlq0b9gY/V2ov1G04CRqslpi1
 7kwAIe43VWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8ggAKCRDm/A8cN/La
 hTTBD/4lpKyPM5exBNshRD/UjVrzJvz8M+5ZOQUfD0ozwld2V9Qt3a0FUU3uYi79qgHSCf8xupo
 Q5ymJGLATRBZRBe/t5FLYyRwO3JxBd4haRCcoI2wwtpJ/dOeF7tBsORVGQMUTPhxXr5UdYlgjd8
 dP1xfVoS+3hKilEy78jfGtMXMCguR8ozxcuQaAz1NCfuw+NN8Llq1DRApOoZuf5GlyQZw1z7gE8
 PahoISJjrdhbgoPjPxf1VusTyA5hGqOnHxawFudFhXri4mUz520kU0Se0odb/Z8HpQKoD8JOKh5
 dYByJWYcvszzEfKQqaUnlmFwaXdD6pTnp5VIdE2dssdkJsJbv1HzX2LtJFUWwa9A10wOT13heKg
 FHY01BWTLFlg++fMYfd3D1+GeTb0ebIWqvMhzHPwgPIdCuVKSgi1yXfWulxQRhFZmCAiiA6+NZu
 OcQknXux/ONA/p6FGjLqI+wKedl40/9ZV7IKGGgAFjxlwhoR9iBtn9LEY3bPePFvs1ZGbiz+tTB
 //Saii6d+XdarIq3na3e6koDqu/Gm7oeypPmBGNfpbwfT8ouwQbukGynEuRRw6pGs1YLJ2NcNoh
 QCGdpsksvt8z4C6YnYAS8/PJi5YwEfdrDVUfJN5GhaZvunchvMtuf7YXYdUWcsCXr6mS0zog7E1
 9vcDEwbRdon5ERg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: E2NUIDD6DJ7WCVJQ2GALL5UE6G3FZKPK
X-Message-ID-Hash: E2NUIDD6DJ7WCVJQ2GALL5UE6G3FZKPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2NUIDD6DJ7WCVJQ2GALL5UE6G3FZKPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs35l36.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index cbea79bd8980..b49c6905e872 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -949,32 +949,22 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	return NULL;
 }
 
-static const unsigned int cs35l36_src_rates[] = {
-	8000, 12000, 11025, 16000, 22050, 24000, 32000,
-	44100, 48000, 88200, 96000, 176400, 192000, 384000
-};
-
-static const struct snd_pcm_hw_constraint_list cs35l36_constraints = {
-	.count  = ARRAY_SIZE(cs35l36_src_rates),
-	.list   = cs35l36_src_rates,
-};
-
-static int cs35l36_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &cs35l36_constraints);
-
-	return 0;
-}
-
 static const struct snd_soc_dai_ops cs35l36_ops = {
-	.startup = cs35l36_pcm_startup,
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
 };
 
+#define CS35L36_RATES (		    \
+	SNDRV_PCM_RATE_8000_48000 | \
+	SNDRV_PCM_RATE_12000 |	    \
+	SNDRV_PCM_RATE_24000 |	    \
+	SNDRV_PCM_RATE_88200 |	    \
+	SNDRV_PCM_RATE_96000 |	    \
+	SNDRV_PCM_RATE_176400 |	    \
+	SNDRV_PCM_RATE_192000 |	    \
+	SNDRV_PCM_RATE_384000)
+
 static struct snd_soc_dai_driver cs35l36_dai[] = {
 	{
 		.name = "cs35l36-pcm",
@@ -983,14 +973,14 @@ static struct snd_soc_dai_driver cs35l36_dai[] = {
 			.stream_name = "AMP Playback",
 			.channels_min = 1,
 			.channels_max = 8,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L36_RATES,
 			.formats = CS35L36_RX_FORMATS,
 		},
 		.capture = {
 			.stream_name = "AMP Capture",
 			.channels_min = 1,
 			.channels_max = 8,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L36_RATES,
 			.formats = CS35L36_TX_FORMATS,
 		},
 		.ops = &cs35l36_ops,

-- 
2.45.2

