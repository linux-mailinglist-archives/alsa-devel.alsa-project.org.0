Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397084C9FC8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91ED1F15;
	Wed,  2 Mar 2022 09:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91ED1F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210941;
	bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjL/ZCFcF3x/LHlU6v1DdM+NV8YdRuW65C5A6QkB1BX21UIWMNUZqGQ902eHLxMbA
	 oLKWbkpYf/hIOzfRujFDREUZjWCpD1EowLzWSoSpppe26Re8ZrJtnn+OXq7MqkvuRy
	 1bPJg/ZbIlw7NQ5H0rs4xCiRir4QJKuwGAp6vVYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D3CF8065C;
	Wed,  2 Mar 2022 09:34:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1403F8013C; Mon, 28 Feb 2022 22:13:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 671C6F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 22:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 671C6F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="fTQp+HhE"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="fTQp+HhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646082795;
 bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=fTQp+HhEyDWfdTRw9MD74D4dNoy4lJbDD6ufhn8pOCgDG9LKN5I5E2XfQsXuEnTyE
 o41BjR/wB9Zx796mcVO5HItpPdbUBqFA5gZFvpxw0W0+8SaIBYecaW0t63X4w0ysYd
 Uxmzs2O4chqjQ5mD0m0R9/q9wYnJ2eru8WGs04Zw=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id EE6F612811CE;
 Mon, 28 Feb 2022 16:13:15 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id fdilm1jMyJ2v; Mon, 28 Feb 2022 16:13:15 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646082795;
 bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=fTQp+HhEyDWfdTRw9MD74D4dNoy4lJbDD6ufhn8pOCgDG9LKN5I5E2XfQsXuEnTyE
 o41BjR/wB9Zx796mcVO5HItpPdbUBqFA5gZFvpxw0W0+8SaIBYecaW0t63X4w0ysYd
 Uxmzs2O4chqjQ5mD0m0R9/q9wYnJ2eru8WGs04Zw=
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4300:c551::527])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 980CE1280320;
 Mon, 28 Feb 2022 16:13:11 -0500 (EST)
Message-ID: <ade13f419519350e460e7ef1e64477ec72e828ed.camel@HansenPartnership.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop
 body as a ptr
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:13:09 -0500
In-Reply-To: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
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

On Mon, 2022-02-28 at 21:56 +0100, Christian König wrote:
> 
> Am 28.02.22 um 21:42 schrieb James Bottomley:
> > On Mon, 2022-02-28 at 21:07 +0100, Christian König wrote:
> > > Am 28.02.22 um 20:56 schrieb Linus Torvalds:
> > > > On Mon, Feb 28, 2022 at 4:19 AM Christian König
> > > > <christian.koenig@amd.com> wrote:
> > > > [SNIP]
> > > > Anybody have any ideas?
> > > I think we should look at the use cases why code is touching
> > > (pos)
> > > after the loop.
> > > 
> > > Just from skimming over the patches to change this and experience
> > > with the drivers/subsystems I help to maintain I think the
> > > primary pattern looks something like this:
> > > 
> > > list_for_each_entry(entry, head, member) {
> > >       if (some_condition_checking(entry))
> > >           break;
> > > }
> > > do_something_with(entry);
> > 
> > Actually, we usually have a check to see if the loop found
> > anything, but in that case it should something like
> > 
> > if (list_entry_is_head(entry, head, member)) {
> >      return with error;
> > }
> > do_somethin_with(entry);
> > 
> > Suffice?  The list_entry_is_head() macro is designed to cope with
> > the bogus entry on head problem.
> 
> That will work and is also what people already do.
> 
> The key problem is that we let people do the same thing over and
> over again with slightly different implementations.
> 
> Out in the wild I've seen at least using a separate variable, using
> a bool to indicate that something was found and just assuming that
> the list has an entry.
> 
> The last case is bogus and basically what can break badly.

Yes, I understand that.  I'm saying we should replace that bogus checks
of entry->something against some_value loop termination condition with
the list_entry_is_head() macro.  That should be a one line and fairly
mechanical change rather than the explosion of code changes we seem to
have in the patch series.

James


