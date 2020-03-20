Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC82E18D642
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 18:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BEBF846;
	Fri, 20 Mar 2020 18:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BEBF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584726799;
	bh=GKVQAIaB9bnxYM0Z8dMAA2S2dC8/MNDyjSSJcmD9prM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsCu/bOFZ8KDXqO4VqVrDS9FHkvrTxiw0E2cYa0KLTBQlTfbJk7pKrDyyr0oK4tii
	 I2z2JstiTQDfpo5XhJGJYqsF00WiLHE3/HWjMVmwYfxM7GyVW9Df91CyTgxT+WDJtA
	 7dYanotHfDSL3OtRSIPgAfJ9UVc+iXvHfXYzIm6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65EF8F80162;
	Fri, 20 Mar 2020 18:51:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3889F8015B; Fri, 20 Mar 2020 18:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42872F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 18:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42872F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZFrqKoFX"
Received: by mail-wm1-x341.google.com with SMTP id r7so7811218wmg.0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRdsdIDHZ/uk3P+vR5Dpf7xsgikM9X1ufq5doVe+IrM=;
 b=ZFrqKoFXjATo3tihNTfSa1MsqsJSJb8hPcVAt8/qgu+wq7k0dYGzCj5wtMTFutRCXn
 nhm38OvbI/y7v08N6bKC1jALZIZi9hDGVl5cyhFS4nZGC5kxC81Ohzrx2TVMEPOZG2FL
 NyoW8e3q1bgqjROUPIm/ckNGn8e5/zG5QP3EBlPF+8t56fCxpU81mSJsuLA5DzZwoq+d
 JNGYxx20c8jvl1n3lRdfnmktVsm1Ue36CLdy8rszBgRJMAKDlr2g3S97ZoeKz3nq0Nlr
 57HH8Rr3xQZjnU9PHDuMZ3l9sPSDl4+zhndaJCcQ/Od4K9Ov64ldDmfJW/OlkZD1DPPb
 35mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mRdsdIDHZ/uk3P+vR5Dpf7xsgikM9X1ufq5doVe+IrM=;
 b=YIkubVZq7zv1W/CtmYFK+8h3x9Ql3JLHvTjydVOI0J1W/LrCMWqoYEhDa6YbVJjOk0
 lKmb1VhyQgqrfE/LkCS+gU97tpjUiiOGVvm+tTQRdC+mRPonrljmFi1dzm5bOLBXTPy3
 y3N+Qz7sJ/UTDEBSw+NpfC9MLpnWsWdfCp4sOgKM0URvXEr8LXecNLpBPiUogCFdaSqL
 rNrnQalS2s8+mafLIXJGs7fEOGMR1q6bfJhdLfx5CTIdOz2Uzt3UmvqoZU9NrEhJ2YQR
 bhFA2LyiZ3p0SijcsFvwPDcH4qVFp5pDZRJIfoncXmFdQVpfvT+24R9ZZyEZMCv3zp5C
 +ueQ==
X-Gm-Message-State: ANhLgQ0XfFyVTMiML3YZb7pcEVpchKKoXylCaThGplNPf5AtlelMov5m
 39DqteAMPY+oCquR3jIMOdGpj4ALZeQ=
X-Google-Smtp-Source: ADFU+vuQji2l9DYu4oGqkosZbg6rDTxzIAUhv40ED4Dj8frDAN8tYjJg6MUuBocZb2sVv0CTIVtBnQ==
X-Received: by 2002:a1c:5544:: with SMTP id j65mr10232638wmb.60.1584726690960; 
 Fri, 20 Mar 2020 10:51:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w11sm9544960wrv.86.2020.03.20.10.51.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Mar 2020 10:51:30 -0700 (PDT)
Subject: Re: [PATCH 1/5] soundwire: bus_type: add master_device/driver support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-2-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5d78f0f8-7418-e50e-6f0b-dd6988224744@linaro.org>
Date: Fri, 20 Mar 2020 17:51:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200320162947.17663-2-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
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



