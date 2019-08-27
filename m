Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5EA1E2A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB18F16CD;
	Thu, 29 Aug 2019 16:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB18F16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090819;
	bh=Cqz49eKE4ZIxxrSF9TWF4G2uOInayQidLfD1Xephs2I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vOi4nQ3/Q9NMnD+vu2gqckXRHx8QxpQzt0vkZiQtsHG/6R5h+nupJoi1rLreFH1EI
	 UrR7fEEOtNwpTy9nGb6bVqwmJudafNshXuO5UN32prYW2o8UCqyYiqr7b9WGyZpPzB
	 U8F2AYgMwTBlDaKyyMuLORfJDzpIa5LOKQQnH00Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD85F896DA;
	Wed, 28 Aug 2019 07:59:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04FC3F80274; Tue, 27 Aug 2019 09:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B3A7F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 09:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B3A7F801ED
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id C00E63C04C0;
 Tue, 27 Aug 2019 09:48:25 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcAj9duXrQVl; Tue, 27 Aug 2019 09:48:20 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 2A5D93C00C5;
 Tue, 27 Aug 2019 09:48:20 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 27 Aug 2019 09:48:19 +0200
Date: Tue, 27 Aug 2019 09:48:17 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190827074817.GA27667@vmlxhi-102.adit-jv.com>
References: <877ebi1v1e.wl-kuninori.morimoto.gx@renesas.com>
 <20190826093032.GA24143@vmlxhi-102.adit-jv.com>
 <87lfvf5to9.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lfvf5to9.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:24 +0200
Cc: Timo Wischer <twischer@de.adit-jv.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 Mark Brown <broonie@kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Joshua Frkuska <joshua_frkuska@mentor.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rsnd: fixup 6ch settings to 8ch
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

Hi Morimoto-san,

Thanks for the prompt reply.

On Tue, Aug 27, 2019 at 09:42:49AM +0900, Kuninori Morimoto wrote:
> 
> Hi Eugeniu
> 
> > We've been reviewing this patch in the context of Renesas-Yocto-v3.21.0
> > BSP integration, where it is contained as commit [1].
> 
> OK, now, you are using BSP.
> 
> > > diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
> > > index f5afab6..44bda21 100644
> > > --- a/sound/soc/sh/rcar/ssi.c
> > > +++ b/sound/soc/sh/rcar/ssi.c
> > > @@ -303,6 +303,8 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
> > >  	if (rsnd_runtime_is_tdm_split(io))
> > >  		chan = rsnd_io_converted_chan(io);
> > >  
> > > +	chan = rsnd_channel_normalization(chan);
> > > +
> > 
> > Since the "chan" value is already normalized by calling:
> >  => rsnd_ssi_master_clk_start()
> >   => chan = rsnd_runtime_channel_for_ssi(io)
> >    => rsnd_runtime_channel_for_ssi_with_params()
> >     => rsnd_channel_normalization()
> > 
> > I was wondering if it is really required to call
> > rsnd_channel_normalization() second time in ssi.c for fixing the issue
> > described in this patch?
> 
> Please compare BSP and upstream patch.
> 
> 	BSP
> 	https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=54721f595654
> 
> 	upstream
> 	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=66287def435315d9d8de740da4c543e37630b897
> 
> I don't know detail of BSP side, but I guess it doesn't have TDM Split support (?).
> Because of that, it doesn't have (A) code.
> 
> 	int rsnd_ssi_master_clk_start(xxx)
> 	{
> 		...
> 		int chan = rsnd_runtime_channel_for_ssi(io);
> 		...
> 		if (rsnd_runtime_is_tdm_split(io))
> (A)			chan = rsnd_io_converted_chan(io);
> 
> 		chan = rsnd_channel_normalization(chan);
> 		...
> 	}

We've made the same observation. The BSP backport seems to be a NOOP
for rsnd_ssi_master_clk_start() due to lack of TDM split support.

However, my question touched a different aspect of the patch.
The comment added by commit [1] and preserved by commit [2] both
suggest that is solely 'TDM Extend' mode which needs 6-to-8 channel
adjustment. Your comment sounds like this also applies to 'TDM Split'?

Or for 'TDM Split' we only care to sanitize the channel value
(i.e. make sure it is in the 0..8 range)?

[1] v4.5-rc1 commit 8ec85e7f7e9a2f ("ASoC: rsnd: ssi enables non-stereo sound")
        [..]
        /* TDM Extend Mode needs 8ch */ 
        if (chan == 6) 
                chan = 8; 
        [..]

[2] v5.2-rc1 commit 66287def435315 ("ASoC: rsnd: fixup 6ch settings to 8ch")

-- 
Best Regards,
Eugeniu.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
