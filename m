Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD43F048C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 15:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859931680;
	Wed, 18 Aug 2021 15:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859931680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629293030;
	bh=mUS2XHoBNSYTIuTRFqsUU57sxADOx3BgsDP98f3EzMY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdkdUnZ3Bk8EW7OSdTfjRfe0+SD3SRLtY14yr3gmA3XvaRkB7Zyfdjj95jv1Dv2pr
	 RswnzcHTGZr0FYn0r1t1vdA02+z0RS6h/EwAnG9+0MRhuthMGL0rPlODz27Jnj9jIZ
	 rd9UW4i6Z6b8aAsH8abwlkequUyHAFY94vgH1P2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FEFF800EC;
	Wed, 18 Aug 2021 15:22:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 994DEF80249; Wed, 18 Aug 2021 15:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9273FF800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 15:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9273FF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="D/jrowO1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0D7160232;
 Wed, 18 Aug 2021 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629292942;
 bh=mUS2XHoBNSYTIuTRFqsUU57sxADOx3BgsDP98f3EzMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/jrowO11usaVNWUNbge+kprse4L+XNseJefutlHU6ZDzNuidRBevYMPNo/9Scubx
 W7zY9wGu29+Wfb+b2voB6OMjqKXLQfMtNJj2oqiQhxnyOkRIVF2/fCxoxuvNdvB5/t
 LqtqTz1iIBHfptgtYoXwhTo/5uyyCjwpQEZFFMFk=
Date: Wed, 18 Aug 2021 15:22:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/2] driver core: export
 driver_deferred_probe_trigger()
Message-ID: <YR0Ji7DQXoo0z4vP@kroah.com>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-2-pierre-louis.bossart@linux.intel.com>
 <YRyeR6imvSwOOasQ@kroah.com> <20210818115736.GA4177@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818115736.GA4177@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 vkoul@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Aug 18, 2021 at 12:57:36PM +0100, Mark Brown wrote:
> On Wed, Aug 18, 2021 at 07:44:39AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 17, 2021 at 02:00:56PM -0500, Pierre-Louis Bossart wrote:
> 
> > > In these cases, there is no way to notify the deferred probe
> > > infrastructure of the enablement of resources after the driver
> > > binding.
> 
> > Then just wait for it to happen naturally?
> 
> Through what mechanism will it happen naturally?  Deferred probe
> currently only does things if things are being registered or if probes
> complete.
> 
> > > The driver_deferred_probe_trigger() function is currently used
> > > 'anytime a driver is successfully bound to a device', this patch
> > > suggest exporing by exporting it so that drivers can kick-off
> > > re-probing of deferred devices at the end of a deferred processing.
> 
> > I really do not want to export this as it will get really messy very
> > quickly with different drivers/busses attempting to call this.
> 
> I'm not sure I see the mess here - it's just queueing some work, one of
> the things that the workqueue stuff does well is handle things getting
> scheduled while they're already queued.  Honestly having understood
> their problem I think we need to be adding these calls into all the
> resource provider APIs.
> 
> > Either handle it in your driver (why do you have to defer probe at all,
> > just succeed and move on to register the needed stuff after you are
> > initialized) or rely on the driver core here.
> 
> That's exactly what they're doing currently and the driver core isn't
> delivering.
> 
> Driver A is slow to start up and providing a resource to driver B, this
> gets handled in driver A by succeeding immediately and then registering
> the resource once the startup has completed.  Unfortunately while that
> was happening not only has driver B registered and deferred but the rest
> of the probes/defers in the system have completed so the deferred probe
> mechanism is idle.  Nothing currently tells the deferred probe mechanism
> that a new resource is now available so it never retries the probe of
> driver B.  The only way I can see to fix this without modifying the
> driver core is to make driver A block during probe but that would at
> best slow down boot.
> 
> The issue is that the driver core is using drivers completing probe as a
> proxy for resources becoming available.  That works most of the time
> because most probes are fully synchronous but it breaks down if a
> resource provider registers resources outside of probe, we might still
> be fine if system boot is still happening and something else probes but
> only through luck.

The driver core is not using that as a proxy, that is up to the driver
itself or not.  All probe means is "yes, this driver binds to this
device, thank you!" for that specific bus/class type.  That's all, if
the driver needs to go off and do real work before it can properly
control the device, wonderful, have it go and do that async.

So if you know you should be binding to the device, great, kick off some
other work and return success from probe.  There's no reason you have to
delay or defer for no good reason, right?

But yes, if you do get new resources, the probe should be called again,
that's what the deferred logic is for (or is that the link logic, I
can't recall)  This shouldn't be a new thing, no needing to call the
driver core directly like this at all, it should "just happen", right?

thanks,

greg k-h
