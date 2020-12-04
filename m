Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719F2CE69B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 04:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A40E116FD;
	Fri,  4 Dec 2020 04:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A40E116FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607053135;
	bh=/xZsX3A5SvCiLCNbFgQX//74obNgxZNkjOCWcZ1SdnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ad4zXxNHWxWUUQez6yXNg/6gxyG9o/CJwQD8u4ZABojSw4gDbxXBaYzlF44qt43FG
	 C+EQca18iF5gHKPxCDI3egCt2CD9SX4JeMaR15+V88N6R6vAYVH3+3D1H/viqpMyuS
	 bWBEWGm/Z2SK9f9wp4/mLdvNO2885r5G+xswUAOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6345F8049C;
	Fri,  4 Dec 2020 04:37:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6089F80278; Fri,  4 Dec 2020 04:37:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 500C7F800E2
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 04:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500C7F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="h6lJHRIw"
Received: by mail-ed1-x541.google.com with SMTP id d18so4378361edt.7
 for <alsa-devel@alsa-project.org>; Thu, 03 Dec 2020 19:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7q4vopEbHCewQ+qUf3Z4+KiH74FFIhB3Uhp8jwbeRs=;
 b=h6lJHRIwp2kfx3tSOHVwfn7ZLGG5UVFD8MKBKp7vUUe6bQP9aSUb2KT6tfLpyXgiUe
 uO6sK9Zr6nxXuBdVBLOzPIc/ctgN7f8WXi3+IqA+i/l4PUf34JFoUG1MgvdHxb83NkfG
 992rzEGAkOKMrn7Zk5BdbZcsSSV0ZoYaMre+DOnrBNpMGrfyzstujfH3254xsLfR4B7o
 NVQrrDevjQHrIX4aoLuzXQrXRgPxWOtr4VWhBU4Frntmabksc0kVn0+NFWDqUXvoLt3v
 2+74tWrg/Ib+xO/tsR5jl9suTNwsI9fqZibS8HovKAsGg7JFCBbQoUNrxcvtwNjJvDg9
 SazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7q4vopEbHCewQ+qUf3Z4+KiH74FFIhB3Uhp8jwbeRs=;
 b=hTAvhOiGgElWfcDeZ+TUOozXinIAughQakZ+CFs9nj90/IZyfoajgGmnVcEfWmiFeA
 Ta9l4PCjcZWmVb5yrd/ud3kQrA2VPHCal6bDVi5oYaDIDLFDbBrGwCIaz7C1wFYJI6ja
 j+Xcq1JykmHEIEP98DdWzOQ7I5FE28u0yBjCsnDXEiuTaDor3P+kipiT1BaAZzFFRolN
 hvgxeEyTEPuYUofbXr0VCx9Sz1AhMEqL43cN5ylxhRM3EPUo0+QNtc4+jfj9kXgIo0Yd
 kl2KKyrXq0PBxSP1CRxdZMnfV4qEimFlcZ09cEVeAx0C4gJAzBNZjPTX+uq5xNMEOuWi
 55fQ==
X-Gm-Message-State: AOAM5303z8bonLfLIdZToND6sbujT0ihVrW2sesogSFaLBUFIeKoJEaG
 ndOX5vfnKUoTP0AZqmO9Myh3OWUxk8O/O4jxOa+ibw==
X-Google-Smtp-Source: ABdhPJypzF/zxqPx2JjCtFUbZXdp8DAB6CgTOr6BBeH65H/vxbjhDErMw8S4HuqSooRtOzznLRIL1KkQvJFsw0MnHHY=
X-Received: by 2002:a50:8a44:: with SMTP id i62mr2924285edi.97.1607053030239; 
 Thu, 03 Dec 2020 19:37:10 -0800 (PST)
MIME-Version: 1.0
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8j+8DRrPeXBaTA7@kroah.com> <20201204023357.GA1337723@nvidia.com>
In-Reply-To: <20201204023357.GA1337723@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 3 Dec 2020 19:37:06 -0800
Message-ID: <CAPcyv4iDr9RUK_F52mNuO=+ZuFtD4PTpB5QzKA4fnF_RaRoR1w@mail.gmail.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Dave Ertman <david.m.ertman@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Netdev <netdev@vger.kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Parav Pandit <parav@mellanox.com>
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

On Thu, Dec 3, 2020 at 6:34 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Thu, Dec 03, 2020 at 04:06:24PM +0100, Greg KH wrote:
>
> > > ...for all the independent drivers to have a common commit baseline. It
> > > is not there yet pending Greg's Ack.
> >
> > I have been trying to carve out some time to review this.  At my initial
> > glance, I still have objections, so please, give me a few more days to
> > get this done...
>
> There are still several more days till the merge window, but I am
> going to ask Leon to get the mlx5 series, and this version of the
> auxbus patch it depends on, into linux-next with the intention to
> forward it to Linus if there are no substantive comments.
>
> Regardless of fault or reason this whole 1.5 year odyssey seems to have
> brought misery to everyone involved and it really is time to move on.
>
> Leon and his team did a good deed 6 weeks ago to quickly turn around
> and build another user example. For their efforts they have been
> rewarded with major merge conflicts and alot of delayed work due to
> the invasive nature of the mlx5 changes. To continue to push this out
> is disrespectful to him and his team's efforts.
>
> A major part of my time as RDMA maintainer has been to bring things
> away from vendor trees and into a common opensource community.  Intel
> shipping a large out of tree RDMA driver and abandoning their intree
> driver is really harmful. This auxbus is a substantial blocker to them
> normalizing their operations, thus I view it as important to
> resolve. Even after this it is going to take a long time and alot of
> effort to review their new RDMA driver.

When you have 3 independent driver teams (mlx5, i40e, sof) across 2
companies (NVIDIA and Intel), and multiple subsystem maintainers with
a positive track record of upstream engagement all agreeing on a piece
of infrastructure, I struggle to imagine a stronger case for merging.
I did get word of a fixup needed in the shutdown code, I'll get that
folded. Then, barring a concrete objection, I'll look to publish a
commit that others can pull in to start building soak time in -next
this time tomorrow.
