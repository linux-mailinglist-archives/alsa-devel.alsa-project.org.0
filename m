Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64327FFAF
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EEF187D;
	Thu,  1 Oct 2020 15:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EEF187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601557479;
	bh=o503qoDdV7A6uxXfWMsX8YwFbpWvmpOgHBmwMIEeYx8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTdPNZYlzHJkw7Q+H/+xEdTfXUoz2X0f3DgAxKNpAbhX6ZSjghvNXbrw+WItLH239
	 mMbJoNPBMkjB1uGPs7eiNaxsRfC54yEE2XyMDtLWeTKhEWvf9C4GF6YwJRMavzjLOd
	 aDErAwklsDnwcp0QP9PzgMBiZJm+hsFqiDCHMprc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA03F8020C;
	Thu,  1 Oct 2020 15:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9800F801D8; Thu,  1 Oct 2020 15:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56322F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56322F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ExcAMLoL"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE7F82075F;
 Thu,  1 Oct 2020 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601557364;
 bh=o503qoDdV7A6uxXfWMsX8YwFbpWvmpOgHBmwMIEeYx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ExcAMLoLrI1NKeI7WDnf44m7k/554tRxr2z1G1brVGfok+mvu3VtTToZF6am5eECR
 sAEkJh0VrZaPW2RbRB/RB6UFm+Cm/BpUtCfwn2aXXEItggn9j+00/jhNVR7YWOk0Gk
 GcpYwZ9BLxzGwTL7MjvX23ncGgEi7Y9KBZfXjYQU=
Date: Thu, 1 Oct 2020 15:02:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Message-ID: <20201001130245.GB2378679@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-3-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com
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

On Wed, Sep 30, 2020 at 03:50:47PM -0700, Dave Ertman wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> A client in the SOF (Sound Open Firmware) context is a
> device that needs to communicate with the DSP via IPC
> messages. The SOF core is responsible for serializing the
> IPC messages to the DSP from the different clients. One
> example of an SOF client would be an IPC test client that
> floods the DSP with test IPC messages to validate if the
> serialization works as expected. Multi-client support will
> also add the ability to split the existing audio cards
> into multiple ones, so as to e.g. to deal with HDMI with a
> dedicated client instead of adding HDMI to all cards.
> 
> This patch introduces descriptors for SOF client driver
> and SOF client device along with APIs for registering
> and unregistering a SOF client driver, sending IPCs from
> a client device and accessing the SOF core debugfs root entry.
> 
> Along with this, add a couple of new members to struct
> snd_sof_dev that will be used for maintaining the list of
> clients.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> ---
>  sound/soc/sof/Kconfig      |  19 ++++++
>  sound/soc/sof/Makefile     |   3 +
>  sound/soc/sof/core.c       |   2 +
>  sound/soc/sof/sof-client.c | 117 +++++++++++++++++++++++++++++++++++++
>  sound/soc/sof/sof-client.h |  65 +++++++++++++++++++++
>  sound/soc/sof/sof-priv.h   |   6 ++
>  6 files changed, 212 insertions(+)
>  create mode 100644 sound/soc/sof/sof-client.c
>  create mode 100644 sound/soc/sof/sof-client.h

