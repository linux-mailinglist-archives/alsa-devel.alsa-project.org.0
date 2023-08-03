Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182E76E5C9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 12:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E55C1208;
	Thu,  3 Aug 2023 12:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E55C1208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691058839;
	bh=6hc1/qNVWMhq9Hi9YrzSfxvx3XvZSP+GUU/ssEMrrlA=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ipNqH3Bj32qxFn6x1r3SBDtcriZPbkHCYHUDCu9MF9a94KioB94j6BBWjIGYBulGX
	 iF72RaP7sdbqPq9FT28dJuB7Z/5tZDktkq111h+7XgM3JWz25cy249kKzMsIvUxVuE
	 9Lf+jNxM+dOU63G1AwvnUwTlny1JFahCZiggBXaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A9C1F8015B; Thu,  3 Aug 2023 12:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01833F801D5;
	Thu,  3 Aug 2023 12:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2513AF8025A; Thu,  3 Aug 2023 12:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9262F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 12:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9262F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FUKHGara
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691058773; x=1722594773;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=6hc1/qNVWMhq9Hi9YrzSfxvx3XvZSP+GUU/ssEMrrlA=;
  b=FUKHGaracqH3oldspBP0wykkAs+Hh1BTKZ3dF/1FwL0NES1QrLZLjEV8
   TtXj9KVg5v/FvRrlvMaW1oK7eU2iE0ZAhspGARY3Qp2QWrAyjZgFx8hcR
   i9R7lmbC/jxFIHdNX873OYQchhduA9NJHAohU6dgdhZMBzNVteRez0GYZ
   4btqjIDVP8L6+KJsijbJjXHPiXFAtx2svPwdNeIZ/ieQLeY3/oyX5eiXo
   Vf2zzF2M5MR5IjkX++jf2WZElMbrq5oQEopaKsSTDQ3U2TEQk1otAObvs
   vFHe0qpswQawNJGxI0JzgBF/rzzlMVeZXSOEfuAbGok3bfGQyfs3EXfjA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400775322"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200";
   d="scan'208";a="400775322"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 03:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843544345"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200";
   d="scan'208";a="843544345"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 03:32:41 -0700
Message-ID: <7b31b220-6fd5-0f5d-7e1a-df3f38bd792f@linux.intel.com>
Date: Thu, 3 Aug 2023 13:33:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
 oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-5-quic_wcheng@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v4 04/32] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
In-Reply-To: <20230725023416.11205-5-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OUD364DEF6HRHVXVJN4FSPWQSXWWNKOU
X-Message-ID-Hash: OUD364DEF6HRHVXVJN4FSPWQSXWWNKOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUD364DEF6HRHVXVJN4FSPWQSXWWNKOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25.7.2023 5.33, Wesley Cheng wrote:
> As part of xHCI bus suspend, the XHCI is halted.  However, if there are
> pending events in the secondary event ring, it is observed that the xHCI
> controller stops responding to further commands upon host or device
> initiated bus resume.  Iterate through all pending events and updating the
> dequeue pointer to the last pending event trb.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-mem.c | 74 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 69 insertions(+), 5 deletions(-)

This sounds more like ring handling code.
Maybe xhci-ring.c would be a better place

> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index c51150af22f2..6b01d56c176f 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1799,17 +1799,85 @@ int xhci_alloc_erst(struct xhci_hcd *xhci,
>   	return 0;
>   }
>   
> +static void xhci_handle_sec_intr_events(struct xhci_hcd *xhci,
> +	struct xhci_ring *ring,	struct xhci_intr_reg __iomem *ir_set,
> +	struct xhci_erst *erst)
> +{

The function name is a bit misleading as it doesn't handle
any of the pending events, it just marks them all handled.

> +	union xhci_trb *erdp_trb, *current_trb;
> +	struct xhci_segment	*seg;
> +	u64 erdp_reg;
> +	u32 iman_reg;
> +	dma_addr_t deq;
> +	unsigned long segment_offset;
> +
> +	/* disable irq, ack pending interrupt and ack all pending events */
> +	iman_reg = readl_relaxed(&ir_set->irq_pending);
> +	iman_reg &= ~IMAN_IE;
> +	writel_relaxed(iman_reg, &ir_set->irq_pending);
> +	iman_reg = readl_relaxed(&ir_set->irq_pending);
> +	if (iman_reg & IMAN_IP)
> +		writel_relaxed(iman_reg, &ir_set->irq_pending);

maybe use xhci_disable_interrupter() helper, it does most of this already.

> +
> +	/* last acked event trb is in erdp reg  */
> +	erdp_reg = xhci_read_64(xhci, &ir_set->erst_dequeue);
> +	deq = (dma_addr_t)(erdp_reg & ~ERST_PTR_MASK);
> +	if (!deq) {
> +		xhci_dbg(xhci, "event ring handling not required\n");
> +		return;
> +	}
> +
> +	seg = ring->first_seg;
> +	segment_offset = deq - seg->dma;
> +
> +	/* find out virtual address of the last acked event trb */
> +	erdp_trb = current_trb = &seg->trbs[0] +
> +				(segment_offset/sizeof(*current_trb));
> +
> +	/* read cycle state of the last acked trb to find out CCS */
> +	ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
> +
> +	while (1) {
> +		/* last trb of the event ring: toggle cycle state */
> +		if (current_trb == &seg->trbs[TRBS_PER_SEGMENT - 1]) {
> +			ring->cycle_state ^= 1;
> +			current_trb = &seg->trbs[0];
> +		} else {
> +			current_trb++;
> +		}
> +
> +		/* cycle state transition */
> +		if ((le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE) !=
> +		    ring->cycle_state)
> +			break;
> +	}
> +
> +	if (erdp_trb != current_trb) {
> +		deq = xhci_trb_virt_to_dma(ring->deq_seg, current_trb);
> +		if (deq == 0)
> +			xhci_warn(xhci,
> +				"WARN invalid SW event ring dequeue ptr.\n");
> +		/* Update HC event ring dequeue pointer */
> +		erdp_reg &= ERST_PTR_MASK;
> +		erdp_reg |= ((u64) deq & (u64) ~ERST_PTR_MASK);
> +	}
> +
> +	/* Clear the event handler busy flag (RW1C); event ring is empty. */
> +	erdp_reg |= ERST_EHB;
> +	xhci_write_64(xhci, erdp_reg, &ir_set->erst_dequeue);

There are some helpers like inc_deq() and  xhci_update_erst_dequeue()
that could be used here.

> +}
> +
>   static void
>   xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>   {
>   	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
>   	size_t erst_size;
> -	u64 tmp64;
>   	u32 tmp;
>   
>   	if (!ir)
>   		return;
>   
> +	xhci_handle_sec_intr_events(xhci, ir->event_ring, ir->ir_set, &ir->erst);

Cleaning up the interrupter event ring should be called earlier.
  
Probably from xhci_remove_secondary_interrupter(), before it calls xhci_free_interrupter()

Thanks
-Mathias


