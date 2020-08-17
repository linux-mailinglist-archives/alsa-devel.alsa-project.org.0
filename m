Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72237246319
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:20:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1393416A8;
	Mon, 17 Aug 2020 11:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1393416A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656046;
	bh=ok5+6CJj5PErc20kpBGxsd/hHeJFpGiXZ+Ctbqr08xY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+AA0DGPMc6AAKBWAIxzRiuckTQeL++5LOuNqSwJZVRUarNFh9KzW0YcyQ2UoKuS8
	 BJYQsYEWLVXUiE8nbKZtOskAfzr9pEIYM7YfP5fJbflTg+hdu5ktdiYSVorZSYJF+R
	 GXLo+IiqnK4HNpV5xmJj2b5rqusY2WAIACWo+ZUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A5EF800D3;
	Mon, 17 Aug 2020 11:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C76F80255; Mon, 17 Aug 2020 10:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DEC2F800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEC2F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MTaQvUr+"
Received: by mail-pl1-x643.google.com with SMTP id k13so7155887plk.13
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Th97jQWizU+MR3H8KsmSgYMMcn/Wb6U+3t12llCRyTA=;
 b=MTaQvUr+9I4xHzCOKxRhJIanXnw2ADB+kr39T+fF3C6zzpdo9HLs+qL1IBLzK3SWKB
 kFHMeMi42mIMhCMgjlyKh1EueKFLpcVlc8KJaH9AsB2CgfbL8z1QOikA4G/51O3uLe77
 DBNBkRaC4c9aHaiHeJRkntRZzD6pcFUC4LRM0rBw9zBPm9uYhdb+O+8U/f3j32qtI0ni
 jvm1avJSfp92oDURGAVXZ7Ca2+81BpCwthDzlFy+8XwoIPTqoj0wjs9XosDd8C3xwMjg
 Hl1KkmqbTOv/c8leI+BpaR/Yf26jJfnLHHYd9+Vvmj7bzbmoK6NGqZopyx27BtqEJESx
 Z2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Th97jQWizU+MR3H8KsmSgYMMcn/Wb6U+3t12llCRyTA=;
 b=sciznH6NA7eI1tioHlAiMXXaxxEkmd+PfztORIbY3jTwVuzGturpEkXCbR3UIJmLlH
 mECWgYfJiRdb5FvnnS7YioW4I3JWn2BxOhv+Mg7QxDI4qxpOJ6I8S4Cwnu4sH7wJWSvu
 bgM1JWEnYpdjfCss1NAAi1B+59Z9G1zMhnIO6kPEcrbAJpPMVNKZnoZ4n5tR1s4lsf2J
 QqB2KuFzFrSMUHc01I8epMtdcqr9mMzH1f5KYoD9ZnRwO4v0GKaoTlXB/BMgxlXADRfI
 XxzA82jMPOyx2xVCE5ug+MSjk7EBoR8et8+oi5EKjPDjGRQPILt49E7ZZZYnLWDivWcT
 SLGA==
X-Gm-Message-State: AOAM532t6qaUR/PuXWmHZ1hi6mTb1+4mlSDGkKvPSzLCOnqS+hrEej5H
 o1w8yE6NXCqJ7Bs9rVanPos=
X-Google-Smtp-Source: ABdhPJw65ZcmjWOmkFF4uogzLH35eLQ8onzgQaFSgowQsSRLWB/e35uC7LQ7y1Dc63+SWTav/W5nlA==
X-Received: by 2002:a17:902:323:: with SMTP id 32mr2946718pld.59.1597654646463; 
 Mon, 17 Aug 2020 01:57:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:25 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 02/10] sound: firewire: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:55 +0530
Message-Id: <20200817085703.25732-3-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/firewire/amdtp-stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f8586f75441d..ee1c428b1fd3 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -64,7 +64,7 @@
 #define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
-static void pcm_period_tasklet(unsigned long data);
+static void pcm_period_tasklet(struct tasklet_struct *t);
 
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
@@ -94,7 +94,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->flags = flags;
 	s->context = ERR_PTR(-1);
 	mutex_init(&s->mutex);
-	tasklet_init(&s->period_tasklet, pcm_period_tasklet, (unsigned long)s);
+	tasklet_setup(&s->period_tasklet, pcm_period_tasklet);
 	s->packet_index = 0;
 
 	init_waitqueue_head(&s->callback_wait);
@@ -441,9 +441,9 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 	}
 }
 
-static void pcm_period_tasklet(unsigned long data)
+static void pcm_period_tasklet(struct tasklet_struct *t)
 {
-	struct amdtp_stream *s = (void *)data;
+	struct amdtp_stream *s = from_tasklet(s, t, period_tasklet);
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 
 	if (pcm)
-- 
2.17.1

