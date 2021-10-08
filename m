Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9C427FEB
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7191664;
	Sun, 10 Oct 2021 09:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7191664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852426;
	bh=yColPJm6yOsPTs9Ofu4Vy7nap/rlUla7VGg9XNMbFl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9Jokq70vHM4FqQ7z23KduF4N8bpvZytfC3kaZSvCRvMFRXkdrcG1tR9EfxToHT5L
	 k24gstMDQ2VYPtvox49J5HIUESKH6gh9CaQwIwv+Aak7HFhE6oZlaBODI2XqK3EP7m
	 roHm2m7d1sE1+LzikRIgIuO0qTUUtaeNlSX5lvg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10BD5F8051C;
	Sun, 10 Oct 2021 09:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6E33F80246; Fri,  8 Oct 2021 14:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA6F0F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 14:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA6F0F80229
Date: Fri, 8 Oct 2021 08:06:09 -0400
From: Rich Felker <dalias@libc.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
Message-ID: <20211008120609.GE7074@brightrain.aerifal.cx>
References: <s5hpmsh9kdx.wl-tiwai@suse.de>
 <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
 <s5hee8x9f92.wl-tiwai@suse.de>
 <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
 <s5hy27497eo.wl-tiwai@suse.de>
 <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de>
 <20211007165158.GC7074@brightrain.aerifal.cx>
 <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:49:29 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 musl@lists.openwall.com, Takashi Iwai <tiwai@suse.com>,
 Michael Forney <mforney@mforney.org>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
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

On Fri, Oct 08, 2021 at 11:24:39AM +0200, Arnd Bergmann wrote:
> On Fri, Oct 8, 2021 at 10:43 AM Takashi Iwai <tiwai@suse.de> wrote:
> > On Thu, 07 Oct 2021 18:51:58 +0200, Rich Felker wrote:
> > > On Thu, Oct 07, 2021 at 06:18:52PM +0200, Takashi Iwai wrote:
> >
> > @@ -557,11 +558,15 @@ struct __snd_pcm_sync_ptr {
> >  #if defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : defined(__BIG_ENDIAN)
> >  typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> >  typedef char __pad_after_uframe[0];
> > +typedef char __pad_before_u32[4];
> > +typedef char __pad_after_u32[0];
> >  #endif
> >
> >  #if defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : defined(__LITTLE_ENDIAN)
> >  typedef char __pad_before_uframe[0];
> >  typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> > +typedef char __pad_before_u32[0];
> > +typedef char __pad_after_u32[4];
> >  #endif
> 
> I think these should remain unchanged, the complex expression was intentionally
> done so the structures are laid out the same way on 64-bit
> architectures, so that
> the kernel can use the __SND_STRUCT_TIME64 path internally on both 32-bit
> and 64-bit architectures.
> 
> > @@ -2970,8 +2981,17 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
> >         memset(&sync_ptr, 0, sizeof(sync_ptr));
> >         if (get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags)))
> >                 return -EFAULT;
> > -       if (copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control), sizeof(struct snd_pcm_mmap_control)))
> > -               return -EFAULT;
> > +       if (buggy_control) {
> > +               if (copy_from_user(&sync_ptr.c.control_api_2_0_15,
> > +                                  &(_sync_ptr->c.control_api_2_0_15),
> > +                                  sizeof(sync_ptr.c.control_api_2_0_15)))
> > +                       return -EFAULT;
> > +       } else {
> > +               if (copy_from_user(&sync_ptr.c.control,
> > +                                  &(_sync_ptr->c.control),
> > +                                  sizeof(sync_ptr.c.control)))
> > +                       return -EFAULT;
> > +       }
> 
> The problem I see with this is that it might break musl's ability to
> emulate the new
> interface on top of the old (time32) one for linux-4.x and older
> kernels, as the conversion
> function is no longer stateless but has to know the negotiated
> interface version.
> 
> It's probably fine as long as we can be sure that the 2.0.16+ API
> version only gets
> negotiated if both the kernel and user sides support it, and musl only emulates
> the 2.0.15 API version from the current kernels.
> 
> I've tried to understand this part of musl's convert_ioctl_struct(), but I just
> can't figure out whether it does the conversion based the on the layout that
> is currently used in the kernel, or based on the layout we should have been
> using, and would use with the above fix. Rich, can you help me here?

If the attempted 64-bit ioctl is missing (ENOTTY), it does the
conversion to the legacy 32-bit one and retries with that, then
converts the results back to the 64-bit form.

Not only do I fail to see how the proposed fix is workable with this
framework; I also don't see how the proposed fix would let new
applications (compiled without the buggy type) run on old kernels. I'm
pretty sure there really should be a new ioctl number for this...

Rich
