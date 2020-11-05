Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D62A91C0
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:47:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8081416A0;
	Fri,  6 Nov 2020 09:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8081416A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652445;
	bh=OhObnJUaGdEshEB1bQEN9zZtB/TMwsY0esFitMXBrvc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+P2QwDQTstVjb7K1Ol7YvawSFhjZPrlT8ubdj/fqZzNudZaTihWeH6GIBIBm1/0x
	 SEbGPYJhCY3fW1W+lGahFsDux5ObWBaJJs3zZv6Lg3A17qVg1/vDItXEBxgoPvxh5a
	 zAK8rjdXguRKZw6ju0rfh9U58XDBtpPnxMCHXDmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06409F804B3;
	Fri,  6 Nov 2020 09:43:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 180E3F80171; Thu,  5 Nov 2020 20:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94DD6F800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 20:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94DD6F800BA
Received: from localhost (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C91620728;
 Thu,  5 Nov 2020 19:35:14 +0000 (UTC)
Date: Thu, 5 Nov 2020 21:35:11 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
Message-ID: <20201105193511.GB5475@unreal>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:15 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Parav Pandit <parav@mellanox.com>, Takashi Iwai <tiwai@suse.de>,
 Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>,
 "Saleem, Shiraz" <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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

On Thu, Nov 05, 2020 at 07:27:56PM +0000, Ertman, David M wrote:
> > -----Original Message-----
> > From: Dan Williams <dan.j.williams@intel.com>
> > Sent: Thursday, November 5, 2020 1:19 AM
> > To: Ertman, David M <david.m.ertman@intel.com>
> > Cc: alsa-devel@alsa-project.org; Takashi Iwai <tiwai@suse.de>; Mark Brown
> > <broonie@kernel.org>; linux-rdma <linux-rdma@vger.kernel.org>; Jason
> > Gunthorpe <jgg@nvidia.com>; Doug Ledford <dledford@redhat.com>;
> > Netdev <netdev@vger.kernel.org>; David Miller <davem@davemloft.net>;
> > Jakub Kicinski <kuba@kernel.org>; Greg KH <gregkh@linuxfoundation.org>;
> > Ranjani Sridharan <ranjani.sridharan@linux.intel.com>; Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com>; Fred Oh <fred.oh@linux.intel.com>;
> > Parav Pandit <parav@mellanox.com>; Saleem, Shiraz
> > <shiraz.saleem@intel.com>; Patil, Kiran <kiran.patil@intel.com>; Linux
> > Kernel Mailing List <linux-kernel@vger.kernel.org>; Leon Romanovsky
> > <leonro@nvidia.com>
> > Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
> >
> > Some doc fixups, and minor code feedback. Otherwise looks good to me.
> >
> > On Thu, Oct 22, 2020 at 5:35 PM Dave Ertman <david.m.ertman@intel.com>
> > wrote:

<...>

>
> Again, thanks for the review Dan.  Changes will be in next release (v4) once I give
> stake-holders a little time to respond.

Everything here can go as a Fixes, the review comments are valuable and need
to be fixed, but they don't change anything dramatically that prevent from
merging v3.

Thanks

>
> -DaveE
