Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA85796FB61
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 20:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151CD86E;
	Fri,  6 Sep 2024 20:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151CD86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725648192;
	bh=E9qSLt0GrVBYfjxOpUedKjTmq7bndQXS3lQvPEArxjU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EhUQUajjZs7Jhv+EwKeanNr0YGsHtwvxuit74IQvEm8Bx6MvhkCPtIS5w7HcdJZEW
	 I/g01+iJk7aOxrR6VXyU85xTCFS539c5dTshIlX7Mi/t9xbf0Cas2sI+OsjgYBY9YG
	 jmNozezPEsTVH2RkHTMiiy1zYph3lrjJ8qg5N8Ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46091F8032D; Fri,  6 Sep 2024 20:42:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 168C5F804FC;
	Fri,  6 Sep 2024 20:42:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBA4BF8016C; Fri,  6 Sep 2024 20:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from pv50p00im-zteg10021401.me.com (pv50p00im-zteg10021401.me.com
 [17.58.6.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3D5CF800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 20:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D5CF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ariadne.space header.i=@ariadne.space
 header.a=rsa-sha256 header.s=sig1 header.b=no0ngRzz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=sig1; t=1725648150;
	bh=M0Q9XOB/kMF0+B3U+RveaDZ0cH/WiG/ZmzrA54s0hxc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=no0ngRzzC7FEjI9UXUSQpIWlC1yaJS5visGBOvAG0FbYV5JYtUDSBkK0Ngg23ayPv
	 PLCSRy/P9fBRUssIWTNN4achy78m1NBwFimPEjTwKNHuVOzkp/wKjB2UQ+XXIBnEDn
	 O/Vz2DD0aaHvrm+94h6TnZ0hX/i30W5g1cKGeJqSfnwihJMfsPTxkgEp8lWoooPrQU
	 V8UZuyxFkozTVlHlNcQKW6XWqfZGABG9GagtjLvZEMNnLaIJg46D48FRBf71D/zbT2
	 W9gMBfQIum1bIPt4lkVhBMx8JTG111wYkb6qukzyzWXuQEsnGgUpBzpLhnL5sVrHUh
	 erCpwRQXipSDw==
Received: from penelo.taild41b8.ts.net (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
	by pv50p00im-zteg10021401.me.com (Postfix) with ESMTPSA id 861EE8E07B7;
	Fri,  6 Sep 2024 18:42:27 +0000 (UTC)
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Date: Fri,  6 Sep 2024 11:42:09 -0700
Message-Id: <20240906184209.25423-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lk0ouPNqe5kE8xXEoigDnu-oJgDNJMcY
X-Proofpoint-GUID: lk0ouPNqe5kE8xXEoigDnu-oJgDNJMcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1030 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2409060138
Message-ID-Hash: E7OOP5UMW57FDOEWL6FB6RETPZGXNNOL
X-Message-ID-Hash: E7OOP5UMW57FDOEWL6FB6RETPZGXNNOL
X-MailFrom: ariadne@ariadne.space
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7OOP5UMW57FDOEWL6FB6RETPZGXNNOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch attempted to work around a DMA issue involving Xen, but
causes subtle kernel memory corruption.

When I brought up this patch in the XenDevel matrix channel, I was
told that it had been requested by the Qubes OS developers because
they were trying to fix an issue where the sound stack would fail
after a few hours of uptime.  They wound up disabling SG buffering
entirely instead as a workaround.

Accordingly, I propose that we should revert this workaround patch,
since it causes kernel memory corruption and that the ALSA and Xen
communities should collaborate on fixing the underlying problem in
such a way that SG buffering works correctly under Xen.

This reverts commit 53466ebdec614f915c691809b0861acecb941e30.

Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
Cc: stable@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 87 +++++++++----------------------------------
 1 file changed, 18 insertions(+), 69 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index f901504b5afc..81025f50a542 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -541,15 +541,16 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
-#ifdef CONFIG_SND_DMA_SGBUF
-	if (cpu_feature_enabled(X86_FEATURE_XENPV))
-		return snd_dma_sg_fallback_alloc(dmab, size);
-#endif
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
 				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && !get_dma_ops(dmab->dev.dev))
+	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
+		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
+		else
+			dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
 		return snd_dma_sg_fallback_alloc(dmab, size);
+	}
 #endif
 	if (!sgt)
 		return NULL;
@@ -716,38 +717,19 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 
 /* Fallback SG-buffer allocations for x86 */
 struct snd_dma_sg_fallback {
-	bool use_dma_alloc_coherent;
 	size_t count;
 	struct page **pages;
-	/* DMA address array; the first page contains #pages in ~PAGE_MASK */
-	dma_addr_t *addrs;
 };
 
 static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 				       struct snd_dma_sg_fallback *sgbuf)
 {
-	size_t i, size;
-
-	if (sgbuf->pages && sgbuf->addrs) {
-		i = 0;
-		while (i < sgbuf->count) {
-			if (!sgbuf->pages[i] || !sgbuf->addrs[i])
-				break;
-			size = sgbuf->addrs[i] & ~PAGE_MASK;
-			if (WARN_ON(!size))
-				break;
-			if (sgbuf->use_dma_alloc_coherent)
-				dma_free_coherent(dmab->dev.dev, size << PAGE_SHIFT,
-						  page_address(sgbuf->pages[i]),
-						  sgbuf->addrs[i] & PAGE_MASK);
-			else
-				do_free_pages(page_address(sgbuf->pages[i]),
-					      size << PAGE_SHIFT, false);
-			i += size;
-		}
-	}
+	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
+	size_t i;
+
+	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
+		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
 	kvfree(sgbuf->pages);
-	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
 }
 
