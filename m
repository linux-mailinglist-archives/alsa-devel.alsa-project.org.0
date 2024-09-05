Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47EA96DB67
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF94852;
	Thu,  5 Sep 2024 16:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF94852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545736;
	bh=Xv0vuHB6OmJEPDWj7YbALy0svxpRq+MGIQhgNIVXe28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XzQD/r+lAksX1YyD4vAU8deU0PV8xhkhGj5u1ECGr1UqJVOa7omgBpKHu1Ow12l1z
	 g1iqBKjRiR3GvC9kfjTFe9F3GrJU/94Xc8fydjxFKuGSDGB3Ge5dJKEoBIq2MJ4Z9X
	 L6GUq2GzcaQgEqcpKsfUBwfAX8Q0zgmB7VJHX6qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1C40F8068F; Thu,  5 Sep 2024 16:13:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9164BF80656;
	Thu,  5 Sep 2024 16:13:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F0CFF805D5; Thu,  5 Sep 2024 16:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11158F80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11158F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uG5W8w7v
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so6782675e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545617;
 x=1726150417; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcCu+DWFXbg2fAQ79jKiLK8pzJONU6/x+rmv87WbABM=;
        b=uG5W8w7vKdIdjsQkrku8XiXI9woIaLWvIFIsxmqV4mNSDiOeT/Bcqe2/Ga7Zbot22q
         usS4F/x2IUnV7Hp4znktGjl8rV9r4XM8fhOECT6W/QpKtamfV4WYVcHYF0NUUOTKqkqy
         Z6c0Y9XQafvo6McFsoX8K0xm4Bg0FMh0dPYGQFlFiBP0HQlkLrHCuyYObBdwvDIeKnQK
         qmnaWxCoa10xrl3tFaaVpbe4AbWCKjqPa4TXIor3SdUtccjJVSsnGTaRx1El3AXgkmgx
         WdRjFOVyEySFn42UMh8/bf6w/cDwJF/DMBe8uFK90mHLUtvRli7HjvRQGTP76AbNp90k
         g6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545617; x=1726150417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcCu+DWFXbg2fAQ79jKiLK8pzJONU6/x+rmv87WbABM=;
        b=F9k40Xtsc8vlObnmkIsksmF51t/uAapLyquqD2n1GCP+3cmXuxE1y2IlogLtootFge
         BWIqc1HBNQiNNHGFO+Dw8scyL66/aayNgQlM5Kdt3yiZc8FbymTiJVXhx9dXL1YIzzl3
         1QxSzkSLpgMd9JNsjPaT9U7CNTprgJBPSEvaqAcC5YxhZXGhZUfpGsUjIgHGL+CC0G3b
         vJL8/r9DOCubRMRf7yc/LmxUwMF9854jbCUxia1rkkBnsxgAYIXfleiwgwalUInTXdco
         7pN/2D0n05e6CYKceECH4gbOreu8stXPho6QGV/Q5vmB+K3Np+i+IyEHqEq8ZZuNA7rk
         y3kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1nkFClYIY+lpUNMqNqm5KRATzOdrmGvV5Jr7p5fYMQF0+w/Mq5wAeA5HmIbk3uSaGUDqG+J7dplYQ@alsa-project.org
X-Gm-Message-State: AOJu0Yw51k5iM8REzvBFIl49fcIYJxVfdRhe4foPpzTtccNeaV2zPM4v
	VCWjT5MBpxkbOVXt7l5D9WoTzGKwvrKBEqEmTNZYMV9l/NBCNvkOH+riFyo3z5I=
X-Google-Smtp-Source: 
 AGHT+IFIEHR55riZlgeQGJQjXuyOXmmTN+5SiNQQq3UpC9AB9eRnK6WUg+y3HQedvVtwF3WTVV2akQ==
X-Received: by 2002:adf:fa4c:0:b0:374:bb1b:d8a1 with SMTP id
 ffacd0b85a97d-374bb1bd9c6mr11130169f8f.13.1725545616938;
        Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:56 +0200
Subject: [PATCH 05/13] ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-5-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xv0vuHB6OmJEPDWj7YbALy0svxpRq+MGIQhgNIVXe28=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byBQJXpw0tKm9S1aoNQuw0gFMk22/TxwdNAJ
 DQo1OePFpeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gQAKCRDm/A8cN/La
 hb6CD/44tlADSXvh8LtznvSCnCRWDjibNp3ZPrngVla5rHZENvj/3bhJd4z2yqP+n5D9sGXGqDG
 4xNTMjbtLBxWXfJQTNFD1EkV6IIjuGJvW0i5NwXFyIS34ysoOE0hI9Q8FqVDCddEonzuY7wcjy5
 RnJBiUvZoKOO9WcpWEP3gm0VGniXudhEWa0SBL7G3ojs3j7TOXDF1Mceym7wTQKYJGZlZDCUohC
 H91vxd6zdshPH/qzyMI9jqGpjwkqY2lpHww/KZ9tQqPpy2VS2MXPgl4llQyPpIxxvbcQj56iZcR
 CsjdRZRWF4PE/aTCl1T8mbSUU/XmInE7C+yqydfXqxp0jd0vFsy8ZojjGp6JDfs6NgGn16EYbS6
 ViY4U2XOqdcXgXkg8ttNgs6JaEhjx1XrkRddp7NYnj11EVJIwwo/zODYBuBCYZJNSctuqG3MvJG
 IxM9AEefJBxIgyfUskHexjjJBa6NJhU/6ux0FNEN/ukrTRbxmCOFacv1jZ+uqo2BL71xYSl8GNq
 oAny7kUhtzHYyMG7I8Ifp0TH9qEtXeY5QApAGE+oIPYKpe8btMam/nMJCyBhUY7PotLSrYd97T2
 yQ+H8YXAew9HF16sTUciTp1/QB5QSU3YEVOEMQOpwc/MS7pQvwWhwZQonuGU/QQHJOQwvSsMelf
 DIHwWZKP7oiAz4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: UI6AERIAKBU5BJ26CTKHS4U2ABQQVGIP
X-Message-ID-Hash: UI6AERIAKBU5BJ26CTKHS4U2ABQQVGIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UI6AERIAKBU5BJ26CTKHS4U2ABQQVGIP/>
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
 sound/pci/rme9652/hdspm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index c3f930a8f78d..dad974378e00 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6032,18 +6032,6 @@ static int snd_hdspm_hw_rule_out_channels(struct snd_pcm_hw_params *params,
 	return snd_interval_list(c, 3, list, 0);
 }
 
-
-static const unsigned int hdspm_aes32_sample_rates[] = {
-	32000, 44100, 48000, 64000, 88200, 96000, 128000, 176400, 192000
-};
-
-static const struct snd_pcm_hw_constraint_list
-hdspm_hw_constraints_aes32_sample_rates = {
-	.count = ARRAY_SIZE(hdspm_aes32_sample_rates),
-	.list = hdspm_aes32_sample_rates,
-	.mask = 0
-};
-
 static int snd_hdspm_open(struct snd_pcm_substream *substream)
 {
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
@@ -6096,9 +6084,7 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 	}
 
 	if (AES32 == hdspm->io_type) {
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				&hdspm_hw_constraints_aes32_sample_rates);
+		runtime->hw.rates |= SNDRV_PCM_RATE_128000;
 	} else {
 		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				(playback ?

-- 
2.45.2

