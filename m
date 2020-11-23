Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B12C0A8D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 14:46:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4626241;
	Mon, 23 Nov 2020 14:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4626241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606139200;
	bh=sXRAp3+n/aEkUuCrebbXBgAlP736YDjaLEN5PmXWdZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMaAhB3A7Q2X7Y6DleBp5Zhp8bGyilpNDF0IWTdLl19m0bZaojvdmYx5LRdjjdROo
	 +N6Y7lgnfpdlyaAqI8eJOeqRomLc0xLZJqQ7Iup9pAa2Z8SZww/VzEr9FwcmMGPUP1
	 a+BWMd+4ynVquhZTY5FGulQ5j1UJGFPft8V0YJw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83FDFF804C1;
	Mon, 23 Nov 2020 14:45:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C6DF804BD; Mon, 23 Nov 2020 14:45:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E684F804B4
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 14:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E684F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="G2adCKst"
Received: by mail-wr1-x433.google.com with SMTP id m6so18633554wrg.7
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gTaCi7vMIfdyM/uQi5WQ85T6NBgBa2CqVeO7W8hC73w=;
 b=G2adCKsto988SEp6QcjvaMqME9dsEwjMjYVbdwnwfrJ+2h4puLkREBFB/R9mR4JaNd
 7lq41vPpI/oAKoulwAi9xE/V4C2VAK4Ez5sSyCgpB1xDk+t2NvOQDSKD4AcJqf7itrcH
 iV/DuL0KfPU349f/koxbISthm7EADcc7BGqSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gTaCi7vMIfdyM/uQi5WQ85T6NBgBa2CqVeO7W8hC73w=;
 b=ht7KfmguqIH54KmmCKqzgBAP3cAcIcW8EYnxT2GSw8xF0RKcu3NoxrMBhTP+Y/3PIi
 2CAkTVJKxz/XAULHKbhrHe9/Gkj1qZEpHWq/1a3J1/bPj/p/Ja0uRj+P5AJ0/QlinrmI
 0SSBdLKl+oiHstrzFSCufPrD3f3c9V2Xu8mHIqVXGpb3672kEGQKjG+lbxv9B+6AdB15
 LBtYXPqxUz7go8rS37E9Z3gdWQ2rRe0dbGznvk0vVc4dOuXBDQq703po8DSJrHyBERiv
 crKL6BVIuvpGSraViufB0Xqk85bBftJ8+gHU6yMW1LNJ/0VDoERSrF2l0Kj780TmhXU7
 YDiw==
X-Gm-Message-State: AOAM530oFroxMeqPjLXNKNwOeP29EVhf/c2OPXd6p/TnVfo1L0yNBbKd
 gISNWAF58jTKURyYOaMKcS3B1PsbS8HRGYpqs5DYbg==
X-Google-Smtp-Source: ABdhPJybOFsz7Ig21ZUjwqRhZ3zGAqPBUt2n7NUeXY3YH17nQ2zZWNaZOxFhoZmBh/X1Xt0Da5PXcVG32arqfPYN7tI=
X-Received: by 2002:adf:d082:: with SMTP id y2mr8397859wrh.301.1606139104197; 
 Mon, 23 Nov 2020 05:45:04 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uwmtixmz+RgimC_2Z31+NwRF03RJ-u0mN3NKpzhks1dzEw@mail.gmail.com>
 <s5hzh388awp.wl-tiwai@suse.de>
In-Reply-To: <s5hzh388awp.wl-tiwai@suse.de>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 23 Nov 2020 14:44:52 +0100
Message-ID: <CAOf5uwmkuQDBH5gQFA4XfkiTipYKEZ8micyEkd_Xd8KFqSDZSA@mail.gmail.com>
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

On Mon, Nov 23, 2020 at 2:23 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 21 Nov 2020 10:40:04 +0100,
> Michael Nazzareno Trimarchi wrote:
> >
> > Hi all
> >
> > I'm trying to figure out how to increase performance on audio reading
> > using the mmap interface. Right now what I understand it's that
> > allocation comes from core/memalloc.c ops that allocate the memory for
> > dma under driver/dma.
> > The reference platform I have is an imx8mm and the allocation in arm64 is:
> >
> > 0xffff800011ff5000-0xffff800012005000          64K PTE       RW NX SHD
> > AF            UXN MEM/NORMAL-NC
> >
> > This is the reason that is allocated for dma interface.
> >
> > Now access linear on the multichannel interface the performance is bad
> > but worse if I try to access a channel a time on read.
> > So it looks like it is better to copy the block using memcpy on a
> > cached area and then operate on a single channel sample. If it's
> > correct what I'm saying the mmap_begin and mmap_commit
> > basically they don't do anything on cache level so the page mapping
> > and way is used is always the same. Can the interface be modified to
> > allow cache the area during read and restore in the commit
> > phase?
>
> The current API of the mmap for the sound ring-buffer is designed to
> allow concurrent accesses at any time in the minimalistic kernel-user
> context switching.  So the whole buffer is allocated as coherent and
> mmapped in a shot.  It's pretty efficient for architectures like x86,
> but has disadvantages on ARM, indeed.

Each platform e/o architecture can specialize the mmap and declare the
area that is consistent in dma to me mapped
as no cache one

vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
                return remap_pfn_range(vma, vma->vm_start,
                                vma->vm_end - vma->vm_start, vma->vm_page_prot);

I have done it for testing purposes. This give an idea

- read multi channel not sequentially took around 12% of the cpu with
mmap interface
- read multi channel use after a memcpy took around 6%
- read on a cached area took around 3%. I'm trying to figure out how
and when invalidate the area

I have two use cases:
- write on the channels (no performance issue)
- read on channels

Before reading I should only say that the cached area is not in sync
with memory. I think that supporting write use cases
makes little sense here.

>
> The mmap_begin and mmap_commit are the concepts in the alsa-lib side
> for supporting the plugins better, and they doesn't represent kernel
> ABI.  So, this extension would be needed at first, and the memory
> allocation mechanism has to be changed as well.  Last but not least,

Are you sure about memory allocation, or just memory mapping?

> the concurrency has to be reconsidered if this approach is taken.
>

Yes I know that is a big problem anyway. I don't have a big idea how solve it

Michael

> That said, it's possible in theory, but practically no trivial task.
>
>
> thanks,
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
