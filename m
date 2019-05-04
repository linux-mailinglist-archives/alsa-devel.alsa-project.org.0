Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01A13809
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 09:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 586D718A2;
	Sat,  4 May 2019 09:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 586D718A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556953496;
	bh=Q2Xn9TqubxhWuSeveKAbCVdLeVf+t0OxMeIfL0+YOQA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2pOLrHav+rh+enTjLEjlCpDGrfh3eo/JeHhek1cnrYzaDwPKS2Q3w6bhEKoQKt1s
	 aKNmD6wFoH3JFwQIz/5d3iDTNIWl0CYYsnb+L0XmjrRI3kuVjSgoH0u71sAmtHOJQT
	 4tObjaBGrbXZ6z7k/p9IdW8Z0kuqi7CMDuTgSrbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6166F896EA;
	Sat,  4 May 2019 09:03:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD0EF896C7; Sat,  4 May 2019 09:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35266F8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 09:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35266F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UlBxcMSl"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88B76206BB;
 Sat,  4 May 2019 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556953384;
 bh=sXbtYibp2p82ZEMWfkVij5F53AYPs3taZYEI8b3acMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UlBxcMSl18baoUmB+fjRt5KOmpxNR9MVvpprpv01/4kaQUPpXxdt1amqOcY79k+gO
 K2Y+d8/AoHQZw+YfeLkOGZGghEKSlv+QHmUdYtwjb7fKGex8uKHAd7AXbEGz6W7Fnh
 6Pfxs+LR6sGXNrDg/zfuYmf08WJ0Coxo24n4bAxI=
Date: Sat, 4 May 2019 09:03:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190504070301.GD9770@kroah.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504010030.29233-6-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 5/7] soundwire: add debugfs support
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

