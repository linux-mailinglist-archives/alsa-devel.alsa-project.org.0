Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F076B05
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFC02016;
	Fri, 26 Jul 2019 16:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFC02016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564149916;
	bh=7c0VVwW40jr/xgEhd5wwu389hwdsB8aU6fQ98Z5QsbI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eEPwycX59IKAAw6RH36q4fHW4d8hMXz7bongez5cW+Po3Yz7aX19W67shdJoV96hx
	 F9QS9GUO8RKBCXfI/XxIUUgZTDZn36/sbUnhY70Y02/ms7Uyro0mK097fG4FAcmp1W
	 i2VGBNA7EFNRa3Ofmp2GzUXhDHvQBMZ+4Oun/laI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3D21F803D6;
	Fri, 26 Jul 2019 16:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EBFAF80393; Fri, 26 Jul 2019 16:04:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794DBF80368
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 794DBF80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xSqtm2V4"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AC08216B7;
 Fri, 26 Jul 2019 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564149854;
 bh=z2tICJ/pBRX3sO9g7iIlHb6OfAEfjoKN4VjM1iN4HJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xSqtm2V4xb0u8cJrqZlBaV6cYegcNBSqL1kXKSeVIRlq/7QGMK5bQ0QqY+LsvRb4x
 /gR3MTEYLk2NzblLMNrDTeQODFHMPIaDiMwBetI7X6UXLXl79nUu2IOU6AoFsbWxgm
 plyF0zC0tFU4ejg9UPFatdaguT6NL06QnOA2lSug=
Date: Fri, 26 Jul 2019 16:04:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726140411.GA8767@kroah.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 01/40] soundwire: add debugfs support
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

On Thu, Jul 25, 2019 at 06:39:53PM -0500, Pierre-Louis Bossart wrote:
> Add base debugfs mechanism for SoundWire bus by creating soundwire
> root and master-N and slave-x hierarchy.
> 
> Also add SDW Slave SCP, DP0 and DP-N register debug file.
> 
> Registers not implemented will print as "XX"
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
> is the use of scnprintf to avoid known issues with snprintf.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile    |   4 +-
>  drivers/soundwire/bus.c       |   6 ++
>  drivers/soundwire/bus.h       |  24 ++++++
>  drivers/soundwire/bus_type.c  |   3 +
>  drivers/soundwire/debugfs.c   | 156 ++++++++++++++++++++++++++++++++++
>  drivers/soundwire/slave.c     |   1 +
>  include/linux/soundwire/sdw.h |   4 +
>  7 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soundwire/debugfs.c
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index fd99a831b92a..88990cac48a7 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,7 +4,9 @@
>  #
>  
>  #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
> +			debugfs.o
> +
>  obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
>  
>  #Cadence Objs
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fe745830a261..5ad4109dc72f 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -49,6 +49,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>  		}
>  	}
>  
> +	bus->debugfs = sdw_bus_debugfs_init(bus);
> +
>  	/*
>  	 * Device numbers in SoundWire are 0 through 15. Enumeration device
>  	 * number (0), Broadcast device number (15), Group numbers (12 and
> @@ -109,6 +111,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>  	struct sdw_bus *bus = slave->bus;
>  
> +	sdw_slave_debugfs_exit(slave->debugfs);
> +
>  	mutex_lock(&bus->bus_lock);
>  
>  	if (slave->dev_num) /* clear dev_num if assigned */
> @@ -130,6 +134,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  void sdw_delete_bus_master(struct sdw_bus *bus)
>  {
>  	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
> +
> +	sdw_bus_debugfs_exit(bus->debugfs);
>  }
>  EXPORT_SYMBOL(sdw_delete_bus_master);
>  
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 3048ca153f22..06ac4adb0074 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -18,6 +18,30 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  void sdw_extract_slave_id(struct sdw_bus *bus,
>  			  u64 addr, struct sdw_slave_id *id);
>  
> +#ifdef CONFIG_DEBUG_FS
> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus);
> +void sdw_bus_debugfs_exit(struct dentry *d);
> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave);
> +void sdw_slave_debugfs_exit(struct dentry *d);
> +void sdw_debugfs_init(void);
> +void sdw_debugfs_exit(void);
> +#else
> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
> +{ return NULL; }
> +
> +void sdw_bus_debugfs_exit(struct dentry *d) {}
> +
> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave)
> +{ return NULL; }
> +
> +void sdw_slave_debugfs_exit(struct dentry *d) {}
> +
> +void sdw_debugfs_init(void) {}
> +
> +void sdw_debugfs_exit(void) {}
> +
> +#endif
> +
>  enum {
>  	SDW_MSG_FLAG_READ = 0,
>  	SDW_MSG_FLAG_WRITE,
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 2655602f0cfb..4a465f55039f 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -6,6 +6,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include "bus.h"
>  
>  /**
>   * sdw_get_device_id - find the matching SoundWire device id
> @@ -177,11 +178,13 @@ EXPORT_SYMBOL_GPL(sdw_unregister_driver);
>  
>  static int __init sdw_bus_init(void)
>  {
> +	sdw_debugfs_init();
>  	return bus_register(&sdw_bus_type);
>  }
>  
>  static void __exit sdw_bus_exit(void)
>  {
> +	sdw_debugfs_exit();
>  	bus_unregister(&sdw_bus_type);
>  }
>  
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> new file mode 100644
> index 000000000000..8d86e100516e
> --- /dev/null
> +++ b/drivers/soundwire/debugfs.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

No, for debugfs-specific code, that dual license makes no sense, right?
Don't cargo-cult SPDX identifiers please.

> +// Copyright(c) 2017-19 Intel Corporation.

Spell the year out fully unless you want lawyers knocking on your door :)

> +
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/slab.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include "bus.h"
> +
> +#ifdef CONFIG_DEBUG_FS
> +struct dentry *sdw_debugfs_root;
> +#endif

This whole file is not built if that option is not enabled, so why the
#ifdef?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
