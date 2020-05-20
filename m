Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4A1DB5BE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 15:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF63417F8;
	Wed, 20 May 2020 15:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF63417F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589982981;
	bh=CxK0gseNp+SBZ4zpW34ctL0VPz31/KFZU//G0BqDoic=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWqcPrerQm6UtMKMTL7eedYsfDDS3UBrxEzv56UhDBX2xNsiPKGy+aAtEQgbmqzak
	 /xO9mE5EcpIA/zzMu/fxcEHkwQAAmB6QRCi7cuYQouKAqfpuEMlpZegcNPbp1rxzoh
	 RWcqABPLHFsmXdLsqM0l7BIc0HACxTV4O1HV4Nso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD985F80213;
	Wed, 20 May 2020 15:54:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF559F801F9; Wed, 20 May 2020 15:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34DCCF80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 15:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DCCF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hP5iWOo/"
Received: from localhost (unknown [122.178.227.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E317F207F9;
 Wed, 20 May 2020 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589982870;
 bh=CxK0gseNp+SBZ4zpW34ctL0VPz31/KFZU//G0BqDoic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hP5iWOo/9qDjvVjvbEylSRzNzc1P0LiHghbgdZY4dxGpzBJThK+EJ0f6GjpI/jIzt
 En0lE8LEBmTPGTp8Ufr1W6p3Hpu3kUdqZmNsxMlTom3yLxDB3rOECXh40wWr77fHf+
 AUhXCfu70UnH8kpKpvTXa6V+nu8yPMDlDlmqutzc=
Date: Wed, 20 May 2020 19:24:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/2] soundwire: intel: transition to 3 steps initialization
Message-ID: <20200520135425.GX374218@vkoul-mobl.Dlink>
References: <20200519191903.6557-1-yung-chuan.liao@linux.intel.com>
 <20200519191903.6557-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519191903.6557-2-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 20-05-20, 03:19, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Rather than a plain-vanilla init/exit, this patch provides 3 steps in
> the initialization (ACPI scan, probe, startup) which makes it easier to
> detect platform support for SoundWire, allocate required resources as
> early as possible, and conversely help make the startup() callback
> lighter-weight with only hardware register setup.

Okay but can you add details in changelog on what each step would do?

> @@ -1134,25 +1142,15 @@ static int intel_probe(struct platform_device *pdev)
>  
>  	intel_pdi_ch_update(sdw);
>  
> -	/* Acquire IRQ */
> -	ret = request_threaded_irq(sdw->link_res->irq,
> -				   sdw_cdns_irq, sdw_cdns_thread,
> -				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);

This is removed here but not added anywhere else, do we have no irq
after this patch?

> @@ -1205,5 +1201,5 @@ static struct platform_driver sdw_intel_drv = {
>  module_platform_driver(sdw_intel_drv);
>  
>  MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_ALIAS("platform:int-sdw");
> +MODULE_ALIAS("sdw:intel-sdw");

it is still a platform device, so does sdw: tag make sense?
This is used by modprobe to load the driver!

> +/**
> + * sdw_intel_probe() - SoundWire Intel probe routine
> + * @res: resource data
> + *
> + * This creates SoundWire Master and Slave devices below the controller.

I dont think the comment is correct, this is done in intel_master_probe
which is platform device probe...

> + * All the information necessary is stored in the context, and the res
> + * argument pointer can be freed after this step.
> + */
> +struct sdw_intel_ctx
> +*sdw_intel_probe(struct sdw_intel_res *res)
> +{
> +	return sdw_intel_probe_controller(res);
> +}
> +EXPORT_SYMBOL(sdw_intel_probe);

I guess this would be called by SOF driver, question is when..?

> +/**
> + * sdw_intel_startup() - SoundWire Intel startup
> + * @ctx: SoundWire context allocated in the probe
> + *
> + */
> +int sdw_intel_startup(struct sdw_intel_ctx *ctx)
> +{
> +	return sdw_intel_startup_controller(ctx);
> +}
> +EXPORT_SYMBOL(sdw_intel_startup);

when is this called, pls do document that

-- 
~Vinod
