Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F352F7B1E93
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 15:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E80ADEC;
	Thu, 28 Sep 2023 15:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E80ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695908164;
	bh=2q/ofJbjVnxsiWF4wpyLGs7XzpOCXPm/6xI4ePXLves=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O4eingds2agZyIzUiqulun2Bc66zcho95PG88SW12d0Cxd7HQ1M71s2cfMCBYgBi/
	 iw+aWnm7AUn0xXmxekfVHRZf3c03vED86PgGDngt1i5+ZDc9eRhUv5wzkPPkXswKd+
	 Xct9sx/0B7kTdx32lB+FZaQxHPneCV4a+T35nmP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5886F80551; Thu, 28 Sep 2023 15:35:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D1D2F8016A;
	Thu, 28 Sep 2023 15:35:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD51CF801D5; Thu, 28 Sep 2023 15:35:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE2D3F80130
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 15:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE2D3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M6cRgirD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695908103; x=1727444103;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=2q/ofJbjVnxsiWF4wpyLGs7XzpOCXPm/6xI4ePXLves=;
  b=M6cRgirDyCgjsfV8+TxX7l3zfc3P8wmpwSPPSypTOsK95luZgVSwSRLA
   EyECF30T6A7c8bFiKUQYZF2O9YZLL26IeUZWCAuP/y3dWRcNUktLKU4sD
   ALE+jhKBbiekco9DLbEecAki/rXYfd8F+YZ0VEwy/zmj4hW3WXOl32L0d
   0wOuBTuwv62ujHSXHST3f6MdsfUt+gLcCY+32w9M+eHHFTqQfotL5BSXq
   b3oHCBBJBbfVPSnj1b6OBmOdBB8va0u/UXiaHxhKx0qfeXBtB5sRPhBTu
   WWDrjV4Qlh75lDS/2Y9dYyeOLQlsjOZONJARgvkNakkDXtg/yqDqWqLE1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381968822"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200";
   d="scan'208";a="381968822"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923216353"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200";
   d="scan'208";a="923216353"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 06:30:28 -0700
Message-ID: <6e9d2094-0bf9-b2ac-29f3-99115b456fdb@linux.intel.com>
Date: Thu, 28 Sep 2023 16:31:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-3-quic_wcheng@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v7 02/33] xhci: add helper to stop endpoint and wait for
 completion
