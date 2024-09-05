Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C551196DB5D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E36B6A;
	Thu,  5 Sep 2024 16:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E36B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545685;
	bh=vHEDI7Y2wONOCstSqdZiAYxiDnXUk239ce26xbMNwXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IIcdqiwqDzX3UKWuJP7iwaFGA4ccjzwzHT7b8dbgUf9v8FF15ovU2pWlR6JfDzNTU
	 s9frWhPJKs/Jn1dnZbNSThaSQACzitjfhCdG4wzGVaJGkYLN0a0/G751hb37KFJ9jM
	 H5ygz0P8eSjczdm1pYnZ/CZAL0egfk0wHjAVH1FA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9984DF805FE; Thu,  5 Sep 2024 16:13:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A6CF80600;
	Thu,  5 Sep 2024 16:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61BF2F80116; Thu,  5 Sep 2024 16:13:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C270F80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C270F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3MwvoWOr
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42c7a384b18so7218255e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545614;
 x=1726150414; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30qVKHGzVWd3Ku48k2FUb5pg6hyRShvxsMxjgIodA3o=;
        b=3MwvoWOr5f+00dHFqe9b+dli7tGM0yWwuTr7bOnmkFJgfNhiWN3QEmXDstaAC89t1I
         46m3awMmqV+eYu3QcucfUDn7sKsgDcYiMyVpFGaWtAxUi/jaJ2+mbTuU9y+20GwN78yX
         aSl3rYd0f7SYRPSpGPyU7j7Ij13kqwjmnhTNPwtNQ2Pp+sZK3a1XGbjB6QMkRggHikD2
         7CcKaydGn4FZV1+datem+lbdzfLvrsWuOrRr+4kt0HbvLqtaKekx1zEnW6uaIdI/1hKH
         NZ0RhJqQUtt5y5HDAa71mj7IT8YmuEiC1TrjTiAVIx9zKIBIjy4ZToUbfT7vtundSsFp
         pwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545614; x=1726150414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30qVKHGzVWd3Ku48k2FUb5pg6hyRShvxsMxjgIodA3o=;
        b=oqVGfwuJbTd0Ipn7JhfviZcK/2AuqTpkajYmMXGEgjopOQegTJpTikTbci+2PrrXWD
         0q38kDT0mzxZH5nFz5RAagPD27GVx0UufwX4e2H9sSDtpLgAeJ5itLuBNt5U3A+Ttvri
         LlirjFY0okYTo4KW4iseqc1P3uPu7Gf1JFgJZHyb6OOayD+7CyTPLcKnojn/C7qmguZT
         4VqyPEUcqbni1OvUF9qGkZzVKDGrUvNQy7BZQXas7gktdELYSUP8ZGLWd7/Tuacfi7wE
         ELnZQQN6Y/Npa4CWG+HgGe38SBuqcOOYT5zezkXixMXfXjyu5y7fhPx6wCeFZS6E4iQx
         2pMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEiFntJp16IL0M2hSCtjlKn++MFZ+djvBTz7EPaV324Px2uS+h6qSsXf6rtv7aT2dZ8x5atAHHF9mx@alsa-project.org
X-Gm-Message-State: AOJu0Yy/TUXc+YbNd35R9nQnNgevzelFGcmWVjlUuih7hXWhtd6eCogL
	CXRz+6ru/k6CqcoCsYxAn0eKOCebfMYv0JZAfGLiOJuJaDJqZtfC4ZCrubAur/s=
X-Google-Smtp-Source: 
 AGHT+IHIINA9ikiQAEU4EVqWqd096m95ELTkl7taBlSxkBiyU94e8ZbTjmpLrftCleoK5D80ZO2gcQ==
X-Received: by 2002:adf:db4b:0:b0:371:9149:dc54 with SMTP id
 ffacd0b85a97d-374bce97a6emr12068945f8f.3.1725545613483;
        Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:53 +0200
