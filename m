Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E60584D3F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 10:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA931663;
	Fri, 29 Jul 2022 10:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA931663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659082480;
	bh=yDZnCB3APvLSk3XRDlJBpBbSxgoh+g1mEqhb2QgyFDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKzwCDIWqU91cC9IXxuCroC+wOgsiViN0ose5voHptXXgAma2IJNUH75SPrO137cR
	 axniOeDwJuUBLh834IHIP1Uv0TwN6z08l7s8HFY+9RSYikB5jz1lum1qkT44cUiGJO
	 G8IyaIEIFlcYS7sRQlX0cXVyWcHu6cXRnULPcI30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73623F804B1;
	Fri, 29 Jul 2022 10:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 806B6F8049C; Fri, 29 Jul 2022 10:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CD0BF80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 10:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD0BF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="DoxTatfh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CB7861CA1;
 Fri, 29 Jul 2022 08:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514A0C433C1;
 Fri, 29 Jul 2022 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659082408;
 bh=yDZnCB3APvLSk3XRDlJBpBbSxgoh+g1mEqhb2QgyFDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoxTatfhQb/8esRQ+KtIyE1ZXjVjpBPY3kglXwx7xahU4peTY6kTo9Q9Eewr9qypb
 P0HxCrA1d22/JFR6nmZRr0aSVWHxKWPxXJ8/n6a6Uz+tXizo8JA/AZm2adRqEdyp1D
 ybJyOHq+wJfDv3wuU2x9St2rAKfz4oPoNXyN5cFM=
Date: Fri, 29 Jul 2022 10:13:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dipanjan Das <mail.dipanjan.das@gmail.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in snd_pcm_hw_params
Message-ID: <YuOWpk2dDNMuiEDM@kroah.com>
References: <CANX2M5Zw_zW6ez0_wvaXL1pbLnR2jWY=T7MgkT=4a-zNkiwVig@mail.gmail.com>
 <YtuceCr5OCJcDatJ@kroah.com> <874jz82kx0.wl-tiwai@suse.de>
 <CANX2M5Ywm+GpYY3+GsOWCLH24Nhy0M0LjBE-pHC8wFcd7SO=wQ@mail.gmail.com>
 <87tu73p1o2.wl-tiwai@suse.de>
 <CANX2M5abRrSADvd3x_rm+TrA2ziu71VL6X3=v_Cft4LtaB=6Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANX2M5abRrSADvd3x_rm+TrA2ziu71VL6X3=v_Cft4LtaB=6Eg@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, fleischermarius@googlemail.com,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, linux-kernel@vger.kernel.org,
 consult.awy@gmail.com, syzkaller@googlegroups.com, its.priyanka.bose@gmail.com
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

On Thu, Jul 28, 2022 at 04:24:12PM -0700, Dipanjan Das wrote:
> On Tue, Jul 26, 2022 at 10:25 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > Thanks for the analysis.  A good news is that, at least for the
> > vmalloc() case, it's a kind of false-positive; vmalloc() always takes
> > the full pages, so practically seen, the size is page-aligned.  It's
> > fooling the memory checker, though.
> >
> > But the similar problem could be seen with genalloc calls, and this
> > was fixed by the upstream commit
> > 5c1733e33c888a3cb7f576564d8ad543d5ad4a9e
> >     ALSA: memalloc: Align buffer allocations in page size
> >
> > I suppose you can simply backport this commit to 5.10.y.  Could you
> > confirm that this fixes your problem?
> 
> We confirm that the patch you proposed fixes the problem (blocks the
> reproducer). How do we proceed with getting the issue fixed? Do we
> send a patch according to the steps detailed here:
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html?

Normally, yes, that is the correct process.  But as Takashi mentioned, I
already picked it up as I happened to see this thread.

thanks,

greg k-h
