Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D56651C41
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 09:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F76C23F1;
	Tue, 20 Dec 2022 09:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F76C23F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671524517;
	bh=nq4LE6LqT7Ymuul6LdxDch/EKGqv4oIltSA8VD2bjG0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YiEZzeay8WezBFFjb/Pf3Ae1ipkJtRqkmalI8q+vDImrR5VBolTPQHbpEVO+8Y6DV
	 PTCfA//pFtk6i9Rw3ZwKPFTpH5ZKgU206gRBsbSNkBZfRYjxKA4gJYaizCM0H2g43j
	 lJ9e37z8mLRivr8pABU4iZ2+qosIUtSizQ2risTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AFFBF804CB;
	Tue, 20 Dec 2022 09:20:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74453F8032B; Tue, 20 Dec 2022 09:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5569F8018A
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 09:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5569F8018A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=pZZqAkka
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VHs0G2aC0Lau8WEEFjp3imT8ZHxZW8dUlQGHCb9Fikw=; b=pZZqAkkaYtdoP9XWW7DyFAkmVH
 LgaXjFNCPGIfxxBIMTpHXVkgSUSpvONTxfsPWoj8CuCtzoabAiDZflEl8XTEZS51iPmzX4nkeZGn+
 9tmKxqwZPiNVLKwg9RqgYNJM/xpwcO1DjlBP7oc42o7XNbU8T72/k0H7IbmbUSPqiTINtIq6egJsC
 kaI6saujDqqnZ9I3zFV/mO2pgJho2A/VhIT4T0OsRxJ7eBYm+KLiV6HJ7UUnU3Gn3tcIriU2vdnYU
 wYabUhFhipbRNolwCnSLDOw9br1+8CIi76btUcgF2fMzVS0H3+Wz0XshmsjhBK15EKhmiPHfG6zY5
 H5VkHw0w==;
Received: from [2001:4bb8:199:7829:c604:55b0:ed6a:61ce] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7XrC-00BuKQ-TA; Tue, 20 Dec 2022 08:20:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Subject: [PATCH 1/2] ALSA: memalloc: don't use GFP_COMP for non-coherent dma
 allocations
Date: Tue, 20 Dec 2022 09:20:08 +0100
Message-Id: <20221220082009.569785-2-hch@lst.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220082009.569785-1-hch@lst.de>
References: <20221220082009.569785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While not quite as bogus as for the dma-coherent allocations that were
fixed earlier, GFP_COMP for these allocations has no benefits for
the dma-direct case, and can't be supported at all by dma dma-iommu
backend which splits up allocations into smaller orders.  Due to an
oversight in ffcb75458460 that flag stopped being cleared for all
dma allocations, but only got rejected for coherent ones.

Start fixing this by not requesting __GFP_COMP in the sound code, which
is the only place that did this.

Fixes: ffcb75458460 ("dma-mapping: reject __GFP_COMP in dma_alloc_attrs")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 sound/core/memalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 3cf5a87d69eaf3..81025f50a54229 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -542,7 +542,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	void *p;
 
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP | __GFP_COMP, 0);
+				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
 	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
 		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
@@ -820,7 +820,7 @@ static void *snd_dma_noncoherent_alloc(struct snd_dma_buffer *dmab, size_t size)
 	void *p;
 
 	p = dma_alloc_noncoherent(dmab->dev.dev, size, &dmab->addr,
-				  dmab->dev.dir, DEFAULT_GFP | __GFP_COMP);
+				  dmab->dev.dir, DEFAULT_GFP);
 	if (p)
 		dmab->dev.need_sync = dma_need_sync(dmab->dev.dev, dmab->addr);
 	return p;
-- 
2.35.1

