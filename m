Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1817B3F00
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B492DE92;
	Sat, 30 Sep 2023 10:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B492DE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061362;
	bh=+QbgGpllnuuz78AX349Uf6AhzRgELXo5QMagDdHbOLw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S+MTcuFfWIX772w4CFdVW5NcnUFbDX4uiSB05KJJ5tXKVmsS1WJaUh+FfoswEIAaE
	 F4BXt6gI+MWb9khKf3zueD9XnDwa8lSYdpGD4tx68DZJ8/EM+WIAPktURdEivFlvJ2
	 gkFBqONzOHUU9HDfz02yBqIUYpolUTfVTYrhHeTA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7E17F805AC; Sat, 30 Sep 2023 10:06:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 585E8F8061F;
	Sat, 30 Sep 2023 10:06:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD5FAF801D5; Wed, 27 Sep 2023 13:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83ED6F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 13:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83ED6F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R+BqGr9F
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4056ce55e6fso18382845e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 04:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695814561; x=1696419361;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRFVxzj+hVFD0IJT/IGMwbr1NPpMK93Z+5C9tH0fQfo=;
        b=R+BqGr9Ft1YZCs6JAg1WdMos2CFGitGwtmfnhjQmI6dN7KzIiCGXTV+BYrZPKQ6MHa
         S3oWF5m2EtJi7qBYtGYk0TKlVRUbcydvc+9szramG4llJIklv5Xs/FFtfMh03rhxptqk
         QFiuDiz5NwobTfwkHPbWYTuoQA/3aAn+tKHBzIa93LEIS1kRJ3Y1FKjO8SDxV0CrqjJt
         AnzT8BFVv4h2citoMl4qTEWLJRFP7B/Wa5lSAN/0tl/2NcZmdJ+KdJTsJdiJ4TmLqrNP
         VGWq/AVMDbNWmLqtVOfLCANmppujnXEPX0aIwqp3Sa0TgVDgTLQmmbZt81NxyuZKmsxv
         ZLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695814561; x=1696419361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRFVxzj+hVFD0IJT/IGMwbr1NPpMK93Z+5C9tH0fQfo=;
        b=PEYDa9MkN+X00UGxQ8ldvekIRWpEz2WdIyA/v2qeZqhkXpfmlVA1cdR41afVoB8twU
         Qs8x/AK4Okcw3kBOQB4+I+uaDNFa2dRirUmvX7uaLNTOzY6X4DT8zuJ2//0h7WSgUasC
         xiNs7xrFs5/JKCuMFQL4Gvy2Q9aY/sZ12v3TAoUl7Jf991A6TuXeqiiHjPEWJJFSnZlR
         e274j9N/r8lEjvm9UmvUddtYbTUKkB0Fce+HcSa1pmZ2cWVrLXXJ/mD4DdRCVinogZcm
         UGQEmz/Y8xCqj5TFhoYZ5VJQNqgKzbpE+2cwcwbxFihNL7ke3O1L+okQUQvBe/YxpMgT
         gLvg==
X-Gm-Message-State: AOJu0YxZ+eDdBvYV9WiNl00F4OtiLntQfsbb+WUBiJ25Uuy1TSC5oO6o
	SzYpQ7nD6akkeHPNQetWHxr6RA/AOko=
X-Google-Smtp-Source: 
 AGHT+IHKmKHutWvHupgciI0XgpXrodsbTAdezHCuwMWoW4BstTpHwBYaFy4VorZtx8vHj5s3ZdZ9cg==
X-Received: by 2002:a5d:568e:0:b0:31a:ea18:c516 with SMTP id
 f14-20020a5d568e000000b0031aea18c516mr1548970wrv.3.1695814560929;
        Wed, 27 Sep 2023 04:36:00 -0700 (PDT)
Received: from ivan-HLYL-WXX9.guest.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b0030ae53550f5sm16792874wrv.51.2023.09.27.04.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:36:00 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: aloop: Add support for the non-interleaved access
 mode
