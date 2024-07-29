Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F19429AD
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A89B62CFD;
	Wed, 31 Jul 2024 10:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A89B62CFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416035;
	bh=zZ1diTwdBFLWVY+JZ+0pKMWYvvFbvI82HD0Up/hucrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FxAiZzLu+ejcR0g+Qz9N4kwNrYeIxYqcnlL1KU2F88ySj2kgsPRi+ADUGVqPJR6Or
	 4UGri0LU8QGZspyclOPn4Xbneoc2+a5nhYyhuy7jnuceqxG8fhmeSoIlNV7fN34T6C
	 ZeMVOcfGDuuUvipgcRU/cDY9jpWidIl+UC+c+JbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACA0CF80897; Wed, 31 Jul 2024 10:50:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2891F8087D;
	Wed, 31 Jul 2024 10:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B2E4F80448; Mon, 29 Jul 2024 11:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F116F8026A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 11:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F116F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LOGYEvGa
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso394734866b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 02:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722245871; x=1722850671;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eJDPYXgy8QQkiw/Zb7wYEQMVUFtjlM4KzTipc5erj0=;
        b=LOGYEvGakfqIhaIRMePWBUjXNg75QrRrqVhjCTNYqZG4h+ckhjIhBIBKag22PRK6zx
         b9jLIoRl4QtKeOMTcSisjZkBsZlgvInjvymCYtdbpzlgNM/A6hXAl6Fo706Yd3gcy7Fz
         BF2pupXEyWXmB1uMfRhjncJmcxSryc6TkZPjXGeV7WquVpEFdBLs6/K+FZ0rbc3r+brk
         4ItMdDH78eXPXgi6y7+xZHK5atCjxc4m6RH3HQk4F/Z7KwEHwXyXD4HrORt1Qf6f1aqP
         C+glUHkhoeajKJtHuS/ZzBiNtezpd5Yu9/aC0wN1X2de0hhEUIZdTloL4fYgAYmHJvv2
         xKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722245871; x=1722850671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eJDPYXgy8QQkiw/Zb7wYEQMVUFtjlM4KzTipc5erj0=;
        b=ZRkbjw3OpFERiKfDy4gI562sJMXaF9Sp0J1h/BfX9mfQ8gOneJ/xSrJg8rb9TIqCR7
         7vsmw+utP32sXAXckWmXHQplINCTQ5dyPInhKDnG1j2YZXVaHQcDHlwpCvnDEdUbTRWf
         L4Yt+2aFjqbVow9gj8NcbcFj/lOj35LOOgWKWOXUr93rY/5siB/CqH9DxncplKj7euJf
         BhtCrD/033TFEtdZ15t38sI22NG6C2ojjGkN0lYycI7v69fAW+oDG0v4viJwy6gNsff2
         ZQrqQQvHRfwQwEAZXjOqCvbr6wre9GOflQ6THEb2tbufqOAjF4Z1zEKVXIW0dpj1P4RT
         E7+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURoRzFJirNdJbqK/gIqs+SE9vz53hWhcjLDAz0e0nSV3CIyavc4tZDj1K7TdLtkVJsqAVC8J+6/gL/Sn6K2SmlM12CQ3CQOSWjeHU=
X-Gm-Message-State: AOJu0YzRH4OwOZM1+9M7PvtJdbrDF853kY5xD54wyW1PJwVwehaKCcW7
	ckkfcaK7YqlZL32mEOuzlSFK0IamErSLUjEvB3mZ5tCaQ0RrIw2s
X-Google-Smtp-Source: 
 AGHT+IEBHnn7keFlJ0y5guCeEd5XYooTXx71rjnTo2kZAITFA6R1xQQb3gBfc6pw8Nx1ROztsH5/xw==
X-Received: by 2002:a17:906:d54a:b0:a7a:a763:8428 with SMTP id
 a640c23a62f3a-a7d3ffef7e0mr398513466b.25.1722245871127;
        Mon, 29 Jul 2024 02:37:51 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 02:37:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 11:37:38 +0200
Subject: [PATCH v2 2/2] ASoC: constify snd_soc_component_driver struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240729-const_snd_soc_component_driver-v2-2-1994f44f1ec2@gmail.com>
References: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
In-Reply-To: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=7340;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zZ1diTwdBFLWVY+JZ+0pKMWYvvFbvI82HD0Up/hucrg=;
 b=cRSDxdHyOHXmzLyYvLiNlix02j3ou428swU4/3/NqFC3bMG3c7oecUnUl5+vKxiblOPgDxGaB
 ny4oe+aTVW0Dn0OxNtzjiG8MAMO6P3tIKEmPT2ClAJheGb4Y3GQmsgL
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BTXERUWRMXDPUVK2JJZPOKVZ55ZBAMUS
X-Message-ID-Hash: BTXERUWRMXDPUVK2JJZPOKVZ55ZBAMUS
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTXERUWRMXDPUVK2JJZPOKVZ55ZBAMUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Declare `snd_soc_component_driver` as const to move it to a read-only
section for the drivers that do not modify the struct after its
declaration.

