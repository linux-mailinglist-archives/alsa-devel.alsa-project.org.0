Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5A7D869A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 18:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D9593A;
	Thu, 26 Oct 2023 18:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D9593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698337275;
	bh=uQslQQ6Pncl+TnkeyKJEh6fnFzrAMcylSVKBx7JOmbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=chlVQGTnkgsXkp3ET3rMW7FFzwdgO3N0iDsLTQ3X+0KS20u5C6sWVP+5apQuHKMNt
	 svSSxHzTvRu0RMRBK+kXZfJ9XAkspKsXnbZVAy6fQoZ9u5D+9zql1TstBtFROefMRM
	 EtDDLvm3O3VJDI21o2aBDN6roVdZ9gIzuERrxd6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05C81F80165; Thu, 26 Oct 2023 18:20:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3330DF80224;
	Thu, 26 Oct 2023 18:20:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1146AF80165; Wed, 25 Oct 2023 05:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 365C3F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 05:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365C3F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=ZUJ7L8dz
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-66d76904928so33588956d6.2
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698204277; x=1698809077;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyDODxdjT84M2KEksvTOCDI+X+3UmtCdx6mugrhmhJE=;
        b=ZUJ7L8dzeZdV65zXqG4bp+jKslij3S6WA/B3xwjq3KNurKNT4DHyyK9kuPRG/MvytX
         hD5z/5an5n7KkfQDeShwxCTVGvg3RSSxXkgPUdmzpaHc6W8hVALVfICx+LwQdzdq4cJn
         6VQIJyntXUkzVJpn3BYZuUHkDgPM927FJargK/s5iM1eBceWar8CAEOJ9UtcruJB4hKc
         1xQwcQJGMIBATxFWe1h3z24KVXEZaR82Yp44sm9q0FdA6gTMiG0HKklyx4RBpDBV8Atz
         xXXzImDriUJGs7eDMpdunFPNhFu7nXuDmJkJXOshHCrHmT08Paeq1sBexyJDAHGaFRdc
         /qQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698204277; x=1698809077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyDODxdjT84M2KEksvTOCDI+X+3UmtCdx6mugrhmhJE=;
        b=i1ohgPI87F1qb/cqSPILd6oEAgpIboxytfplBRk76mGDPMmIPEbAHOYE7JWeYJo2wJ
         8mtfVR64sNxrc9PAJidISXiuVfepSMb+swpqvDLYcBUYkyn4UXAtGAlHXFAP4gGyvHq/
         XLGqeeXEwSapqYnMq3rCCtlZwDwBBFnvi4Z4e0VD51XtGuQmdCIIn53Mp09W4s8pdGK7
         ZRA8l8tLRhlXCPkNPvojnOXplNQ2dRRIHYp5TkM0hhg54+b3rTVfWFVjsoGg4aHRJqkd
         73OxxDUhRquxX60dk01GYxI97U1OTTQDqPLS0NW3K3pVs06cW1dX1KQaTWANnCC+OP7o
         W5Mg==
X-Gm-Message-State: AOJu0YyWN+1Ya1+hC2wyauErXaRKDWMq7nZWr21MYJcLsfLnnKgogEdP
	/tjxxYhFwaoEy78t2xsvLPUrh4z+/lQ1t+DDxV1ZSA==
X-Google-Smtp-Source: 
 AGHT+IHwotWqgWqJ3sh80HIfJZMk9EK3k05Kce5JAZuwG+SqfA4L9v09W3vN29Elm16CGb5hqxQ2P/CK72Ipljv0CoY=
X-Received: by 2002:a05:6214:c45:b0:66d:3a89:813c with SMTP id
 r5-20020a0562140c4500b0066d3a89813cmr19252451qvj.53.1698204276447; Tue, 24
 Oct 2023 20:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-5-quic_wcheng@quicinc.com>
In-Reply-To: <20231017200109.11407-5-quic_wcheng@quicinc.com>
From: Albert Wang <albertccwang@google.com>
Date: Wed, 25 Oct 2023 11:24:23 +0800
Message-ID: 
 <CANqn-rjukNmj9xX8kYf6b=HvcW2wnc2RXrpcWv40zuD3J=W3Cg@mail.gmail.com>
