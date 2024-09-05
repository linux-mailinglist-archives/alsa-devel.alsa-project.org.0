Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B996DB62
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CC0DE0F;
	Thu,  5 Sep 2024 16:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CC0DE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545717;
	bh=KOHw3cK09GmDelIdzy0PFMcoAWRfmYIV3CJePnQGlsA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1eTMwhvjxGL3KOYLIWlGdjDNHxbBeJSPvLgwZgSHG77vJ6N3ZJbjelalTAFJtY97
	 rO911mNCPsMK5fdQa1iJePBvIinPKI73ld3I5wLaDcayIAu6SDn1CdYy5OFFUNFQCz
	 gHuFOZAyDv/84ui8rLuuR4zRa5uPWPi2kuw8BrIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23D7DF80671; Thu,  5 Sep 2024 16:13:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7F32F80630;
	Thu,  5 Sep 2024 16:13:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACDCAF8016C; Thu,  5 Sep 2024 16:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04070F80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04070F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=rVnJ2o06
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374c1120a32so486038f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545616;
 x=1726150416; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h3IxLII25IyrhC+KVhfj3YGVmIHw6kd015YpmGIJ8c=;
        b=rVnJ2o06XxPjpIGFbNJ8ytFBPv4wZWCglPmimswo52VIa/1JxPR7M1d+Aad3nWYSiv
         TKuT/Plaw4N+aS+bXbWw6c8qf+XXuSH1behNoUV9FSGAwztJlC1dCzx+XEwD5bxT8jS5
         TE+eKwTASRpp7pCwbcyfhpCQLNny9it62F31tcaxkLvO/b0OG0X6akek7Jr/+4iDCqcr
         Urxh0nVvYjrdFHuAwgtrCRNDHE0gAjPcya9BkKnudPxxYuULKATZvSCF35d4Fd9ahjyS
         9QUMuI44PFo4aNuPYSKVZbT7AIihjqd1tIo2cUaR4Yc5hrLWYGTN6lOd+CTozNR+BgAC
         7GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545616; x=1726150416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h3IxLII25IyrhC+KVhfj3YGVmIHw6kd015YpmGIJ8c=;
        b=Yxj+1VsyIrzMoTk7KnIe5MdW7+6Iw3bNVpM4oawFarW+1hwVwkL8JHqZLS1Vow+/kK
         NPM9PA1aIUHZGiO3b1CqvcxzjQsNRrZZtEm4dN1eoe7Z9H9NGMmc1RiHUllzB0vyo9rR
         tY7tr9EK4j4brsc5/YHK/jQ9sEZnVMHeaLdWfC7x0hAFDJeU49h6k7f4/CnIyMFlo+CR
         hsd1FipexPCTxfE/AIM+9yihdgN4qw5jXTSc0qPrPv6Q5MsTrop2uOjEEjvJwtXzmIAx
         F/yGC7uSu/ekxXsHme1tt41AIH/Gmxpioukohw/IQ1Z5SIbhcxsxoBO4h9PJuAS1VeUF
         yLJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5fF8SmMJSM7WqxW4vyUIgOp4pDczACc4KSg7vNUdSP/jIMyZq3A6ZBXKbmuxpzwam0TeKdSENl4Z6@alsa-project.org
X-Gm-Message-State: AOJu0Ywu+9HHdbRRA1iHbIfrtM/EWNlL/bQDNyEYcWBSpAjfqtqMl9U0
	UvEsvOvlKWpx39UbBOd8GbYy/aiN/PgqUVT2l0gJ4X4gcDL8EWJn0ncsEv/+eYs=
X-Google-Smtp-Source: 
 AGHT+IEbUswTlTIXY9IFqrPyLxkDRDlQG32Uf8DYiNRcFcDxuqbhWX0zczTUJWneGpA3Bu0lLOXdbQ==
X-Received: by 2002:a5d:6783:0:b0:369:9358:4634 with SMTP id
 ffacd0b85a97d-374bcea7a66mr11693722f8f.19.1725545615753;
        Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:55 +0200