The affected drivers only pass this struct to
`devm_snd_soc_register_component()`, whose argument is const and
therefore does not modify the content of the struct.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index ea01d6490cec..3392693faeb9 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -311,7 +311,7 @@ static int au1xpsc_pcm_new(struct snd_soc_component *component,
 }
 
 /* au1xpsc audio platform */
-static struct snd_soc_component_driver au1xpsc_soc_component = {
+static const struct snd_soc_component_driver au1xpsc_soc_component = {
 	.name		= DRV_NAME,
 	.open		= au1xpsc_pcm_open,
 	.close		= au1xpsc_pcm_close,
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index d2fdebd8881b..c9c2b1e71d55 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -289,7 +289,7 @@ static int alchemy_pcm_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver alchemy_pcm_soc_component = {
+static const struct snd_soc_component_driver alchemy_pcm_soc_component = {
 	.name		= DRV_NAME,
 	.open		= alchemy_pcm_open,
 	.close		= alchemy_pcm_close,
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 2d1e241d8367..4cb2fe10bcdc 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -707,7 +707,7 @@ static int cygnus_dma_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver cygnus_soc_platform = {
+static const struct snd_soc_component_driver cygnus_soc_platform = {
 	.open		= cygnus_pcm_open,
 	.close		= cygnus_pcm_close,
 	.prepare	= cygnus_pcm_prepare,
diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 4f9dabd9d78a..04304a7ad915 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1649,7 +1649,7 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	return cpcap_audio_reset(component, false);
 }
 
-static struct snd_soc_component_driver soc_codec_dev_cpcap = {
+static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.probe			= cpcap_soc_probe,
 	.controls		= cpcap_snd_controls,
 	.num_controls		= ARRAY_SIZE(cpcap_snd_controls),
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 451a8fd8fac5..13443f569ddb 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -566,7 +566,7 @@ static int pcm186x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
+static const struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.set_bias_level		= pcm186x_set_bias_level,
 	.controls		= pcm1863_snd_controls,
 	.num_controls		= ARRAY_SIZE(pcm1863_snd_controls),
@@ -579,7 +579,7 @@ static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.endianness		= 1,
 };
 
-static struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
+static const struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
 	.set_bias_level		= pcm186x_set_bias_level,
 	.controls		= pcm1865_snd_controls,
 	.num_controls		= ARRAY_SIZE(pcm1865_snd_controls),
diff --git a/sound/soc/codecs/pcm5102a.c b/sound/soc/codecs/pcm5102a.c
index 3401a25341e6..9bca53de2475 100644
--- a/sound/soc/codecs/pcm5102a.c
+++ b/sound/soc/codecs/pcm5102a.c
@@ -24,7 +24,7 @@ static struct snd_soc_dai_driver pcm5102a_dai = {
 	},
 };
 
-static struct snd_soc_component_driver soc_component_dev_pcm5102a = {
+static const struct snd_soc_component_driver soc_component_dev_pcm5102a = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..7043aa9a206e 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -35,7 +35,7 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 			SNDRV_PCM_FMTBIT_S32_LE | \
 			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-static struct snd_soc_component_driver soc_codec_spdif_dir = {
+static const struct snd_soc_component_driver soc_codec_spdif_dir = {
 	.dapm_widgets		= dir_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(dir_widgets),
 	.dapm_routes		= dir_routes,
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..d997862767ec 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -35,7 +35,7 @@ static const struct snd_soc_dapm_route dit_routes[] = {
 	{ "spdif-out", NULL, "Playback" },
 };
 
-static struct snd_soc_component_driver soc_codec_spdif_dit = {
+static const struct snd_soc_component_driver soc_codec_spdif_dit = {
 	.dapm_widgets		= dit_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(dit_widgets),
 	.dapm_routes		= dit_routes,
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index bb0500e9d3ea..9be054837f68 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -364,7 +364,7 @@ static int tas6424_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_codec_dev_tas6424 = {
+static const struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.set_bias_level		= tas6424_set_bias_level,
 	.controls		= tas6424_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas6424_snd_controls),
diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index fb5dd9a68bea..b35c28b70265 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -309,7 +309,7 @@ static void stm32_adfsdm_cleanup(void *data)
 	iio_channel_release_all_cb(data);
 }
 
-static struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
+static const struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.open		= stm32_adfsdm_pcm_open,
 	.close		= stm32_adfsdm_pcm_close,
 	.hw_params	= stm32_adfsdm_pcm_hw_params,
diff --git a/sound/soc/uniphier/evea.c b/sound/soc/uniphier/evea.c
index d90b3e4b0104..a4cf14462374 100644
--- a/sound/soc/uniphier/evea.c
+++ b/sound/soc/uniphier/evea.c
@@ -384,7 +384,7 @@ static int evea_codec_resume(struct snd_soc_component *component)
 	return ret;
 }
 
-static struct snd_soc_component_driver soc_codec_evea = {
+static const struct snd_soc_component_driver soc_codec_evea = {
 	.probe			= evea_codec_probe,
 	.suspend		= evea_codec_suspend,
 	.resume			= evea_codec_resume,

-- 
2.43.0

