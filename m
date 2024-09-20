Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C007A97D8FC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2024 19:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8F082A;
	Fri, 20 Sep 2024 19:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8F082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726852966;
	bh=XuRTGQdHsl+o5fZjArZvReYmvRnEztE4lrWGf0F3hAA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pk3JIGWMS+pUX/ZfHw7ZY3GLcISxtzRi7FokZxP4DaQ1/OE8+Ra2q46OMsHJvjqb5
	 jgNC9BK65gTkwu0hi3W02WfD1SXSrT2LI+IV2XGR51vQZOmKSXqE8eY51TQHzjenfO
	 5hyUvoACUbBVooGuOYdZ/fA1LScOniQHD8gYJflE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83104F8059F; Fri, 20 Sep 2024 19:22:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 303BCF8058C;
	Fri, 20 Sep 2024 19:22:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C79BEF8020D; Fri, 20 Sep 2024 19:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7421F8010B
	for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2024 19:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7421F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Qwx+Uy5v
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so18534815e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Sep 2024 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726852927;
 x=1727457727; darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WyFAU3gZP69K4KqX0oXP5fhiwrGt91LVaFOF0C2rxA=;
        b=Qwx+Uy5vtqLeEQ5bBIkz96IEzg4NkUfXQEgSjODhvnEgBkfLxMJjYQrCkp51BmAhwF
         JIaNCXrdKfV/kjruiiOhwrocCQOdjJMjEjwiQ5RVmTpWv2Ownygwq6DEszO5JTpBqfnm
         JjUm031hkGQeCa/j61prvQouk/JOaMhYSLxNt+XNsHG8mtlDR7a4xlyD/KOQhpweoKY1
         mP3BowivmbfKF9U6LvV1rBYmjD+A5t+XK94/SloyqvLcaRRjWmubYGANH0VTlV24C5E7
         LwFbyEasbYjF0ufrPUhmx+QAA9pb6PTva49wY34ptqh6Lsvvhv0XTAItnCcOkeBHA/iI
         Lx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726852927; x=1727457727;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WyFAU3gZP69K4KqX0oXP5fhiwrGt91LVaFOF0C2rxA=;
        b=jel6oBcfaxR0mWYhA+x+H46ZNG1VGVCKYGH8uN6jPX96OcKje9KZ4EjLkUJrn3sEhf
         ifSCcgG7cEH6b7bWuwtAvLBMJxZ9QsnwQh1PWvXotrUobSELYRQABxe8FOkiz7CBYFO/
         s8wCN+BvkBnevASNjDsFPy9NNtgIH5YpsxvBXEkwv75jRXjX0Obw/AcjbUHusCmjzeDN
         BAkjx4iDIX0XBvtsEct86Um4BN8EV+ldGaavkxXN3SSAGQRiBp7FF1Ga9PppiDy77yBn
         rix+TclQjcGzw7wBnEmGARyAlJCUJv9gg7El4bUuXO5ztxaRU96acR9JFKQ7h6dKq340
         FExw==
X-Gm-Message-State: AOJu0YwV8m2or7VWpOemvnvyXT4lIJ+RJh35RMML7Y6iNOCN4uoT9WWJ
	lSeY3w1zDeRMXNVX3HSijQKOaz3Z6Tz83lMO0+wbi4EW+Yy5KnX28PVL5CaXUTA=
X-Google-Smtp-Source: 
 AGHT+IG7KNVfLQ90kEjbHLvaQHSRq9HiHZ+WNfDBFH1yjqQ1U84p9Dmob7LgtM7MyRrR7k9+SWYCNQ==
X-Received: by 2002:a5d:414f:0:b0:374:fa0a:773c with SMTP id
 ffacd0b85a97d-37a4235a6a8mr1830952f8f.47.1726852927493;
        Fri, 20 Sep 2024 10:22:07 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-378e72e4b60sm18110432f8f.24.2024.09.20.10.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 10:22:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 19:22:05 +0200
