Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988434B0D9B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 13:35:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9DA18DE;
	Thu, 10 Feb 2022 13:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9DA18DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644496537;
	bh=9Ie/+TI18lK3aq6nysZs8+rk4PylxVQwQHLEthBeq+g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXlyzq7TVB2Zc0fk+Ww1yo2KlxQ9jQNtBHsbb020zO1dowC71eEAC6mMI1K3nJ7zX
	 ttQDBbhprEm68/3xzPLHTUZgU1jaeR7oStIeGqsJUwXT5/Y++cvOxuPhftD8qTvD9k
	 fIxOlnxDlfEYbn6Ku6UPShSG4d7rVcgf9L243+dY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D4DF804FF;
	Thu, 10 Feb 2022 13:33:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37469F804AB; Thu, 10 Feb 2022 13:33:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E92F8016C
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 13:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E92F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RE62J1qU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lwkfCp6P"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 68BD1210E4
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644496429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z9xzNa926eGXPX+To+rmU6gRObRCXr8G59h+/oLBUI=;
 b=RE62J1qUov5/htMO0n0CDsFpFEgRmZoxuxSwkdpW8wxrMfOGqrZp3Y2jqAvMvqxDhUQOvn
 XzD3TMUYRJW5EqEKAysFNULf8N0JaDyPJqvM1fps+gy+KWDiZH7WTBBSarWR6zAuZDslQQ
 1RZAJKpJwd1W7W62YTeu97L2sSA2h28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644496429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z9xzNa926eGXPX+To+rmU6gRObRCXr8G59h+/oLBUI=;
 b=lwkfCp6P8Dbg5e3MKiukoPP5doYFYkbb8KNa6UJ4l1jMC6gwQ3DLroJkCK94IPSS4TfUu/
 n0sLYnLRoDhtZ2DQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 57826A3B89;
 Thu, 10 Feb 2022 12:33:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: memalloc: invalidate SG pages before sync
Date: Thu, 10 Feb 2022 13:33:44 +0100
Message-Id: <20220210123344.8756-3-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210123344.8756-1-tiwai@suse.de>
References: <20220210123344.8756-1-tiwai@suse.de>
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

It seems that calling invalidate_kernel_vmap_range() is more correct
to be called before dma_sync_*(), judging from the other thread:
  https://lore.kernel.org/all/20220111085958.GA22795@lst.de/
Although this won't matter much in practice, let's fix the call order
for consistency.

Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
Reported-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index f98f694e3ce4..6fd763d4d15b 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -541,9 +541,9 @@ static void snd_dma_noncontig_sync(struct snd_dma_buffer *dmab,
 	if (mode == SNDRV_DMA_SYNC_CPU) {
 		if (dmab->dev.dir == DMA_TO_DEVICE)
 			return;
+		invalidate_kernel_vmap_range(dmab->area, dmab->bytes);
 		dma_sync_sgtable_for_cpu(dmab->dev.dev, dmab->private_data,
 					 dmab->dev.dir);
-		invalidate_kernel_vmap_range(dmab->area, dmab->bytes);
 	} else {
 		if (dmab->dev.dir == DMA_FROM_DEVICE)
 			return;
-- 
2.31.1

