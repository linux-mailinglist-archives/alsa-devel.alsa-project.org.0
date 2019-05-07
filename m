Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A981158DD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217DC184D;
	Tue,  7 May 2019 07:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217DC184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206517;
	bh=JiItMxkCHqPldfC1hOI1fDRzKTP1dI3yS+Oz5AJv6zs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Azle3ltcHmBJTdb8YQzmq+Zi7NwDh5k6LKgs3WSexClQ6SLYKjuL/xlPHX+l3C5Rd
	 zAqlVJRqcZUwJAg2H8AiAnQdnwCldGiNKb+metzRC3ktfDmd3ZCBPuR5x/htoVffGr
	 jBR7OMVUVrfkNHPMtWXy7lqQhf+Ie3tQCgxzdUi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED33F89682;
	Tue,  7 May 2019 07:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E2CF89674; Tue,  7 May 2019 07:20:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0891CF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 07:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0891CF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tPo+br1J"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5D3D20825;
 Tue,  7 May 2019 05:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557206404;
 bh=Flvx6Er9d/coVStQbYYupZGxgW4cRN7G6LywOsFj20Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPo+br1JJSOD6ymilcJdrWRHzZOLmQSbawbDknuiOMWpT4SBxpHYGA4PfLjWsZzxQ
 326OqhKd60CoNvFoUaCfvE3AdFsB2yoOuo+J6RQjAJLAQi02uorkEflM3niUMGlRkd
 77/Eu5kvMgpKxc5XqSsEs2H35F4wBc4pzQZnvIjs=
Date: Tue, 7 May 2019 10:49:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190507051959.GC16052@vkoul-mobl>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-3-pierre-louis.bossart@linux.intel.com>
 <20190504065444.GC9770@kroah.com>
 <c675ea60-5bfa-2475-8878-c589b8d20b32@linux.intel.com>
 <20190506151953.GA13178@kroah.com>
 <20190506162208.GI3845@vkoul-mobl.Dlink>
 <be72bbb1-b51f-8201-fdff-958836ed94d1@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be72bbb1-b51f-8201-fdff-958836ed94d1@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/7] soundwire: add Slave sysfs support
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

On 06-05-19, 11:46, Pierre-Louis Bossart wrote:
> On 5/6/19 11:22 AM, Vinod Koul wrote:
> > On 06-05-19, 17:19, Greg KH wrote:
> > > On Mon, May 06, 2019 at 09:42:35AM -0500, Pierre-Louis Bossart wrote:
> > > > > > +
> > > > > > +int sdw_sysfs_slave_init(struct sdw_slave *slave)
> > > > > > +{
> > > > > > +	struct sdw_slave_sysfs *sysfs;
> > > > > > +	unsigned int src_dpns, sink_dpns, i, j;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	if (slave->sysfs) {
> > > > > > +		dev_err(&slave->dev, "SDW Slave sysfs is already initialized\n");
> > > > > > +		err = -EIO;
> > > > > > +		goto err_ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	sysfs = kzalloc(sizeof(*sysfs), GFP_KERNEL);
> > > > > 
> > > > > Same question as patch 1, why a new device?
> > > > 
> > > > yes it's the same open. In this case, the slave devices are defined at a
> > > > different level so it's also confusing to create a device to represent the
> > > > slave properties. The code works but I am not sure the initial directions
> > > > are correct.
> > > 
> > > You can just make a subdir for your attributes by using the attribute
> > > group name, if a subdirectory is needed just to keep things a bit more
> > > organized.
> > 
> > The key here is 'a subdir' which is not the case here. We did discuss
> > this in the initial patches for SoundWire which had sysfs :)
> > 
> > The way MIPI disco spec organized properties, we have dp0 and dpN
> > properties each of them requires to have a subdir of their own and that
> > was the reason why I coded it to be creating a device.
> 
> Vinod, the question was not for dp0 and dpN, it's fine to have
> subdirectories there, but rather why we need separate devices for the master
> and slave properties.

Slave does not have a separate device. IIRC the properties for Slave are
in /sys/bus/soundwire/device/<slave>/...

For master yes we can skip the device creation, it was done for
consistency sake of having these properties ties into sys/bus/soundwire/

I don't mind if they are shown up in respective device node (PCI/platform
etc) /sys/bus/foo/device/<> 

But for creating subdirectories you would need the new dpX devices.

HTH

> 
> > 
> > Do we have a better way to handle this?
> > 
> > > Otherwise, you need to mess with having multiple "types" of struct
> > > device all associated with the same bus.  It is possible, and not that
> > > hard, but I don't think you are doing that here.
> > > 
> > > thnaks,
> > > 
> > > greg k-h
> > 

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
