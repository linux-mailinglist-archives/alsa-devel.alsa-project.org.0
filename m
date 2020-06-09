Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B281F36E9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 11:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CDF169A;
	Tue,  9 Jun 2020 11:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CDF169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591694362;
	bh=gsgcXp42n+iMCEfph/R7BKhfW7QSbg0dXyJPXbelhIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rT23RFFkwQ4hAt5sL5JzCMUU8fevVdc+PCTaRiV4IuKTIVaoJpIaV3hDFfpJUV5+Z
	 CVavMHtkU1cObbTOEzGXNJIxY+IEmWletnz2wdlddfVdqqhfYIIv2b68t5ms0agJpi
	 IuGM393Q0DY12BAaYV/5DfGF227ngb90saToNU7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F94F8028D;
	Tue,  9 Jun 2020 11:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A45F8028C; Tue,  9 Jun 2020 11:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_64,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA342F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 11:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA342F80124
Received: by verein.lst.de (Postfix, from userid 2407)
 id 09DBF68AFE; Tue,  9 Jun 2020 11:17:28 +0200 (CEST)
Date: Tue, 9 Jun 2020 11:17:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200609091727.GA23814@lst.de>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200608061950.GA17476@lst.de> <1591624340.z01ejtod28.none@localhost>
 <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
 <20200609054306.GA9606@lst.de> <s5hsgf4irzt.wl-tiwai@suse.de>
 <20200609084305.GA21671@lst.de> <s5hlfkwip1h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hlfkwip1h.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, hpa@zytor.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 David Rientjes <rientjes@google.com>, tglx@linutronix.de,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Jun 09, 2020 at 11:09:14AM +0200, Takashi Iwai wrote:
> On Tue, 09 Jun 2020 10:43:05 +0200,
> Christoph Hellwig wrote:
> > 
> > On Tue, Jun 09, 2020 at 10:05:26AM +0200, Takashi Iwai wrote:
> > > > >From the disassembly it seems like a vmalloc allocation is NULL, which
> > > > seems really weird as this patch shouldn't make a difference for them,
> > > > and I also only see a single places that allocates the field, and that
> > > > checks for an allocation failure.  But the sound code is a little
> > > > hard to unwind sometimes.
> > > 
> > > It's not clear which sound device being affected, but if it's
> > > HD-audio on x86, runtime->dma_area points to a vmapped buffer from
> > > SG-pages allocated by dma_alloc_coherent().
> > > 
> > > OTOH, if it's a USB-audio, runtime->dma_area is a buffer by
> > > vmalloc().
> > 
> > Err, you can't just vmap a buffer returned from dma_alloc_coherent,
> > dma_alloc_coherent returns values are opaque and can't be used
> > for virt_to_page.  Whatever that code did has already been broken
> > per the DMA API contract and on many architectures and just happend
> > to work on x86 by accident.
> 
> Hmm, that's bad.
> 
> How would be a proper way to get the virtually mapped SG-buffer pages
> with coherent memory?  (Also allowing user-space mmap, too)

dma_mmap_coherent / dma_mmap_attrs for userspace.  We don't really
have a good way for kernel space mappings.
