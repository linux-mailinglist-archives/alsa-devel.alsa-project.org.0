Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009728D75
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 00:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C13C71683;
	Fri, 24 May 2019 00:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C13C71683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558652041;
	bh=uzBrTmFw4FOXq1BL+CwmGSY7aFn+wiGuzt5FHtA7lqY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxrtLgNj1QU/KicT+S7BtbM4p9xw9QvY8BRa6R9Qm93YK7ZHcqo1TcVfn/E6q6AMN
	 OxQPx2WcJ6IklqUFoOWccbVG+os5r7lYXeLDR2WEyfHL3WHKmab+3p8NDXzH1ODR3o
	 1Xa3C4ZSPau2GaM9MVyvJc41K1BGt+vG2Kgc/Jac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28024F89709;
	Fri, 24 May 2019 00:52:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF98F89674; Fri, 24 May 2019 00:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AF9EF8079B
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 00:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF9EF8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HAsZi7nZ"
Received: by mail-pf1-x441.google.com with SMTP id u17so4056099pfn.7
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 15:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6sNQBO0ShsOiyXm56ZAi0h5L7rJJmlpKkNelQHUJj+w=;
 b=HAsZi7nZ8gveH237kWeKnke3dDxr+y2gwyQ7UKnpPqhx9d5PwmMZdVn7AXJnbNNKxS
 ePDFO1IpN8iZHALaZ59urWJKkwTEjRYeKIbeaa5XlK6YazplFpVh3yQoNM2SreXoytPY
 btxUuPLWLnazqWiEtgybRKS/JgvW7Ksg6tagpdJUc2j9vKOTSJ7wYNlwfPPVjGSV974J
 8KoWA9zxDazLNvw1zkaTwiMaMQcUGxh/ANi8nkvxE5Fa1teN6vQn88J0xnGyo/nrpr4m
 imIzmRVIX8eS7v6OXmI02YsKDallHF64R30gSIuSWrHTWujRe7yWJmNXLOOIOAJsBNSa
 npYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6sNQBO0ShsOiyXm56ZAi0h5L7rJJmlpKkNelQHUJj+w=;
 b=A0ICrc40jhGmBwTWBU7N6UTwzewVxhoJ8Tj6Mjt3SEIUEAvTHdYRXTpMITcOnIXvYU
 6TRBfmjoKGH2KUYMT4VUTVSp6EGQmKU4dVUs7FB6KPqh3jifczhrP+NDwNwK58WzKHKX
 TbY+iG91cRI9UDJsol+H/svvl4GQBYjjSTVpiugzC2o4HB2K8VvzJcu5mkilT0cvwjzo
 pD601nFS0aFtH1Ih4LPLQLHLfAzjK4/JQAiBrVbEckqjqhR/707je2k6XVoCGg7VWjOv
 78U1meN0/n2hgGevf1Rxf6G3Yn3LaHWpy5+jFvhUKEmONoP8tljlJYPL4CffrTRHI/dN
 g6Qg==
X-Gm-Message-State: APjAAAUacFYzyJzVcXrP75SFqdOM/NYD41I388OxBk2+ejOttMmYWT3X
 iauBiATVnXmbcCj3hfPvOOo=
X-Google-Smtp-Source: APXvYqyuBQiscdYr7VRVcYBJKBnh5BshxJM8AvZKv6cszmjJhESCIjuXtoiy1ZJAGyWPkAkAtziQ5w==
X-Received: by 2002:a62:2506:: with SMTP id l6mr107019907pfl.250.1558651929550; 
 Thu, 23 May 2019 15:52:09 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x17sm341603pgh.47.2019.05.23.15.52.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 15:52:09 -0700 (PDT)
Date: Thu, 23 May 2019 15:50:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "broonie@kernel.org" <broonie@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190523225052.GA29562@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB6479FF8E1B55E9BE67E7B0ECE3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479FF8E1B55E9BE67E7B0ECE3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: fix the channel swap issue
	after xrun
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

On Thu, May 23, 2019 at 11:04:03AM +0000, S.j. Wang wrote:
> > On Thu, May 23, 2019 at 09:53:42AM +0000, S.j. Wang wrote:
> > > > > +     /*
> > > > > +      * Add fifo reset here, because the regcache_sync will
> > > > > +      * write one more data to ETDR.
> > > > > +      * Which will cause channel shift.
> > > >
> > > > Sounds like a bug to me...should fix it first by marking the data
> > > > registers as volatile.
> > > >
> > > The ETDR is a writable register, it is not volatile. Even we change it
> > > to Volatile, I don't think we can't avoid this issue. for the
> > > regcache_sync Just to write this register, it is correct behavior.
> > 
> > Is that so? Quoting the comments of regcache_sync():
> > "* regcache_sync - Sync the register cache with the hardware.
> >  *
> >  * @map: map to configure.
> >  *
> >  * Any registers that should not be synced should be marked as
> >  * volatile."
> > 
> > If regcache_sync() does sync volatile registers too as you said, I don't mind
> > having this FIFO reset WAR for now, though I think this mismatch between
> > the comments and the actual behavior then should get people's attention.
> > 
> > Thank you
> 
> ETDR is not volatile,  if we mark it is volatile, is it correct?

Well, you have a point -- it might not be ideally true, but it sounds
like a correct fix to me according to this comments.

We can wait for Mark's comments or just send a patch to the mail list 
for review.

Thanks you
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
