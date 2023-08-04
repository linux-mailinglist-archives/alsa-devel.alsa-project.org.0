Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C576FFF1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 14:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE5F886;
	Fri,  4 Aug 2023 14:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE5F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691150776;
	bh=1X5fY3MikPJO5z8LqNPKHiilBwwDma0I0W6nsOZTLYc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ehqudbyc1pVOFRQAaBOQGy/ElbtGHBaorYdKTz/M9Vpu/QBsUHAYo4XWt/SgW0f8U
	 BH/A4td90DcjXGQzwmVrEnSOgOglt0Vg9YBDbPPat1mAWZL425+amaH9eFpExSEnIO
	 6xDNXJKBncGc5WquA+WTi3uGImmrHQAb29Ii2lyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C6C9F80580; Fri,  4 Aug 2023 14:04:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA97F80580;
	Fri,  4 Aug 2023 14:04:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B01BF802BE; Fri,  4 Aug 2023 13:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E450DF8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 13:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E450DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Y9v7LWfJ
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9cb0bb04bso6474331fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691147293; x=1691752093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hfx9po4X2/nHcqp+uRJNh79vQllteYIAEl+4cz19+wo=;
        b=Y9v7LWfJuu1KFZqRR7L/JeSm0qr+0EnizOFk3RMoGM98ftwdz16Cjpn+F4ULdiDRur
         xTgSQf4glPExnarUK3ZmhHaCFXJpXfImFPGUHDU4vqWZ3T8EzdbtMBfq5NxSYT0U/pKj
         SMgs/zEEaPoNZISp8e+Wrlvw/eOwMLOiYgoZN5vcvDuQSUGiyJvRU4Brvj87Z6qIj1y1
         UyA5oTF3iI057XiaC0SKF0kMmx7u0EWu73VWSHNhN1oUr/AaGnu7oJ5YKJd2qGDYfBIP
         JY3TUmGr3tCKXVJ8jNUN5JWJf5o4hHK4xbZd8PBHtLwuzcWkknX2uQyZA5sBky0Ncuzs
         7jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691147293; x=1691752093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfx9po4X2/nHcqp+uRJNh79vQllteYIAEl+4cz19+wo=;
        b=Vu6/oShyGET1IrVw4WtQJ3QCsReVcnY008zyCS6NamD1RWvMledvBGaDQKW4mSiNSz
         mMc4MJ3J0H0JMg0AuDQEEYz5ib84/xs2NNQxmK/vawYvpWkEvkGwm39Jhnh1S3xx8/Cw
         97iyYEHMthXMjbD5mU95VeUU4VbaUj/4IK4262C6flg5aUirOgp74OGkW3VFcUXq/rRq
         FBVy5UecZDl/eFqB5efJcT5PKFVUJyjYwihOVjAp9MI1n2Gjyc7cxumiIL9b2+LhygHk
         pWcVlodLjgs3I+qVPZIydijidZ5G8X7M7Vozy5oQi2Nr0bqJ59XLyT7WtFDVz+edOZeu
         nBGg==
X-Gm-Message-State: ABy/qLbu9RvzIKKEHVCHnYKbzDc8dSDLBs439todivSzXScGRoMquecO
	N9Ie76l5YtvjmjlS5FTQjYs=
X-Google-Smtp-Source: 
 APBJJlG6BvJQhivkEuMwuZNLTqLU7d94VTvMiviNYgJs6jIw35Nbsz+MCrc3BEEtpcaS/JLy/GxOBQ==
X-Received: by 2002:a05:651c:332:b0:2b7:3a7e:9e89 with SMTP id
 b18-20020a05651c033200b002b73a7e9e89mr9741571ljp.2.1691147292700;
        Fri, 04 Aug 2023 04:08:12 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 bn10-20020a170906c0ca00b00992b0745548sm1149478ejb.152.2023.08.04.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 04:08:12 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ALSA: pcmtest: Move buffer iterator initialization to
 prepare callback
Date: Fri,  4 Aug 2023 15:07:39 +0400
Message-Id: <20230804110740.9867-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4IT7Y3MRYRGO7TEX7EIWM5CO5SKKGQLB
X-Message-ID-Hash: 4IT7Y3MRYRGO7TEX7EIWM5CO5SKKGQLB
X-Mailman-Approved-At: Fri, 04 Aug 2023 12:04:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IT7Y3MRYRGO7TEX7EIWM5CO5SKKGQLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Trigger callback is not the best place for buffer iterator
initialization, so move it out to the prepare callback, where it
have to be.

Minor enhancement: remove blank line.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Split changes in the patch into two different patches

 sound/drivers/pcmtest.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 08e14b5eb772..dc7c9c758537 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -92,7 +92,6 @@ MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callb
 module_param(inject_open_err, bool, 0600);
 MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
 
-
 struct pcmtst {
 	struct snd_pcm *pcm;
 	struct snd_card *card;
@@ -405,25 +404,9 @@ static int snd_pcmtst_pcm_close(struct snd_pcm_substream *substream)
 
 static int snd_pcmtst_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct pcmtst_buf_iter *v_iter = runtime->private_data;
-
 	if (inject_trigger_err)
 		return -EINVAL;
 
-	v_iter->sample_bytes = runtime->sample_bits / 8;
-	v_iter->period_bytes = frames_to_bytes(runtime, runtime->period_size);
-	if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
-	    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED) {
-		v_iter->chan_block = runtime->dma_bytes / runtime->channels;
-		v_iter->interleaved = false;
-	} else {
-		v_iter->interleaved = true;
-	}
-	// We want to record RATE * ch_cnt samples per sec, it is rate * sample_bytes * ch_cnt bytes
-	v_iter->s_rw_ch = runtime->rate / TIMER_PER_SEC;
-	v_iter->b_rw = v_iter->s_rw_ch * v_iter->sample_bytes * runtime->channels;
-
 	return 0;
 }
 
@@ -454,8 +437,24 @@ static void pcmtst_pdev_release(struct device *dev)
 
 static int snd_pcmtst_pcm_prepare(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct pcmtst_buf_iter *v_iter = runtime->private_data;
+
 	if (inject_prepare_err)
 		return -EINVAL;
+
+	v_iter->sample_bytes = samples_to_bytes(runtime, 1);
+	v_iter->period_bytes = snd_pcm_lib_period_bytes(substream);
+	v_iter->interleaved = true;
+	if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
+	    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED) {
+		v_iter->chan_block = snd_pcm_lib_buffer_bytes(substream) / runtime->channels;
+		v_iter->interleaved = false;
+	}
+	// We want to record RATE * ch_cnt samples per sec, it is rate * sample_bytes * ch_cnt bytes
+	v_iter->s_rw_ch = runtime->rate / TIMER_PER_SEC;
+	v_iter->b_rw = v_iter->s_rw_ch * v_iter->sample_bytes * runtime->channels;
+
 	return 0;
 }
 
-- 
2.34.1

