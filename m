Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA396DB6C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8F486F;
	Thu,  5 Sep 2024 16:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8F486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545770;
	bh=/9PPWU/V3ndhMwxKTLQBCr4ABO0MKQnJNgh6SuoSWJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IghyjVFEm4Kdte2nlvVY1J3juODJWuU23Dav6AlrGjHirAHmgvcQF4DjaxU2TZ8to
	 pb4QlfN9/EATTtHY3htzXLUqv+HqM6o9sIWnH8FOt1Iu+mI7sjuJmFRTyrAkjk2CG4
	 vk3j7FkFAcxnrRfJy3bB5vCzYomR2t1w1nClMpDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76A3FF806C5; Thu,  5 Sep 2024 16:14:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB09F806BB;
	Thu,  5 Sep 2024 16:14:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27E36F805C8; Thu,  5 Sep 2024 16:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D418F805BA
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D418F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=w+zNSWgw
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42c7bc97423so8869005e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545619;
 x=1726150419; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Z+rj5y3R0mNy6TrxdjS8zRh7/rFaHDdfIRk7QJqw5Y=;
        b=w+zNSWgwsTuW6kZboztf0sZdw6lXo9lUu613vGhaPej0OPbz2TqnZceVmc+RcHg2cq
         PNwsLpjAhTVOmBsHxO+RdGQ2AngK7/g2kKQ7BE/hMCvGsO7J9u0Ks1letpBA3jhPzIAt
         pPXDIqgkHKPEw1V/7vYjFSV757oZuhCxEGt05Fch9P/iG61GmHfFOFQlfgsxd6SDp+oJ
         ruoXCrpnL4Nec3Ec3QdTFqBGi/+4jVldnak39X2SQA8e5809yCR6w0mDgbotcAkBggJ8
         F1ThT7Ylep+D3JAx3KAx2yTHtH01UDhItG70ThajC9nYhnVte6X6rfWi2IGD9Q9FLORJ
         2EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545619; x=1726150419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Z+rj5y3R0mNy6TrxdjS8zRh7/rFaHDdfIRk7QJqw5Y=;
        b=aGbxaAPf0Lo4TL8ojrAe5dDFB9WS2LqQSi1juwUJlU5S8z2YI2x5LYHAc4Pl/rOct2
         ZbXuV1IQdPfUuI9GR3EzGsFGaPXd7GumllgNw/WCBGm9TQ4rs2f7swZ43Dv1oPyImGEa
         LS6xqoGHeqDRwDHqEUHCxSLtoT4Yyb86tAAVdI8D4TRu4w8QXhg9gOtC5vQJQOhilI8M
         s+97wDPyEQEJlWk44iMG/UbYWAtWMSLDLazfpkuvWdKG+kvgKbAHIYig30NAN2IG1Ccn
         cPHb88ehk9vanR004pg/MBSRB9JHRpVd8I0K/CLSA38GC+kcioGIZTEWCeK/EjH8fxLg
         T28Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhREa4onD3iBfap1o9U2w0N8yI71L7IpzHqdvByS7fh4jZtSryfNYOAwFNMM58Rm//gQhZ64/UDH7Y@alsa-project.org
X-Gm-Message-State: AOJu0YwMPJmNV11/iyro2NV3AQm3JRelUY6fetR/wO0pUkvISsJCjN6I
	s5OyuJ68txvr9s0MIvpK63YWWx9Jb9733Rzj+62sOcLcAtLKVrjz0vKuL+Pb1a4=
X-Google-Smtp-Source: 
 AGHT+IFnCqbQW/W0tCcOFZOUTrgOvDDfD/BF7Qm+j3pcmxyp5nmWJMclM/a4f2XaIjQkMTPnmvJFyQ==
X-Received: by 2002:a05:600c:291:b0:426:5b44:2be7 with SMTP id
 5b1f17b1804b1-42c9e82bb6cmr1594685e9.10.1725545619306;
        Thu, 05 Sep 2024 07:13:39 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:58 +0200
