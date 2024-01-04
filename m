Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AD824756
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 18:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68FCBE96;
	Thu,  4 Jan 2024 18:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68FCBE96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704389040;
	bh=AgNpe/rQhXH4s/zrVu4O6NOZqlKS54MKFZBPb9+vKyQ=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5RDMQwxC4Aeo50R5gBbDBSMNOd+boclqbhuj6q3Sgof5cmZfFmX+h371H6EKlZiE
	 UVY/YfZ3+4EmUtsjnfLZZwAQVFsPuCM6qR5ng7zewPU9ZK4DwHfjOQn2pG0zK4459Y
	 +YrsK98l+jbRxbsdsKlz8nI6QK9nhfbdU6F1Pff4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7891F80563; Thu,  4 Jan 2024 18:23:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E989DF80563;
	Thu,  4 Jan 2024 18:23:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D77C9F80238; Thu,  4 Jan 2024 18:23:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D8B2F80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 18:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D8B2F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T71KDnvS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704389000; x=1735925000;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=AgNpe/rQhXH4s/zrVu4O6NOZqlKS54MKFZBPb9+vKyQ=;
  b=T71KDnvS6MESa0RTAPia2GifuiATEgmTOaic+Sehzws1jTpqcyEqof6s
   f184LDQ0jyn+p2Pnb71hmk21HWhuisPLpUcuxYo1XsGHQNgYqHs7NywEK
   LmHyuQOMWD06YOWSO3TpmedgqOdMcrfS+6v0n39/rwnGMC0UPF1Zjq8Ud
   iscxJzFLk2EHgBFcjIK30Z63EHWShX5mi0MZeroq5nlOuJZltFdIXlvFs
   YwtPlFoLTqRY81381bZx5VVl/nKWYwdX76OMWyHE9/kaj36eOSlr/TQds
   ne/tILtrCTIsoqgWOkupIYuqErd0cbnS7TsLwBtLxs4T52D19LsCmx1FW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="15895925"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600";
   d="scan'208";a="15895925"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="773536659"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600";
   d="scan'208";a="773536659"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 04 Jan 2024 06:46:52 -0800
Message-ID: <734591a1-50b4-6dc7-0b93-077355ec12e4@linux.intel.com>
Date: Thu, 4 Jan 2024 16:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 konrad.dybcio@linaro.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240102214549.22498-1-quic_wcheng@quicinc.com>
 <20240102214549.22498-5-quic_wcheng@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v12 04/41] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
In-Reply-To: <20240102214549.22498-5-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VLHTE4IZ6TCNH43ZOT2XE2AAD6ZSTB2O
X-Message-ID-Hash: VLHTE4IZ6TCNH43ZOT2XE2AAD6ZSTB2O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLHTE4IZ6TCNH43ZOT2XE2AAD6ZSTB2O/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2.1.2024 23.45, Wesley Cheng wrote:
> As part of xHCI bus suspend, the XHCI is halted.  However, if there are
> pending events in the secondary event ring, it is observed that the xHCI
> controller stops responding to further commands upon host or device
> initiated bus resume.  Iterate through all pending events and update the
> dequeue pointer to the beginning of the event ring.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
...
> +/*
> + * Move the event ring dequeue pointer to skip events kept in the secondary
> + * event ring.  This is used to ensure that pending events in the ring are
> + * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The
> + * secondary ring is typically maintained by an external component.
> + */
> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> +	struct xhci_ring *ring,	struct xhci_interrupter *ir)
> +{
> +	union xhci_trb *erdp_trb, *current_trb;
> +	u64 erdp_reg;
> +	u32 iman_reg;
> +	dma_addr_t deq;
> +
> +	/* disable irq, ack pending interrupt and ack all pending events */
> +	xhci_disable_interrupter(ir);
> +	iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
> +	if (iman_reg & IMAN_IP)
> +		writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
> +
> +	/* last acked event trb is in erdp reg  */
> +	erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
> +	deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
> +	if (!deq) {
> +		xhci_err(xhci, "event ring handling not required\n");
> +		return;
> +	}
> +
> +	erdp_trb = current_trb = ir->event_ring->dequeue;
> +	/* read cycle state of the last acked trb to find out CCS */
> +	ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
> +
> +	while (1) {
> +		inc_deq(xhci, ir->event_ring);
> +		erdp_trb = ir->event_ring->dequeue;
> +		/* cycle state transition */
> +		if ((le32_to_cpu(erdp_trb->event_cmd.flags) & TRB_CYCLE) !=
> +		    ring->cycle_state)
> +			break;
> +	}
> +
> +	xhci_update_erst_dequeue(xhci, ir, current_trb, true);
> +}

Code above is very similar to the existing event ring processing parts of xhci_irq()
and xhci_handle_event()

I'll see if I can refactor the existing event ring processing, decouple it from
event handling so that it could be used by primary and secondary interrupters with
handlers, and this case where we just want to clear the event ring.

Thanks
Mathias

