Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2882C0D20
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 15:21:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9BC42;
	Mon, 23 Nov 2020 15:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9BC42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606141289;
	bh=UZFUOIebDl4qgQdhHml6dun6wXtNC9rdVEuv21FkXcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TqKIp1+YSB1xeweTSQxbf62rMVvACemC0fG5oBAsil9kvhmG7N+BA4IidQEnhutv+
	 gEQH5hIYNrdtXVERDwy7NIUVkcu6xhY90FDXzfKKsxeTe2hcCEFMViYsBV/N12x0wA
	 KjS+UCHCEWsjXUs9xyx/R1sh6kikzZ2ZzMjrf5/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41095F8015B;
	Mon, 23 Nov 2020 15:19:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 017E4F80128; Mon, 23 Nov 2020 15:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01E05F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 15:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E05F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="TKjTbXws"
Received: by mail-wm1-x344.google.com with SMTP id a186so15232356wme.1
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 06:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmZGurKPNXLbodIP9Nfbs7ON+QHFEPC2/7ydYkc76cw=;
 b=TKjTbXwsdAcol8Q+8SPDDyeTJIISl+R6N0MRquZAr7KrFZKCvsPIa5lhaSzzKRs/H8
 qb9TU1wuNR+6gc6pYTkmut0LGV20+USvZA9oEuw+0fxninbKBpmLnHr9N+lnlQI1BxQp
 DYwv9zgKjTvY1Auhy4KTAp3bK8Qv2i+nKNjMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmZGurKPNXLbodIP9Nfbs7ON+QHFEPC2/7ydYkc76cw=;
 b=DjXBykTN/+gc7GEOcUSM4fnSEB6Vlgn1EF+EQjTM05OYyDE5qyla/mvIPuhGbVUnGn
 1mOdTGH6gDw8YIIx/UQVkwNyrbwt+nlUanEuDph/WyVXjv5gLjMYg/bzcfXVTlzzDFf7
 mNOmxLzcRtcGXxWL/eq73GbykZGukk6j2oZus0KRp+tdwU57bzauP7AUzLv61AfC3p78
 ExxJVyKecnB/eGO7KxSBgm0l7ku8FJLidGzwD3YgGiri/H095uBcB7XT3f0rm4NwTYkr
 6Ni8aLT4lTesqsnRk5uZfIMEdmcD0v06iLGPCR4nSgqQzRnvOuGp2PWVl1oejNjQo3ug
 E57A==
X-Gm-Message-State: AOAM532BBNDdhtbBuqQpIQ2mr1+ikhhfsDjpzzskHGHhmH8NHYrg7yHM
 BuZEf90BOcCpo1kjH0iS2V0oGWypupJPPfecbT9HWg==
X-Google-Smtp-Source: ABdhPJzpYkSrfGg1NgfKCzTIFEjL6C31JMh1/hNBI654MP9OYKmUQhpdTKdBKiDhjfqBUahgVgSjbPRx0Ttbbyi29tc=
X-Received: by 2002:a1c:b387:: with SMTP id c129mr23705185wmf.58.1606141186240; 
 Mon, 23 Nov 2020 06:19:46 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uwmtixmz+RgimC_2Z31+NwRF03RJ-u0mN3NKpzhks1dzEw@mail.gmail.com>
 <s5hzh388awp.wl-tiwai@suse.de>
 <CAOf5uwmkuQDBH5gQFA4XfkiTipYKEZ8micyEkd_Xd8KFqSDZSA@mail.gmail.com>
 <s5hmtz889gw.wl-tiwai@suse.de>
In-Reply-To: <s5hmtz889gw.wl-tiwai@suse.de>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 23 Nov 2020 15:19:34 +0100
Message-ID: <CAOf5uwnWDaz4hK5AHEaK8guLkuVjSs+n1NcRLr+gNmyoOwWOUQ@mail.gmail.com>
Subject: Re: Poor performace on mmap reading arm64 on audio device
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@linaro.org>
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

Hi