Subject: [PATCH 07/13] ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-7-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/9PPWU/V3ndhMwxKTLQBCr4ABO0MKQnJNgh6SuoSWJA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byDjJ5MAQwKUXUi9Qx9lRk2zC2qtJAg3cVqb
 F68ud1AS6GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gwAKCRDm/A8cN/La
 hbs7D/9jkFwqwrmKgv0ZhPh3d28WC+JMl2LeePbM44C62MIMmX09vhcW2vLNov6JfPakVj22wyO
 8sScRFOllDrWOHNaBxlRiYfCl3X0/qiuzBDB9JOrCpl4ag5IT8bRf9zGVqZvJ35O+DvurKLz9c/
 zm05MLmKv1tlE3WTKoOTjB2GjDiFhEd68kCrkmBols9ApTtWxut7rV4yjIJk/+2gxaO1lc5iOCE
 xyKIumdiL7cAyQYLyQ5k5qi+1tPU7jf94tIDGTd8iiucGvZ+BhfVjcSsfBhoXEIDKuPIGxQdxvV
 yrGNlJIx4GYc5iYEXWWE02UY0JMkgCsVurF476/18TTh02FgffBqaLjlo8bC0C+efK4ipU36wZ5
 QQOJq7uLQuEQ7kC6NQ4I9D64jRE9+NA4R11zvlvDh0MXAntJfxDogIJDmFiJ3cQoVXCBIBoppdm
 J7DTxylEbgD5dlPXFgGUW3yCALXVgGoJwyg6afC81A96488Yd2bPDXZk3Saz9WiQ6Oz3E6V5WwE
 BKUjPqjy15Q3pVWSIc7YzFLJ4MeRww/EZUBLPCftmmUNT7PSTYhgRekdcPuUeEaeKiFzuh9iJzB
 /k9TzDFclI7URRUkSFQv04/lO6TfZjdfpD2HAJ3DqXYuR1ty+S9c2nVkBcbfrl/yTePFp8+xd6t
 pBlkHqVpOmWX1Gg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: KIJKW7F2W3SEVJAAXKXB4TKFC4QJEB4N
X-Message-ID-Hash: KIJKW7F2W3SEVJAAXKXB4TKFC4QJEB4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIJKW7F2W3SEVJAAXKXB4TKFC4QJEB4N/>
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
 sound/soc/codecs/cs35l41.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 1688c2c688f0..07a5cab35fe1 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -808,26 +808,6 @@ static int cs35l41_get_clk_config(int freq)
 	return -EINVAL;
 }
 
-static const unsigned int cs35l41_src_rates[] = {
-	8000, 12000, 11025, 16000, 22050, 24000, 32000,
-	44100, 48000, 88200, 96000, 176400, 192000
-};
-
-static const struct snd_pcm_hw_constraint_list cs35l41_constraints = {
-	.count = ARRAY_SIZE(cs35l41_src_rates),
-	.list = cs35l41_src_rates,
-};
-
-static int cs35l41_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	if (substream->runtime)
-		return snd_pcm_hw_constraint_list(substream->runtime, 0,
-						  SNDRV_PCM_HW_PARAM_RATE,
-						  &cs35l41_constraints);
-	return 0;
-}
-
 static int cs35l41_component_set_sysclk(struct snd_soc_component *component,
 					int clk_id, int source,
 					unsigned int freq, int dir)
@@ -974,13 +954,21 @@ static void cs35l41_component_remove(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_dai_ops cs35l41_ops = {
-	.startup = cs35l41_pcm_startup,
 	.set_fmt = cs35l41_set_dai_fmt,
 	.hw_params = cs35l41_pcm_hw_params,
 	.set_sysclk = cs35l41_dai_set_sysclk,
 	.set_channel_map = cs35l41_set_channel_map,
 };
 
+#define CS35L41_RATES (		    \
+	SNDRV_PCM_RATE_8000_48000 | \
+	SNDRV_PCM_RATE_12000 |	    \
+	SNDRV_PCM_RATE_24000 |	    \
+	SNDRV_PCM_RATE_88200 |	    \
+	SNDRV_PCM_RATE_96000 |	    \
+	SNDRV_PCM_RATE_176400 |	    \
+	SNDRV_PCM_RATE_192000)
+
 static struct snd_soc_dai_driver cs35l41_dai[] = {
 	{
 		.name = "cs35l41-pcm",
@@ -989,14 +977,14 @@ static struct snd_soc_dai_driver cs35l41_dai[] = {
 			.stream_name = "AMP Playback",
 			.channels_min = 1,
 			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L41_RATES,
 			.formats = CS35L41_RX_FORMATS,
 		},
 		.capture = {
 			.stream_name = "AMP Capture",
 			.channels_min = 1,
 			.channels_max = 4,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L41_RATES,
 			.formats = CS35L41_TX_FORMATS,
 		},
 		.ops = &cs35l41_ops,

-- 
2.45.2

