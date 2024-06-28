Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2291BE8A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:28:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A529233F;
	Fri, 28 Jun 2024 14:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A529233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719577701;
	bh=sciaPAJqEgX1NHQM4wEWy3GtvEwtZw9xH14CYUn5eV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DtPFUOhXbAbaJERelkbDV6Vs0PiTDek0ojqoWnIug0wEWpd44yFfKt5ytY43zjxas
	 p3Vbc8NJiTZ0OzNI+eWUkX/96Ga81301svFEEZg4qjVkOhFWjR/r2eQwnndpkBS/xg
	 4Z16MJgpyhxbXK5v1H6Wqi2262H9mjtULB6lLWaE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F552F805F1; Fri, 28 Jun 2024 14:27:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ACF1F805FC;
	Fri, 28 Jun 2024 14:27:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDC50F8016E; Fri, 28 Jun 2024 14:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 013E1F80495
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013E1F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=R7wHI85H
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-424acfff613so5818875e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577479;
 x=1720182279; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hW3lP4hCIw/t+/Lvw7tibKaBu1RE1UvWiqJ7tmwsGo=;
        b=R7wHI85HOULM2ih0QW3usNV4+DwrnIfg42shpN2D4j1fE67h+b0ZJnteekKpv52GP3
         O4LYcOnl+tHKNAF3nSYGzVH7MsbT17IJOF8Ervm84D66baiMkl/EzZkQSLW2AbWBUd0d
         NzlKD7lsgKueyou5OcxefNQ+xO1w1iULaghuNzYNbAtTMw9Ct42I9vDLEydVa5LbKgZK
         cjCp+vwu83YvD431tyUeDPGkCjAwqp57XwPEj3Gq/bmfn9ELHwiXY9UNvYD+YVokACVE
         e9g9BkWPBxHKA8VMO9mc9MlE1a849Y2wDyIZD6NM7Z9XBU0FYBllyoH5P8yEPVyUxUwI
         RvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577479; x=1720182279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hW3lP4hCIw/t+/Lvw7tibKaBu1RE1UvWiqJ7tmwsGo=;
        b=ca+wZztw+fsqgkas8SKyYe2HQCjXph4osZONUgDcjDeMv95sQMc78wyyDqs/zGaCS4
         /jCRo0XK0+Q2Gy1nb1l6HnXcTbpJenDV/4F3rRvKC/KG3r9pIrHzr3PZ7hPJ6R8Oy3hj
         JQMe+L7ggV9L71ajlAOVBm2Ql2svcXpeFBXj06gnNTjMlWEcabZZoUS2kfqfW6H57TBg
         Wp/pozbSrYWuIVwzD2CGMvhjtYKSGrgTuqb7wx/84FlJZte0KtYgdMbQI0FooNK0RynN
         VOfG/d8FKweEPNBlaND8WZLOzjnptbSUvsKOdCiKgETVnfeYYZPrOKMBvYRbEpFkXdOw
         weQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgpfkTLe87YrKHC9KIxOkOibUqUzdqrHyM2Gc2n0RkBA5uBUpU5Lw+a88DX27Rtxxj1Z6Nx+Nq698VmdQ8vYwvrsZTqgWqWhslDIk=
X-Gm-Message-State: AOJu0YzJTNJUNwxpwQKsLWZe0G4uKjWHDyOR5aNFmkRleQiek94WhqYy
	fqhc9hLjUvS7GnieNvyT+C89SbliXMtrh3qF+swNZp0l3KOWtIu0NVOs14chUD8=
X-Google-Smtp-Source: 
 AGHT+IFCBRrgEPYiJUK/9y0AlZTM7uvye/PRdCItIPgKpi1qBz5asnELoxu7K+MOu68SHYidDVADkg==
X-Received: by 2002:a05:6000:1bd1:b0:363:598:524f with SMTP id
 ffacd0b85a97d-366e94d6928mr13084226f8f.31.1719577479529;
        Fri, 28 Jun 2024 05:24:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: spdif: extend supported rates to 768kHz
Date: Fri, 28 Jun 2024 14:23:08 +0200
Message-ID: <20240628122429.2018059-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628122429.2018059-1-jbrunet@baylibre.com>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4T363LORIMLVRWDDGGANJNHJKLPD3UPO
X-Message-ID-Hash: 4T363LORIMLVRWDDGGANJNHJKLPD3UPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4T363LORIMLVRWDDGGANJNHJKLPD3UPO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

IEC958-3 defines sampling rate up to 768 kHz.
Such rates maybe used with high bandwidth IEC958 links, such as eARC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/spdif_receiver.c    | 3 ++-
 sound/soc/codecs/spdif_transmitter.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..310123d2bb5f 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -28,7 +28,8 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 	{ "Capture", NULL, "spdif-in" },
 };
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..db51a46e689d 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -21,7 +21,8 @@
 
 #define DRV_NAME "spdif-dit"
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \
-- 
2.43.0

