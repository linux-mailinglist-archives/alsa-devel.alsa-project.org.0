Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1362B3CD
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 08:12:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0023B1671;
	Wed, 16 Nov 2022 08:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0023B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668582742;
	bh=zJUKF6B5wFDQpbk6RK2X5F8SYhcjLUE/tEWHlFSY8dU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6WiMeUnDp64/2Riypxa4VStDI/uSu9O10aOFEz4KMdWDBz5LLAqgBO8p6oW/vQGw
	 fO+9HqBXBBDVDTAZiu3Rk7hXL0DsiNr6OjWCMaYcc7I5UjzhhrxDm3ka6kY8+gycb0
	 MjHtfxzsraPKUrxCMP4t7+Y61qXxs4MzN9gauooE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 918E6F80163;
	Wed, 16 Nov 2022 08:11:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4C6EF80169; Wed, 16 Nov 2022 08:11:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 504CCF800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 08:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504CCF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BMV2L/XV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A2E16185F;
 Wed, 16 Nov 2022 07:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAD1C433D6;
 Wed, 16 Nov 2022 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668582674;
 bh=zJUKF6B5wFDQpbk6RK2X5F8SYhcjLUE/tEWHlFSY8dU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BMV2L/XVq3E4FzYxRA5sBJZqAKYUQbu9BdO1dXl0c8ZCElt4lSimYTB4GO7Z24qjm
 kI0FzTBs+IIAUJeAW6mROyWAOFLoPpc1EIMgx5OGMPTyVsTC4USEQkNBgtLwdrFdaY
 sxe718Vn7b8WWwyaxHU5mxH0JZFk/KczdyXRdpq/0ptjUJoPryOmoT5HXcz76B5iIS
 +yzicr64Ss0txe2dkw+Ikpts9er6Je7q68fj/Yijarx/ht/FBhpzVbeNGbZeRspYFf
 RG6kEQESaVupz3EzjRbND7MDxqS/BBnsO4R/4VvV5O+ihHPe1O4qjcLA4IhhRN74HA
 s4kd5LzGpAgew==
Date: Wed, 16 Nov 2022 09:11:09 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/7] dma-mapping: reject __GFP_COMP in dma_alloc_attrs
Message-ID: <Y3SNDR7KMJOkTREK@unreal>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-8-hch@lst.de> <Y3H4RobK/pmDd3xG@unreal>
 <20221116061106.GA19118@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116061106.GA19118@lst.de>
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, Alexandra Winter <wintera@linux.ibm.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 iommu@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Wed, Nov 16, 2022 at 07:11:06AM +0100, Christoph Hellwig wrote:
> On Mon, Nov 14, 2022 at 10:11:50AM +0200, Leon Romanovsky wrote:
> > In RDMA patches, you wrote that GFP_USER is not legal flag either. So it
> > is better to WARN here for everything that is not allowed.
> 
> So __GFP_COMP is actually problematic and changes behavior, and I plan
> to lift an optimization from the arm code to the generic one that
> only rounds up allocations to the next page size instead of the next
> power of two, so I need this check now.  Other flags including
> GFP_USER are pretty bogus to, but I actually need to do a full audit
> before rejecting them, which I've only done for GFP_COMP so far.

ok, let's do it later.

Thanks
