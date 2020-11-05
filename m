Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280A2A8422
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:57:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F461689;
	Thu,  5 Nov 2020 17:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F461689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604595474;
	bh=rveaLrZ2VekMaBIfhcAvnGUg2fcFO3veOvwCKc6KlV8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KSRe/AQ6Q1hkUPvIua8YGIKXZZUEQ8Unmu0lNnWty+OBioZ3ZNBEjHtXrLeqe97mO
	 7hKhiVq8BI4aTmdzmSS9UqLVyjuoFzE/Q3PpReEH/Z6JRGhm6DSduNgLsiD7+aXheH
	 kRhNfmyf3nDMxZc0xwVLnkiSo4cuPcAj6blpxyi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A47F80245;
	Thu,  5 Nov 2020 17:56:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91A1EF80162; Thu,  5 Nov 2020 17:56:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B2E8F800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B2E8F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p0zlCIJS"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A773C2073A;
 Thu,  5 Nov 2020 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604595375;
 bh=rveaLrZ2VekMaBIfhcAvnGUg2fcFO3veOvwCKc6KlV8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0zlCIJSZLU+hIGO/1OT9CsKyGQRT9xRqtuEOEJYahXBjO2R63qCOEBzaoC2jvC/W
 b3CyZRYfIxq8nHLYW+R8WfeBMZfDYBVEuMJK7rNNLj7g5UvHMQPmTC8sRuIQAKq6bJ
 KIIuiYd6H/ssEmRFS4YipJuNXx5/cC0UxgvuXAYQ=
Date: Thu, 5 Nov 2020 17:57:01 +0100
From: gregkh <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH mlx5-next v1 06/11] vdpa/mlx5: Connect mlx5_vdpa to
 auxiliary bus
Message-ID: <20201105165701.GA1243785@kroah.com>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-7-leon@kernel.org>
 <20201103154525.GO36674@ziepe.ca>
 <CAPcyv4jP9nFAGdvB7agg3x7Y7moHGcxLd5=f5=5CXnJRUf3n9w@mail.gmail.com>
 <20201105073302.GA3415673@kroah.com>
 <20201105164738.GD36674@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105164738.GD36674@ziepe.ca>
Cc: alsa-devel@alsa-project.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Takashi Iwai <tiwai@suse.de>, Jason Wang <jasowang@redhat.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Doug Ledford <dledford@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, "Patil, Kiran" <kiran.patil@intel.com>,
 Mark Brown <broonie@kernel.org>, Parav Pandit <parav@nvidia.com>,
 David M Ertman <david.m.ertman@intel.com>, Roi Dayan <roid@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
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

On Thu, Nov 05, 2020 at 12:47:38PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 08:33:02AM +0100, gregkh wrote:
> > > Were there any additional changes you wanted to see happen? I'll go
> > > give the final set another once over, but David has been diligently
> > > fixing up all the declared major issues so I expect to find at most
> > > minor incremental fixups.
> > 
> > This is in my to-review pile, along with a load of other stuff at the
> > moment:
> > 	$ ~/bin/mdfrm -c ~/mail/todo/
> > 	1709 messages in /home/gregkh/mail/todo/
> > 
> > So give me a chance.  There is no rush on my side for this given the
> > huge delays that have happened here on the authorship side many times in
> > the past :)
> 
> On the other hand Leon and his team did invest alot of time and
> effort, very quickly, to build and QA this large mlx5 series here to
> give a better/second example as you requested only a few weeks ago.

Leon and his team have done a great job, and I never said otherwise.

greg k-h
