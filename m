Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C022850C8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 19:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623EB1711;
	Tue,  6 Oct 2020 19:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623EB1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602005323;
	bh=F0HQbTaTERZyH2PFQJHENFBsyRZFyRlCovByBrhvGhg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DOx3iOb5fa8o1jGX5l69W6nzMRUksmWmeGkGjrbm+otmHp34FSDo7nDCd7a/tsLfz
	 70QnUj1vnS6kUElN3XbZ0rNj7jzRifJ5kosZhPY1+6M0hwQsXD+bosktrs1bUmYrpd
	 ERUe+scZYhuL1UP9quzWbRgacdHP0755WI4lSJPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8759F80127;
	Tue,  6 Oct 2020 19:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF41F80129; Tue,  6 Oct 2020 19:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D690FF8012A
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 19:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D690FF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1tgYY+e9"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30CFD20674;
 Tue,  6 Oct 2020 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602005214;
 bh=F0HQbTaTERZyH2PFQJHENFBsyRZFyRlCovByBrhvGhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1tgYY+e97jByt5c9GwVMffHxWfneSxaysC3hOM/TsjT7KlfG00ssd6BFZUDSSEGZw
 r5Z5SW6jnduPzBDwAuoPRLRqlLCmEGWPJ9gQkJXWbR2ZhITmpCN6e5D2llB1CVllRN
 q46uU5CoZBAy1NVHUT7r3KSmiz2LO+uCHBVzLuWw=
Date: Tue, 6 Oct 2020 20:26:50 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
Message-ID: <20201006172650.GO1874917@unreal>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
 <BY5PR12MB43228E8DAA0B56BCF43AF3EFDC0D0@BY5PR12MB4322.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR12MB43228E8DAA0B56BCF43AF3EFDC0D0@BY5PR12MB4322.namprd12.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shiraz.saleem@intel.com" <shiraz.saleem@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kiran.patil@intel.com" <kiran.patil@intel.com>
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

On Tue, Oct 06, 2020 at 05:09:09PM +0000, Parav Pandit wrote:
>
> > From: Leon Romanovsky <leon@kernel.org>
> > Sent: Tuesday, October 6, 2020 10:33 PM
> >
> > On Tue, Oct 06, 2020 at 10:18:07AM -0500, Pierre-Louis Bossart wrote:
> > > Thanks for the review Leon.
> > >
> > > > > Add support for the Ancillary Bus, ancillary_device and ancillary_driver.
> > > > > It enables drivers to create an ancillary_device and bind an
> > > > > ancillary_driver to it.
> > > >
> > > > I was under impression that this name is going to be changed.
> > >
> > > It's part of the opens stated in the cover letter.
> >
> > ok, so what are the variants?
> > system bus (sysbus), sbsystem bus (subbus), crossbus ?
> Since the intended use of this bus is to
> (a) create sub devices that represent 'functional separation' and
> (b) second use case for subfunctions from a pci device,
>
> I proposed below names in v1 of this patchset.
>
> (a) subdev_bus

It sounds good, just can we avoid "_" in the name and call it subdev?

> (b) subfunction_bus
