Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88511F9C81
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 18:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B7B31672;
	Mon, 15 Jun 2020 18:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B7B31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592237005;
	bh=LI5e9jfSKxkkOHBpDMhC8aRwfh20aL94/sP3PZXgPUY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBMdv7I0EirQwsKkd2TlK0Dc/LIvbFHr0T9yn63u23SaG0yAeXjZz1CXjL5XxYnhM
	 PAfFS/U0oVEVrkgpfn9+jqsdRZ2csjVs1pnQJxJNuRVQSR0gfG0XcdQe2WvvDwo//t
	 a62eAmaBSxr/J2X7K9S8RFkx+1G/ljh/bYdwyKWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C80F80274;
	Mon, 15 Jun 2020 18:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2C9DF801ED; Mon, 15 Jun 2020 18:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7E1F800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 18:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7E1F800EF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39B66ADF2
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 16:00:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: memalloc: Initialize all fields of snd_dma_buffer
 properly
Date: Mon, 15 Jun 2020 18:00:43 +0200
Message-Id: <20200615160045.2703-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200615160045.2703-1-tiwai@suse.de>
References: <20200615160045.2703-1-tiwai@suse.de>
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

Some fields in snd_dma_buffer aren't touched in snd_dma_alloc_pages()
and might be left uninitialized.  Let's clear all fields properly, so
that we can use a NULL check (e.g. dmab->private_data) as conditional
in a later patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index bea46ed157a6..d8f28d030985 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -135,16 +135,17 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	dmab->dev.type = type;
 	dmab->dev.dev = device;
 	dmab->bytes = 0;
+	dmab->area = NULL;
+	dmab->addr = 0;
+	dmab->private_data = NULL;
 	switch (type) {
 	case SNDRV_DMA_TYPE_CONTINUOUS:
 		gfp = snd_mem_get_gfp_flags(device, GFP_KERNEL);
 		dmab->area = alloc_pages_exact(size, gfp);
-		dmab->addr = 0;
 		break;
 	case SNDRV_DMA_TYPE_VMALLOC:
 		gfp = snd_mem_get_gfp_flags(device, GFP_KERNEL | __GFP_HIGHMEM);
 		dmab->area = __vmalloc(size, gfp);
-		dmab->addr = 0;
 		break;
 #ifdef CONFIG_HAS_DMA
 #ifdef CONFIG_GENERIC_ALLOCATOR
@@ -171,8 +172,6 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 #endif
 	default:
 		pr_err("snd-malloc: invalid device type %d\n", type);
-		dmab->area = NULL;
-		dmab->addr = 0;
 		return -ENXIO;
 	}
 	if (! dmab->area)
-- 
2.16.4

