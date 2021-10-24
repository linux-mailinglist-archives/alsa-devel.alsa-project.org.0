Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21943896C
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 16:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6430F166B;
	Sun, 24 Oct 2021 16:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6430F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635084289;
	bh=hfXpwcP1bJhJVJng1tciJf7XqBgaVYCSDgJ9qCaNNx0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ezr/2XyyjIiWdU5O35lEhBFgiVGTh9qI/JGx3/wI7jx1+4oZmSSc5P434sQ1chzAX
	 EnGYInUTrBW45khJ9Kbl8g2ejQnNyW5UC7AFFyzURuaLYbkMg5bdml8ohsFX6sBUSN
	 +//LO5G5LrsdgVe1acpVZ9zotYciqR0GKcy7hpHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB439F802E7;
	Sun, 24 Oct 2021 16:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D663CF802C8; Sun, 24 Oct 2021 16:03:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B7B8F80086
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 16:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B7B8F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PImFOx9H"
Received: by mail-lj1-x232.google.com with SMTP id g8so5227931ljn.4
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/W/OsBp6xJzh/cYmtq7Inyjl9AOVVVrF3nxtQ0n7lDc=;
 b=PImFOx9H9ccHDD0utj/Y0sUbcV0Kq1Bi2LAbSgpZN2uCw6tTT7GhJnt3jArN7AXgMQ
 RUZfpZ8NEYm1xp49QexBcK4tpCJdoBiIV6r7Ktsm8fX37vbIGATWQSE9wcD/Y8GqBQIv
 piFiBfByjImqUg2o5XcX48Y5EqmJsUBTxWtB4Z17qZNTOucGlgAKKEz7sRw/cU97mmgE
 0hEqNifESwfmDlYwV0HHBLXkK0KPtkONLbG0Vm73VJRpKR+5EyE2zGkbgNrwcx9WRur/
 tFCLwD6iOaXiQSGD93sHT9oh+y52TFWn95Ce9JBu3zgCCpvRSfGBP6owi1VtIFlQ5esj
 sR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/W/OsBp6xJzh/cYmtq7Inyjl9AOVVVrF3nxtQ0n7lDc=;
 b=yDWY1cYfc0i7ejhXGtC5gAYAdUR78MalGfzjosIJJuoEdQxFvsJcztE6jPryNEVx5i
 wPMDqRZ3RP8Z3w+2pYtSWFHMwHWmM/KKzOEEh4O6eB9UFUzFT1Srj1UmVV/2eckSwxdZ
 3MrpEb6pfoYzjTUoWA1gAEwwdAIqmOutHYBV59pEi02YTo1yFEOQfQEeNFtRvVmzS8QO
 rZnxseSyGDKejGfWofNFHC6Cfh0E03egZRG/5oc8O+H7NT3Z0ldum2CpPPjzMQh9I5av
 OHOKA/gyi8cxm7BPV4kCFkY8o43Bq2AVc+PYjQIwQAPMWRNoHlyk5HktZmiGt9TL4kj7
 PyfQ==
X-Gm-Message-State: AOAM533poGFjvYiqWe4DnXz5XbbHIyoUVEli+EmXXHSwPa5M7kY0MHpg
 tDuq43CKMjYOf/Jp+Lby9vg=
X-Google-Smtp-Source: ABdhPJxREqSAbVHKWxe7swgOwUQYV6FCh+IUORKGWGaHUrHdgywmAglXIA1GDeH6RvvyrkgoV8N6SA==
X-Received: by 2002:a2e:9d89:: with SMTP id c9mr12713826ljj.125.1635084197876; 
 Sun, 24 Oct 2021 07:03:17 -0700 (PDT)
Received: from localhost.localdomain ([94.103.235.8])
 by smtp.gmail.com with ESMTPSA id i28sm1452285ljn.122.2021.10.24.07.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 07:03:17 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, joe@perches.com,
 lars@metafoo.de
Subject: [PATCH next] ALSA: mixer: fix deadlock in snd_mixer_oss_set_volume
Date: Sun, 24 Oct 2021 17:03:15 +0300
Message-Id: <20211024140315.16704-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pavel Skripkin <paskripkin@gmail.com>, alsa-devel@alsa-project.org,
 syzbot+ace149a75a9a0a399ac7@syzkaller.appspotmail.com,
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

In commit 411cef6adfb3 ("ALSA: mixer: oss: Fix racy access to slots")
added mutex protection in snd_mixer_oss_set_volume(). Second
mutex_lock() in same function looks like typo, fix it.

Reported-by: syzbot+ace149a75a9a0a399ac7@syzkaller.appspotmail.com
Fixes: 411cef6adfb3 ("ALSA: mixer: oss: Fix racy access to slots")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 sound/core/oss/mixer_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index d5ddc154a735..9620115cfdc0 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -313,7 +313,7 @@ static int snd_mixer_oss_set_volume(struct snd_mixer_oss_file *fmixer,
 	pslot->volume[1] = right;
 	result = (left & 0xff) | ((right & 0xff) << 8);
  unlock:
-	mutex_lock(&mixer->reg_mutex);
+	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
-- 
2.33.1

