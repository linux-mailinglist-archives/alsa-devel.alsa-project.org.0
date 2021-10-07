Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D71F425245
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 13:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE901657;
	Thu,  7 Oct 2021 13:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE901657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633607428;
	bh=yzWPrAUyStofkzAwGJ+4VZNn9Z7qEouLTwfWOeGYXtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vskrRJHTTKjiKhd5XPMMBM+U6JSmohOU/kqGzdT0OnZlNFjn/QHv3GhH910JMUZuy
	 4v93dkA+Jr/M3AEe5J7yA3jhaP12JxlfaR+BT5N+DbNhEfDjhrzGa3olxiDM7LxJns
	 syNR0CL3MAJ+8JodJOpV3l4pyTRmnNaz0HMkrUa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84FE9F8028B;
	Thu,  7 Oct 2021 13:49:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE592F8027D; Thu,  7 Oct 2021 13:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31621F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 13:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31621F80130
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRVy9-1mBXKN2RrZ-00NUat for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021
 13:49:02 +0200
Received: by mail-wr1-f54.google.com with SMTP id r7so18162042wrc.10
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 04:49:02 -0700 (PDT)
X-Gm-Message-State: AOAM532KTmydtxxkybE4jIcHj8tArn5QwLdeBFNBCR465t5hGSaDl5He
 f6tqAoqkZSAp++IcEDUjFHWC/PMKwn/twVwUY5c=
X-Google-Smtp-Source: ABdhPJwBqe32vcpMnUIo0FX0+1s94CEa3VaWPex61C+7oJ6HCqGwk1cCqJIBbEf/G+UjX5v7CY40bq/ji3zFDNEaLaM=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr15888675wmj.1.1633607340709; 
 Thu, 07 Oct 2021 04:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <20191211212025.1981822-9-arnd@arndb.de>
 <29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org> <s5hpmsh9kdx.wl-tiwai@suse.de>
In-Reply-To: <s5hpmsh9kdx.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Oct 2021 13:48:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
Message-ID: <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit layout for
 snd_pcm_mmap_status/control
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:m/xQRbfKirZEJs1ki8YTSD+vkf93UCaOwRKmp121yZH6vcEmjKt
 oTduMZvm3Gm3/Oxp7GUtxSLNaq8wnQWO4rYaDMANVZyiOOxuxuydt8jGL4yNEVAGfisycMS
 F/ufmRAldCMDf4FXbmhiNmrBpKJd133+kRiCbifrg5y715piz1zQBRNuyDcmRKdtNuvAFZi
 dQVuqfnBSDu9viKJHJbkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bm8dRng4m6o=:y0WU/ZIgpt5Aa7P8Hsy9pf
 d+RQvtGfCsS55zqyPj9HO7eIJuPqPwu6tObW53pL8pvBOyTmKpSTZ0KshvwY3Asr9nXJ2zJIg
 XvkRUWkUG7rzU0u+VnqwZ2CD7oozSNdr7krxOHnH6//ywSwSHU7wOkj9nHXWdov1regdv2mTY
 633C7TBY+yPQMz++FGsJKHJRyMkuXZR1iKyDq/mtfubdftnUngcZDl6jo6N6X2/a9+1gogE6a
 1H7Ut+JHKLHNHghYQ8/pN9vD2LScXwqJmaFBe5KQovv+QXLrmUnSWnaHPZNYwA473yHgTEBVg
 3NrgLzjr7BIAjzqxvo65tKCurUR5rWyXXh0hCoGxUKFgtCoNzqdW/SQF8vQC2K1InOO0Lyg4I
 cfQyynOhoZ/BoYrse1/7OuXztAgZctfsSfY9R81NzCAmS4srL4U0MfRyLCy7l3iNxiG4I9QFh
 U+/LtoHdAZ1o4tVCkPkX4km2P9fcuqTyBLOwhTFDMidIaUaqfzF3xM7E7+Mr9ZPAnEFnyX7bw
 SpOhJVresoKhhzlLJYB0pJ9hNe1Em5z6A768lXatvFxKKCXFSQ0OcUc0LMDQTYQBynNsPfabu
 xa7W6itQNBJVpv488BVV4T9n1BjaZQ76ytYP6bhOxPvpq9KhbBg9ci88M5G3hrOBAegkW1u7h
 H3nkyMidfxgiWjrbDVppxIu0smX36HeD/w0WK2poNJBMLFc+T4FLaoH429cHOVB2P57s3hwj0
 uKLykW+bw3rkVFjFVlDKKJUqm7UlWLGiZU5VahM9/J1CgXNK66JO7Ax74+XOdFGnnHAGA/C4F
 hjYLmgft01WcoBYNIbek24+hFNBmzGl3ZtFWW+84K3B2u2plkGm3CeHstzgnbI8EfAZWG1NSk
 Ucjh5WC1YvqVCVPgvstw==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Michael Forney <mforney@mforney.org>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
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

