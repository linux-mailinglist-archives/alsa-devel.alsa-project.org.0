Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC87281938
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 19:28:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D0C1F34;
	Fri,  2 Oct 2020 19:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D0C1F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601659685;
	bh=b3QB3tF8uQLC/DIqopXQGqHb2WNwAyeG429JfhX89Sg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJxdzD4A2R9Z4W3Pt4/xZ8i78742bqu8k4ddyHAXDLdM38V1HPM4O23ul5R5Reorw
	 eg+HOoRFc3cuZWbZrt5J61aR/JotIlC9T9FhNZAMO+e3/8JPZRCW0gX8q/DS5coKlM
	 wVbRJZd9VxaS9fC1+ow+L595+JbecjSiQLE9PoNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBBDF80228;
	Fri,  2 Oct 2020 19:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F92F801F9; Fri,  2 Oct 2020 19:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C3BCF800E5
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 19:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3BCF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ejlieVYb"
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7762ae0000>; Sat, 03 Oct 2020 01:26:06 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 17:26:01 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 2 Oct 2020 17:26:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW1mxEewv19r++pgrdHL9k4TZCTqO36lRPgmL9zz1b8zMvHFAGjC7NVZsfsZuubLuxg/KC9MMIQAWNr7nYq7n8sEHqBCxm4DwQBIrBVohH5LpMrvk2hK2aU6vdf2Hb+yhivNeevQHRhxtmJ4spHUlcvsd9+LCaSWqPezyYGhhHWko78zRNocymhtZ/IuMqyEGTXI632vPWGITwhJoQ/RkMvJFNH+uNcGzdMvanbSffq3IZUG4SNVz/GLfPc3wQhbvQ+hZCuN7bx/2jbB5cI3Fzu7jMvinvYrf5VbvD5sEdmLaUeEb+6owfxH45G6dDih5iLTFn3Ii77RXbJ4Lwc3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByjQd8xdBG/BJt9TtnaZE7r1R4kr2mXseqTYI88OZRw=;
 b=TkbnIPZnPX3v/JgZtd0kd010aJ+dM4sCfdD+6KftEiIpfRQpgUF7qYRbYFsX4QY0LANonb0F3/AJZ//DrI/6KvV1CpgIvB139fEwAzXqCV92/lm2O9KGknGlAq5OJflJQFadm7UoFENrVV40ShQpSmgn02BL81v3ABPr3IZL1B2Bhz1Mn6JQBi0fCJ2P8mGhGhKdi1TVagYnwqaYi6XIUhILIWNcXQWULjH9wLzib+kSDiqQoy3fB4hYOMHVWudspIMuXVThtH5O87fognn2502Zcz2bUhwQyDxYnZSIGr3VmzdA08MWndwv7nHuJorHwN4MwSN2kZcYF2kzEamJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4497.namprd12.prod.outlook.com (2603:10b6:5:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 17:25:59 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 17:25:59 +0000
Date: Fri, 2 Oct 2020 14:25:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201002172558.GL816047@nvidia.com>
References: <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk> <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
 <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001201718.GZ6715@sirena.org.uk> <20201002004740.GF816047@nvidia.com>
 <20201002111932.GA5527@sirena.org.uk>
 <DM6PR11MB28417402C0F65B993C6E7E8CDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB28417402C0F65B993C6E7E8CDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR01CA0021.prod.exchangelabs.com (2603:10b6:208:71::34)
 To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR01CA0021.prod.exchangelabs.com (2603:10b6:208:71::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.37 via Frontend Transport; Fri, 2 Oct 2020 17:25:59 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kOOog-006FOc-2o; Fri, 02 Oct 2020 14:25:58 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601659566; bh=ByjQd8xdBG/BJt9TtnaZE7r1R4kr2mXseqTYI88OZRw=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=ejlieVYbTZVQpDQazDv4QhXyyhI9ezsj8/ULWxUx8VkhhFS00kBixhg2Z/1w0wChf
 H2mK2XzFe/MxcUHt1ZfvY49iKTE5hT4Bp1MKZv6UDpWZx6nzBRvqzNg4mV+rEvLJyw
 rzVbt3vST3N7axnLKP+LyjDUHXvaMxENLBJW3el1mEppj72AuKS5ugq1t557L3At1o
 ozsqsT4b56+eu1Nej14uLLwX395lAovi6p5KFBjmXQjof/mGHh6Md3aCfB8XfHervq
 CkasBPZ+SBFLbPGc2xls96/Z+NhnR/j97ETvM0I9ylsqsxhebUi6wpYKEazNO087+a
 j6gHBL1leFleA==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "parav@nvidia.com" <parav@nvidia.com>
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

On Fri, Oct 02, 2020 at 05:23:53PM +0000, Ertman, David M wrote:
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Friday, October 2, 2020 4:20 AM
> > To: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Ertman, David M <david.m.ertman@intel.com>; Greg KH
> > <gregkh@linuxfoundation.org>; alsa-devel@alsa-project.org;
> > tiwai@suse.de; pierre-louis.bossart@linux.intel.com; Sridharan, Ranjani
> > <ranjani.sridharan@intel.com>; parav@nvidia.com
> > Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
> > support
> > 
> > On Thu, Oct 01, 2020 at 09:47:40PM -0300, Jason Gunthorpe wrote:
> > > On Thu, Oct 01, 2020 at 09:17:18PM +0100, Mark Brown wrote:
> > 
> > > Instead of making ancillary bus giant, it might be interesting to use
> > > a library technique to avoid the code duplication you are talking
> > > about, eg
> > 
> > >  struct my_ancillary_data {
> > >       struct ancillary_device adev;
> > >       struct ancillary_resource resources;
> > >  }
> > 
> > > Then each user can access the facets they need.
> > 
> > The way most of this stuff works already it's not a table in the device
> > itself, it's an array of resources with type information.  Your second
> > struct there is presumably just going to be the pointer and size
> > information which you *could* split out but I'm really not sure what
> > you're buying there.
> > 
> > The interesting bit isn't really the data in the devices themselves,
> > it's the code that allows devices to just supply a data table and have
> > things mapped through to their child devices.  That isn't particularly
> > complex either, but it's still worth avoiding having lots of copies of
> > it.  *None* of this bus stuff is hugely complex but we still don't want
> > each device with children having to open code it all when they could
> > just do something data driven.
> 
> Would you recommend adding two elements to the ancillary_device like:
> 	void *ancillary_data;
> 	u32 ancildata_size;
> like the platform_device uses?

That doesn't seem useful here, the intent is to use container_of, if
the creator wants to pass private data then it should be structured
into the containing struct.

platform_devices/etc don't use container_of so have this side band way
to pass more data.

Jason
