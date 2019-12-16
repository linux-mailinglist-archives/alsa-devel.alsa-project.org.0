Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B50120F5A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 17:27:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F191658;
	Mon, 16 Dec 2019 17:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F191658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576513630;
	bh=h4KceFw2tLPYbj7eX/9X+DksY8x2LaGnA18aSeQWSo4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3h23KDFqmh+2WfjwWKvCZRjEgYzKTJRW05SyulIH/AdfU7ndUaLINqYMuqyUN1gm
	 KY+wRoGu22udTx+RzkIpX/qVFJOCiEADjvMErAK6WHPIJW+BPiZPpeQsaK9iVuzKMD
	 RCoDTGoRPTFMDx+6E+vUMFLwxcIjsOP/8hDO7pG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08138F80257;
	Mon, 16 Dec 2019 17:25:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A911EF80255; Mon, 16 Dec 2019 17:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1ED2F800B2
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 17:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1ED2F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B4XeOd/H"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1DAC206D7;
 Mon, 16 Dec 2019 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576513520;
 bh=BIgz88Jxh/hhpFVygPCWmHqmEervhbpVfOW1PXEq/4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B4XeOd/HNIJ2fz7+62Ywopnp31Jw6v6HijzywYRXZ0y0D/DI43NS4vJvB0ehaiYPh
 ClkfRA0zvLMsi4qgnA0rfEbhQlBJ1uB7QcUQboJJBbNVSarne4UDToy0caYNHvn/RP
 IR87HXp2GWbxzucsyhC1aV2blpQZNRJUlRRUkRjo=
Date: Mon, 16 Dec 2019 17:25:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191216162517.GA2258618@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
 <20191213072844.GF1750354@kroah.com>
 <7431d8cf-4a09-42af-14f5-01ab3b15b47b@linux.intel.com>
 <20191213161046.GA2653074@kroah.com>
 <20728848-e0ae-01f6-1c45-c8eef6a6a1f4@linux.intel.com>
 <20191214082742.GA3318534@kroah.com>
 <e9d77c58-e0bd-010c-bbc8-b54c82f065fd@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9d77c58-e0bd-010c-bbc8-b54c82f065fd@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 08/15] soundwire: add initial
 definitions for sdw_master_device
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

On Mon, Dec 16, 2019 at 09:02:01AM -0600, Pierre-Louis Bossart wrote:
> 
> 
> On 12/14/19 2:27 AM, Greg KH wrote:
> > On Fri, Dec 13, 2019 at 05:25:23PM -0600, Pierre-Louis Bossart wrote:
> > > 
> > > > No, I mean the new MODULE_NAMESPACE() support that is in the kernel.
> > > > I'll move the greybus code to use it too, but when you are adding new
> > > > apis, it just makes sense to use it then as well.
> > > 
> > > Greg, would the patch below be what you had in mind?
> > > Thanks
> > > -Pierre
> > > 
> > > 
> > > diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> > > index 76a5c52b12b4..5bad8422887e 100644
> > > --- a/drivers/soundwire/Makefile
> > > +++ b/drivers/soundwire/Makefile
> > > @@ -7,9 +7,11 @@ ccflags-y += -DDEBUG
> > >   #Bus Objs
> > >   soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o
> > > stream.o
> > >   obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> > > +ccflags-$(CONFIG_SOUNDWIRE) += -DDEFAULT_SYMBOL_NAMESPACE=SDW_CORE
> > > 
> > >   soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
> > >   obj-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) +=
> > > soundwire-generic-allocation.o
> > > +ccflags-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) +=
> > > -DDEFAULT_SYMBOL_NAMESPACE=SDW_CORE
> > 
> > Don't use ccflags, just use the correct MODULE_EXPORT_NS() tag instead.
> 
> The documentation [1] states
> 
> "
> Defining namespaces for all symbols of a subsystem can be very verbose and
> may become hard to maintain. Therefore a default define
> (DEFAULT_SYMBOL_NAMESPACE) is been provided, that, if set, will become the
> default for all EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() macro expansions
> that do not specify a namespace.
> "
> 
> If the ccflags option is not supported or no longer desired, it'd be worth
> updating the documentation for dummies like me. I took the wording as a hint
> to avoid using MODULE_EXPORT_NS.

It's supported, and works just fine.  It's just that you really don't
have a ton of exports, right?  What's wrong with manually marking them?

> > And "SDW_CORE" is odd, "SOUNDWIRE" instead?
> 
> 'sdw' is the prefix used everywhere for SoundWire symbols.

Ok, I guess that ship has sailed :(

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