In-Reply-To: <20230921214843.18450-3-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NONHHM3NHQYTDF4IW3BNGYYJULG5KLLX
X-Message-ID-Hash: NONHHM3NHQYTDF4IW3BNGYYJULG5KLLX
X-MailFrom: mathias.nyman@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NONHHM3NHQYTDF4IW3BNGYYJULG5KLLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22.9.2023 0.48, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
> xhci_queue_stop_endpoint().  This is useful for client drivers that are
> using the secondary interrupters, and need to stop/clean up the current
> session.  The stop endpoint command handler will also take care of cleaning
> up the ring.
> 
> Modifications to repurpose the new API into existing stop endpoint
> sequences was implemented by Wesley Cheng.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-hub.c | 29 +++---------------
>   drivers/usb/host/xhci.c     | 60 +++++++++++++++++++++++++++----------
>   drivers/usb/host/xhci.h     |  2 ++
>   3 files changed, 50 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 0054d02239e2..2f7309bdc922 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -489,7 +489,6 @@ EXPORT_SYMBOL_GPL(xhci_find_slot_id_by_port);
>   static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
>   {
>   	struct xhci_virt_device *virt_dev;
> -	struct xhci_command *cmd;
>   	unsigned long flags;
>   	int ret;
>   	int i;
> @@ -501,10 +500,6 @@ static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
>   
>   	trace_xhci_stop_device(virt_dev);
>   
> -	cmd = xhci_alloc_command(xhci, true, GFP_NOIO);
> -	if (!cmd)
> -		return -ENOMEM;
> -
>   	spin_lock_irqsave(&xhci->lock, flags);
>   	for (i = LAST_EP_INDEX; i > 0; i--) {
>   		if (virt_dev->eps[i].ring && virt_dev->eps[i].ring->dequeue) {
> @@ -521,7 +516,7 @@ static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
>   			if (!command) {
>   				spin_unlock_irqrestore(&xhci->lock, flags);
>   				ret = -ENOMEM;
> -				goto cmd_cleanup;
> +				goto out;
>   			}
>   
>   			ret = xhci_queue_stop_endpoint(xhci, command, slot_id,
> @@ -529,30 +524,14 @@ static int xhci_stop_device(struct xhci_hcd *xhci, int slot_id, int suspend)
>   			if (ret) {
>   				spin_unlock_irqrestore(&xhci->lock, flags);
>   				xhci_free_command(xhci, command);
> -				goto cmd_cleanup;
> +				goto out;
>   			}
>   		}
>   	}
> -	ret = xhci_queue_stop_endpoint(xhci, cmd, slot_id, 0, suspend);
> -	if (ret) {
> -		spin_unlock_irqrestore(&xhci->lock, flags);
> -		goto cmd_cleanup;
> -	}
> -
> -	xhci_ring_cmd_db(xhci);
>   	spin_unlock_irqrestore(&xhci->lock, flags);
> +	ret = xhci_stop_endpoint_sync(xhci, &virt_dev->eps[0], suspend);

I didn't take this new xhci_stop_endpoint_sync() helper into use as it causes an extra
xhci spinlock release and reacquire here.

Also the memory allocation flags differ, GFP_NOIO is turned into GFP_KERNEL after this change.

>   
> -	/* Wait for last stop endpoint command to finish */
> -	wait_for_completion(cmd->completion);
> -
> -	if (cmd->status == COMP_COMMAND_ABORTED ||
> -	    cmd->status == COMP_COMMAND_RING_STOPPED) {
> -		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
> -		ret = -ETIME;
> -	}
> -
> -cmd_cleanup:
> -	xhci_free_command(xhci, cmd);
> +out:
>   	return ret;
>   }
>   
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 3fd2b58ee1d3..163d533d6200 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -2758,6 +2758,46 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>   	return -ENOMEM;
>   }
>   
> +/*
> + * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
> + * waits for the command completion before returning.
> + */
> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend)
> +{
> +	struct xhci_command *command;
> +	unsigned long flags;
> +	int ret;
> +
> +	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
> +	if (!command)
> +		return -ENOMEM;
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
> +				       ep->ep_index, suspend);
> +	if (ret < 0) {
> +		spin_unlock_irqrestore(&xhci->lock, flags);
> +		goto out;
> +	}
> +
> +	xhci_ring_cmd_db(xhci);
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	ret = wait_for_completion_timeout(command->completion, msecs_to_jiffies(3000));
> +	if (!ret)
> +		xhci_warn(xhci, "%s: Unable to stop endpoint.\n",
> +				__func__);
> +
> +	if (command->status == COMP_COMMAND_ABORTED ||
> +	    command->status == COMP_COMMAND_RING_STOPPED) {
> +		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
> +		ret = -ETIME;
> +	}
> +out:
> +	xhci_free_command(xhci, command);
> +
> +	return ret;
> +}
>   
>   /* Issue a configure endpoint command or evaluate context command
>    * and wait for it to finish.
> @@ -3078,7 +3118,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
>   	struct xhci_virt_device *vdev;
>   	struct xhci_virt_ep *ep;
>   	struct xhci_input_control_ctx *ctrl_ctx;
> -	struct xhci_command *stop_cmd, *cfg_cmd;
> +	struct xhci_command *cfg_cmd;
>   	unsigned int ep_index;
>   	unsigned long flags;
>   	u32 ep_flag;
> @@ -3118,10 +3158,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
>   	if (ep_flag == SLOT_FLAG || ep_flag == EP0_FLAG)
>   		return;
>   
> -	stop_cmd = xhci_alloc_command(xhci, true, GFP_NOWAIT);
> -	if (!stop_cmd)
> -		return;
> -
>   	cfg_cmd = xhci_alloc_command_with_ctx(xhci, true, GFP_NOWAIT);
>   	if (!cfg_cmd)
>   		goto cleanup;
> @@ -3144,23 +3180,16 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
>   		goto cleanup;
>   	}
>   
> -	err = xhci_queue_stop_endpoint(xhci, stop_cmd, udev->slot_id,
> -					ep_index, 0);
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +

Same here, extra unlock -> lock, and GFP flags differ.


> +	err = xhci_stop_endpoint_sync(xhci, ep, 0);

Thanks
Mathias

