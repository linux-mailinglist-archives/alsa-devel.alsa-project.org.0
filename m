Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2695E137F6
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 08:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990601893;
	Sat,  4 May 2019 08:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990601893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556952878;
	bh=bvGuNYVuxNUbVGyAWxBpyrelGTCIz1NNHnGmqCY3xaY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjGYlbFiijJ/U6dWa7MQi9G+Vz8IS2//dhMDw34ZIwzunOU0W9BtXEdRpadSFi2IF
	 /a590lluf3LQMlcs2GuzWbsN3nmYDgG8R1G/Q79Vn/vc06pzCGlSJuG+iWgVBcbV0X
	 G5vgYCemFDIqXC8lSAGtt0HNfPs3sthSzpgwdijM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A525F896EA;
	Sat,  4 May 2019 08:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE8DBF896C7; Sat,  4 May 2019 08:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87A43F80726
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 08:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87A43F80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r+amz0Ks"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4501D206BB;
 Sat,  4 May 2019 06:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556952764;
 bh=OIojZSlxyC63aqS84fLSv4UBNqCD0M7zHuCfCW1nsps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r+amz0KsZ+UtargRmhxQG7bKm6sFs4S2BJyWBv8rrntvAJoe5g44o9n+t1ePAzdPi
 tnUAIn/+nhS2FRJf29+w8yEtJoW7jh+ecQZN6q7I8hYKQDl1C99N5xgogOQRk7jLew
 5tuPMW9TnAuj6mzV5K6RDN4VOdW6P8+mGC0FkEF8=
Date: Sat, 4 May 2019 08:52:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190504065242.GA9770@kroah.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 1/7] soundwire: Add sysfs support for
	master(s)
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

