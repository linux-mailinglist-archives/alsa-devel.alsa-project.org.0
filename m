Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FA2DE539
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 15:59:11 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E73F179B;
	Fri, 18 Dec 2020 15:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E73F179B
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 495A3F804C1;
	Fri, 18 Dec 2020 15:56:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60AE3F80171; Fri, 18 Dec 2020 15:56:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75CAF80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 15:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75CAF80168
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4EADAD09;
 Fri, 18 Dec 2020 14:56:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: memalloc: Align buffer allocations in page size
Date: Fri, 18 Dec 2020 15:56:24 +0100
Message-Id: <20201218145625.2045-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201218145625.2045-1-tiwai@suse.de>
References: <20201218145625.2045-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Robin Gong <yibin.gong@nxp.com>, Lars-Peter Clausen <lars@metafoo.de>
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

Currently the standard memory allocator (snd_dma_malloc_pages*())
passes the byte size to allocate as is.  Most of the backends
allocates real pages, hence the actual allocations are aligned in page
size.  However, the genalloc doesn't seem assuring the size alignment,
hence it may result in the access outside the buffer when the whole
memory pages are exposed via mmap.

For avoiding such inconsistencies, this patch makes the allocation
size always to be aligned in page size.

Note that, after this change, snd_dma_buffer.bytes field contains the
aligned size, not the originally requested size.  This value is also
used for releasing the pages in return.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 0f335162f87c..966bef5acc75 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -133,6 +133,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	if (WARN_ON(!dmab))
 		return -ENXIO;
 
+	size = PAGE_ALIGN(size);
 	dmab->dev.type = type;
 	dmab->dev.dev = device;
 	dmab->bytes = 0;
-- 
2.26.2

