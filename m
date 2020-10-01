Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B174280078
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9441918F8;
	Thu,  1 Oct 2020 15:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9441918F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560184;
	bh=jzUKm4miGUH87ry3NJ3PBblgNEfW9jPH4RcC4IJCe9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MihkllqEV6Qi1kwqQBzHj7wzd1bm3neSPPeqTTY0IsMOvxLFdtzdlP9FzYF12pFha
	 YNVx4AhdMFCgK2Uuo7mDYvFtGSW37I5oFZbHZkgzXkBixupayil6wzUX3au9+REP9I
	 n3Jw+qB6AXBMDofv25TXJn96jbXhSOWn8MKAxubA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFCBAF80349;
	Thu,  1 Oct 2020 15:40:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF7DF801F5; Thu,  1 Oct 2020 14:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44019F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 14:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44019F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="bOBhunxI"
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75c54f0000>; Thu, 01 Oct 2020 20:02:23 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 12:02:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 12:02:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9+n4d1EGNN0IDnjrzB6KIPBiRtSf70wdoygMC8+f5C4f6w1xDkb7bT7jKtQqL/l32LbsUhPZCEQyGmBDvlmfkXVKbyfkxfvoS//Ityaztv0f2eBWPrVndex29ESW8LbvZiAUwoHmEyQSdAuLC9KcwZzPc4Ig6NCHm7w4tkHs9uI1RDa5cKS/4oDv5A9Z2fPcsC/JEHrFzpJEv+9DZE9hTsn7H80kDMTtw2ZUXzvhEwBx1d9LaxT3wTprbYcMICi6PlHe0t8Quj+BNth5VFiLmW0Pe9IvJMwqBZnx7gAV/s0M3XoDK7/vRZFScd3c0432+5dsOa7M2PzKdiTHMhnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ydj/doH2ZHtaiL+c5yeuaBEJWbPOtI+akxm7C9qgqmY=;
 b=Y9OgghcdkhjZxVEck4Zcu5NndSgnMAJz89u90Pd3p9JIvcXTyRzNd8BLNPCUVEJGOgzvclXZFsLrYl0dK03kkwOuckHZVOddzgo0V7oIFcKIJPTCFaGa/qyJvmb8labktPcvDIlGCmwqYhp2XpokPbwMDU/94sdrkBqC9jQx1Nz8+Q/VNEE46i/f8ayDcScDLirvMS3KOgBiDOeTlc09phym+HICEV78CBkb3lnwd8JC2KQajyh/MCDLXYC1dE5ffXzHMi2YY8U7D2AMGAd3eBOmwSsWyDCGJZgIs3YQlTVnt68NddAi3RcCKY+NWPFYaGEs2Vu9ev7hwfBxoSxuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3403.namprd12.prod.outlook.com (2603:10b6:5:11d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 1 Oct
 2020 12:02:17 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 12:02:15 +0000
Date: Thu, 1 Oct 2020 09:02:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001120212.GZ816047@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110120.GB1939744@kroah.com> <20201001114608.GX816047@nvidia.com>
 <20201001115402.GA2372306@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001115402.GA2372306@kroah.com>
X-ClientProxiedBy: BL0PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:207:3c::38) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:207:3c::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.37 via Frontend Transport; Thu, 1 Oct 2020 12:02:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNxHo-004czF-3Y; Thu, 01 Oct 2020 09:02:12 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601553743; bh=Ydj/doH2ZHtaiL+c5yeuaBEJWbPOtI+akxm7C9qgqmY=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=bOBhunxIKYWcnroakD9jn07/p57GDV4wLHahT9kF6I5++0G4p7uY25EJ+IHlXSdKa
 aysNJwBkzMUb815Q6yJJFeAKZHfDRoi7b5g5wGp0wksFpMeeQfY6oZKCWAWb35RB6+
 +/cjV/t4mXR8CWCRtCd2tV7jVugHWURpFIDncZWsQPozrcANTsgvP4M0c5fcUVfPSa
 yYxPUn+A9sQAcXY/KwJUwHQ040AqUhICcrc/zAALo2o7BbCKO+5bdAUbVRAXw/uBue
 T2nXM8u1gnWE1Yq61aUvDsQa9/PsTTnXi72GBMN+kHm3UVrU/BlycxEvTr+D+qjm6F
 XGPhLX6sfFqYg==
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:08 +0200
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

On Thu, Oct 01, 2020 at 01:54:02PM +0200, Greg KH wrote:
> On Thu, Oct 01, 2020 at 08:46:08AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2020 at 01:01:20PM +0200, Greg KH wrote:
> > > On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> > > > +int ancillary_device_initialize(struct ancillary_device *ancildev)
> > > > +{
> > > > +	struct device *dev = &ancildev->dev;
> > > > +
> > > > +	dev->bus = &ancillary_bus_type;
> > > > +
> > > > +	if (WARN_ON(!dev->parent) || WARN_ON(!ancildev->name) ||
> > > > +	    WARN_ON(!(dev->type && dev->type->release) && !dev->release))
> > > > +		return -EINVAL;
> > > 
> > > You have a lot of WARN_ON() calls in this patch.  That blows up anyone
> > > who runs with panic-on-warn, right?
> > 
> > AFAIK this is the standard pattern to code a "can't happen"
> > assertion. Linus has been clear not to use BUG_ON, but to try and
> > recover. The WARN_ON directly points to the faulty driver so it can be
> > fixed. 
> 
> Printing an error and returning an error value also does the same exact
> thing, the developer will not have a working system.
> 
> Please don't abuse WARN_ON() for things that should just be normal error
> checking logic of api calls.

This is not normal error checking, it is precondition
assertion. Something has gone badly wrong if it ever triggers.

If you don't want to use WARN_ON for assertions then when should it be
used?

pr_err is not the same thing, it doesn't trigger reports from fuzzers.

Jason
