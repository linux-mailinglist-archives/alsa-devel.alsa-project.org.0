Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B73E0280664
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42CDE1AB3;
	Thu,  1 Oct 2020 20:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42CDE1AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601576295;
	bh=HgR7GnnRFXuXacaQ2FQM+ZbnRVZc1nqrFcbWeiSNw8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UV6UffKb9Vo/t0lpgncCwEPawX0K1loGs9xOxSYfdvOC3PVRXBXNggBHHVq/si7v4
	 St1cwzDSMLg2ee+3kIzbFDcVmltp+sejC7defbiDHGoBOWjkmNPtGVohabuz5JM+Q0
	 92JAJqh5dLCcdosHw5isa7BvTRVAAGvysUBm5WSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D658F8020C;
	Thu,  1 Oct 2020 20:16:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF0D0F801F5; Thu,  1 Oct 2020 20:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23AE6F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AE6F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PkhR8lZx"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D5C2206B2;
 Thu,  1 Oct 2020 18:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601576184;
 bh=HgR7GnnRFXuXacaQ2FQM+ZbnRVZc1nqrFcbWeiSNw8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PkhR8lZxFytSvTocmjz/r24O62H8cQjjdoZ98Uwy2H/quDobG9JBfaBJ9b2GdcjsS
 RTXKXncBXVgpSpkFaIhLyClW6bzYmMoohcHktv+oH/PR4aQOnB1oS/Xg33cm+ZqC86
 VdDBtk/mPaW6nWreSvRSu/iLaDrpEhaegaHwKtM4=
Date: Thu, 1 Oct 2020 20:16:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001181624.GC3598943@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk>
 <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001160316.GL6715@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com, parav@nvidia.com, jgg@nvidia.com,
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

On Thu, Oct 01, 2020 at 05:03:16PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2020 at 05:32:07PM +0200, Greg KH wrote:
> > On Thu, Oct 01, 2020 at 03:40:19PM +0100, Mark Brown wrote:
> 
> > > Right, so my concern is that as soon as we decide we want to pass some
> > > resources or platform data through to one of the subdevices it needs to
> > > move over into being a platform device and vice versa.  That feels like
> > > something that's going to add to the mess for some of the uses.
> 
> > There shouldn't be a need for resources or platform data to be passed
> > that way as they are all "owned" by the parent device that creates
> > these.
> 
> > I don't want to see platform devices become children of real devices
> > (like PCI and USB and others), which is the goal here.  platform devices
> > are overloaded and abused enough as it is, let's not make it worse.
> 
> How does this interact with the situation where someone makes a PCI
> device that's basically a bunch of IPs glued together in a PCI memory
> region (or similarly for other buses)?  The IPs all have distinct
> memory regions and other resources like interrupt lines which makes them
> unsuitable for auxilliary devices as proposed, especially in cases where
> there's more than one copy of the IP instantiated.  There's a bunch of
> PCI MFDs in tree already of admittedly varying degrees of taste, and
> MFDs on other buses also use the resource passing stuff.

I would like to move those PCI MFDs away from that, and into this bus
instead.

If there needs to have a way to pass/share resources, great, let's add
it, there's no objection from me.

thanks,

greg k-h