Date: Wed, 27 Sep 2023 12:35:54 +0100
Message-Id: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6XVXEBXUJWEQO6B5DXY3EROAQIND4E76
X-Message-ID-Hash: 6XVXEBXUJWEQO6B5DXY3EROAQIND4E76
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:06:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XVXEBXUJWEQO6B5DXY3EROAQIND4E76/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current version of the loopback driver supports interleaved access
mode only. This patch introduces support for the non-interleaved
access mode.

When in the interleaved mode, the 'copy_play_buf' function copies data
from the playback to the capture buffer using one memcpy call. This call
copies samples for multiple, interleaved channels.

In the non-interleaved mode we have multiple channel buffers, so we have
to perform multiple memcpy calls to copy samples channel after channel.

Add new function called 'copy_play_buf_part_n', which copies a part of
each channel buffer from playback to capture. Modify the 'copy_play_buf'
to use the corresponding memory copy function(just memcpy /
copy_play_buf_part_n) depending on the access mode.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 sound/drivers/aloop.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index a38e602b4fc6..ab116b1fed96 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -158,6 +158,9 @@ struct loopback_pcm {
 	unsigned long last_jiffies;
 	/* If jiffies timer is used */
 	struct timer_list timer;
+
+	/* size of per channel buffer in case of non-interleaved access */
+	unsigned int channel_buf_n;
 };
 
 static struct platform_device *devices[SNDRV_CARDS];
@@ -335,7 +338,8 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 							substream->runtime;
 	check = runtime->format != cruntime->format ||
 		runtime->rate != cruntime->rate ||
-		runtime->channels != cruntime->channels;
+		runtime->channels != cruntime->channels ||
+		runtime->access != cruntime->access;
 	if (!check)
 		return 0;
 	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
@@ -472,6 +476,7 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
 
 	dpcm->buf_pos = 0;
 	dpcm->pcm_buffer_size = frames_to_bytes(runtime, runtime->buffer_size);
+	dpcm->channel_buf_n = dpcm->pcm_buffer_size / runtime->channels;
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		/* clear capture buffer */
 		dpcm->silent_size = dpcm->pcm_buffer_size;
@@ -522,6 +527,22 @@ static void clear_capture_buf(struct loopback_pcm *dpcm, unsigned int bytes)
 	}
 }
 
+static void copy_play_buf_part_n(struct loopback_pcm *play, struct loopback_pcm *capt,
+				 unsigned int size, unsigned int src_off, unsigned int dst_off)
+{
+	unsigned int channels = capt->substream->runtime->channels;
+	unsigned int size_p_ch = size / channels;
+	unsigned int src_off_ch = src_off / channels;
+	unsigned int dst_off_ch = dst_off / channels;
+	int i;
+
+	for (i = 0; i < channels; i++) {
+		memcpy(capt->substream->runtime->dma_area + capt->channel_buf_n * i + dst_off_ch,
+		       play->substream->runtime->dma_area + play->channel_buf_n * i + src_off_ch,
+		       size_p_ch);
+	}
+}
+
 static void copy_play_buf(struct loopback_pcm *play,
 			  struct loopback_pcm *capt,
 			  unsigned int bytes)
@@ -556,7 +577,11 @@ static void copy_play_buf(struct loopback_pcm *play,
 			size = play->pcm_buffer_size - src_off;
 		if (dst_off + size > capt->pcm_buffer_size)
 			size = capt->pcm_buffer_size - dst_off;
-		memcpy(dst + dst_off, src + src_off, size);
+		if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
+		    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED)
+			copy_play_buf_part_n(play, capt, size, src_off, dst_off);
+		else
+			memcpy(dst + dst_off, src + src_off, size);
 		capt->silent_size = 0;
 		bytes -= size;
 		if (!bytes)
@@ -878,7 +903,7 @@ static const struct snd_pcm_hardware loopback_pcm_hardware =
 {
 	.info =		(SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_MMAP |
 			 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_PAUSE |
-			 SNDRV_PCM_INFO_RESUME),
+			 SNDRV_PCM_INFO_RESUME | SNDRV_PCM_INFO_NONINTERLEAVED),
 	.formats =	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |
-- 
2.34.1

