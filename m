Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B695C2DDAC5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 22:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC5E16FC;
	Thu, 17 Dec 2020 22:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC5E16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608240089;
	bh=XGXzOKxUovUrpD+v5IUKk4HR+GZMEnwVotXEbPtxeVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSba4BiunO7GPL6tB5vH/gZhr4uoGWDfQF51CVCfOky5wCB7/Ti+XweMBkQ6irArw
	 2hCXSld+SBi0l6iPB480gCOUEc5EPNbU1u2HuscQWjCvCoAMkYrSiAvEDa5lAgJv6c
	 iGeCLwEl6Ch6PMwUspSUG5DkM8Thp2uh82s3mXE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A646EF800C7;
	Thu, 17 Dec 2020 22:19:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5776F80260; Thu, 17 Dec 2020 22:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA1B4F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 22:19:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1B4F80148
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 21204E0006;
 Thu, 17 Dec 2020 21:19:37 +0000 (UTC)
Date: Thu, 17 Dec 2020 22:19:37 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201217211937.GA3177478@piout.net>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8usiKhLCU3PGL9J@kroah.com>
Cc: alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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

Hello,

On 05/12/2020 16:51:36+0100, Greg KH wrote:
> > To me, the documentation was written, and reviewed, more from the
> > perspective of "why not open code a custom bus instead". So I can see
> > after the fact how that is a bit too much theory and justification and
> > not enough practical application. Before the fact though this was a
> > bold mechanism to propose and it was not clear that everyone was
> > grokking the "why" and the tradeoffs.
> 
> Understood, I guess I read this from the "of course you should do this,
> now how do I use it?" point of view.  Which still needs to be addressed
> I feel.
> 
> > I also think it was a bit early to identify consistent design patterns
> > across the implementations and codify those. I expect this to evolve
> > convenience macros just like other parts of the driver-core gained
> > over time. Now that it is in though, another pass through the
> > documentation to pull in more examples seems warranted.
> 
> A real, working, example would be great to have, so that people can know
> how to use this.  Trying to dig through the sound or IB patches to view
> how it is being used is not a trivial thing to do, which is why
> reviewing this took so much work.  Having a simple example test module,
> that creates a number of devices on a bus, ideally tied into the ktest
> framework, would be great.  I'll attach below a .c file that I used for
> some basic local testing to verify some of this working, but it does not
> implement a aux bus driver, which needs to be also tested.
> 

There is something I don't get from the documentation and it is what is
this introducing that couldn't already be done using platform drivers
and platform devices?

We already have a bunch of drivers in tree that have to share a state
and register other drivers from other subsystems for the same device.
How is the auxiliary bus different?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
