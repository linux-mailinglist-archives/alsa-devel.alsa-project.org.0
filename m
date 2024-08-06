Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4A949424
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 17:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D0863D2E;
	Tue,  6 Aug 2024 17:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D0863D2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722956699;
	bh=Oz7qSUD/KpSY3UkpQxjeZSRwS0zAQNSUl64r7woFeHY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qwMHfyPJA1uTn/2rTB+WzQ1NE8qJmiy4o2hI1qK5PakO8GBSc6gn3R9chJcOpqINF
	 n8fwdUCxgQDRKYcv42B4tW8eNqkITyiz07G9QhS52jpqvS/tgWt1/nDv3d3RFzECV5
	 2Emlwi0Cho4VTLAWWKU6iqno7gJt6eUxsnH+Ehyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58788F805A8; Tue,  6 Aug 2024 17:04:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86073F805B0;
	Tue,  6 Aug 2024 17:04:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F0CF802DB; Tue,  6 Aug 2024 16:53:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 603ADF8023A
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 603ADF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CxnmDHcp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955819; x=1754491819;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oz7qSUD/KpSY3UkpQxjeZSRwS0zAQNSUl64r7woFeHY=;
  b=CxnmDHcpYZCLGu5cajQd/7xItET4wTlIrNBouWYgi0+NxFCyldM1FWti
   GHWuOJxlh5tYVcgfYVJ49fhDNRGxdPVpDLTKEMDuaWvaS53FJXbYR39Qr
   TJWyMdFlTVg7aLrMNpbxmIuuitR7tPs4oNg5+WV7cPGFLbgL4yjDBT0L8
   91TYFv19tlSBURWJZbT1NABhPHumjIgmbtVSxunUYFfm6JIhXWZ1jBngK
   L/ZB0VsN2OT7G12vH0usGrjjuhQKqkwieO6hyEQEIdJ0/AikzsLRSBZLE
   SPNbY6bL+mSJRadef8eHFG7N30zzRSAxDi/zwbyUbWvcofQkk1am3ZV3T
   g==;
X-CSE-ConnectionGUID: FI13XXnTR/C94Or8snrueg==
X-CSE-MsgGUID: hf3A86YISZy8tiopLADMxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101458"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="21101458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:50:12 -0700
X-CSE-ConnectionGUID: gpz1VDRMRQiy+vklacVUxA==
X-CSE-MsgGUID: /WU0HS0aRFe10vT6NSeMCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="87476457"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:50:06 -0700
Message-ID: <b8e67410-49a0-4ee8-a0a5-4b7ba03483c8@linux.intel.com>
Date: Tue, 6 Aug 2024 16:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/34] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-6-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-6-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DQQVXQS7Q2KZPNMFM3KQGFAGLIWBN463
X-Message-ID-Hash: DQQVXQS7Q2KZPNMFM3KQGFAGLIWBN463
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQQVXQS7Q2KZPNMFM3KQGFAGLIWBN463/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> As part of xHCI bus suspend, the XHCI is halted.  However, if there are

XHCI -> xHCI

> pending events in the secondary event ring, it is observed that the xHCI
> controller stops responding to further commands upon host or device
> initiated bus resume.  Iterate through all pending events and update the
> dequeue pointer to the beginning of the event ring.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-mem.c  |  7 ++++++-
>   drivers/usb/host/xhci-ring.c | 33 ++++++++++++++++++++++++++++++++-
>   drivers/usb/host/xhci.c      |  2 +-
>   drivers/usb/host/xhci.h      |  6 ++++++
>   4 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 2ca5937b73f4..60dfc59260d8 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1816,7 +1816,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>   		tmp &= ERST_SIZE_MASK;
>   		writel(tmp, &ir->ir_set->erst_size);
>   
> -		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
> +		xhci_update_erst_dequeue(xhci, ir, true);
>   	}
>   }
>   
> @@ -1859,6 +1859,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
>   		return;
>   	}
>   
> +	/*
> +	 * Cleanup secondary interrupter to ensure there are no pending events.
> +	 * This also updates event ring dequeue pointer back to the start.
> +	 */
> +	xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
>   	intr_num = ir->intr_num;
>   
>   	xhci_remove_interrupter(xhci, ir);
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 80dca780317a..a012ddf94fb5 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3012,7 +3012,7 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
>    * - When all events have finished
>    * - To avoid "Event Ring Full Error" condition
>    */
> -static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>   				     struct xhci_interrupter *ir,
>   				     bool clear_ehb)
>   {
> @@ -3112,6 +3112,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
>   	return 0;
>   }
>   
> +/*
> + * Move the event ring dequeue pointer to skip events kept in the secondary
> + * event ring.  This is used to ensure that pending events in the ring are
> + * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The

XHCI -> xHCI

> + * secondary ring is typically maintained by an external component.
> + */
> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> +	struct xhci_ring *ring,	struct xhci_interrupter *ir)
> +{
> +	union xhci_trb *current_trb;
> +	u64 erdp_reg;
> +	dma_addr_t deq;
> +
> +	/* disable irq, ack pending interrupt and ack all pending events */
> +	xhci_disable_interrupter(ir);

That seems like a bit weird place to disable interrupter? Perhaps 
suspend and resume functions should be updated to handle more 
interrupters instead?

