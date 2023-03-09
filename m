Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526AA6B1BA5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 07:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85791189A;
	Thu,  9 Mar 2023 07:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85791189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678343956;
	bh=9nSwtX3Wf3/5+FtvhHud7kQXnwukhhS9l0t7/nNRwok=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aYe4V878R1+LpcbZISlfys5CYun38IApAKJEPdCswVB7M/SQpn1VLEBWBXuH29lwB
	 hX50JH3X3qEpSfVEBWgfpHPkVQQwGOqFqS85zBQ+0W1PvNqwHCvwCEtFmR9wnS6z96
	 SjT/hu3wQ4x81tndFTcbc5qMDXE2p8A5D/NemR9A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4359F80236;
	Thu,  9 Mar 2023 07:38:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3F10F8042F; Thu,  9 Mar 2023 07:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E06A5F800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E06A5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZaIxZhuP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDF0060A75;
	Thu,  9 Mar 2023 06:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BB5C433D2;
	Thu,  9 Mar 2023 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678343884;
	bh=9nSwtX3Wf3/5+FtvhHud7kQXnwukhhS9l0t7/nNRwok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaIxZhuPjcAExla3SzFkbj7+7Rt4x9y5wh/8+bgaTXCuKUUyEzbcFdJmCRtxJ993k
	 Ncz8MfR+Ia9lxpYbmnTl2aYEVJUPyYL75/YRo6OO1dXSXsgmy8UIGImgsrSG5nS1+s
	 DqZjGmiT6M8d9FGFsHxGVtthkDutN4Qfoo5jN7wA=
Date: Thu, 9 Mar 2023 07:38:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v3 02/28] usb: xhci: Add XHCI APIs to support USB
 offloading
Message-ID: <ZAl+ydxOCoGXIj1Y@kroah.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-3-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308235751.495-3-quic_wcheng@quicinc.com>
Message-ID-Hash: DQCCHQ4D72QB5DHBHAORA6QJ5EDAMUBP
X-Message-ID-Hash: DQCCHQ4D72QB5DHBHAORA6QJ5EDAMUBP
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQCCHQ4D72QB5DHBHAORA6QJ5EDAMUBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 08, 2023 at 03:57:25PM -0800, Wesley Cheng wrote:
> Some use cases, such as USB audio offloading, will allow for a DSP to take
> over issuing USB transfers to the host controller.  In order for the DSP to
> submit transfers for a particular endpoint, and to handle its events, the
> client driver will need to query for some parameters allocated by XHCI.
> 
> - XHCI secondary interrupter event ring address
> - XHCI transfer ring address (for a particular EP)
> - Stop endpoint command API
> 
> Once the resources are handed off to the DSP, the offload begins, and the
> main processor can enter idle.  When stopped, since there are no URBs
> submitted from the main processor, the client will just issue a stop
> endpoint command to halt any pending transfers.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/host/xhci.c       | 130 ++++++++++++++++++++++++++++++++++
>  include/linux/usb/xhci-intr.h |   8 +++
>  2 files changed, 138 insertions(+)

