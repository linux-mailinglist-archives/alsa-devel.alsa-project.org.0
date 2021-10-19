Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A36432DCF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 08:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23DF16D7;
	Tue, 19 Oct 2021 08:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23DF16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634623652;
	bh=UXVuND83qrjIV79J8nfrjGNSrtf8NHZGFECjdvBnQB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZ2NuNtUe+sEXPnSW//f3gvMILUKsMq5SLI4tCQXCZwGCLqdxkRPbdwuYCe1QFtHD
	 A2nLJWdVdhN2jZf2KPRN/MFD+msDmi+fHHm43ASLN5XL806vHsDsbm53N/BeG6yKj3
	 DCke7MWqu+zGsD4duet3jA6tYBa+ryhAK3yKDEHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C88AF804EC;
	Tue, 19 Oct 2021 08:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E7C8F804CA; Tue, 19 Oct 2021 08:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3065BF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 08:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3065BF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="s3RoNW5A"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="SKu+as1v"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8051A21979;
 Tue, 19 Oct 2021 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634623537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apDojkGq12WgI9sTaBZ8VFrcC1v1XHRpnuxM7CTxbvY=;
 b=s3RoNW5AlFjf/h47m2xCQeZJ5hp66BFOHXaEVFAviwjtmOpXvIey6w5xO7gWjGM0caMYsw
 1gsXFfg241ge/YXJgX4xx2WFl9U18YwJXXVIwYh089nh85iyCLlHXGLqxpg9TaaDjCg3oE
 H0CRPrpikddgRJkOpWZfuvcUgBS+cU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634623537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apDojkGq12WgI9sTaBZ8VFrcC1v1XHRpnuxM7CTxbvY=;
 b=SKu+as1v3SM52HxnFbmm2ZAk0V0XRoRbSL6Toc2r/fBm40zb/4bNOW5vjg5d7WiMs824ER
 JW/vJVMc4dNZbcBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6EED3A3B85;
 Tue, 19 Oct 2021 06:05:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: memalloc: Fix a typo in snd_dma_buffer_sync()
 description
Date: Tue, 19 Oct 2021 08:05:36 +0200
Message-Id: <20211019060536.26089-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211019060536.26089-1-tiwai@suse.de>
References: <20211019060536.26089-1-tiwai@suse.de>
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

It caused a warning for kernel-doc build.

Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20211019165402.4fa82c38@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index acdebecf1a2e..99cd0f67daa1 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -196,7 +196,7 @@ EXPORT_SYMBOL(snd_dma_buffer_mmap);
 /**
  * snd_dma_buffer_sync - sync DMA buffer between CPU and device
  * @dmab: buffer allocation information
- * @mod: sync mode
+ * @mode: sync mode
  */
 void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
 			 enum snd_dma_sync_mode mode)
-- 
2.26.2