On 20/03/2020 16:29, Pierre-Louis Bossart wrote:
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
> 
> In this patch, we convert the existing code to use an explicit
> sdw_slave_type, then define new objects (sdw_master_device and
> sdw_master_driver).
> 
> A parent (such as the Intel audio controller or its equivalent on
> Qualcomm devices) would use sdw_master_device_add() to create the
> device, passing a driver name as a parameter. The master device would
> be released when device_unregister() is invoked by the parent.
> 
> Note that since there is no standard for the Master host-facing
> interface, so the bus matching relies on a simple string matching (as
> previously done with platform devices).
> 
> The 'Master Device' driver exposes callbacks for
> probe/startup/shutdown/remove/process_wake. The startup and process
> wake need to be called by the parent directly (using wrappers), while
> the probe/shutdown/remove are handled by the SoundWire bus core upon
> device creation and release.
> 
> Additional callbacks will be added in the future for e.g. autonomous
> clock stop modes.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/Makefile         |   2 +-
>   drivers/soundwire/bus_type.c       | 139 +++++++++++++++++++++++++++--
>   drivers/soundwire/master.c         | 129 ++++++++++++++++++++++++++
>   drivers/soundwire/slave.c          |   7 +-
>   include/linux/soundwire/sdw.h      |  59 ++++++++++++
>   include/linux/soundwire/sdw_type.h |  36 +++++++-
>   6 files changed, 363 insertions(+), 9 deletions(-)
>   create mode 100644 drivers/soundwire/master.c
> 


This patch in general is missing device tree support for both matching 
and uevent so this will not clearly work for Qualcomm controller unless 
we do via platform bus, which does not sound right!


> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index e2cdff990e9f..7319918e0aec 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,7 +4,7 @@
>   #
>   
>   #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o
>   obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>   
>   ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 17f096dd6806..09a25075e770 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -33,13 +33,33 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
>   
>   static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
>   {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> -	struct sdw_driver *drv = drv_to_sdw_driver(ddrv);
> +	struct sdw_slave *slave;
> +	struct sdw_driver *drv;
> +	struct sdw_master_device *md;
> +	struct sdw_master_driver *mdrv;
> +	int ret = 0;
>   
> -	return !!sdw_get_device_id(slave, drv);
> +	if (is_sdw_slave(dev)) {
> +		slave = dev_to_sdw_dev(dev);
> +		drv = drv_to_sdw_driver(ddrv);
> +
> +		ret = !!sdw_get_device_id(slave, drv);
> +	} else {
> +		md = dev_to_sdw_master_device(dev);
> +		mdrv = drv_to_sdw_master_driver(ddrv);
> +
> +		/*
> +		 * we don't have any hardware information so
> +		 * match with a hopefully unique string
> +		 */
> +		ret = !strncmp(md->master_name, mdrv->driver.name,
> +			       strlen(md->master_name));
> +	}
> +	return ret;
>   }
>   
> -int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
> +static int sdw_slave_modalias(const struct sdw_slave *slave, char *buf,
> +			      size_t size)
>   {
>   	/* modalias is sdw:m<mfg_id>p<part_id> */
>   
> @@ -47,12 +67,31 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>   			slave->id.mfg_id, slave->id.part_id);
>   }
>   
> +static int sdw_master_modalias(const struct sdw_master_device *md,
> +			       char *buf, size_t size)
> +{
> +	/* modalias is sdw:<string> since we don't have any hardware info */
> +
> +	return snprintf(buf, size, "sdw:%s\n",
> +			md->master_name);
> +}
> +
>   static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>   {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave;
> +	struct sdw_master_device *md;
>   	char modalias[32];
>   
> -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> +	if (is_sdw_slave(dev)) {
> +		slave = dev_to_sdw_dev(dev);
> +
> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
> +
> +	} else {
> +		md = dev_to_sdw_master_device(dev);
> +
> +		sdw_master_modalias(md, modalias, sizeof(modalias));
> +	}
>   
>   	if (add_uevent_var(env, "MODALIAS=%s", modalias))
>   		return -ENOMEM;
> @@ -181,6 +220,94 @@ void sdw_unregister_driver(struct sdw_driver *drv)
>   }
>   EXPORT_SYMBOL_GPL(sdw_unregister_driver);
>   
> +static int sdw_master_drv_probe(struct device *dev)
> +{
> +	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
> +	struct sdw_master_driver *mdrv = drv_to_sdw_master_driver(dev->driver);
> +	int ret;
> +
> +	/*
> +	 * attach to power domain but don't turn on (last arg)
> +	 */
> +	ret = dev_pm_domain_attach(dev, false);
> +	if (ret)
> +		return ret;
> +
> +	ret = mdrv->probe(md, md->pdata);
> +	if (ret) {
> +		dev_err(dev, "Probe of %s failed: %d\n",
> +			mdrv->driver.name, ret);
> +		dev_pm_domain_detach(dev, false);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sdw_master_drv_remove(struct device *dev)
> +{
> +	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
> +	struct sdw_master_driver *mdrv = drv_to_sdw_master_driver(dev->driver);
> +	int ret = 0;
> +
> +	if (mdrv->remove)
> +		ret = mdrv->remove(md);
> +
> +	dev_pm_domain_detach(dev, false);
> +
> +	return ret;
> +}
> +

...

> diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
> new file mode 100644
> index 000000000000..fbfa1c35137d
> --- /dev/null
> +++ b/drivers/soundwire/master.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +// Copyright(c) 2019-2020 Intel Corporation.
> +
> +#include <linux/device.h>
> +#include <linux/acpi.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include "bus.h"
> +

...

> +
> +/**
> + * sdw_master_device_startup() - startup hardware
> + * @md: Linux Soundwire master device
> + *
> + * This use of this function is optional. It is only needed if the
> + * hardware cannot be started during a driver probe, e.g. due to power
> + * rail dependencies. The implementation is platform-specific but the
> + * bus will typically go through a hardware-reset sequence and devices
> + * will be enumerated once they report as ATTACHED.
> + */
> +int sdw_master_device_startup(struct sdw_master_device *md)
> +{
> +	struct sdw_master_driver *mdrv;
> +	struct device *dev;
> +	int ret = 0;
> +
> +	if (IS_ERR_OR_NULL(md))
> +		return -EINVAL;
> +
> +	dev = &md->dev;
> +	mdrv = drv_to_sdw_master_driver(dev->driver);
> +
> +	if (mdrv && mdrv->startup)
> +		ret = mdrv->startup(md);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(sdw_master_device_startup);

Who would call this function? and How would it get hold of master device 
instance ?


How would soundwire core also ensure that we do not actively use this 
master if it is not ready. Similar comment for shutdown callback.

> +
> +/**
> + * sdw_master_device_process_wake_event() - handle external wake event
> + * @md: Linux Soundwire master device
> + *
> + * The use of this function is optional, and only needed when e.g. an
> + * external wake event is provided by another subsystem, such as PCI.
> + */
> +
> +int sdw_master_device_process_wake_event(struct sdw_master_device *md)
> +{
> +	struct sdw_master_driver *mdrv;
> +	struct device *dev;
> +	int ret = 0;
> +
> +	if (IS_ERR_OR_NULL(md))
> +		return -EINVAL;
> +
> +	dev = &md->dev;
> +	mdrv = drv_to_sdw_master_driver(dev->driver);
> +
> +	if (mdrv && mdrv->process_wake_event)
> +		ret = mdrv->process_wake_event(md);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(sdw_master_device_process_wake_event);
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index aace57fae7f8..7ca4f2d9bfa6 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -14,6 +14,11 @@ static void sdw_slave_release(struct device *dev)
>   	kfree(slave);
>   }
>   
> +struct device_type sdw_slave_type = {
> +	.name =		"sdw_slave",
> +	.release =	sdw_slave_release,
> +};
> +
>   static int sdw_slave_add(struct sdw_bus *bus,
>   			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
>   {
> @@ -41,9 +46,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
>   			     id->class_id, id->unique_id);
>   	}
>   
> -	slave->dev.release = sdw_slave_release;
>   	slave->dev.bus = &sdw_bus_type;
>   	slave->dev.of_node = of_node_get(to_of_node(fwnode));
> +	slave->dev.type = &sdw_slave_type;
>   	slave->bus = bus;
>   	slave->status = SDW_SLAVE_UNATTACHED;
>   	init_completion(&slave->enumeration_complete);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 00f5826092e3..523b8fc86f7d 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -632,6 +632,31 @@ struct sdw_slave {
>   
>   #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
>   
> +/**
> + * struct sdw_master_device - SoundWire 'Master Device' representation
> + * @dev: Linux device for this Master
> + * @master_name: Linux driver name
> + * @driver: Linux driver for this Master (set by SoundWire core during probe)
> + * @probe_complete: used by parent if synchronous probe behavior is needed
> + * @link_id: link index as defined by MIPI DisCo specification
> + * @pm_runtime_suspended: flag set on system suspend and used on system resume.
> + * This is an optimization to avoid calling pm_runtime_suspended() twice.
> + * @pdata: private data typically provided with sdw_master_device_add()
> + */
> +
> +struct sdw_master_device {
> +	struct device dev;
> +	const char *master_name;
> +	struct sdw_master_driver *driver;
> +	struct completion probe_complete;
> +	int link_id;
> +	bool pm_runtime_suspended;
> +	void *pdata;
> +};
> +
> +#define dev_to_sdw_master_device(d)	\
> +	container_of(d, struct sdw_master_device, dev)
> +
>   struct sdw_driver {
>   	const char *name;
>   
> @@ -646,6 +671,29 @@ struct sdw_driver {
>   	struct device_driver driver;
>   };
>   
> +/**
> + * struct sdw_master_driver - SoundWire 'Master Device' driver
> + * @probe: initializations and allocation (hardware may not be enabled yet)
> + * @startup: initialization handled after the hardware is enabled, all
> + * clock/power dependencies are available (optional)
> + * @shutdown: cleanups before hardware is disabled (optional)
> + * @remove: free all remaining resources
> + * @process_wake_event: handle external wake (optional)
> + * @driver: baseline structure used for name/PM hooks.
> + *
> + * The use of sdw_master_driver is optional, and typically only needed
> + * when a controller has multiple links and needs to deal with power
> + * management at the link level.
> + */
> +struct sdw_master_driver {
> +	int (*probe)(struct sdw_master_device *md, void *link_ctx);
> +	int (*startup)(struct sdw_master_device *md);
> +	int (*shutdown)(struct sdw_master_device *md);
> +	int (*remove)(struct sdw_master_device *md);
> +	int (*process_wake_event)(struct sdw_master_device *md);
> +	struct device_driver driver;
> +};
> +
>   #define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
>   	{ .mfg_id = (_mfg_id), .part_id = (_part_id), \
>   	  .driver_data = (unsigned long)(_drv_data) }
> @@ -835,6 +883,17 @@ struct sdw_bus {
>   int sdw_add_bus_master(struct sdw_bus *bus);
>   void sdw_delete_bus_master(struct sdw_bus *bus);
>   
> +struct sdw_master_device
> +*sdw_master_device_add(const char *master_name,
> +		       struct device *parent,
> +		       struct fwnode_handle *fwnode,
> +		       int link_id,
> +		       void *pdata);
> +
> +int sdw_master_device_startup(struct sdw_master_device *md);
> +
> +int sdw_master_device_process_wake_event(struct sdw_master_device *md);
> +
>   /**
>    * sdw_port_config: Master or Slave Port configuration
>    *
> diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
> index aaa7f4267c14..331ba58bda27 100644
> --- a/include/linux/soundwire/sdw_type.h
> +++ b/include/linux/soundwire/sdw_type.h
> @@ -5,16 +5,36 @@
>   #define __SOUNDWIRE_TYPES_H
>   
>   extern struct bus_type sdw_bus_type;
> +extern struct device_type sdw_slave_type;
> +extern struct device_type sdw_master_type;
> +
> +static inline int is_sdw_slave(const struct device *dev)
> +{
> +	return dev->type == &sdw_slave_type;
> +}
>   
>   #define drv_to_sdw_driver(_drv) container_of(_drv, struct sdw_driver, driver)
>   
>   #define sdw_register_driver(drv) \
>   	__sdw_register_driver(drv, THIS_MODULE)
>   
> +static inline int is_sdw_master_device(const struct device *dev)
> +{
> +	return dev->type == &sdw_master_type;
> +}
> +
> +#define drv_to_sdw_master_driver(_drv) \
> +	container_of(_drv, struct sdw_master_driver, driver)
> +
> +#define sdw_register_master_driver(drv) \
> +	__sdw_register_master_driver(drv, THIS_MODULE)
> +
>   int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
>   void sdw_unregister_driver(struct sdw_driver *drv);
>   
> -int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
> +int __sdw_register_master_driver(struct sdw_master_driver *mdrv,
> +				 struct module *owner);
> +void sdw_unregister_master_driver(struct sdw_master_driver *mdrv);
>   
>   /**
>    * module_sdw_driver() - Helper macro for registering a Soundwire driver
> @@ -27,4 +47,18 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
>   #define module_sdw_driver(__sdw_driver) \
>   	module_driver(__sdw_driver, sdw_register_driver, \
>   			sdw_unregister_driver)
> +
> +/**
> + * module_sdw_master_driver() - Helper macro for registering a Soundwire
> + * Master driver
> + * @__sdw_master_driver: soundwire Master driver struct
> + *
> + * Helper macro for Soundwire Master drivers which do not do anything special in
> + * module init/exit. This eliminates a lot of boilerplate. Each module may only
> + * use this macro once, and calling it replaces module_init() and module_exit()
> + */
> +#define module_sdw_master_driver(__sdw_master_driver) \
> +	module_driver(__sdw_master_driver, sdw_register_master_driver, \
> +			sdw_unregister_master_driver)
> +
>   #endif /* __SOUNDWIRE_TYPES_H */
> 
