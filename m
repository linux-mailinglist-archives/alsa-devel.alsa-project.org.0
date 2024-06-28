Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9691BE8C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B40E2366;
	Fri, 28 Jun 2024 14:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B40E2366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719577707;
	bh=3ts2gQuK9q5ifIXWwqQcZskJHVRf4IEqgfVfvltT1No=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kapXwkbRrGDOZnUi9T153pWvXzmt3oXaUxIk8qyicjNpBb81Ck8ig8xCYiQDr/JwF
	 GHOaVj9q5oJ7M73YzHmFeAdUz3m4ug1NNJ/6ODh04473m2bWV22FKYHYsCiAd4MCWE
	 uOk7H6iHVcLLwsB3ut09mJTwCiPPzfnmyfUq0CcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74210F805FB; Fri, 28 Jun 2024 14:27:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC8F9F8061C;
	Fri, 28 Jun 2024 14:27:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 269C0F8016E; Fri, 28 Jun 2024 14:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAD3EF80423
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD3EF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=R/re6OqR
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so544200e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577478;
 x=1720182278; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8ilixuBZasrX5oPlMOZzvZHztGbrS/qDv+nWurvrjo=;
        b=R/re6OqR4YVTXQ/OYflb53IMYsVAPZl/qot2iYKVqujuOZ90GrlNibwMS81yZelvQS
         lqIBdcMzxMd4PSmx+PDiWsc3dfuz1qZq3/NyUAV7zX7KBq2lLz/pUuWiT4VxreusjHNo
         ZyBttZZG1qk/mzbq9KJsBgNDYSaHLgIwugzevq49OjplJDrMobj7hmuV56H50wubmpbc
         pLU37DwI04niWvF4LgnTpsTFLh/PzOsBUtsyAFF79cvfAoOJqixpQfiBEo0YLOuicjWK
         u5VyVACTIu6MCZPeRGhWcKCEbXCDZ4urbuaal9RHrxBU8DzwnXas4BRkEB7rca6xBfuo
         bYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577478; x=1720182278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8ilixuBZasrX5oPlMOZzvZHztGbrS/qDv+nWurvrjo=;
        b=d65JFib4JAzv/lG82kSYiu/4QrjHChJHHVzKH8irsmB95P7uzztMZIG4u+5nxFv1aB
         uUJEmRqg93PmGF13EvVZuj10CTnyKAcqd8h2Bf8rF7xWbaDRmJXNIEjcFd8VU4Eq5Wgk
         r35B4slvUmcKxhB8+H4Sj1V3ydT+3S9hchLBPqCojtibqw+iaOrOXj4K3EAb8tYmhjGZ
         mzbEBmbwcFkIeoXMRhF8s8NVCrlJZN07fV+0Zq3/NJSGyVtgGTxH+DCISpsjHce9tTAi
         P0MVK6sh81HQZN+A6mjFXKliL8JwKCLlrj7AczMJfamUvjNzZcfryOCyTV/XbiX61CEL
         WB+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHhro2GPOdhL7XJFZiKBID3/iSeRZ5O4OLNpyksWb6hREca2cHKiXnilZkiNhvy7X8u6sLYddsuNes4NbO5ohEGKU49JFtpdWw0LQ=
X-Gm-Message-State: AOJu0YzjybrxWmDGQ/v4A21aqOZrbr26GQkF3vezLphGvbfIhrfAiqmx
	0bfpheiQIzIz45u4PYbp0LocSGKb+m7/244n0/c289yKbgOsw2+365cziAVxwEs=
X-Google-Smtp-Source: 
 AGHT+IHQNBdkp5sVhDZMNMGLlSLyCBg5ncNtuAz2wpbbCQJUMGI2AenlpBNeQiXbs7+OnFlxLeSLDQ==
X-Received: by 2002:ac2:4c84:0:b0:52e:7125:c70a with SMTP id
 2adb3069b0e04-52e7125c847mr3014350e87.47.1719577478429;
        Fri, 28 Jun 2024 05:24:38 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ALSA: IEC958 definition for consumer status channel
 update
Date: Fri, 28 Jun 2024 14:23:07 +0200
Message-ID: <20240628122429.2018059-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628122429.2018059-1-jbrunet@baylibre.com>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NRM2MHCXEUTEQCA5K7XKUTI2U623WIZT
X-Message-ID-Hash: NRM2MHCXEUTEQCA5K7XKUTI2U623WIZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRM2MHCXEUTEQCA5K7XKUTI2U623WIZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 128kHz, 352.4kHz, 384kHz and 705.6kHz.
These definitions have been found working on eARC using a Murideo
Seven Generator.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 NOTE: This patch needs to be reviewed/acked by someone with access
       to the IEC958 spec, to confirm the values inserted below.

 include/sound/asoundef.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
index 9fdeac19dadb..09b2c3dffb30 100644
--- a/include/sound/asoundef.h
+++ b/include/sound/asoundef.h
@@ -110,18 +110,22 @@
 #define IEC958_AES2_CON_SOURCE_UNSPEC	(0<<0)	/* unspecified */
 #define IEC958_AES2_CON_CHANNEL		(15<<4)	/* mask - channel number */
 #define IEC958_AES2_CON_CHANNEL_UNSPEC	(0<<4)	/* unspecified */
-#define IEC958_AES3_CON_FS		(15<<0)	/* mask - sample frequency */
+#define IEC958_AES3_CON_FS		((1<<7) | (15<<0)) /* mask - sample frequency */
 #define IEC958_AES3_CON_FS_44100	(0<<0)	/* 44.1kHz */
 #define IEC958_AES3_CON_FS_NOTID	(1<<0)	/* non indicated */
 #define IEC958_AES3_CON_FS_48000	(2<<0)	/* 48kHz */
 #define IEC958_AES3_CON_FS_32000	(3<<0)	/* 32kHz */
 #define IEC958_AES3_CON_FS_22050	(4<<0)	/* 22.05kHz */
+#define IEC958_AES3_CON_FS_384000	(5<<0)	/* 384kHz */
 #define IEC958_AES3_CON_FS_24000	(6<<0)	/* 24kHz */
 #define IEC958_AES3_CON_FS_88200	(8<<0)	/* 88.2kHz */
 #define IEC958_AES3_CON_FS_768000	(9<<0)	/* 768kHz */
 #define IEC958_AES3_CON_FS_96000	(10<<0)	/* 96kHz */
 #define IEC958_AES3_CON_FS_176400	(12<<0)	/* 176.4kHz */
+#define IEC958_AES3_CON_FS_352400	(13<<0) /* 352.4kHz */
 #define IEC958_AES3_CON_FS_192000	(14<<0)	/* 192kHz */
+#define IEC958_AES3_CON_FS_128000	((1<<7) | (11<<0)) /* 128kHz */
+#define IEC958_AES3_CON_FS_705600	((1<<7) | (13<<0)) /* 705.6kHz */
 #define IEC958_AES3_CON_CLOCK		(3<<4)	/* mask - clock accuracy */
 #define IEC958_AES3_CON_CLOCK_1000PPM	(0<<4)	/* 1000 ppm */
 #define IEC958_AES3_CON_CLOCK_50PPM	(1<<4)	/* 50 ppm */
-- 
2.43.0

