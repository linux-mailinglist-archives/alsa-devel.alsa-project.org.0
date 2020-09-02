Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766C425A43A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2F51819;
	Wed,  2 Sep 2020 06:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2F51819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019528;
	bh=fD7D97RF+EzSuU8xugzmMqcDcR3p4t9D5EdB3ZJn7GM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hWmtD5SIGjCFh835LaRy6D4DHultsl/+z6fuxVNCbTmmUyOqESCDcjSNO7nYsdgTb
	 HQTS9VedUZCOkr0pWYsDUQTY5GqewAZEeb/vCMmKbigpFn1c514J+zIM5qt4ntLCZO
	 GEQc7Y2jhvk4p3/HRsDt5qTUkg7Kbrx+yYwX4Nhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 447C1F802E0;
	Wed,  2 Sep 2020 06:02:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE06F802DB; Wed,  2 Sep 2020 06:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E732BF80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E732BF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aw8ufJR/"
Received: by mail-pl1-x641.google.com with SMTP id y6so1648034plk.10
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LdsvlK843OvHUKO3BvTM9ULTMfoE/b1eCx7N5gOQ7fw=;
 b=aw8ufJR/Zxuzp3V3cdeU8MncizZKkmAsoLzuFltqHudOuSEC3GZd70VuLZVjLYTg4x
 XQ8nrP8+7rj2GjuT++NgGbZOHC+vxEt0BUD39OHqeMR4vvsF2SuiU5ix+Ia9UYcgv4LS
 mhhjg7Zjn510I9rn8JwZTm20UgqkCJkOAP8Xr1D946JKdQdxsKFozJM33H4Ykfq7ZHqG
 2oVlXbzq1zZKCeqdVBXhFrrGQNs3EQ6eL+31qWnOCK2QZeLdjbPDpg9VFkqapyC5oFra
 C2KeN7uB8I3WBFZRGkqI4KRJEH01T12FZfesib9oHWaxK8r7Qqm4TWCw43F7qjYNeHqH
 /VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdsvlK843OvHUKO3BvTM9ULTMfoE/b1eCx7N5gOQ7fw=;
 b=uZJe9i9sQpeBUQdBcWwocxvqU9O78jRKcEJqUyIUWCOurWAENX/oqzYJbAJQjGZ7o0
 liUhY4g5GLYm//hCHLfFVqjx2Gm/3qYI2kbg93eB+F+D/mka64AJ/yKAk+E8SrJmk8da
 +2seUny+PNF1tcoR02mFRdFQ0nx4DBzE52wXatx3xYzwGoTL9w/mmkOlZNWKljT7cZeB
 3byZlM0ZkOAw39kDIAWNkFEGQz7tRcBmhA1kGJiPD05/gESmzECo6E7tUXom3k7EPPHc
 nBbB15NMJ9AX9rKWHIWaWvreE/BOHCBTgwLLDlrGICCt5bJHj5q3iB8cZLZYZJ9WBd5E
 sQIA==
X-Gm-Message-State: AOAM533py82iCLJdMr/PD/GhggcAZfkRmuct4RW+i2nqqCfkaMjKtCL2
 t1+VrLPKhsq6p/608hXjHQlXSn/saHrYsw==
X-Google-Smtp-Source: ABdhPJx/zehfDCXIDQbY2JBBV2a1VHy9Bl2xcHJ4Fva8Esde2W2acIaQn/HNv9ADTz0PeVU4C3Qa7A==
X-Received: by 2002:a17:902:e901:: with SMTP id
 k1mr412736pld.189.1599019359027; 
 Tue, 01 Sep 2020 21:02:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:02:38 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 02/10] ALSA: firewire: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:13 +0530
Message-Id: <20200902040221.354941-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902040221.354941-1-allen.lkml@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, Allen Pais <allen.lkml@gmail.com>, nicoleotsuka@gmail.com,
 Romain Perier <romain.perier@gmail.com>
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
2.25.1

