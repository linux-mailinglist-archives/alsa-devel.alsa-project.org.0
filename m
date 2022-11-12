Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74618626830
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Nov 2022 09:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD84166A;
	Sat, 12 Nov 2022 09:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD84166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668242906;
	bh=9BteHjKsflNykNF8/ySVN1UUU/7VzmcUg7sJPFRIc7w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JHkL3PqeBNtOXMm9CJHbN4KrZB6IGWIQMu6L2r5HPF1TvcQK4q0556WVTog9hUAtf
	 YOnzxkzChxrzmGMNx9dJXf5YJ7DzYGV3KceohQ5lcJuDgvpDhWAz2SHfp7Yz4dcXy7
	 rYgGJWhfEwrJtvv+f8PfsSwYYVF7fStrByL8jsfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 745C5F800CC;
	Sat, 12 Nov 2022 09:47:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA955F8026D; Sat, 12 Nov 2022 09:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD63EF800CC
 for <alsa-devel@alsa-project.org>; Sat, 12 Nov 2022 09:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD63EF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FuOAmvM8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4gs15fnk"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 265551FB59;
 Sat, 12 Nov 2022 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668242843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CLl/qOiimfZ6JLOg5b9zmEq5zcqAuFhaT2ZJekNkxlE=;
 b=FuOAmvM8++5Atx38GXKsxTHxbHTM7782PqyH/y0qzpP97XYotmEhkYGwM4p2xwQI78GivH
 DnBP26XCkg6c2rb36ZXid4PFrNscBptcjIVhlG1Nm1QIKEI1NPmA7dJOrsOVzc9NDyJlxq
 REUP4+Po0XOdaH/yqDrTxaqczYe8yc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668242843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CLl/qOiimfZ6JLOg5b9zmEq5zcqAuFhaT2ZJekNkxlE=;
 b=4gs15fnkoKggu2UEJ/EHyMznPGoy+LJN7EbZiX7E4VDWyusne8+HqIT+uymgwOlmWovQzE
 SIsLukUM6Hk9wcCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BFCF13A08;
 Sat, 12 Nov 2022 08:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id axwQAptdb2OJIAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sat, 12 Nov 2022 08:47:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Try dma_alloc_noncontiguous() at first
Date: Sat, 12 Nov 2022 09:47:18 +0100
Message-Id: <20221112084718.3305-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

The latest fix for the non-contiguous memalloc helper changed the
allocation method for a non-IOMMU system to use only the fallback
allocator.  This should have worked, but it caused a problem sometimes
when too many non-contiguous pages are allocated that can't be treated
by HD-audio controller.

As a quirk workaround, go back to the original strategy: use
dma_alloc_noncontiguous() at first, and apply the fallback only when
it fails, but only for non-IOMMU case.

We'll need a better fix in the fallback code as well, but this
workaround should paper over most cases.

Fixes: 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer with IOMMU")
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/CAHk-=wgSH5ubdvt76gNwa004ooZAEJL_1Q-Fyw5M2FDdqL==dg@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 6a81aaab25ab..ba095558b6d1 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -542,8 +542,10 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
+	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
+				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!get_dma_ops(dmab->dev.dev)) {
+	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
 		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
 			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 		else
@@ -551,9 +553,6 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 		return snd_dma_sg_fallback_alloc(dmab, size);
 	}
 #endif
-
-	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP, 0);
 	if (!sgt)
 		return NULL;
 
-- 
2.35.3

