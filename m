Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B72A8FBD
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 07:58:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DF4E165E;
	Fri,  6 Nov 2020 07:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DF4E165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604645900;
	bh=yRhE6XR0cLSyZZkXEIf4EKqkW1OuHyv4bdZKoioXVrw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nHMyi0UziSnJbWSpXdVoOp2317FW/fn4MKe3yy0vTXNk7OF4YvGBUEP50Zay7g0GY
	 gNPNvSGLoP+9wR/PHGFkv4U2MtI5C75KOaVEIaJqeGZ158CE6skY543m5PBZK+ODsB
	 Tet+OiDBzsMw+PK5O9ovmieIgwLXwW8b/8OpFJB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB76F80150;
	Fri,  6 Nov 2020 07:56:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F797F80234; Fri,  6 Nov 2020 07:56:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2990F80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 07:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2990F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kuiVH9hQ"
Received: from localhost (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83A17206F4;
 Fri,  6 Nov 2020 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604645793;
 bh=yRhE6XR0cLSyZZkXEIf4EKqkW1OuHyv4bdZKoioXVrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kuiVH9hQopx87bfdsAx2gbKmFgqYBDw23j1qfXnRfX10trVIjqzi1XQuIsXTGLE9G
 1DTngfIQUa/4q9EbToBgKnayZOqY86jTsC5P77eqHjqujTvlcdN+c69Yid3YbD3VC5
 tWou/zcOf1hZwMT8Gp8NSxGCgRn/4TGKZrD2daKc=
Date: Fri, 6 Nov 2020 08:56:29 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Saeed Mahameed <saeed@kernel.org>
Subject: Re: [PATCH mlx5-next v1 05/11] net/mlx5: Register mlx5 devices to
 auxiliary virtual bus
Message-ID: <20201106065629.GD5475@unreal>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-6-leon@kernel.org>
 <d10e7a08200458c1bddb72fc983a5917daebc8f1.camel@kernel.org>
 <20201105210948.GS2620339@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105210948.GS2620339@nvidia.com>
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

On Thu, Nov 05, 2020 at 05:09:48PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 12:59:20PM -0800, Saeed Mahameed wrote:
>
> > 2. you can always load a driver without its underlying device existed.
> > for example, you can load a pci device driver/module and it will load
> > and wait for pci devices to pop up, the subsysetem infrastructure will
> > match between drivers and devices and probe them.
>
> Yes, this works fine with this design
>
> > struct aux_driver mlx5_vpda_aux_driver {
> >
> >       .name = "vdpa",
> >        /* match this driver with mlx5_core devices */
> >       .id_table = {"mlx5_core"},
> >       .ops {
> >             /* called before probe on actual aux mlx5_core device */
> >            .is_supported(struct aux_device);
>
> This means module auto loading is impossible, we can't tell to load
> the module until we load the module to call the is_supported code ..

Right, and if we can, it will be violation of everything we know in
driver model, because the call "is_supported" will need to be called
for every registered driver without any relation to existed devices.

And mlx5_rescan_drivers() came as a need to overcome LAG and eswitch
craziness in everything related to their reprobe flows. Once they will
be changed to work like normal drivers, we will be able to simplify it.

So let's talk offline to see how can we improve mlx5_core even more
after this series is merged.

Thanks

>
> Jason