@@ -756,36 +738,24 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
 	size_t chunk, npages;
-	dma_addr_t *addrp;
 	dma_addr_t addr;
 	void *p;
-
-	/* correct the type */
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG)
-		dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
-	else if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
+	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
 		return NULL;
-	sgbuf->use_dma_alloc_coherent = cpu_feature_enabled(X86_FEATURE_XENPV);
 	size = PAGE_ALIGN(size);
 	sgbuf->count = size >> PAGE_SHIFT;
 	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
-	sgbuf->addrs = kvcalloc(sgbuf->count, sizeof(*sgbuf->addrs), GFP_KERNEL);
-	if (!sgbuf->pages || !sgbuf->addrs)
+	if (!sgbuf->pages)
 		goto error;
 
 	pagep = sgbuf->pages;
-	addrp = sgbuf->addrs;
-	chunk = (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs */
+	chunk = size;
 	while (size > 0) {
 		chunk = min(size, chunk);
-		if (sgbuf->use_dma_alloc_coherent)
-			p = dma_alloc_coherent(dmab->dev.dev, chunk, &addr, DEFAULT_GFP);
-		else
-			p = do_alloc_pages(dmab->dev.dev, chunk, &addr, false);
+		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -797,25 +767,17 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		size -= chunk;
 		/* fill pages */
 		npages = chunk >> PAGE_SHIFT;
-		*addrp = npages; /* store in lower bits */
 		curp = virt_to_page(p);
-		while (npages--) {
+		while (npages--)
 			*pagep++ = curp++;
-			*addrp++ |= addr;
-			addr += PAGE_SIZE;
-		}
 	}
 
 	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
 		goto error;
-
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
-		set_pages_array_wc(sgbuf->pages, sgbuf->count);
-
 	dmab->private_data = sgbuf;
 	/* store the first page address for convenience */
-	dmab->addr = sgbuf->addrs[0] & PAGE_MASK;
+	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
 	return p;
 
  error:
@@ -825,23 +787,10 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
-	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
-
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
-		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	vunmap(dmab->area);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
 }
 
-static dma_addr_t snd_dma_sg_fallback_get_addr(struct snd_dma_buffer *dmab,
-					       size_t offset)
-{
-	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
-	size_t index = offset >> PAGE_SHIFT;
-
-	return (sgbuf->addrs[index] & PAGE_MASK) | (offset & ~PAGE_MASK);
-}
-
 static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
 				    struct vm_area_struct *area)
 {
@@ -856,8 +805,8 @@ static const struct snd_malloc_ops snd_dma_sg_fallback_ops = {
 	.alloc = snd_dma_sg_fallback_alloc,
 	.free = snd_dma_sg_fallback_free,
 	.mmap = snd_dma_sg_fallback_mmap,
-	.get_addr = snd_dma_sg_fallback_get_addr,
 	/* reuse vmalloc helpers */
+	.get_addr = snd_dma_vmalloc_get_addr,
 	.get_page = snd_dma_vmalloc_get_page,
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
-- 
2.39.2

