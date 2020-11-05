Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B72A91B9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:46:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C874C1673;
	Fri,  6 Nov 2020 09:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C874C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652386;
	bh=EOR9QDti6PjBdGlGEXLUW3DrtDi/OSl4ifFUzgwBtf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ntw6ySW24IizTh2EunNKeYP5Krnxg7zmxnnY+ZgBc5RjvB+0CvrRYXlS/b6EJY7Dc
	 LfWCpSseoINZF8ITC64NBKEYYFzgdVJ8QULtsgNiCTOsydHFiejTj7Q+Ww9dkjEs1F
	 ktjoMmXdxiWZtC3d35jdg+nsfwOjhO+dpWSwv0i0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6742BF804D2;
	Fri,  6 Nov 2020 09:43:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72728F80171; Thu,  5 Nov 2020 10:47:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27ADEF800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 10:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27ADEF800EC
Received: from localhost (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A6012080D;
 Thu,  5 Nov 2020 09:47:22 +0000 (UTC)
Date: Thu, 5 Nov 2020 11:47:19 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
Message-ID: <20201105094719.GQ5429@unreal>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:15 +0100
Cc: alsa-devel@alsa-project.org, Parav Pandit <parav@mellanox.com>,
 Greg KH <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
 Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
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

On Thu, Nov 05, 2020 at 01:19:09AM -0800, Dan Williams wrote:
> Some doc fixups, and minor code feedback. Otherwise looks good to me.
>
> On Thu, Oct 22, 2020 at 5:35 PM Dave Ertman <david.m.ertman@intel.com> wrote:
> >

<...>

> >
> > +config AUXILIARY_BUS
> > +       bool
>
> tristate? Unless you need non-exported symbols, might as well let this
> be a module.

I asked it to be "bool", because bus as a module is an invitation for
a disaster. For example if I compile-in mlx5 which is based on this bus,
and won't add auxiliary_bus as a module to initramfs, the system won't boot.

<...>

>
> Per above SPDX is v2 only, so...

Isn't it default for the Linux kernel?

>
> MODULE_LICENSE("GPL v2");

Thanks
