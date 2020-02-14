Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F6E15E96B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 18:07:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8886169F;
	Fri, 14 Feb 2020 18:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8886169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581700077;
	bh=KRlR803jVoxJ8CTZdZQEiAATY7ETRmDhQCF+L5F5lkc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HX4IFpbSYMF8NaB3lPRQt8MZybtZBl3X8F9jQSigWXPgDZ14Yy2HoYVJSMy6mCzaP
	 3RAfuE13attEEi6OkmZaTUYwJY+4N1ollDtvJY7N0yUyEyJJFAnlo3NSAkNrUwhxkW
	 lsIgtlVUggmctbnoId3nWbWLsLLj0Y9RrGNM0siw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F40D7F80086;
	Fri, 14 Feb 2020 18:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF782F8013E; Fri, 14 Feb 2020 18:06:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 6DFE3F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 18:06:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFE3F80086
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id CF2AC80E7;
 Fri, 14 Feb 2020 17:06:46 +0000 (UTC)
Date: Fri, 14 Feb 2020 09:05:59 -0800
From: Tony Lindgren <tony@atomide.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200214170559.GA64767@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214124920.GH4827@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214124920.GH4827@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Allocate dais dynamically for
 TDM and audio graph card
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

* Mark Brown <broonie@kernel.org> [200214 12:50]:
> On Fri, Feb 14, 2020 at 02:41:30PM +0200, Peter Ujfalusi wrote:
> > On 12/02/2020 16.35, Tony Lindgren wrote:
> 
> > > Oops, that's not good. So should we just keep the old naming if there's
> > > only one endpoint?
> 
> > That's an option, yes, if we really need extra dummy McBSP DAIs at all,
> > again, let's hear from Morimoto-san or Mark.
> 
> We really shouldn't need dummy DAIs at all I think, if we do it feels
> like there's a problem.  It's quite possible that there is actually a
> problem here though...

It's dummy in the droid4 voice call case as mcbsp is not the clock-master
and there's nothing to configure for mcbsp.

But I guess in some cases mcbsp could be the clock-master and then the
secondary DAI would have ops.

I could be wrong though, this is just based on my experience with
getting one device working.

Regards,

Tony
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
