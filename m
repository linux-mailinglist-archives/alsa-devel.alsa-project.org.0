Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389827FF99
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 14:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CAE3185D;
	Thu,  1 Oct 2020 14:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CAE3185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601557036;
	bh=hf7ZPQ0GUWw3TaAI/K4XxVknSEswJ84dStaB4njHgS0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0JreMSeGmduwBiD6aZ66u5pPGDGFc9uxLtDbZXKLvOKmdBPzispY2FApTXKImfij
	 VHtFNayN8DgbsHfklpHJUZ1EwZjjrHRZImULZp6quTTw9dTy9ChmGvsHxE0OtAewXs
	 BERjfNb6jr2cW1Ab/pVANNkvkB3YWy7QIzbcdbLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F28DF8020C;
	Thu,  1 Oct 2020 14:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90B0BF801F5; Thu,  1 Oct 2020 14:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B8CBF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 14:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B8CBF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DNHrlhA8"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B053E2075F;
 Thu,  1 Oct 2020 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601556925;
 bh=hf7ZPQ0GUWw3TaAI/K4XxVknSEswJ84dStaB4njHgS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNHrlhA8yBopH9PXM1CokM0OH9jWG95BUdgs/9wpYBhwA4ASEgHCx2QhV4AYHQiQW
 IjM3DIB2gXMWqi8og/mS1ae4siFJv2sxYP8c6Tz1MVSVe+3rW9lcOyQ8iS4IZuQBQg
 J1cFgZRwuOyBnqNiDfsj3LlRskAcf75Ae06TcnmI=
Date: Thu, 1 Oct 2020 14:55:26 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001125526.GA2378679@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <8f34ae733db0447d93736f4f3f7524f9@intel.com>
 <20201001105925.GA1939744@kroah.com>
 <20201001124900.GA816047@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001124900.GA816047@nvidia.com>
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

On Thu, Oct 01, 2020 at 09:49:00AM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 12:59:25PM +0200, gregkh@linuxfoundation.org wrote:
> > We don't add infrastructure without users.  And the normal rule of thumb
> > of "if we have 3 users, then it is a semi-sane api" really applies here.
> 
> Based on recent discussions I'm expecting:
>  - Intel SOF
>  - New Intel RDMA driver
>  - mlx5 RDMA driver conversion
>  - mlx4 RDMA driver conversion
>  - mlx5 subdevice feature for netdev
>  - Intel IDXD vfio-mdev
>  - Habana Labs Gaudi netdev driver
> 
> Will use this in the short term.
> 
> I would like, but don't expect too see, the other RDMA RoCE drivers
> converted - cxgb3/4, i40iw, hns, ocrdma, and qedr. It solves an
> annoying module loading problem we have.
> 
> We've seen the New Intel RDMA driver many months ago, if patch 1 is
> going to stay the same we should post some of the mlx items next week.
> 
> It is hard to co-ordinate all of this already, having some general
> agreement that there is nothing fundamentally objectionable about
> ancillary bus will help alot.

I agree, but with just one user (in a very odd way I do have to say,
more on that on the review of that specific patch), it's hard to judge
if this is useful are not, right?

So, what happened to at least the Intel SOF driver usage?  That was the
original user of this bus (before it was renamed), surely that patchset
should be floating around somewhere in Intel, right?

thanks,

greg k-h
