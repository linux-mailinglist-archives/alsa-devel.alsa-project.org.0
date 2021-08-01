Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5E3DCB65
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 13:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B4218A0;
	Sun,  1 Aug 2021 13:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B4218A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627817992;
	bh=pDY3ZOfGZLbUH+Q4Fup6IqV3B1cgSelvSPp1tyUbjOs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LnI+DiQLe+mAr4pllD4EITqqxq7xluW2PX1NmSMJK5Km1ZjufGlGZ/B/U2KRst/gh
	 qAh6lgBnhTdUkFgzV5FbMXosqBJwpAZFkQEZULhUHpg66rerv2gVBZqq56hWwr6adP
	 HghujGInx20IM6meejteq7rl0a6Pjist62sgo1vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D60F8032D;
	Sun,  1 Aug 2021 13:38:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FC1F802E8; Sun,  1 Aug 2021 13:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 783C4F80095
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 13:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 783C4F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="AItvS1dG"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="podjx3kH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8DEE521FC2;
 Sun,  1 Aug 2021 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627817882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hKOuV3qW6GcMw/hMvJ7Aj7hmmaddXE7DlF+Q+XytRhA=;
 b=AItvS1dGEWZvSY11IGwZfGZ3yiOX6IRlAFh2zNdX1GFkte5Kp0qW3iO4kmrpTOjqHnTOkJ
 HdR7e9kbQ1tkSnsxLqOyo5Iia7wElSTmDLuUXFikR6KXkABCs6dIrXnJB383ARAGIgBKAc
 CRRhfuzGZliS4lkOZSX3kHYah5sJLmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627817882;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hKOuV3qW6GcMw/hMvJ7Aj7hmmaddXE7DlF+Q+XytRhA=;
 b=podjx3kHzM42iYYFpW73hADdIwvzsxeGdUB2uysFbIOmC+j0crAp6PenqA+r4ndjhoR9EZ
 8QojImmD2KSZwyAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7C1C9A3BAA;
 Sun,  1 Aug 2021 11:38:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Fix regression with SNDRV_DMA_TYPE_CONTINUOUS
Date: Sun,  1 Aug 2021 13:38:01 +0200
Message-Id: <20210801113801.31290-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>
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

The recent code refactoring made the mmap of continuous pages to be
done via the own helper snd_dma_continuous_mmap() with
remap_pfn_range().  There I overlooked that dmab->addr isn't set for
the allocation with SNDRV_DMA_TYPE_CONTINUOUS.  This resulted always
in an error at mmap with this buffer type on the system such as
Intel SST Baytrail driver.

This patch fixes the regression by passing the correct address.

Fixes: 30b7ba6972d5 ("ALSA: core: Add continuous and vmalloc mmap ops")
Reported-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/8d6674da-7d7b-803e-acc9-7de6cb1223fa@redhat.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 83b79edfa52d..439a358ecfe9 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -215,7 +215,7 @@ static int snd_dma_continuous_mmap(struct snd_dma_buffer *dmab,
 				   struct vm_area_struct *area)
 {
 	return remap_pfn_range(area, area->vm_start,
-			       dmab->addr >> PAGE_SHIFT,
+			       page_to_pfn(virt_to_page(dmab->area)),
 			       area->vm_end - area->vm_start,
 			       area->vm_page_prot);
 }
-- 
2.26.2

