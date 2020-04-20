Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0161B02F4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 09:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67851672;
	Mon, 20 Apr 2020 09:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67851672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587367704;
	bh=iB1xPPGrtS0kEgDBdzXPmUS9VyrArjlu9hbHLWkUKUA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYg89u9P5qW73V77PBh40idSUTZ8KWd3b7xleNi5wae3nSVnUxpzk2khkSVbm8uUd
	 WQyOdRFvlniPJwA5UAJn8YRM7iOtrTRa0/ubWZb0zliFvDoxq1dGnykfOrbK4v/0sg
	 0M2trcYdZ+LYdAYrSxADYjkL+NrjjNh4NwxDvxeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCDDDF8020C;
	Mon, 20 Apr 2020 09:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E2FF801D9; Mon, 20 Apr 2020 09:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44F7EF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 09:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F7EF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kSoj9rOS"
Received: from localhost (unknown [171.61.106.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EFFC2080C;
 Mon, 20 Apr 2020 07:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587367595;
 bh=iB1xPPGrtS0kEgDBdzXPmUS9VyrArjlu9hbHLWkUKUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kSoj9rOSXk6ZFXbQlaiqhhBOl/Z7KscZOO8KIobvlSrQ+UcE3/PJdsOFUbV0BtedO
 0sj/pHAlJOh/69yuvE7yMZ3MOVmmgjfMFURkPwQ3o2CiFNkyaOLw5cX7VEIslu5fsK
 DRCh8utFhVIjO/OJG+mGvpe60pk8fPXEScZOd8ms=
Date: Mon, 20 Apr 2020 12:56:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [RFC 1/5] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200420072631.GW72691@vkoul-mobl>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
 <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
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

Hello Bard,

On 17-04-20, 04:55, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> In the existing SoundWire code, Master Devices are not explicitly
> represented - only SoundWire Slave Devices are exposed (the use of
> capital letters follows the SoundWire specification conventions).
> 
> The SoundWire Master Device provides the clock, synchronization
> information and command/control channels. When multiple links are
> supported, a Controller may expose more than one Master Device; they
> are typically embedded inside a larger audio cluster (be it in an
> SOC/chipset or an external audio codec), and we need to describe it
> using the Linux device and driver model.  This will allow for
> configuration functions to account for external dependencies such as
> power rails, clock sources or wake-up mechanisms. This transition will
> also allow for better sysfs support without the reference count issues
> mentioned in the initial reviews.

Well the primary reason for doing sdw_master_device for creating a
adding sysfs representation. It *also* helps some vendors due to
inherent model should not be constructed as the primary approach for the
sdw_master_device.

> In this patch, we convert the existing code to use an explicit
> sdw_slave_type, then define a sdw_master_device structure.

Please split that up, we should do the conversions required first and
then do addition of new things.

> +struct device_type sdw_master_type = {
> +	.name =		"soundwire_master",
> +	.release =	sdw_master_device_release,
> +};
> +
> +/**
> + * sdw_master_device_add() - create a Linux Master Device representation.
> + * @parent: the parent Linux device (e.g. a PCI device)
> + * @fwnode: the parent fwnode (e.g. an ACPI companion device to the parent)
> + * @link_ops: link-specific ops (optional)
> + * @link_id: link index as defined by MIPI DisCo specification
> + * @pdata: private data (e.g. register base, offsets, platform quirks, etc).
> + *
> + * The link_ops argument can be NULL, it is only used when link-specific
> + * initializations and power-management are required.
> + */
> +struct sdw_master_device
> +*sdw_master_device_add(struct device *parent,
> +		       struct fwnode_handle *fwnode,
> +		       struct sdw_link_ops *link_ops,
> +		       int link_id,
> +		       void *pdata)
> +{
> +	struct sdw_master_device *md;
> +	int ret;
> +
> +	md = kzalloc(sizeof(*md), GFP_KERNEL);
> +	if (!md)
> +		return ERR_PTR(-ENOMEM);
> +
> +	md->link_id = link_id;
> +	md->pdata = pdata;
> +	md->link_ops = link_ops;
> +
> +	md->dev.parent = parent;
> +	md->dev.fwnode = fwnode;
> +	md->dev.bus = &sdw_bus_type;
> +	md->dev.type = &sdw_master_type;
> +	md->dev.dma_mask = md->dev.parent->dma_mask;
> +	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
> +
> +	if (link_ops && link_ops->driver) {
> +		/*
> +		 * A driver is only needed for ASoC integration (need
> +		 * driver->name) and for link-specific power management
> +		 * w/ a pm_dev_ops structure.

That is not true for everyone, it is only true for Intel, pls call that
out as well...

> +		 *
> +		 * The driver needs to be registered by the parent
> +		 */
> +		md->dev.driver = link_ops->driver;
> +	}
> +
> +	ret = device_register(&md->dev);
> +	if (ret) {
> +		dev_err(parent, "Failed to add master: ret %d\n", ret);
> +		/*
> +		 * On err, don't free but drop ref as this will be freed
> +		 * when release method is invoked.
> +		 */
> +		put_device(&md->dev);
> +		goto device_register_err;
> +	}
> +
> +	if (link_ops && link_ops->add) {
> +		ret = link_ops->add(md, pdata);
> +		if (ret < 0) {
> +			dev_err(&md->dev, "link_ops add callback failed: %d\n",
> +				ret);
> +			goto link_add_err;
> +		}
> +	}
> +
> +	return md;
> +
> +link_add_err:
> +	device_unregister(&md->dev);
> +device_register_err:
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(sdw_master_device_add);

This looks better than last version for sure. But I would like this to
be split into two parts, a generic sdw_master_device addition without
the link_ops parts. And then the link_ops parts..

As discussed earlier with you, I see no reason why users should have two
APIs. We should fold the sdw_master_device_add() within the
sdw_add_bus_master() afterall as part of adding bus, we should be
creating the sdw_master_dev as well as sdw_slave.

Since you have additional link_ops, we can pass that to
sdw_add_bus_master() (set to NULL for rest) and then call
sdw_master_device_add() internally..

As requested above, please split this to separate patches, first generic
sdw_master_device addition and calling from sdw_add_bus_master() and
then adding link_ops parts for Intel.

Ofcourse any preparatory patches should come before that.

-- 
~Vinod
