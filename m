Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8378686E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A14BAEA;
	Thu, 24 Aug 2023 09:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A14BAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862605;
	bh=KYCM/i2GMZrSoB/ozLv4x7Y1FQfdNNv+nIT7PVVBNUM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UJ1sESmG/yrHkyrZdxMAotKoyRTgyiqctlU5t7JVeZ3iC1N08JSM8zhGrOHgTzrhL
	 GBPeoCG562HOoaPapy7jjRdGJx8kOTjlryNCBQAD/phiGJhiBGSvqI1mQL0HC7I2b+
	 qBRmLPf2vFdBKgPgP6I4hdAzpuOd9f2+ZRqtrEvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCAFBF805F7; Thu, 24 Aug 2023 09:32:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7AE8F805F7;
	Thu, 24 Aug 2023 09:32:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61CF6F80158; Tue, 22 Aug 2023 17:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A726EF800D1
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 17:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A726EF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=EK/QqDRk
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31c3f574ef8so439279f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 22 Aug 2023 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692716777; x=1693321577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hiuif0UPEilRfTqfvjhgYV9OjFsrTUZzsOgS/HAy03Q=;
        b=EK/QqDRkxi36aIi0UBd9fmgJGjMU2iJAesESNS7RXj3CU+4OgQFnmS0DRe1Pjqt3Vj
         aSNjrghPdOk8/h1SE6SKPJAzc5DqcD4+5PrMeavHJyeyp9S2zKh9XaOtlZn7mY5eYSD/
         cm7wR5jRdkxFzEfC6rjLF6OrbpWnmsYdVYAbNFkRPqOaRDPsW+L2vGKCop7uzax2TDuC
         euiDhxVc05SOEdjkhWgM5YYDIwbmQVLcQmKlNFbOLPaHYZPkGsrL6Tw3elinaF/uY5e/
         yOhAj28EKnvg3I1Q1bZmpJZa6Itn2Tc0RfB8et8DvcNdvmh/azKkJDvWb84xZwElkzTw
         kTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692716777; x=1693321577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiuif0UPEilRfTqfvjhgYV9OjFsrTUZzsOgS/HAy03Q=;
        b=gaxuYvgYzGLtcFjvERXXm0NhVpPK68k/h/ANhNbBGMo4FJ5yZcxCrS3jil3d3J70zE
         KGiSoAX/EetIEzbzKhnoqMBTL8BD1nN1oevaYwM5MlxjfT5tXkQoNE/F7t266pdTPSL0
         PJK4huMI0sNvqjCRZBzwWXkZJ1moCBgxHXG3lvgGBR6/v37ArBafQC1ESq/FBMHMj+El
         wmFWSgjN25oMEXeXjoP445Oq7nTL7auBmUXR7iA4A7I7RpWF5Rd38cHNLvDKCTiDJzuX
         ZjXQPKWLHpJEA0yRhCSN4Yw2KDOORmzFoIM+0xh0ycr4S8zDcJbkex55kZ7RV0wxeWnC
         REfw==
X-Gm-Message-State: AOJu0YxFqY0OhXIKt6yasvhOG8sG+PfOThAf5JPRqw3Of+duJ5E/2+ic
	2dNkLJpes2aijytAH8k+ki8=
X-Google-Smtp-Source: 
 AGHT+IG/WYaK4QKoY/sXJElN3HnYE35+BGE/wEL15yzukGUemxKM29AaJP9Afn93aZrjhi0CYRIJjg==
X-Received: by 2002:adf:e710:0:b0:317:3d36:b2c1 with SMTP id
 c16-20020adfe710000000b003173d36b2c1mr8082225wrm.7.1692716776656;
        Tue, 22 Aug 2023 08:06:16 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.93.153])
        by smtp.gmail.com with ESMTPSA id
 p13-20020adff20d000000b0031c52e81490sm6619066wro.72.2023.08.22.08.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 08:06:16 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcmtest: Add support for pcm pausing
