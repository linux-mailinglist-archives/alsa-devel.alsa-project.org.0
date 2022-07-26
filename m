Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A2581BBF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 23:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700D6846;
	Tue, 26 Jul 2022 23:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700D6846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658871731;
	bh=jqLySMYmwOOdJcApuuYt7pKwveO/jaI1q/zxmyRznZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CVbBYh8ywiqEIHgKKX0PDglS9uaGV2OoTxHqGp4poGQ0M1hWtUWDBgJrIxEDwn/Wq
	 5S1UkTQW2JbZ2xHwvu5Nk7fem/hkR1aRZ8ajtpAIxZpSgpwmv9V88g6wm7hvCsVoH8
	 g4M/NiadSlhiBpLiEgyybH4DmJCWOvCFCd/S8jBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E925F80271;
	Tue, 26 Jul 2022 23:41:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 677BCF8025A; Tue, 26 Jul 2022 23:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01530F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 23:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01530F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g9S5IxFW"
Received: by mail-ej1-x633.google.com with SMTP id l23so28436936ejr.5
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dobQXyCJnXCvhS60t6+uPgdDrEwoWKRNXHCECg4WCzQ=;
 b=g9S5IxFWudhyN2dvNUZBtI/UZ4iuQwa88c9wTdnf63zVFhWVnLiKdFPb3Ppe2Uf7Hk
 nxFz0RUrLygp7C4R7R/zJ1whmiRTdwutmLrtDvGvcKRnAnPs+p9Ge4GU5QWHfLUgmQEE
 N+wYxNGirDdB+sYUrEO1Z5n54YhVTPNrLavgWKbLvqLsj1srBrdqLhNYIOx8nmS7LNoJ
 OrySPim7JeMmL6yNVJnNaVJgElInCz5vMRF8OZ4rF5XfxEhXNPJ+FqHrQvujqiTE0QP2
 BfWrXLAUEnAmo8AWbdl34k2YkwWfKkHZzOy+vySW3QSY53JawFGf2OugDjFRZrJnPBh8
 WvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dobQXyCJnXCvhS60t6+uPgdDrEwoWKRNXHCECg4WCzQ=;
 b=nXQVVWIWso76cmUNxiUnvb4Nl3xc9kF/UOwdkz0DdMFUKb036uXchtt31Ik3bMPfDJ
 qPveCqaZN6RIXO+cSnhano8WKhcTVEIQ5uE8Irveo2cPbbgq9Ijtq1+BIaw902WFNU5f
 QpG00W9vzXeyL9sgKE667bNGvhuSMq77UYlUL9zMVMmTtAdtOpvDGSCKBTBad2oCV26w
 5Go7w7oH6kkTB5phu8VHqRdUeeJIzp0fo5COeB1Oy2b+1WV1urBDxts2l6RxGQwO+PhL
 EnFq5uKA2m35FF7QVNLcK5SWUK6JCWYyEuY0lW2Mf92wgNuUhvqc6EF0MB1cjd6Ygo2E
 +Sfw==
X-Gm-Message-State: AJIora+wDTD8CzLKctasXe6HWlPlKeiwgmIccn+PA+zYKK5wR4m5NiJI
 496LakIVb925czVE3v+mgR/hY7tPWkhflHsVEFE=
X-Google-Smtp-Source: AGRyM1shllA1rNjVCvItJFWMKXBnekv+i7L2wZ4KlwmYUZRjfGSqA85VYZmFBB9EBZbYNjZWH6EsKEKN94sxSYU4WcI=
X-Received: by 2002:a17:907:6e0e:b0:72b:9ec4:2ba2 with SMTP id
 sd14-20020a1709076e0e00b0072b9ec42ba2mr15278702ejc.300.1658871659839; Tue, 26
 Jul 2022 14:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <CANX2M5Zw_zW6ez0_wvaXL1pbLnR2jWY=T7MgkT=4a-zNkiwVig@mail.gmail.com>
 <YtuceCr5OCJcDatJ@kroah.com> <874jz82kx0.wl-tiwai@suse.de>
In-Reply-To: <874jz82kx0.wl-tiwai@suse.de>
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Tue, 26 Jul 2022 14:40:48 -0700
Message-ID: <CANX2M5Ywm+GpYY3+GsOWCLH24Nhy0M0LjBE-pHC8wFcd7SO=wQ@mail.gmail.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in snd_pcm_hw_params
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, fleischermarius@googlemail.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, consult.awy@gmail.com, syzkaller@googlegroups.com,
 its.priyanka.bose@gmail.com
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

On Sat, Jul 23, 2022 at 3:17 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 23 Jul 2022 09:00:08 +0200,
> Greg KH wrote:
> >
> > Wondeful, do you have a fix for this that solves the reported problem
> > that you have tested with the reproducer?
>
> ... or at least more detailed information.

Here is our analysis of the bug in the kernel v5.10.131.

During allocation, the `size` of the DMA buffer is not page-aligned:
https://elixir.bootlin.com/linux/v5.10.131/source/sound/core/memalloc.c#L149.
However, in sound/core/pcm_native.c:798
(https://elixir.bootlin.com/linux/v5.10.131/source/sound/core/pcm_native.c#L798),
the `size` variable is page-aligned before memset-ing the `dma_area`.
From the other BUG_ON assertions in other parts of the code, it looks
like the DMA area is not supposed to be equal to or greater than
0x200000 bytes. However, due to page-alignment, the `size` can indeed
get rounded up to 0x200000 which causes the out of bound access.

> Last but not least, you should check whether it's specific to your
> 5.10.x kernel or it's also seen with the latest upstream, too.

The bug is not reproducible on the latest mainline, because in
sound/core/memalloc.c:66
(https://github.com/torvalds/linux/blob/5de64d44968e4ae66ebdb0a2d08b443f189d3651/sound/core/memalloc.c#L66)
the allocation function `snd_dma_alloc_dir_pages()` now page-aligns
the `size` right before allocating the DMA buffer. Therefore, any
subsequent page-alignment, like the one in `snd_pcm_hw_params()` does
not cause an out of bound access.

-- 
Thanks and Regards,

Dipanjan
