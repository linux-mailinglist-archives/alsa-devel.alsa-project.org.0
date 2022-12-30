Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E282E659AAC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 17:49:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E691F224E;
	Fri, 30 Dec 2022 17:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E691F224E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672418973;
	bh=h0Do23/FpJ2YEv83ft3tgR+jDkYILCVOJKmZnXxsfSs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Vu8QvZh+on95mMio12ZmkkZThGEOWvZuNknFZRcv/0zfUjvyHvRPnVSCDDpXgaJmY
	 Q6/uhY1aWKRtd556JjyVuT9bnTv0VY0RhcZnd32D28kh0LPs7ODcLRZmJW6GhDCOoK
	 sGqSbIleLWSNnw5XOqQ250i7qe41VeJuUK0jqJvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E041F8042F;
	Fri, 30 Dec 2022 17:48:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C371CF8042F; Fri, 30 Dec 2022 17:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED9CDF8023B
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 17:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9CDF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V40uo394
Received: by mail-ed1-x535.google.com with SMTP id d14so31078176edj.11
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 08:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hZ6UJDiHWKO+zV4cf8pnlGHrPEiRJn9V5Yj43ClWpe0=;
 b=V40uo394vdWXBXNTgUP/6bEVIIAI8WpqJGPD+hC9pTETJuFtuokCG40XUGgB8XEQyh
 FgRA3WD+1X5fG4zk4WW/rjZhHG31qF1yPkHKBTENjKE3pCf0TTbuxxGNFSKNplD4TQ0k
 kEWNZuHSyIMnvRwiwW0NCIRUEgCz5aVvFIiUCPLdUW/CneSKh2eXPdAD8Pg+iMg11SNq
 rTpHwxPDm1Y4zy/6lI/f3+FDf3q6mal62Vp8M20teujWNhRiGVsn3Ghk3YL5NjptHPY/
 rM2h3ydp6bTTloAVcb5uvpZBqoIsTLTAY6+l5pK2maRyDrW6RVNeAI1bFVrqAHcIv1uZ
 JUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hZ6UJDiHWKO+zV4cf8pnlGHrPEiRJn9V5Yj43ClWpe0=;
 b=MhHdDVKzHazywMyIdBNlIyJtTfLycD3LBoc+6wIuCf80198DfC4r2DU4rphqowGpRc
 V8STG91+JcddJBUU09sQaLdihZQNbbQHH7p9qHrxOxEAo1E4ER7TUMNBx4l8fY7tDDiR
 0jRZgfFlZI6ftFmRNnr/V3121e1B6fuf+/3TFL9td+vr/GfJM4xz9rMylY/LkaxAPnmU
 feFhTV2ja8bvOp0HwJoBB14IdJ6i5D29Mz2nh+Y1odZRHkwDISXeXPVAOpII9tv6UmId
 LhrtJ5MW2wClYohMv6ngrp6p7dq4zoFHc+XlSaO5wahaJ9TqA+an8rqkqpqWYWLsEKcs
 sXgg==
X-Gm-Message-State: AFqh2kp6XP57VE2f0aDlnb9/Ad3MULALg/RyDaTnrvbZGk3kxdjBHpPZ
 tAi2xLOegyya/1Po9cnKp16D5BTp714=
X-Google-Smtp-Source: AMrXdXteYX6Y+WMrDE6regOXrurRz7RuvN07IDKUVeMsISm6SH2SeVKnwDqm9uh5s/YySAVuIm9y0A==
X-Received: by 2002:aa7:c505:0:b0:47f:2419:336c with SMTP id
 o5-20020aa7c505000000b0047f2419336cmr27036999edq.25.1672418906213; 
 Fri, 30 Dec 2022 08:48:26 -0800 (PST)
Received: from localhost.localdomain (awyoung.plus.com. [81.174.138.22])
 by smtp.gmail.com with ESMTPSA id
 kz26-20020a17090777da00b007c1a6692aeesm9739612ejc.189.2022.12.30.08.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 08:48:25 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] pcm: rate: fix last_commit_ptr boundary wrapping
Date: Fri, 30 Dec 2022 16:48:14 +0000
Message-Id: <20221230164814.901457-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de, Alan Young <consult.awy@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Wrap last_commit_ptr using boundary. Was just wrapped to 0, which is
correct only if the buffer size, and hence the boundary, is an integer
multiple of the period size.

Signed-off-by: Alan Young <consult.awy@gmail.com>
Fixes: 467d69c5bc1 ("Fix CPU hog with combination of rate plugin")
Fixes: 29041c52207 ("fix infinite draining of the rate plugin in SND_PCM_NONBLOCK mode")
---
 src/pcm/pcm_rate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index e5d8eddd..c8076859 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -1018,7 +1018,7 @@ static int snd_pcm_rate_sync_playback_area(snd_pcm_t *pcm, snd_pcm_uframes_t app
 		slave_size -= rate->gen.slave->period_size;
 		rate->last_commit_ptr += pcm->period_size;
 		if (rate->last_commit_ptr >= pcm->boundary)
-			rate->last_commit_ptr = 0;
+			rate->last_commit_ptr -= pcm->boundary;
 	}
 	return 0;
 }
@@ -1163,7 +1163,7 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
 			if (commit_err == 1) {
 				rate->last_commit_ptr += psize;
 				if (rate->last_commit_ptr >= pcm->boundary)
-					rate->last_commit_ptr = 0;
+					rate->last_commit_ptr -= pcm->boundary;
 			} else if (commit_err == 0) {
 				if (pcm->mode & SND_PCM_NONBLOCK) {
 					commit_err = -EAGAIN;
-- 
2.31.1

