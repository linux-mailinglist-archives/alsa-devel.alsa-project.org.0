Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738C176F1D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 07:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E06F1682;
	Tue,  3 Mar 2020 07:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E06F1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583215668;
	bh=S8mRHdtcW2CXVVq2rYjFsKgVi7tBbhv5KMqD9VK25js=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwWRB/r1Kd0Ed24Bi9PGbU6R3BRITHmrl0vUC3R8s/EQ5vPNtyWu8sGinKu9i+MJG
	 SgERHFKtz9Ez3BMJSFdkgxVHN/W+MB0jwJ6OCdCO0NnBeFfqYF39CWxz9as6TXfBDR
	 jpQSVyxxAhxvgzoNpifxHmqAyZqegbE9zF1+LPPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98930F80131;
	Tue,  3 Mar 2020 07:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8527EF8025F; Tue,  3 Mar 2020 07:05:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25641F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 07:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25641F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zXbvHkeN"
Received: from localhost (unknown [122.167.124.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C71CF206D7;
 Tue,  3 Mar 2020 06:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583215551;
 bh=S8mRHdtcW2CXVVq2rYjFsKgVi7tBbhv5KMqD9VK25js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zXbvHkeNudXpT0j/NTjtfAAKBZDRWp3CDwuLB7ZwzE2aJUneNKzbHGshEe/fafpGY
 FLcCGUP25MOXBS/80qUhiGBFTpOJ8C9Wy+8RrgFYjSxJShz/Bjb3k5R92A6AjFJ4QZ
 94QGhWFZ0+beEMHyKUCEXB26Pr/OSUuyIvzEe5xk=
Date: Tue, 3 Mar 2020 11:35:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/8] soundwire: intel: transition to
 sdw_master_device/driver support
Message-ID: <20200303060547.GQ4148@vkoul-mobl>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227223206.5020-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 27-02-20, 16:32, Pierre-Louis Bossart wrote:

> +static struct sdw_intel_ctx
> +*sdw_intel_probe_controller(struct sdw_intel_res *res)
> +{
> +	struct sdw_intel_link_res *link;
> +	struct sdw_intel_ctx *ctx;
> +	struct acpi_device *adev;
> +	struct sdw_master_device *md;
> +	unsigned long time;
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
> +		link->clock_stop_quirks = res->clock_stop_quirks;
>  
> -		memset(&pdevinfo, 0, sizeof(pdevinfo));
> +		md = sdw_master_device_add("intel-master",
> +					   res->parent,
> +					   acpi_fwnode_handle(adev),
> +					   i,
> +					   link);

So we add the device in intel layer

>  
> -		pdevinfo.parent = res->parent;
> -		pdevinfo.name = "int-sdw";
> -		pdevinfo.id = i;
> -		pdevinfo.fwnode = acpi_fwnode_handle(adev);
> +		if (IS_ERR(md)) {
> +			dev_err(&adev->dev, "Could not create link %d\n", i);
> +			goto err;
> +		}
>  
> -		pdev = platform_device_register_full(&pdevinfo);
> -		if (IS_ERR(pdev)) {
> -			dev_err(&adev->dev,
> -				"platform device creation failed: %ld\n",
> -				PTR_ERR(pdev));
> -			goto pdev_err;
> +		/*
> +		 * we need to wait for the bus to be probed so that we
> +		 * can report ACPI information to the upper layers
> +		 */
> +		time = wait_for_completion_timeout(&md->probe_complete,
> +				msecs_to_jiffies(SDW_INTEL_MASTER_PROBE_TIMEOUT));

Then wait for probe to complete..

> +static int
> +sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
> +{
> +	struct acpi_device *adev;
> +	struct sdw_intel_link_res *link;
> +	struct sdw_master_device *md;
> +	u32 caps;
> +	u32 link_mask;
> +	int i;
> +
> +	if (acpi_bus_get_device(ctx->handle, &adev))
> +		return -EINVAL;
> +
> +	/* Check SNDWLCAP.LCOUNT */
> +	caps = ioread32(ctx->mmio_base + SDW_SHIM_BASE + SDW_SHIM_LCAP);
> +	caps &= GENMASK(2, 0);
> +
> +	/* Check HW supported vs property value */
> +	if (caps < ctx->count) {
> +		dev_err(&adev->dev,
> +			"BIOS master count is larger than hardware capabilities\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!ctx->links)
> +		return -EINVAL;
> +
> +	link = ctx->links;
> +	link_mask = ctx->link_mask;
> +
> +	/* Startup SDW Master devices */
> +	for (i = 0; i < ctx->count; i++, link++) {
> +		if (link_mask && !(link_mask & BIT(i)))
> +			continue;
> +
> +		md = link->md;
> +
> +		sdw_master_device_startup(md);

And finally start the device.

If i look at bigger picture:

PCI SOF driver scans the capabilities and finds SoundWire supported:
 - Invokes sdw_intel_probe_controller() 
        - This adds sdw_master_device and waits till the probe is
          complete.
 - Invokes sdw_intel_startup_controller()
        - It starts up the controller by calling
          sdw_master_device_startup()

Now, I guess at the peril of repeating myself again:

Why not do:

- PCI SOF driver scans the capabilities and finds SoundWire supported:
  - Invokes sdw_intel_probe_controller()
        - This adds sdw_master_device
        - Does rest of device init and context init
  - Invoked sdw_intel_startup_controller()
        - Calls sdw_master_device_startup() to start

You will get more fine grained control of the sequencing, no need to
wait for dummy probe to be over. The device for these would be parent
PCI SOF device and driver PCI SOF driver.

So in summary I do not see a reason for even Intel to have a dummy
soundwire_master_driver.

-- 
~Vinod
