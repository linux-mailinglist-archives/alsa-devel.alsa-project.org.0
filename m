Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98116472EA3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 15:16:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FFFA17C2;
	Mon, 13 Dec 2021 15:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FFFA17C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639404995;
	bh=yeTMaAF3tL9Sx4MB9qvubPl1znUPkScxJtwN9BkBPic=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YYxh89S83HSUe11Gbb4ZBocGm6yc92ekrbYI93u7PxjdYFYTNiSEUen35wlwW+Xfc
	 0ZKhVNwlZi6YJTncm8rITKEYScwsRP/6N2CHwPWPly8GqWNyrQElFxg8AiWLP2b6jO
	 ZEdvrEPmviDtPE/oyHkQEUVspnmt5GXrbvdGx2SE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 732AFF8025F;
	Mon, 13 Dec 2021 15:15:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15809F8025D; Mon, 13 Dec 2021 15:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46F49F80229
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 15:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F49F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="m4stgfFo"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Yqi3cH72"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A765E212B6;
 Mon, 13 Dec 2021 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639404913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jLP7rNODZGN+ziAgIV0C35AwAc6cjHYFmazSLR56yYo=;
 b=m4stgfFoEL/9VGEck5id3PR4zdx28yxJKK3nL5KgdBMGLsqdg/YVPIaPkjfP5DLDlzY+Pa
 oYVoxgjz5uSCYmyf3ulfaYTOSM3GLzOMb3ow3p6l3SA5gTTNqkUY6XHg1qr287T06BSUwr
 ByjRxgXEJv2IaKdfQylAANPID68pq40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639404913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jLP7rNODZGN+ziAgIV0C35AwAc6cjHYFmazSLR56yYo=;
 b=Yqi3cH72z0xkUq0e1a916VNrwBrtEgAErhnTKOdKkD17WOvflwzlL/+U5PGEImZKuGnfh1
 X+r6zyhOyvKenpBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 61E81A3B8A;
 Mon, 13 Dec 2021 14:15:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: gus: Fix memory leaks at memory allocator error paths
Date: Mon, 13 Dec 2021 15:15:12 +0100
Message-Id: <20211213141512.27359-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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
immediately.  This patch does code-refactoring to move the kstrdup()
call itself into snd_gf1_mem_xalloc() and deals with the resource free
in the helper code by itself for fixing those memory leaks.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Link: https://lore.kernel.org/r/20211213132444.22385-2-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_mem.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 5e3ff3137dd7..3e56c01c4544 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -24,8 +24,9 @@ void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup)
 	}
 }
 
-static struct snd_gf1_mem_block *snd_gf1_mem_xalloc(struct snd_gf1_mem * alloc,
-					       struct snd_gf1_mem_block * block)
+static struct snd_gf1_mem_block *
+snd_gf1_mem_xalloc(struct snd_gf1_mem *alloc, struct snd_gf1_mem_block *block,
+		   const char *name)
 {
 	struct snd_gf1_mem_block *pblock, *nblock;
 
@@ -33,6 +34,12 @@ static struct snd_gf1_mem_block *snd_gf1_mem_xalloc(struct snd_gf1_mem * alloc,
 	if (nblock == NULL)
 		return NULL;
 	*nblock = *block;
+	nblock->name = kstrdup(name, GFP_KERNEL);
+	if (!nblock->name) {
+		kfree(nblock);
+		return NULL;
+	}
+
 	pblock = alloc->first;
 	while (pblock) {
 		if (pblock->ptr > nblock->ptr) {
@@ -198,12 +205,7 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 	if (share_id != NULL)
 		memcpy(&block.share_id, share_id, sizeof(block.share_id));
 	block.owner = owner;
-	block.name = kstrdup(name, GFP_KERNEL);
-	if (block.name == NULL) {
-		snd_gf1_mem_lock(alloc, 1);
-		return NULL;
-	}
-	nblock = snd_gf1_mem_xalloc(alloc, &block);
+	nblock = snd_gf1_mem_xalloc(alloc, &block, name);
 	snd_gf1_mem_lock(alloc, 1);
 	return nblock;
 }
@@ -240,14 +242,12 @@ int snd_gf1_mem_init(struct snd_gus_card * gus)
 	if (gus->gf1.enh_mode) {
 		block.ptr = 0;
 		block.size = 1024;
-		block.name = kstrdup("InterWave LFOs", GFP_KERNEL);
-		if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
+		if (!snd_gf1_mem_xalloc(alloc, &block, "InterWave LFOs"))
 			return -ENOMEM;
 	}
 	block.ptr = gus->gf1.default_voice_address;
 	block.size = 4;
-	block.name = kstrdup("Voice default (NULL's)", GFP_KERNEL);
-	if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
+	if (!snd_gf1_mem_xalloc(alloc, &block, "Voice default (NULL's)"))
 		return -ENOMEM;
 #ifdef CONFIG_SND_DEBUG
 	snd_card_ro_proc_new(gus->card, "gusmem", gus, snd_gf1_mem_info_read);
-- 
2.31.1