On Mon, Nov 23, 2020 at 2:54 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 23 Nov 2020 14:44:52 +0100,
> Michael Nazzareno Trimarchi wrote:
> >
> > Hi
> >
> > On Mon, Nov 23, 2020 at 2:23 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Sat, 21 Nov 2020 10:40:04 +0100,
> > > Michael Nazzareno Trimarchi wrote:
> > > >
> > > > Hi all
> > > >
> > > > I'm trying to figure out how to increase performance on audio reading
> > > > using the mmap interface. Right now what I understand it's that
> > > > allocation comes from core/memalloc.c ops that allocate the memory for
> > > > dma under driver/dma.
> > > > The reference platform I have is an imx8mm and the allocation in arm64 is:
> > > >
> > > > 0xffff800011ff5000-0xffff800012005000          64K PTE       RW NX SHD
> > > > AF            UXN MEM/NORMAL-NC
> > > >
> > > > This is the reason that is allocated for dma interface.
> > > >
> > > > Now access linear on the multichannel interface the performance is bad
> > > > but worse if I try to access a channel a time on read.
> > > > So it looks like it is better to copy the block using memcpy on a
> > > > cached area and then operate on a single channel sample. If it's
> > > > correct what I'm saying the mmap_begin and mmap_commit
> > > > basically they don't do anything on cache level so the page mapping
> > > > and way is used is always the same. Can the interface be modified to
> > > > allow cache the area during read and restore in the commit
> > > > phase?
> > >
> > > The current API of the mmap for the sound ring-buffer is designed to
> > > allow concurrent accesses at any time in the minimalistic kernel-user
> > > context switching.  So the whole buffer is allocated as coherent and
> > > mmapped in a shot.  It's pretty efficient for architectures like x86,
> > > but has disadvantages on ARM, indeed.
> >
> > Each platform e/o architecture can specialize the mmap and declare the
> > area that is consistent in dma to me mapped
> > as no cache one
> >
> > vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
> >                 return remap_pfn_range(vma, vma->vm_start,
> >                                 vma->vm_end - vma->vm_start, vma->vm_page_prot);
> >
> > I have done it for testing purposes. This give an idea
> >
> > - read multi channel not sequentially took around 12% of the cpu with
> > mmap interface
> > - read multi channel use after a memcpy took around 6%
> > - read on a cached area took around 3%. I'm trying to figure out how
> > and when invalidate the area
> >
> > I have two use cases:
> > - write on the channels (no performance issue)
> > - read on channels
> >
> > Before reading I should only say that the cached area is not in sync
> > with memory. I think that supporting write use cases
> > makes little sense here.
>
> It's a necessary use case, unfortunately.  The reason we ended up with
> one device per direction for the PCM in many many years ago was that
> some applications need to write the buffers for marking even for the
> read.  So it can't be read-only, and it's supposed to be coherent on
> both read and write -- as long as keeping the current API usage.
>

If I understand the allocation of the dma buffer depends on the direction.
Each device allocate one dma_buffer for tx device and one dma buffer
for rx device

@@ -105,10 +105,16 @@ static int imx_pcm_preallocate_dma_buffer(struct
snd_pcm_substream *substream,
        size_t size = imx_pcm_hardware.buffer_bytes_max;
        int ret;

-       ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_IRAM,
-                                 dev,
-                                 size,
-                                 &substream->dma_buffer);
+       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+               ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
+                                         dev,
+                                         size,
+                                         &substream->dma_buffer);
+       else
+               ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_IRAM,
+                                         dev,
+                                         size,
+                                         &substream->dma_buffer);
        if (ret)
                return ret;

Just a snippet from me, on some of my testing. How the physical memory
is used by the kernel is nothing to do in how the memory is then mapped
by the userspace to read from it. If I allocate it consistente in
snd_dma_alloc_pages
then you can let the user remap the area as cached in his own virtual mapping.
What I'm trying to said is that behind the scene everything is
consistent but the user
will get a cache line read during the first access and then he/she
will read from the cache.
Maybe is this assumption is totally wrong?

Michael

> > > The mmap_begin and mmap_commit are the concepts in the alsa-lib side
> > > for supporting the plugins better, and they doesn't represent kernel
> > > ABI.  So, this extension would be needed at first, and the memory
> > > allocation mechanism has to be changed as well.  Last but not least,
> >
> > Are you sure about memory allocation, or just memory mapping?
>
> I thought you'd need the proper memory allocation for the coherent
> mmap?
>
> > > the concurrency has to be reconsidered if this approach is taken.
> > >
> >
> > Yes I know that is a big problem anyway. I don't have a big idea how solve it
>
> If you find a good solution, let us know.  It's a kind of historical
> obstacle, but certainly it's solvable.
>
>
> Takashi



-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com
