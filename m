Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146A280BC1
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 02:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E001DF4;
	Fri,  2 Oct 2020 02:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E001DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601599782;
	bh=bSiq7ujSh0I/dchyGvWavwmevs12FLGhf2ftWf9ADtw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpG5KyiUsHhS88FKv622dfKpT2EH2QNcg/vEKlfR6jnwGz810MQ2GtEb6vXG5H6wY
	 0WWcXwUJmCAwERsug3TL5OQj7m0GHCbUBoV+gYNptt351+3KjM1SznwriCVt0uQPO+
	 fGtc8xIOfp2Ni9H2WgGsGcewyhYvD7RLaW9q/r2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C1EF800AB;
	Fri,  2 Oct 2020 02:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74EE9F801F5; Fri,  2 Oct 2020 02:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0995F80105
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 02:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0995F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="R6g57wEb"
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7678b40000>; Fri, 02 Oct 2020 08:47:48 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 00:47:44 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.52) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3 via Frontend Transport; Fri, 2 Oct 2020 00:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu8/UTC5wI7O5nC7HyYT1/4saQhw5Qr32vSOmqNMVXsdx8pRQneV5YWyAil3cnTVkuiBpqXX9A+5/+UoC3Y2fDkICv04YVBMMewgxCOHbbw/VDWigibzlzVYZqWeAbTiFmJmjgac/CmPuzRBKt/45QiGDw4PgX6v73XaR4tYYMpn6yzGZXBhAOO6IxUrGLOmP4W+bLr/TA7cIbdLUNZiuXX+Yqx/Qj2taKucIjA+F7La/8MEOJlHbOBbXbpgkLOL/1G4eELc97P5e+RyKhGJItd4CXe4pTZE+tt5A8tF4GXsghl2eBa9Oc73jTJHambn/GnJh+J8p47F0rR7Nn7s+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bK4CodrkHL8V7GzwfdFVoXLCbkLPf38qpJYVPVeSIg=;
 b=brgwp2DnbVhfQzOmfWMoV2Owx2skayph6R+iJ0jcCu3C9mimHXEIx6BMwgVdpWHYBNLa8cHx5prAmcceU0MAdcobBnIvsXz/gwDljMXSFNODzK1AGybHp0zo1PZBr20xeZnxAod4jHrPHggMTNO7BEgrVv7buQCX4pXP7jCrNPoCYKdB1LL5DDDvQr5GqgLS4ZqJxSUldz/OXLqLP8rbd/S6tIk4YsFmJjovDQfTcbRxfLNVli2BM9g6ZA8gag6PLN11UmkAbLzmVLx43/Pwpcmmnpo5by37KrMmBxhV3oThJFQVVOvlO78K1++iTqQNR/OYyMdhR8jz28rj267Yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 00:47:42 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Fri, 2 Oct 2020
 00:47:41 +0000
Date: Thu, 1 Oct 2020 21:47:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201002004740.GF816047@nvidia.com>
References: <20201001125038.GC6715@sirena.org.uk>
 <20201001131252.GA2382269@kroah.com> <20201001144019.GJ6715@sirena.org.uk>
 <20201001153207.GA2414635@kroah.com> <20201001160316.GL6715@sirena.org.uk>
 <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
 <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001201718.GZ6715@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001201718.GZ6715@sirena.org.uk>
X-ClientProxiedBy: BL0PR02CA0093.namprd02.prod.outlook.com
 (2603:10b6:208:51::34) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0093.namprd02.prod.outlook.com (2603:10b6:208:51::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.35 via Frontend Transport; Fri, 2 Oct 2020 00:47:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kO9Ea-005PDv-7L; Thu, 01 Oct 2020 21:47:40 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601599668; bh=7bK4CodrkHL8V7GzwfdFVoXLCbkLPf38qpJYVPVeSIg=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=R6g57wEbExZ+32gQot01hrw98zJw7QNOL2RZ/bCphUkmjXSFg0TmCWqWxOvuRxCKN
 hVobexYH6rpTokD8Z97soyuSsqypFqqdtEXEfqUa0BHMxNSUQyMXvDf4dSk263amYY
 yAFseReMCdesP0ePEjVHTgiwY00bAeX4dmNWtCYRRcSr5zccexYxI+9MGDE7cfkHZ2
 SYYsFzdn8oe34LGPUrN+6/e7Vjy52xsTevKjl2TvcDO81pjC8CwKVan/sG3WZE4rPa
 /iAFzdw4fJreSBt1U+aJJ++uekGhgm80jc3rCt7XY0NQm4syoBU3aHwddmMziKAb54
 Kx8yqc8xg162w==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "Ertman,
 David M" <david.m.ertman@intel.com>
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

On Thu, Oct 01, 2020 at 09:17:18PM +0100, Mark Brown wrote:
> > I suppose it is not the end of the world adding elements to the definition of
> > struct ancillary_device, but what would be a "universal" element to add?
> > Where do you draw the line on what you allow into the bus internals?  The
> > overriding goal was to make a subsystem agnostic bus that doesn't impose
> > implementation specific details from any single subsystem.
> 
> I think that this needs to grow everything that platform and MFD have so
> that we can avoid using platform devices to represent things that are
> not in the very strictest sense platform devices (which I interpret to
> be memory mapped devices that can't be enumerated in some fashion).  My
> understanding here is that the goal is an abstraction cleanup, it's
> possible I've misunderstood though.

Instead of making ancillary bus giant, it might be interesting to use
a library technique to avoid the code duplication you are talking
about, eg

 struct my_ancillary_data {
      struct ancillary_device adev;
      struct ancillary_resource resources;
 }

Then each user can access the facets they need.

Not sure what else is in platform_device or mfd_cell that is
relevant:
 - There is no DMA, these devices are not for DMA. The physical device
   pointer should be used with the DMA API.
 - resources as above
 - id/override/archdata not relavent

From mfd_cell
 - enable/disable suspend/resume, these look like they duplicate the
   driver core stuff?
 - pdata/of_compatible/acpi_match - not applicable
 - properties - use struct members and container of
 - resources as above
 - regulators - another struct member? Only two users.

Jason
