Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3412BD82
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 13:05:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F40A1771;
	Sat, 28 Dec 2019 13:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F40A1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577534715;
	bh=BjTryzA0xZJSHowyMRmcl9FiC7o29PlEIlATdzgmYWI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4p+ToX1RXkdsXymVzAUxJX9RSdtJi2E9Xlp3tFdAg2Q0NyA1KJ9DbpO9TmyWXljZ
	 IrwIw18CZVi+Z2vAOKNg2F3FyFf2oZR/jMxZjtu8FcE2HBpmH02xvXOWaDeaDGUXKs
	 K9YDpRBchchnVsx7cqQU4XcJQjxxXJroceWGGwt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39141F8014C;
	Sat, 28 Dec 2019 13:03:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CE4F80139; Sat, 28 Dec 2019 13:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88CC2F8011E
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 13:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CC2F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wj4/KAEk"
Received: from localhost (unknown [122.178.200.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2304B20748;
 Sat, 28 Dec 2019 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577534601;
 bh=nAcNpTNwE94ZE6qLrbAe9iLlYcvIuBdnUhjb4+mionA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wj4/KAEksEWCS6TdxoU68rLxGYpm0PUGUqWQjGsxnnDr2UqZvQmQ2daZWCnWwg6Yc
 Zn2hX5zA2Zad75QOxNYP5BPFC1n2SZeDWupteYxSrWJJR/wLxDP/ynw+lqNBz3AjKF
 8pHagNtsEcVIkiDkmWgnOZqx/H4dgITSdZgkURwM=
Date: Sat, 28 Dec 2019 17:33:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191228120317.GP3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-4-pierre-louis.bossart@linux.intel.com>
 <20191227070011.GJ3006@vkoul-mobl>
 <e5b45832-6a7e-1538-8069-ef366b87a8b7@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5b45832-6a7e-1538-8069-ef366b87a8b7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 03/17] soundwire: rename
 drv_to_sdw_slave_driver macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27-12-19, 17:23, Pierre-Louis Bossart wrote:
> 
> 
> On 12/27/19 1:00 AM, Vinod Koul wrote:
> > On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> > > Align with previous renames and shorten macro
> > > 
> > > No functionality change
> > > 
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   drivers/soundwire/bus_type.c       | 9 ++++-----
> > >   include/linux/soundwire/sdw_type.h | 3 ++-
> > >   2 files changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> > > index c0585bcc8a41..2b2830b622fa 100644
> > > --- a/drivers/soundwire/bus_type.c
> > > +++ b/drivers/soundwire/bus_type.c
> > > @@ -34,7 +34,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
> > >   static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
> > >   {
> > >   	struct sdw_slave *slave = to_sdw_slave_device(dev);
> > > -	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
> > > +	struct sdw_driver *drv = to_sdw_slave_driver(ddrv);
> > 
> > so patch 1 does:
> > 
> > -       struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
> > +       struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
> > 
> > and here we move drv_to_sdw_slave_driver to to_sdw_slave_driver... why
> > not do this in first patch and save step1... or did i miss something??
> 
> because patch1 introduces replaces 'sdw_' by 'sdw_slave_' in several places,
> not just for drv_to_sdw_driver()
> 
> I can squash all these patches if you want to but then you'll tell me one
> step at a time...

Yes but that does not mean we add an intermediate step just to remove it
later... So please remove the instances of drv_to_sdw_slave_driver() in
patch1 and move them to patch3 (this) and convert to
to_sdw_slave_driver()

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
