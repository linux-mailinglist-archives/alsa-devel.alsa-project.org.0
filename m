Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D02DE7F0
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 18:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BAC117D0;
	Fri, 18 Dec 2020 18:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BAC117D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608311846;
	bh=T/kNWN51pLhBnpdDJ9y7r2j4kibYMrvL9roUbf9uJWw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/0azYQJITzKXQs30h03NgfwuNJOcay/W3HFOOKmevqgrZu9+AVHuBi/IduvIUMMS
	 8CfDQnSXHJAdJXLAX3kQDe3GkwI5ViRftJ/YWHogL5VrdpZCtPITg568aBcbphcV4U
	 QgHdVS5JsibTNJHL3hdhgoLBUa2pSkNQJdzU0Vi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4712F80240;
	Fri, 18 Dec 2020 18:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77E1F801F7; Fri, 18 Dec 2020 18:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B06CF80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 18:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B06CF80103
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 780871BF207;
 Fri, 18 Dec 2020 17:15:34 +0000 (UTC)
Date: Fri, 18 Dec 2020 18:15:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218171534.GF3143569@piout.net>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com> <20201218131709.GA5333@sirena.org.uk>
 <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk>
 <20201218162817.GX552508@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218162817.GX552508@nvidia.com>
Cc: alsa-devel@alsa-project.org, lee.jones@linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, David Miller <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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

On 18/12/2020 12:28:17-0400, Jason Gunthorpe wrote:
> On Fri, Dec 18, 2020 at 03:52:04PM +0000, Mark Brown wrote:
> > On Fri, Dec 18, 2020 at 10:08:54AM -0400, Jason Gunthorpe wrote:
> > > On Fri, Dec 18, 2020 at 01:17:09PM +0000, Mark Brown wrote:
> > 
> > > > As previously discussed this will need the auxilliary bus extending to
> > > > support at least interrupts and possibly also general resources.
> > 
> > > I thought the recent LWN article summed it up nicely, auxillary bus is
> > > for gluing to subsystems together using a driver specific software API
> > > to connect to the HW, MFD is for splitting a physical HW into disjoint
> > > regions of HW.
> > 
> > This conflicts with the statements from Greg about not using the
> > platform bus for things that aren't memory mapped or "direct firmware",
> > a large proportion of MFD subfunctions are neither at least in so far as
> > I can understand what direct firmware means.
> 
> I assume MFD will keep existing and it will somehow stop using
> platform device for the children it builds.
> 
> That doesn't mean MFD must use aux device, so I don't see what you
> mean by conflicts?
> 
> If someone has a PCI device and they want to split it up, they should
> choose between aux device and MFD (assuming MFD gets fixed, as Greg
> has basically blanket NAK'd adding more of them to MFD as is)
> 

I have an SoC with for example, a designware SPI controller (handled by
drivers/spi/spi-dw-mmio.c), a designware I2C controller (handled by
drivers/i2c/busses/i2c-designware-platdrv.c).
So, those are MMIO and described using device tree. On this particular
SoC, I can disable the CPU and connect it to another SoC using PCIe. In
that case it will expose one BAR, with all the HW IPs.

The question here is why would I use something different from platform
devices to register the SPI and I2C controllers? It seems that by using
auxiliary devices, I would have to reinvent parsing device property and
children/clients description. This isn't great from a code reuse
perspective.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
