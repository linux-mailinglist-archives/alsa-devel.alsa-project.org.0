Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AFF280177
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 16:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1657818CF;
	Thu,  1 Oct 2020 16:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1657818CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601563255;
	bh=y6JCxWSIyZ71Rk6sGWv6i2ZAXsuOo6kjCZ9AqhPSZYE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NU9iDH3YWmIqRbI0k2kSCt3atYkkLLfHas8Si6XRn8N464JUkUbGHuxqtsDG/JMv/
	 wliSZCviX9Dg1/2eY3d/mAf6ZTLu5Vfe0ZHbWcyo0D2BXl6cwWENrGMeygU2KRDeWP
	 UgvPHpd1dwtxeHge+i3KgNj+OEmu2bTzoy55xwm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 370CAF80105;
	Thu,  1 Oct 2020 16:39:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 696EAF80105; Thu,  1 Oct 2020 16:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82748F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 16:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82748F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IJmnV+ix"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A9172145D;
 Thu,  1 Oct 2020 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601563134;
 bh=y6JCxWSIyZ71Rk6sGWv6i2ZAXsuOo6kjCZ9AqhPSZYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJmnV+ixwDaSNnoGH6YEGRLGyGnMbqp9xyhRWtJWoom0Ty6bhs3P/25azJgiO833Y
 uAR18sg38cF+CfffCFLzd5JmYt1zE14FSOxeUQzsBlvXYKHt1hfGlDkwAI1zp1fMC9
 I8oF7sQTyhmXUWgei2DkK78ScvjEIRxLdN465u3I=
Date: Thu, 1 Oct 2020 16:38:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001143855.GA2398269@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com>
 <20201001115847.GY816047@nvidia.com>
 <20201001121423.GA2375307@kroah.com>
 <20201001143334.GA1103926@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001143334.GA1103926@nvidia.com>
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
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

On Thu, Oct 01, 2020 at 11:33:34AM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 02:14:23PM +0200, Greg KH wrote:
> > On Thu, Oct 01, 2020 at 08:58:47AM -0300, Jason Gunthorpe wrote:
> > > On Thu, Oct 01, 2020 at 01:05:51PM +0200, Greg KH wrote:
> > >  
> > > > You have to be _VERY_ careful after calling
> > > > ancillary_device_initialize(), as now you can not just free up the
> > > > memory if something goes wrong before ancillary_device_add() is called,
> > > > right?
> > > 
> > > I've looked at way too many versions of this patch and related. This
> > > is the only one so far that I didn't find various bugs on the error
> > > cases.
> > 
> > But you haven't seen the callers of this function.  Without this
> > documented, you will have problems.
> 
> I've seen the Intel irdma, both versions of the SOF stuff and an
> internal mlx5 patch..
> 
> Look at the SOF example, it has perfectly paired error unwinds. Each
> function has unwind that cleans up exactly what it creates. Every
> 'free' unwind is paired with an 'alloc' in the same function. Simple.
> Easy to audit. Easy to correctly enhance down the road. 
> 
> This is the common kernel goto error design pattern.

But that's where people get this wrong.  Once device_initialize() is
called, the "free" can not be called, something else must be,
device_put().

Tricky, yes.  Messy, yes.  Sorry.

> > Why is this two-step process even needed here?
> 
> Initializing the refcount close to the allocation is a common design
> pattern as is initializing it close to registration. Both options are
> tricky, both have various common subtle bugs, both have awkward
> elements.
> 
> At the end of the day, after something like 20 iterations, this is the
> first series that actually doesn't have error unwind bugs.
> 
> Can we empower Dave to make this choice? It is not like it is wild or
> weird, the driver core already exposes _initialize and _add functions
> that work in exactly the same way.

Sure, but without a real user that _NEEDS_ this two-step process, let's
not include it.  Why bake complexity into the system from the start that
is never used?

Iteration and evolution is fine, it's not like this is going to be
set-in-stone for forever.

thanks,

greg k-h