As you are creating new sysfs directories, you should have some
documentation for them :(

> 
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 4dda4b62509f..cea7efedafef 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -50,6 +50,24 @@ config SND_SOC_SOF_DEBUG_PROBES
>  	  Say Y if you want to enable probes.
>  	  If unsure, select "N".
>  
> +config SND_SOC_SOF_CLIENT
> +	tristate
> +	select ANCILLARY_BUS
> +	help
> +	  This option is not user-selectable but automagically handled by
> +	  'select' statements at a higher level
> +
> +config SND_SOC_SOF_CLIENT_SUPPORT
> +	bool "SOF enable clients"
> +	depends on SND_SOC_SOF
> +	help
> +	  This adds support for ancillary client devices to separate out the debug
> +	  functionality for IPC tests, probes etc. into separate devices. This
> +	  option would also allow adding client devices based on DSP FW
> +	  capabilities and ACPI/OF device information.
> +	  Say Y if you want to enable clients with SOF.
> +	  If unsure select "N".
> +
>  config SND_SOC_SOF_DEVELOPER_SUPPORT
>  	bool "SOF developer options support"
>  	depends on EXPERT
> @@ -186,6 +204,7 @@ endif ## SND_SOC_SOF_DEVELOPER_SUPPORT
>  
>  config SND_SOC_SOF
>  	tristate
> +	select SND_SOC_SOF_CLIENT if SND_SOC_SOF_CLIENT_SUPPORT
>  	select SND_SOC_TOPOLOGY
>  	select SND_SOC_SOF_NOCODEC if SND_SOC_SOF_NOCODEC_SUPPORT
>  	help
> diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
> index 05718dfe6cd2..5e46f25a3851 100644
> --- a/sound/soc/sof/Makefile
> +++ b/sound/soc/sof/Makefile
> @@ -2,6 +2,7 @@
>  
>  snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
>  		control.o trace.o utils.o sof-audio.o
> +snd-sof-client-objs := sof-client.o
>  snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += probe.o compress.o
>  
>  snd-sof-pci-objs := sof-pci-dev.o
> @@ -18,6 +19,8 @@ obj-$(CONFIG_SND_SOC_SOF_ACPI) += snd-sof-acpi.o
>  obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-of.o
>  obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci.o
>  
> +obj-$(CONFIG_SND_SOC_SOF_CLIENT) += snd-sof-client.o
> +
>  obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
>  obj-$(CONFIG_SND_SOC_SOF_IMX_TOPLEVEL) += imx/
>  obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index adc7c37145d6..72a97219395f 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -314,8 +314,10 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
>  	INIT_LIST_HEAD(&sdev->widget_list);
>  	INIT_LIST_HEAD(&sdev->dai_list);
>  	INIT_LIST_HEAD(&sdev->route_list);
> +	INIT_LIST_HEAD(&sdev->client_list);
>  	spin_lock_init(&sdev->ipc_lock);
>  	spin_lock_init(&sdev->hw_lock);
> +	mutex_init(&sdev->client_mutex);
>  
>  	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
>  		INIT_WORK(&sdev->probe_work, sof_probe_work);
> diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
> new file mode 100644
> index 000000000000..f7e476d99ff6
> --- /dev/null
> +++ b/sound/soc/sof/sof-client.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright(c) 2020 Intel Corporation. All rights reserved.
> +//
> +// Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> +//
> +
> +#include <linux/debugfs.h>
> +#include <linux/errno.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include "sof-client.h"
> +#include "sof-priv.h"
> +
> +static void sof_client_ancildev_release(struct device *dev)
> +{
> +	struct ancillary_device *ancildev = to_ancillary_dev(dev);
> +	struct sof_client_dev *cdev = ancillary_dev_to_sof_client_dev(ancildev);
> +
> +	ida_simple_remove(cdev->client_ida, ancildev->id);
> +	kfree(cdev);
> +}
> +
> +static struct sof_client_dev *sof_client_dev_alloc(struct snd_sof_dev *sdev, const char *name,
> +						   struct ida *client_ida)
> +{
> +	struct sof_client_dev *cdev;
> +	struct ancillary_device *ancildev;
> +	int ret;
> +
> +	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return NULL;
> +
> +	cdev->sdev = sdev;

No reference counting?  How can you guarantee the lifespan is ok?

> +	cdev->client_ida = client_ida;
> +	ancildev = &cdev->ancildev;
> +	ancildev->name = name;
> +	ancildev->dev.parent = sdev->dev;

Ah, you guarantee it by making it the parent.  Sneaky, but is it really
needed?

> +	ancildev->dev.release = sof_client_ancildev_release;
> +
> +	ancildev->id = ida_alloc(client_ida, GFP_KERNEL);
> +	if (ancildev->id < 0) {
> +		dev_err(sdev->dev, "error: get IDA idx for ancillary device %s failed\n", name);
> +		ret = ancildev->id;
> +		goto err_free;
> +	}
> +
> +	ret = ancillary_device_initialize(ancildev);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "error: failed to initialize client dev %s\n", name);
> +		ida_simple_remove(client_ida, ancildev->id);
> +		goto err_free;
> +	}
> +
> +	return cdev;
> +
> +err_free:
> +	kfree(cdev);
> +	return NULL;
> +}
> +
> +int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, struct ida *client_ida)
> +{
> +	struct sof_client_dev *cdev;
> +	int ret;
> +
> +	cdev = sof_client_dev_alloc(sdev, name, client_ida);
> +	if (!cdev)
> +		return -ENODEV;
> +
> +	ret = ancillary_device_add(&cdev->ancildev);

Why have you split this up into two calls?  Why not just
"sof_client_dev_create() or something like that?

Having to make a sof_* call, and then a separate ancillary_device_* call
feels pretty ackward, right?


> +	if (ret < 0) {
> +		dev_err(sdev->dev, "error: failed to add client dev %s\n", name);
> +		put_device(&cdev->ancildev.dev);

Ugh that's a deep knowledge of the ancil code, would be nicer if the
caller function handled all of that for you, right?

> +		return ret;
> +	}
> +
> +	/* add to list of SOF client devices */
> +	mutex_lock(&sdev->client_mutex);
> +	list_add(&cdev->list, &sdev->client_list);
> +	mutex_unlock(&sdev->client_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(sof_client_dev_register, SND_SOC_SOF_CLIENT);
> +
> +void sof_client_dev_unregister(struct sof_client_dev *cdev)
> +{
> +	struct snd_sof_dev *sdev = cdev->sdev;
> +
> +	/* remove from list of SOF client devices */
> +	mutex_lock(&sdev->client_mutex);
> +	list_del(&cdev->list);
> +	mutex_unlock(&sdev->client_mutex);

So you add and remove things from the list, but do not do anything with
that list?  Why a list at all?

> +
> +	ancillary_device_unregister(&cdev->ancildev);

Does this free the expected memory?  I think so, but commenting that it
does is nice :)

> +}
> +EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, SND_SOC_SOF_CLIENT);
> +
> +int sof_client_ipc_tx_message(struct sof_client_dev *cdev, u32 header, void *msg_data,
> +			      size_t msg_bytes, void *reply_data, size_t reply_bytes)
> +{
> +	return sof_ipc_tx_message(cdev->sdev->ipc, header, msg_data, msg_bytes,
> +				  reply_data, reply_bytes);
> +}
> +EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
> +
> +struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev)
> +{
> +	return cdev->sdev->debugfs_root;
> +}
> +EXPORT_SYMBOL_NS_GPL(sof_client_get_debugfs_root, SND_SOC_SOF_CLIENT);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
> new file mode 100644
> index 000000000000..62212f69c236
> --- /dev/null
> +++ b/sound/soc/sof/sof-client.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only) */

Why the "()"?

thanks,

greg k-h
