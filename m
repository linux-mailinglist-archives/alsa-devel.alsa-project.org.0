Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6A3958E2
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 12:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD39950;
	Mon, 31 May 2021 12:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD39950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622456442;
	bh=2E17MlRyF9jgcHRKGxx+DAw+cGznl+dPMZItWR6H9cU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWEU/1ukc38sWsx7wbY9kCP+3m+U4FqDzlut8VAKQBgWnieP8BH55DnMq0scn8Au4
	 ehgel3Rwz0w1AUhLrg2R2laaMHZeK9h4+wGSIkxiAEPqmvIFedWRSN/LC8ExAaN6Fm
	 v46s22q+ts5DRi1AfFZX5MR0WV3bR4u+PyDqfnFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5826F80273;
	Mon, 31 May 2021 12:19:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD725F80424; Mon, 31 May 2021 12:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F203F80253
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 12:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F203F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hi18iMai"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 315AB610E7;
 Mon, 31 May 2021 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622456379;
 bh=2E17MlRyF9jgcHRKGxx+DAw+cGznl+dPMZItWR6H9cU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hi18iMaiTtmfV15fMTFLamQcUewXekVls0ezWCip0YAjTJLadV9l4dkfuresXmB3m
 kXdPZRi4PXEl5DYSIb2JhuPUic5GnjMhxqyrWQoB/sYartinPy0JzkWsiv2P89LBl6
 jdxZNQBdunxmhxtZxVQZW/dNumGt7FHLQCEWgsEtzoFhHUTg8xzPBlmajJhxKaIvMu
 EIcUcBhxSj0LtU8PpXxKN3gyvctXo8bw5RbdMnG5c1Q1PWByBqYo/b2PzIVEm/0E0v
 mzrTfMFs6bZWA4gqxoaTycQ58ahtZDX4cZS6BzG2fbCjtFGwYXBrPaDap0yak6Jjmf
 t9wIvXfF8+dHA==
Date: Mon, 31 May 2021 15:49:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hui.wang@canonical.com,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 25-05-21, 13:30, Pierre-Louis Bossart wrote:
> On 5/11/21 12:21 AM, Bard Liao wrote:
> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > 
> > Now that the auxiliary_bus exists, there's no reason to use platform
> > devices as children of a PCI device any longer.
> > 
> > This patch refactors the code by extending a basic auxiliary device
> > with Intel link-specific structures that need to be passed between
> > controller and link levels. This refactoring is much cleaner with no
> > need for cross-pointers between device and link structures.
> > 
> > Note that the auxiliary bus API has separate init and add steps, which
> > requires more attention in the error unwinding paths. The main loop
> > needs to deal with kfree() and auxiliary_device_uninit() for the
> > current iteration before jumping to the common label which releases
> > everything allocated in prior iterations.
> > 
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > ---
> > v2:
> >   - add link_dev_register for all kzalloc, device_init, and device_add.
> > v3:
> >   - Modify the function description of sdw_intel_probe() which was
> >     missing in previous version.
> > v4:
> >   - Move intel_link_dev_unregister(ldev) before pm_runtime_put_noidle(
> >     ldev->link_res.dev) to fix use-after-free reported by KASAN.
> 
> Two years ago, GregKH stated in
> https://lore.kernel.org/lkml/20190509181812.GA10776@kroah.com/
> 
> "So soundwire is creating platform devices?  Ick, no!  Don't do that"
> 
> Fast forward two years, this patch provides a solution to remove the use of
> the platform devices with the auxiliary bus. This move does not add any new
> functionality, it's just a replacement of one type of device by another.
> 
> The reviews have been rather limited since the first version shared on March
> 22.
> 
> a) I updated the code to follow the model of the Mellanox driver in
> 
> https://elixir.bootlin.com/linux/latest/source/include/linux/mlx5/driver.h#L545
> 
> I hope this addresses GregKH's feedback on the need for a 'register'
> function to combined the two init and add steps. I didn't see a path to add
> a generic register function in the auxiliary bus code since between init and
> add there is a need to setup domain-specific structures. Other contributors
> to the auxiliary bus (CC:ed) also didn't have a burning desire to add this
> capability.
> 
> b) Vinod commented:
> 
> "What I would like to see the end result is that sdw driver for Intel
> controller here is a simple auxdev device and no additional custom setup
> layer required... which implies that this handling should be moved into
> auxdev or Intel code setting up auxdev..."
> 
> I was unable to figure out what this comment hinted at: the auxbus is
> already handled in the intel_init.c and intel.c files and the auxbus is used
> to model a set of links/managers below the PCI device, not the controller
> itself. There is also no such thing as a simple auxdev device used in the
> kernel today, the base layer is meant to be extended with domain-specific
> structures. There is really no point in creating a simple auxbus device
> without extensions.

<back from vacations>

I would like to see that the init_init.c removed completely, that is my
ask here

This layer was created by me to aid in creating the platform devices.
Also the mistake was not to use platform resources and instead pass a
custom structure for resources (device iomem address, irq etc)

I would like to see is the PCI/SOF parent driver create the sdw aux
device and that should be all needed to be done. The aux device would be
probed by sdw driver. No custom resource structs for resources please.

If that is not possible, I would like to understand technical details of
why that would be that case. If required necessary changes should be
made to aux bus to handle and not have sequencing issue which you had
trouble with platform approach.

Thanks
-- 
~Vinod
