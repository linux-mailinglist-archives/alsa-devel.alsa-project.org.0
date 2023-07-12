Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151B75190E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 08:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423DB7F4;
	Thu, 13 Jul 2023 08:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423DB7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689230913;
	bh=ZGmtPWCrZse9M1FV6yt48MhbC5uTXYieOMjcRwV8y3U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lapIr2BogzrxiS830hHsP1OFylGL1Dq3CdKmKtIj9FFv7sGqhzKaGYUtEsVe0Kcgm
	 2RzmKIIhxxobqkwaqPBqT01DbQ8D3uJMB0w9Q5U9CsEoFShJnm+WC1c4ucz9dfU8RN
	 hFAgdtNEGG4PF8upT9T/WV7H6FHSQYe7GFpFDYRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F123F8055A; Thu, 13 Jul 2023 08:46:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB3EBF80544;
	Thu, 13 Jul 2023 08:46:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0ABF80249; Wed, 12 Jul 2023 21:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0C6DF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 21:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C6DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=X5THPtP/
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3145fcecef6so2615f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 12:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689189222; x=1689794022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2QHVO7BLuBhdhHKLquYTQM6WPJRF2zzEP1Lh58ULoUg=;
        b=X5THPtP/o3bSxe7TyAsA7WCM8sLDROd6YZyUh53cQiL5zZvuTlU/shPlowSv6/ahO5
         67ZGcnpToEmvPKaLlSsvcBS/ZkNhDxTz4AmjZoqvZUKm/vhajm+z+koBm5Fl/5cMmT5q
         FLG+y/20nJdQHIW8TZljbM2xmQ/M3cpwhhv9oXV/sg5tgQIY0TjKpBM5O1p47f6ya2F6
         OYYCr1Yy/UOS591fpvj7e7DXdpnB41Rd88SMclAZMdVZWcU5EENWnEXTZZFb3bcl2h8x
         W643qQ+jn0FT0qp3pM1WbfLYGzn075Hqyv8lVNxFbvqkj6aRXjouAPoPlOpU2zvSwcbV
         uf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689189222; x=1689794022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QHVO7BLuBhdhHKLquYTQM6WPJRF2zzEP1Lh58ULoUg=;
        b=GomuZkXRi3JfBMhPK1lGn/Uur7qUmsrAyR8Hezf24gA7+CCNDVuua6rNFu7Hzn6anH
         rGtXFe5TVwk4+/+BIecPSmo2Wv+031tksCUTOtaVEfdmE6UVh+23ptBCOyJ01bUTF6YK
         8aWd8LGQP1OYhHrs6ZUF/DFtqlDjVG4ppDn++r9bcwmRrEl9hDfnsHVvdIx2revBGpNS
         lysgujU7kfTNo61/ffeuaukUBDOqxvfG1jsorlYfj8XROzCX2YeDgHLdGwJOufQvME4K
         fbX0I8De5z9UjBtjwwvV/aSv5GirEemJOPNXR8OQBhRhvtGz5KC/krbYaEwlkDbLk283
         Th8g==
X-Gm-Message-State: ABy/qLYD1GeY8btlUV73y5tmju8FoCo3dPhJBAoL7lYhxxzlYBHIYFPd
	LyIEQPTgHdYxrqtjatEhvME=
X-Google-Smtp-Source: 
 APBJJlHdlJ6lu/yHbOb/wtnZacEcBnt6ZjRG6zPJF8Mr3ONmlp/q4gsnHtJpxCyWarn9DZr5Fp3Hsg==
X-Received: by 2002:a5d:4941:0:b0:313:ddde:6ecd with SMTP id
 r1-20020a5d4941000000b00313ddde6ecdmr256553wrs.1.1689189221727;
        Wed, 12 Jul 2023 12:13:41 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.93.92])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a5d4604000000b00313e59cb371sm5848063wrq.12.2023.07.12.12.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 12:13:41 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcmtest: Extend error injection,
 decrease buffer filling overhead
Date: Wed, 12 Jul 2023 23:13:25 +0400
Message-Id: <20230712191325.8791-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AKCRXJRCUNRXZQYSV4LBNAXC37V35KFG
X-Message-ID-Hash: AKCRXJRCUNRXZQYSV4LBNAXC37V35KFG
X-Mailman-Approved-At: Thu, 13 Jul 2023 06:46:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKCRXJRCUNRXZQYSV4LBNAXC37V35KFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Extend 'pcmtest' virtual driver with 'open' callback error injection
functionality, as it already can inject errors into other PCM callbacks.

Fix the driver to use already defined variables where it is possible.

Additionally, decrease the buffer filling overhead with conditional
reminder calculation in the 'inc_buf_pos' inline function.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 sound/drivers/pcmtest.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 291e7fe47893..08e14b5eb772 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -65,6 +65,7 @@ static int inject_delay;
 static bool inject_hwpars_err;
 static bool inject_prepare_err;
 static bool inject_trigger_err;
+static bool inject_open_err;
 
 static short fill_mode = FILL_MODE_PAT;
 
@@ -88,6 +89,9 @@ module_param(inject_prepare_err, bool, 0600);
 MODULE_PARM_DESC(inject_prepare_err, "Inject EINVAL error in the 'prepare' callback");
 module_param(inject_trigger_err, bool, 0600);
 MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callback");
+module_param(inject_open_err, bool, 0600);
+MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
+
 
 struct pcmtst {
 	struct snd_pcm *pcm;
@@ -140,7 +144,8 @@ static inline void inc_buf_pos(struct pcmtst_buf_iter *v_iter, size_t by, size_t
 {
 	v_iter->total_bytes += by;
 	v_iter->buf_pos += by;
-	v_iter->buf_pos %= bytes;
+	if (v_iter->buf_pos >= bytes)
+		v_iter->buf_pos %= bytes;
 }
 
 /*
@@ -196,10 +201,10 @@ static void check_buf_block_ni(struct pcmtst_buf_iter *v_iter, struct snd_pcm_ru
 	u8 current_byte;
 
 	for (i = 0; i < v_iter->b_rw; i++) {
-		current_byte = runtime->dma_area[buf_pos_n(v_iter, channels, i % channels)];
+		ch_num = i % channels;
+		current_byte = runtime->dma_area[buf_pos_n(v_iter, channels, ch_num)];
 		if (!current_byte)
 			break;
-		ch_num = i % channels;
 		if (current_byte != patt_bufs[ch_num].buf[(v_iter->total_bytes / channels)
 							  % patt_bufs[ch_num].len]) {
 			v_iter->is_buf_corrupted = true;
@@ -239,7 +244,7 @@ static void fill_block_pattern_n(struct pcmtst_buf_iter *v_iter, struct snd_pcm_
 
 	for (i = 0; i < v_iter->b_rw; i++) {
 		ch_num = i % channels;
-		runtime->dma_area[buf_pos_n(v_iter, channels, i % channels)] =
+		runtime->dma_area[buf_pos_n(v_iter, channels, ch_num)] =
 			patt_bufs[ch_num].buf[(v_iter->total_bytes / channels)
 					      % patt_bufs[ch_num].len];
 		inc_buf_pos(v_iter, 1, runtime->dma_bytes);
@@ -364,6 +369,9 @@ static int snd_pcmtst_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct pcmtst_buf_iter *v_iter;
 
+	if (inject_open_err)
+		return -EBUSY;
+
 	v_iter = kzalloc(sizeof(*v_iter), GFP_KERNEL);
 	if (!v_iter)
 		return -ENOMEM;
-- 
2.34.1

