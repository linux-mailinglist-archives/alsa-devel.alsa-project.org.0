Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63F2A7810
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 08:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B925E1678;
	Thu,  5 Nov 2020 08:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B925E1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604561639;
	bh=95POjnfgmnBfa+PcIUbO71yIixyEwcBCZu8ONi41qSI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QI2tE+RQmFz5Ix86BKtsYwH/DtuD1QO7vGLY4uImWd8uR18TZ3hriu7bt0U2TKY7d
	 SbeYqpgBcWchdl509SsyMYLE2dkutegn/P0bX0yupvQO0npnv82sdkCqsgClNjSmkV
	 0xCtJKzzj5eHLs7+8PgTKk1O8iKlpIhFYz1ndU/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18870F80150;
	Thu,  5 Nov 2020 08:32:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F94F80171; Thu,  5 Nov 2020 08:32:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A8DF800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 08:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A8DF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v7jixjnR"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 930A420936;
 Thu,  5 Nov 2020 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604561534;
 bh=95POjnfgmnBfa+PcIUbO71yIixyEwcBCZu8ONi41qSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v7jixjnRS8IofHWpcD2+DxxCXJ90U/evKE0DUQul2JT/Y8H+g7nVaRbkifKy48xox
 VDGBlpUHfWervGmkwxAM0ACUtpdpFRRs9k0EqAwpLdfoM3L9+GBIUBILJMUGPAe8zd
 NU6sc18Y6rTq9FYLuezM9oiY3jBE5sPskCQybDUw=
Date: Thu, 5 Nov 2020 08:33:02 +0100
From: gregkh <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH mlx5-next v1 06/11] vdpa/mlx5: Connect mlx5_vdpa to
 auxiliary bus
Message-ID: <20201105073302.GA3415673@kroah.com>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-7-leon@kernel.org>
 <20201103154525.GO36674@ziepe.ca>
 <CAPcyv4jP9nFAGdvB7agg3x7Y7moHGcxLd5=f5=5CXnJRUf3n9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jP9nFAGdvB7agg3x7Y7moHGcxLd5=f5=5CXnJRUf3n9w@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Takashi Iwai <tiwai@suse.de>, Jason Wang <jasowang@redhat.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Jakub Kicinski <kuba@kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>, Mark Brown <broonie@kernel.org>,
 Parav Pandit <parav@nvidia.com>, David M Ertman <david.m.ertman@intel.com>,
 Roi Dayan <roid@nvidia.com>, virtualization@lists.linux-foundation.org,
 "Saleem, Shiraz" <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Saeed Mahameed <saeedm@nvidia.com>, "David S . Miller" <davem@davemloft.net>
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

On Wed, Nov 04, 2020 at 03:21:23PM -0800, Dan Williams wrote:
> On Tue, Nov 3, 2020 at 7:45 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> [..]
> > > +MODULE_DEVICE_TABLE(auxiliary, mlx5v_id_table);
> > > +
> > > +static struct auxiliary_driver mlx5v_driver = {
> > > +     .name = "vnet",
> > > +     .probe = mlx5v_probe,
> > > +     .remove = mlx5v_remove,
> > > +     .id_table = mlx5v_id_table,
> > > +};
> >
> > It is hard to see from the diff, but when this patch is applied the
> > vdpa module looks like I imagined things would look with the auxiliary
> > bus. It is very similar in structure to a PCI driver with the probe()
> > function cleanly registering with its subsystem. This is what I'd like
> > to see from the new Intel RDMA driver.
> >
> > Greg, I think this patch is the best clean usage example.
> >
> > I've looked over this series and it has the right idea and
> > parts. There is definitely more that can be done to improve mlx5 in
> > this area, but this series is well scoped and cleans a good part of
> > it.
> 
> Greg?
> 
> I know you alluded to going your own way if the auxiliary bus patches
> did not shape up soon, but it seems they have and the stakeholders
> have reached this consensus point.
> 
> Were there any additional changes you wanted to see happen? I'll go
> give the final set another once over, but David has been diligently
> fixing up all the declared major issues so I expect to find at most
> minor incremental fixups.

This is in my to-review pile, along with a load of other stuff at the
moment:
	$ ~/bin/mdfrm -c ~/mail/todo/
	1709 messages in /home/gregkh/mail/todo/

So give me a chance.  There is no rush on my side for this given the
huge delays that have happened here on the authorship side many times in
the past :)

If you can review it, or anyone else, that is always most appreciated.

thanks,

greg k-h
