Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAF5752E2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B10317EE;
	Thu, 14 Jul 2022 18:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B10317EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816570;
	bh=5A+5Ehj8xN20D1FSnJFCESL8hnkHz+MX1T/BvQnX0iE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHd0lHkOlh4cAJtd8O0yEYTMEEhHNBWxd/5zWRBZUZ+6XwAycNACLte5fwcSCfFaT
	 eZ5yQaptwvIASAmaBAKABNZBEY8bRZdTWPHAKibAET9H4YF8iQJFjMd5FzXqkdEixv
	 uJS3LtAgMyEIAeGcIUsX5Lj92L+08SG33nRcAeQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E437F804AC;
	Thu, 14 Jul 2022 18:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8179F80256; Mon, 11 Jul 2022 15:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 36F95F80155
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 15:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F95F80155
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3857C1596;
 Mon, 11 Jul 2022 06:39:37 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22E803F70D;
 Mon, 11 Jul 2022 06:39:35 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:40:08 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
Message-ID: <YswoOE/sP088lius@monolith.localdoman>
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
 <Yswkb6mvwUywOTLg@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yswkb6mvwUywOTLg@sirena.org.uk>
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

Hi Mark,

On Mon, Jul 11, 2022 at 02:23:59PM +0100, Mark Brown wrote:
> On Mon, Jul 11, 2022 at 02:05:22PM +0100, Alexandru Elisei wrote:
> > Commit a5450aba737d ("ASoC: rockchip: i2s: switch BCLK to GPIO") switched
> > BCLK to GPIO functions when probing the i2s bus interface, but missed
> > adding a check for when devm_pinctrl_get() returns an error.  This can lead
> > to the following NULL pointer dereference on a rockpro64-v2 if there are no
> > "pinctrl" properties in the i2s device tree node:
> > 
> > [    0.658381] rockchip-i2s ff880000.i2s: failed to find i2s default state
> > [    0.658993] rockchip-i2s ff880000.i2s: failed to find i2s gpio state
> > [    0.660072] rockchip-i2s ff890000.i2s: failed to find i2s default state
> > [    0.660670] rockchip-i2s ff890000.i2s: failed to find i2s gpio state
> 
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information

I'm at a loss here. Are you saying that those 4 lines represent a complete
backtrace and they are very large? Or are you talking about the panic log
that I've included in the commit message?

> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative (it often is
> for search engines if nothing else) then it's usually better to pull out
> the relevant sections.

Would you mind pointing out what you think the relevant sections are? I
would also find it very useful (for future patches) if you can explain why
they are relevant, and why those parts you've left out aren't.  It's not
very easy to figure out what is relevant when you're not familiar with a
subsystem.

Thanks,
Alex
