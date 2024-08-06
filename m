Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA1C9493E8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 16:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1764A3BD2;
	Tue,  6 Aug 2024 16:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1764A3BD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722956128;
	bh=+sYV3bR8cNzsi5/7+csPwicHhBV/ErOUK65A21w+XSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YpOF7mxvKouSNMRDJP039XNAIyrxwb0705hZvjfJXj8SsabyUEHkDQEfuV42ITmUF
	 az4NkMd4XLChSQUsvLJrjbI6PXbeaa4A9IYRgbN9D+t+REUX5aoBmREpzZrttu6BHc
	 x6U0dqMCVGd7BwO0csLuYFduMd17j9tIeKYILpNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A4A1F805A1; Tue,  6 Aug 2024 16:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 810A2F8023A;
	Tue,  6 Aug 2024 16:54:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED6B4F80448; Tue,  6 Aug 2024 16:50:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A626DF800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A626DF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E1ahG3Xh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955804; x=1754491804;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+sYV3bR8cNzsi5/7+csPwicHhBV/ErOUK65A21w+XSU=;
  b=E1ahG3XhQROvdpcsgavjzcIfDviBOHjHqKS6a+FKVKHRF7SpxXH49lV0
   l5E99gHYgoQbPHOWpX2GDZaKSs8esrpMXinR5wXJvyfwmNI3dydyKUxTJ
   qqLl7ZCsGwZan4nHqr5KGfjPbhFioWEF2qmwMDuXNl8/dA2/IrlLzxak6
   SZb30BIoFsrfWYUchEXZJtX9dK965zgeNtsCFjbX8P70NI0/HqxF8EC0Q
   m75oDVjU44gphdYxWCQg5d512DsFlYuxI9wum78eF7m2ePxzDEWT2t+nV
   fxo3hTjMaJigCjjHofy+Bk6gtiRNbgRlUxa/sQB5ic/eY1Mp1UfjbjL9N
   g==;
X-CSE-ConnectionGUID: +9j6+mBgTBSxEHDM9B3SNQ==
X-CSE-MsgGUID: v9V2m50LQL2uoUn6zOqvkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101416"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="21101416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:50:00 -0700
X-CSE-ConnectionGUID: 3p2+ZU0fQd+Xzs93IIWvIw==
X-CSE-MsgGUID: K5IOHqvVSl2HSCiyenrnEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="87476425"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:49:54 -0700
Message-ID: <1a80c749-1cbc-4ad9-ac14-dec660bd7f8b@linux.intel.com>
Date: Tue, 6 Aug 2024 16:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 03/34] xhci: sideband: add initial api to register a
 sideband entity
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-4-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-4-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HWGB4GPC64FWPP6MKM6N35CS2J4W2UBG
X-Message-ID-Hash: HWGB4GPC64FWPP6MKM6N35CS2J4W2UBG
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWGB4GPC64FWPP6MKM6N35CS2J4W2UBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/2024 3:16 AM, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Introduce XHCI sideband, which manages the USB endpoints being requested by
> a client driver.  This is used for when client drivers are attempting to
> offload USB endpoints to another entity for handling USB transfers.  XHCI
> sideband will allow for drivers to fetch the required information about the
> transfer ring, so the user can submit transfers independently.  Expose the
> required APIs for drivers to register and request for a USB endpoint and to
> manage XHCI secondary interrupters.
> 
> Multiple ring segment page linking, proper endpoint clean up, and allowing
> module compliation added by Wesley Cheng to complete original concept code
> by Mathias Nyman.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/Kconfig          |   9 +
>   drivers/usb/host/Makefile         |   2 +
>   drivers/usb/host/xhci-sideband.c  | 419 ++++++++++++++++++++++++++++++
>   drivers/usb/host/xhci.h           |   4 +
>   include/linux/usb/xhci-sideband.h |  68 +++++
>   5 files changed, 502 insertions(+)
>   create mode 100644 drivers/usb/host/xhci-sideband.c
>   create mode 100644 include/linux/usb/xhci-sideband.h
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 4448d0ab06f0..6135603c5dc4 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
>   	  Say 'Y' to enable the support for the xHCI host controller
>   	  found in Renesas RZ/V2M SoC.
>   
> +config USB_XHCI_SIDEBAND
> +	tristate "xHCI support for sideband"
> +	help
> +	  Say 'Y' to enable the support for the xHCI sideband capability.
> +	  provide a mechanism for a sideband datapath for payload associated

