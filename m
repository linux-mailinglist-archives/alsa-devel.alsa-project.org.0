Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC887B02
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 15:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C08165E;
	Fri,  9 Aug 2019 15:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C08165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565356974;
	bh=Is4IBfdW8QjzyuXAX1WqfoGlzS3YpQ1+ExQcaMriwy8=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyLtDXTW+K+U69wT2/tj5dxdYqn7mRjm/QZbaWMJuCghsBSB22bg0DhYZMHWOeafW
	 Oim4BKqxFUm53hsrVSxZd1kxtIGD983EfLG4EdZZKDoNUcwQGik2OIS+CVhZa7oSlR
	 +ZfLPv635vLXcLSnqVcfUaU7V/w71L8SNyZtMO+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 623D7F803F3;
	Fri,  9 Aug 2019 15:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3C17F803F3; Fri,  9 Aug 2019 15:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_HELO_NONE,SPF_NEUTRAL,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 645B4F8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 15:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 645B4F8036B
X-IronPort-AV: E=Sophos;i="5.64,364,1559512800"; d="scan'208";a="316018627"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:21:04 +0200
Date: Fri, 9 Aug 2019 15:21:03 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <88ac4c79-5ce3-3f1a-5f6e-3928a30a1ef5@ti.com>
Message-ID: <alpine.DEB.2.21.1908091519400.2946@hadrien>
References: <alpine.DEB.2.21.1908091229140.2946@hadrien>
 <20190809123112.GC3963@sirena.co.uk>
 <88ac4c79-5ce3-3f1a-5f6e-3928a30a1ef5@ti.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Julia Lawall <julia.lawall@lip6.fr>, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH] fix odd_ptr_err.cocci warnings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On Fri, 9 Aug 2019, Peter Ujfalusi wrote:

>
>
> On 09/08/2019 15.31, Mark Brown wrote:
> > On Fri, Aug 09, 2019 at 12:30:46PM +0200, Julia Lawall wrote:
> >
> >> tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-4.19.y/wip
> >> head:   62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a
> >> commit: 62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a [34/34] j721e new machine driver wip
> >> :::::: branch date: 20 hours ago
> >> :::::: commit date: 20 hours ago
> >>
> >>  j721e-evm.c |    4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> --- a/sound/soc/ti/j721e-evm.c
> >> +++ b/sound/soc/ti/j721e-evm.c
> >> @@ -283,7 +283,7 @@ static int j721e_get_clocks(struct platf
> >
> > This file isn't upstream, it's only in the TI BSP.
>
> Yes, it is not upstream, but the fix is valid.
>
> Julia: is it possible to direct these notifications only to me from
> https://github.com/omap-audio/linux-audio.git ?
>
> It mostly carries TI BSP stuff and my various for upstream branches nowdays.

Please discuss it with the kbuild people.  They should be able to set it
up as you want.

You can try lkp@intel.com

julia
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