Please use checkpatch.pl on your patches before sending them out :(

Some other minor comments:

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 88435b9cd66e..5c6b3d8f834c 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1603,6 +1603,136 @@ static int xhci_check_args(struct usb_hcd *hcd, struct usb_device *udev,
>  	return 1;
>  }
>  
> +int xhci_stop_endpoint(struct usb_device *udev,
> +			struct usb_host_endpoint *ep)

That all can be on one line, right?

And no documentation for a global function?

> +{
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +	unsigned int ep_index;
> +	struct xhci_virt_device *virt_dev;
> +	struct xhci_command *cmd;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	ret = xhci_check_args(hcd, udev, ep, 1, true, __func__);
> +	if (ret <= 0)
> +		return ret;
> +
> +	cmd = xhci_alloc_command(xhci, true, GFP_NOIO);
> +	if (!cmd)
> +		return -ENOMEM;
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +	virt_dev = xhci->devs[udev->slot_id];
> +	if (!virt_dev) {
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	ep_index = xhci_get_endpoint_index(&ep->desc);
> +	if (virt_dev->eps[ep_index].ring &&
> +			virt_dev->eps[ep_index].ring->dequeue) {
> +		ret = xhci_queue_stop_endpoint(xhci, cmd, udev->slot_id,
> +				ep_index, 0);
> +		if (ret)
> +			goto err;
> +
> +		xhci_ring_cmd_db(xhci);
> +		spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +		/* Wait for stop endpoint command to finish */
> +		wait_for_completion(cmd->completion);
> +
> +		if (cmd->status == COMP_COMMAND_ABORTED ||
> +				cmd->status == COMP_STOPPED) {
> +			xhci_warn(xhci,
> +				"stop endpoint command timeout for ep%d%s\n",
> +				usb_endpoint_num(&ep->desc),
> +				usb_endpoint_dir_in(&ep->desc) ? "in" : "out");
> +			ret = -ETIME;
> +				}
> +		goto free_cmd;
> +	}
> +
> +err:
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +free_cmd:
> +	xhci_free_command(xhci, cmd);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xhci_stop_endpoint);
> +
> +/* Retrieve the transfer ring base address for a specific endpoint. */

At least some comment, but not much for a global function.

> +phys_addr_t xhci_get_xfer_resource(struct usb_device *udev,
> +					struct usb_host_endpoint *ep, dma_addr_t *dma)
> +{
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct device *dev = hcd->self.sysdev;
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +	struct sg_table sgt;
> +	phys_addr_t pa;
> +	int ret;
> +	unsigned int ep_index;
> +	struct xhci_virt_device *virt_dev;
> +	unsigned long flags;
> +
> +	if (!HCD_RH_RUNNING(hcd))
> +		return 0;

Isn't 0 a valid address?


> +
> +	ret = xhci_check_args(hcd, udev, ep, 1, true, __func__);
> +	if (ret <= 0) {
> +		xhci_err(xhci, "%s: invalid args\n", __func__);
> +		return 0;
> +	}
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +
> +	virt_dev = xhci->devs[udev->slot_id];
> +	ep_index = xhci_get_endpoint_index(&ep->desc);
> +
> +	if (virt_dev->eps[ep_index].ring &&
> +		virt_dev->eps[ep_index].ring->first_seg) {
> +
> +		dma_get_sgtable(dev, &sgt,
> +			virt_dev->eps[ep_index].ring->first_seg->trbs,
> +			virt_dev->eps[ep_index].ring->first_seg->dma,
> +			TRB_SEGMENT_SIZE);
> +
> +		*dma = virt_dev->eps[ep_index].ring->first_seg->dma;
> +
> +		pa = page_to_phys(sg_page(sgt.sgl));
> +		sg_free_table(&sgt);
> +		spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +		return pa;
> +	}
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_get_xfer_resource);
> +
> +phys_addr_t xhci_get_ir_resource(struct usb_device *udev, struct xhci_interrupter *ir)

kerneldoc for global functions?

> +{
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct device *dev = hcd->self.sysdev;
> +	struct sg_table sgt;
> +	phys_addr_t pa;
> +
> +	if (!ir)
> +		return 0;

How can ir ever be NULL?  You control the callers, just don't do that.

> +
> +	dma_get_sgtable(dev, &sgt, ir->event_ring->first_seg->trbs,
> +		ir->event_ring->first_seg->dma, TRB_SEGMENT_SIZE);
> +
> +	pa = page_to_phys(sg_page(sgt.sgl));
> +	sg_free_table(&sgt);
> +
> +	return pa;
> +}
> +EXPORT_SYMBOL_GPL(xhci_get_ir_resource);
> +
>  static int xhci_configure_endpoint(struct xhci_hcd *xhci,
>  		struct usb_device *udev, struct xhci_command *command,
>  		bool ctx_change, bool must_succeed);
> diff --git a/include/linux/usb/xhci-intr.h b/include/linux/usb/xhci-intr.h
> index 738b0f0481a6..d42cc9a1e698 100644
> --- a/include/linux/usb/xhci-intr.h
> +++ b/include/linux/usb/xhci-intr.h
> @@ -80,7 +80,15 @@ struct xhci_interrupter {
>  	u64	s3_erst_dequeue;
>  };
>  
> +/* Secondary interrupter */
>  struct xhci_interrupter *
>  xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num);
>  void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir);
> +
> +/* Offload */
> +int xhci_stop_endpoint(struct usb_device *udev,
> +			struct usb_host_endpoint *ep);
> +phys_addr_t xhci_get_xfer_resource(struct usb_device *udev,
> +					struct usb_host_endpoint *ep, dma_addr_t *dma);
> +phys_addr_t xhci_get_ir_resource(struct usb_device *udev, struct xhci_interrupter *ir);

Why are these functions unique to offload?

thanks,

greg k-h