Sentence should start from capital letter, so provide -> Provide

> +	  with audio class endpoints. This allows for an audio DSP to use
> +	  xHCI USB endpoints directly, allowing CPU to sleep while playing
> +	  audio

Missing '.' at the end of sentence.

(...)

> +/**
> + * xhci_sideband_remove_endpoint - remove endpoint from sideband access list
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Removes an endpoint from the list of sideband accessed endpoints for this usb
> + * device.
> + * sideband client should no longer touch the endpoint transfer buffer after
> + * calling this.
> + *
> + * Return: 0 on success, negative error otherwise.
> + */
> +int
> +xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
> +			      struct usb_host_endpoint *host_ep)
> +{
> +	struct xhci_virt_ep *ep;
> +	unsigned int ep_index;
> +
> +	mutex_lock(&sb->mutex);
> +	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> +	ep = sb->eps[ep_index];
> +
> +	if (!ep || !ep->sideband) {
> +		mutex_unlock(&sb->mutex);
> +		return -ENODEV;
> +	}
> +
> +	__xhci_sideband_remove_endpoint(sb, ep);
> +	xhci_initialize_ring_info(ep->ring, 1);
> +	mutex_unlock(&sb->mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
> +
> +int
> +xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
> +			    struct usb_host_endpoint *host_ep)
> +{
> +	struct xhci_virt_ep *ep;
> +	unsigned int ep_index;
> +
> +	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> +	ep = sb->eps[ep_index];
> +
> +	if (!ep || ep->sideband != sb)

Any reason why we check if ep->sideband != sb only on stop but not on 
remove above?

> +		return -EINVAL;
> +
> +	return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
> +
> +/**
> + * xhci_sideband_get_endpoint_buffer - gets the endpoint transfer buffer address
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Returns the address of the endpoint buffer where xHC controller reads queued
> + * transfer TRBs from. This is the starting address of the ringbuffer where the
> + * sideband client should write TRBs to.
> + *
> + * Caller needs to free the returned sg_table
> + *
> + * Return: struct sg_table * if successful. NULL otherwise.
> + */
> +struct sg_table *
> +xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
> +			      struct usb_host_endpoint *host_ep)
> +{
> +	struct xhci_virt_ep *ep;
> +	unsigned int ep_index;
> +
> +	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> +	ep = sb->eps[ep_index];
> +
> +	if (!ep)

And here there is none of checks done in above 2 functions? Seems bit weird.

> +		return NULL;
> +
> +	return xhci_ring_to_sgtable(sb, ep->ring);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
> +

(...)

> +MODULE_DESCRIPTION("XHCI sideband driver for secondary interrupter management");

XHCI -> xHCI

> +MODULE_LICENSE("GPL");
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index efbd1f651da4..9232c53d204a 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -693,6 +693,8 @@ struct xhci_virt_ep {
>   	int			next_frame_id;
>   	/* Use new Isoch TRB layout needed for extended TBC support */
>   	bool			use_extended_tbc;
> +	/* set if this endpoint is controlled via sideband access*/
> +	struct xhci_sideband			*sideband;
>   };
>   
>   enum xhci_overhead_type {
> @@ -755,6 +757,8 @@ struct xhci_virt_device {
>   	u16				current_mel;
>   	/* Used for the debugfs interfaces. */
>   	void				*debugfs_private;
> +	/* set if this device is registered for sideband access */
> +	struct xhci_sideband			*sideband;
>   };
>   
>   /*
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
> new file mode 100644
> index 000000000000..1035dae43cee
> --- /dev/null
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xHCI host controller sideband support
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + *
> + * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> + */
> +
> +#ifndef __LINUX_XHCI_SIDEBAND_H
> +#define __LINUX_XHCI_SIDEBAND_H
> +
> +#include <linux/scatterlist.h>
> +#include <linux/usb.h>
> +
> +#define	EP_CTX_PER_DEV		31	/* FIMXME defined twice, from xhci.h */

If it is left for later, FIMXME -> FIXME

(...)