On Thu, Oct 7, 2021 at 12:53 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 06 Oct 2021 19:49:17 +0200, Michael Forney wrote:
> >
> > Arnd Bergmann <arnd@arndb.de> wrote:
> > > +#if defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : defined(__BIG_ENDIAN)
> > > +typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> > > +typedef char __pad_after_uframe[0];
> > > +#endif
> > > +
> > > +#if defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : defined(__LITTLE_ENDIAN)
> > > +typedef char __pad_before_uframe[0];
> > > +typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> > > +#endif
> > > +
> > > +struct __snd_pcm_mmap_status64 {
> > > +   __s32 state;                    /* RO: state - SNDRV_PCM_STATE_XXXX */
> > > +   __u32 pad1;                     /* Needed for 64 bit alignment */
> > > +   __pad_before_uframe __pad1;
> > > +   snd_pcm_uframes_t hw_ptr;       /* RO: hw ptr (0...boundary-1) */
> > > +   __pad_after_uframe __pad2;
> > > +   struct __snd_timespec64 tstamp; /* Timestamp */
> > > +   __s32 suspended_state;          /* RO: suspended stream state */
> > > +   __u32 pad3;                     /* Needed for 64 bit alignment */
> > > +   struct __snd_timespec64 audio_tstamp; /* sample counter or wall clock */
> > > +};
> > > +
> > > +struct __snd_pcm_mmap_control64 {
> > > +   __pad_before_uframe __pad1;
> > > +   snd_pcm_uframes_t appl_ptr;      /* RW: appl ptr (0...boundary-1) */
> > > +   __pad_before_uframe __pad2;
> >
> > I was looking through this header and happened to notice that this
> > padding is wrong. I believe it should be __pad_after_uframe here.
> >
> > I'm not sure of the implications of this typo, but I suspect it
> > breaks something on 32-bit systems with 64-bit time (regardless of
> > the endianness, since it changes the offset of avail_min).

Thanks a lot for the report! Yes, this is definitely broken in some ways.

> Right, that's the expected breakage.  It seems that the 64bit time on
> 32bit arch is still rare, so we haven't heard a regression by that, so
> far...

It might actually be worse: on a native 32-bit kernel, both user space
and kernel see the same broken definition with a 64-bit time_t, which
would end up actually making it work as expected. However, in
compat mode, the layout seen on the 32-bit user space is now
different from what the 64-bit kernel has, which would in turn not
work, in both the SNDRV_PCM_IOCTL_SYNC_PTR ioctl and in
the mmap() interface.

Fixing the layout to look like the way we had intended would make
newly compiled applications work in compat mode, but would break
applications built against the old header on new kernels and also
newly built applications on old kernels.

I still hope I missed something and it's not quite that bad, but I
fear the best we can do in this case make the broken interface
the normative one and fixing compat mode to write
mmap_control64->avail_min in the wrong location for
SNDRV_PCM_IOCTL_SYNC_PTR, as well as disabling
the mmap() interface again for compat tasks.

As far as I can tell, the broken interface will always result in
user space seeing a zero value for "avail_min". Can you
make a prediction what that would mean for actual
applications? Will they have no audio output, run into
a crash, or be able to use recover and appear to work normally
here?

       Arnd
