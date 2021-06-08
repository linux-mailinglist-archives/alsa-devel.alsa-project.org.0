Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12C39F92F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843E6178F;
	Tue,  8 Jun 2021 16:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843E6178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162687;
	bh=sja7HEwjgMs558F1bxzooVXJUHNoGot0vtKzIrhs86s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LT5WvUHKQi/AnAw8u26RWeq8ChfUzmp9YK9L2EFkkPY71hu0xWDaNM6CRgqTDpIsQ
	 3qEmgBtb383nIKD1InrTWiPzWZVlxDCx3IaYSIUeE5yumoGYjYC3DdNAh4QEf1gtie
	 gZtfsrj4gPXSXITm7RhbUog5/PzX6fEM3oOaN8sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CC7F8075B;
	Tue,  8 Jun 2021 16:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C34B4F80687; Tue,  8 Jun 2021 16:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55C53F80524
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55C53F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="djDzrJvr"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="LnUjI4EY"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 126E5219FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WI5ANRs2NFILkPRAaTEMuBWH+cReSJrAzsZ6HYYz1us=;
 b=djDzrJvrNbF+BBlcM0BD/z1IA9nYEwZGsdmkvcmXa5B0igRs+Ixpn/wd6H5JUvIkWDDRND
 BA2dtBw88nDuTgDVWNJqBem29QIM48jGZ5Kl3/LtIeoNf/h7/c8MeZHFJMvy1vPzI0QvAR
 UMO+/HZ/rQV7R4uSJ6/+dnyhdM5DhR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WI5ANRs2NFILkPRAaTEMuBWH+cReSJrAzsZ6HYYz1us=;
 b=LnUjI4EYS/Mxva6ZORtt8V8yxawmu9Yx6bXLNN/YcMDDnghUKtAFd+35vniFunzu/N0dHf
 R2pe5/Hn5EUcgAAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 04467A3B88;
 Tue,  8 Jun 2021 14:05:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 66/66] ALSA: parisc: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:40 +0200
Message-Id: <20210608140540.17885-67-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

PARISC harmony driver code contains an assignment in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/parisc/harmony.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index f2ca0a701987..1440db8b4177 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -915,10 +915,9 @@ snd_harmony_create(struct snd_card *card,
 	spin_lock_init(&h->mixer_lock);
 	spin_lock_init(&h->lock);
 
-        if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-                                  h, &ops)) < 0) {
-                goto free_and_ret;
-        }
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, h, &ops);
+	if (err < 0)
+		goto free_and_ret;
 
 	*rchip = h;
 
-- 
2.26.2

