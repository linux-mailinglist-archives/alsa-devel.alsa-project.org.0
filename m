Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C391BEA7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263022345;
	Fri, 28 Jun 2024 14:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263022345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719578036;
	bh=sOvtDIcHqFb+rKIqyNMDLUrepY/Oa4wmuXrMcLcuz6U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T0KgbotK4h/MgfSScGeDZ4MZTA4aD7NLpGD99dfLaLuhwak4cVHchCOn98Tzq1gHY
	 pHNhmC8chL2Ycr2g4q6GkMyt8+5XGM7B23taYvK2vyAuvgLTBls4g5pGUtmD9ifZCP
	 pevEIOAh806e3XGCGMksoKajDJbBy4zeav+kgI2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 235B7F805B6; Fri, 28 Jun 2024 14:33:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 668CEF8049C;
	Fri, 28 Jun 2024 14:33:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24AF0F8016E; Fri, 28 Jun 2024 14:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83003F80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83003F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HjVB8n+1
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so5353461fa.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577993;
 x=1720182793; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByitVlXA6nhfpW6PjFdoGZsiVDUb87dQzsQq5KJFjRU=;
        b=HjVB8n+1b/aLZQb5uAS1FMLvoxJIOApq4wPWTfHoT9jETcX9Mdz3aD9p3xWk8NBNJR
         InYET8StgvKjn3YrJJ4/Ng1H0zWEh1nIl8FCAmtMeLrmcf2MHJzA8JfhGYgvOCJRbp6V
         Cr/NHQfAlDn5yILH7O8qg8JyFXOgTGD82PlQVbbAW8/PXbbNHmwr5cNxWWkNzRdA/wIr
         D34hN39R1JLVOo/ovUeP7soWmsDw8lNLZy/E0GhXZhiJO9zxdpWGdWktW+eSn3ITLd6L
         noq0UkICLfHay5IU+NzJbpU0dRM1a0tVhBHFkXpw6fHyTbMEcwWeZcnGsqdqsXiJ07np
         eROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577993; x=1720182793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByitVlXA6nhfpW6PjFdoGZsiVDUb87dQzsQq5KJFjRU=;
        b=qi5bv7gofLbVehJ2w1PwJHehxVVCQc4LoN74KxghdZz+cQ1yUW/uwrVMeVrL/DoffC
         pjXRZDU7H7pkyeSMpH9GKWuiKdOCLZsjafDdK85dN1rsBYpQE9d1Gi9Hx2JOkVknr005
         88vpuT7pIOXuU2JvSDWVuVCCMpbbcR6rYAMZ8pmZETBVio1qYnPLx+aXoxOmcXB4fM3G
         8fBv8fKzTwlh9jK4DEjyYUlYBpgagXVg0i4a8N82NcZaaIsvcGkdhUvBWZhBP4W6qyHO
         qrbOseh4o/q43yBVv1hghVRCAksolRG24g7yV7/CA7JotORhKVZEypeHi+JUB4uM9O0l
         MWOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOATB/mnY1kt8J59Y9rSqjdd+/MQN+Ps6Rq6GghhjRKrQP3M/Fp9zZO0wbHaJhEsgtSXSsO+ZtgZo6+rUe5aL2F2exF/DzML5YabY=
X-Gm-Message-State: AOJu0YxO6uZZRV1SK6BS/JrvGp8hIVC2w8SETaN6bYy/zUqwGUX1He00
	ZdYJ6fzA+PFOyfYaCKDh6nHOtkcKL6d58oCN3Uy47L33RcSAr3P3pcyRPAgL/uM=
X-Google-Smtp-Source: 
 AGHT+IHz/uNtBn4C3DHDM1aScnu28pMEPRreVGC8UWvz2fxy9dEUhXjjiQDtOaC24cz8ouavSZ1KUg==
X-Received: by 2002:a2e:720b:0:b0:2ec:4096:4bc6 with SMTP id
 38308e7fff4ca-2ec5b318000mr95955161fa.7.1719577992700;
        Fri, 28 Jun 2024 05:33:12 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4256af59732sm33916715e9.11.2024.06.28.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:33:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: tdm: add sample rate support up to 768kHz
Date: Fri, 28 Jun 2024 14:32:54 +0200
Message-ID: <20240628123256.2019224-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XL7J6IQ2KGDAB3NJBGN5JEWE7ENBLK46
X-Message-ID-Hash: XL7J6IQ2KGDAB3NJBGN5JEWE7ENBLK46
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XL7J6IQ2KGDAB3NJBGN5JEWE7ENBLK46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for 705.6kHz and 768kHz sample rates

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  | 2 +-
 sound/soc/meson/axg-frddr.c | 4 ++--
 sound/soc/meson/axg-tdm.h   | 2 +-
 sound/soc/meson/axg-toddr.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 59abe0b3c59f..7e6090af720b 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -32,7 +32,7 @@ static const struct snd_pcm_hardware axg_fifo_hw = {
 		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP),
 	.formats = AXG_FIFO_FORMATS,
 	.rate_min = 5512,
-	.rate_max = 384000,
+	.rate_max = 768000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
 	.period_bytes_min = AXG_FIFO_BURST,
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index e97d43ae7fd2..e70c8c34c7db 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -112,7 +112,7 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_frddr_ops,
@@ -189,7 +189,7 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_frddr_ops,
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index daaca10fec9e..1a17f546ce6e 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -16,7 +16,7 @@
 #define AXG_TDM_NUM_LANES	4
 #define AXG_TDM_CHANNEL_MAX	128
 #define AXG_TDM_RATES		(SNDRV_PCM_RATE_5512 |		\
-				 SNDRV_PCM_RATE_8000_384000)
+				 SNDRV_PCM_RATE_8000_768000)
 #define AXG_TDM_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 				 SNDRV_PCM_FMTBIT_S16_LE |	\
 				 SNDRV_PCM_FMTBIT_S20_LE |	\
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index e03a6e21c1c6..03512da4092b 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -131,7 +131,7 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_toddr_ops,
@@ -228,7 +228,7 @@ static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_toddr_ops,
-- 
2.43.0

