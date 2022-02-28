Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34514C9F52
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:36:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A2418FA;
	Wed,  2 Mar 2022 09:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A2418FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210173;
	bh=HzISZrdQwENKzvnaKovfmEJ78/dHkj/46V9Q716etEI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ga58VlaOjbrCyVejsnjV0iKaDSfXIwAAXaExstcIo7iDlklFRS/vi1tBZi9vU4tBu
	 oznAVa6zvhfcVsreGVpjC0hir24UGKsUCWvHpYhjArOpo8zalP8fKFtUcMNZ8OEraH
	 2a8hdGqYqS6o+Bz5Rg3N96mRrzFIUAIzMoM2AnBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FDB0F8051F;
	Wed,  2 Mar 2022 09:33:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58D22F800F8; Tue,  1 Mar 2022 00:27:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16EB3F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 00:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16EB3F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="nt03mWtT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kySnWHttTi8Odl1WzgGLjQ1pb3b/AWH5qnYZSwnte50=; b=nt03mWtTaEB9qwsFMTflxzDbvW
 aPSsVBeLr8i8UFwA1l3fNavsuYE231uUwb0yDTUi43cd3zIwbEaMZqro2u+rXbOt0KZriPQpyGi5J
 +pW6oqM84XOoVppIQh3QNnM4ANpt9aIP3ShEwC0IGa2NKI/m2xxapQAyHhJG42Bevn7SuMSAnyA27
 7+3DFdmFFllbJzk1MHudhAJj7GPo/5RsA7npxrePVRbtGBQKbJeOUSye2chevgvDMrFkod2y0FmL7
 JW29U+rs2LR5a0WX3s04bvbvXotX/UjRCpaaxaXPYROyoDfpDk5Wuy418QovroPX+qbpGelik5Tc/
 I0FC9RZw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nOpPe-0090gL-Ex; Mon, 28 Feb 2022 23:26:42 +0000
Date: Mon, 28 Feb 2022 23:26:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:33 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
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
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
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

On Mon, Feb 28, 2022 at 12:37:15PM -0800, Linus Torvalds wrote:
> On Mon, Feb 28, 2022 at 12:16 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> > it catches real bugs.
> 
> Oh, we already can never use -Wshadow regardless of things like this.
> That bridge hasn't just been burned, it never existed in the first
> place.
> 
> The whole '-Wshadow' thing simply cannot work with local variables in
> macros - something that we've used since day 1.
> 
> Try this (as a "p.c" file):
> 
>         #define min(a,b) ({                     \
>                 typeof(a) __a = (a);            \
>                 typeof(b) __b = (b);            \
>                 __a < __b ? __a : __b; })
> 
>         int min3(int a, int b, int c)
>         {
>                 return min(a,min(b,c));
>         }
> 
> and now do "gcc -O2 -S t.c".
> 
> Then try it with -Wshadow.

#define ___PASTE(a, b)	a##b
#define __PASTE(a, b) ___PASTE(a, b)
#define _min(a, b, u) ({         \
        typeof(a) __PASTE(__a,u) = (a);            \
        typeof(b) __PASTE(__b,u) = (b);            \
        __PASTE(__a,u) < __PASTE(__b,u) ? __PASTE(__a,u) : __PASTE(__b,u); })

#define min(a, b) _min(a, b, __COUNTER__)

int min3(int a, int b, int c)
{
        return min(a,min(b,c));
}

(probably there's a more elegant way to do this)
