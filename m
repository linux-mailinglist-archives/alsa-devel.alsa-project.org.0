Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F959472D35
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 14:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA341853;
	Mon, 13 Dec 2021 14:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA341853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639401967;
	bh=Yh4yu62D/8anXnooRgPkv65KXM0AAYyxozj2YtA9qTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fliz1OjTLeIFtfTPIg7JZR66FOUfZhuAECZqeNJZ1+YJS77jsjD3b/ynaAK+sOfQ3
	 pNNd5e/lncaAcMkz7oFMUitg59A4xmW99Z+sQ7EJhapfjFbiTjYgvp/A2J6SepFpfZ
	 jrkS/dM2LIWtMu3yErWiQJI+uRuc21jIkhnCObLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E3C6F8025D;
	Mon, 13 Dec 2021 14:24:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E76EFF8025F; Mon, 13 Dec 2021 14:24:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2208CF8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 14:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2208CF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bx39TpFp"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="3hyUGD3I"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 754181F3BA;
 Mon, 13 Dec 2021 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639401886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGzUh/JvQiXjMmLf4oWYlSjkcuzSqkoHgbLEfNm4UWc=;
 b=bx39TpFpnJhifMwuoJfr1LqXmXFdfw6ZVa8M0bqOts7qfrXC8bz2dsIDtcH/z7APJlrYF2
 yoSJd6P0utgqor+DvxZb4WCQnw4A4odNLiA12NGg8qVgexzi1e/8Zvfs6Q/7GYAp9b65Yb
 +ajTrVyDazBVzx2iqp7HMHrzG795IDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639401886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGzUh/JvQiXjMmLf4oWYlSjkcuzSqkoHgbLEfNm4UWc=;
 b=3hyUGD3Igj2T0XLRojFKGQt8Osw5p5QcDv9IHrkz/Rc4j/ILJjYXYuP0RVrKjFazR3niTw
 TwJ7QVFpFXVpzTBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6EAE5A3B8B;
 Mon, 13 Dec 2021 13:24:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: gus: Fix memory leaks at error paths in memory
 allocations
Date: Mon, 13 Dec 2021 14:24:44 +0100
Message-Id: <20211213132444.22385-2-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132444.22385-1-tiwai@suse.de>
References: <20211213132444.22385-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>
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

When snd_gf1_mem_xalloc() returns NULL, the current code still leaves
the formerly allocated block.name string but returns an error
immediately.  This patch covers the all callers to deal with the
release of leftover name strings in the error paths.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_mem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 5e3ff3137dd7..1509e3e5d30e 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -204,6 +204,8 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 		return NULL;
 	}
 	nblock = snd_gf1_mem_xalloc(alloc, &block);
+	if (!nblock)
+		kfree(block.name);
 	snd_gf1_mem_lock(alloc, 1);
 	return nblock;
 }
@@ -241,14 +243,22 @@ int snd_gf1_mem_init(struct snd_gus_card * gus)
 		block.ptr = 0;
 		block.size = 1024;
 		block.name = kstrdup("InterWave LFOs", GFP_KERNEL);
-		if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
+		if (block.name == NULL)
 			return -ENOMEM;
+		if (snd_gf1_mem_xalloc(alloc, &block) == NULL) {
+			kfree(block.name);
+			return -ENOMEM;
+		}
 	}
 	block.ptr = gus->gf1.default_voice_address;
 	block.size = 4;
 	block.name = kstrdup("Voice default (NULL's)", GFP_KERNEL);
-	if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
+	if (block.name == NULL)
 		return -ENOMEM;
+	if (snd_gf1_mem_xalloc(alloc, &block) == NULL) {
+		kfree(block.name);
+		return -ENOMEM;
+	}
 #ifdef CONFIG_SND_DEBUG
 	snd_card_ro_proc_new(gus->card, "gusmem", gus, snd_gf1_mem_info_read);
 #endif
-- 
2.31.1

