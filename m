Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45C797123
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 11:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A864B886;
	Thu,  7 Sep 2023 11:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A864B886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694077832;
	bh=i4eVAqrAINJtGSMhSmGgLIBfYZcUeL6X9E8BPPRmlz0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rSApQ0UdhwU3sCw1jzk2V6NhSkp0riiN3j4OiGdGDEw4KCtdqCmexbAKrnG3ox4g/
	 PyToQCu/hp2+x4XZ8mJN38y6Eh4suYw078GFG7VVQcIP8p1EXPi3yJNw+aHXSnx6P1
	 rBTTMbiQ8acgpT5exoYDPBRjnptMCkKwHFxjBAPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EAB5F800F5; Thu,  7 Sep 2023 11:09:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF47F8047D;
	Thu,  7 Sep 2023 11:09:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0905CF80494; Thu,  7 Sep 2023 11:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D75FF80431
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 11:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D75FF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xOdCdnww
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso8207935e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Sep 2023 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694077772;
 x=1694682572; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBjuRLwnfixpgR2nFPgNkEIBBrq5rco4eC4mU+aZjZI=;
        b=xOdCdnwwQsB6ZlKyxtoP3J9DI2/yl6y8PZHE46DwawR3JMUPynzUPFcBi8gtqEaeAl
         I4MoGvuM/Lj3diwF/yj/uaTxF2CIE2kGCI0ct5TlZz8uPbcRN7fQiuvvjSiKp8quVZyc
         rJrrWCTcB1w+fCJtMX/EzOC6iGOwE813R6gdGscBCe8IhUDT/wZl8IkKdKjNY7YucTrE
         UqrsW5fqv4OA4p6vrJ/loYAC3ehuccy7oNAG69+1UYiKZP/NGmJIC6kx45ufQjVFAMbX
         GjJDiB8q+tHlpG/YAnwPCc+C65Tnvm5BvKuI9GKdG1peQW1/HnXswAkTOSDLQWvursIX
         zQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077772; x=1694682572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBjuRLwnfixpgR2nFPgNkEIBBrq5rco4eC4mU+aZjZI=;
        b=U6lQvgjWGFdiQbZY+eRAzL4ZJpdi4PmCD3tSBWLLrOXnZA4WM9AzU01Mzywq34Lhkk
         QYHiiK/+sBfbtRXemhsTO1bTNc7OUQY3sm2+dHoukHM0WHdirluuXZ7X0UXsoOOu6Idv
         JAunysJUvQuFWt/Er1xzmjPbYNDuqYsULVhPyUobDXhBa+fnxbDCT7AwcLg7wB9Ww58F
         8cb65DUY89hFsbr3MfUKGcHL6slJ+2I8ZHr8/wHG5bJLVW65LAsMjymiT6kEaUsXPNZL
         /otBVJw2qYJCeZ9hnwEJ0vsvRUpAzLW4IpwTnMqOmBiz0LdIOsNLj8ztkPKy6TjS6ivB
         ZD0Q==
X-Gm-Message-State: AOJu0Yyrkt1teEXilg26Q7ALQ0H/XVnfIfijfSM3Fn7MRewPxE/LtBoL
	8HWMFhiUNAPtzmZ0/Z7tX1M9Mg==
X-Google-Smtp-Source: 
 AGHT+IGV9XwlUajdhCdrx5f+9/paKpKd41H2FIS5FzrRu7+e/TPt8scscnliKKvl02o6tIwPYOkB8w==
X-Received: by 2002:a05:600c:11c1:b0:401:b204:3b84 with SMTP id
 b1-20020a05600c11c100b00401b2043b84mr4240874wmi.40.1694077772184;
        Thu, 07 Sep 2023 02:09:32 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5be9:5575:c6f4:d478])
        by smtp.googlemail.com with ESMTPSA id
 k8-20020a5d4288000000b003176aa612b1sm22764763wrq.38.2023.09.07.02.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:09:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: axg: extend TDM maximum sample rate to 384kHz
Date: Thu,  7 Sep 2023 11:09:10 +0200
Message-Id: <20230907090910.13546-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z3VTKD375NDKV6OAK7MTZNQMROFZAJNB
X-Message-ID-Hash: Z3VTKD375NDKV6OAK7MTZNQMROFZAJNB
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3VTKD375NDKV6OAK7MTZNQMROFZAJNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TDM HW on the axg SoC families and derivatives actually supports
384kHz sampling rate.

Update the fifo and tdm interface constraints accordingly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 2 +-
 sound/soc/meson/axg-fifo.h | 2 +-
 sound/soc/meson/axg-tdm.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bccfb770b339..2e3d0108179b 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -31,7 +31,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP),
 	.formats = AXG_FIFO_FORMATS,
 	.rate_min = 5512,
-	.rate_max = 192000,
+	.rate_max = 384000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
 	.period_bytes_min = AXG_FIFO_BURST,
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index b63acd723c87..df528e8cb7c9 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -22,7 +22,7 @@ struct snd_soc_pcm_runtime;
 
 #define AXG_FIFO_CH_MAX			128
 #define AXG_FIFO_RATES			(SNDRV_PCM_RATE_5512 |		\
-					 SNDRV_PCM_RATE_8000_192000)
+					 SNDRV_PCM_RATE_8000_384000)
 #define AXG_FIFO_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 					 SNDRV_PCM_FMTBIT_S16_LE |	\
 					 SNDRV_PCM_FMTBIT_S20_LE |	\
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index 5774ce0916d4..42f7470b9a7f 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -16,7 +16,7 @@
 #define AXG_TDM_NUM_LANES	4
 #define AXG_TDM_CHANNEL_MAX	128
 #define AXG_TDM_RATES		(SNDRV_PCM_RATE_5512 |		\
-				 SNDRV_PCM_RATE_8000_192000)
+				 SNDRV_PCM_RATE_8000_384000)
 #define AXG_TDM_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 				 SNDRV_PCM_FMTBIT_S16_LE |	\
 				 SNDRV_PCM_FMTBIT_S20_LE |	\
-- 
2.40.1

