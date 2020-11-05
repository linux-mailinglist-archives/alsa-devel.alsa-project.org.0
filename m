Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA522A87FE
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 21:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D322167E;
	Thu,  5 Nov 2020 21:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D322167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604607789;
	bh=iisDYmnCqmymIp9jDmc3emaxJKy7G18dQ4jz7l5yNf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SpV95qtnaPpcbaoJUD85uB5KEdNl1xOihYPx4GiKU3ZtOkggiu9yZCQEAsUpHIP69
	 5G9VBVKEw71ChBPb+re7V794+yqfISLlxnA8joTtvRIk/lMZiu033W1hK1gwSFB+Z7
	 +iXZgEn95Q8+0b3ImaW7YXEpFmO2yK63qRSuEIk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B04F80245;
	Thu,  5 Nov 2020 21:21:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80CC7F80150; Thu,  5 Nov 2020 21:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20E89F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 21:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E89F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2P75OZLU"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45C11206A1;
 Thu,  5 Nov 2020 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604607687;
 bh=iisDYmnCqmymIp9jDmc3emaxJKy7G18dQ4jz7l5yNf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2P75OZLUStWL1aGyyd/Da81aZljbX9qzXGnTnNGkvCtGQl1yRW5hjpyqSk+W8F11h
 7WAiJuz8nKkh8LipvSMy6M7FDwqfwv86DDpoXmgzTxvOzFOnNCeR9UNmWl0Wx36Que
 DvkEz5vw/fpxwDyRRfIqH1A7uT2TvCyv1zB1yLOA=
Date: Thu, 5 Nov 2020 21:22:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
Message-ID: <20201105202214.GA1339091@kroah.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <20201105094719.GQ5429@unreal>
 <CAPcyv4hmBhkFjSA2Q_p=Ss40CLFs86N7FugJOpq=sZ-NigoSRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hmBhkFjSA2Q_p=Ss40CLFs86N7FugJOpq=sZ-NigoSRw@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, Parav Pandit <parav@mellanox.com>,
 Takashi Iwai <tiwai@suse.de>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>,
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

On Thu, Nov 05, 2020 at 09:12:51AM -0800, Dan Williams wrote:
> > >
> > > Per above SPDX is v2 only, so...
> >
> > Isn't it default for the Linux kernel?
> 
> SPDX eliminated the need to guess a default, and MODULE_LICENSE("GPL")
> implies the "or later" language. The only default assumption is that
> the license is GPL v2 compatible, those possibilities are myriad, but
> v2-only is the first preference.

No, MODULE_LICENSE("GPL") does not imply "or later" at all.  Please see
include/linux/module.h, it means "GPL version 2".

thanks,

greg k-h
