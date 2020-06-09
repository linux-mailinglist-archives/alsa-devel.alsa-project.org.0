Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C111F3396
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 07:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE071672;
	Tue,  9 Jun 2020 07:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE071672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591681496;
	bh=IRX567PvwGE8PpLJz5jav/d2xwC0rox93MlNGkebf4o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mC6m31zBnvEhDoX1bEHMNv9dgz+RzA71JrSdhQaId7qqPk9ZbGWuGoKEIGTUzZVuK
	 13H4X4+oBo45wKCo15gh/0OY/AEUdrXt16uTxipeiaWq7A9PG9wSGJxYDKc+ndjH2x
	 7oBYNp4N2AcTfRUOvhhFKFsTYLqOZ7jzs8jBmJ7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BA3F800F1;
	Tue,  9 Jun 2020 07:43:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFB01F8028C; Tue,  9 Jun 2020 07:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DEDAF80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 07:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DEDAF80088
Received: by verein.lst.de (Postfix, from userid 2407)
 id 28BA868AFE; Tue,  9 Jun 2020 07:43:07 +0200 (CEST)
Date: Tue, 9 Jun 2020 07:43:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200609054306.GA9606@lst.de>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200608061950.GA17476@lst.de> <1591624340.z01ejtod28.none@localhost>
 <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 hpa@zytor.com, tglx@linutronix.de, Christoph Hellwig <hch@lst.de>
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

On Mon, Jun 08, 2020 at 07:31:47PM -0700, David Rientjes wrote:
> On Mon, 8 Jun 2020, Alex Xu (Hello71) wrote:
> 
> > Excerpts from Christoph Hellwig's message of June 8, 2020 2:19 am:
> > > Can you do a listing using gdb where this happens?
> > > 
> > > gdb vmlinux
> > > 
> > > l *(snd_pcm_hw_params+0x3f3)
> > > 
> > > ?
> > > 
> > 
> > (gdb) l *(snd_pcm_hw_params+0x3f3)
> > 0xffffffff817efc85 is in snd_pcm_hw_params (.../linux/sound/core/pcm_native.c:749).
> > 744             while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
> > 745                     runtime->boundary *= 2;
> > 746
> > 747             /* clear the buffer for avoiding possible kernel info leaks */
> > 748             if (runtime->dma_area && !substream->ops->copy_user)
> > 749                     memset(runtime->dma_area, 0, runtime->dma_bytes);
> > 750
> > 751             snd_pcm_timer_resolution_change(substream);
> > 752             snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
> > 753
> > 
> 
> Working theory is that CONFIG_DMA_NONCOHERENT_MMAP getting set is causing 
> the error_code in the page fault path.  Debugging with Alex off-thread we 
> found that dma_{alloc,free}_from_pool() are not getting called from the 
> new code in dma_direct_{alloc,free}_pages() and he has not enabled 
> mem_encrypt.

While DMA_COHERENT_POOL absolutely should not select DMA_NONCOHERENT_MMAP
(and you should send your patch either way), I don't think it is going
to make a difference here, as DMA_NONCOHERENT_MMAP just means we
allows mmaps even for non-coherent devices, and we do not support
non-coherent devices on x86.

From the disassembly it seems like a vmalloc allocation is NULL, which
seems really weird as this patch shouldn't make a difference for them,
and I also only see a single places that allocates the field, and that
checks for an allocation failure.  But the sound code is a little
hard to unwind sometimes.
