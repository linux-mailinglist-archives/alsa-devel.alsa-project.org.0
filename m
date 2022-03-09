Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 603914D3AEC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D773316A9;
	Wed,  9 Mar 2022 21:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D773316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646857042;
	bh=r4JONymDP9FZ8PuuMTEZBbzzT2AL8k/E9zLUmaaBFJw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FEu3+IYn/pzXpZ+J4Jy1MX7bCa5H8RKo3IC7wq/w3TLJV7K3cYyhTYWSEEfeND3fk
	 PX5KoE7El9sXsS8vLDsPAe2X5WfOSX2Q0N8oBj3OFCO1U6Yy4oKT+4+AjxWINsSsEy
	 XNuTBZ3nESaeAreWkrQMsRnEhKbHZDYq2pNSI9xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4658DF8012F;
	Wed,  9 Mar 2022 21:16:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E569F8016C; Wed,  9 Mar 2022 21:16:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0537F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0537F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="r09/xqQt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=qUvLtHVMxTZ4ULy0Xu+hnD7i1YDCW7jL7kYz3fRzYx0=; b=r09/x
 qQt0qRQh+AM35iZCcudF+6CBVQGdzRQj4JeL4SoJFWWt11x/hSCyuHje3oncg7+TSLqfmWoJ/VPFh
 yHxHZw84ES+tTvqWk0uPMEak5HHaRfUAu/aHEOJlQs61iTR+QOwXs8YvSbTO0OyHY4gdsu+AiJJeB
 7HEQ3FGbDXri6/qwMjVo4hvsd97uTd6Lb8i03iuccRfRp7kMf2EJumvBVnZ3zxWR8VB/jkATVxnBf
 xC9t3K/T2UwDIJsc95C+3q+iW3DFQ/5zyI/M0aP4vpYMvWTJH6Wev7W6AY54VjJq+kPZsrh2G2hsh
 c9wgKd6crytfY08DtWcoftRnr5FSw==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nS2jB-0007ax-5w; Wed, 09 Mar 2022 20:16:09 +0000
Date: Wed, 9 Mar 2022 20:16:07 +0000
From: John Keeping <john@metanate.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Message-ID: <YikLB4+xHVxjFTSL@donbot>
References: <20220309135649.195277-1-john@metanate.com>
 <YijOHNT0eqDyoviP@sirena.org.uk> <YijTk0/UTXpjFiRq@donbot>
 <YijVrgZ+Ysv9J/8E@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YijVrgZ+Ysv9J/8E@sirena.org.uk>
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

On Wed, Mar 09, 2022 at 04:28:30PM +0000, Mark Brown wrote:
> On Wed, Mar 09, 2022 at 04:19:31PM +0000, John Keeping wrote:
> > On Wed, Mar 09, 2022 at 03:56:12PM +0000, Mark Brown wrote:
> 
> > > I'm still not seeing the functional change here.  The actual state of
> > > the GPIO is identical in both cases, all that's changing is the logical
> > > view internally to the kernel.
> 
> > Ah, sorry, I'm considering it functional since it changes the device
> > tree ABI.
> 
> > Used with the same device tree with, say, GPIO_ACTIVE_HIGH the physical
> > state of the GPIO will change as a result of this patch and the device
> > tree needs to be updated to use GPIO_ACTIVE_LOW.
> 
> I think the device tree binding needs to be clarified here to be
> explicit about this since there's obviously some room for user confusion
> here.  We can probably get away with a change at this point since it's
> not hit a release but we do need to try to avoid the situation where any
> other implementations use active high polarity for the bindings.

Taking a quick survey of the other devices that have a pdn-gpios
property:

- tvp5150 is correct with the driver setting 0 to make the device active

- tas571x also sets 0 to make the device active

- ak4375 uses the opposite sense setting PDN = 1 to make the device
  active; this has no in-tree users and was merged as part of v5.17-rc1
  so it's not in a released kernel yet