Subject: [PATCH 04/13] ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-4-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KOHw3cK09GmDelIdzy0PFMcoAWRfmYIV3CJePnQGlsA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byAGCtXNMv4zmeK8xaUD9ydPbkZKpBUTd6RJ
 QmFXFNp3uWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gAAKCRDm/A8cN/La
 hf1yD/4484C6jyc9McqeqL7Zucii06qG7GJ75NozKsnq8MPLDo2S3U55W/KesC1pT/XlYmui5O2
 WyYY+W88+0wV/3Gf+vCvsKfG+47ttqBGTLd6i3DriWETBgKOplOzy7khdZt4qQl2lq3QvlwQY2O
 fMR3FwzCuob0a5AOZY064ZlG+tdaJCjX7kN0tibF6v8V376AVcK4EG1m42WWkyr3mzoBUXnDE/S
 G3VCsaOynVmaj+A7RhefYy8/Jp5hk5a7NzccvkAdi+46WNv2yHTiQ+NhfBOyFmA4mQy32kk4QQU
 zsKwfVv37g2Vu0n32++cIo+WbjO1LU97hg/G8TxAfmhZHCoYPJsnCvtsl5Kye8lS1gzZNl8391E
 plrRXUEa3Rjr5eU6AUpm7MUjJY9wt2tlPO1nqhQL3boLXlIXSf2HYD3RIk/ou94L0ko+cVdTOQp
 Ve+Cd9BUZfApUzijH1AbFiW340rwalm0TjEGfFakod+mh2pUnN7Oj3IWsIT8tMUm5sG7noniinD
 SYXScq21wOtzJy6vEva0I7MtUT8lH0/Jd+rPRyPZTWn8GdbwM4VFxuJ2szOfhP5Low0NGD6kfmf
 UmizqtBtrmrhX+O5yCwyDWK7hheosHrjYGIDBHYhs/oDB5vK0EVwRxwTeYpaGWrbJIHVxsu0lC5
 yLro4DIal4JBB4Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: 7MZU7B2QDUE6NXGSZ2ELY22724RGRIJ5
X-Message-ID-Hash: 7MZU7B2QDUE6NXGSZ2ELY22724RGRIJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MZU7B2QDUE6NXGSZ2ELY22724RGRIJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint list was necessary to support 128kHz.
This rate is now available through SNDRV_PCM_RATE_128000.

Use it and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/rme9652/hdsp.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 713ca262a0e9..1c504a591948 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4301,14 +4301,6 @@ static const struct snd_pcm_hw_constraint_list hdsp_hw_constraints_period_sizes
 	.mask = 0
 };
 
-static const unsigned int hdsp_9632_sample_rates[] = { 32000, 44100, 48000, 64000, 88200, 96000, 128000, 176400, 192000 };
-
-static const struct snd_pcm_hw_constraint_list hdsp_hw_constraints_9632_sample_rates = {
-	.count = ARRAY_SIZE(hdsp_9632_sample_rates),
-	.list = hdsp_9632_sample_rates,
-	.mask = 0
-};
-
 static int snd_hdsp_hw_rule_in_channels(struct snd_pcm_hw_params *params,
 					struct snd_pcm_hw_rule *rule)
 {
@@ -4499,8 +4491,9 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_min = runtime->hw.rate_max = hdsp->system_sample_rate;
 	} else if (hdsp->io_type == H9632) {
 		runtime->hw.rate_max = 192000;
-		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
+		runtime->hw.rates |= (SNDRV_PCM_RATE_128000 |
+				      SNDRV_PCM_RATE_176400 |
+				      SNDRV_PCM_RATE_192000);
 	}
 	if (hdsp->io_type == H9632) {
 		runtime->hw.channels_min = hdsp->qs_out_channels;
@@ -4575,8 +4568,9 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 		runtime->hw.channels_min = hdsp->qs_in_channels;
 		runtime->hw.channels_max = hdsp->ss_in_channels;
 		runtime->hw.rate_max = 192000;
-		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
+		runtime->hw.rates |= (SNDRV_PCM_RATE_128000 |
+				      SNDRV_PCM_RATE_176400 |
+				      SNDRV_PCM_RATE_192000);
 	}
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_hdsp_hw_rule_in_channels, hdsp,

-- 
2.45.2

