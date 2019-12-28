Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5112BD88
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 13:11:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B3C176A;
	Sat, 28 Dec 2019 13:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B3C176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577535087;
	bh=sVm53G8S2Kz0tOLR3x5wFe01i2ABP7T2NvW/caIksvc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVpk0tcAPXZax+vz7V/4dlaNO1mxSkYt/l+xpwkx+Fh+YCCtJCwuyWwV+tV3c+BdD
	 18D8T6E1dib5A0fjRg2aNYjgnVTvO6xK+jTUOFhY5piWm8ye1mUahvA3Q/Mp2YB5LF
	 CTGX2m8F7CwKp8Zrd0v1uAdqAZ6EfKHTCJAjz2wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBF4BF80138;
	Sat, 28 Dec 2019 13:09:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82540F80139; Sat, 28 Dec 2019 13:09:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2AB9F8011E
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 13:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AB9F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0j29eL0y"
Received: from localhost (unknown [122.178.200.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0258B20409;
 Sat, 28 Dec 2019 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577534975;
 bh=q49tqPH7tWafvxKLb/LDDT7f3OVFmJjvV/wyX/oHtic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0j29eL0yns+J51T/AsO3uu9vm2Qk/EnCOtm0eYwpLLSHOMGfkvaFef8K2CS3es/zj
 ApR0tGsf1JrocGTXpSfpjlxn7P1hlAYAtFVRBlxgqvEEccbMW5V5l+EYHqCcpTk91L
 eK0ryDmZY5S+JGRd2sw2tei7o/ToyaA/1v/fviyQ=
Date: Sat, 28 Dec 2019 17:39:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191228120930.GR3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-9-pierre-louis.bossart@linux.intel.com>
 <20191227071433.GL3006@vkoul-mobl>
 <1922c494-4641-8c40-192d-758b21014fbc@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1922c494-4641-8c40-192d-758b21014fbc@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 08/17] soundwire: add initial
 definitions for sdw_master_device
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

On 27-12-19, 17:38, Pierre-Louis Bossart wrote:
> 
> 
> On 12/27/19 1:14 AM, Vinod Koul wrote:
> > On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> > > Since we want an explicit support for the SoundWire Master device, add
> > > the definitions, following the Greybus example of a 'Host Device'.
> > > 
> > > A parent (such as the Intel audio controller) would use sdw_md_add()
> > > to create the device, passing a driver as a parameter. The
> > > sdw_md_release() would be called when put_device() is invoked by the
> > > parent. We use the shortcut 'md' for 'master device' to avoid very
> > > long function names.
> > 
> > I agree we should not have long name :) but md does not sound great. Can
> > we drop the device and use sdw_slave and sdw_master for devices and
> > append _driver when we are talking about drivers...
> > 
> > we dont use sd for slave and imo this would gel well with existing names
> 
> In SoundWire parlance, both 'Slave' and 'Master' are 'Devices', so yes we do
> in the standard talk about 'Slave Devices' and 'Master Devices'.
> 
> Then we have Linux 'Devices' which can be used for both.
> 
> If we use 'sdw_slave', would we be referring to the actual physical part or
> the Linux device?
> 
> FWIW the Greybus example used 'Host Device' and 'hd' as shortcut.

But this messes up consistency in the naming of sdw objects. I am all for
it, if we do sd for slave and name all structs and APIs accordingly. The key
is consistency!

So it needs to be sd/md and so on or sdw_slave and sdw_master and so
on... not a mix of both

> > > --- a/drivers/soundwire/bus_type.c
> > > +++ b/drivers/soundwire/bus_type.c
> > > @@ -66,7 +66,10 @@ int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
> > >   		 * callback is set to use this function for a
> > >   		 * different device type (e.g. Master or Monitor)
> > >   		 */
> > > -		dev_err(dev, "uevent for unknown Soundwire type\n");
> > > +		if (is_sdw_master_device(dev))
> > > +			dev_err(dev, "uevent for SoundWire Master type\n");
> > 
> > see below [1]:
> > 
> > > +static void sdw_md_release(struct device *dev)
> > 
> > sdw_master_release() won't be too long!
> 
> yes, but there is no such operation as 'Master Release' in SoundWire.
> At least the 'md' shortcut conveys the implicit convention that this is a
> Linux device only.
> 
> I really would like to avoid overloading the standard definitions with the
> Linux ones...

I agree with you on not overloading but from a linux pov, we need names
which are consistent with each other...

> > > +{
> > > +	struct sdw_master_device *md = to_sdw_master_device(dev);
> > > +
> > > +	kfree(md);
> > > +}
> > > +
> > > +struct device_type sdw_md_type = {
> > 
> > sdw_master_type and so on :)
> > 
> > > +	.name =		"soundwire_master",
> > > +	.release =	sdw_md_release,
> > 
> > [1]:
> > There is no uevent added here, so sdw_uevent() will never be called for
> > this, can you check again if you see the print you added?
> 
> as explained this is to avoid errors at a later point. I don't see any harm
> in providing error checks for a routine that can only be used for 1 of the 3
> devices defined in the standard?
> 
> > > +struct sdw_master_device {
> > 
> > we have sdw_slave, so would be better if we call this sdw_master
> > 
> > > +	struct device dev;
> > > +	int link_id;
> > > +	struct sdw_md_driver *driver;
> > > +	void *pdata;
> > 
> > no sdw_bus pointer and I dont see bus adding this object.. Is there no
> > link between bus and master device objects?
> 
> There is currently no bus device object, see the structure definition it's a
> pointer to a device (which leads to all sorts of issues because we can't use
> container_of).
> 
> when the master device gets added, that's where the Linux device is created
> and the pointer saved in the bus structure, with IIRC sdw_add_bus_master().
> 
> 
>  	ret = sdw_add_bus_master(&sdw->cdns.bus);
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
