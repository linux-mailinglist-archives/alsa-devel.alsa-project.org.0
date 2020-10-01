Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE527FEB2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 13:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99DF2183F;
	Thu,  1 Oct 2020 13:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99DF2183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601553357;
	bh=y6uclA8YUTuTS6/1asqPNipL+l96e6sCQ48YFkkkyB4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hIRFlwrqXz9Npd7iLhjcREn6r3aIId9a2SvtPixhYraopIRcDmUr04KWlVISKuV3Y
	 Ijz8u08P88vDws6pvK7FNrEk1WbE26S4gv5MHy8uPz3CN5miofX9CRMrSYWksW7zKZ
	 mkSCUkSJeLIbyLVvgrw/BhLPmlbLquWMZFI+beFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D446F8020C;
	Thu,  1 Oct 2020 13:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB3EF80105; Thu,  1 Oct 2020 13:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44881F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 13:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44881F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b+gClUf1"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B223721481;
 Thu,  1 Oct 2020 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601553241;
 bh=y6uclA8YUTuTS6/1asqPNipL+l96e6sCQ48YFkkkyB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b+gClUf12BMjj3DfS+NY6WGy7Q2hFr5OOh1Zt5qgRAiTDuAoNG5UZVnQBpPmk25yk
 s4Gx0NipiOVqyXABzskub4Jj7UUE7N/Y5eYmkHOEca1lfp1yUVlxXAmTlv7sN7QLX6
 G4atE+LwZv/4tlJrQrQiMQAGDJArFp3orVR6hiDg=
Date: Thu, 1 Oct 2020 13:54:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001115402.GA2372306@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110120.GB1939744@kroah.com>
 <20201001114608.GX816047@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001114608.GX816047@nvidia.com>
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

On Thu, Oct 01, 2020 at 08:46:08AM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 01:01:20PM +0200, Greg KH wrote:
> > On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> > > +int ancillary_device_initialize(struct ancillary_device *ancildev)
> > > +{
> > > +	struct device *dev = &ancildev->dev;
> > > +
> > > +	dev->bus = &ancillary_bus_type;
> > > +
> > > +	if (WARN_ON(!dev->parent) || WARN_ON(!ancildev->name) ||
> > > +	    WARN_ON(!(dev->type && dev->type->release) && !dev->release))
> > > +		return -EINVAL;
> > 
> > You have a lot of WARN_ON() calls in this patch.  That blows up anyone
> > who runs with panic-on-warn, right?
> 
> AFAIK this is the standard pattern to code a "can't happen"
> assertion. Linus has been clear not to use BUG_ON, but to try and
> recover. The WARN_ON directly points to the faulty driver so it can be
> fixed. 

Printing an error and returning an error value also does the same exact
thing, the developer will not have a working system.

Please don't abuse WARN_ON() for things that should just be normal error
checking logic of api calls.

thanks,

greg k-h
