Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF2174E3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:18:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C99193C;
	Wed,  8 May 2019 11:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C99193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557307126;
	bh=/+7X1agtI/XXOZ9YwzRDjQTqPnT2lBHMjVxnvk6lVsY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQBWWeM8uQ2cDZd2sar/F3PApjqhILIYfNusORylsY3hfrW4koi8ZLa7HId+G8pRG
	 +Y7Kxo6BrgXaPVeoNqFAZBon8pw3HX+TBa6ZKNhqJ2rSvNvTiklps0SirlGDUBBW+g
	 bLUDyLwCBQodHdU3/YrRDHmB/JEun9uELj3iiz/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ECE8F89705;
	Wed,  8 May 2019 11:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77A7BF8970E; Wed,  8 May 2019 11:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF1AF896FF
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF1AF896FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qo+wluAx"
Received: from localhost (unknown [84.241.196.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24EBC20656;
 Wed,  8 May 2019 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557306992;
 bh=mNQpSbcqpuj650yWcBMc5fBzFb8Xoteok3uBLu87vIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qo+wluAxNOUTNpCmEqexCWR10tRyCfmfLwyMckU71+DhsTTW+RGvpfk0oa8vgb6a6
 3Rmk0rOBf1GrhwNTiGbZczzwnzgfA4Wv7er1O94abBWhY/C90zEa+7oWY5l7ErLlrI
 d+8B+QL6tc7hW6OkS0g5Jwvu9hqw/0HGYZvAymqE=
Date: Wed, 8 May 2019 11:16:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190508091628.GB1858@kroah.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
 <20190504065242.GA9770@kroah.com>
 <b0059709-027e-26c4-25a1-bd55df7c507f@linux.intel.com>
 <20190507052732.GD16052@vkoul-mobl>
 <20190507055432.GB17986@kroah.com>
 <20190507110331.GL16052@vkoul-mobl>
 <20190507111956.GB1092@kroah.com>
 <10fef156-7b01-7a08-77b4-ae3153eaaabc@linux.intel.com>
 <20190508074606.GV16052@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508074606.GV16052@vkoul-mobl>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 1/7] soundwire: Add sysfs support for
 master(s)
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

On Wed, May 08, 2019 at 01:16:06PM +0530, Vinod Koul wrote:
> On 07-05-19, 17:49, Pierre-Louis Bossart wrote:
> > 
> > > > The model here is that Master device is PCI or Platform device and then
> > > > creates a bus instance which has soundwire slave devices.
> > > > 
> > > > So for any attribute on Master device (which has properties as well and
> > > > representation in sysfs), device specfic struct (PCI/platfrom doesn't
> > > > help). For slave that is not a problem as sdw_slave structure takes care
> > > > if that.
> > > > 
> > > > So, the solution was to create the psedo sdw_master device for the
> > > > representation and have device-specific structure.
> > > 
> > > Ok, much like the "USB host controller" type device.  That's fine, make
> > > such a device, add it to your bus, and set the type correctly.  And keep
> > > a pointer to that structure in your device-specific structure if you
> > > really need to get to anything in it.
> > 
> > humm, you lost me on the last sentence. Did you mean using
> > set_drv/platform_data during the init and retrieving the bus information
> > with get_drv/platform_data as needed later? Or something else I badly need
> > to learn?
> 
> IIUC Greg meant we should represent a soundwire master device type and
> use that here. Just like we have soundwire slave device type. Something
> like:
> 
> struct sdw_master {
>         struct device dev;
>         struct sdw_master_prop *prop;
>         ...
> };
> 
> In show function you get master from dev (container of) and then use
> that to access the master properties. So int.sdw.0 can be of this type.

Yes, you need to represent the master device type if you are going to be
having an internal representation of it.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
