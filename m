Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF091BE85
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F11122CD;
	Fri, 28 Jun 2024 14:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F11122CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719577683;
	bh=b27QyUJ5iOMLnb1ywUx1HGcm5LsMzNtf07lcBa/92Zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V0/1BybdjAiIGo2KOIU5+iMwm0LV8EudyDbFkHYV3TMpinLObP4wmoVpX/U1AVft5
	 5fIkMHY2Gs5kMo0WvG973NT/sBEQEvCADG0oNKEyYuqMSh+ISgVe0AGfgGWeU+MKhl
	 BavRrZ9AirIkPTkqVbycu9v8G7pnKiwfm/Ba9eDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC12BF805C8; Fri, 28 Jun 2024 14:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB662F805D8;
	Fri, 28 Jun 2024 14:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2509BF8049C; Fri, 28 Jun 2024 14:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7456DF8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7456DF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=R6Xivc7M
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-366de090da9so316512f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577477;
 x=1720182277; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnFOU1sbIqgovk5xhdHMfKNOv2vMSdFoRWRnoLUU7uY=;
        b=R6Xivc7MbM5sas63zGyYJq6ny9o1uuAPxJbZmHcejczSFRg30ktB6lqm389furFFXJ
         7BeIm2S8vonAHO/A5VxvImQE2p1qV2s1fjCFxnwv9H8fwtb9tu2wf82Y+HaOrBF2VEUu
         hxexvHZGXf/wooaSCjpcL+8AmW8ArlDVKPaAbaBb1iF9MlbiEba/rz2PbTN0LF0ifo2U
         uLDf05GOH1tvRjYDh40kKPdOy1PH9THcx1AzMvJ1y21pofyTc9HMYsBhYKO//tKWg4du
         1btFDRkiajM84R6iE6stZxmw2rX/rYPYQEIasYnCpzpbH9dT4McdcWvney+ikuPT/o2z
         Eqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577477; x=1720182277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnFOU1sbIqgovk5xhdHMfKNOv2vMSdFoRWRnoLUU7uY=;
        b=NDWUWkHr6bP4bLJRmLA+Y5vdNo3UmvUFJFFqmCPtEF8shMmKcbZ/J9LNEosGDcG7kV
         w3zd99X+Z+HPg8O/3vzXUWEUQY5SrT3VO910uz6bWVrwZZns4ghFOwjVmCL+9UQLyNsx
         kxsEf1XYfEye34roAJZ4+eouJ6fF8XNzhzpE9OZP78S3TBcoT8i+m3GDWNF8hgmjNKIn
         rYp0x0KblDMdx5pR/2XCccSrhsh98yRuigU8OX+IUsfO7eb2JMHzVR0cxec+xkJGqIIK
         lUt3H5ucKfwzluG0xYcbNhsvyuWxJko44lm+ZcSh8tmS9C8zVSHe8k//grVp9NpGkfq9
         c9zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuElyCwfb6+Z7NGMCA+F32PvSD+3KvI3kKd4jizAUlsnsHUckZHV++P2oohspIUmox5Z/MtyPiPxuBjqQ33AZbTF1IuZJeR5s6xXU=
X-Gm-Message-State: AOJu0YzZhYV058iU8GlXVKPPzPYHj1x4AT2ZpBRSQtxOibcd7aGAWCJd
	7iBBOy2xu7hHIKy8Oro0X3lqGyhh/71Mtt/AHwzJd+dKmv67GMQSV7DSyoWVsa8=
X-Google-Smtp-Source: 
 AGHT+IHcx4P02qa9MVJ93L8rnvMkCnp9jNt5pVErQKhpVoNe+nIx6+jrMgw0cTPvYrDqw0YMkFWn9A==
X-Received: by 2002:adf:e682:0:b0:367:5280:a40a with SMTP id
 ffacd0b85a97d-3675280a593mr2487589f8f.42.1719577477194;
        Fri, 28 Jun 2024 05:24:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
Date: Fri, 28 Jun 2024 14:23:06 +0200
Message-ID: <20240628122429.2018059-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628122429.2018059-1-jbrunet@baylibre.com>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4RNNOQOD7GDXBMF6SZ5ZUYGG2XRZXGFW
X-Message-ID-Hash: 4RNNOQOD7GDXBMF6SZ5ZUYGG2XRZXGFW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RNNOQOD7GDXBMF6SZ5ZUYGG2XRZXGFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The usual sample rate possible on an SPDIF link are
32k, 44.1k, 48k, 88.2k, 96k, 172.4k and 192k.

With higher bandwidth variant, such as eARC, and the introduction of 8
channels mode, the spdif frame rate may be multiplied by 4. This happens
when the interface use an IEC958_SUBFRAME format.

The spdif 8 channel mode rate list is:
128k, 176.4k, 192k, 352.8k, 384k, 705.4k and 768k.

All are already supported by ASLA expect for the 128kHz one.
Add support for it but do not insert it the SNDRV_PCM_RATE_8000_192000
macro. Doing so would silently add 128k support to a lot of HW which
probably do not support it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/pcm.h     | 13 +++++++------
 sound/core/pcm_native.c |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 3edd7a7346da..9cda92b34eda 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -116,12 +116,13 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
 #define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
 #define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
-#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
-#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
-#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
+#define SNDRV_PCM_RATE_128000		(1U<<11)	/* 128000Hz */
+#define SNDRV_PCM_RATE_176400		(1U<<12)	/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1U<<13)	/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1U<<14)	/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1U<<15)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<16)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<17)	/* 768000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 521ba56392a0..87eeb9b7f54a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2410,13 +2410,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 17
 #error "Change this table"
 #endif
 
 static const unsigned int rates[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
+	5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200,
+	96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.43.0

