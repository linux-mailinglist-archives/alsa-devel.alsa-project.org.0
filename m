Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4CC634F5D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 06:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261551636;
	Wed, 23 Nov 2022 06:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261551636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669180234;
	bh=bjQqKcmryHkXDmZHRjB/NIC8LE2w6Ij22Gcz0VrKNWs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FjVZ/ymR7JEspnXUJ8o3jJ0gfYLZZabecsu+3ysGV/w6mpCOrYH3+5YcM/2qdfwMM
	 I+Vno4y6H5X28mqZ0D+m9J0rbCfVeWl11w2DMNeDj5R5LLafORSYq7vpJSqqvTA17c
	 8wOlnhhtuDbvPGPDatxlow0H1RDYX9wPgSDJXvgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1B7F8030F;
	Wed, 23 Nov 2022 06:09:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78C29F8025D; Wed, 23 Nov 2022 06:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7B7FF80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 06:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B7FF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S3Dabdu6"
Received: by mail-lj1-x22c.google.com with SMTP id u2so20208867ljl.3
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 21:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6EZVPCQ9tYvPlxmBB/8m8JgKohGYoHP0VzzYsSGdlI=;
 b=S3Dabdu626OdzBwUkfqoYTqYhEoBtgm5x1FuSW6NTc4b2Q4ahc5Itud+7lRAd9JPTB
 lXG2Hv9jeWcgWkPP0PI0XWoUbPb8qPCUgOKw/sjsN6acTd2gtUedDc1ToeXsAyYg3ZBD
 aPlVW1UTxgMUpftDOt4caqI5mLdlTT2luq68qjCaQN+I+JBYn+sdelcc42Sojz8u1bk0
 s+Ydqwv7v5K+V9KkFh9lQIFW4oox3IFKEgY96eUKA8mXdjIqH659Nmi0GYW8faysq1IA
 1hpvkBwEriwIvo5IPxllybzYrfnbUIDczGprXlMDVFtLNfWdcXXOuZVhLxS8G3H5YhX5
 AH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6EZVPCQ9tYvPlxmBB/8m8JgKohGYoHP0VzzYsSGdlI=;
 b=O8wECxctQinFN+nH/5IxJAxiMlxefDBLRVUsL882MWErMY3jR/QOTpIS8WG/JExuex
 uLGQBXXa6olxysSpr9izelR5nMB36M9RMkwzWlOFTpRmkfUi53xb4U+02Y8H/4ME54ik
 5GIBlSvVwSWHmjQiLVwkEpEU+oZwAjGmGQ5gAoxq67NINB9THapUYf4UOoVpqTVUc585
 SGCTwMRUtUB0FmFbIJnjy4V+R/LL/YpNdu7fH2i9Xu++yFLh9eT+48BwVyGPUy2Pg0/7
 wSwHPVCHs7XWl2WDr1/2ngYBKQcCSKOyhwkuERieXS6qwRllOliUvsHcRWAkv3uA3aaI
 MUuQ==
X-Gm-Message-State: ANoB5pll7XCt0xd5xK/CjtYxigNa3IId77zIzhqnCv7FvDHli1OXIsTv
 eAyXwG8wbaR+SSS+IuOBPiQ=
X-Google-Smtp-Source: AA0mqf6v15Z9YHPKylkspRS0gTHNHxtUVA6nL2db3RnaeACzrDh2ivO0e+tXmY3F0cHWqQdxucpzhQ==
X-Received: by 2002:a2e:9dcf:0:b0:279:70ee:571e with SMTP id
 x15-20020a2e9dcf000000b0027970ee571emr1834692ljj.249.1669180168295; 
 Tue, 22 Nov 2022 21:09:28 -0800 (PST)
Received: from localhost.localdomain ([2.56.241.21])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05651c022600b00277045dcb5bsm2087065ljn.97.2022.11.22.21.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 21:09:27 -0800 (PST)
From: Xiaolong Huang <butterflyhuangxx@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	baolin.wang@linux.alibaba.com
Subject: [RESEND PATCH] ALSA: rawmidi: fix infoleak in
 snd_rawmidi_ioctl_status_compat64
Date: Wed, 23 Nov 2022 13:09:11 +0800
Message-Id: <20221123050911.1045190-1-butterflyhuangxx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Xiaolong Huang <butterflyhuangxx@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The compat_status is declared off of the stack, so it needs to
be zeroed out before copied back to userspace to prevent any
unintentional data leakage.

Fixes: d9e5582c4bb2 ("ALSA: Avoid using timespec for struct snd_rawmidi_status")
Signed-off-by: Xiaolong Huang <butterflyhuangxx@gmail.com>

---

Reason for resend:
1. add Fixes line.
---
 sound/core/rawmidi_compat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/rawmidi_compat.c b/sound/core/rawmidi_compat.c
index 68a93443583c..6afa68165b17 100644
--- a/sound/core/rawmidi_compat.c
+++ b/sound/core/rawmidi_compat.c
@@ -80,6 +80,7 @@ static int snd_rawmidi_ioctl_status_compat64(struct snd_rawmidi_file *rfile,
 	if (err < 0)
 		return err;
 
+	memset(&compat_status, 0, sizeof(compat_status));
 	compat_status = (struct compat_snd_rawmidi_status64) {
 		.stream = status.stream,
 		.tstamp_sec = status.tstamp_sec,

base-commit: eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
-- 
2.25.1

