Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2A828015D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 16:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A6718DB;
	Thu,  1 Oct 2020 16:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A6718DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601562939;
	bh=zTEPit1zJYV4xGiZ4xeeph5tfczdtKIor7l9uEiYHt8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmVbz0iTdF0JWKSDmAQ6aPPjIZhEcUIaAqbyIqIGDgBrIoel4B9UjhypZTKcaCA1c
	 OSUA3aV19SZ9SI+xtLycXSVKdWEl+YbtXXCn7aYbvIfVd8Ikv03ZguLM/yxU3EASFN
	 Uql8m94Kg+56SrwadNLG6xbzXo3u7eflfmZqUVJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2020F800AB;
	Thu,  1 Oct 2020 16:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43BB6F801DB; Thu,  1 Oct 2020 16:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 641B8F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 16:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 641B8F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="npZVjcsP"
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75e8c60000>; Thu, 01 Oct 2020 22:33:42 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 14:33:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.50) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 14:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzTnTqpbEesKSx219N0rrbfvmMd+u1tJu36qQJSlvcJKOTabzKKZTU3ih7qfryfH7nyvijVU0uSv4IK7/kcgv4mKqeuExzaUVJ4koOvv71cdkvMDC53EVBZO4eXxZmUPkuUxNGK3uMabCi+TgcRfpJE4x2USsfIKOnqPhi7RqsnyuyDL9D5KNhWA3Y/wO1jzvwmnKm5zggsN0Fks01SM1/yVQPdqYk4zWZlMXU45P1l5gjdBLHfsWmzS6UW5GYo2OAB/DK0ymDoKViXTlHuhTmh+Ce1U6EYVBsS/Vkl0uq1VR1GiXy0DzH8Wg+Rs3lwKbLOUO/SIadiwICYj9ERT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgdMNZ3UAcOLRH3QMf4QtJox1Fxwbtn1molmH3bNLmw=;
 b=niGgQCiQ7/PPNQRQi7Tm7MkqIBFMI3cEfs31YtZ62oU2N7BTwRqhWgq3C6LALx4qrUGNK2RENoE2n1uzttTYd5Kmp5Ch6fzhSQrssMhLEoS7e5ZYYqCvc66Th8FrA9SoG21yz3PNl29ygb4aEbM18D53emV+HlKNhU3nPjDlQy+CqVAtUeHQaEbWWyOxtqzoKN8aSg4y0mj1i+kr9ZLUEeAyzk6F9AjbRDAdol9lCY0yMcRDvNgWahdnYkf3oq2vhlPFbFuTRSCcRgNbNSZn0/E6eMa5trmFlHnT3jNl/PWrvbYDWfJE+SughuJTIhitXxmexYJC3jJzrxDzT5+fnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4513.namprd12.prod.outlook.com (2603:10b6:5:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 14:33:35 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 14:33:35 +0000
Date: Thu, 1 Oct 2020 11:33:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001143334.GA1103926@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com> <20201001115847.GY816047@nvidia.com>
 <20201001121423.GA2375307@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001121423.GA2375307@kroah.com>
X-ClientProxiedBy: MN2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:208:1a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Thu, 1 Oct 2020 14:33:35 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNzeI-004fsn-AO; Thu, 01 Oct 2020 11:33:34 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601562822; bh=zgdMNZ3UAcOLRH3QMf4QtJox1Fxwbtn1molmH3bNLmw=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=npZVjcsPOyg8+7N/rJbPsIv6DZaUbzF5u2QqXarrTvKT4UR/3hskJZnQch/aJnBY/
 awamWuqQII9C3pN3KEfkf2g19STQh+tr8bWDRhskFeYM3IZs4tKvv+/jXNe8UmONxV
 eNi6pUA6hAaCp2bmQC2aBz0UPRw9dHLC/d/2wedGqmbZCCv3ayVuZmxOh45EaJ4ic4
 qvoKcEPjM9dI+y78LKNYhOlJbZkXhKIXEJxLjA3JFaF5jLx64lCY3gYvpmG2wFgenO
 CI5DpzWCW8AMhj7mkFUkPDJrUSUS2uJoWPeaXSisULbn6p9AIkVG8DesJ0ArGkVbYj
 zozmQJR5zqqIw==
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

On Thu, Oct 01, 2020 at 02:14:23PM +0200, Greg KH wrote:
> On Thu, Oct 01, 2020 at 08:58:47AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2020 at 01:05:51PM +0200, Greg KH wrote:
> >  
> > > You have to be _VERY_ careful after calling
> > > ancillary_device_initialize(), as now you can not just free up the
> > > memory if something goes wrong before ancillary_device_add() is called,
> > > right?
> > 
> > I've looked at way too many versions of this patch and related. This
> > is the only one so far that I didn't find various bugs on the error
> > cases.
> 
> But you haven't seen the callers of this function.  Without this
> documented, you will have problems.

I've seen the Intel irdma, both versions of the SOF stuff and an
internal mlx5 patch..

Look at the SOF example, it has perfectly paired error unwinds. Each
function has unwind that cleans up exactly what it creates. Every
'free' unwind is paired with an 'alloc' in the same function. Simple.
Easy to audit. Easy to correctly enhance down the road. 

This is the common kernel goto error design pattern.

> Why is this two-step process even needed here?

Initializing the refcount close to the allocation is a common design
pattern as is initializing it close to registration. Both options are
tricky, both have various common subtle bugs, both have awkward
elements.

At the end of the day, after something like 20 iterations, this is the
first series that actually doesn't have error unwind bugs.

Can we empower Dave to make this choice? It is not like it is wild or
weird, the driver core already exposes _initialize and _add functions
that work in exactly the same way.

Jason
