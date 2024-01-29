Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF035840A58
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 16:44:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1D72852;
	Mon, 29 Jan 2024 16:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1D72852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706543070;
	bh=n8a6DcN34MCg2EL+T3oLmFAy3UeopUFYPMC/oHMiox8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N88d3hISiaylCyAgSdZ85NaTDUWBE8FYtVg/waK6MxaOHL55LsU/lZMC4WjCZYRCc
	 itthDGIaL998er8xz2ZTrhNBBw362hU5Lc41590oTyPrvEitI3OQ/bU5ICwrwy/PpP
	 UT3xK2YRC3Zh5RHboS77FosUKuXbiI/LerFhFTS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32B28F80589; Mon, 29 Jan 2024 16:43:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7592CF805A8;
	Mon, 29 Jan 2024 16:43:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F38CF80563; Mon, 29 Jan 2024 16:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06750F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 16:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06750F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FprwP1H/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706543022; x=1738079022;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=n8a6DcN34MCg2EL+T3oLmFAy3UeopUFYPMC/oHMiox8=;
  b=FprwP1H/Mp8JvOtiE2Sn1mv2iLUO3e7dFStHsQsEJmF85z2dmz9Ew2nf
   gobeJ6ZVTS0lbKLpNSQDC4b7JIMilxs2FO5+vVI7N4k9Q0qDkuu+NTqde
   y6PyydizFNCt4F7vs7A6tChRhzgUgvagq6V/f3bd5MVtH9IsdKzt/YMRH
   IfkbsAl0CJrNyUp19OOi+NJRYldP6j4YjD99y5j58MAD5oT6N5VRew2pC
   hQ8RFyeaR1OW3X22Q0q5Dk84LK+r1B6tU7OjC0qVtJ7ZAZxF3Nby+IGAt
   ZXIi+rg7qqjAjs08/Z1/ih9jDbSL82EbS6QS/+ACNvrO9aS9OHDaUGK5Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434159620"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400";
   d="scan'208";a="434159620"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 07:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960921358"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400";
   d="scan'208";a="960921358"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2024 07:43:25 -0800
Message-ID: <44a3d4db-7759-dd93-782a-1efbebfdb22c@linux.intel.com>
Date: Mon, 29 Jan 2024 17:44:58 +0200
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
 alsa-devel@alsa-project.org, "Neronin, Niklas" <niklas.neronin@intel.com>
References: <20240102214549.22498-1-quic_wcheng@quicinc.com>
 <20240102214549.22498-5-quic_wcheng@quicinc.com>
 <734591a1-50b4-6dc7-0b93-077355ec12e4@linux.intel.com>
 <7b2ec96b-b72f-c848-7c35-36e61a4072ac@quicinc.com>
 <b254f73b-a1bc-3dd4-f485-a3acf556835d@quicinc.com>
 <2178e799-2068-7443-59b2-310dfdd1ddee@linux.intel.com>
 <ae64ce69-dc1b-1534-7950-0a35c4a56f58@quicinc.com>
 <ff0bff8b-f26a-87bd-9762-9f2af98abcca@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v12 04/41] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
