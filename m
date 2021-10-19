Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17019432DBA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 08:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A501E16BF;
	Tue, 19 Oct 2021 08:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A501E16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634623627;
	bh=DRAbboG8I0CpcUM+lm3rJRrzAS71C+ko8RyqZsrGR+Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TxU3h4GEAqsGWeb3purGm1mXxaYi5D5nY2qgTXuAx4XiFNB2fjNe5rOQ7804N4eEs
	 lfsHSWPpH16p5NcRQcZi+HxYmgofXTeoWPObOcWii3NG+bYqFtTMza6X5eFRi0kDhl
	 iwg/XfBhWdX5xaoGJvFbwf/EqPBXMqNpmo2gF5oY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C958F80254;
	Tue, 19 Oct 2021 08:05:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F503F80155; Tue, 19 Oct 2021 08:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30324F80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 08:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30324F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="k+Tu3Bcq"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yOJYYtnH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7323521977;
 Tue, 19 Oct 2021 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634623537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nCP88yCC9Gu2Zw6p/CXMzCKS6Te0lGIZhezxMCJfV/M=;
 b=k+Tu3BcqPTGMHAWzmuYTsCrS1MaB6tgDbTw1oJUH246ss9fvnaOJh6M+1AL6/g2DK7vcVc
 jZXOSyCPA0kexLh0DzmCCSIimK+oSNDwvJPoYyfy+HHxBjKXf/j+1t8xrorMusA0bQvupR
 rNRu6yIaPzG+10tjjtieDlvp7PA6tqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634623537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nCP88yCC9Gu2Zw6p/CXMzCKS6Te0lGIZhezxMCJfV/M=;
 b=yOJYYtnHRwQNVB+AunmdlnWRj+SNDsvfNhh6ITXliby7NMRzu4OZSVzYW1C4SBu0uOlxv+
 ADRI8wC+wtNpT3BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 60B00A3B84;
 Tue, 19 Oct 2021 06:05:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: memalloc: Drop superfluous snd_dma_buffer_sync()
 declaration
Date: Tue, 19 Oct 2021 08:05:35 +0200
Message-Id: <20211019060536.26089-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
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

snd_dma_buffer_sync() is declared twice, and the one outside the ifdef
CONFIG_HAS_DMA could lead to a build error when CONFIG_HAS_DMA=n.
As it's an overlooked leftover after rebase, drop this line.

Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20211019165402.4fa82c38@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index df615052dad4..653dfffb3ac8 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -97,9 +97,6 @@ static inline void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
 				       enum snd_dma_sync_mode mode) {}
 #endif
 
-void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
-			 enum snd_dma_sync_mode mode);
-
 dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset);
 struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
 unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
-- 
2.26.2

