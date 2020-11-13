Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22F2B291F
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Nov 2020 00:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4935C18C3;
	Sat, 14 Nov 2020 00:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4935C18C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605309750;
	bh=NuhkiV2bk+P2nm9RmCwzXiSURYvAzkorSkZlQdsyIyI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjAS0an2+VhcAfhCqAW0uTuRJOBKCDQRTVi854CZTK6M7oBhB3nLkaQ3XCpHwab2X
	 aSf7nAh20VOdeMzv1lIaWLzOYhizQESbVPfGyBZFTF2Aha8rwONEVgal06GquUK3PY
	 Nl67Bg1X4Ge5O284asYPFb4DfvKV4XmmVbJGPogo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE03CF801F5;
	Sat, 14 Nov 2020 00:20:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B743AF8020C; Sat, 14 Nov 2020 00:20:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3DC7F800E9
 for <alsa-devel@alsa-project.org>; Sat, 14 Nov 2020 00:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3DC7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HNYHa1YT"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5905322256;
 Fri, 13 Nov 2020 23:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605309643;
 bh=NuhkiV2bk+P2nm9RmCwzXiSURYvAzkorSkZlQdsyIyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNYHa1YTSWRM2Nq4Lj/6KwBuYRXmoOm3ylGPkVHoS34gXThqVVPWjmsVbQzYPDVGe
 Ev+dOOC5dlHp2f3V2hGbgMKgYfcwzn600L4peMVNsguIXxtCxuuKLybuZfpcstEV3b
 /izANNTZJa3cloFxirC+Vr31LhhTxVOvY2D9LtRE=
Date: Sat, 14 Nov 2020 00:21:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
Message-ID: <X68VA6uw5nz51dll@kroah.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <X66rMg1lNJq+W/cp@kroah.com>
 <DM6PR11MB284160D4E69D9C7801A6B1C2DDE60@DM6PR11MB2841.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB284160D4E69D9C7801A6B1C2DDE60@DM6PR11MB2841.namprd11.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "parav@mellanox.com" <parav@mellanox.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, Shiraz" <shiraz.saleem@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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

On Fri, Nov 13, 2020 at 04:07:57PM +0000, Ertman, David M wrote:
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Friday, November 13, 2020 7:50 AM
> > To: Ertman, David M <david.m.ertman@intel.com>
> > Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org; linux-
> > rdma@vger.kernel.org; jgg@nvidia.com; dledford@redhat.com;
> > netdev@vger.kernel.org; davem@davemloft.net; kuba@kernel.org;
> > ranjani.sridharan@linux.intel.com; pierre-louis.bossart@linux.intel.com;
> > fred.oh@linux.intel.com; parav@mellanox.com; Saleem, Shiraz
> > <shiraz.saleem@intel.com>; Williams, Dan J <dan.j.williams@intel.com>;
> > Patil, Kiran <kiran.patil@intel.com>; linux-kernel@vger.kernel.org;
> > leonro@nvidia.com
> > Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
> > 
> > On Thu, Oct 22, 2020 at 05:33:29PM -0700, Dave Ertman wrote:
> > > Add support for the Auxiliary Bus, auxiliary_device and auxiliary_driver.
> > > It enables drivers to create an auxiliary_device and bind an
> > > auxiliary_driver to it.
> > >
> > > The bus supports probe/remove shutdown and suspend/resume callbacks.
> > > Each auxiliary_device has a unique string based id; driver binds to
> > > an auxiliary_device based on this id through the bus.
> > >
> > > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > > Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > > Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > > ---
> > 
> > Is this really the "latest" version of this patch submission?
> > 
> > I see a number of comments on it already, have you sent out a newer one,
> > or is this the same one that the mlx5 driver conversion was done on top
> > of?
> > 
> > thanks,
> > 
> > greg k-h
> 
> V3 is the latest sent so far.  There was a suggestion that v3 might be merged and
> the documentation changes could be in a follow up patch.  I have those changes done
> and ready though, so no reason not to merge them in and do a resend.
> 
> Please expect v4 in just a little while.

Thank you, follow-up patches aren't usually a good idea :)
