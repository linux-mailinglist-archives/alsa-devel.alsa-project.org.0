Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3C4C9FD8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:51:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD4F1F3B;
	Wed,  2 Mar 2022 09:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD4F1F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211073;
	bh=gnitHaDoKtFYFmdfHx7ZmUK+2K99mC4OdMWiGF3yqts=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3QdgYCvFnetrKPxFpS59deljFIR3pDwOGIVw0AZVgXVuZHB9wj1RcFjsE0cVTZr9
	 HgPhCEJ1SFqiHItXUcKfzVLeRfDwoysa+MGFbBxZ6O08FQH/O8ovrHnpT8qAdfpnn/
	 LNnsDXmJQtslrvocD92/zK09DiqgEflbw3of6kaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2F1F806E9;
	Wed,  2 Mar 2022 09:34:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3025EF8013C; Mon, 28 Feb 2022 23:29:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB2CF80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 23:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB2CF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="aDv+zUJM"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="u33hwQnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646087344;
 bh=gnitHaDoKtFYFmdfHx7ZmUK+2K99mC4OdMWiGF3yqts=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=aDv+zUJMVLbpHnTobs88HMeKXt8e/Fsm3NyltqbtXmut8dDpKPmgZQHvU7CQAhpxT
 x8yyOH8cKkqI9wCCVd7mWgGGPtOdFvurEvTcoJzgoG8F+eqVyUcxI30U1Z3UyKmv+s
 JFRv6cmaJ/MAgdj571KO+Pve8Zec5bTLqNmzMPjU=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2FE4A1281036;
 Mon, 28 Feb 2022 17:29:04 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id UdsLtl38GfVe; Mon, 28 Feb 2022 17:29:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646087343;
 bh=gnitHaDoKtFYFmdfHx7ZmUK+2K99mC4OdMWiGF3yqts=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=u33hwQnb0VqdOXP8ulufSc5IRuZCZipVBGZNcGF9+k1EE0TmKFXpcGOMGd4fMwEgO
 9syQhDBoNk9Z7GUqfbwA47rALQtXFHUxFeSSP/G0sxjEsJWs9EMuAmppU6twhzQzk+
 fAgT3F3AJIbVTwM2ufsCoBYKhhHBSRhleqdyR2l4=
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4300:c551::527])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C21DB1280D34;
 Mon, 28 Feb 2022 17:28:59 -0500 (EST)
Message-ID: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop
 body as a ptr
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mike Rapoport <rppt@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 17:28:58 -0500
In-Reply-To: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Mon, 2022-02-28 at 23:59 +0200, Mike Rapoport wrote:
> 
> On February 28, 2022 10:42:53 PM GMT+02:00, James Bottomley <
> James.Bottomley@HansenPartnership.com> wrote:
> > On Mon, 2022-02-28 at 21:07 +0100, Christian König wrote:
[...]
> > > > I do wish we could actually poison the 'pos' value after the
> > > > loop somehow - but clearly the "might be uninitialized" I was
> > > > hoping for isn't the way to do it.
> > > > 
> > > > Anybody have any ideas?
> > > 
> > > I think we should look at the use cases why code is touching
> > > (pos) after the loop.
> > > 
> > > Just from skimming over the patches to change this and experience
> > > with the drivers/subsystems I help to maintain I think the
> > > primary pattern looks something like this:
> > > 
> > > list_for_each_entry(entry, head, member) {
> > >      if (some_condition_checking(entry))
> > >          break;
> > > }
> > > do_something_with(entry);
> > 
> > Actually, we usually have a check to see if the loop found
> > anything, but in that case it should something like
> > 
> > if (list_entry_is_head(entry, head, member)) {
> >    return with error;
> > }
> > do_somethin_with(entry);
> > 
> > Suffice?  The list_entry_is_head() macro is designed to cope with
> > the bogus entry on head problem.
> 
> Won't suffice because the end goal of this work is to limit scope of
> entry only to loop. Hence the need for additional variable.

Well, yes, but my objection is more to the size of churn than the
desire to do loop local.  I'm not even sure loop local is possible,
because it's always annoyed me that for (int i = 0; ...  in C++ defines
i in the outer scope not the loop scope, which is why I never use it.

However, if the desire is really to poison the loop variable then we
can do

#define list_for_each_entry(pos, head, member)				\
	for (pos = list_first_entry(head, typeof(*pos), member);	\
	     !list_entry_is_head(pos, head, member) && ((pos = NULL) == NULL;			\
	     pos = list_next_entry(pos, member))

Which would at least set pos to NULL when the loop completes.

> Besides, there are no guarantees that people won't
> do_something_with(entry) without the check or won't compare entry to
> NULL to check if the loop finished with break or not.

I get the wider goal, but we have to patch the problem cases now and a
simple one-liner is better than a larger patch that may or may not work
if we ever achieve the local definition or value poisoning idea.  I'm
also fairly certain coccinelle can come up with a use without checking
for loop completion semantic patch which we can add to 0day.

James


