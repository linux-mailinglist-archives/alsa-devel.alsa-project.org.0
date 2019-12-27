Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0BB12B379
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 10:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46EFF1719;
	Fri, 27 Dec 2019 10:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46EFF1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577437825;
	bh=U4JGkt28XeXY+CgmWkeqKuaSvYVn064F0pxw/7vP8i4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a12zHY1uiGW0ms8YxpA+w20rIBrnkMb3QuJegY15T11JHWTTY5TSDJmdhaK6El5Zw
	 cnFxPWj0+nT9kB+ipiHLHd54AqVEbnXkVqFafbtd4Xsymez2LdUH3ManFKlb8djrdj
	 z0Oi4xVCrgdnXHnV4MPjMtpxv+shWhATqLZuPNS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF88F800E3;
	Fri, 27 Dec 2019 10:08:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F96F80132; Fri, 27 Dec 2019 10:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0732BF800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 10:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0732BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="erPQnQUH"
Received: from localhost (unknown [106.201.34.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 545B320828;
 Fri, 27 Dec 2019 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577437713;
 bh=WiktlAGtOVBzHvmn6Ql3S4fRz6o1TkBwfkOF3dLvX6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=erPQnQUH3ZBFEGTF3vAUZAW5DwIuYk/NmJ6Y+0EOVML73gCAZ9fRqzbzFb5kJ4hLe
 nPYN+tX6IOguRSEU7TN3LGahvjYXbNjc3rdggDOd7C1KkJdppqzNko2PofbU7+X+13
 Lm4WPuIjZXm1X+SjmtueU72fspvxwuYa5fyTSQqM=
Date: Fri, 27 Dec 2019 14:38:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191227090826.GM3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 09/17] soundwire: intel: remove platform
 devices and use 'Master Devices' instead
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

On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> Use sdw_master_device and driver instead of platform devices
> 
> To quote GregKH:
> 
> "Don't mess with a platform device unless you really have no other
> possible choice. And even then, don't do it and try to do something
> else. Platform devices are really abused, don't perpetuate it "
> 
> In addition, rather than a plain-vanilla init/exit, this patch
> provides 3 steps in the initialization (ACPI scan, probe, startup)
> which makes it easier to verify hardware support for SoundWire,
> allocate required resources as early as possible, and conversely help
> make the startup() callback lighter-weight with only hardware register
> setup.

...

> +struct sdw_md_driver intel_sdw_driver = {
> +	.probe = intel_master_probe,
> +	.startup = intel_master_startup,
> +	.remove = intel_master_remove,
>  };

...

> +extern struct sdw_md_driver intel_sdw_driver;

who uses this intel_sdw_driver? I would assumed someone would register
this with the core...

> +static struct sdw_intel_ctx
> +*sdw_intel_probe_controller(struct sdw_intel_res *res)
> +{
> +	struct sdw_intel_link_res *link;
> +	struct sdw_intel_ctx *ctx;
> +	struct acpi_device *adev;
> +	struct sdw_master_device *md;
> +	u32 link_mask;
> +	int count;
> +	int i;
> +
> +	if (!res)
> +		return NULL;
> +
> +	if (acpi_bus_get_device(res->handle, &adev))
> +		return NULL;
> +
> +	if (!res->count)
> +		return NULL;
> +
> +	count = res->count;
>  	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
>  
>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return NULL;
>  
> -	ctx->count = count;
> -	ctx->links = kcalloc(ctx->count, sizeof(*ctx->links), GFP_KERNEL);
> +	ctx->links = kcalloc(count, sizeof(*ctx->links), GFP_KERNEL);
>  	if (!ctx->links)
>  		goto link_err;
>  
> +	ctx->count = count;
> +	ctx->mmio_base = res->mmio_base;
> +	ctx->link_mask = res->link_mask;
> +	ctx->handle = res->handle;
> +
>  	link = ctx->links;
> +	link_mask = ctx->link_mask;
>  
>  	/* Create SDW Master devices */
> -	for (i = 0; i < count; i++) {
> -		if (link_mask && !(link_mask & BIT(i))) {
> -			dev_dbg(&adev->dev,
> -				"Link %d masked, will not be enabled\n", i);
> -			link++;
> +	for (i = 0; i < count; i++, link++) {
> +		if (link_mask && !(link_mask & BIT(i)))
>  			continue;
> -		}
>  
> +		md = sdw_md_add(&intel_sdw_driver,
> +				res->parent,
> +				acpi_fwnode_handle(adev),
> +				i);
> +
> +		if (IS_ERR(md)) {
> +			dev_err(&adev->dev, "Could not create link %d\n", i);
> +			goto err;
> +		}
> +		link->md = md;
> +		link->mmio_base = res->mmio_base;
>  		link->registers = res->mmio_base + SDW_LINK_BASE
> -					+ (SDW_LINK_SIZE * i);
> +			+ (SDW_LINK_SIZE * i);
>  		link->shim = res->mmio_base + SDW_SHIM_BASE;
>  		link->alh = res->mmio_base + SDW_ALH_BASE;
> -
> +		link->irq = res->irq;
>  		link->ops = res->ops;
>  		link->dev = res->dev;
>  
> -		memset(&pdevinfo, 0, sizeof(pdevinfo));
> -
> -		pdevinfo.parent = res->parent;
> -		pdevinfo.name = "int-sdw";
> -		pdevinfo.id = i;
> -		pdevinfo.fwnode = acpi_fwnode_handle(adev);
> -
> -		pdev = platform_device_register_full(&pdevinfo);
> -		if (IS_ERR(pdev)) {
> -			dev_err(&adev->dev,
> -				"platform device creation failed: %ld\n",
> -				PTR_ERR(pdev));
> -			goto pdev_err;
> -		}
> -
> -		link->pdev = pdev;
> -		link++;
> +		/* let the SoundWire master driver to its probe */
> +		md->driver->probe(md, link);

So you are invoking driver probe here.. That is typically role of driver
core to do that.. If we need that, make driver core do that for you!

That reminds me I am missing match code for master driver...

So we seem to be somewhere is middle wrt driver probing here! IIUC this
is not a full master driver, thats okay, but then it is not
completely transparent either...

I was somehow thinking that the driver will continue to be
'platform/acpi/of' driver and master device abstraction will be
handled in the core (for example see how the busses like i2c handle
this). The master device is created and used to represent but driver
probing etc is not done

Thoughts..?

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
