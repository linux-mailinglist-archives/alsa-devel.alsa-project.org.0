Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687F3A4139
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 13:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1CC193E;
	Fri, 11 Jun 2021 13:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1CC193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623410911;
	bh=QXbhpoKZRkqCV8d85AMb2D87wCsbusdzmNcunuEV1eo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxB9q8Zis29rg0gwfby1aKls9NSSHErBNWVJ7FdIYQXdASr5oQNQ4Ql3zWIYwZ9cI
	 7d90nyU1gU+lYj/ikVCiw53juugaRJPucY6muIxLDzVQdnjHOWKZWPNnQ7bZ2B5/PC
	 rGAZGK2hE70xnYNXoxoCnScXUk8CqxGzGOsAyFPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09297F800FC;
	Fri, 11 Jun 2021 13:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE1ADF8026C; Fri, 11 Jun 2021 13:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58512F800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 13:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58512F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mHNHZtdk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 272D0610E9;
 Fri, 11 Jun 2021 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623410816;
 bh=QXbhpoKZRkqCV8d85AMb2D87wCsbusdzmNcunuEV1eo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHNHZtdkpxh+sAIplb3d0tqtmW4gvz992iETR2j7p8QZBoUNBitsS2H7L1nbPOTIH
 +8CNq1F4ar3EFOsdILg8sQGmuYicMx0LKInecTpzYxnGkdPKMGEALsUWAiled/e5P0
 xYB4xE28l65g7gBJcouALiu9EJ/tOlnH95uYMzGOr+e5kquZjTuMhqJ4tJb7lqQqpr
 4A+LN/NVEFQSrt2zwQDxp2DiFPxozEdq6ZlAiTYe8RR7JYMF0P3t2bsnnGdRaCa6UE
 PPNqGgUXxC+KHKLIjc7/KR9uOA3rR5poXVAWQvc9oaijApy/1rBzt6c2vCwG6l7MHa
 TFsQwECdugKIA==
Date: Fri, 11 Jun 2021 16:56:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YMNIfHPRcgKLXJ0v@vkoul-mobl>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
 <20210609151022.GF1002214@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609151022.GF1002214@nvidia.com>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hui.wang@canonical.com, bard.liao@intel.com,
 Dave Ertman <david.m.ertman@intel.com>, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
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

On 09-06-21, 12:10, Jason Gunthorpe wrote:
> On Wed, Jun 09, 2021 at 09:44:08AM -0500, Pierre-Louis Bossart wrote:
> 
> > The consensus for the auxiliary_device model was hard to reach, and the
> > agreement was to align on a minimal model. If you disagree with the
> > directions, you will have to convince Nvidia/Mellanox and Intel networking
> > folks who contributed the solution to do something different.
> 
> The purpose of the aux devices was primarily to bind a *software*
> interface between two parts of the kernel.

Then I dont think this example is valid... This example has a PCI device,
which represents a DSP, HDA controller, DMICs, Soundwire
links... So at least here it is hardware.

> If there is a strong defined HW boundary and no software interface
> then the mfd subsytem may be a better choice.

More I think that might be better choice for this example, but then MFD
is a 'platform device' and Greg already nacked that

> For a software layer I expect to see some 'handle' and then a set of
> APIs to work within that. It is OK if that 'handle' refers to some HW
> resources that the API needs to work, the purpose of this is to
> control HW after all.
> 
> You might help Vinod by explaining what the SW API is here.
> 
> Jason

-- 
~Vinod
