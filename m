Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E83DFC3D
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 09:43:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BCEE1727;
	Wed,  4 Aug 2021 09:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BCEE1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628062986;
	bh=1/ntH72Wy0+hj/vusj0dtjH92gB1uD5qXT9DuCNSE10=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ELoDZWY1SX101NPBI18nz4iT28AyUzhXQ3DVsjPJ0Mi6WO8+xmXkdvC9kBO51GOh9
	 FIFBoyKq/HHvgaqiQNGSSf+XT89AL2xWZnFY7HVIcb1qODXSkQVNqS6jsOYbYJlUz+
	 eHG9WHHkLQKRADMWLWyqC4x8WvA6tlhE3Fi0+HAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3ED1F80279;
	Wed,  4 Aug 2021 09:41:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C994F80271; Wed,  4 Aug 2021 09:41:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D972CF80268
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 09:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D972CF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hvqWGzRI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ixRuqtKl"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 59F4D221AD
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628062887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rwjSmtSbXdd0lm8Xlnt4tbYpzkkkRhnT80Swwg3YAJk=;
 b=hvqWGzRIHgtDpjdPtf6d/zncYo4LhyGQl8TFRvdsAXgkQKevF2fLmMBS1tl1wQVel5+PnS
 0GNCujok608a2A/28BsWQyJiGhIge3H5lCT+eOtLoNkeDtSVg8G4LPyvi8d/+AA/ai8pW3
 IuOytWQpXIZtVW163976GwYas6AdF20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628062887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rwjSmtSbXdd0lm8Xlnt4tbYpzkkkRhnT80Swwg3YAJk=;
 b=ixRuqtKloQXDODG1E5VA9XGGMzpuS/Kt5wKcwOPH0fdrEKR+p6HNDkPKTllgKmdW6KNkww
 F/T5nof+xpfmVhBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 53EDCA3B8E;
 Wed,  4 Aug 2021 07:41:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: memalloc: Store snd_dma_buffer.addr for continuous
 pages, too
Date: Wed,  4 Aug 2021 09:41:25 +0200
Message-Id: <20210804074125.8170-1-tiwai@suse.de>
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

In the recent fix commit eda80d7c9c4d ("ALSA: memalloc: Fix regression
with SNDRV_DMA_TYPE_CONTINUOUS"), we replaced the pfn argument of the
remap_page_pfn() call from the uninitialized dmab->addr.  It was the
right fix, but it'd be more generic if we actually initialize
dmab->area for SNDRV_DMA_TYPE_CONTINOUS, too.  e.g. the field is used
in the common snd_sgbuf_get_addr(), too.

This patch adds the initialization of addr field and does revert of
the previous change to refer to it again in the mmap call.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix a wrong buffer pointer to convert

 sound/core/memalloc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 084b2600a423..1cea8cb9668f 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -242,8 +242,11 @@ EXPORT_SYMBOL(snd_sgbuf_get_chunk_size);
 static void *snd_dma_continuous_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	gfp_t gfp = snd_mem_get_gfp_flags(dmab, GFP_KERNEL);
+	void *p = alloc_pages_exact(size, gfp);
 
-	return alloc_pages_exact(size, gfp);
+	if (p)
+		dmab->addr = page_to_phys(virt_to_page(p));
+	return p;
 }
 
 static void snd_dma_continuous_free(struct snd_dma_buffer *dmab)
@@ -255,7 +258,7 @@ static int snd_dma_continuous_mmap(struct snd_dma_buffer *dmab,
 				   struct vm_area_struct *area)
 {
 	return remap_pfn_range(area, area->vm_start,
-			       page_to_pfn(virt_to_page(dmab->area)),
+			       dmab->addr >> PAGE_SHIFT,
 			       area->vm_end - area->vm_start,
 			       area->vm_page_prot);
 }
-- 
2.26.2

