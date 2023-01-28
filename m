Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E667F800
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 14:27:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D9F851;
	Sat, 28 Jan 2023 14:26:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D9F851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674912466;
	bh=8sTfmspWNrxkeaaJD+PTKLjxUW2F1n5lgYhmYXWgwss=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fxLCWJfqoqwjHwrG4itfUA2o7PDU/1La8b8yGHetRq2ezrVdiCr8SWulXJbsoKrWK
	 5dCGG1LR7Za3lXdu/GehRI3+UhvbefVdGbkzfnanb5/GtVnhM+P4Na35/bjTobueea
	 L7CYksaw/7Y1qcbJlxMPEHiu+/RQtoKZHXIEFcyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C780EF8007C;
	Sat, 28 Jan 2023 14:26:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DADDF8027D; Sat, 28 Jan 2023 14:26:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C71F80171
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 14:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C71F80171
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=deJNq9nA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E52E6CE09F0;
 Sat, 28 Jan 2023 13:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FFEC4339B;
 Sat, 28 Jan 2023 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674912395;
 bh=8sTfmspWNrxkeaaJD+PTKLjxUW2F1n5lgYhmYXWgwss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deJNq9nAafXE+G7TxIzrakUsMW891/vlP7TGVYC5OMaav7z3Ryp0LFKFb80Seba+F
 Gv/gsnCj5gZoAeWjWGA6B42y5NPMgRfUMCCBPl5/GL5Lfw61dliyKlQLxGNPj2ydJn
 kZL5C1vGG8DwyeWtAVtBe1rrcI+ytrHixw8FkmA4=
Date: Sat, 28 Jan 2023 14:26:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH v2 07/22] ASoC: Add SOC USB APIs for adding an USB
 backend
Message-ID: <Y9UiiMbJFjkzyEol@kroah.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-8-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126031424.14582-8-quic_wcheng@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 07:14:09PM -0800, Wesley Cheng wrote:
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> new file mode 100644
> index 000000000000..ec422a8a834f
> --- /dev/null
> +++ b/include/sound/soc-usb.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.

It is now 2023 :)

