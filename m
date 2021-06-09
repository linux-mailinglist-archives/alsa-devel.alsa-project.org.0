Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940BB3A1D6A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 21:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1678516DE;
	Wed,  9 Jun 2021 21:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1678516DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623265454;
	bh=01ekqEr7/oKQrK293xZwJEbpRjqwL9EMuSKoKq+9fCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLQLl7B9y04rYw33f3zUXDEsrXstLwJ0ozcTavLHjjsnXuEoRCn+RGjU+PehrxlXA
	 o5TKqa74C+DgmIlyg+qOMaRzbKMqpMS40FstWPoZ9l09VWIzXZzDNYDbLiLbFS2tkd
	 o7jSgfmave1izpaZNlriFKmyvS6EPlaeeYiO3WHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72693F800F4;
	Wed,  9 Jun 2021 21:02:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D02F8026C; Wed,  9 Jun 2021 21:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C57EF800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 21:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C57EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="ANyQsTqW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F60E613CA;
 Wed,  9 Jun 2021 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623265353;
 bh=01ekqEr7/oKQrK293xZwJEbpRjqwL9EMuSKoKq+9fCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANyQsTqW9jkL7tJ5o8WN2TFDaZ7uI8G/1l2wIG4s4Rtdnj0trnOX5+3wq/RyXoubu
 PU67pN2h+3F79jrO/G7ONF/u903jmIt1/EXgCghb6Wc/RLAynSieww3/Cu1j5JhVTs
 2ewQj6d5zLtBJpgDYQkWJxcQLGcLoEw1XBIb3Nic=
Date: Wed, 9 Jun 2021 21:02:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YMEQRlviWBJA0Rwd@kroah.com>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Vinod Koul <vkoul@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Dave Ertman <david.m.ertman@intel.com>, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On Wed, Jun 09, 2021 at 09:44:08AM -0500, Pierre-Louis Bossart wrote:
> The model is exactly the same as what we have today with the platform
> devices. We did not add ANY new fields or information, what is passed in
> that structure is exactly the same as what we do upstream today with the
> platform devices.
> 
> To make my point, here is the structure in intel.h as of v5.13-rc1
> 
> struct sdw_intel_link_res {
> 	struct platform_device *pdev;
> 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
> 	void __iomem *registers;
> 	void __iomem *shim;
> 	void __iomem *alh;
> 	int irq;
> 	const struct sdw_intel_ops *ops;
> 	struct device *dev;
> 	struct mutex *shim_lock; /* protect shared registers */
> 	u32 *shim_mask;
> 	u32 clock_stop_quirks;
> 	u32 link_mask;
> 	struct sdw_cdns *cdns;
> 	struct list_head list;
> };
> 
> and here's what we suggested in this patch:
> 
> struct sdw_intel_link_res {
> 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
> 	void __iomem *registers;
> 	void __iomem *shim;
> 	void __iomem *alh;
> 	int irq;
> 	const struct sdw_intel_ops *ops;
> 	struct device *dev;
> 	struct mutex *shim_lock; /* protect shared registers */
> 	u32 *shim_mask;
> 	u32 clock_stop_quirks;
> 	u32 link_mask;
> 	struct sdw_cdns *cdns;
> 	struct list_head list;
> };
> 
> You will notice that we removed the platform_device *pdev, but embedded this
> structure into a larger one to make use of container_of()
> 
> struct sdw_intel_link_dev {
> 	struct auxiliary_device auxdev;
> 	struct sdw_intel_link_res link_res;
> };
> 
> That's it. We did not change anything else, all the other fields are
> identical. We are only changing the TYPE of device and the interfaces for
> probe/remove but using the same information and the same device hierarchy.

And this is the correct thing to do, you have done it properly here,
nice work.

greg k-h