Subject: Re: [PATCH v9 04/34] xhci: sideband: add initial api to register a
 sideband entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: albertccwang@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MSUF563JJLEOSZHREZDOCVWKQBVMGW2M
X-Message-ID-Hash: MSUF563JJLEOSZHREZDOCVWKQBVMGW2M
X-Mailman-Approved-At: Thu, 26 Oct 2023 16:20:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSUF563JJLEOSZHREZDOCVWKQBVMGW2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>+ * Returns the address of the endpoint buffer where xHC controller reads =
queued
>+ * transfer TRBs from. This is the starting address of the ringbuffer whe=
re the
>+ * sidband cliend should write TRBs to.

A typo here 'sideband cliend', it apparently should be 'sideband client'.


On Wed, Oct 18, 2023 at 4:03=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>
> Introduce XHCI sideband, which manages the USB endpoints being requested =
by
> a client driver.  This is used for when client drivers are attempting to
> offload USB endpoints to another entity for handling USB transfers.  XHCI
> sideband will allow for drivers to fetch the required information about t=
he
> transfer ring, so the user can submit transfers independently.  Expose th=
e
> required APIs for drivers to register and request for a USB endpoint and =
to
> manage XHCI secondary interrupters.
>
> Multiple ring segment page linking and proper endpoint clean up added by
> Wesley Cheng to complete original concept code by Mathias Nyman.
>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/host/Kconfig          |   9 +
>  drivers/usb/host/Makefile         |   4 +
>  drivers/usb/host/xhci-sideband.c  | 371 ++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h           |   4 +
>  include/linux/usb/xhci-sideband.h |  66 ++++++
>  5 files changed, 454 insertions(+)
>  create mode 100644 drivers/usb/host/xhci-sideband.c
>  create mode 100644 include/linux/usb/xhci-sideband.h
>
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 4448d0ab06f0..923af11c1982 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
>           Say 'Y' to enable the support for the xHCI host controller
>           found in Renesas RZ/V2M SoC.
>
> +config USB_XHCI_SIDEBAND
> +       bool "xHCI support for sideband"
> +       help
> +         Say 'Y' to enable the support for the xHCI sideband capability.
> +         provide a mechanism for a sideband datapath for payload associa=
ted
> +         with audio class endpoints. This allows for an audio DSP to use
> +         xHCI USB endpoints directly, allowing CPU to sleep while playin=
g
> +         audio
> +
>  config USB_XHCI_TEGRA
>         tristate "xHCI support for NVIDIA Tegra SoCs"
>         depends on PHY_TEGRA_XUSB
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index be4e5245c52f..4df946c05ba0 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -32,6 +32,10 @@ endif
>  xhci-rcar-hcd-y                                +=3D xhci-rcar.o
>  xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M) +=3D xhci-rzv2m.o
>
> +ifneq ($(CONFIG_USB_XHCI_SIDEBAND),)
> +       xhci-hcd-y              +=3D xhci-sideband.o
> +endif
> +
>  obj-$(CONFIG_USB_PCI)  +=3D pci-quirks.o
>
>  obj-$(CONFIG_USB_EHCI_HCD)     +=3D ehci-hcd.o
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> new file mode 100644
> index 000000000000..cc4f90375e00
> --- /dev/null
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * xHCI host controller sideband support
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + *
> + * Author: Mathias Nyman
> + */
> +
> +#include <linux/usb/xhci-sideband.h>
> +#include <linux/dma-direct.h>
> +
> +#include "xhci.h"
> +
> +/* sideband internal helpers */
> +static struct sg_table *
> +xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
> +{
> +       struct xhci_segment *seg;
> +       struct sg_table *sgt;
> +       unsigned int n_pages;
> +       struct page **pages;
> +       struct device *dev;
> +       size_t sz;
> +       int i;
> +
> +       dev =3D xhci_to_hcd(sb->xhci)->self.sysdev;
> +       sz =3D ring->num_segs * TRB_SEGMENT_SIZE;
> +       n_pages =3D PAGE_ALIGN(sz) >> PAGE_SHIFT;
> +       pages =3D kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERN=
EL);
> +       if (!pages)
> +               return NULL;
> +
> +       sgt =3D kzalloc(sizeof(struct sg_table), GFP_KERNEL);
> +       if (!sgt) {
> +               kvfree(pages);
> +               return NULL;
> +       }
> +
> +       seg =3D ring->first_seg;
> +       /*
> +        * Rings can potentially have multiple segments, create an array =
that
> +        * carries page references to allocated segments.  Utilize the
> +        * sg_alloc_table_from_pages() to create the sg table, and to ens=
ure
> +        * that page links are created.
> +        */
> +       for (i =3D 0; i < ring->num_segs; i++) {
> +               dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
> +                                       TRB_SEGMENT_SIZE);
> +               pages[i] =3D sg_page(sgt->sgl);
> +               sg_free_table(sgt);
> +               seg =3D seg->next;
> +       }
> +
> +       if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KER=
NEL)) {
> +               kvfree(pages);
> +               kfree(sgt);
> +
> +               return NULL;
> +       }
> +       /*
> +        * Save first segment dma address to sg dma_address field for the=
 sideband
> +        * client to have access to the IOVA of the ring.
> +        */
> +       sg_dma_address(sgt->sgl) =3D ring->first_seg->dma;
> +
> +       return sgt;
> +}
> +
> +static void
> +__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_vi=
rt_ep *ep)
> +{
> +       /*
> +        * Issue a stop endpoint command when an endpoint is removed.
> +        * The stop ep cmd handler will handle the ring cleanup.
> +        */
> +       xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +
> +       ep->sideband =3D NULL;
> +       sb->eps[ep->ep_index] =3D NULL;
> +}
> +
> +/* sideband api functions */
> +
> +/**
> + * xhci_sideband_add_endpoint - add endpoint to sideband access list
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Adds an endpoint to the list of sideband accessed endpoints for this =
usb
> + * device.
> + * After an endpoint is added the sideband client can get the endpoint t=
ransfer
> + * ring buffer by calling xhci_sideband_endpoint_buffer()
> + *
> + * Return: 0 on success, negative error otherwise.
> + */
> +int
> +xhci_sideband_add_endpoint(struct xhci_sideband *sb,
> +                          struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D &sb->vdev->eps[ep_index];
> +
> +       if (ep->ep_state & EP_HAS_STREAMS)
> +               return -EINVAL;
> +
> +       /*
> +        * Note, we don't know the DMA mask of the audio DSP device, if i=
ts
> +        * smaller than for xhci it won't be able to access the endpoint =
ring
> +        * buffer. This could be solved by not allowing the audio class d=
river
> +        * to add the endpoint the normal way, but instead offload it imm=
ediately,
> +        * and let this function add the endpoint and allocate the ring b=
uffer
> +        * with the smallest common DMA mask
> +        */
> +
> +       if (sb->eps[ep_index] || ep->sideband)
> +               return -EBUSY;
> +
> +       ep->sideband =3D sb;
> +       sb->eps[ep_index] =3D ep;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
> +
> +/**
> + * xhci_sideband_remove_endpoint - remove endpoint from sideband access =
list
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Removes an endpoint from the list of sideband accessed endpoints for =
this usb
> + * device.
> + * sideband client should no longer touch the endpoint transfer buffer a=
fter
> + * calling this.
> + *
> + * Return: 0 on success, negative error otherwise.
> + */
> +int
> +xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
> +                             struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D sb->eps[ep_index];
> +
> +       if (!ep || !ep->sideband)
> +               return -ENODEV;
> +
> +       __xhci_sideband_remove_endpoint(sb, ep);
> +       xhci_initialize_ring_info(ep->ring, 1);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
> +
> +int
> +xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
> +                           struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D sb->eps[ep_index];
> +
> +       if (!ep || ep->sideband !=3D sb)
> +               return -EINVAL;
> +
> +       return xhci_stop_endpoint_sync(sb->xhci, ep, 0);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
> +
> +/**
> + * xhci_sideband_get_endpoint_buffer - gets the endpoint transfer buffer=
 address
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Returns the address of the endpoint buffer where xHC controller reads=
 queued
> + * transfer TRBs from. This is the starting address of the ringbuffer wh=
ere the
> + * sidband cliend should write TRBs to.
> + *
> + * Caller needs to free the returned sg_table
> + *
> + * Return: struct sg_table * if successful. NULL otherwise.
> + */
> +struct sg_table *
> +xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
> +                             struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D sb->eps[ep_index];
> +
> +       if (!ep)
> +               return NULL;
> +
> +       return xhci_ring_to_sgtable(sb, ep->ring);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
> +
> +/**
> + * xhci_sideband_get_event_buffer - return the event buffer for this dev=
ice
> + * @sb: sideband instance for this usb device
> + *
> + * If a secondary xhci interupter is set up for this usb device then thi=
s
> + * function returns the address of the event buffer where xHC writes
> + * the transfer completion events.
> + *
> + * Caller needs to free the returned sg_table
> + *
> + * Return: struct sg_table * if successful. NULL otherwise.
> + */
> +struct sg_table *
> +xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
> +{
> +       if (!sb->ir)
> +               return NULL;
> +
> +       return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
> +
> +/**
> + * xhci_sideband_create_interrupter - creates a new interrupter for this=
 sideband
> + * @sb: sideband instance for this usb device
> + *
> + * Sets up a xhci interrupter that can be used for this sideband accesse=
d usb
> + * device. Transfer events for this device can be routed to this interru=
pters
> + * event ring by setting the 'Interrupter Target' field correctly when q=
ueueing
> + * the transfer TRBs.
> + * Once this interrupter is created the interrupter target ID can be obt=
ained
> + * by calling xhci_sideband_interrupter_id()
> + *
> + * Returns 0 on success, negative error otherwise
> + */
> +int
> +xhci_sideband_create_interrupter(struct xhci_sideband *sb)
> +{
> +       if (sb->ir)
> +               return -EBUSY;
> +
> +       sb->ir =3D xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci=
));
> +       if (!sb->ir)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
> +
> +/**
> + * xhci_sideband_remove_interrupter - remove the interrupter from a side=
band
> + * @sb: sideband instance for this usb device
> + *
> + * Removes a registered interrupt for a sideband.  This would allow for =
other
> + * sideband users to utilize this interrupter.
> + */
> +void
> +xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
> +{
> +       if (!sb || !sb->ir)
> +               return;
> +
> +       xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
> +
> +       sb->ir =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
> +
> +/**
> + * xhci_sideband_interrupter_id - return the interrupter target id
> + * @sb: sideband instance for this usb device
> + *
> + * If a secondary xhci interrupter is set up for this usb device then th=
is
> + * function returns the ID used by the interrupter. The sideband client
> + * needs to write this ID to the 'Interrupter Target' field of the trans=
fer TRBs
> + * it queues on the endpoints transfer ring to ensure transfer completio=
n event
> + * are written by xHC to the correct interrupter event ring.
> + *
> + * Returns interrupter id on success, negative error othgerwise
> + */
> +int
> +xhci_sideband_interrupter_id(struct xhci_sideband *sb)
> +{
> +       if (!sb || !sb->ir)
> +               return -ENODEV;
> +
> +       return sb->ir->intr_num;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
> +
> +/**
> + * xhci_sideband_register - register a sideband for a usb device
> + * @udev: usb device to be accessed via sideband
> + *
> + * Allows for clients to utilize XHCI interrupters and fetch transfer an=
d event
> + * ring parameters for executing data transfers.
> + *
> + * Return: pointer to a new xhci_sideband instance if successful. NULL o=
therwise.
> + */
> +struct xhci_sideband *
> +xhci_sideband_register(struct usb_device *udev)
> +{
> +       struct usb_hcd *hcd =3D bus_to_hcd(udev->bus);
> +       struct xhci_hcd *xhci =3D hcd_to_xhci(hcd);
> +       struct xhci_virt_device *vdev;
> +       struct xhci_sideband *sb;
> +
> +       /* make sure the usb device is connected to a xhci controller */
> +       if (!udev->slot_id)
> +               return NULL;
> +
> +       sb =3D kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->sel=
f.sysdev));
> +       if (!sb)
> +               return NULL;
> +
> +       /* check this device isn't already controlled via sideband */
> +       spin_lock_irq(&xhci->lock);
> +
> +       vdev =3D xhci->devs[udev->slot_id];
> +
> +       if (!vdev || vdev->sideband) {
> +               xhci_warn(xhci, "XHCI sideband for slot %d already in use=
\n",
> +                         udev->slot_id);
> +               spin_unlock_irq(&xhci->lock);
> +               kfree(sb);
> +               return NULL;
> +       }
> +
> +       sb->xhci =3D xhci;
> +       sb->vdev =3D vdev;
> +       vdev->sideband =3D sb;
> +
> +       spin_unlock_irq(&xhci->lock);
> +
> +       return sb;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_register);
> +
> +/**
> + * xhci_sideband_unregister - unregister sideband access to a usb device
> + * @sb: sideband instance to be unregistered
> + *
> + * Unregisters sideband access to a usb device and frees the sideband
> + * instance.
> + * After this the endpoint and interrupter event buffers should no longe=
r
> + * be accessed via sideband. The xhci driver can now take over handling
> + * the buffers.
> + */
> +void
> +xhci_sideband_unregister(struct xhci_sideband *sb)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < EP_CTX_PER_DEV; i++)
> +               if (sb->eps[i])
> +                       __xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +
> +       xhci_sideband_remove_interrupter(sb);
> +
> +       sb->vdev->sideband =3D NULL;
> +       kfree(sb);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 4b8caaed6f95..339d37c3a3d9 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -947,6 +947,8 @@ struct xhci_virt_ep {
>         int                     next_frame_id;
>         /* Use new Isoch TRB layout needed for extended TBC support */
>         bool                    use_extended_tbc;
> +       /* set if this endpoint is controlled via sideband access*/
> +       struct xhci_sideband                    *sideband;
>  };
>
>  enum xhci_overhead_type {
> @@ -1010,6 +1012,8 @@ struct xhci_virt_device {
>         u16                             current_mel;
>         /* Used for the debugfs interfaces. */
>         void                            *debugfs_private;
> +       /* set if this device is registered for sideband access */
> +       struct xhci_sideband                    *sideband;
>  };
>
>  /*
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-s=
ideband.h
> new file mode 100644
> index 000000000000..c1457d1800f4
> --- /dev/null
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -0,0 +1,66 @@
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
> +#define        EP_CTX_PER_DEV          31      /* FIMXME defined twice, =
from xhci.h */
> +
> +struct xhci_sideband;
> +
> +/**
> + * struct xhci_sideband - representation of a sideband accessed usb devi=
ce.
> + * @xhci: The xhci host controller the usb device is connected to
> + * @vdev: the usb device accessed via sideband
> + * @eps: array of endpoints controlled via sideband
> + * @ir: event handling and buffer for sideband accessed device
> + *
> + * FIXME usb device accessed via sideband Keeping track of sideband acce=
ssed usb devices.
> + */
> +
> +struct xhci_sideband {
> +       struct xhci_hcd                 *xhci;
> +       struct xhci_virt_device         *vdev;
> +       struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
> +       struct xhci_interrupter         *ir;
> +};
> +
> +struct xhci_sideband *
> +xhci_sideband_register(struct usb_device *udev);
> +void
> +xhci_sideband_unregister(struct xhci_sideband *sb);
> +int
> +xhci_sideband_add_endpoint(struct xhci_sideband *sb,
> +                          struct usb_host_endpoint *host_ep);
> +int
> +xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
> +                             struct usb_host_endpoint *host_ep);
> +int
> +xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
> +                           struct usb_host_endpoint *host_ep);
> +struct sg_table *
> +xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
> +                                 struct usb_host_endpoint *host_ep);
> +struct sg_table *
> +xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
> +
> +int
> +xhci_sideband_create_interrupter(struct xhci_sideband *sb);
> +
> +void
> +xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
> +
> +int
> +xhci_sideband_interrupter_id(struct xhci_sideband *sb);
> +
> +#endif /* __LINUX_XHCI_SIDEBAND_H */
> +
>
