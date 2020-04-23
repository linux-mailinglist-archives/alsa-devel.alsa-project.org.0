Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1402C1B5DBC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 16:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11161695;
	Thu, 23 Apr 2020 16:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11161695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587652007;
	bh=awxfurzkZKl16SHw8EPTwq6LCLWkAhmyRFGAWg9HM+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCoGVaSj5PGDPRoVpXTItkyyvfe7U4GNqQBptBUSGHVPwwEpGcI1iV9XVwnqXgGvm
	 fjkqCUF8jxP+5qJSmouM8LsoGN6/xgdAiV1Crl18WQOU2WGVyiTzfDnODA+Ga00Yao
	 lv9C845WH+jzMUgLwW6O3FTsMdASL34dCLEswLfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECEA8F800F2;
	Thu, 23 Apr 2020 16:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89AE0F801EC; Thu, 23 Apr 2020 16:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66291F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 16:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66291F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O3E7jg7r"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32D8E206ED;
 Thu, 23 Apr 2020 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587651893;
 bh=awxfurzkZKl16SHw8EPTwq6LCLWkAhmyRFGAWg9HM+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3E7jg7rCQPRXXyLoWBrL+nLpl6Km3V7EQZa8kwvrj1fNCwKIy0VPUqRALSsweR8F
 i14bZXIdzDyEMKEWDPbMDOHxTeXY1pJ94cSEF3fcCF/JCdmrAB9zO5HykffjRDFeQQ
 mKee7wkv+VngA16l4t72zDfQzJQOdnGVr1CbuTgA=
Date: Thu, 23 Apr 2020 16:24:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [RFC 1/5] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200423142451.GA4181720@kroah.com>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
 <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
 <20200420072631.GW72691@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420072631.GW72691@vkoul-mobl>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, mengdong.lin@intel.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com
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

On Mon, Apr 20, 2020 at 12:56:31PM +0530, Vinod Koul wrote:
> Hello Bard,
> 
> On 17-04-20, 04:55, Bard Liao wrote:
> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > 
> > In the existing SoundWire code, Master Devices are not explicitly
> > represented - only SoundWire Slave Devices are exposed (the use of
> > capital letters follows the SoundWire specification conventions).
> > 
> > The SoundWire Master Device provides the clock, synchronization
> > information and command/control channels. When multiple links are
> > supported, a Controller may expose more than one Master Device; they
> > are typically embedded inside a larger audio cluster (be it in an
> > SOC/chipset or an external audio codec), and we need to describe it
> > using the Linux device and driver model.  This will allow for
> > configuration functions to account for external dependencies such as
> > power rails, clock sources or wake-up mechanisms. This transition will
> > also allow for better sysfs support without the reference count issues
> > mentioned in the initial reviews.
> 
> Well the primary reason for doing sdw_master_device for creating a
> adding sysfs representation.

-ENOPARSE :(

> It *also* helps some vendors due to
> inherent model should not be constructed as the primary approach for the
> sdw_master_device.

No, the PRIMARY reason is "it is the correct thing to do".  It's how to
tie into the driver model correctly, without it, crazy things happen as
we have seen.

> > In this patch, we convert the existing code to use an explicit
> > sdw_slave_type, then define a sdw_master_device structure.
> 
> Please split that up, we should do the conversions required first and
> then do addition of new things.

Can you really do that in two different steps?

> > +struct device_type sdw_master_type = {
> > +	.name =		"soundwire_master",
> > +	.release =	sdw_master_device_release,
> > +};
> > +
> > +/**
> > + * sdw_master_device_add() - create a Linux Master Device representation.
> > + * @parent: the parent Linux device (e.g. a PCI device)
> > + * @fwnode: the parent fwnode (e.g. an ACPI companion device to the parent)
> > + * @link_ops: link-specific ops (optional)
> > + * @link_id: link index as defined by MIPI DisCo specification
> > + * @pdata: private data (e.g. register base, offsets, platform quirks, etc).
> > + *
> > + * The link_ops argument can be NULL, it is only used when link-specific
> > + * initializations and power-management are required.
> > + */
> > +struct sdw_master_device
> > +*sdw_master_device_add(struct device *parent,
> > +		       struct fwnode_handle *fwnode,
> > +		       struct sdw_link_ops *link_ops,
> > +		       int link_id,
> > +		       void *pdata)
> > +{
> > +	struct sdw_master_device *md;
> > +	int ret;
> > +
> > +	md = kzalloc(sizeof(*md), GFP_KERNEL);
> > +	if (!md)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	md->link_id = link_id;
> > +	md->pdata = pdata;
> > +	md->link_ops = link_ops;
> > +
> > +	md->dev.parent = parent;
> > +	md->dev.fwnode = fwnode;
> > +	md->dev.bus = &sdw_bus_type;
> > +	md->dev.type = &sdw_master_type;
> > +	md->dev.dma_mask = md->dev.parent->dma_mask;
> > +	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
> > +
> > +	if (link_ops && link_ops->driver) {
> > +		/*
> > +		 * A driver is only needed for ASoC integration (need
> > +		 * driver->name) and for link-specific power management
> > +		 * w/ a pm_dev_ops structure.
> 
> That is not true for everyone, it is only true for Intel, pls call that
> out as well...

Why is it not true for everyone?  How else do you get the pm stuff back
to your hardware?

thanks,

greg k-h
