Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DBC44BBC3
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 07:32:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F3B1661;
	Wed, 10 Nov 2021 07:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F3B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636525956;
	bh=Jw0cqgNKCs0QwAoM4aCwovUK1Bqc4kR2+Z4RFbemkLE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g7XtV7NxDHvI+T/FRQF4DIxVWlivsQq+Ks1K4A/iUoUAAa1jtL+zknJRzJhheIfd0
	 lZr+Op+MY4G3B6qeC3EIrYdo/3KljbNUjgBlUY/FkWI9iZNTI3Mrfyd2EKsmW4lGi/
	 Ar5mAq9ZCP577xL9CRsih6x/Z7nDpDtmcjnOEH9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 523F3F804B1;
	Wed, 10 Nov 2021 07:31:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E0BF8049E; Wed, 10 Nov 2021 07:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6623CF800C9
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 07:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6623CF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cMDZjD88"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="s9GLbrLF"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AB316218A4
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636525861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=cm42KMxRF5WeNk1z33NSxl4vD52p+yRdYwPYzamQDK8=;
 b=cMDZjD88EGPnMs92dJ6BNjQ//KTDeftBkpZUyXtH2/d1HkCYfAXIjaBr2A9zd5htAPvx98
 zex3mJhjpejdYDAiHizP+28q/9P4qJYn3PW4grw6MJBOUfn/PruX3gDjtKhVuDR6WPRgJB
 eaap/LUesUoCDHAFPr+2HRQEaVUh9vo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636525861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=cm42KMxRF5WeNk1z33NSxl4vD52p+yRdYwPYzamQDK8=;
 b=s9GLbrLFfOrWRf/CmX3zStEu9rV7tJONaIW5PPI9d1zohFjlxGnDQpOWma6nX/r6ipIVIp
 DuMT5qJDbn7m0iCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 981C5A3B81;
 Wed, 10 Nov 2021 06:31:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Remove a stale comment
Date: Wed, 10 Nov 2021 07:31:00 +0100
Message-Id: <20211110063100.21359-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The comment about the reused vmalloc helpers is no longer valid after
the recent change for the noncontig allocator.  Drop the stale
comment.

Fixes: ad4f93ca4138 ("ALSA: memalloc: Use proper SG helpers for noncontig allocations")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 8c362bb5b81a..9fc971a704a9 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -615,7 +615,6 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.free = snd_dma_noncontig_free,
 	.mmap = snd_dma_noncontig_mmap,
 	.sync = snd_dma_noncontig_sync,
-	/* re-use vmalloc helpers for get_* ops */
 	.get_addr = snd_dma_noncontig_get_addr,
 	.get_page = snd_dma_noncontig_get_page,
 	.get_chunk_size = snd_dma_noncontig_get_chunk_size,
-- 
2.26.2

