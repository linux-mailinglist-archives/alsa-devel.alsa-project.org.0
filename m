Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9C861AA5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600EADEC;
	Fri, 23 Feb 2024 18:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600EADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710776;
	bh=D6ZViuQxxu5LLhWeN+tNr7Qy788hI6Q6B6sgjHGd1ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rE4QjyQBIWbB6nmJ9oXOEpNag3dGY8E84mpTedGT9grkB7V9CHCLVVnUzJcVM/Khh
	 nZiFHQSGU+3xr4TLGp9JK/Kmsk8FB6caHxGYkCewogycdfHrtZjN1YWP+5+fEjAjKs
	 B03IOG0ML2zj9OlO48Wq6OjLJ2bJdUZxCv0hdVTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA0CF80613; Fri, 23 Feb 2024 18:51:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D12E7F80603;
	Fri, 23 Feb 2024 18:51:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9FA6F80567; Fri, 23 Feb 2024 18:51:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8384F80567
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8384F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=P/e1CXu3
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33d6f26ff33so410217f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710686;
 x=1709315486; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvElMeb2g6xpqhFWcI8ix09RRMkAlSO99O6608hvkMQ=;
        b=P/e1CXu3ZTRRRT8GETwyGhL83DLyS/pw1NrAhI58co/WCalNbEB+hY0wgnjG0Ya6zH
         oeQbqRX3e3I6LXW1zxzeIw77ZgkEHHQBX0QcACiUc+wnFkQNzIj+KnN3x1c5oe8iQbJb
         NbIgNoi5vLraaFrVjOGQAIwk5Kmi5+o+rSokCjBR4SxRQDuAVQujxnF7pLzwgwKIEEJb
         B0oJhRKpv6MxFsUZD6eIuW0YI7teslRyQ0fYwX88kVwX7myHii5vANJTcCFB2q/6IVU4
         oQSAEZs00nLXX+9hbRvI9gIIQtruzUMLp7ltpvrpcngn9gWaFHuN7Q+qM5Z3lbw51vzw
         Hv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710686; x=1709315486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvElMeb2g6xpqhFWcI8ix09RRMkAlSO99O6608hvkMQ=;
        b=n4FpVn7gKzNEaMXp+RxkR3EX1Y8TbgmM78CbgTcmV+8gT5AiDmrj3rlqMhNHbXDwE5
         Msc9lswEV+VvzsdCVqgMQABZHYh7NdN+1T/CYfZkLAE2Qpq6XB0cyBxGQwmJRtAbVKpa
         6YH3ZeEkTDE6jsfpwCfnvF4xJ10mDljicDmkdgUpeQ8J01P/IkEbjGtXgXwcH5q6RUVE
         Y4uYCGoGdHb/HYf1FhzdRFOcinTnb7il8D1YlwV3K5/2JDedPsdccpJhMbTyw4ChqOUb
         4HrUjYkPUHu4H8BdcbAaxbSQ+j75Wc/BdzGZWFRvaqCLnRU8YQkHVv4f0hkS0SW0a8IT
         xuxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVureelRHHi2atzvsZw9sRfcEx8UNMbTniV8KYkSeg8VH5vYATZwD1/0wu2mV5OKwpqYDaRkbfyjpVps3buujw3U+trHlTKZqybztI=
X-Gm-Message-State: AOJu0YwW/U4xYB/lTrwKYmSX9ZEyi3LsDD3JOTE/dqb236VNNIfHqHsk
	BG07vpcK6UsQuJXcvFmTmu00zF4N7vtMtd0zhlsrYDvk9UmHpNyyCo3FGsB/55Y=
X-Google-Smtp-Source: 
 AGHT+IGsZP6H+91NdmJ6i8soaEWmdRDIYCoyh52OhJZC6bOgqY/X/r4JhNQ6kUaz+Xc1LH/5RJoMXA==
X-Received: by 2002:a5d:4a4a:0:b0:33d:3cf6:a2ca with SMTP id
 v10-20020a5d4a4a000000b0033d3cf6a2camr361594wrs.30.1708710685868;
        Fri, 23 Feb 2024 09:51:25 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 5/6] ASoC: meson: axg-fifo: take continuous rates
Date: Fri, 23 Feb 2024 18:51:11 +0100
Message-ID: <20240223175116.2005407-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N2BPBUFVPV4KCOBTICJTE7BNJZ6EC6OI
X-Message-ID-Hash: N2BPBUFVPV4KCOBTICJTE7BNJZ6EC6OI
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rate of the stream does not matter for the fifos of the axg family.
Fifos will just push or pull data to/from the DDR according to consumption
or production of the downstream element, which is the DPCM backend.

Drop the rate list and allow continuous rates. The lower and upper rate are
set according what is known to work with the different backends

This allows the PDM input backend to also use continuous rates.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.h  | 2 --
 sound/soc/meson/axg-frddr.c | 8 ++++++--
 sound/soc/meson/axg-toddr.c | 8 ++++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index df528e8cb7c9..a14c31eb06d8 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -21,8 +21,6 @@ struct snd_soc_dai_driver;
 struct snd_soc_pcm_runtime;
 
 #define AXG_FIFO_CH_MAX			128
-#define AXG_FIFO_RATES			(SNDRV_PCM_RATE_5512 |		\
-					 SNDRV_PCM_RATE_8000_384000)
 #define AXG_FIFO_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 					 SNDRV_PCM_FMTBIT_S16_LE |	\
 					 SNDRV_PCM_FMTBIT_S20_LE |	\
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 8c166a5f338c..98140f449eb3 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -109,7 +109,9 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_frddr_ops,
@@ -184,7 +186,9 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_frddr_ops,
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 1a0be177b8fe..32ee45cce7f8 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -131,7 +131,9 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_toddr_ops,
@@ -226,7 +228,9 @@ static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_toddr_ops,
-- 
2.43.0

