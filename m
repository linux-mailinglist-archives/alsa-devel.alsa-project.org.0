Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C0390903
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 20:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFCAE1766;
	Tue, 25 May 2021 20:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFCAE1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621967543;
	bh=TY25Ng90nRaIDTwxJPCOs2Y8XhcrzpJpHt/AHuuySQk=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=elNAH99b4E7S5nyubXTbqiRnlZLTp1k7K42BYuNTalcXDSXc5R5e2Pv9lT31/nXdT
	 vz3yckVnSIz2TiuaKSWPzoted3Qz8raBzsiYcc+1BRaog3Y+36HMSN5SxRlxzVU266
	 v2ES5zWPSUxIbnSUqcDOxGGeC+69njPQpdd07pTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 112D1F800F7;
	Tue, 25 May 2021 20:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C45F800CB; Tue, 25 May 2021 20:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DFC9F800AC
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 20:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DFC9F800AC
IronPort-SDR: t4FhaRbwWg2AwmpyDqYQ2/K+e+QKujuDWu2Rq4ffuMn4QqObevGvjrHEkMLDLQfaLqjX5aRWEg
 rZ7MBqHruayA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202022379"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="202022379"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 11:30:39 -0700
IronPort-SDR: Eh5hWt4mbSM4Y2f5kkmRyO9gkG/iTMx0pr7hVSBv3n+P09bE50Z1C0ljkONaWOIZPZV/uACN+d
 /UqQGuwbpZrw==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443541377"
Received: from mdebbage-mobl.amr.corp.intel.com (HELO [10.212.87.116])
 ([10.212.87.116])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 11:30:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
Message-ID: <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
Date: Tue, 25 May 2021 13:30:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hui.wang@canonical.com,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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



On 5/11/21 12:21 AM, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Now that the auxiliary_bus exists, there's no reason to use platform
> devices as children of a PCI device any longer.
> 
> This patch refactors the code by extending a basic auxiliary device
> with Intel link-specific structures that need to be passed between
> controller and link levels. This refactoring is much cleaner with no
> need for cross-pointers between device and link structures.
> 
> Note that the auxiliary bus API has separate init and add steps, which
> requires more attention in the error unwinding paths. The main loop
> needs to deal with kfree() and auxiliary_device_uninit() for the
> current iteration before jumping to the common label which releases
> everything allocated in prior iterations.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
> v2:
>   - add link_dev_register for all kzalloc, device_init, and device_add.
> v3:
>   - Modify the function description of sdw_intel_probe() which was
>     missing in previous version.
> v4:
>   - Move intel_link_dev_unregister(ldev) before pm_runtime_put_noidle(
>     ldev->link_res.dev) to fix use-after-free reported by KASAN.

Two years ago, GregKH stated in
https://lore.kernel.org/lkml/20190509181812.GA10776@kroah.com/

"So soundwire is creating platform devices?  Ick, no!  Don't do that"

Fast forward two years, this patch provides a solution to remove the use 
of the platform devices with the auxiliary bus. This move does not add 
any new functionality, it's just a replacement of one type of device by 
another.

The reviews have been rather limited since the first version shared on 
March 22.

a) I updated the code to follow the model of the Mellanox driver in

https://elixir.bootlin.com/linux/latest/source/include/linux/mlx5/driver.h#L545

I hope this addresses GregKH's feedback on the need for a 'register' 
function to combined the two init and add steps. I didn't see a path to 
add a generic register function in the auxiliary bus code since between 
init and add there is a need to setup domain-specific structures. Other 
contributors to the auxiliary bus (CC:ed) also didn't have a burning 
desire to add this capability.

b) Vinod commented:

"What I would like to see the end result is that sdw driver for Intel
controller here is a simple auxdev device and no additional custom setup
layer required... which implies that this handling should be moved into
auxdev or Intel code setting up auxdev..."

I was unable to figure out what this comment hinted at: the auxbus is 
already handled in the intel_init.c and intel.c files and the auxbus is 
used to model a set of links/managers below the PCI device, not the 
controller itself. There is also no such thing as a simple auxdev device 
used in the kernel today, the base layer is meant to be extended with 
domain-specific structures. There is really no point in creating a 
simple auxbus device without extensions.

