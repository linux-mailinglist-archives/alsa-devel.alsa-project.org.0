Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AACED24C
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Nov 2019 07:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAFE18BC;
	Sun,  3 Nov 2019 07:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAFE18BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572762770;
	bh=DLic6YtLRDRg5C+FZ83sFqRIMuYZ4nROTIr8mJAyc2k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLpH4mjNTPmLjqa8y3FVDZ9Oss9ry85kR+0e7//rO4JWPsx3SCgh5gkZYXOwuUPQ3
	 iMJ9vJbJBFx+6bFN5z4D0HuyG48/WBHfmQIM0sOm0iOb/SJ58eIxse4nAb13iAgOK0
	 HqdaEUenxD2O7hIBHHEOMoB/FBMkFMLxGojf2GzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27624F805AE;
	Sun,  3 Nov 2019 07:31:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6DCAF80535; Sun,  3 Nov 2019 07:31:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A03F80368
 for <alsa-devel@alsa-project.org>; Sun,  3 Nov 2019 07:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A03F80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L9Vs1KFV"
Received: from localhost (unknown [106.206.31.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B16892084D;
 Sun,  3 Nov 2019 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572762658;
 bh=TTaEmdSMoXFvWJB8M9tF7dDrCSl0UeZB4Ed8rEoKX+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L9Vs1KFVvTRE29YW4iQUNjc5yulAUWAWx7E9qgfAEIoK9iDbYiYW0/6lmNH39iV47
 q4lQIa3d7XE2ukY4rdyctuAAFZf6I4V/EqOgS8mRDucr2waG1rPWGgtTfpyRYaN18n
 V8fB9LecZMCZQA1acVt/BkeIJ3nArcij2sJy99eY=
Date: Sun, 3 Nov 2019 12:00:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191103063051.GJ2695@vkoul-mobl.Dlink>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023212823.608-8-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 07/14] soundwire: add initial definitions
 for sdw_master_device
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

On 23-10-19, 16:28, Pierre-Louis Bossart wrote:
> Since we want an explicit support for the SoundWire Master device, add
> the definitions, following the Grey Bus example.
> 
> Open: do we need to set a variable when dealing with the master uevent?

I dont think we want that or we need that!

And to prevent that rather than adding a variable, can you please
modify the device_type and use separate ones for master_device and
slave_device

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile         |  2 +-
>  drivers/soundwire/bus_type.c       | 16 +++++---
>  drivers/soundwire/master.c         | 62 ++++++++++++++++++++++++++++++
>  include/linux/soundwire/sdw.h      | 35 +++++++++++++++++
>  include/linux/soundwire/sdw_type.h |  9 +++++
>  5 files changed, 117 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/soundwire/master.c
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 563894e5ecaf..89b29819dd3a 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,7 +4,7 @@
>  #
>  
>  #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o
>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>  
>  ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 5df095f4e12f..cf33f63773f0 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -49,21 +49,25 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  
>  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> +	struct sdw_master_device *md;
>  	struct sdw_slave *slave;
>  	char modalias[32];
>  
> -	if (is_sdw_slave(dev)) {
> +	if (is_sdw_md(dev)) {
> +		md = to_sdw_master_device(dev);

md seems unused?

> +		/* TODO: do we need to call add_uevent_var() ? */
> +	} else if (is_sdw_slave(dev)) {
>  		slave = to_sdw_slave_device(dev);
> +
> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
> +
> +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
> +			return -ENOMEM;
>  	} else {
>  		dev_warn(dev, "uevent for unknown Soundwire type\n");
>  		return -EINVAL;
>  	}
>  
> -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> -
> -	if (add_uevent_var(env, "MODALIAS=%s", modalias))
> -		return -ENOMEM;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
> new file mode 100644
> index 000000000000..6210098c892b
> --- /dev/null
> +++ b/drivers/soundwire/master.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +// Copyright(c) 2019 Intel Corporation.
> +
> +#include <linux/device.h>
> +#include <linux/acpi.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include "bus.h"
> +
> +static void sdw_md_release(struct device *dev)
> +{
> +	struct sdw_master_device *md = to_sdw_master_device(dev);
> +
> +	kfree(md);
> +}
> +
> +struct device_type sdw_md_type = {
> +	.name =		"soundwire_master",
> +	.release =	sdw_md_release,
> +};
> +
> +struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
> +				     struct device *parent,
> +				     struct fwnode_handle *fwnode,
> +				     int link_id)
> +{
> +	struct sdw_master_device *md;
> +	int ret;
> +
> +	if (!driver->probe) {
> +		dev_err(parent, "mandatory probe callback missing\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	md = kzalloc(sizeof(*md), GFP_KERNEL);
> +	if (!md)
> +		return ERR_PTR(-ENOMEM);
> +
> +	md->link_id = link_id;
> +
> +	md->driver = driver;
> +
> +	md->dev.parent = parent;
> +	md->dev.fwnode = fwnode;
> +	md->dev.bus = &sdw_bus_type;
> +	md->dev.type = &sdw_md_type;
> +	md->dev.dma_mask = md->dev.parent->dma_mask;
> +	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
> +
> +	ret = device_register(&md->dev);
> +	if (ret) {
> +		dev_err(parent, "Failed to add master: ret %d\n", ret);
> +		/*
> +		 * On err, don't free but drop ref as this will be freed
> +		 * when release method is invoked.
> +		 */
> +		put_device(&md->dev);
> +	}
> +
> +	return md;
> +}
> +EXPORT_SYMBOL(sdw_md_add);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index d6e5a0e42819..6f8b6a0cbcb7 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -573,6 +573,16 @@ struct sdw_slave {
>  #define to_sdw_slave_device(d) \
>  	container_of(d, struct sdw_slave, dev)
>  
> +struct sdw_master_device {
> +	struct device dev;
> +	int link_id;
> +	struct sdw_md_driver *driver;
> +	void *pdata; /* core does not touch */

what is the use for this, also please add kernel-doc style comments for
core structs

> +};
> +
> +#define to_sdw_master_device(d)	\
> +	container_of(d, struct sdw_master_device, dev)
> +
>  struct sdw_driver {
>  	const char *name;
>  
> @@ -587,6 +597,26 @@ struct sdw_driver {
>  	struct device_driver driver;
>  };
>  
> +struct sdw_md_driver {
> +	/* initializations and allocations */
> +	int (*probe)(struct sdw_master_device *md, void *link_ctx);
> +	/* hardware enablement, all clock/power dependencies are available */
> +	int (*startup)(struct sdw_master_device *md);
> +	/* hardware disabled */
> +	int (*shutdown)(struct sdw_master_device *md);
> +	/* free all resources */
> +	int (*remove)(struct sdw_master_device *md);
> +	/*
> +	 * enable/disable driver control while in clock-stop mode,
> +	 * typically in always-on/D0ix modes. When the driver yields
> +	 * control, another entity in the system (typically firmware
> +	 * running on an always-on microprocessor) is responsible to
> +	 * tracking Slave-initiated wakes
> +	 */
> +	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
> +					    bool state);
> +};
> +
>  #define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
>  	{ .mfg_id = (_mfg_id), .part_id = (_part_id), \
>  	  .driver_data = (unsigned long)(_drv_data) }
> @@ -776,6 +806,11 @@ struct sdw_bus {
>  int sdw_add_bus_master(struct sdw_bus *bus);
>  void sdw_delete_bus_master(struct sdw_bus *bus);
>  
> +struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
> +				     struct device *parent,
> +				     struct fwnode_handle *fwnode,
> +				     int link_id);
> +
>  /**
>   * sdw_port_config: Master or Slave Port configuration
>   *
> diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
> index c681b3426478..463d6d018d56 100644
> --- a/include/linux/soundwire/sdw_type.h
> +++ b/include/linux/soundwire/sdw_type.h
> @@ -6,15 +6,24 @@
>  
>  extern struct bus_type sdw_bus_type;
>  extern struct device_type sdw_slave_type;
> +extern struct device_type sdw_md_type;
>  
>  static inline int is_sdw_slave(const struct device *dev)
>  {
>  	return dev->type == &sdw_slave_type;
>  }
>  
> +static inline int is_sdw_md(const struct device *dev)
> +{
> +	return dev->type == &sdw_md_type;
> +}
> +
>  #define to_sdw_slave_driver(_drv) \
>  	container_of(_drv, struct sdw_driver, driver)
>  
> +#define to_sdw_md_driver(_drv) \
> +	container_of(_drv, struct sdw_md_driver, driver)
> +
>  #define sdw_register_slave_driver(drv) \
>  	__sdw_register_slave_driver(drv, THIS_MODULE)
>  
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
