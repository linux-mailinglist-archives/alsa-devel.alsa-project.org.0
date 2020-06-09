Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFE1F3646
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 10:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5DAA1684;
	Tue,  9 Jun 2020 10:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5DAA1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591692294;
	bh=Sc/iVJAY8hoMbAZtgpT7R0/GbU3L8aFtBkYyFSGcXAA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEfRPrWLrqI8A9Q8zDNvMOeE9zedQP70zwHNltEeTHTCclNAtJWiHJrqMewbeSUkF
	 /GF60E3rqbuO9cGZeMoHIS8bDS8YioHKpg2ZWaMie9EJayx4lIcWGjs2dWfvZgGaPz
	 COrUZY6VlRXdzyMr7gUxOFr9OwhW67TNOaHN0jPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E7EF80088;
	Tue,  9 Jun 2020 10:43:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A683BF8028C; Tue,  9 Jun 2020 10:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_64,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48E28F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 10:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E28F80088
Received: by verein.lst.de (Postfix, from userid 2407)
 id D38BC68AFE; Tue,  9 Jun 2020 10:43:05 +0200 (CEST)
Date: Tue, 9 Jun 2020 10:43:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200609084305.GA21671@lst.de>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200608061950.GA17476@lst.de> <1591624340.z01ejtod28.none@localhost>
 <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
 <20200609054306.GA9606@lst.de> <s5hsgf4irzt.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsgf4irzt.wl-tiwai@suse.de>
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

On Tue, Jun 09, 2020 at 10:05:26AM +0200, Takashi Iwai wrote:
> > >From the disassembly it seems like a vmalloc allocation is NULL, which
> > seems really weird as this patch shouldn't make a difference for them,
> > and I also only see a single places that allocates the field, and that
> > checks for an allocation failure.  But the sound code is a little
> > hard to unwind sometimes.
> 
> It's not clear which sound device being affected, but if it's
> HD-audio on x86, runtime->dma_area points to a vmapped buffer from
> SG-pages allocated by dma_alloc_coherent().
> 
> OTOH, if it's a USB-audio, runtime->dma_area is a buffer by
> vmalloc().

Err, you can't just vmap a buffer returned from dma_alloc_coherent,
dma_alloc_coherent returns values are opaque and can't be used
for virt_to_page.  Whatever that code did has already been broken
per the DMA API contract and on many architectures and just happend
to work on x86 by accident.