In-Reply-To: <ff0bff8b-f26a-87bd-9762-9f2af98abcca@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GZ5TKEYT3FXXKMHA33YU5KUYUA762I3A
X-Message-ID-Hash: GZ5TKEYT3FXXKMHA33YU5KUYUA762I3A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZ5TKEYT3FXXKMHA33YU5KUYUA762I3A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26.1.2024 23.13, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 1/16/2024 12:24 PM, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 1/15/2024 6:01 AM, Mathias Nyman wrote:
>>> On 10.1.2024 1.42, Wesley Cheng wrote:
>>>> Hi Mathias,
>>>>
>>>> On 1/8/2024 12:51 PM, Wesley Cheng wrote:
>>>>> Hi Mathias,
>>>>>
>>>>> On 1/4/2024 6:48 AM, Mathias Nyman wrote:
>>>>>> On 2.1.2024 23.45, Wesley Cheng wrote:
>>>>>>> As part of xHCI bus suspend, the XHCI is halted.  However, if there are
>>>>>>> pending events in the secondary event ring, it is observed that the xHCI
>>>>>>> controller stops responding to further commands upon host or device
>>>>>>> initiated bus resume.  Iterate through all pending events and update the
>>>>>>> dequeue pointer to the beginning of the event ring.
>>>>>>>
>>>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>>> ...
>>>>>>> +/*
>>>>>>> + * Move the event ring dequeue pointer to skip events kept in the secondary
>>>>>>> + * event ring.  This is used to ensure that pending events in the ring are
>>>>>>> + * acknowledged, so the XHCI HCD can properly enter suspend/resume. The
>>>>>>> + * secondary ring is typically maintained by an external component.
>>>>>>> + */
>>>>>>> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
>>>>>>> +    struct xhci_ring *ring,    struct xhci_interrupter *ir)
>>>>>>> +{
>>>>>>> +    union xhci_trb *erdp_trb, *current_trb;
>>>>>>> +    u64 erdp_reg;
>>>>>>> +    u32 iman_reg;
>>>>>>> +    dma_addr_t deq;
>>>>>>> +
>>>>>>> +    /* disable irq, ack pending interrupt and ack all pending events */
>>>>>>> +    xhci_disable_interrupter(ir);
>>>>>>> +    iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
>>>>>>> +    if (iman_reg & IMAN_IP)
>>>>>>> +        writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
>>>>>>> +
>>>>>>> +    /* last acked event trb is in erdp reg  */
>>>>>>> +    erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
>>>>>>> +    deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
>>>>>>> +    if (!deq) {
>>>>>>> +        xhci_err(xhci, "event ring handling not required\n");
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    erdp_trb = current_trb = ir->event_ring->dequeue;
>>>>>>> +    /* read cycle state of the last acked trb to find out CCS */
>>>>>>> +    ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
>>>>>>> +
>>>>>>> +    while (1) {
>>>>>>> +        inc_deq(xhci, ir->event_ring);
>>>>>>> +        erdp_trb = ir->event_ring->dequeue;
>>>>>>> +        /* cycle state transition */
>>>>>>> +        if ((le32_to_cpu(erdp_trb->event_cmd.flags) & TRB_CYCLE) !=
>>>>>>> +            ring->cycle_state)
>>>>>>> +            break;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    xhci_update_erst_dequeue(xhci, ir, current_trb, true);
>>>>>>> +}
>>>>>>
>>>>>> Code above is very similar to the existing event ring processing parts of xhci_irq()
>>>>>> and xhci_handle_event()
>>>>>>
>>>>>> I'll see if I can refactor the existing event ring processing, decouple it from
>>>>>> event handling so that it could be used by primary and secondary interrupters with
>>>>>> handlers, and this case where we just want to clear the event ring.
>>>>>>
>>>>>
>>>>> Thanks, that makes sense.  Will take a look as well.
>>>>>
>>>>
>>>> How about something like the below?  Tested this on my set up and everything looks to be working fine.  Had to add another param to struct xhci_interrupters to tell the XHCI interrupt handler to say if that particular interrupter wants to skip_events (handling).  This way, its something that the class driver utilizing the interrupter will have to tell XHCI sideband.  It would allow the user to determine if they want to use the interrupter to actually handle events or not on the proc running Linux.
>>>>
>>>
>>> Yes, I have something similar.
>>> I'll share it soon, just need to
>>> clean it up a bit fist.
>>>
>>
>> Sure, no worries.  Will test it when its available.  Thanks!
>>
> 
> Was just wondering if you had the time to clean up the changes?  If not, maybe you can provide a patch with whatever you have, and I can try my best to clean it up to your liking?  Thanks!

Sure, got stuck fixing other issues.

Code is not yet cleaned up, commit messages are not ready etc, but current work is in
a fix_eventhandling branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git  fix_eventhandling
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_eventhandling

I was in the middle of figuring out when and where the ip_autoclear and interrupt
moderation values should be set for secondary interrupters

Thanks
Mathias

