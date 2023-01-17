Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780E66E02C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:19:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6E2F68F2;
	Tue, 17 Jan 2023 15:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6E2F68F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673965144;
	bh=UMHe04P6ii9tzbFiy/D8r5Ujeyo9EUUXTNra99ebVRQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=u27FbWAvsICuhEejU+U6Tnc8IUwIMbcpIj53g1bND538ITyvwCAXYInZz0D2+TzrV
	 JVJO7rcGL0qFReH12Z/oa1r/u/ac2oQIZt748Cz7R1SOjbO9XRboGpnfBo/5BXNIJN
	 W2Ti3SnF7Xx4g1R1jeC1UlBN/QKUmEjYFrbb/4Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FADFF80083;
	Tue, 17 Jan 2023 15:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ECD1F8047B; Tue, 17 Jan 2023 15:18:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A36E8F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36E8F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JsENXzV6
Received: by mail-wm1-x32b.google.com with SMTP id g10so22355542wmo.1
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V/31Zx3eFGec3nVJb1oXQa8scv6g71AJ2XVF1SMXsjo=;
 b=JsENXzV6Lcf38ecr6c11Q6jS0Qc0Xz4sxWJ8XXr9w+6I6yQYTFU/kD3TYBqxQ7rv7+
 PAt5XdD25KohEDXfAc3mZ9slNyHRsZLQ8xqy6sBjF1v6p85u3eg16Lu8MJzqMfU42WDB
 o6vxwbyQRB/5fGDaDckdJ6GNPSwzvBL8prscTe0JDAvHLcN/pCtmLskKBZjwYPIOCt1l
 Lmnw+kuZqIQG9nC3Elv2Ot5kC3jIs8/cunsn38HEUu4oyuSEdBKKb7WVar4L0fDhvWZa
 wsEOrNQ5b16T47/LLxgPHFFSoQAJX3KZuutYb/DCXYfmwLd1CTizC2qTbr514ZS9xC7a
 PEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V/31Zx3eFGec3nVJb1oXQa8scv6g71AJ2XVF1SMXsjo=;
 b=AjablQU+FANtsyZayv5f8KfB6y3Z20BHJr+HHzWHKsYFsM64WXKZuA6Y9JWpFeEwL3
 dwfp0riMzZv8O7uO3diUbugt4+n2wwDdief/HzM7veYvX7ywJfsJJKvxPPIND8jpjqAv
 ayFYbWhq2kHUCqqwlc3V36Pi2YUkr1E15baaQIucDr7J1dy7R0/xvkgxA5QLi3IBnOBU
 HZdOzcndoAWNFHjZV0urTi5bNbBEGufVJbF6dbBoCOAOOHM3d+GJgv6WctA16NPDCUo8
 kjkVlQlv3nH3N2WN8tqCmBdcse563IfPJ7G/dS2GV7k6mtDxnMNzGWyU8anXp++u+/MN
 +L4w==
X-Gm-Message-State: AFqh2kopilXUOcFg7nsDuJuvs628sYoa+izULVMCBjszIcsyLi3yiBOF
 HeXHQrBKcIxqVtr+DzIOMJw7dIiW8GWv4g==
X-Google-Smtp-Source: AMrXdXv13PeROVeFKbk7cnsb5gc6/H/L0Wzq8HMm9OUe+9N3rMROib28v6Y7pnDQc+irUC7Ne1v3JQ==
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr3164709wmf.16.1673965080509; 
 Tue, 17 Jan 2023 06:18:00 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b003daf6e3bc2fsm11093626wms.1.2023.01.17.06.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 06:18:00 -0800 (PST)
Date: Tue, 17 Jan 2023 17:17:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH] ALSA: fireface: fix locking bug in ff400_copy_msg_to_user()
Message-ID: <Y8at+W/7OGvEBY8O@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The ff400_copy_msg_to_user() function drops the spin lock to call
copy_to_user().  However, if the copy_to_user() fails, then it must
take the lock again before returning.  Failure to take the lock leads
to a double unlock in the caller, hwdep_read().

Fixes: acdebd8b4c0c ("ALSA: fireface: implement message parser for Fireface 400")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/firewire/fireface/ff-protocol-former.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index f58008762fe6..fa41de978756 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -680,28 +680,30 @@ static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long cou
 	struct ff400_msg_parser *parser = ff->msg_parser;
 	u32 type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE;
 	long consumed = 0;
+	int ret = 0;
 
 	if (count < 8)
 		return 0;
 
 	spin_unlock_irq(&ff->lock);
-
 	if (copy_to_user(buf, &type, sizeof(type)))
-		return -EFAULT;
-
+		ret = -EFAULT;
 	spin_lock_irq(&ff->lock);
+	if (ret)
+		return ret;
 
 	count -= sizeof(type);
 	consumed += sizeof(type);
 
 	while (count >= sizeof(*parser->msgs) && parser->pull_pos != parser->push_pos) {
 		spin_unlock_irq(&ff->lock);
-
 		if (copy_to_user(buf + consumed, parser->msgs + parser->pull_pos,
 				 sizeof(*parser->msgs)))
-			return -EFAULT;
-
+			ret = -EFAULT;
 		spin_lock_irq(&ff->lock);
+		if (ret)
+			return ret;
+
 		++parser->pull_pos;
 		if (parser->pull_pos >= FF400_QUEUE_SIZE)
 			parser->pull_pos = 0;
-- 
2.35.1

