Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A4091BE45
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3358222AE;
	Fri, 28 Jun 2024 14:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3358222AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719576925;
	bh=FL0t0m2M/0DHO8Vt+eyL9AVi2FKenLJkknNMn/z5lcA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E3/OwfSb3z9s+/X7NAheW6irxd/nmEjcL4flAI3tQaJddHbAl9P8IpskBvtSYJocd
	 1uYWGuVY/fMuIUucZDg1Q+pkLJhVYq4927kBULL9ycl8QZMHu8S7yrmDISHTQpceRA
	 i7UwlGS+J46j5k3Lt5ZvKadEjxlv/dQBAp16ISnI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FBBEF804F2; Fri, 28 Jun 2024 14:14:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D896F805B1;
	Fri, 28 Jun 2024 14:14:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BD23F800E4; Fri, 28 Jun 2024 14:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D74B0F80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D74B0F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HcbQCy5T
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so3382995e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719576096;
 x=1720180896; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlz+Gu51Kc+D7SoDZ5PKnSpVHKmOE/JB0x93VS7SH9E=;
        b=HcbQCy5Tsf8+y/eCR2VLBR9ediVoNVYt0JtxYaAPaBA7eCUhbMM9veNuYvkYYZYhIY
         dufvYtm2pk3xxS7DcWXffLXNG/qeelANX/9UT3/iSCYfBJF4JIk20fpnYifnFTS0tgAR
         EiJjmhI9pvD3l8xuTm9gduwJ5RQNOBaKnfOYo2HxboKwOUenAD6X63SbN5lhJuYNzDgV
         9ZxJActHn0RNJQaNo/VHqweXVSgMetN4TnmwTim8ZRPHwp/awoThvFrDH4mNvu2p2KeR
         LD6fwYllKxO3T/tBr1s0WzBMB+tjbALPwk5dcL6NGblnyc2IgwsGuZl/YYIBT477+IO0
         tTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719576096; x=1720180896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlz+Gu51Kc+D7SoDZ5PKnSpVHKmOE/JB0x93VS7SH9E=;
        b=a2lyBveppR0v0bKRd8cZ2QQADx1hp667d3h0dKcG1Pp0RULuzNERqx+qKKVv3EI0Ya
         nm+bZMFp19MU6PnCxmaOlJnBNALxeUgHJ4MgLfeEtv2z1i8nCEiovev5InZo4LJ2VXay
         kxe2gWaW+04CQQFMHxuG/8CdB9uKyvg4TV/pslEaZDzrKPlh9CGFpLSwl1Thy1vg8raK
         zN5Ae5bhq5NTM16lecCXfcDWCRYbNtY1D7H/U7U0XLBtMYZg1uEly8+I3nsWNHFiNxKp
         3ErhLl6ESOyfPJIHhhhrDRFf7wS7GSLD1dWVNo9cvwpOqwRnLJNl6112g4my46lnwRYw
         lEtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCrBsARz2MmUFkYOzpGB/B8pS94FuBf8yiYecFWawjN2jBE7P8aQWK7vcbPbe1hn1hlevswiklL3QSlKH56ZqzfAHeF411pBnyWnw=
X-Gm-Message-State: AOJu0YzvFFByeb9pxzlRilPgssKqSuzMacnHldeGVG6/NhQPgMTTm5kc
	suyKW0gTdiq3wcs2fA8NPVKoL/AnYyuvtih0+4LupjlV08uYJCbilUjtA0OCMJM=
X-Google-Smtp-Source: 
 AGHT+IGnnpnq4/OM+D0bZdq7wWGW3f0id1NXDn5h8qDIyoueI0eYNYf+ncaN48k8u/4+DDzGPp7D9A==
X-Received: by 2002:a05:600c:1546:b0:422:fdb:efb3 with SMTP id
 5b1f17b1804b1-4256d5016d4mr11992955e9.12.1719576096141;
        Fri, 28 Jun 2024 05:01:36 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm2109771f8f.94.2024.06.28.05.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:01:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-utils: allow sample rate up to 768kHz for the dummy
 dai
Date: Fri, 28 Jun 2024 14:01:29 +0200
Message-ID: <20240628120130.2015665-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q5PKOS2DJUUOLTDAEUGVJ734E43REKPI
X-Message-ID-Hash: Q5PKOS2DJUUOLTDAEUGVJ734E43REKPI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5PKOS2DJUUOLTDAEUGVJ734E43REKPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The dummy DAI should allow any (reasonable) rates possible.
Make the rate continuous for dummy and set range from 5512Hz to 768kHz

The change is mostly cosmetic as dummy is skipped when setting
the hwparams.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-utils.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 11ba89c6b83c..303823dc45d7 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -144,7 +144,6 @@ static const struct snd_soc_component_driver dummy_codec = {
 	.endianness		= 1,
 };
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_384000
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
 			SNDRV_PCM_FMTBIT_U8 | \
 			SNDRV_PCM_FMTBIT_S16_LE | \
@@ -198,14 +197,18 @@ static struct snd_soc_dai_driver dummy_dai = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
 		.channels_max	= 384,
-		.rates		= STUB_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5512,
+		.rate_max	= 768000,
 		.formats	= STUB_FORMATS,
 	},
 	.capture = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
 		.channels_max	= 384,
-		.rates = STUB_RATES,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5512,
+		.rate_max	= 768000,
 		.formats = STUB_FORMATS,
 	 },
 	.ops = &dummy_dai_ops,
-- 
2.43.0

