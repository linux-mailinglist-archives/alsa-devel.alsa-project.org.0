Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB94B0D9C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 13:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2FFA18F1;
	Thu, 10 Feb 2022 13:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2FFA18F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644496543;
	bh=ZznVtDTp7FhgalcK6wvRbcsBCyOCXc4aGCMZHpIN9As=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rT/o8i+5z0ZkcUeRHmPau+qK4SE3MFnWgam4eD7XbvgHZ0p2/GTWwWcNpIuC6Dd3D
	 1Vg+FxO6znQmZH8hSaZijNBxwdq+62X2n4dqGCy+hUhdhTS3MjmbZL7KlZJnkJ32H1
	 G9jv+Mx+4lud3kOBIGrBHO+wfqZyhrwJ3A4hnPkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1733F804AB;
	Thu, 10 Feb 2022 13:34:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DBEAF804FD; Thu, 10 Feb 2022 13:33:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97EFF800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 13:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97EFF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zV0Ck4y5"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9Vu2urIS"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 65B531F37B
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644496428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPI747jCfWUnD7NfVcaFGxGMTDHP9fHc6TS2N1Vej2U=;
 b=zV0Ck4y5FJFpmoZkup37/0ncuVKCKpuhRKxLNnzRVKoC0kLUtB4oq/8YzOGFQWewCjIAWv
 XBUIs9y20tEjJLKOslRqL2ER6YScrRjWiNdJit1mVrrSwo93YxNyCjJI+H2DTc7b1c35KI
 JqeTnul12cLYpIh8bjob4f6Ue/OLzZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644496428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPI747jCfWUnD7NfVcaFGxGMTDHP9fHc6TS2N1Vej2U=;
 b=9Vu2urISakF2Azs81H4HnE5hwf2fIS6bYzEEBOobTONkiXSdPRu9Hu51z1IfSLlY6iwOtX
 uIPDzi0Swl1YHyBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5F700A3B85;
 Thu, 10 Feb 2022 12:33:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: memalloc: Fix dma_need_sync() checks
Date: Thu, 10 Feb 2022 13:33:43 +0100
Message-Id: <20220210123344.8756-2-tiwai@suse.de>
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

dma_need_sync() checks each DMA address.  Fix the incorrect usages
for non-contiguous and non-coherent page allocations.
Fortunately, there are no actual call sites that need manual syncs
yet.

Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
Fixes: 73325f60e2ed ("ALSA: memalloc: Support for non-coherent page allocation")
Cc: <stable@vger.kernel.org>
Reported-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index d1fcd1d5adae..f98f694e3ce4 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -511,7 +511,8 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 				      DEFAULT_GFP, 0);
 	if (!sgt)
 		return NULL;
-	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev, dmab->dev.dir);
+	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
+					    sg_dma_address(sgt->sgl));
 	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
 	if (p)
 		dmab->private_data = sgt;
@@ -671,9 +672,13 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
  */
 static void *snd_dma_noncoherent_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev, dmab->dev.dir);
-	return dma_alloc_noncoherent(dmab->dev.dev, size, &dmab->addr,
-				     dmab->dev.dir, DEFAULT_GFP);
+	void *p;
+
+	p = dma_alloc_noncoherent(dmab->dev.dev, size, &dmab->addr,
+				  dmab->dev.dir, DEFAULT_GFP);
+	if (p)
+		dmab->dev.need_sync = dma_need_sync(dmab->dev.dev, dmab->addr);
+	return p;
 }
 
 static void snd_dma_noncoherent_free(struct snd_dma_buffer *dmab)
-- 
2.31.1

