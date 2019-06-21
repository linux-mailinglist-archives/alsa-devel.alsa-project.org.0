Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17B4EB42
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 16:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056E282C;
	Fri, 21 Jun 2019 16:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056E282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561128911;
	bh=4IjlT6YC1O44qPqQFho/l98HD4BqGP/MWarfXm2enaw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuK7/BV2rFE5LTZ9M+L26IXtbYjFDkl+e6ui1OVhqZhX+W/vJhYtMXH0VqLueNuuF
	 EP4aS/kOY0WpTvERhmQC/XDGl8W3I9O6Lvd/WlpTtSAjQXHLTHAtb9HcEAcCi+Q+M9
	 82bA9atTvkYBd/7nL3TahPHI7Eppu0C4wZUahi+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7522FF8070D;
	Fri, 21 Jun 2019 16:53:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A44ACF8070D; Fri, 21 Jun 2019 16:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02983F8070D
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 16:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02983F8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="DHhdBTH+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qYfHNKCr"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EE916222C2;
 Fri, 21 Jun 2019 10:53:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 21 Jun 2019 10:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JCbEYoxmzy3ql8hBWp6kET6t/A+
 euvi2knEYE6fh5v4=; b=DHhdBTH+9Hji4Ox0n+JuF3cdqFyf2S/G9xhsYFJSUbE
 IV+gAQvp1ZZyxOhxELng7ccBcfJBf/ezjvIBIsApkkpYHZn23J6mLqcbdl0p9dpj
 zzI7sP2lvi+T6l0RJURXD4BpRrElL34hjos6QbQvbOL/pNnJWKKAVeNlrk4bsHU0
 9PR6fCtP9W7dm0g31+3rRzfjJA4jbtVxANcHqU6XUxeBKNqO7RpAW2BjzGjFyQwB
 kay72Uqvub0J68oBXhFa3RWqhDDWa7sEWfQBCO7NAKnP+qSPZzvtJ3Nq2A4OW9VX
 ffv1UmxHza8TOOeZ7VjCp1aj94teASPMwQtNs+abbkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JCbEYo
 xmzy3ql8hBWp6kET6t/A+euvi2knEYE6fh5v4=; b=qYfHNKCrqVEerzjmUWncTx
 KHdS/0h4qwWhhMR15OM7qm6Sx64VbFUBcL6WFUA63u9mDpkZT+pDYU445s5QfIBS
 HMpjnURZnaHxZHslhilHmrNNu9B3o6AJnVP4ZxSmXa7RMTnll9wq0szfaRR1sncP
 mejP0GL9Xe4A4F2nHtVfQKKA13P6oy8pjxxbQVH7POHNhPGpnb+wxfuhMZscwbWL
 bvqQUghOctsyiqvMozfSqpqwPLGoKwvSSiRhN+V4+puoF/TZclEOiUM9stiU6Yj0
 6DI2Z1iCG0/uTw2L2zhzu8aJbqYYbAGOA6scdK3NcK/PVTwLxiquZpoLvMmrokYQ
 ==
X-ME-Sender: <xms:WO8MXcYr1itAYpvrwcykV7S2iP77pX4ZLEfCANyiHuGuO4ad3f6c-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdeigdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
 ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WO8MXRWo2A3xOQNZumOn1N5pqM94LQCVxCs76kM8MTMyXWFQ0Icdyg>
 <xmx:WO8MXdSYyZMW7SoqbZkUGW2vQmvSTMKK-ckmbOr8ooCX_5CIcqWt_g>
 <xmx:WO8MXdIgt4Udh1z56peFriYkDN0ANFbht4X0HhxznfMAT8ltS0IH4A>
 <xmx:WO8MXeGQ9CbVfWj1GJTJLWHY1Jo-G2vVvSbOHgzegFPNrj3Gj1ex-g>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9F7C380086;
 Fri, 21 Jun 2019 10:53:11 -0400 (EDT)
Date: Fri, 21 Jun 2019 16:53:09 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190621145309.GA6313@kroah.com>
References: <20190621113357.8264-1-broonie@kernel.org>
 <20190621113357.8264-2-broonie@kernel.org>
 <20190621132222.GB10459@kroah.com>
 <20190621143053.GH5316@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621143053.GH5316@sirena.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: dapm: Adapt for debugfs API
	change
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

On Fri, Jun 21, 2019 at 03:30:53PM +0100, Mark Brown wrote:
> On Fri, Jun 21, 2019 at 03:22:22PM +0200, Greg KH wrote:
> > On Fri, Jun 21, 2019 at 12:33:57PM +0100, Mark Brown wrote:
> 
> > >  	struct dentry *d;
> > >  
> > > -	if (!parent)
> > > +	if (!parent || IS_ERR(parent))
> > >  		return;
> 
> > How can parent be NULL?
> 
> It was more effort than it was worth to check to see if it could
> actually be NULL through default initialization or something and fix it
> than just not delete the check so I just left it there.  I'll probably
> go back and clean it up more thorougly at some point.
> 
> > I am trying to make it so that debugfs doesn't return anything for when
> > a file is created.  Now if that will ever be possible or not, I don't
> > know, but I am pretty close in one of the branches in my driver-core
> > tree...
> 
> You mentioned this in a mail last week, I then replied pointing out that
> this is not helpful as it reduces the robustness and quality of our
> debugging tools and you then did not respond.

Sorry, had lots of other stuff to work on, it's in my queue to respond
to still...

> This is a view I still hold and in any case debugfs as it stands (and
> was in the kernel versions since this was broken) is still capable of
> reporting errors so we should fix that.

Sort story is, I am trying to change it so that it can not report errors :)

And even then, no kernel code should be doing anything different if
debugfs calls fail or not, that is why I am I making these changes.  No
"real" code should ever be affected, and right now, it is, if something
goes wrong with debugfs.

So removing those checks is the goal here.  Your driver code should not
care if debugfs is working at all or not.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
