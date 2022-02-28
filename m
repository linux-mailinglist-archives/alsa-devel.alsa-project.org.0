Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ACB4C9FC3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D9616BB;
	Wed,  2 Mar 2022 09:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D9616BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210908;
	bh=oyTjjtJZQ1V0eejO0fum77eNJvIPi4rP8vLs+bsB5Ik=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQDTpz5+fZfTApU9ajRneT2heIryGqcOIHYHbmaKvNln533ImEJAS757/rQ/qoPys
	 jIbXhWtJWktI6Zydwvb5rwIp3qYdmitW68M7WxqGpAY6rHOppR1k5i/5e0O+fKeqj9
	 Xa2bkW3oHrW6XHWZcPNv5wR7bOQQE6TKO1LonvKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5006DF8063E;
	Wed,  2 Mar 2022 09:34:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76070F80125; Mon, 28 Feb 2022 21:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=PRX_BODY_141,PRX_BODY_24,
 SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by alsa1.perex.cz (Postfix) with ESMTP id D7970F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 21:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7970F80125
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21SKr95E005627;
 Mon, 28 Feb 2022 14:53:09 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21SKr7Xe005624;
 Mon, 28 Feb 2022 14:53:07 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 28 Feb 2022 14:53:07 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <20220228205307.GD614@gate.crashing.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
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

On Mon, Feb 28, 2022 at 12:14:44PM -0800, Linus Torvalds wrote:
> On Mon, Feb 28, 2022 at 12:10 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > We can do
> >
> >         typeof(pos) pos
> >
> > in the 'for ()' loop, and never use __iter at all.
> >
> > That means that inside the for-loop, we use a _different_ 'pos' than outside.
> 
> The thing that makes me throw up in my mouth a bit is that in that
> 
>         typeof(pos) pos
> 
> the first 'pos' (that we use for just the typeof) is that outer-level
> 'pos', IOW it's a *different* 'pos' than the second 'pos' in that same
> declaration that declares the inner level shadowing new 'pos'
> variable.

The new "pos" has not yet been declared, so this has to refer to the
outer "pos", it cannot be the inner one.  Because it hasn't been
declared yet :-)

Compare this to
  typeof (pos) pos = pos;
where that last "pos" *does* refer to the newly declared one: that
declaration has already been done!  (So this code is UB btw, 6.3.2.1/2).

> If I was a compiler person, I would say "Linus, that thing is too ugly
> to live", and I would hate it. I'm just hoping that even compiler
> people say "that's *so* ugly it's almost beautiful".

It is perfectly well-defined.  Well, it would be good if we (GCC) would
document it does work, and if someone tested it on LLVM as well.  But it
is really hard to implement it to *not* work :-)

> Because it does seem to work. It's not pretty, but hey, it's not like
> our headers are really ever be winning any beauty contests...

It is very pretty!  Needs a comment though :-)


Segher
