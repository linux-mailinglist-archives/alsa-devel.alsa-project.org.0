Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2166C4A3
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 16:57:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D04A581F;
	Mon, 16 Jan 2023 16:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D04A581F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673884624;
	bh=1lvru4C1BziDtWs91ty6Sf3y6zX8rvAmmIA2wp5IL9I=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HRWWWQTASFH+9vi0mb0B9U0Qia5KFdmSrjIcwjdqLiJVbu7qf8CzltosY45hI9R7I
	 T//gc+fqrNWOAvbAhdlr2A5QwcLYJgXF3/EdmnfKq80Tmg8WcuMLJZY45t81z8k9Ck
	 vpyxgWScLxpEYUh/88QFBilX2yL37topKHb4guHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8636F80482;
	Mon, 16 Jan 2023 16:56:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7703F8024C; Mon, 16 Jan 2023 16:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2DCFF80240
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 16:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DCFF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AIQRApGN; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LVg+oRS2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 388F3209E7;
 Mon, 16 Jan 2023 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673884512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAmuR13r52A6EktUKaL6Lcj5D7X/qA47+HFxgQaeHhE=;
 b=AIQRApGNkoMC4vX8kHkgFYu5Uzc/b8iKxL5G4Np5eNfztcFcH2xVLd/fJieY6XP3oHgIfk
 5S3dQeWwU86dd7s/ELikFW+cal7CTgjHysvq73sl4r1FxoLTHRAmwJnB7Skeb9kVAOicNi
 4JxrXpglneTx+lS/r8+V89djLOybtkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673884512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAmuR13r52A6EktUKaL6Lcj5D7X/qA47+HFxgQaeHhE=;
 b=LVg+oRS2fTqdO75Jcgmcb3/SeJlCR5iDuu4sqPw3z77Ifyloz5RjN0v7zOtEq9VAIj0lQA
 qL9esVZze1pcY5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DA2A138FE;
 Mon, 16 Jan 2023 15:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PQupAmBzxWMMGwAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 16 Jan 2023 15:55:12 +0000
Date: Mon, 16 Jan 2023 16:55:11 +0100
Message-ID: <87bkmya2zk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y6sOvyYwuR8Pu0wj@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl>
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

On Tue, 27 Dec 2022 16:26:54 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > On Sat, 10 Dec 2022 17:17:42 +0100,
> > Marek Marczykowski-Górecki wrote:
> > > 
> > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > dmesg:
> > > > > > > 
> > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > 
> > > > Hit the issue again, this message did not appear in the log (or at least
> > > > not yet).
> > > > 
> > > > (...)
> > > > 
> > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > 
> > > > This did not helped.
> > > > 
> > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > report include some more background:
> > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > 
> > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > native Linux and the audio issue is still there.
> > > > > 
> > > > > > If the problem persists, another thing to check is the hack below
> > > > > > works.
> > > > 
> > > > Trying this one now.
> > > 
> > > And this one didn't either :/
> > 
> > (Sorry for the late reply, as I've been off in the last weeks.)
> > 
> > I think the hack doesn't influence on the PCM buffer pages, but only
> > about BDL pages.  Could you check the patch below instead?
> > It'll disable the SG-buffer handling on x86 completely. 
> 
> This seems to "fix" the issue, thanks!
> I guess I'll run it this way for now, but a proper solution would be
> nice. Let me know if I can collect any more info that would help with
> that.

Then we seem to go back again with the coherent memory allocation for
the fallback sg cases.  It was changed because the use of
dma_alloc_coherent() caused a problem with IOMMU case for retrieving
the page addresses, but since the commit 9736a325137b, we essentially
avoid the fallback when IOMMU is used, so it should be fine again.

Let me know if the patch like below works for you instead of the
previous hack to disable SG-buffer (note: totally untested!)


thanks,

Takashi

-- 8< --
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
+			if (!WARN_ON(size))
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
+	chunk = PAGE_SIZE * (PAGE_SIZE - 1); /* to fit in low bits in addrs */
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
 
