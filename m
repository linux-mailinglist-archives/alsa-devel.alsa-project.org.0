Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA211DEAB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 08:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4994E1769;
	Fri, 13 Dec 2019 08:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4994E1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576222240;
	bh=IuJzB9XvY3m04FXZ2zkC6IgrpgZOMjCqkLqRGv++Cqs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jAXUjPb0HsFORS7MBhx2VddqNuVPPBB3gLRRuXjdFdDnLsyQA1ZC+jjSKhz/TYBnI
	 EWosuexcUiOv88bFXCrcnAhrA4Z90yc0J/597OVgfyOwIFoKRz0Rkx69JH++Z/EIzs
	 EpxES2EYHoCau2z27PH0Pg+k/pU0LH+TI2CHQ0ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99542F80139;
	Fri, 13 Dec 2019 08:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D0D9F801F4; Fri, 13 Dec 2019 08:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A146EF80139
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 08:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A146EF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sYKrOiMI"
Received: from localhost (unknown [84.241.199.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C5F622527;
 Fri, 13 Dec 2019 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576222128;
 bh=+niX70uV+yPF/oKnmdkLlo2kitdtTy/DXb5H25cB5w0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYKrOiMI/Nqdsc/Xg42qiUTyoR+F/KAKK6aIRJsw0OlRDnLTDvIHSicpVWFTDy1He
 wL3Vjx6+f1sN0VP2LfFbWUgFlUFUN16ROzbnuRNydtuILYWcJpVKU2QR1jKXPzS/MC
 pdlOJk3LwOAPsEQybRoqFOFoGTqZSfuSX11nkFPg=
Date: Fri, 13 Dec 2019 08:28:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191213072844.GF1750354@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 08/15] soundwire: add initial
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

On Thu, Dec 12, 2019 at 11:04:02PM -0600, Pierre-Louis Bossart wrote:
> Since we want an explicit support for the SoundWire Master device, add
> the definitions, following the Grey Bus example.

"Greybus"  All one word please.

> 
> Unlike for the Slave device, we do not set a variable when dealing
> with the master uevent.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile         |  2 +-
>  drivers/soundwire/bus_type.c       |  7 +++-
>  drivers/soundwire/master.c         | 62 ++++++++++++++++++++++++++++++
>  include/linux/soundwire/sdw.h      | 35 +++++++++++++++++
>  include/linux/soundwire/sdw_type.h |  9 +++++
>  5 files changed, 112 insertions(+), 3 deletions(-)
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
> index 5c18c21545b5..df1271f6db61 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -59,9 +59,12 @@ int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  
>  		if (add_uevent_var(env, "MODALIAS=%s", modalias))
>  			return -ENOMEM;
> +	} else if (is_sdw_md(dev)) {

Ok, "is_sdw_md()" is a horrid function name.  Spell it out please, this
ends up in the global namespace.

Actually, why are you not using module namespaces here for this new
code?  That would help you out a lot.


> +		/* this should not happen but throw an error */
> +		dev_warn(dev, "uevent for Master device, unsupported\n");

Um, what?  This is supported as it will happen when you create such a
device.  It's an issue of "I didn't write the code yet", not that it is
not "supported".

> +		return -EINVAL;
>  	} else {
> -		/* only Slave device type supported */
> -		dev_warn(dev, "uevent for unknown Soundwire type\n");
> +		dev_warn(dev, "uevent for unknown device\n");
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
> new file mode 100644
> index 000000000000..6210098c892b
> --- /dev/null
> +++ b/drivers/soundwire/master.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

Still with the crazy dual license?  I thought we went over this all
before.

You can not do this for code that touches driver core stuff, like this.
Please stop and just make all of this GPLv2 like we discussed months
ago.

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

Bad function names, please spell things out, you have plenty of
characters to go around.


> +				     struct device *parent,
> +				     struct fwnode_handle *fwnode,
> +				     int link_id)
> +{
> +	struct sdw_master_device *md;
> +	int ret;
> +
> +	if (!driver->probe) {
> +		dev_err(parent, "mandatory probe callback missing\n");

The callback is missing for the driver you passed in, not for the
parent, right?

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

But you still return a valid pointer?  Why????

> +	}
> +
> +	return md;
> +}
> +EXPORT_SYMBOL(sdw_md_add);

EXPORT_SYMBOL_GPL()?


> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 5b1180f1e6b5..af0a72e7afdf 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -585,6 +585,16 @@ struct sdw_slave {
>  #define to_sdw_slave_device(d) \
>  	container_of(d, struct sdw_slave, dev)
>  
> +struct sdw_master_device {
> +	struct device dev;
> +	int link_id;
> +	struct sdw_md_driver *driver;
> +	void *pdata; /* core does not touch */

Core of what?

> +};
> +
> +#define to_sdw_master_device(d)	\
> +	container_of(d, struct sdw_master_device, dev)
> +
>  struct sdw_driver {
>  	const char *name;
>  
> @@ -599,6 +609,26 @@ struct sdw_driver {
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

Use kerneldoc comments for this to make it easier to understand and for
others to read?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