On Fri, May 03, 2019 at 08:00:28PM -0500, Pierre-Louis Bossart wrote:
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
>  drivers/soundwire/Makefile    |   3 +-
>  drivers/soundwire/bus.c       |   5 +
>  drivers/soundwire/bus.h       |  28 +++++
>  drivers/soundwire/bus_type.c  |   3 +
>  drivers/soundwire/debugfs.c   | 214 ++++++++++++++++++++++++++++++++++
>  drivers/soundwire/slave.c     |   1 +
>  include/linux/soundwire/sdw.h |   9 ++
>  7 files changed, 262 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soundwire/debugfs.c
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index a72a29731a28..f2c425fa15bd 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,7 +4,8 @@
>  
>  #Bus Objs
>  soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
> -			sysfs.o sysfs_slave_dp0.o sysfs_slave_dpn.o
> +			sysfs.o sysfs_slave_dp0.o sysfs_slave_dpn.o  \
> +			debugfs.o
>  obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
>  
>  #Cadence Objs
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index dd9181693554..b79eba321b71 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -53,6 +53,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>  	if (ret < 0)
>  		dev_warn(bus->dev, "Bus sysfs init failed:%d\n", ret);
>  
> +	bus->debugfs = sdw_bus_debugfs_init(bus);
> +
>  	/*
>  	 * Device numbers in SoundWire are 0 through 15. Enumeration device
>  	 * number (0), Broadcast device number (15), Group numbers (12 and
> @@ -114,6 +116,7 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  	struct sdw_bus *bus = slave->bus;
>  
>  	sdw_sysfs_slave_exit(slave);
> +	sdw_slave_debugfs_exit(slave->debugfs);
>  
>  	mutex_lock(&bus->bus_lock);
>  
> @@ -136,6 +139,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  void sdw_delete_bus_master(struct sdw_bus *bus)
>  {
>  	sdw_sysfs_bus_exit(bus);
> +	if (bus->debugfs)
> +		sdw_bus_debugfs_exit(bus->debugfs);

No need to check, just call it.

>  
>  	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
>  }
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 0707e68a8d21..f0b1f4f9d7b2 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -20,6 +20,34 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
>  
>  extern const struct attribute_group *sdw_slave_dev_attr_groups[];
>  
> +#ifdef CONFIG_DEBUG_FS
> +struct sdw_bus_debugfs *sdw_bus_debugfs_init(struct sdw_bus *bus);
> +void sdw_bus_debugfs_exit(struct sdw_bus_debugfs *d);
> +struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d);
> +struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave);
> +void sdw_slave_debugfs_exit(struct sdw_slave_debugfs *d);
> +void sdw_debugfs_init(void);
> +void sdw_debugfs_exit(void);
> +#else
> +struct sdw_bus_debugfs *sdw_bus_debugfs_init(struct sdw_bus *bus)
> +{ return NULL; }
> +
> +void sdw_bus_debugfs_exit(struct sdw_bus_debugfs *d) {}
> +
> +struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
> +{ return NULL; }
> +
> +struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave)
> +{ return NULL; }
> +
> +void sdw_slave_debugfs_exit(struct sdw_slave_debugfs *d) {}
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
> index f68fe45c1037..f28c1a2446af 100644
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
> @@ -182,11 +183,13 @@ EXPORT_SYMBOL_GPL(sdw_unregister_driver);
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
> index 000000000000..8a8b4df95c46
> --- /dev/null
> +++ b/drivers/soundwire/debugfs.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +// Copyright(c) 2017-19 Intel Corporation.
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
> +
> +struct sdw_bus_debugfs {
> +	struct sdw_bus *bus;

Why do you need to save this pointer?

> +	struct dentry *fs;

This really is all you need to have around, right?

> +};
> +
> +struct sdw_bus_debugfs *sdw_bus_debugfs_init(struct sdw_bus *bus)
> +{
> +	struct sdw_bus_debugfs *d;
> +	char name[16];
> +
> +	if (!sdw_debugfs_root)
> +		return NULL;
> +
> +	d = kzalloc(sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return NULL;
> +
> +	/* create the debugfs master-N */
> +	snprintf(name, sizeof(name), "master-%d", bus->link_id);
> +	d->fs = debugfs_create_dir(name, sdw_debugfs_root);
> +	if (IS_ERR_OR_NULL(d->fs)) {
> +		dev_err(bus->dev, "debugfs root creation failed\n");
> +		goto err;
> +	}
> +
> +	d->bus = bus;
> +
> +	return d;
> +
> +err:
> +	kfree(d);
> +	return NULL;
> +}
> +
> +void sdw_bus_debugfs_exit(struct sdw_bus_debugfs *d)
> +{
> +	debugfs_remove_recursive(d->fs);
> +	kfree(d);
> +}
> +
> +struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
> +{
> +	if (d)
> +		return d->fs;
> +	return NULL;
> +}
> +EXPORT_SYMBOL(sdw_bus_debugfs_get_root);

_GPL()?

But why is this exported at all?  No one calls this function.

