Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E41427FEE
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9482416A1;
	Sun, 10 Oct 2021 09:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9482416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852465;
	bh=2Epc1JOVncYxlfvMjk2UGLbiAw9fMTXZDFSwLgleku8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWCuj4RghfcXOnbPbRVwjHzw8BLH6xcLaIScSLPce9Uz8XRg7HaYZEuu3zT7gMCAu
	 V1UgVVx5o/dW763I8oE0qQWsx0Ar/qXTQAl4lHEs12HW6DlJWq1OjDIpIkXp3ZTx0l
	 S9ZZctbDmCKU6KSzDcOyvWSx8ZKoS8OcOlBOQR1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75651F80524;
	Sun, 10 Oct 2021 09:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 489F6F80246; Fri,  8 Oct 2021 19:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DA5F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 19:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DA5F80229
Date: Fri, 8 Oct 2021 13:20:10 -0400
From: Rich Felker <dalias@libc.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
Message-ID: <20211008172010.GG7074@brightrain.aerifal.cx>
References: <s5hee8x9f92.wl-tiwai@suse.de>
 <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
 <s5hy27497eo.wl-tiwai@suse.de>
 <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de>
 <20211007165158.GC7074@brightrain.aerifal.cx>
 <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <20211008120609.GE7074@brightrain.aerifal.cx>
 <CAK8P3a2=X5tPppmcV4x9=pyodiPfoq=tA5jVKuMwA1nKJe=_bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2=X5tPppmcV4x9=pyodiPfoq=tA5jVKuMwA1nKJe=_bA@mail.gmail.com>
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

On Fri, Oct 08, 2021 at 02:37:12PM +0200, Arnd Bergmann wrote:
> On Fri, Oct 8, 2021 at 2:06 PM Rich Felker <dalias@libc.org> wrote:
> > On Fri, Oct 08, 2021 at 11:24:39AM +0200, Arnd Bergmann wrote:
> > >
> > > I've tried to understand this part of musl's convert_ioctl_struct(), but I just
> > > can't figure out whether it does the conversion based the on the layout that
> > > is currently used in the kernel, or based on the layout we should have been
> > > using, and would use with the above fix. Rich, can you help me here?
> >
> > If the attempted 64-bit ioctl is missing (ENOTTY), it does the
> > conversion to the legacy 32-bit one and retries with that, then
> > converts the results back to the 64-bit form.
> 
> I understand that it tries to do that.
> 
> The part that I'm not sure about is which of the two possible
> 64-bit forms it's using -- the broken one we have defined in the
> kernel headers, or the one we were trying to define but failed.

It's attempting to convert the intended format, not the one that the
uapi headers defined. That is, it's taking padded-to-64-bit values at
offsets 0 and 8 in __snd_pcm_mmap_control64, putting them at offsets 0
and 4 in the 32-bit struct, and padding them back to 64-bit in the
result.

Since applications would have been compiled with the buggy
(unintended) version of the uapi headers, this will not match the
application's layout of the struct. I haven't worked through what all
the consequences of that are, but I think some fix is needed here in
musl regardless of what happens on the kernel side.

Rich
