Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EB2802CB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 17:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68EE1903;
	Thu,  1 Oct 2020 17:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68EE1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601566444;
	bh=XatKlmgvDwRPqCPfb0gkIDA+UvQzlq+614ULjHqZk8I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOuYKppqwR9fAjIwieLTdgxRE5uqX1zzXkLCIgsgOWCiedFC7L76d8Iw0HJjdIu8U
	 x14zYqf+hFxnOoaRN657oETisxVuAAmYg1Zkld5oCMDxecJ52kOu5w0sIY7ytMdQyj
	 gMySsEYZnHU8xRWRtk01yY/WwnExHJRjixpxSJuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED313F801D8;
	Thu,  1 Oct 2020 17:32:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B22EF801F5; Thu,  1 Oct 2020 17:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05DF8F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 17:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05DF8F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0SrUBEtE"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AE1A2074B;
 Thu,  1 Oct 2020 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601566325;
 bh=XatKlmgvDwRPqCPfb0gkIDA+UvQzlq+614ULjHqZk8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0SrUBEtEjOjsV8L9ixcvqs3D3evY6kruQkU1QY+e8kq/dL7l/loMTHrk+1oiBz07A
 rjMCrWrw7zeyRB9gLV8JJavj+N0uqwxhfCzOqLg/RH5+p51Cyj+wupA9CM6KX7HL+K
 3ycF0yVif3nvcXO+8Eg1Doya8cF1eWFRy9sINpBA=
Date: Thu, 1 Oct 2020 17:32:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001153207.GA2414635@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001144019.GJ6715@sirena.org.uk>
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

On Thu, Oct 01, 2020 at 03:40:19PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2020 at 03:12:52PM +0200, Greg KH wrote:
> > On Thu, Oct 01, 2020 at 01:50:38PM +0100, Mark Brown wrote:
> 
> > > That seems to result in some duplication, has some potential for devices
> > > to need to churn between the two buses and for duplication in parent
> > > devices if they need to create both platform and auxiliary devices.
> > > What exactly is the problem we're trying to solve here beyond the
> > > labelling one?  I can see that it's a bit messy but this whole area is a
> > > bit messy and I'm not clear that we're not just pushing the mess around.
> 
> > This series doesn't really show how this is ment to be used, from what I
> > can tell.
> 
> > The goal is to NOT need a platform device/bus as that's an
> > overloaded/abused subsystem, and to just use a much lighter-weight
> > subsystem that allows one "device" (PCI/USB/whatever) to have multiple
> > child devices that then are bound to different subsystems (networking,
> > tty, input, etc.)  Yes, there will be some core "sharing" needed, but
> > that's up to the driver that implements this, not the generic code.
> 
> Right, so my concern is that as soon as we decide we want to pass some
> resources or platform data through to one of the subdevices it needs to
> move over into being a platform device and vice versa.  That feels like
> something that's going to add to the mess for some of the uses.

There shouldn't be a need for resources or platform data to be passed
that way as they are all "owned" by the parent device that creates
these.

I don't want to see platform devices become children of real devices
(like PCI and USB and others), which is the goal here.  platform devices
are overloaded and abused enough as it is, let's not make it worse.

thanks,

greg k-h