> +struct sdw_slave_debugfs {
> +	struct sdw_slave *slave;

Same question as above, why do you need this pointer?

And meta-comment, if you _EVER_ save off a pointer to a reference
counted object (like this and the above one), you HAVE to grab a
reference to it, otherwise it can go away at any point in time as that
is the point of reference counted objects.

So even if you do need/want this, you have to properly handle the
reference count by incrementing/decrementing it as needed.

> +
> +	struct dentry *fs;
> +};
> +
> +#define RD_BUF (3 * PAGE_SIZE)
> +
> +static ssize_t sdw_sprintf(struct sdw_slave *slave,
> +			   char *buf, size_t pos, unsigned int reg)
> +{
> +	int value;
> +
> +	value = sdw_read(slave, reg);
> +
> +	if (value < 0)
> +		return scnprintf(buf + pos, RD_BUF - pos, "%3x\tXX\n", reg);
> +	else
> +		return scnprintf(buf + pos, RD_BUF - pos,
> +				"%3x\t%2x\n", reg, value);
> +}
> +
> +static ssize_t sdw_slave_reg_read(struct file *file, char __user *user_buf,
> +				  size_t count, loff_t *ppos)
> +{
> +	struct sdw_slave *slave = file->private_data;
> +	unsigned int reg;
> +	char *buf;
> +	ssize_t ret;
> +	int i, j;
> +
> +	buf = kzalloc(RD_BUF, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP0\n");
> +
> +	for (i = 0; i < 6; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
> +	ret += sdw_sprintf(slave, buf, ret, SDW_DP0_CHANNELEN);
> +	for (i = SDW_DP0_SAMPLECTRL1; i <= SDW_DP0_LANECTRL; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
> +	ret += sdw_sprintf(slave, buf, ret,
> +			SDW_DP0_CHANNELEN + SDW_BANK1_OFFSET);
> +	for (i = SDW_DP0_SAMPLECTRL1 + SDW_BANK1_OFFSET;
> +			i <= SDW_DP0_LANECTRL + SDW_BANK1_OFFSET; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nSCP\n");
> +	for (i = SDW_SCP_INT1; i <= SDW_SCP_BANKDELAY; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +	for (i = SDW_SCP_DEVID_0; i <= SDW_SCP_DEVID_5; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_FRAMECTRL_B0);
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_NEXTFRAME_B0);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_FRAMECTRL_B1);
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_NEXTFRAME_B1);
> +
> +	for (i = 1; i < 14; i++) {
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP%d\n", i);
> +		reg = SDW_DPN_INT(i);
> +		for (j = 0; j < 6; j++)
> +			ret += sdw_sprintf(slave, buf, ret, reg + j);
> +
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
> +		reg = SDW_DPN_CHANNELEN_B0(i);
> +		for (j = 0; j < 9; j++)
> +			ret += sdw_sprintf(slave, buf, ret, reg + j);
> +
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
> +		reg = SDW_DPN_CHANNELEN_B1(i);
> +		for (j = 0; j < 9; j++)
> +			ret += sdw_sprintf(slave, buf, ret, reg + j);
> +	}
> +
> +	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations sdw_slave_reg_fops = {
> +	.open = simple_open,
> +	.read = sdw_slave_reg_read,
> +	.llseek = default_llseek,
> +};
> +
> +struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave)
> +{
> +	struct sdw_bus_debugfs *master;
> +	struct sdw_slave_debugfs *d;
> +	char name[32];
> +
> +	master = slave->bus->debugfs;
> +	if (!master)
> +		return NULL;
> +
> +	d = kzalloc(sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return NULL;
> +
> +	/* create the debugfs slave-name */
> +	snprintf(name, sizeof(name), "%s", dev_name(&slave->dev));
> +	d->fs = debugfs_create_dir(name, master->fs);
> +	if (IS_ERR_OR_NULL(d->fs)) {
> +		dev_err(&slave->dev, "slave debugfs root creation failed\n");
> +		goto err;
> +	}

You never care about the return value of a debugfs call.  I have a 100+
patch series stripping all of this out of the kernel, please don't force
me to add another one to it :)

Just call debugfs and move on, you can always put the return value of
one call into another one just fine, and your function logic should
never change if debugfs returns an error or not, you do not care.

> +
> +	d->slave = slave;
> +
> +	debugfs_create_file("registers", 0400, d->fs,
> +			    slave, &sdw_slave_reg_fops);
> +
> +	return d;
> +
> +err:
> +	kfree(d);
> +	return NULL;
> +}
> +
> +void sdw_slave_debugfs_exit(struct sdw_slave_debugfs *d)
> +{
> +	debugfs_remove_recursive(d->fs);
> +	kfree(d);
> +}
> +
> +void sdw_debugfs_init(void)
> +{
> +	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
> +	if (IS_ERR_OR_NULL(sdw_debugfs_root)) {
> +		pr_warn("SoundWire: Failed to create debugfs directory\n");
> +		sdw_debugfs_root = NULL;
> +		return;

Same here, just call the function and return.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