Subject: [PATCH 02/13] ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-2-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vHEDI7Y2wONOCstSqdZiAYxiDnXUk239ce26xbMNwXE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx+GwosY829uA79cwaR6MhJh5SrJ51PMsGpl
 bhPAAdHb9KJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fgAKCRDm/A8cN/La
 hQQ1EACX7oZZnRmZybF4ZVzlqM6krwmIFsFCSWMj8+fdpuUMLvds6lhBPbPqTlrzVjo6Axvntzi
 a0zUc7Sk7LBRV47wqdoqWKq0lP0ZLCWpTCZ7U+kY31Hq1PzMJVpXVE8qWlx/I0EOyXvvR8LwVC/
 Zr2CtgHmNwUHARlovbaLEPJ8q8quzX2hzcBi4tF3++zWTrDEHx6yoxLUAOPDkFufctmIXw4yoGI
 RlLaxlH/YA/wUntceJj4IHQhRkjllvEMGTGI5ZJrDna5pFd12UfXF36yOA77k8umwbZ8gkF0Df4
 dqs1Dt3X7Y3oT0AzChJNtNyk0HyRPNHf75Pt85UpwxbieNy2jCYgLABqZCDa9MoWZ4EzPIvtKYs
 ZO1BE6UcfxcLjHN92HOigMvm0ANZ0XUVQaM1NA1MFzkulMwzO9oF31CjFK231j3PKvFgxP/pgLd
 GqTh9JNwFLWEw7R2+ZZwoJK00+GXqIkR0JYM93RL/zpdbR3DZ/N50xJgl59kPrqkBEbqVW2vPxA
 6WwLE3cV8pMe5AkKxcucwDxVjyiExPtW4uNslSYYxx+tS06mVbMaCAG1eSvFouupZ2DAV0fkaJc
 KMAX1MuSgXX22BAkazYem6fH5Fy4XlkiFOXnkDmaJPOz2vpR8U+K5aX+UnguNsQqdAfyVRFKdXX
 /aT3qhPoNhM7mMA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: JMXZUIRBEWNH4LJYDBGBSEPEBJEY5CPE
X-Message-ID-Hash: JMXZUIRBEWNH4LJYDBGBSEPEBJEY5CPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMXZUIRBEWNH4LJYDBGBSEPEBJEY5CPE/>
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
 sound/pci/cmipci.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 36014501f7ed..e3cac73517d6 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1570,14 +1570,6 @@ static const struct snd_pcm_hardware snd_cmipci_capture_spdif =
 	.fifo_size =		0,
 };
 
-static const unsigned int rate_constraints[] = { 5512, 8000, 11025, 16000, 22050,
-			32000, 44100, 48000, 88200, 96000, 128000 };
-static const struct snd_pcm_hw_constraint_list hw_constraints_rates = {
-		.count = ARRAY_SIZE(rate_constraints),
-		.list = rate_constraints,
-		.mask = 0,
-};
-
 /*
  * check device open/close
  */
@@ -1649,11 +1641,9 @@ static int snd_cmipci_playback_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
-		if (err < 0)
-			return err;
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
+		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
+				     SNDRV_PCM_RATE_96000 |
+				     SNDRV_PCM_RATE_128000;
 		runtime->hw.rate_max = 128000;
 	}
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 0x10000);
@@ -1675,11 +1665,9 @@ static int snd_cmipci_capture_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_min = 41000;
 		runtime->hw.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
-		if (err < 0)
-			return err;
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
+		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
+				     SNDRV_PCM_RATE_96000 |
+				     SNDRV_PCM_RATE_128000;
 		runtime->hw.rate_max = 128000;
 	}
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 0x10000);
@@ -1715,11 +1703,9 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
-		if (err < 0)
-			return err;
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
+		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
+				     SNDRV_PCM_RATE_96000 |
+				     SNDRV_PCM_RATE_128000;
 		runtime->hw.rate_max = 128000;
 	}
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 0x10000);

-- 
2.45.2