My reply from March 24 which included technical details on how the 
auxiliary bus is designed was not followed by any replies/comments from 
Vinod, so I don't know if there is agreement or still a disconnect.

I understand everyone is busy, but I could use more feedback on this 
patch. Vinod and Greg can you please chime in on this v4?

Thank you.

> ---
>   drivers/soundwire/Kconfig           |   1 +
>   drivers/soundwire/intel.c           |  56 ++++---
>   drivers/soundwire/intel.h           |  14 +-
>   drivers/soundwire/intel_init.c      | 232 +++++++++++++++++++---------
>   include/linux/soundwire/sdw_intel.h |   6 +-
>   5 files changed, 202 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index 016e74230bb7..2b7795233282 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -25,6 +25,7 @@ config SOUNDWIRE_INTEL
>   	tristate "Intel SoundWire Master driver"
>   	select SOUNDWIRE_CADENCE
>   	select SOUNDWIRE_GENERIC_ALLOCATION
> +	select AUXILIARY_BUS
>   	depends on ACPI && SND_SOC
>   	help
>   	  SoundWire Intel Master driver.
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index fd95f94630b1..c11e3d8cd308 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -11,7 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> -#include <linux/platform_device.h>
> +#include <linux/auxiliary_bus.h>
>   #include <sound/pcm_params.h>
>   #include <linux/pm_runtime.h>
>   #include <sound/soc.h>
> @@ -1327,11 +1327,14 @@ static int intel_init(struct sdw_intel *sdw)
>   }
>   
>   /*
> - * probe and init
> + * probe and init (aux_dev_id argument is required by function prototype but not used)
>    */
> -static int intel_master_probe(struct platform_device *pdev)
> +static int intel_link_probe(struct auxiliary_device *auxdev,
> +			    const struct auxiliary_device_id *aux_dev_id)
> +
>   {
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = &auxdev->dev;
> +	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
>   	struct sdw_intel *sdw;
>   	struct sdw_cdns *cdns;
>   	struct sdw_bus *bus;
> @@ -1344,14 +1347,14 @@ static int intel_master_probe(struct platform_device *pdev)
>   	cdns = &sdw->cdns;
>   	bus = &cdns->bus;
>   
> -	sdw->instance = pdev->id;
> -	sdw->link_res = dev_get_platdata(dev);
> +	sdw->instance = auxdev->id;
> +	sdw->link_res = &ldev->link_res;
>   	cdns->dev = dev;
>   	cdns->registers = sdw->link_res->registers;
>   	cdns->instance = sdw->instance;
>   	cdns->msg_count = 0;
>   
> -	bus->link_id = pdev->id;
> +	bus->link_id = auxdev->id;
>   
>   	sdw_cdns_probe(cdns);
>   
> @@ -1384,10 +1387,10 @@ static int intel_master_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -int intel_master_startup(struct platform_device *pdev)
> +int intel_link_startup(struct auxiliary_device *auxdev)
>   {
>   	struct sdw_cdns_stream_config config;
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = &auxdev->dev;
>   	struct sdw_cdns *cdns = dev_get_drvdata(dev);
>   	struct sdw_intel *sdw = cdns_to_intel(cdns);
>   	struct sdw_bus *bus = &cdns->bus;
> @@ -1524,9 +1527,9 @@ int intel_master_startup(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int intel_master_remove(struct platform_device *pdev)
> +static void intel_link_remove(struct auxiliary_device *auxdev)
>   {
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = &auxdev->dev;
>   	struct sdw_cdns *cdns = dev_get_drvdata(dev);
>   	struct sdw_intel *sdw = cdns_to_intel(cdns);
>   	struct sdw_bus *bus = &cdns->bus;
> @@ -1542,19 +1545,17 @@ static int intel_master_remove(struct platform_device *pdev)
>   		snd_soc_unregister_component(dev);
>   	}
>   	sdw_bus_master_delete(bus);
> -
> -	return 0;
>   }
>   
> -int intel_master_process_wakeen_event(struct platform_device *pdev)
> +int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
>   {
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = &auxdev->dev;
>   	struct sdw_intel *sdw;
>   	struct sdw_bus *bus;
>   	void __iomem *shim;
>   	u16 wake_sts;
>   
> -	sdw = platform_get_drvdata(pdev);
> +	sdw = dev_get_drvdata(dev);
>   	bus = &sdw->cdns.bus;
>   
>   	if (bus->prop.hw_disabled) {
> @@ -1976,17 +1977,22 @@ static const struct dev_pm_ops intel_pm = {
>   	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
>   };
>   
> -static struct platform_driver sdw_intel_drv = {
> -	.probe = intel_master_probe,
> -	.remove = intel_master_remove,
> +static const struct auxiliary_device_id intel_link_id_table[] = {
> +	{ .name = "soundwire_intel.link" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, intel_link_id_table);
> +
> +static struct auxiliary_driver sdw_intel_drv = {
> +	.probe = intel_link_probe,
> +	.remove = intel_link_remove,
>   	.driver = {
> -		.name = "intel-sdw",
> +		/* auxiliary_driver_register() sets .name to be the modname */
>   		.pm = &intel_pm,
> -	}
> +	},
> +	.id_table = intel_link_id_table
>   };
> -
> -module_platform_driver(sdw_intel_drv);
> +module_auxiliary_driver(sdw_intel_drv);
>   
>   MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_ALIAS("platform:intel-sdw");
> -MODULE_DESCRIPTION("Intel Soundwire Master Driver");
> +MODULE_DESCRIPTION("Intel Soundwire Link Driver");
> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 06bac8ba14e9..0b47b148da3f 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -7,7 +7,6 @@
>   /**
>    * struct sdw_intel_link_res - Soundwire Intel link resource structure,
>    * typically populated by the controller driver.
> - * @pdev: platform_device
>    * @mmio_base: mmio base of SoundWire registers
>    * @registers: Link IO registers base
>    * @shim: Audio shim pointer
> @@ -23,7 +22,6 @@
>    * @list: used to walk-through all masters exposed by the same controller
>    */
>   struct sdw_intel_link_res {
> -	struct platform_device *pdev;
>   	void __iomem *mmio_base; /* not strictly needed, useful for debug */
>   	void __iomem *registers;
>   	void __iomem *shim;
> @@ -48,7 +46,15 @@ struct sdw_intel {
>   #endif
>   };
>   
> -int intel_master_startup(struct platform_device *pdev);
> -int intel_master_process_wakeen_event(struct platform_device *pdev);
> +int intel_link_startup(struct auxiliary_device *auxdev);
> +int intel_link_process_wakeen_event(struct auxiliary_device *auxdev);
> +
> +struct sdw_intel_link_dev {
> +	struct auxiliary_device auxdev;
> +	struct sdw_intel_link_res link_res;
> +};
> +
> +#define auxiliary_dev_to_sdw_intel_link_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct sdw_intel_link_dev, auxdev)
>   
>   #endif /* __SDW_INTEL_LOCAL_H */
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index 30ce95ec2d70..9e283bef53d2 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -12,7 +12,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> -#include <linux/platform_device.h>
> +#include <linux/auxiliary_bus.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/soundwire/sdw_intel.h>
>   #include "cadence_master.h"
> @@ -24,28 +24,108 @@
>   #define SDW_LINK_BASE		0x30000
>   #define SDW_LINK_SIZE		0x10000
>   
> +static void intel_link_dev_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
> +
> +	kfree(ldev);
> +}
> +
> +/* alloc, init and add link devices */
> +static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *res,
> +							  struct sdw_intel_ctx *ctx,
> +							  struct fwnode_handle *fwnode,
> +							  const char *name,
> +							  int link_id)
> +{
> +	struct sdw_intel_link_dev *ldev;
> +	struct sdw_intel_link_res *link;
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
> +	if (!ldev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	auxdev = &ldev->auxdev;
> +	auxdev->name = name;
> +	auxdev->dev.parent = res->parent;
> +	auxdev->dev.fwnode = fwnode;
> +	auxdev->dev.release = intel_link_dev_release;
> +
> +	/* we don't use an IDA since we already have a link ID */
> +	auxdev->id = link_id;
> +
> +	/*
> +	 * keep a handle on the allocated memory, to be used in all other functions.
> +	 * Since the same pattern is used to skip links that are not enabled, there is
> +	 * no need to check if ctx->ldev[i] is NULL later on.
> +	 */
> +	ctx->ldev[link_id] = ldev;
> +
> +	/* Add link information used in the driver probe */
> +	link = &ldev->link_res;
> +	link->mmio_base = res->mmio_base;
> +	link->registers = res->mmio_base + SDW_LINK_BASE
> +		+ (SDW_LINK_SIZE * link_id);
> +	link->shim = res->mmio_base + SDW_SHIM_BASE;
> +	link->alh = res->mmio_base + SDW_ALH_BASE;
> +
> +	link->ops = res->ops;
> +	link->dev = res->dev;
> +
> +	link->clock_stop_quirks = res->clock_stop_quirks;
> +	link->shim_lock = &ctx->shim_lock;
> +	link->shim_mask = &ctx->shim_mask;
> +	link->link_mask = ctx->link_mask;
> +
> +	/* now follow the two-step init/add sequence */
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret < 0) {
> +		dev_err(res->parent, "failed to initialize link dev %s link_id %d\n",
> +			name, link_id);
> +		kfree(ldev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = auxiliary_device_add(&ldev->auxdev);
> +	if (ret < 0) {
> +		dev_err(res->parent, "failed to add link dev %s link_id %d\n",
> +			ldev->auxdev.name, link_id);
> +		/* ldev will be freed with the put_device() and .release sequence */
> +		auxiliary_device_uninit(&ldev->auxdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return ldev;
> +}
> +
> +static void intel_link_dev_unregister(struct sdw_intel_link_dev *ldev)
> +{
> +	auxiliary_device_delete(&ldev->auxdev);
> +	auxiliary_device_uninit(&ldev->auxdev);
> +}
> +
>   static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
>   {
> -	struct sdw_intel_link_res *link = ctx->links;
> +	struct sdw_intel_link_dev *ldev;
>   	u32 link_mask;
>   	int i;
>   
> -	if (!link)
> -		return 0;
> -
>   	link_mask = ctx->link_mask;
>   
> -	for (i = 0; i < ctx->count; i++, link++) {
> +	for (i = 0; i < ctx->count; i++) {
>   		if (!(link_mask & BIT(i)))
>   			continue;
>   
> -		if (link->pdev) {
> -			pm_runtime_disable(&link->pdev->dev);
> -			platform_device_unregister(link->pdev);
> -		}
> +		ldev = ctx->ldev[i];
>   
> -		if (!link->clock_stop_quirks)
> -			pm_runtime_put_noidle(link->dev);
> +		pm_runtime_disable(&ldev->auxdev.dev);
> +		if (!ldev->link_res.clock_stop_quirks)
> +			pm_runtime_put_noidle(ldev->link_res.dev);
> +
> +		intel_link_dev_unregister(ldev);
>   	}
>   
>   	return 0;
> @@ -91,9 +171,8 @@ EXPORT_SYMBOL_NS(sdw_intel_thread, SOUNDWIRE_INTEL_INIT);
>   static struct sdw_intel_ctx
>   *sdw_intel_probe_controller(struct sdw_intel_res *res)
>   {
> -	struct platform_device_info pdevinfo;
> -	struct platform_device *pdev;
>   	struct sdw_intel_link_res *link;
> +	struct sdw_intel_link_dev *ldev;
>   	struct sdw_intel_ctx *ctx;
>   	struct acpi_device *adev;
>   	struct sdw_slave *slave;
> @@ -116,67 +195,60 @@ static struct sdw_intel_ctx
>   	count = res->count;
>   	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
>   
> -	ctx = devm_kzalloc(&adev->dev, sizeof(*ctx), GFP_KERNEL);
> +	/*
> +	 * we need to alloc/free memory manually and can't use devm:
> +	 * this routine may be called from a workqueue, and not from
> +	 * the parent .probe.
> +	 * If devm_ was used, the memory might never be freed on errors.
> +	 */
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return NULL;
>   
>   	ctx->count = count;
> -	ctx->links = devm_kcalloc(&adev->dev, ctx->count,
> -				  sizeof(*ctx->links), GFP_KERNEL);
> -	if (!ctx->links)
> +
> +	/*
> +	 * allocate the array of pointers. The link-specific data is allocated
> +	 * as part of the first loop below and released with the auxiliary_device_uninit().
> +	 * If some links are disabled, the link pointer will remain NULL. Given that the
> +	 * number of links is small, this is simpler than using a list to keep track of links.
> +	 */
> +	ctx->ldev = kcalloc(ctx->count, sizeof(*ctx->ldev), GFP_KERNEL);
> +	if (!ctx->ldev) {
> +		kfree(ctx);
>   		return NULL;
> +	}
>   
> -	ctx->count = count;
>   	ctx->mmio_base = res->mmio_base;
>   	ctx->link_mask = res->link_mask;
>   	ctx->handle = res->handle;
>   	mutex_init(&ctx->shim_lock);
>   
> -	link = ctx->links;
>   	link_mask = ctx->link_mask;
>   
>   	INIT_LIST_HEAD(&ctx->link_list);
>   
> -	/* Create SDW Master devices */
> -	for (i = 0; i < count; i++, link++) {
> -		if (!(link_mask & BIT(i))) {
> -			dev_dbg(&adev->dev,
> -				"Link %d masked, will not be enabled\n", i);
> +	for (i = 0; i < count; i++) {
> +		if (!(link_mask & BIT(i)))
>   			continue;
> -		}
>   
> -		link->mmio_base = res->mmio_base;
> -		link->registers = res->mmio_base + SDW_LINK_BASE
> -			+ (SDW_LINK_SIZE * i);
> -		link->shim = res->mmio_base + SDW_SHIM_BASE;
> -		link->alh = res->mmio_base + SDW_ALH_BASE;
> -
> -		link->ops = res->ops;
> -		link->dev = res->dev;
> -
> -		link->clock_stop_quirks = res->clock_stop_quirks;
> -		link->shim_lock = &ctx->shim_lock;
> -		link->shim_mask = &ctx->shim_mask;
> -		link->link_mask = link_mask;
> -
> -		memset(&pdevinfo, 0, sizeof(pdevinfo));
> -
> -		pdevinfo.parent = res->parent;
> -		pdevinfo.name = "intel-sdw";
> -		pdevinfo.id = i;
> -		pdevinfo.fwnode = acpi_fwnode_handle(adev);
> -		pdevinfo.data = link;
> -		pdevinfo.size_data = sizeof(*link);
> -
> -		pdev = platform_device_register_full(&pdevinfo);
> -		if (IS_ERR(pdev)) {
> -			dev_err(&adev->dev,
> -				"platform device creation failed: %ld\n",
> -				PTR_ERR(pdev));
> +		/*
> +		 * init and add a device for each link
> +		 *
> +		 * The name of the device will be soundwire_intel.link.[i],
> +		 * with the "soundwire_intel" module prefix automatically added
> +		 * by the auxiliary bus core.
> +		 */
> +		ldev = intel_link_dev_register(res,
> +					       ctx,
> +					       acpi_fwnode_handle(adev),
> +					       "link",
> +					       i);
> +		if (IS_ERR(ldev))
>   			goto err;
> -		}
> -		link->pdev = pdev;
> -		link->cdns = platform_get_drvdata(pdev);
> +
> +		link = &ldev->link_res;
> +		link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
>   
>   		if (!link->cdns) {
>   			dev_err(&adev->dev, "failed to get link->cdns\n");
> @@ -194,8 +266,7 @@ static struct sdw_intel_ctx
>   			num_slaves++;
>   	}
>   
> -	ctx->ids = devm_kcalloc(&adev->dev, num_slaves,
> -				sizeof(*ctx->ids), GFP_KERNEL);
> +	ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
>   	if (!ctx->ids)
>   		goto err;
>   
> @@ -213,8 +284,14 @@ static struct sdw_intel_ctx
>   	return ctx;
>   
>   err:
> -	ctx->count = i;
> -	sdw_intel_cleanup(ctx);
> +	while (i--) {
> +		if (!(link_mask & BIT(i)))
> +			continue;
> +		ldev = ctx->ldev[i];
> +		intel_link_dev_unregister(ldev);
> +	}
> +	kfree(ctx->ldev);
> +	kfree(ctx);
>   	return NULL;
>   }
>   
> @@ -222,7 +299,7 @@ static int
>   sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
>   {
>   	struct acpi_device *adev;
> -	struct sdw_intel_link_res *link;
> +	struct sdw_intel_link_dev *ldev;
>   	u32 caps;
>   	u32 link_mask;
>   	int i;
> @@ -241,27 +318,28 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
>   		return -EINVAL;
>   	}
>   
> -	if (!ctx->links)
> +	if (!ctx->ldev)
>   		return -EINVAL;
>   
> -	link = ctx->links;
>   	link_mask = ctx->link_mask;
>   
>   	/* Startup SDW Master devices */
> -	for (i = 0; i < ctx->count; i++, link++) {
> +	for (i = 0; i < ctx->count; i++) {
>   		if (!(link_mask & BIT(i)))
>   			continue;
>   
> -		intel_master_startup(link->pdev);
> +		ldev = ctx->ldev[i];
>   
> -		if (!link->clock_stop_quirks) {
> +		intel_link_startup(&ldev->auxdev);
> +
> +		if (!ldev->link_res.clock_stop_quirks) {
>   			/*
>   			 * we need to prevent the parent PCI device
>   			 * from entering pm_runtime suspend, so that
>   			 * power rails to the SoundWire IP are not
>   			 * turned off.
>   			 */
> -			pm_runtime_get_noresume(link->dev);
> +			pm_runtime_get_noresume(ldev->link_res.dev);
>   		}
>   	}
>   
> @@ -272,8 +350,8 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
>    * sdw_intel_probe() - SoundWire Intel probe routine
>    * @res: resource data
>    *
> - * This registers a platform device for each Master handled by the controller,
> - * and SoundWire Master and Slave devices will be created by the platform
> + * This registers an auxiliary device for each Master handled by the controller,
> + * and SoundWire Master and Slave devices will be created by the auxiliary
>    * device probe. All the information necessary is stored in the context, and
>    * the res argument pointer can be freed after this step.
>    * This function will be called after sdw_intel_acpi_scan() by SOF probe.
> @@ -306,27 +384,31 @@ EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
>   void sdw_intel_exit(struct sdw_intel_ctx *ctx)
>   {
>   	sdw_intel_cleanup(ctx);
> +	kfree(ctx->ids);
> +	kfree(ctx->ldev);
> +	kfree(ctx);
>   }
>   EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
>   
>   void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
>   {
> -	struct sdw_intel_link_res *link;
> +	struct sdw_intel_link_dev *ldev;
>   	u32 link_mask;
>   	int i;
>   
> -	if (!ctx->links)
> +	if (!ctx->ldev)
>   		return;
>   
> -	link = ctx->links;
>   	link_mask = ctx->link_mask;
>   
>   	/* Startup SDW Master devices */
> -	for (i = 0; i < ctx->count; i++, link++) {
> +	for (i = 0; i < ctx->count; i++) {
>   		if (!(link_mask & BIT(i)))
>   			continue;
>   
> -		intel_master_process_wakeen_event(link->pdev);
> +		ldev = ctx->ldev[i];
> +
> +		intel_link_process_wakeen_event(&ldev->auxdev);
>   	}
>   }
>   EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, SOUNDWIRE_INTEL_INIT);
> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
> index 3a5446ac014a..1ebea7764011 100644
> --- a/include/linux/soundwire/sdw_intel.h
> +++ b/include/linux/soundwire/sdw_intel.h
> @@ -58,7 +58,7 @@ struct sdw_intel_acpi_info {
>   	u32 link_mask;
>   };
>   
> -struct sdw_intel_link_res;
> +struct sdw_intel_link_dev;
>   
>   /* Intel clock-stop/pm_runtime quirk definitions */
>   
> @@ -109,7 +109,7 @@ struct sdw_intel_slave_id {
>    * Controller
>    * @num_slaves: total number of devices exposed across all enabled links
>    * @handle: ACPI parent handle
> - * @links: information for each link (controller-specific and kept
> + * @ldev: information for each link (controller-specific and kept
>    * opaque here)
>    * @ids: array of slave_id, representing Slaves exposed across all enabled
>    * links
> @@ -123,7 +123,7 @@ struct sdw_intel_ctx {
>   	u32 link_mask;
>   	int num_slaves;
>   	acpi_handle handle;
> -	struct sdw_intel_link_res *links;
> +	struct sdw_intel_link_dev **ldev;
>   	struct sdw_intel_slave_id *ids;
>   	struct list_head link_list;
>   	struct mutex shim_lock; /* lock for access to shared SHIM registers */
> 
