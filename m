Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0594BF1B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 16:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5982FEC1;
	Thu,  8 Aug 2024 16:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5982FEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723126001;
	bh=oHdPwKkQME8bYOR30ePg4GS9XEv348EDstUr6EWkBh4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IX0wpNwOZXd67elTdz2AncI6Lno7iCyxloVYAJaMk5uXA/hViXuI58OJiqECu1sk4
	 w2iSx72O6EQaX1w0ur8s5tyQMao3qTCNHL5r6VcbPl0Dt3TmqAdqjX4S0MlbEnTYqd
	 R4pS7zWEKtNe6JNA0zaJwFH63pqb1lvG9UFPzfYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF9D5F805A0; Thu,  8 Aug 2024 16:06:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 155F0F805AE;
	Thu,  8 Aug 2024 16:06:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1719F802DB; Thu,  8 Aug 2024 15:54:56 +0200 (CEST)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC684F80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 15:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC684F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1CAGlhea
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3687f91af40so601226f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723124949;
 x=1723729749; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc2kb4MfKvFjP/ZDE0bQ/8gyXH0Djs1sAmNuVFX31oE=;
        b=1CAGlhea8M29rbldt60DVGgYBapZBpV91kXYRuFr5aVKnpLdSXQNedQT5Rx/dMhCGi
         8IU3y3gh7RPzCZlCoftr2X12HG5rcJ3BYPMVcQrj/kTUSMD3Wyg0dFbuy80lu5B1OhfL
         XgnyyGzqxE4Yf0LGnq9MzpOCcWbBYnjgAjtjZ7KAKaxs08SgTVY6zjZqANU8BD3GB59Y
         ahBHHTgePaEfSCwqUxHJtA44eDX9Bsc6wSuNa8jwU+cYzatLOLthiYXyIIBjsxstZ+9Q
         MioWMjGxEM32uAtiTZfHrA4NbW6GX8nzgULmLRXXgQFsAGozrAxi2UwUQLSPdAilfmWF
         /lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124949; x=1723729749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc2kb4MfKvFjP/ZDE0bQ/8gyXH0Djs1sAmNuVFX31oE=;
        b=pS8fX5VNQt53kGT1aXLVPl+b0KYqimDDB/qHKM1H0zkbKwE3immkWp7W4bZeFIW6Wp
         KqR2ru10MAFbZvetm87HGuo7nRdPIWlncGSIpJNrLmL0Iw4byla3PNe/ujzxOds6XpA5
         MVTAUw3iQAS4KkdL4Xhd+nCanRCd17YKYVt4cuJdrEFQo+lGk4hYo01WHhdvJ7qT54fi
         PVtBmLJjGtxLjZrvVmhypQn3okkHGSWj0o2U8/9uvw5FIdwkbGQbyhBzEYG87bciKDjy
         SJwW6ucKnEPmqI70ZsSyo65Aa+9R/OU/By4sgKCw5zUjdqOSd7EKSShWaiPa3GdJmPFM
         9RiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVStxqE99NuOrTbgQzhugXNKA9zTRHqTI4NpKp/bv8IMCY8D5vzJJs4yee4dDRc9pa7YvXjNtFNHwkjQK+efnRpQMVHQQUX7FNG95o=
X-Gm-Message-State: AOJu0YzF2Oc/1ziPg41W4AkGfof22BacvUfgBgULjx2Na3C0rBd0KUpw
	vBL2Atc8PQmyMqJOe6Xw0hdTUwjfPO8sNbMfB+Efxv2F/kKQLmKDDJaAaT4ed5M=
X-Google-Smtp-Source: 
 AGHT+IGwNL0A36cUPhEaS/8r+wLSddqefAckjIQj+NsXha0hO1eaMKAfQzEMYgvHPb0aqA3AIXNXag==
X-Received: by 2002:adf:e782:0:b0:368:3751:de3 with SMTP id
 ffacd0b85a97d-36d274ed73cmr1472917f8f.31.1723124949209;
        Thu, 08 Aug 2024 06:49:09 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:13e0:cfeb:f041:89ed])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36d271572cdsm2037735f8f.1.2024.08.08.06.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 06:49:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit
Date: Thu,  8 Aug 2024 15:48:54 +0200
Message-ID: <20240808134857.86749-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QGLALDXWF4MNCT3ZFYQ6JEVLVCPLKR63
X-Message-ID-Hash: QGLALDXWF4MNCT3ZFYQ6JEVLVCPLKR63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGLALDXWF4MNCT3ZFYQ6JEVLVCPLKR63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snd_pcm_rate_to_rate_bit() helper provided by Alsa instead
re-implementing it. This reduce code duplication and helps when
changing some Alsa definition is necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/usb/caiaq/audio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 4981753652a7..e62a4ea1d19c 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -174,14 +174,6 @@ static int snd_usb_caiaq_pcm_hw_free(struct snd_pcm_substream *sub)
 	return 0;
 }
 
-/* this should probably go upstream */
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
-#error "Change this table"
-#endif
-
-static const unsigned int rates[] = { 5512, 8000, 11025, 16000, 22050, 32000, 44100,
-				48000, 64000, 88200, 96000, 176400, 192000 };
-
 static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	int bytes_per_sample, bpp, ret, i;
@@ -233,10 +225,7 @@ static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 
 	/* the first client that opens a stream defines the sample rate
 	 * setting for all subsequent calls, until the last client closed. */
-	for (i=0; i < ARRAY_SIZE(rates); i++)
-		if (runtime->rate == rates[i])
-			cdev->pcm_info.rates = 1 << i;
-
+	cdev->pcm_info.rates = snd_pcm_rate_to_rate_bit(runtime->rate);
 	snd_pcm_limit_hw_rates(runtime);
 
 	bytes_per_sample = BYTES_PER_SAMPLE;
-- 
2.43.0

