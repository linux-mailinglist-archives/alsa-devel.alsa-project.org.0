Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6E2A9000
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:07:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD361607;
	Fri,  6 Nov 2020 08:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD361607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604646466;
	bh=NcentItc4GzP7DMUGCOjybP9u3nED8AkeAk+ghWanY8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ld1NNU+bL4Fhz7OticTRFGPRuu7nfQtPX+bhyzsi2GudlQNx9ywQSlznVMyFLSb8z
	 EcyTHK7sezJj+xbn1CM4ND2t+KkR0RtTEht+B3Fbtoh1s94ZOOt5s51qEID3uYyNnG
	 6xjy3JginTVo/LobJxQdCKXp/4kES35GjIOgei2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F22F8023E;
	Fri,  6 Nov 2020 08:06:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 794FEF80234; Fri,  6 Nov 2020 08:06:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87C53F80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C53F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WeQA5GCo"
Received: from localhost (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D5BA221FE;
 Fri,  6 Nov 2020 07:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604646357;
 bh=NcentItc4GzP7DMUGCOjybP9u3nED8AkeAk+ghWanY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WeQA5GCo1OiQ1S6XtvtUVHunQH7CB+jf6nhafOK25CaY7SOsjWWUXWSJTXufQ/GuX
 LsOp24B2uwbjJacAax4MwryzJX6VOHqIaoqxNPHG9ye7oPP/P7SCzGEIZXBAu0IGyo
 jpWetcwbyQsUe42ZWwf7KowqZsGWui5Y9hyxhSz8=
Date: Fri, 6 Nov 2020 09:05:52 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Saeed Mahameed <saeed@kernel.org>
Subject: Re: [PATCH mlx5-next v1 04/11] vdpa/mlx5: Make hardware definitions
 visible to all mlx5 devices
Message-ID: <20201106070552.GE5475@unreal>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-5-leon@kernel.org>
 <8a8e75215a5d3d8cfa9c3c6747325dbbf965811f.camel@kernel.org>
 <20201105203657.GR2620339@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105203657.GR2620339@nvidia.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-rdma@vger.kernel.org, gregkh <gregkh@linuxfoundation.org>,
 Jason Wang <jasowang@redhat.com>, ranjani.sridharan@linux.intel.com,
 Roi Dayan <roid@nvidia.com>, virtualization@lists.linux-foundation.org,
 fred.oh@linux.intel.com, tiwai@suse.de, Doug Ledford <dledford@redhat.com>,
 broonie@kernel.org, Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, dan.j.williams@intel.com,
 shiraz.saleem@intel.com, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
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

On Thu, Nov 05, 2020 at 04:36:57PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 12:31:52PM -0800, Saeed Mahameed wrote:
> > On Sun, 2020-11-01 at 22:15 +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > >
> > > Move mlx5_vdpa IFC header file to the general include folder, so
> > > mlx5_core will be able to reuse it to check if VDPA is supported
> > > prior to creating an auxiliary device.
> > >
> >
> > I don't really like this, the whole idea of aux devices is that they
> > get to do own logic and hide details, now we are exposing aux
> > specific stuff to the bus ..  let's figure a way to avoid such
> > exposure as we discussed yesterday.
>
> Not quite, the idea is we get to have a cleaner split between the two
> sides.
>
> The device side is responsible for things centric to the device, like
> "does this device actually exists" which is what is_supported is
> doing.
>
> The driver side holds the driver specific logic.
>
> > is_supported check shouldn't belong to mlx5_core and each aux device
> > (en/ib/vdpa) should implement own is_supported op and keep the details
> > hidden in the aux driver like it was before this patch.
>
> No, it really should be in the device side.
>
> Part of the point here is to properly fix module loading. That means
> the core driver must only create devices that can actually have a
> driver bound to them because creating a device triggers module
> loading.
>
> For instance we do not want to auto load vdpa modules on every mlx5
> system for no reason, that is not clean at all.

Saeed,

Jason gave very good example and it is not far from the real life requirement.
We have an internal task to make sure that mlx5_vdpa is loaded without any
other mlx5_* modules (ib and eth). This series solves it naturally.

Thanks

>
> Jason
