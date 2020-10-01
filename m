Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB212805BC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6BF81AA7;
	Thu,  1 Oct 2020 19:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6BF81AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601574283;
	bh=qMAeL7FV9IbsH2LxyoI36mspjNM8vEIzFh/17pb6DFE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tlNgZFjyBDOjvPX/0r16MmE4GwdtyvPndb6Sl877TE0pUr00+1lJ2as4yw0K6LGQQ
	 DcIJkgfVpKKQu/CppQ8aFd5C+Kk4RU6reQ0n8AhBgP2cupMRXLagfcpbYxrA+OINBe
	 1z4ANlLywH5Atbjsj4Lxg+6YIn2Nf0Xs0NAOLnoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 042A9F801D8;
	Thu,  1 Oct 2020 19:43:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB63F801F5; Thu,  1 Oct 2020 19:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C82F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C82F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iotvgtZQ"
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7615130000>; Fri, 02 Oct 2020 01:42:43 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:42:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 17:42:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iem59dCUaauyQnaKrxXyEs11XwaKwoIV48R6ONU0l5S/lam82D0qTD6c6Y3OD6YxCQDqVX6cEEwYEaWSe879074U95sSzpMEOtVeqaZ2wBRWw+EwseK9qqm+b4OOf4JbikZCdbIDi+d+Hpz64jYOcm76JDEI3KvzcC5fIXp4jCp6BsGBaAy30n4ASfMsp+9508mzAi8hiHyOzoKbF/nk8x2dbtzguAmpsb6eVXgF9VxGjmwUgvtD9uRvI8FkbA10EVj8eUocsGAo331UOU24BvBlu3BqUC5k/Nqea35ldnDNN9ibbkSJRpurmePXHRBHfZJl3ajz4oPZGYER5YKNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71r9j0YMg8MOj1X9Tecp4pTJPdrci9PWDNuK/y4/1Jo=;
 b=h82sC1kGZ3+tWpo0r5GFFNiA9pPJ2pX6kBWuAWqphX2DQoLaKTJ8nvPj+i/IzKSGMh3no50/z69T0Zui8gWCp5asl3SuJQ+6p5yCdZzQABSOGEXShaa/TY9fFhYDz7jfw1nSbMbxxStinJrTHb/J4YWD7RCKn6h8Jt3VtETaJt7y0sw2uyZkJQWH2iE8o71+iBA6sF3/pkT9+lAH5PoYsUweUOjVqwRP3a73hgL4G1tXn03uMPptzUVHCoyuzEE4oLhHV4NTmfvwgokRzVEkIZ1hpmPvVjeU5vrIk1d3bTIK84k7f32wqjzIQHDxP4UmMH/2+FnHI2QyddlCXfevIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3210.namprd12.prod.outlook.com (2603:10b6:5:185::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 1 Oct
 2020 17:42:38 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 17:42:38 +0000
Date: Thu, 1 Oct 2020 14:42:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001174237.GC1107577@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com> <20201001115847.GY816047@nvidia.com>
 <20201001121423.GA2375307@kroah.com> <20201001143334.GA1103926@nvidia.com>
 <20201001143855.GA2398269@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001143855.GA2398269@kroah.com>
X-ClientProxiedBy: MN2PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:208:e8::25) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR20CA0012.namprd20.prod.outlook.com (2603:10b6:208:e8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Thu, 1 Oct 2020 17:42:38 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kO2bF-004irw-7v; Thu, 01 Oct 2020 14:42:37 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601574163; bh=71r9j0YMg8MOj1X9Tecp4pTJPdrci9PWDNuK/y4/1Jo=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=iotvgtZQ6raXcdbp8QVPfoiKfr/zRx2fqou5nJuUJtw9CT5Ttgchflng8h4SgetzJ
 9ZijuzudJLGcd3u9XPq33EoodJ6J8ug5MNdfBocRCfnzBaUL5pYIzZG9QglKQ+8tfl
 yyUZ+PSI4kDkmGIrfp6K8xFuBcpn1BkbHzDerdLT/kcTqAy7HmREEo9wWtpkvkR9k9
 xH9HxqVYEwK4V/Fy0QrgCg8t1LLf7RXe4xczB5YxyCaCJ5xwuqpFyE+cXyBLw+wbFg
 kSoGupiXKbh0R47xtQBp5/IzSormbl7J91P23wzL8c8gv+zqPq/DQkBRZJUjQpB3gC
 UGt+08JKbI4Mw==
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

On Thu, Oct 01, 2020 at 04:38:55PM +0200, Greg KH wrote:
> On Thu, Oct 01, 2020 at 11:33:34AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2020 at 02:14:23PM +0200, Greg KH wrote:
> > > On Thu, Oct 01, 2020 at 08:58:47AM -0300, Jason Gunthorpe wrote:
> > > > On Thu, Oct 01, 2020 at 01:05:51PM +0200, Greg KH wrote:
> > > >  
> > > > > You have to be _VERY_ careful after calling
> > > > > ancillary_device_initialize(), as now you can not just free up the
> > > > > memory if something goes wrong before ancillary_device_add() is called,
> > > > > right?
> > > > 
> > > > I've looked at way too many versions of this patch and related. This
> > > > is the only one so far that I didn't find various bugs on the error
> > > > cases.
> > > 
> > > But you haven't seen the callers of this function.  Without this
> > > documented, you will have problems.
> > 
> > I've seen the Intel irdma, both versions of the SOF stuff and an
> > internal mlx5 patch..
> > 
> > Look at the SOF example, it has perfectly paired error unwinds. Each
> > function has unwind that cleans up exactly what it creates. Every
> > 'free' unwind is paired with an 'alloc' in the same function. Simple.
> > Easy to audit. Easy to correctly enhance down the road. 
> > 
> > This is the common kernel goto error design pattern.
> 
> But that's where people get this wrong. 

People get everything wrong :( At least this pattern is easy to notice
and review.

> Once device_initialize() is called, the "free" can not be called,
> something else must be, device_put().

Yep! 

However, with the one step device_register() pattern code usually
makes this class of mistake:

https://elixir.bootlin.com/linux/latest/source/drivers/firewire/core-device.c#L722

'goto skip_unit' does kfree() on something that already has been
device_initialized(). This is a real bug because this code called
dev_set_name() on line 713 and not doing the put_device() leaked the
name allocation. I think < v10 had this mistake.

dev_set_name() is a common error, here is another version:

https://elixir.bootlin.com/linux/latest/source/drivers/dma/idxd/cdev.c#L226

This correctly gets the switch to put_device() after
device_register(), but it calls kfree on line 220 after
dev_set_name(). This leaks memory too. Something like v16 of this
series had this bug as well.

BTW, want a patch to add a kref_read(dev->kref) == 0 warning to
dev_set_name() ? This seems pretty common, these were the first two
random choices from LXR I checked :\

> Sure, but without a real user that _NEEDS_ this two-step process, let's
> not include it.  Why bake complexity into the system from the start that
> is never used?

It just needs to not have these common error unwind bugs :(

Jason
