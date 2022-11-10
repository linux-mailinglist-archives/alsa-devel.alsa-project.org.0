Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0AE62431D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:23:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B4E166C;
	Thu, 10 Nov 2022 14:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B4E166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668086603;
	bh=UQwP+2H90+wmgVQjZESZytYIG+PXuM3NXkpiurss1wc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ktOijuUGXbW4CGL6IJZE0N6qo+HFyQNl46kvrLiHEcYn4vMhsBhuS95k9uOs3jZ54
	 Q+zJihQ+zqrPa2hib7eRPYj8cOXUqMZlRZpOR3PR/b7K0/ng9e7Oj8IeekFeYxDi+N
	 PTj7R239Rugp4qY9Y0W5gw8hkZOlxsrgMjqWOcNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C61FBF80104;
	Thu, 10 Nov 2022 14:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2433F8021D; Thu, 10 Nov 2022 14:22:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E183FF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E183FF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Hl6zFB0P"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="v9h1d8qA"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC9FC1FB05;
 Thu, 10 Nov 2022 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668086541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x+0ILEFN8rI7O6+z1yfbkhn+aFX4/0N1DazCySGFOxo=;
 b=Hl6zFB0PqD+/Zi+Mq2mjOWWRKntv5jPAhRA6eBTuqDYXOn9ln3KOOl6AqLQs6McBx3n7tW
 gpU1xABVTsRAWrKm49jKehdNKIiDmf0ZeadcLH+9XFzORe4Pq/o4vLI1uz7uHG/oVosnLa
 26B2OcFv1QuVTtFYPVwnKKuW0LcMOpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668086541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x+0ILEFN8rI7O6+z1yfbkhn+aFX4/0N1DazCySGFOxo=;
 b=v9h1d8qAQYskFRuUSNwWv2fFOoAt5uVPBr9VqujY3qIaBuAvJzLLkIhZ3QgaAml08JAJQ2
 lJgFUkEDzosT1eDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA61913B58;
 Thu, 10 Nov 2022 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5F7mNA37bGMHdwAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 10 Nov 2022 13:22:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Don't fall back for SG-buffer with IOMMU
Date: Thu, 10 Nov 2022 14:22:16 +0100
Message-Id: <20221110132216.30605-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

When the non-contiguous page allocation for SG buffer allocation
fails, the memalloc helper tries to fall back to the old page
allocation methods.  This would, however, result in the bogus page
addresses when IOMMU is enabled.  Usually in such a case, the fallback
allocation should fail as well, but occasionally it succeeds and
hitting a bad access.

The fallback was thought for non-IOMMU case, and as the error from
dma_alloc_noncontiguous() with IOMMU essentially implies a fatal
memory allocation error, we should return the error straightforwardly
without fallback.  This avoids the corner case like the above.

The patch also renames the local variable "dma_ops" with snd_ prefix
for avoiding the name conflict.

Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/alpine.DEB.2.22.394.2211041541090.3532114@eliteleevi.tm.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 03cffe771366..6a81aaab25ab 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
 #include <linux/genalloc.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
@@ -541,19 +542,20 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
-	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP, 0);
-	if (!sgt) {
 #ifdef CONFIG_SND_DMA_SGBUF
+	if (!get_dma_ops(dmab->dev.dev)) {
 		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
 			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 		else
 			dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
 		return snd_dma_sg_fallback_alloc(dmab, size);
-#else
-		return NULL;
-#endif
 	}
+#endif
+
+	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
+				      DEFAULT_GFP, 0);
+	if (!sgt)
+		return NULL;
 
 	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
 					    sg_dma_address(sgt->sgl));
@@ -857,7 +859,7 @@ static const struct snd_malloc_ops snd_dma_noncoherent_ops = {
 /*
  * Entry points
  */
-static const struct snd_malloc_ops *dma_ops[] = {
+static const struct snd_malloc_ops *snd_dma_ops[] = {
 	[SNDRV_DMA_TYPE_CONTINUOUS] = &snd_dma_continuous_ops,
 	[SNDRV_DMA_TYPE_VMALLOC] = &snd_dma_vmalloc_ops,
 #ifdef CONFIG_HAS_DMA
@@ -883,7 +885,7 @@ static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab)
 	if (WARN_ON_ONCE(!dmab))
 		return NULL;
 	if (WARN_ON_ONCE(dmab->dev.type <= SNDRV_DMA_TYPE_UNKNOWN ||
-			 dmab->dev.type >= ARRAY_SIZE(dma_ops)))
+			 dmab->dev.type >= ARRAY_SIZE(snd_dma_ops)))
 		return NULL;
-	return dma_ops[dmab->dev.type];
+	return snd_dma_ops[dmab->dev.type];
 }
-- 
2.35.3

