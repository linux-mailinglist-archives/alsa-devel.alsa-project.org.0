Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 626C45752E6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A521752;
	Thu, 14 Jul 2022 18:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A521752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816598;
	bh=dolpJa8WpHCCQgqH09XJP6K/KNJJZezJeMVAXYVNIP8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjXjv8JZn2Ilvlcj6mVlTI30Eli6jS9DhE6O/NHICMD+rVvoHaaZK/VgPuEiHCDWR
	 sza0ijtMps/MDnf95S9A0a0n1jrTeVv/Pl3dUbbdn6L6Wn6kd97bEVa/hkUKZikyvH
	 oVlT51aDdd6kues9dGR8N+U1HaLZ879aOC/+Ae38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730B6F800AA;
	Thu, 14 Jul 2022 18:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D523F800E1; Mon, 11 Jul 2022 17:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8EA29F800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA29F800E1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43B71596;
 Mon, 11 Jul 2022 08:17:06 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFACE3F70D;
 Mon, 11 Jul 2022 08:17:04 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:17:37 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
Message-ID: <Ysw+3Hg+GbDjXuTn@monolith.localdoman>
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
 <Yswkb6mvwUywOTLg@sirena.org.uk>
 <YswoOE/sP088lius@monolith.localdoman>
 <Ysw2mzhw4pyrxirc@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ysw2mzhw4pyrxirc@sirena.org.uk>
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org
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

Hi,

On Mon, Jul 11, 2022 at 03:41:31PM +0100, Mark Brown wrote:
> On Mon, Jul 11, 2022 at 02:40:08PM +0100, Alexandru Elisei wrote:
> > On Mon, Jul 11, 2022 at 02:23:59PM +0100, Mark Brown wrote:
> 
> > > Please think hard before including complete backtraces in upstream
> > > reports, they are very large and contain almost no useful information
> 
> > I'm at a loss here. Are you saying that those 4 lines represent a complete
> > backtrace and they are very large? Or are you talking about the panic log
> > that I've included in the commit message?
> 
> I'm talking about the entire log that that was the start of, I deleted
> the bulk of it due to the excessive size.

Oh, that makes sense then.

> 
> > > relative to their size so often obscure the relevant content in your
> > > message. If part of the backtrace is usefully illustrative (it often is
> > > for search engines if nothing else) then it's usually better to pull out
> > > the relevant sections.
> 
> > Would you mind pointing out what you think the relevant sections are? I
> > would also find it very useful (for future patches) if you can explain why
> > they are relevant, and why those parts you've left out aren't.  It's not
> > very easy to figure out what is relevant when you're not familiar with a
> > subsystem.
> 
> It really depends what the information you're trying to convey with the
> backtrace is, in general a couple of frames of context might be useful
> if there's something interesting about the context from which things
> were called since that's the unique bit that people might search for.
> For example things like the standard set of generic functions you'd see
> when probing a device is rarely going to convey anything meaningful, and
> similarly the standard kernel entry backtrace for something triggered
> from a system call.  The full register state is also commonly not of any
> great relevance if it's not illustrating something in the rest of the
> message. 
> 
> If you are just including an entire splat on the off chance that it
> might be relevant consider just not including it rather than including
> everything.

Thanks for the explanation!

I've included the entire splat, not just the bits that prove my conclusion,
in case my conclusion is wrong and someone reading the backtrace can notice
what I missed.

In this case, the splat was definitely useful for me, because the last two
functions from the call trace point to where the bug was.

Do you want me to respin the patch with an abbreviated splat?

Thanks,
Alex
