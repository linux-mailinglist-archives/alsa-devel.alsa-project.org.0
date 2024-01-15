Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E382DAD7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 15:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703AC1F7;
	Mon, 15 Jan 2024 15:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703AC1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705327266;
	bh=n/RLhgyGoa+DPRyRCqq45dasWWYKEjc9SvpU3zeNWxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R0hnAJP2KrCB3dFVwGMuc4jUQekGzNXL4XdvnjiJ3o9NZ30tryUdF8uA/uP+suZbe
	 oNQfWdqWUhKmkOTgbzMcBAzzK5WtJGZV8tgK81if2zGDEL0CccRKCLGJhCdZcsdanL
	 HVqDdmnKZg2H0YnE68dKJF50K/xRh2pqmuzj8MKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 637A5F8057C; Mon, 15 Jan 2024 15:00:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EFD6F804E7;
	Mon, 15 Jan 2024 15:00:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9493DF801F5; Mon, 15 Jan 2024 15:00:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A4DBF8003A
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 15:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4DBF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H0NppcTE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705327226; x=1736863226;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n/RLhgyGoa+DPRyRCqq45dasWWYKEjc9SvpU3zeNWxA=;
  b=H0NppcTEw25cWEIek/JQjpTLi+iVf6ZIu0oPwTF6iuN8T6Gfz0SsAAmY
   wl/Crdeyr6JrBFq5drlhW+x7l8EraevtVI1Ztj95Fmupr7zfs7+mwvQpO
   gUdybxrwwqV2C7mjEEBBYygvSN2EbcSQCSSlIklI6CMNTStm/2P1C7xUm
   IvMUPlUhmYVl3wPxep1pJK9hocYaqAHC4DaKVdjRFrBbapMKnMgJhP+t/
   ZOlS+2fOfRSEAONowl3zX+n51FrYFWX7wD96zrBYX4tL5m4r9vxU8UBgF
   sWhH7x6MwKbj4z0za5UuX9kmKeIaAaAfXlCmfJ3xK4AAz40vH/L2c+Cce
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="463900318"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600";
   d="scan'208";a="463900318"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 06:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="733312147"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600";
   d="scan'208";a="733312147"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 15 Jan 2024 06:00:14 -0800
Message-ID: <2178e799-2068-7443-59b2-310dfdd1ddee@linux.intel.com>
Date: Mon, 15 Jan 2024 16:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v12 04/41] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
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
 <734591a1-50b4-6dc7-0b93-077355ec12e4@linux.intel.com>
 <7b2ec96b-b72f-c848-7c35-36e61a4072ac@quicinc.com>
 <b254f73b-a1bc-3dd4-f485-a3acf556835d@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <b254f73b-a1bc-3dd4-f485-a3acf556835d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZNGU373EIXD7AANPYSQVKW723DDYMXIJ
X-Message-ID-Hash: ZNGU373EIXD7AANPYSQVKW723DDYMXIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNGU373EIXD7AANPYSQVKW723DDYMXIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10.1.2024 1.42, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 1/8/2024 12:51 PM, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 1/4/2024 6:48 AM, Mathias Nyman wrote:
>>> On 2.1.2024 23.45, Wesley Cheng wrote:
>>>> As part of xHCI bus suspend, the XHCI is halted.  However, if there are
>>>> pending events in the secondary event ring, it is observed that the xHCI
>>>> controller stops responding to further commands upon host or device
>>>> initiated bus resume.  Iterate through all pending events and update the
>>>> dequeue pointer to the beginning of the event ring.
>>>>
>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ...
>>>> +/*
>>>> + * Move the event ring dequeue pointer to skip events kept in the secondary
>>>> + * event ring.  This is used to ensure that pending events in the ring are
>>>> + * acknowledged, so the XHCI HCD can properly enter suspend/resume. The
>>>> + * secondary ring is typically maintained by an external component.
>>>> + */
>>>> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
>>>> +    struct xhci_ring *ring,    struct xhci_interrupter *ir)
>>>> +{
>>>> +    union xhci_trb *erdp_trb, *current_trb;
>>>> +    u64 erdp_reg;
>>>> +    u32 iman_reg;
>>>> +    dma_addr_t deq;
>>>> +
>>>> +    /* disable irq, ack pending interrupt and ack all pending events */
>>>> +    xhci_disable_interrupter(ir);
>>>> +    iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
>>>> +    if (iman_reg & IMAN_IP)
>>>> +        writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
>>>> +
>>>> +    /* last acked event trb is in erdp reg  */
>>>> +    erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
>>>> +    deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
>>>> +    if (!deq) {
>>>> +        xhci_err(xhci, "event ring handling not required\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    erdp_trb = current_trb = ir->event_ring->dequeue;
>>>> +    /* read cycle state of the last acked trb to find out CCS */
>>>> +    ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
>>>> +
>>>> +    while (1) {
>>>> +        inc_deq(xhci, ir->event_ring);
>>>> +        erdp_trb = ir->event_ring->dequeue;
>>>> +        /* cycle state transition */
>>>> +        if ((le32_to_cpu(erdp_trb->event_cmd.flags) & TRB_CYCLE) !=
>>>> +            ring->cycle_state)
>>>> +            break;
>>>> +    }
>>>> +
>>>> +    xhci_update_erst_dequeue(xhci, ir, current_trb, true);
>>>> +}
>>>
>>> Code above is very similar to the existing event ring processing parts of xhci_irq()
>>> and xhci_handle_event()
>>>
>>> I'll see if I can refactor the existing event ring processing, decouple it from
>>> event handling so that it could be used by primary and secondary interrupters with
>>> handlers, and this case where we just want to clear the event ring.
>>>
>>
>> Thanks, that makes sense.  Will take a look as well.
>>
> 
> How about something like the below?  Tested this on my set up and everything looks to be working fine.  Had to add another param to struct xhci_interrupters to tell the XHCI interrupt handler to say if that particular interrupter wants to skip_events (handling).  This way, its something that the class driver utilizing the interrupter will have to tell XHCI sideband.  It would allow the user to determine if they want to use the interrupter to actually handle events or not on the proc running Linux.
> 

Yes, I have something similar.
I'll share it soon, just need to
clean it up a bit fist.

Thanks
Mathias

