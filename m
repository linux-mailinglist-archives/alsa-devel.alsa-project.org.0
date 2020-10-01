Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D227FFD0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8471890;
	Thu,  1 Oct 2020 15:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8471890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601558085;
	bh=iJTF2Ck3zogkbD76oGrzbhoWyEgBCEB/CuDnFTySoro=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gr2mUPBF8zPGxf4O2DcjlarQuRKArwW3EwfLOJIEC1v8BLZkLRm2YfBCUF9KiW/qk
	 bzcM+flNDjucDX3p5l3DU6Ty7Ue4bbIhB2Lt5qKOYbor4/vUCsjHLYDHSoNbax6KQj
	 gdbLMLwq5OvOsRpm6q+yicLQ+CjMFE7areJmbGnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD0AF801D8;
	Thu,  1 Oct 2020 15:13:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB9CDF801F5; Thu,  1 Oct 2020 15:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73429F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73429F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FwOmDgZF"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3506720754;
 Thu,  1 Oct 2020 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601557971;
 bh=iJTF2Ck3zogkbD76oGrzbhoWyEgBCEB/CuDnFTySoro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwOmDgZFcQK7ArrV6Cl2WFSvky0wwwoyB2UMz36s0MwfWJM2CEKDz3ivWiSDi3Lav
 Acd+7zpxj6eR3WN3MuJctFFuB5DjqE1KODZjRs46WjCMCYZuDn8mAHWWU8njBjn5Yq
 218nWrQlSY6BevyM0lEox4Dlk2PwTo66NMyALdCw=
Date: Thu, 1 Oct 2020 15:12:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001131252.GA2382269@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001125038.GC6715@sirena.org.uk>
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

On Thu, Oct 01, 2020 at 01:50:38PM +0100, Mark Brown wrote:
> On Wed, Sep 30, 2020 at 03:50:45PM -0700, Dave Ertman wrote:
> 
> > In some subsystems, the functionality of the core device
> > (PCI/ACPI/other) may be too complex for a single device to be managed as
> > a monolithic block or a part of the functionality might need to be
> > exposed to a different subsystem.  Splitting the functionality into
> > smaller orthogonal devices makes it easier to manage data, power
> > management and domain-specific communication with the hardware.  Also,
> > common ancillary_device functionality across primary devices can be
> > handled by a common ancillary_device. A key requirement for such a split
> > is that there is no dependency on a physical bus, device, register
> > accesses or regmap support. These individual devices split from the core
> > cannot live on the platform bus as they are not physical devices that
> 
> I have to say that I find the motivation behind this bus to be a bit
> confusing.  In code terms it's essentially a stripped back copy of the
> platform bus and we're basically assigning devices between the two based
> on if they end up having a physical resource passed through to them.
> That seems to result in some duplication, has some potential for devices
> to need to churn between the two buses and for duplication in parent
> devices if they need to create both platform and auxiliary devices.
> What exactly is the problem we're trying to solve here beyond the
> labelling one?  I can see that it's a bit messy but this whole area is a
> bit messy and I'm not clear that we're not just pushing the mess around.

This series doesn't really show how this is ment to be used, from what I
can tell.

The goal is to NOT need a platform device/bus as that's an
overloaded/abused subsystem, and to just use a much lighter-weight
subsystem that allows one "device" (PCI/USB/whatever) to have multiple
child devices that then are bound to different subsystems (networking,
tty, input, etc.)  Yes, there will be some core "sharing" needed, but
that's up to the driver that implements this, not the generic code.

> > are controlled by DT/ACPI. The same argument applies for not using MFD
> > in this scenario as it relies on individual function devices being
> > physical devices that are DT enumerated.
> 
> MFD has no reliance on devices being DT enumerated, it works on systems
> that don't have DT and in many cases it's not clear that the split you'd
> want for the way Linux describes devices is a sensible one for other
> operating systems so we don't want to put it into DT.  Forcing things to
> be DT enumerated would just create needless ABIs.

This new bus doesn't need DT at all.  Or at least it better not...

But again, this series doesn't really feel like it is showing what this
is really for to me as there is just one "child device" that is being
created, just to handle debugfs files, which aren't even part of the
driver model.

Again, I could have this totally wrong, if so, someone needs to point
out my errors in reviewing this.

thanks,

greg k-h
