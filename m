Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68696DB59
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:14:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1318950;
	Thu,  5 Sep 2024 16:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1318950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545664;
	bh=nbyk2pbjAgexYBySRE6v5MF/PkMeyNKLqiWP8pzL27U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vR4Cm1LqCpYZ1nL1oiDzsTRBFge1W1iK7AsDL04/pSibnJBVWJWIxZ8TPCmYpy3u4
	 W0uS39J1cUlDD4RG5m+XOaw0MVfxwEM9bKPIDWNFlRWmk6tD/w1sLxU8/tVQBFTIq/
	 JV3lf7MGLQinDPVUd1MF3o9me4alQHhk+5kpNg3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3700F805E9; Thu,  5 Sep 2024 16:13:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 860F8F805E3;
	Thu,  5 Sep 2024 16:13:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4938F8016C; Thu,  5 Sep 2024 16:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EF5BF80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EF5BF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=V+wfpKSv
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec13so6855165e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545612;
 x=1726150412; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTW4BPjVBNC1txaO1Qybt7JrbkszqBjqcNmLmY+bYcs=;
        b=V+wfpKSveYA4q9sZGp+Cssz3DrFDWo6uVF1UnGMkKWT80PdCxmnNnJg2nSVaFGSt/m
         cUH0q9xQeQbJdfcuxVtYsuA8cLnV9VItwvQ6auUEuMRDyAn1VVgkZ4kAFK2pyoCfDkCd
         rNy1gx3Dtz3cT2mhfNDxKV1RwmiRJ5dfrl4U75X4gjxZ3Oc9HHGbI5W9gZerEYPRfiSz
         XgB2hp1qyXB+nWfmO0p1zQJhOtdvbHxhn4u3nrwX7whuE1QT0h+7aaS2clmQ9cxMwdIa
         KJKIUDsY5SxYfzEsMxr0zu3Xv7lpxZoNY+kLErDb4qSLiBjv7g6hDd4OAFSPo3m+Nv0t
         6gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545612; x=1726150412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTW4BPjVBNC1txaO1Qybt7JrbkszqBjqcNmLmY+bYcs=;
        b=HH7KI8GDtXcEuYamw6XGD8/0zh85SW3Q+cogF/53Edi/99xSSlsqEUYHz45OFjlHNc
         vQ0UuI+cbPvPIfiN84WmuGoBCj07xN2DEaYeu3p42Y1my6V6QAZrM2Mf4wxqlw8JDmwz
         JR23sWWz2sdLULL8JFdjOfM6Fwc5M3T8uHJVKbWSYcny0sAlfiTWZXPStJ01b/99epMZ
         VStDhpP99t7bH9kxdfCxQk68UVGDmsYyBbecPwAOHfirLuZzMqtdk+9yL+/Fz+DE/MDS
         9N2KAPBvZ/iwD+SHTMKQlYZc1M7zYsHF/GFwH6Cf+m0yMWQzw+Ur7x/eNUGskd+yRj0f
         Dv1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpr+DK1XS6Ko0ee5nKfZ3OkZjR9SVqi8PhpoHMBTEQELxZ5K9x804zakAElBcCQwe1e7Zl6e30qEGq@alsa-project.org
X-Gm-Message-State: AOJu0YwpzMmBTqmrsPKy+AFIHUk0+L7NLN3wgeJq4milTWQs5Hp89C0Z
	CXa/l30R0L04RziOi056ASkPdrY61UMx59s1OShsXuz2N6AdL6BxC2Rl/osuymU=
X-Google-Smtp-Source: 
 AGHT+IHBWWTYTD/NiKOaA5SpW4N37gd2i4CApX3NZGiNIF1CauMco3Jpwv1V3JBttP1V61f4V94HEw==
X-Received: by 2002:adf:eace:0:b0:374:c324:eab5 with SMTP id
 ffacd0b85a97d-374c324eb64mr10087549f8f.41.1725545612335;
        Thu, 05 Sep 2024 07:13:32 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:52 +0200
Subject: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nbyk2pbjAgexYBySRE6v5MF/PkMeyNKLqiWP8pzL27U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx+0hxsyOB1G3jUIFP2N4UKQAgjgwcIS7zpN
 P2ju1g982qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fgAKCRDm/A8cN/La
 heV4D/wJBqYO/X+0ODfULGsb4Og1L+bWaai0VSP8TToyZzfpSkmUyd/wXZtNo/BLpdsdAYyNKM5
 K314rJcJfBbWXQT6XmgfRSjc/Kn7xKqFkrJzGUVtpiPlf82h6RW1M25nfekb1lMia6rvaBcRVcQ
 15eM1ckLvlIhWZpcEvTaBFWW/V5TUcy64mpJX574qJCKbR0U071AqMTsYgdTJnptPAZOTqhLVDc
 uKbGoXvfX9F4KWs+YH3d3kjzeDeizAkXrRhv5NHoLeOUvvamYZggmjqJCRWS5oiLPn5JKvkig/L
 YOCgPtBn4QW8gZKxhOmRqLA2GG24RRADpaEWRPfIUziaeZMYJi2u06HA+gtyzP6gdrwimkS2FN/
 ii3pA+MwjNoOrCKiHPzKFX1WpeoDruRDBkXtNfnubUsOQj9OI5lUdr0EQna1gUUiVKRKnTr7QDe
 DiZP64xgjmL/kT/YK6WrZ7BnJ3rpZSd1gOmn8vRYRjG88M3l1PdggL7LXUWSfXtYqxX1loVyR9M
 Q2ewA4GtbRX6qeWpf26VHv3j7tyVzLfDM2oaxTP1KOlHAp0V6r+4CIWKTst9cGt2ASHCbJgfdVw
 dA5qjMX3o7PP6ZwPnhwY/uNBmjUtZcX4ZseZNgdFDGYRUuKIb3qCaqAfVjMfRKuQB0XfOKo85A/
 x/qauD5RnK44B/g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: PJ5NRZXVXYDKF2BW73FSVEZJOKA5MTVJ
X-Message-ID-Hash: PJ5NRZXVXYDKF2BW73FSVEZJOKA5MTVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJ5NRZXVXYDKF2BW73FSVEZJOKA5MTVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds a sample rate definition for 12kHz, 24kHz and 128kHz.

Admittedly, just a few drivers are currently using these sample
rates but there is enough of a recurrence to justify adding a definition
for them and remove some custom rate constraint code while at it.

The new definitions are not added to the interval definitions, such as
SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
rates to drivers that may or may not support them. For sure the drivers
have not been tested for these new rates so it is better to leave them out
of interval definitions.

That being said, the added rates are multiples of well know rates families,
it is very likely that a lot of devices out there actually supports them.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/pcm.h     | 31 +++++++++++++++++--------------
 sound/core/pcm_native.c |  6 +++---
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 732121b934fd..c993350975a9 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -109,20 +109,23 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
 #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
 #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
-#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
-#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
-#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
-#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
-#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
-#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
-#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
-#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
-#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
-#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
-#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
+#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
+#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
+#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
+#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
+#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
+#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
+#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
+#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
+#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
+#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
+#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
+#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 44381514f695..7461a727615c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2418,13 +2418,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
 #error "Change this table"
 #endif
 
 static const unsigned int rates[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
+	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
+	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {

-- 
2.45.2

