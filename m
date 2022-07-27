Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D19581E85
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 06:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A97868;
	Wed, 27 Jul 2022 06:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A97868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658894888;
	bh=tIslpZQHFFNT/K9JXOkB7aUsG71ZAPk/2bQTBwz7ToQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tasf2+0ddiJr6rGTB0pAPH+s1Z5aZl7oZLS2kGtllN/8ngmCefMUsxQW3MbiwxYsH
	 sCmVYxwBNI+f+1FkWK4R90UOU+EqGj/jwD8agei74YecLCQpl0nCFYUdbuSuyc1Y9+
	 QQukeB9SVInQfWj3e7uqfOKA9RSQJAtEYjBu53C0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4008FF800C9;
	Wed, 27 Jul 2022 06:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16583F8015B; Wed, 27 Jul 2022 06:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B8D5F8014E
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 06:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B8D5F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KUQtujJA"
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31f443e276fso44775187b3.1
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 21:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tIslpZQHFFNT/K9JXOkB7aUsG71ZAPk/2bQTBwz7ToQ=;
 b=KUQtujJAjWwL90RNNQ4NGpYQsLaWmunFoO9ryhmUY4qibNJRzLDuja2VHm2YghJU/g
 onARSXsmS8n3KUCnD77tEw+eI0pP2RlmAHqF/KICXR7Cro2Z4Rfd3DnmdlvZ7UX1gia0
 0AiiF3U7QM1wEDQpA+LDJ74YmJ+r5kIX/dR7/1HdzAMSL8w8HZk9qzFqvSuGhgD1lYl8
 Ids+f7Qs8O+GhIWlu6rvn/zdRLAY34QrGHKZCwT9dfmd4jfuI8siSmDh7AMN+U2rwNG1
 wByWrxeQcr80cJotnT1IRrAU3iFcH4x6D1M6p6Dzqc73p5lJuOMocvrlL9FfjBcBz1Hv
 nZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIslpZQHFFNT/K9JXOkB7aUsG71ZAPk/2bQTBwz7ToQ=;
 b=uc2qKJbqC7aOO9YC2LDjUPBrO80PDkKCZHNshVTg8WVcVO+dxFakYEIh55wox/Jp+6
 ODwicWjmW/el5JLH38jKQWMb0FH7IEEM3j4FHT98Y8kmr03v2fE+wzlynVcCbPAviVua
 Gv2y7uxZH6Cx3ZMQJSdCTIlxtbvFxX2UQJvNVNHHd+yIfL3dzSy4AQPOCb841p6PRrFp
 06WX5W/6oTKjVjcu3D6KTrTD+G9FU4tLSMnc5EMfRcVsh8B1BFNBWA80VR8F0V0FS4ie
 CWKf2WYRqQ/T8EQmD2GRs88iTADilPMBrXe13NLD/82lwZsKQDWkn6NuEOFpqYH4YkCg
 pVRQ==
X-Gm-Message-State: AJIora+Ri9gw6mxjVfLF75w1UfZ0SqGJJyM/oFh3OncUQilHX2eVc+o+
 ce+nVDjHOYb98REltQD16ajYl6dIr7Br22W+XMo=
X-Google-Smtp-Source: AGRyM1vXD6mc7sPNjd40/6i06v830sQUnZYUsuoYHjtDL0+FLAMC5vERedd5qQdHzUhcz3SOFvJ/8dK/bpRZU1Ijzww=
X-Received: by 2002:a81:1ed3:0:b0:31f:5186:91c0 with SMTP id
 e202-20020a811ed3000000b0031f518691c0mr4441014ywe.401.1658894816509; Tue, 26
 Jul 2022 21:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANX2M5Zw_zW6ez0_wvaXL1pbLnR2jWY=T7MgkT=4a-zNkiwVig@mail.gmail.com>
 <YtuceCr5OCJcDatJ@kroah.com> <874jz82kx0.wl-tiwai@suse.de>
 <CANX2M5Ywm+GpYY3+GsOWCLH24Nhy0M0LjBE-pHC8wFcd7SO=wQ@mail.gmail.com>
In-Reply-To: <CANX2M5Ywm+GpYY3+GsOWCLH24Nhy0M0LjBE-pHC8wFcd7SO=wQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 27 Jul 2022 06:06:45 +0200
Message-ID: <CAKXUXMz6EmQJqKg6UNC+qD8GLUpmHfhS7OH9X6tWKpLjFpKfSg@mail.gmail.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in snd_pcm_hw_params
To: Dipanjan Das <mail.dipanjan.das@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, fleischermarius@googlemail.com,
 Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, consult.awy@gmail.com,
 syzkaller <syzkaller@googlegroups.com>, its.priyanka.bose@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Jul 26, 2022 at 11:41 PM Dipanjan Das
<mail.dipanjan.das@gmail.com> wrote:
>
> On Sat, Jul 23, 2022 at 3:17 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Sat, 23 Jul 2022 09:00:08 +0200,
> > Greg KH wrote:
> > >
> > > Wondeful, do you have a fix for this that solves the reported problem
> > > that you have tested with the reproducer?
> >
> > ... or at least more detailed information.
>
> Here is our analysis of the bug in the kernel v5.10.131.
>
> During allocation, the `size` of the DMA buffer is not page-aligned:
> https://elixir.bootlin.com/linux/v5.10.131/source/sound/core/memalloc.c#L149.
> However, in sound/core/pcm_native.c:798
> (https://elixir.bootlin.com/linux/v5.10.131/source/sound/core/pcm_native.c#L798),
> the `size` variable is page-aligned before memset-ing the `dma_area`.
> From the other BUG_ON assertions in other parts of the code, it looks
> like the DMA area is not supposed to be equal to or greater than
> 0x200000 bytes. However, due to page-alignment, the `size` can indeed
> get rounded up to 0x200000 which causes the out of bound access.
>
> > Last but not least, you should check whether it's specific to your
> > 5.10.x kernel or it's also seen with the latest upstream, too.
>
> The bug is not reproducible on the latest mainline, because in
> sound/core/memalloc.c:66
> (https://github.com/torvalds/linux/blob/5de64d44968e4ae66ebdb0a2d08b443f189d3651/sound/core/memalloc.c#L66)
> the allocation function `snd_dma_alloc_dir_pages()` now page-aligns
> the `size` right before allocating the DMA buffer. Therefore, any
> subsequent page-alignment, like the one in `snd_pcm_hw_params()` does
> not cause an out of bound access.
>

Great analysis!

Now, you would just need to identify the specific commit in the
mainline repository, where 'function `snd_dma_alloc_dir_pages()` now
page-aligns the `size` right before allocating the DMA buffer.', and
then ask for applying that commit to the v5.10 stable branch,
following the guide from
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html.
Greg KH and Sasha Levin are then going to let you know if that works
or needs rework to backport.


Lukas
