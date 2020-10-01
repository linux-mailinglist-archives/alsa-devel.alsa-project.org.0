Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB67280656
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE811AB2;
	Thu,  1 Oct 2020 20:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE811AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601576125;
	bh=hnY65mRs/fVM3kAzHkyzp2V6JiohMq+1VRAdzYeJFCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qsjU6cU7nt7+tkysq8CwuUpOBPVMXuVO/70Lc1i4Z5QqMGadx8BkMb5XQF2PNMUAY
	 q5RfXCsyaLR66bAM1bB0TL/a1fW1FGkJV8c0pxgq7XEyGQKCJA9kNh9s5AzwfF699j
	 o3m6qU1pXXPPx2WOz9s3omWF6fYzAlw0JsCqvIrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB324F8020C;
	Thu,  1 Oct 2020 20:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24617F801F5; Thu,  1 Oct 2020 20:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AEB8F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEB8F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IuorkgMa"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9C88206C9;
 Thu,  1 Oct 2020 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601576015;
 bh=hnY65mRs/fVM3kAzHkyzp2V6JiohMq+1VRAdzYeJFCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IuorkgMaGds9uvLN2jseHiJtmRqQJlNc5aJF45+CHvb2MmUf1bZiWTE9SHlStw8LX
 4FaqCo2gkO1anJ69ZNZz/jq2LAdLK1HvqpYNjk0rKGLTX2tFK0afetuRkX7pjYYVDX
 GJCsTyYe3y00KcEdCakcqXrqLQyaHuQyCXDzVJ64=
Date: Thu, 1 Oct 2020 20:13:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001181335.GB3598943@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
 <20201001152450.GK6715@sirena.org.uk>
 <2ba29c19-205b-6d0a-3a28-f9d5cc32adfe@linux.intel.com>
 <20201001165137.GQ6715@sirena.org.uk>
 <20201001180448.GB816047@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001180448.GB816047@nvidia.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, parav@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>
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

On Thu, Oct 01, 2020 at 03:04:48PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 05:51:37PM +0100, Mark Brown wrote:
> > On Thu, Oct 01, 2020 at 11:20:39AM -0500, Pierre-Louis Bossart wrote:
> > 
> > > I have nothing against MFD, but if this boils down to platform devices we
> > > are back to the initial open "are platform devices suitable as children of
> > > PCI devices"? I've heard Greg say no for the last year and a half - and he
> > > just re-stated this earlier in this thread.
> > 
> > As you'll have seen from this thread and the prior version (which was
> > the first time I became aware of this stuff) I'm not clear how that
> > desire maps on to hardware, as soon as subdevices start needing to get
> > regions and interrupts mapped then we're going to end up reinventing
> > resources and regmaps AFAICT.
> 
> I think the truth is MFD and anciallary bus are solving almost the
> same problem and could meet in the middle at some point.

Agreed.

> Since Greg has completely NAK'd using pci_device inside MFD it looks
> like this is the preference.

I have NAK'd using platform devices as children for things that are not
platform devices.  MFD is the thing that is wed to platform devices at
the moment, so unless you want to change MFD to not enforce that (and
last I looked the MFD maintainer said no), then yes, we can't use MFD.

> If people have a use case for regmaps/IRQs then they should add them
> here. Right now the places I know of don't need this.
> 
> The target for this is queue-based devices where the sharing granule
> is a queue. The actual thing being shared to the subsystem from the
> PCI driver basically the ability to create a queue.

And PCI resources, you will have drivers that want that.  But those are
easy to share :)

thanks,

greg k-h