Subject: [PATCH] ASoC: meson: axg-iface: set continuous rates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240920-asoc-axg-iface-continuous-v1-1-6075d7db0e61@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADyv7WYC/x3MwQqDMAyA4VeRnA10XcG5VxkesphqLu1ophTEd
 7d4/A7/f4BJUTF4dwcU2dU0p4ZH3wGvlBZBnZvBOx/c6B2SZUaqC2okFuSc/pq2vBl+x8CR/DM
 MrwFa/ysStd7vz3SeF22zkTZrAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2591; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XuRTGQdHsl+o5fZjArZvReYmvRnEztE4lrWGf0F3hAA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7a89BkCMGZ9R9vS12+/O4OWsWm2IeNTlYXTjA
 OBEK50SSiCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2vPQAKCRDm/A8cN/La
 hUUKEACdGs9IkUiuT3NuUdcgARGZxXhvgtpDwX3qH9I4Bu6xiQy6gckFPpc3CudFn+265183SsF
 YCRsK6YHyVos8rAVXQiEEeqvibbaTBX74GR2QRTYGEyuRYxLsfQK2TfNQEgqOIn0271Bem+Dxjz
 cLZLovFr6w3xJVRal6Vqzv1WaIut/FooIAOhtU93WcqmOJFY9jtKh2LqWRFRKsLKfI5FxAMsdhd
 toV9l1uo5+I9Ie/heDKE2ZJTXf6HKUfAG04eKWLnQ2AGvcpZmbbZU34JiuRr3HKmbZg2Z7YT5Ta
 4nkDhfPJMggVClHZAAvLXFjQEOhdWkDB12anRG+v56jhW4f3gwWHS8DIswzn65BE2O/aT291a0s
 xwe10pn2FzvqoRkFbTUprKnfkZYR9iM3kwPik712VgkIvAOjQdggQ1YHRUrl3+3EoWI9pEJLjmG
 zW/HLr0ajk6V46YL0RWPKDfAdsO9RaN9B931SQ34uE60YB+ik28WhY076G5mMP0wwZDPPtvzcaQ
 3s1evkSxNC+Cz52yBMS/YlBJzBRWudPzFSq7rdSmRTMqLSHGXl9B77Q7RGc6c9gHxMGlwPsjREo
 n2jLti9zZFAmonNzSZCTRoMYbUQz+x/v6JMIVu+HSsJw/fCSq35gpBxKdQDiNzrP5TUE0jyePWm
 mm0bVeF1h6JYfew==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: AGM7DXYU63HAG6RYFWGKRDHMCVL5DEVY
X-Message-ID-Hash: AGM7DXYU63HAG6RYFWGKRDHMCVL5DEVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGM7DXYU63HAG6RYFWGKRDHMCVL5DEVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The axg TDM HW does not depend on a selected set of rates.
The hardware itself, just takes an input clock and work with it, regardless
of its rate. In this way, the rates TDM can take are continuous.

What might force the use of specific rate are the PLL available as clock
and/or the codecs facing the TDM HW. Either way, this constraint does not
belong in the TDM interface driver.

Allow any rate as far as TDM is concerned by setting
SNDRV_PCM_RATE_CONTINUOUS with an interval it has been tested with.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 12 +++++++++---
 sound/soc/meson/axg-tdm.h           |  2 --
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 62057c71f742..09103eef2a97 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -442,14 +442,18 @@ static const struct snd_soc_dai_driver axg_tdm_iface_dai_drv[] = {
 			.stream_name	= "Playback",
 			.channels_min	= 1,
 			.channels_max	= AXG_TDM_CHANNEL_MAX,
-			.rates		= AXG_TDM_RATES,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 768000,
 			.formats	= AXG_TDM_FORMATS,
 		},
 		.capture = {
 			.stream_name	= "Capture",
 			.channels_min	= 1,
 			.channels_max	= AXG_TDM_CHANNEL_MAX,
-			.rates		= AXG_TDM_RATES,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 768000,
 			.formats	= AXG_TDM_FORMATS,
 		},
 		.id = TDM_IFACE_PAD,
@@ -461,7 +465,9 @@ static const struct snd_soc_dai_driver axg_tdm_iface_dai_drv[] = {
 			.stream_name	= "Loopback",
 			.channels_min	= 1,
 			.channels_max	= AXG_TDM_CHANNEL_MAX,
-			.rates		= AXG_TDM_RATES,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 768000,
 			.formats	= AXG_TDM_FORMATS,
 		},
 		.id = TDM_IFACE_LOOPBACK,
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index 1a17f546ce6e..acfcd48f8a00 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -15,8 +15,6 @@
 
 #define AXG_TDM_NUM_LANES	4
 #define AXG_TDM_CHANNEL_MAX	128
-#define AXG_TDM_RATES		(SNDRV_PCM_RATE_5512 |		\
-				 SNDRV_PCM_RATE_8000_768000)
 #define AXG_TDM_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 				 SNDRV_PCM_FMTBIT_S16_LE |	\
 				 SNDRV_PCM_FMTBIT_S20_LE |	\

---
base-commit: cd87a98b53518e44cf3c1a7c1c07c869ce33bf83
change-id: 20240920-asoc-axg-iface-continuous-b94cfa234787

Best regards,
-- 
Jerome