> + */
> +
> +#ifndef __LINUX_SND_SOC_USB_H
> +#define __LINUX_SND_SOC_USB_H
> +
> +/**
> + * struct snd_soc_usb
> + * @component - Reference to DAPM component
> + * @connection_status_cb - callback to notify connection events
> + * @priv_data - vendor data

You do not document all items in the structure so you will get build
warnings :(

And what exactly is "vendor data"?  You use that term in a few places in
this series, there is no such thing as a "vendor" in the kernel.  This
could be a device or driver specific data, but not a "vendor".

> --- /dev/null
> +++ b/sound/soc/soc-usb.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include <linux/of.h>
> +#include <linux/usb.h>
> +#include <sound/soc.h>
> +#include <sound/soc-usb.h>
> +#include "../usb/card.h"
> +
> +static DEFINE_MUTEX(ctx_mutex);
> +static LIST_HEAD(usb_ctx_list);

What is this a list of?  Why a list?  This should be dynamic and tied to
the device itself somehow, not a separate list you have to walk.

> +
> +#define for_each_usb_ctx(ctx)			\
> +	list_for_each_entry(ctx, &usb_ctx_list, list)

No need for a #define like this, just spell it out.


> +
> +static struct device_node *snd_soc_find_phandle(struct device *dev)
> +{
> +	struct device_node *node;
> +
> +	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);
> +	if (!node)
> +		return ERR_PTR(-ENODEV);
> +
> +	return node;
> +}
> +
> +static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
> +{
> +	struct device_node *node;
> +	struct snd_soc_usb *ctx = NULL;
> +
> +	node = snd_soc_find_phandle(dev);
> +	if (IS_ERR(node))
> +		return NULL;
> +
> +	mutex_lock(&ctx_mutex);
> +	for_each_usb_ctx(ctx) {
> +		if (ctx->dev->of_node == node) {
> +			of_node_put(node);
> +			mutex_unlock(&ctx_mutex);
> +			return ctx;
> +		}
> +	}
> +	of_node_put(node);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return NULL;
> +}
> +
> +/**
> + * snd_soc_usb_get_priv_data() - Retrieve private data stored
> + * @usbdev: USB bus sysdev
> + *
> + * Fetch the private data stored in the USB SND SOC structure.  This is
> + * intended to be called by the USB offloading class driver, in order to
> + * attain parameters about the USB backend device.
> + *
> + */
> +void *snd_soc_usb_get_priv_data(struct device *usbdev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	if (!usbdev)
> +		return NULL;

How could usbdev ever be NULL?

> +
> +	ctx = snd_soc_find_usb_ctx(usbdev);
> +
> +	return ctx ? ctx->priv_data : NULL;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_get_priv_data);
> +
> +/**
> + * snd_soc_usb_set_priv_data() - Set private data stored
> + * @dev: USB backend device
> + * @priv: private data to store
> + *
> + * Save data describing the USB backend device parameters.  This is intended
> + * to be called by the ASoC USB backend driver.
> + *
> + */
> +void snd_soc_usb_set_priv_data(struct device *dev, void *priv)
> +{
> +	struct snd_soc_usb *ctx;


Why does this function take a "struct device" but the get function take
a USB device?

> +
> +	mutex_lock(&ctx_mutex);
> +	for_each_usb_ctx(ctx) {
> +		if (dev->of_node == ctx->dev->of_node) {
> +			ctx->priv_data = priv;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_set_priv_data);
> +
> +/**
> + * snd_soc_usb_add_port() - Add a USB backend port
> + * @dev: USB backend device
> + * @connection_cb: connection status callback
> + *
> + * Register a USB backend device to the SND USB SOC framework.  Memory is
> + * allocated as part of the USB backend device.
> + *
> + */
> +struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev,
> +			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
> +			int connected))
> +{
> +	struct snd_soc_usb *usb;
> +
> +	usb = devm_kzalloc(dev, sizeof(*usb), GFP_KERNEL);
> +	if (!usb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	usb->connection_status_cb = connection_cb;
> +	usb->dev = dev;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);

Again, why a list?


> +
> +	return usb;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
> +
> +/**
> + * snd_soc_usb_remove_port() - Remove a USB backend port
> + * @dev: USB backend device
> + *
> + * Remove a USB backend device from USB SND SOC.  Memory is freed when USB
> + * backend is removed.
> + *
> + */
> +int snd_soc_usb_remove_port(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx, *tmp;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
> +		if (ctx->dev == dev) {
> +			list_del(&ctx->list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
> +
> +/**
> + * snd_soc_usb_connect() - Notification of USB device connection
> + * @usbdev: USB bus device
> + * @card_idx: USB SND card instance
> + *
> + * Notify of a new USB SND device connection.  The card_idx can be used to
> + * handle how the USB backend selects, which device to enable offloading on.
> + *
> + */
> +int snd_soc_usb_connect(struct device *usbdev, int card_idx)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	if (!usbdev)
> +		return -ENODEV;
> +
> +	ctx = snd_soc_find_usb_ctx(usbdev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	if (ctx->connection_status_cb)
> +		ctx->connection_status_cb(ctx, card_idx, 1);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
> +
> +/**
> + * snd_soc_usb_connect() - Notification of USB device connection
> + * @usbdev: USB bus device
> + *
> + * Notify of a new USB SND device disconnection to the USB backend.
> + *
> + */
> +int snd_soc_usb_disconnect(struct device *usbdev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	if (!usbdev)
> +		return -ENODEV;
> +
> +	ctx = snd_soc_find_usb_ctx(usbdev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	if (ctx->connection_status_cb)
> +		ctx->connection_status_cb(ctx, -1, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_disconnect);

Meta-comment, why are all of these in the sound directory?  They are
only operating on USB devices, nothing else.  So why here?

thanks,

greg k-h