Date: Tue, 22 Aug 2023 19:05:41 +0400
Message-Id: <20230822150541.8450-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2TFH4TNLQPIGJ4MBCJX3PDRKCIPQTUJW
X-Message-ID-Hash: 2TFH4TNLQPIGJ4MBCJX3PDRKCIPQTUJW
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:32:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TFH4TNLQPIGJ4MBCJX3PDRKCIPQTUJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pause push/release support to the virtual PCM test driver. Add
'suspend' boolean field to the pcmtst_buf_iter structure, so we can
pause the timer without shutting it down. Update the trigger callback
handler correspondingly. Extract buffer initialization to the
'reset_buf_iterator' function since it is used in multiple places now.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 sound/drivers/pcmtest.c | 49 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 27cbb9d38f08..b59b78a09224 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -108,6 +108,7 @@ struct pcmtst_buf_iter {
 	size_t total_bytes;			// Total bytes read/written
 	size_t chan_block;			// Bytes in one channel buffer when non-interleaved
 	struct snd_pcm_substream *substream;
+	bool suspend;				// We need to pause timer without shutting it down
 	struct timer_list timer_instance;
 };
 
@@ -115,7 +116,8 @@ static struct snd_pcm_hardware snd_pcmtst_hw = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		 SNDRV_PCM_INFO_NONINTERLEAVED |
-		 SNDRV_PCM_INFO_MMAP_VALID),
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_PAUSE),
 	.formats =		SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S16_LE,
 	.rates =		SNDRV_PCM_RATE_8000_48000,
 	.rate_min =		8000,
@@ -346,6 +348,9 @@ static void timer_timeout(struct timer_list *data)
 	v_iter = from_timer(v_iter, data, timer_instance);
 	substream = v_iter->substream;
 
+	if (v_iter->suspend)
+		return;
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && !v_iter->is_buf_corrupted)
 		check_buf_block(v_iter, substream->runtime);
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -358,7 +363,9 @@ static void timer_timeout(struct timer_list *data)
 		v_iter->period_pos %= v_iter->period_bytes;
 		snd_pcm_period_elapsed(substream);
 	}
-	mod_timer(&v_iter->timer_instance, jiffies + TIMER_INTERVAL + inject_delay);
+
+	if (!v_iter->suspend)
+		mod_timer(&v_iter->timer_instance, jiffies + TIMER_INTERVAL + inject_delay);
 }
 
 static int snd_pcmtst_pcm_open(struct snd_pcm_substream *substream)
@@ -373,19 +380,15 @@ static int snd_pcmtst_pcm_open(struct snd_pcm_substream *substream)
 	if (!v_iter)
 		return -ENOMEM;
 
+	v_iter->substream = substream;
 	runtime->hw = snd_pcmtst_hw;
 	runtime->private_data = v_iter;
-	v_iter->substream = substream;
-	v_iter->buf_pos = 0;
-	v_iter->is_buf_corrupted = false;
-	v_iter->period_pos = 0;
-	v_iter->total_bytes = 0;
 
 	playback_capture_test = 0;
 	ioctl_reset_test = 0;
 
 	timer_setup(&v_iter->timer_instance, timer_timeout, 0);
-	mod_timer(&v_iter->timer_instance, jiffies + TIMER_INTERVAL);
+
 	return 0;
 }
 
@@ -400,10 +403,40 @@ static int snd_pcmtst_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static inline void reset_buf_iterator(struct pcmtst_buf_iter *v_iter)
+{
+	v_iter->buf_pos = 0;
+	v_iter->is_buf_corrupted = false;
+	v_iter->period_pos = 0;
+	v_iter->total_bytes = 0;
+}
+
+static inline void start_pcmtest_timer(struct pcmtst_buf_iter *v_iter)
+{
+	v_iter->suspend = false;
+	mod_timer(&v_iter->timer_instance, jiffies + TIMER_INTERVAL);
+}
+
 static int snd_pcmtst_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
+	struct pcmtst_buf_iter *v_iter = substream->runtime->private_data;
+
 	if (inject_trigger_err)
 		return -EINVAL;
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		reset_buf_iterator(v_iter);
+		start_pcmtest_timer(v_iter);
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		start_pcmtest_timer(v_iter);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		// We can't call timer_shutdown_sync here, as it is forbidden to sleep here
+		v_iter->suspend = true;
+		break;
+	}
 
 	return 0;
 }
-- 
2.34.1

