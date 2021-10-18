Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195AD43201F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:44:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 957C417A8;
	Mon, 18 Oct 2021 16:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 957C417A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634568273;
	bh=mp5slY3pH6jtKvFPeDz7Bq+9oE34L302stiLXtdIS7A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAV+5IC6nHLVYadZ1Bjbbv5U+UG36eVbfghnaNzI2fkiv1wvnpdRmpPEbr3waX/N1
	 it7+RvK6+giY0wU2nge7b/rDkdRbJBdO/lOZKYzKktDUndHpwguFRSmGeC0RoN0GLE
	 9NJZrWJ7yeUecoTDsBCep/I8bGrUgpUh0IVzeOfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08251F801DB;
	Mon, 18 Oct 2021 16:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FBE0F80224; Mon, 18 Oct 2021 16:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0110F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0110F801DB
Date: Mon, 18 Oct 2021 10:43:00 -0400
From: Rich Felker <dalias@libc.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
Message-ID: <20211018144259.GK7074@brightrain.aerifal.cx>
References: <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
 <s5hy27497eo.wl-tiwai@suse.de>
 <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de>
 <20211007165158.GC7074@brightrain.aerifal.cx>
 <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <s5hv9277oux.wl-tiwai@suse.de>
 <20211008120736.GF7074@brightrain.aerifal.cx>
 <s5hsfx95n99.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsfx95n99.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
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

On Sun, Oct 10, 2021 at 09:53:38AM +0200, Takashi Iwai wrote:
> On Fri, 08 Oct 2021 14:07:39 +0200,
> Rich Felker wrote:
> > 
> > On Fri, Oct 08, 2021 at 01:11:34PM +0200, Takashi Iwai wrote:
> > > On Fri, 08 Oct 2021 11:24:39 +0200,
> > > Arnd Bergmann wrote:
> > > > 
> > > > On Fri, Oct 8, 2021 at 10:43 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > > > On Thu, 07 Oct 2021 18:51:58 +0200, Rich Felker wrote:
> > > > > > On Thu, Oct 07, 2021 at 06:18:52PM +0200, Takashi Iwai wrote:
> > > > >
> > > > > @@ -557,11 +558,15 @@ struct __snd_pcm_sync_ptr {
> > > > >  #if defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : defined(__BIG_ENDIAN)
> > > > >  typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> > > > >  typedef char __pad_after_uframe[0];
> > > > > +typedef char __pad_before_u32[4];
> > > > > +typedef char __pad_after_u32[0];
> > > > >  #endif
> > > > >
> > > > >  #if defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : defined(__LITTLE_ENDIAN)
> > > > >  typedef char __pad_before_uframe[0];
> > > > >  typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> > > > > +typedef char __pad_before_u32[0];
> > > > > +typedef char __pad_after_u32[4];
> > > > >  #endif
> > > > 
> > > > I think these should remain unchanged, the complex expression was intentionally
> > > > done so the structures are laid out the same way on 64-bit
> > > > architectures, so that
> > > > the kernel can use the __SND_STRUCT_TIME64 path internally on both 32-bit
> > > > and 64-bit architectures.
> > > 
> > > That was explicitly defined, but OK, this isn't necessarily defined
> > > here.
> > > 
> > > > > @@ -2970,8 +2981,17 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
> > > > >         memset(&sync_ptr, 0, sizeof(sync_ptr));
> > > > >         if (get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags)))
> > > > >                 return -EFAULT;
> > > > > -       if (copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control), sizeof(struct snd_pcm_mmap_control)))
> > > > > -               return -EFAULT;
> > > > > +       if (buggy_control) {
> > > > > +               if (copy_from_user(&sync_ptr.c.control_api_2_0_15,
> > > > > +                                  &(_sync_ptr->c.control_api_2_0_15),
> > > > > +                                  sizeof(sync_ptr.c.control_api_2_0_15)))
> > > > > +                       return -EFAULT;
> > > > > +       } else {
> > > > > +               if (copy_from_user(&sync_ptr.c.control,
> > > > > +                                  &(_sync_ptr->c.control),
> > > > > +                                  sizeof(sync_ptr.c.control)))
> > > > > +                       return -EFAULT;
> > > > > +       }
> > > > 
> > > > The problem I see with this is that it might break musl's ability to
> > > > emulate the new
> > > > interface on top of the old (time32) one for linux-4.x and older
> > > > kernels, as the conversion
> > > > function is no longer stateless but has to know the negotiated
> > > > interface version.
> > > > 
> > > > It's probably fine as long as we can be sure that the 2.0.16+ API
> > > > version only gets
> > > > negotiated if both the kernel and user sides support it, and musl only emulates
> > > > the 2.0.15 API version from the current kernels.
> > > > 
> > > > I've tried to understand this part of musl's convert_ioctl_struct(), but I just
> > > > can't figure out whether it does the conversion based the on the layout that
> > > > is currently used in the kernel, or based on the layout we should have been
> > > > using, and would use with the above fix. Rich, can you help me here?
> > > 
> > > So, at this moment, I'm not sure whether we should correct the struct
> > > at all.  This will lead to yet more breakage, and basically the struct
> > > itself *works* -- the only bug is in 32bit compat handling in the
> > > kernel (again).
> > > 
> > > The below is a revised kernel patch (again untested), just correcting
> > > the behavior of 32bit compat mode.  32bit apps on 32bit kernel work
> > > fine as is, as well as 64bit apps on 64bit kernel.
> > 
> > I'm perfectly okay with this if Arnd is! It's probably the least
> > invasive and has the least long-term maintenance cost and fallout on
> > other projects.
> 
> OK, I'll submit a proper patch now, to be included in the next PR for
> 5.15-rc.  For further fixes, let's think carefully.

Am I correct in my understanding that the fix of keeping the "broken"
definition (and having the 64-bit kernel honor it for 32-bit binaries)
has been accepted? Since musl's translation for pre-time64 kernels
seems to have been using the "non-broken" definition, I think
completing the fix requires a change in musl too.

Rich
