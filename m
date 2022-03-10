Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E616C4D52EA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 21:10:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8801A26;
	Thu, 10 Mar 2022 21:10:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8801A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646943056;
	bh=f0ZiD/rzsPiuzktvV7mtXMZDC6eMTmDtrO09yEZKOsM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jz2COgnV2wBb08Glk82qJ4CAAa3puXN1dE9fphruSlWPQnz5dUqM/zP/TcHbJyep2
	 movA4Ga+iNcNBXVQiiM8PVjRvQD0jZPG4jeqQGjVpVr4OvRHWpB7OkIfnHvkfI4J4G
	 o82ETczWUHfoxSESW/Peb361/+tJ/4ETf3SecH0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43283F80517;
	Thu, 10 Mar 2022 21:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DD70F80516; Thu, 10 Mar 2022 21:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE02CF8027B
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 21:09:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE02CF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="KLfK5LOP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=EudowKxfuxNie/ZjDfg6vUBWXj6aFVtwbByn8cDt7u0=; b=KLfK5
 LOPvlCEY+dbh4fbpastBX+zfJn5iFUDHcdp+MUaGJd5qE9DZWpDNYguBfD7VQtiWoXPch/2af1BPo
 9N/bXphDDYVXm7QWcFOWTlx/wAohslHDHNewkmh+dq/7vIUGvISsGltk3Bi8/k7z8Saf+n51heS+k
 +QImFLyPlJ3vlXVX2wlVKWauAClsOHiGF1hRHuxuwaN5BvgKiPrh1yyKLVUD+uHMMt83ZCO80Pa6T
 yQt9ZYB056GPJz7MgCafSaTxvWm0Fu4n3WlaZXFnKYmsm+ShpX1KrOeStWLL9HTWvRSFOKztcaHPr
 jHrlLpTaAwL5rAEaRIML00ecOT8JQ==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nSP6Z-0001lX-L2; Thu, 10 Mar 2022 20:09:47 +0000
Date: Thu, 10 Mar 2022 20:09:42 +0000
From: John Keeping <john@metanate.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Message-ID: <YipbBti4yeq2HzCe@donbot>
References: <20220309135649.195277-1-john@metanate.com>
 <YijOHNT0eqDyoviP@sirena.org.uk> <YijTk0/UTXpjFiRq@donbot>
 <YijVrgZ+Ysv9J/8E@sirena.org.uk> <YikLB4+xHVxjFTSL@donbot>
 <YikiXAseSiODXfrD@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YikiXAseSiODXfrD@sirena.org.uk>
X-Authenticated: YES
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Wed, Mar 09, 2022 at 09:55:40PM +0000, Mark Brown wrote:
> On Wed, Mar 09, 2022 at 08:16:07PM +0000, John Keeping wrote:
> > On Wed, Mar 09, 2022 at 04:28:30PM +0000, Mark Brown wrote:
> 
> > > I think the device tree binding needs to be clarified here to be
> > > explicit about this since there's obviously some room for user confusion
> > > here.  We can probably get away with a change at this point since it's
> > > not hit a release but we do need to try to avoid the situation where any
> > > other implementations use active high polarity for the bindings.
> 
> > Taking a quick survey of the other devices that have a pdn-gpios
> > property:
> 
> > - tvp5150 is correct with the driver setting 0 to make the device active
> 
> > - tas571x also sets 0 to make the device active
> 
> > - ak4375 uses the opposite sense setting PDN = 1 to make the device
> >   active; this has no in-tree users and was merged as part of v5.17-rc1
> >   so it's not in a released kernel yet
> 
> Sure, I still think it would be good to update the binding document to
> clarify things as part of your patch - the binding currently just has it
> as the "pdn" pin not the /pdn pin or anything.

I've been thinking about this but I can't really think what to say.
tas571x's binding says:

	GPIO specifier for the TAS571x's active low powerdown line

Is that the sort of wording you have in mind?

To me it seems like a general principle that the GPIO_ACTIVE_{HIGH,LOW}
flags should be used to indicate how the pin works so that the driver
consistently uses logical levels regardless of how the hardware is
wired.

From the driver point of view pdn-gpios is effectively reset-gpios by
another name and it's pretty consistent that setting a reset GPIO to 1
means the device is inaccessible.

Maybe this just means I'm approaching this "down" from the software
abstraction more than "up" from the hardware.
