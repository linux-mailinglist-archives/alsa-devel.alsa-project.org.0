Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E83A5C3F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 06:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8721E179E;
	Mon, 14 Jun 2021 06:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8721E179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623645886;
	bh=IvmZ1b1TDZMBnSXVm8/fTN69Cd3Wq1w0/TEjzhTNHeE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCYwFUVhKALDOhzKKZLDpLgQM9kya20rT1l0kCTsw3RLzW0LpW67OMyM4kVPxHIMs
	 GPycLU0yWdf7xV+boffzrbtxXGnzZgG0f5kckZhwLe3pEJOH4FvMoFrWwq68GOxp3c
	 pS/qpMOQHE/R1byfg8SYbjP3jtFFlyFtHxh0BEZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF254F8028B;
	Mon, 14 Jun 2021 06:43:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 819A6F80273; Mon, 14 Jun 2021 06:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA77F8025A
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 06:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA77F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SGHiC0c9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91C04613AD;
 Mon, 14 Jun 2021 04:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623645821;
 bh=IvmZ1b1TDZMBnSXVm8/fTN69Cd3Wq1w0/TEjzhTNHeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGHiC0c9pe1NmkciV35SzWPJ3Mah7tgis/rKoEwBFY8+d2CV8kChZGfa4K6vHe6N9
 lekO9YUMujZPLcNBS1Ijov4tnjHenblB992BITzbbmjj+vfC3YfOm/42WFu+w98eX0
 0UpgnrhGuRL3WICWPb9QhitNZJ/xxBKJ+OwlQMG3QQDYT0w7Sh96kHRBuegj0sHlej
 lRvahn+q7GC/TWOKOXt92qYfDeNjAYcXZXE0Sf3+M/P2sIq8vcDXGUymLXW8C2xyqB
 ocGckpjJOauk+4Hv6PAL+PRGIjZLK9x5KE9x6L6Z8cTvZ4y3fZAijXdub7/XguA1Nq
 KQZY8jweyVVpA==
Date: Mon, 14 Jun 2021 10:13:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YMbeefn6EHIqImQK@vkoul-mobl>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
 <YMNQBpFX9DXcoGAc@vkoul-mobl>
 <be440569-e18b-b079-2795-0af1e6812935@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be440569-e18b-b079-2795-0af1e6812935@linux.intel.com>
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

On 11-06-21, 09:51, Pierre-Louis Bossart wrote:
> Thanks Vinod for your feedback,
> 
> > > If you look at the *existing* code, we don't handle any "resources" with the
> > > platform devices, we use the platform_device_info.data to pass the link
> > > information. It's a void pointer. We do not touch the resource field in the
> > > platform_device_into at all.
> > 
> > Yes that is true I dont disagree on that part. My ask here is to make it
> > better, it can be followed up after this but I would at least like to
> > agree on the direction.
> 
> [...]
> 
> > > That's it. We did not change anything else, all the other fields are
> > > identical. We are only changing the TYPE of device and the interfaces for
> > > probe/remove but using the same information and the same device hierarchy.
> > 
> > The move in itself is okay but I dont think that should be the end goal.
> 
> What we suggested in this patch is only an iso-functionality change. I
> believe from Greg's and your feedback that there is no objection on that
> small step.
> 
> This is not the end-goal indeed. The second step would be to remove the
> intel_init.c file. I fully agree with you Vinod that this can be moved into
> the SOF driver, and we could do this in a follow-up step. We can also
> improve the partition between 'context' used by the child driver and
> information passed by the parent on SHIM registers and bases.
> 
> I think we'd need to agree on the details of the second step, Bard and I can
> work on a proposal, but I don't see a disconnect on the direction to
> simplify the interface. That's the right thing to do.

That is agreeable to me. Looking forward to updates to clean these bits
up

Thanks
-- 
~Vinod