On Fri, May 03, 2019 at 08:00:24PM -0500, Pierre-Louis Bossart wrote:
> For each master N, add a device sdw-master:N and add the
> master properties as attributes.
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile    |   3 +-
>  drivers/soundwire/bus.c       |   6 ++
>  drivers/soundwire/sysfs.c     | 162 ++++++++++++++++++++++++++++++++++
>  include/linux/soundwire/sdw.h |  10 +++
>  4 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soundwire/sysfs.c
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 5817beaca0e1..787f1cbf342c 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -3,7 +3,8 @@
>  #
>  
>  #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
> +			sysfs.o
>  obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
>  
>  #Cadence Objs
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fe745830a261..38de7071e135 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -49,6 +49,10 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>  		}
>  	}
>  
> +	ret = sdw_sysfs_bus_init(bus);
> +	if (ret < 0)
> +		dev_warn(bus->dev, "Bus sysfs init failed:%d\n", ret);
> +
>  	/*
>  	 * Device numbers in SoundWire are 0 through 15. Enumeration device
>  	 * number (0), Broadcast device number (15), Group numbers (12 and
> @@ -129,6 +133,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>   */
>  void sdw_delete_bus_master(struct sdw_bus *bus)
>  {
> +	sdw_sysfs_bus_exit(bus);
> +
>  	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
>  }
>  EXPORT_SYMBOL(sdw_delete_bus_master);
> diff --git a/drivers/soundwire/sysfs.c b/drivers/soundwire/sysfs.c
> new file mode 100644
> index 000000000000..7b6c3826a73a
> --- /dev/null
> +++ b/drivers/soundwire/sysfs.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +// Copyright(c) 2015-19 Intel Corporation.
> +
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include "bus.h"
> +
> +struct sdw_master_sysfs {
> +	struct device dev;
> +	struct sdw_bus *bus;
> +};
> +
> +#define to_sdw_device(_dev) \
> +	container_of(_dev, struct sdw_master_sysfs, dev)
> +
> +/*
> + * The sysfs for properties reflects the MIPI description as given
> + * in the MIPI DisCo spec
> + *
> + * Base file is:
> + *	sdw-master-N
> + *      |---- revision
> + *      |---- clk_stop_modes
> + *      |---- max_clk_freq
> + *      |---- clk_freq
> + *      |---- clk_gears
> + *      |---- default_row
> + *      |---- default_col
> + *      |---- dynamic_shape
> + *      |---- err_threshold
> + */
> +
> +#define sdw_master_attr(field, format_string)				\
> +static ssize_t field##_show(struct device *dev,				\
> +			    struct device_attribute *attr,		\
> +			    char *buf)					\
> +{									\
> +	struct sdw_master_sysfs *master = to_sdw_device(dev);		\
> +	return sprintf(buf, format_string, master->bus->prop.field);	\
> +}									\
> +static DEVICE_ATTR_RO(field)
> +
> +sdw_master_attr(revision, "0x%x\n");
> +sdw_master_attr(clk_stop_modes, "0x%x\n");
> +sdw_master_attr(max_clk_freq, "%d\n");
> +sdw_master_attr(default_row, "%d\n");
> +sdw_master_attr(default_col, "%d\n");
> +sdw_master_attr(default_frame_rate, "%d\n");
> +sdw_master_attr(dynamic_frame, "%d\n");
> +sdw_master_attr(err_threshold, "%d\n");
> +
> +static ssize_t clock_frequencies_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct sdw_master_sysfs *master = to_sdw_device(dev);
> +	ssize_t size = 0;
> +	int i;
> +
> +	for (i = 0; i < master->bus->prop.num_clk_freq; i++)
> +		size += sprintf(buf + size, "%8d ",
> +				master->bus->prop.clk_freq[i]);
> +	size += sprintf(buf + size, "\n");
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(clock_frequencies);
> +
> +static ssize_t clock_gears_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct sdw_master_sysfs *master = to_sdw_device(dev);
> +	ssize_t size = 0;
> +	int i;
> +
> +	for (i = 0; i < master->bus->prop.num_clk_gears; i++)
> +		size += sprintf(buf + size, "%8d ",
> +				master->bus->prop.clk_gears[i]);
> +	size += sprintf(buf + size, "\n");
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(clock_gears);
> +
> +static struct attribute *master_node_attrs[] = {
> +	&dev_attr_revision.attr,
> +	&dev_attr_clk_stop_modes.attr,
> +	&dev_attr_max_clk_freq.attr,
> +	&dev_attr_default_row.attr,
> +	&dev_attr_default_col.attr,
> +	&dev_attr_default_frame_rate.attr,
> +	&dev_attr_dynamic_frame.attr,
> +	&dev_attr_err_threshold.attr,
> +	&dev_attr_clock_frequencies.attr,
> +	&dev_attr_clock_gears.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group sdw_master_node_group = {
> +	.attrs = master_node_attrs,
> +};
> +
> +static const struct attribute_group *sdw_master_node_groups[] = {
> +	&sdw_master_node_group,
> +	NULL
> +};

Minor nit, you can use the ATTRIBUTE_GROUPS() macro here to save you a
few lines.

> +
> +static void sdw_device_release(struct device *dev)
> +{
> +	struct sdw_master_sysfs *master = to_sdw_device(dev);
> +
> +	kfree(master);
> +}
> +
> +static struct device_type sdw_device_type = {
> +	.name =	"sdw_device",
> +	.release = sdw_device_release,
> +};
> +
> +int sdw_sysfs_bus_init(struct sdw_bus *bus)
> +{
> +	struct sdw_master_sysfs *master;
> +	int err;
> +
> +	if (bus->sysfs) {
> +		dev_err(bus->dev, "SDW sysfs is already initialized\n");
> +		return -EIO;
> +	}
> +
> +	master = kzalloc(sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;

Why are you creating a whole new device to put all of this under?  Is
this needed?  What will the sysfs tree look like when you do this?  Why
can't the "bus" device just get all of these attributes and no second
device be created?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
