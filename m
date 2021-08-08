Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE46A3E398A
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Aug 2021 10:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D5710E;
	Sun,  8 Aug 2021 10:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D5710E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628409734;
	bh=CFTDNQQ1O9lN7szaFTEgG2oZGeC/XaFZMuPM0wcv00s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VMOSjbXsEZCvuFLKLNNOulYrLJhulnkj24gN+fqpASYmjqzgC344TaaDwWTFxnKn3
	 QH7RABw280NcbdhnGVHaT7zXRxW1nfCcROujxaTkYRHHB427SzVtqR45LYwgnuRz+m
	 Aco502FK9DU8IAwLGe3zjt1XZHSmgK9M2pQX5pSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6BDAF800C9;
	Sun,  8 Aug 2021 10:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4ECDF801DB; Sun,  8 Aug 2021 10:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF33F8007E
 for <alsa-devel@alsa-project.org>; Sun,  8 Aug 2021 10:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF33F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="gTj1Zy61"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0hxzhkni"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D482C21EEE
 for <alsa-devel@alsa-project.org>; Sun,  8 Aug 2021 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628409635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9ZLEk7c/q+wskQ6xoHcW6sk9EzNUBb7H3aWLZ6m+7Gk=;
 b=gTj1Zy61pXMKxHQw2Xi3CU7lMqudJYqio7dSQ6Arn18YBfZ561/uKHnm1xT02onpbEhxUP
 KSIhDJTHw0CUV8qfAkXvKSyw+haP8m2QFgA6QalKhUjYMWAHUcd4oYQj6O0EJAIBoy0aJD
 t9tz2NWSlOvnNgRzStVE+ZRCzogFL/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628409635;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9ZLEk7c/q+wskQ6xoHcW6sk9EzNUBb7H3aWLZ6m+7Gk=;
 b=0hxzhkniqX8GFtUaYxvocuAKo6zNEGetWw7UuNdueqxaiYL4AzMPivnN6g/rxPxXkTlJU6
 LPtRBuEB5IyHD4Dg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C6923A3B8A;
 Sun,  8 Aug 2021 08:00:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Fix mmap of SG-buffer with WC pages
Date: Sun,  8 Aug 2021 10:00:34 +0200
Message-Id: <20210808080034.20337-1-tiwai@suse.de>
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

The code refactoring to move the WC page handling into the common
memalloc layer caused a breakage for HD-audio HDMI.  I overlooked that
the driver is using the SG-buffer, which isn't covered by the patch.

This patch adds the mmap workaround for WC pages to SG-buffer
handler.  A caveat is that it falls back to the default handler by
returning an error after setting the pgprot, so it won't work in all
cases but merely for PCM (which is currently the only use case).

Fixes: 623c10108338 ("ALSA: memalloc: Fix pgprot for WC mmap on x86")
Reported-and-tested-by: Andy Lavr <andy.lavr@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/sgbuf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
index 9666a95f5a5c..8352a5cdb19f 100644
--- a/sound/core/sgbuf.c
+++ b/sound/core/sgbuf.c
@@ -183,10 +183,19 @@ static unsigned int snd_dma_sg_get_chunk_size(struct snd_dma_buffer *dmab,
 	return size;
 }
 
+static int snd_dma_sg_mmap(struct snd_dma_buffer *dmab,
+			   struct vm_area_struct *area)
+{
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+	return -ENOENT; /* continue with the default mmap handler */
+}
+
 const struct snd_malloc_ops snd_dma_sg_ops = {
 	.alloc = snd_dma_sg_alloc,
 	.free = snd_dma_sg_free,
 	.get_addr = snd_dma_sg_get_addr,
 	.get_page = snd_dma_sg_get_page,
 	.get_chunk_size = snd_dma_sg_get_chunk_size,
+	.mmap = snd_dma_sg_mmap,
 };
-- 
2.26.2

