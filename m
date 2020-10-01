Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B3280124
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 16:19:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF3318DB;
	Thu,  1 Oct 2020 16:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF3318DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601561947;
	bh=JAGlHOFO7+2R6En2boXVub861S2FG+dWIjBtE7Q0BGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuJVV4YY3dTaBQ5H6xJq1+BvZWUYQXYAZghLLtOrb+KtD7tOHovgEETOF68C/4J8j
	 gRsuP3KHjhiLpIOXcsmkrH/KxVTXLW9HXMRNJonFZyam15qxCJ/uCp0bO3sSJgSYFd
	 Q4QlLlJGJMFUlbOfa8JX3LVhCpexB/TTNbDY3C1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F11F801F5;
	Thu,  1 Oct 2020 16:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05264F801DB; Thu,  1 Oct 2020 16:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D307F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 16:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D307F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CGy6RaFS"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 432B320796;
 Thu,  1 Oct 2020 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601561832;
 bh=JAGlHOFO7+2R6En2boXVub861S2FG+dWIjBtE7Q0BGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CGy6RaFS6iXHCNKrEkBi40egaziAq6trLQXtZtmTXXrQrlzay9WRlyddoX47jQpYU
 /R9N36yaOro3ztr4tYoUkxxcN66g4QSz6p2gGoLTNEKEx0bp5PJ2DjkWn4ZOG3i78r
 o5e4iYtx8VsX2FHgXK171iuqrIxHuSuWiXM5Yq5E=
Date: Thu, 1 Oct 2020 16:17:13 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001141713.GA2393636@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <8f34ae733db0447d93736f4f3f7524f9@intel.com>
 <20201001105925.GA1939744@kroah.com>
 <20201001124900.GA816047@nvidia.com>
 <20201001125526.GA2378679@kroah.com>
 <20201001132659.GA1107577@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001132659.GA1107577@nvidia.com>
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "Ertman,
 David M" <david.m.ertman@intel.com>
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

On Thu, Oct 01, 2020 at 10:26:59AM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 02:55:26PM +0200, gregkh@linuxfoundation.org wrote:
> > So, what happened to at least the Intel SOF driver usage?  That was the
> > original user of this bus (before it was renamed), surely that patchset
> > should be floating around somewhere in Intel, right?
> 
> The first user was irdma (the New Intel RDMA driver):
> 
> https://lore.kernel.org/linux-rdma/20200520070415.3392210-1-jeffrey.t.kirsher@intel.com/
> 
> (look at patch 1, search for virtbus)

My apologies, you are correct, it's been so long "in flight" that I
can't remember...

> I kicked it off when I said I was sick of RDMA RoCE drivers
> re-implementing the driver core register/unregister and module
> management to share a PCI device between netdev and RDMA.
> 
> This has been going on for almost two years now. I did not think it
> would be so hard.

It really isn't, I have no idea why it has taken so long.

For a while I thought it was people doing the traditional, "if I submit
something so bad, it will make the maintainer take pity and just do it
correctly themselves" method of kernel development, and if so, it failed
horribly.  Now I just have no idea why it has taken so long, sad...

greg k-h
