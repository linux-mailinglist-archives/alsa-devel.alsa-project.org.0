Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2222A8830
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 21:38:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50FBF1671;
	Thu,  5 Nov 2020 21:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50FBF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604608733;
	bh=JYTrm7Ss4uybug0Q0/JefxlpWwYFf+zXoNak4CnfiJc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+jJXocaKh4WfLgFpBwi6gZtmYsOs3Hy5K0uX1F1sSm95FoRuI/b+kL3esfKCFCey
	 o5EtT2MtFp2XPaC+y503Ca+lqjW39XdR0UEe7bRB3K2NZpEPYxs/HR+dSb5E4Kz4qJ
	 HE3akqbhf9IOMqlUywRYG0TkGWpgGcyfa6DlDnbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DAEBF80279;
	Thu,  5 Nov 2020 21:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A350F80272; Thu,  5 Nov 2020 21:37:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 035E3F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 21:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035E3F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="NbrdKnIi"
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa4626f0000>; Fri, 06 Nov 2020 04:37:03 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 20:37:02 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 5 Nov 2020 20:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnqyUcLVRG18d1SrEC03wZRSObl5U0qtwLE5f90SGbYE0lUVhfhi+Oj+0YYWXJbjNvmkDnbmYRuSbHsdHODpzbZQhKMtoOeM27oB+FZQ1Omuh9TG07A4lBDzsduzII8lUeYuhMoS4EJQRES3e5G44PmkywOtwsOq6CBWlvwH+QT5dkIhvXRfbdDrNgvfxoGiH6fVsUdEm/XNowxetbjOI4W2RY7CZysvvI3PnC8R+cFJkboesaAXYJy+YDAmF7UmeO84XbskCvajT7hup7HGjEMwfzFcxWvtzcgfKk6jDTVu8SlG8zRZzo5a8lFrUhPmmM6rSJgJIbK4VUHkIH1/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xt+/BqP4eHKcUexk6gBfLRzpYUcgSiitWE/Ifm9Rjm4=;
 b=P8utTsyq1vbu3UfLkJFRFZcdPxu6fmmfxZUWqE/r9+PX4qh30pvApVySWFX63Rg+poOr4QkKsgLCvkl8ZKXqHjQH2l+i/7Sch/aB2UsgAMj/85b7c8owicTfuKRxPf7IsTj+lsLtpYTvEVE6S0/pnyhPg258INFcSPEg6njHj2Q0PEjANBbY5eEo4v3bEXPrk1/YGsg/TR0Z4ji8jOmHumsefZMlyinpsmJyzF8bVR4WTYm6OlUUC65jJUFTNWOcsZDmQmdq0OPWHVovCymUfFG4KLXnxGFQlHf/DC3T3Rl7qnVimD0hraYJmrJoQ6acyOyzcb5TrOj1diM9zgPBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 20:36:59 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 20:36:59 +0000
Date: Thu, 5 Nov 2020 16:36:57 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Saeed Mahameed <saeed@kernel.org>
Subject: Re: [PATCH mlx5-next v1 04/11] vdpa/mlx5: Make hardware definitions
 visible to all mlx5 devices
Message-ID: <20201105203657.GR2620339@nvidia.com>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-5-leon@kernel.org>
 <8a8e75215a5d3d8cfa9c3c6747325dbbf965811f.camel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a8e75215a5d3d8cfa9c3c6747325dbbf965811f.camel@kernel.org>
X-ClientProxiedBy: MN2PR16CA0040.namprd16.prod.outlook.com
 (2603:10b6:208:234::9) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR16CA0040.namprd16.prod.outlook.com (2603:10b6:208:234::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 20:36:59 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kam09-000No4-H7; Thu, 05 Nov 2020 16:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604608623; bh=xt+/BqP4eHKcUexk6gBfLRzpYUcgSiitWE/Ifm9Rjm4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=NbrdKnIiqHTseiJQZ37HyN2tWIkD7tGkU6xCXTYCn0jRen1Jr5FQtZmt+2jxpEmAs
 zIcGrefQ1O6YEKDlEG9l8G7vaxjwwV6qyU8UXTIA3IRpJ2t0SRb+ffNpiDXMyZVxPd
 mJ9hyCkU81XLBqAdea3DJyp2VuIl+NAp7nhJsRzWMPA0MIG6VTys6VcbudQBZSF4dr
 73l6O5iGNuM1RVFZ0KNX9nmyeP6SqIu8PQV5tvRSvd9FUr4yLSgnliRs1CvNHjjw6J
 7ATmIiD6Pqwetg0mBdTvBaCi0+vpKgga3i3K4tRRFa/cOsnZgDzaKMYkv8zLNSqsQO
 /waoQ9cwS4+1Q==
Cc: alsa-devel@alsa-project.org, "Michael S. Tsirkin" <mst@redhat.com>,
 tiwai@suse.de, Jason Wang <jasowang@redhat.com>,
 ranjani.sridharan@linux.intel.com, Leon Romanovsky <leonro@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 Doug Ledford <dledford@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 kiran.patil@intel.com, broonie@kernel.org, Parav Pandit <parav@nvidia.com>,
 Roi Dayan <roid@nvidia.com>, dan.j.williams@intel.com,
 virtualization@lists.linux-foundation.org, shiraz.saleem@intel.com,
 gregkh <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
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

On Thu, Nov 05, 2020 at 12:31:52PM -0800, Saeed Mahameed wrote:
> On Sun, 2020-11-01 at 22:15 +0200, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Move mlx5_vdpa IFC header file to the general include folder, so
> > mlx5_core will be able to reuse it to check if VDPA is supported
> > prior to creating an auxiliary device.
> > 
> 
> I don't really like this, the whole idea of aux devices is that they
> get to do own logic and hide details, now we are exposing aux
> specific stuff to the bus ..  let's figure a way to avoid such
> exposure as we discussed yesterday.

Not quite, the idea is we get to have a cleaner split between the two
sides.

The device side is responsible for things centric to the device, like
"does this device actually exists" which is what is_supported is
doing.

The driver side holds the driver specific logic.

> is_supported check shouldn't belong to mlx5_core and each aux device
> (en/ib/vdpa) should implement own is_supported op and keep the details
> hidden in the aux driver like it was before this patch.

No, it really should be in the device side.

Part of the point here is to properly fix module loading. That means
the core driver must only create devices that can actually have a
driver bound to them because creating a device triggers module
loading.

For instance we do not want to auto load vdpa modules on every mlx5
system for no reason, that is not clean at all.

Jason
