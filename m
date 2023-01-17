Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47D66D75E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 09:00:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE56D63A5;
	Tue, 17 Jan 2023 08:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE56D63A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673942409;
	bh=CSh9BYVK+40WA2VBVUxD7plJyOBmDnICHtcRpHfuGX4=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rMK2LHLk8J2d1JnYT7ZQ2xd0EtVdFQ/e3dp7MA3hARskR8PfBBLL6RdptkZ+QuJ2V
	 NwH0vl7EijglUruNiE0dV+nN1P4D7SOYCT4DC6V/TvFHJUgVQurTBnZ5EvetIEcdR8
	 ezffNm+cGx8NHx5c/4Xr/QzoIsshYqQc49utld60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B42BF804DE;
	Tue, 17 Jan 2023 08:59:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 349F2F8047B; Tue, 17 Jan 2023 08:59:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 858AAF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 08:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 858AAF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=FEAs0lcD; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LhhCTUsq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 069DA682AF;
 Tue, 17 Jan 2023 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673942338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rFgTBusNm3ddP4IzybSpHqpVGkCzjxZ2pUkYqqDl70=;
 b=FEAs0lcDCu7Se3BD4a81nXSSpie4kO+bfF9jR0FEvbOf5npoFvuaX0+RH7YVsPiuMQfYUs
 C5paOgu83lhVKxGS3h9dVqwvBNcMYhDjhvfbp+n+zcGCRTTsL7cema0YMdIr5SBPK5HlVG
 Vq4h2AWxJTBR1ew+KelEd9dDi951CSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673942338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rFgTBusNm3ddP4IzybSpHqpVGkCzjxZ2pUkYqqDl70=;
 b=LhhCTUsqzCfVi69cEi2jNp3EgC53mP19opb8Gaoc4gpOC4iSTr3e56UcbPu3okhiwY1wtf
 7PpIG+jzGF7RkQDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D824713357;
 Tue, 17 Jan 2023 07:58:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pH0MNEFVxmNMRQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 17 Jan 2023 07:58:57 +0000
Date: Tue, 17 Jan 2023 08:58:57 +0100
Message-ID: <87tu0p8uda.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <87bkmya2zk.wl-tiwai@suse.de>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 16 Jan 2023 16:55:11 +0100,
Takashi Iwai wrote:
> 
> On Tue, 27 Dec 2022 16:26:54 +0100,
> Marek Marczykowski-Górecki wrote:
> > 
> > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > Marek Marczykowski-Górecki wrote:
> > > > 
> > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > 
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > > dmesg:
> > > > > > > > 
> > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > > 
> > > > > Hit the issue again, this message did not appear in the log (or at least
> > > > > not yet).
> > > > > 
> > > > > (...)
> > > > > 
> > > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > > 
> > > > > This did not helped.
> > > > > 
> > > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > > report include some more background:
> > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > 
> > > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > > native Linux and the audio issue is still there.
> > > > > > 
> > > > > > > If the problem persists, another thing to check is the hack below
> > > > > > > works.
> > > > > 
> > > > > Trying this one now.
> > > > 
> > > > And this one didn't either :/
> > > 
> > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > 
> > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > about BDL pages.  Could you check the patch below instead?
> > > It'll disable the SG-buffer handling on x86 completely. 
> > 
> > This seems to "fix" the issue, thanks!
> > I guess I'll run it this way for now, but a proper solution would be
> > nice. Let me know if I can collect any more info that would help with
> > that.
> 
> Then we seem to go back again with the coherent memory allocation for
> the fallback sg cases.  It was changed because the use of
> dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> the page addresses, but since the commit 9736a325137b, we essentially
> avoid the fallback when IOMMU is used, so it should be fine again.
> 
> Let me know if the patch like below works for you instead of the
> previous hack to disable SG-buffer (note: totally untested!)

Gah, there was an obvious typo, scratch that.

Below is a proper patch.  Please try this one instead.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: memalloc: Use coherent DMA allocation for fallback again

We switched the memory allocation for fallback cases in the noncontig
type to use the standard alloc_pages*() at the commit a8d302a0b770
("ALSA: memalloc: Revive x86-specific WC page allocations again"),
while we used the dma_alloc_coherent() in the past.  The reason was
that the page address retrieved from the virtual pointer returned from
dma_alloc_coherent() can't be used with IOMMU systems.  Meanwhile, we
explicitly disabled the fallback allocation for IOMMU systems at the
commit 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer
with IOMMU") after the commit above; that is, the usage of
dma_alloc_coherent() should be OK again.

Now, we've received reports that the current fallback page allocation
caused a regression on Xen (and maybe other) systems; the sound
disappear partially or completely.  The further investigation showed
that this can be worked around by the dma_alloc_coherent() pages.
So, it's time to take it back.

This patch switches back to the dma_alloc_coherent() for the fallback
allocations.  Unlike the previous implementation, the allocation is
implemented in a more optimized way to try larger chunks.  The page
count is stored in the lower bits of the addresses.

Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Fixes: 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer with IOMMU")
Link: https://lore.kernel.org/r/87tu256lqs.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 44 +++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 81025f50a542..dff07cd6f209 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -719,17 +719,30 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 struct snd_dma_sg_fallback {
 	size_t count;
 	struct page **pages;
+	dma_addr_t *addrs;
 };
 
 static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 				       struct snd_dma_sg_fallback *sgbuf)
 {
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
-	size_t i;
-
-	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
-		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
+	size_t i, size;
+
+	if (sgbuf->pages && sgbuf->addrs) {
+		i = 0;
+		while (i < sgbuf->count) {
+			if (!sgbuf->pages[i] || !sgbuf->addrs[i])
+				break;
+			size = sgbuf->addrs[i] & ~PAGE_MASK;
+			if (WARN_ON(!size))
+				break;
+			dma_free_coherent(dmab->dev.dev, size,
+					  page_address(sgbuf->pages[i]),
+					  sgbuf->addrs[i] & PAGE_MASK);
+			i += size;
+		}
+	}
 	kvfree(sgbuf->pages);
+	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
 }
 
@@ -738,9 +751,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
 	size_t chunk, npages;
-	dma_addr_t addr;
+	dma_addr_t *addrp;
 	void *p;
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
@@ -748,14 +760,16 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	size = PAGE_ALIGN(size);
 	sgbuf->count = size >> PAGE_SHIFT;
 	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
-	if (!sgbuf->pages)
+	sgbuf->addrs = kvcalloc(sgbuf->count, sizeof(*sgbuf->addrs), GFP_KERNEL);
+	if (!sgbuf->pages || !sgbuf->addrs)
 		goto error;
 
 	pagep = sgbuf->pages;
-	chunk = size;
+	addrp = sgbuf->addrs;
+	chunk = (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs */
 	while (size > 0) {
 		chunk = min(size, chunk);
-		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
+		p = dma_alloc_coherent(dmab->dev.dev, chunk, addrp, DEFAULT_GFP);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -767,6 +781,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		size -= chunk;
 		/* fill pages */
 		npages = chunk >> PAGE_SHIFT;
+		*addrp |= npages; /* store in lower bits */
+		addrp += npages;
 		curp = virt_to_page(p);
 		while (npages--)
 			*pagep++ = curp++;
@@ -775,6 +791,10 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
 		goto error;
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wc(sgbuf->pages, sgbuf->count);
+
 	dmab->private_data = sgbuf;
 	/* store the first page address for convenience */
 	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
@@ -787,7 +807,11 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+
 	vunmap(dmab->area);
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
 }
 
-- 
2.35.3

