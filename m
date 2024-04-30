Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C068B7209
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 13:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66AC59F6;
	Tue, 30 Apr 2024 13:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66AC59F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714475010;
	bh=WEpGkinjP85gZ1yikgGfZHLhlM9a1u3AEgisLuq7IPY=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O8Vsryjyh57htv6CbqICTubCUI1iG82wusWt8UHo4AGGyOyMbqEP5JSNaYyVSiIIW
	 msToEXh94sbI2fm3Af+B6u6LpiBtFEaIvH0B+tzUu8HLHbsszioXRyCyLDv/QPb1M0
	 PrmC7WTS3TlTIuXCjibrdy6KIF/IyUOEY1L1GncM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BD6FF804F2; Tue, 30 Apr 2024 13:02:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A404F80580;
	Tue, 30 Apr 2024 13:02:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2178F80266; Tue, 30 Apr 2024 13:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42448F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 13:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42448F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dPt4qRut
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714474968; x=1746010968;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=WEpGkinjP85gZ1yikgGfZHLhlM9a1u3AEgisLuq7IPY=;
  b=dPt4qRutxfFc7UdKfH0DYIkHulOXo/vAiqEquxCA2J6jfFuAZBYzWcyR
   Brcing/dD3rohFgvUQPwhTTR43USw+MXN4OVxTNc9a6nvl71gXnatfMrP
   3trsSQhhriUBk2kKbF8x4EuxGoGo+jkZdy4kyhKzuLXp4gOWZ0Bw9cCao
   2BuZR4BS6tcRHKrDm2TjU4gxDauuLa2mSbOkvYoLfWZQWiGVhcYCTYPqR
   9baUey001ay0B3oWit/BHDMlNsYRykKbMJPwRBCg6Uqgth29RZm0x6uSQ
   2IlHECIqELcjJAx+QDm5wRk3cQOFsZyL6Zy/N57+WGSNNypIpbA91As6T
   w==;
X-CSE-ConnectionGUID: 9IubclA2QjS72GK7T4xMHQ==
X-CSE-MsgGUID: clddqJkqS5eLl+HF2fuzgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10049972"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000";
   d="scan'208";a="10049972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 04:01:14 -0700
X-CSE-ConnectionGUID: ZYP4FPMyTz+USEUyCE9qJw==
X-CSE-MsgGUID: 7E29hnIZQbuS2emcfSjQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000";
   d="scan'208";a="26845804"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2024 04:01:07 -0700
Message-ID: <12d29c54-c005-7112-0933-d9d28f11abd6@linux.intel.com>
Date: Tue, 30 Apr 2024 14:02:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-4-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v20 03/41] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
In-Reply-To: <20240425215125.29761-4-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GKW4N22DV7HIWFIYMDAWKSGHATIZO242
X-Message-ID-Hash: GKW4N22DV7HIWFIYMDAWKSGHATIZO242
X-MailFrom: mathias.nyman@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKW4N22DV7HIWFIYMDAWKSGHATIZO242/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26.4.2024 0.50, Wesley Cheng wrote:
> Depending on the interrupter use case, the OS may only be used to handle
> the interrupter event ring clean up.  In these scenarios, event TRBs don't
> need to be handled by the OS, so introduce an xhci interrupter flag to tag
> if the events from an interrupter needs to be handled or not.

Could you elaborate on this a bit.

If I understood correctly the whole point of requesting a secondary xhci interrupter
for the sideband device without ever requesting a real interrupt for it was to avoid
waking up the cpu and calling the interrupt handler.

with this flag is seems the normal xhci interrupt handler does get called for
sideband transfer events.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
>   drivers/usb/host/xhci.h      |  1 +
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 52278afea94b..6c7a21f522cd 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2973,14 +2973,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>   }
>   
>   /*
> - * This function handles one OS-owned event on the event ring. It may drop
> - * xhci->lock between event processing (e.g. to pass up port status changes).
> + * This function handles one OS-owned event on the event ring, or ignores one event
> + * on interrupters which are non-OS owned. It may drop xhci->lock between event
> + * processing (e.g. to pass up port status changes).
>    */
>   static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>   				 union xhci_trb *event)
>   {
>   	u32 trb_type;
>   
> +	/*
> +	 * Some interrupters do not need to handle event TRBs, as they may be
> +	 * managed by another entity, but rely on the OS to clean up.
> +	 */
> +	if (ir->skip_events)
> +		return 0;
> +

I think we need another solution than a skip_events flag.

To make secondary xhci interrupters more useful in general it would make more
sense to add an interrupt handler function pointer to struct xhci_interrupter.

Then call that function instead of xhci_handle_event_trb()

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3098,8 +3098,8 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
  
         /* Process all OS owned event TRBs on this event ring */
         while (unhandled_event_trb(ir->event_ring)) {
-               err = xhci_handle_event_trb(xhci, ir, ir->event_ring->dequeue);
-
+               if (ir->handle_event_trb)
+                       err = ir->handle_event_trb(xhci, ir, ir->event_ring->dequeue);
                 /*
                  * If half a segment of events have been handled in one go then
                  * update ERDP, and force isoc trbs to interrupt more often

The handler function would be passed to, and function pointer set in
xhci_create_secondary_interrupter()

For primary interrupter it would always be set to xhci_handle_event_trb()

Thanks
Mathias

