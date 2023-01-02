Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B065B529
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 17:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE911A20C;
	Mon,  2 Jan 2023 17:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE911A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672677523;
	bh=kN/SHISxRWT2L0F6Vw5HZe3KAE4ojWJmQqCG+JrHEBY=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q7H2/CoPCvNNQOn93FyKSrfZpj3SQFYZmnYYIYK2u2/rM1ySYDSZYtd7SE8Yl9VLT
	 i1/T0xWMrqC5hp0V1rJSTBUPkuipCIUCGhuVr/bOK88i7B0MG1gI9hPMwKjzO+nlDj
	 iJrg5nD9StSI5C/+vV4VwVVN3AiuavbQDZWwBjMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3183F800C0;
	Mon,  2 Jan 2023 17:37:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCAD5F8023B; Mon,  2 Jan 2023 17:37:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 136ABF8023A
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 17:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 136ABF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SdpAHxp/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672677468; x=1704213468;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=kN/SHISxRWT2L0F6Vw5HZe3KAE4ojWJmQqCG+JrHEBY=;
 b=SdpAHxp/2OgZ0v8e0Jq4b1NSamZKJSltAFfKfudIXrjksQp8a0QF1eIH
 xZDL4rd6C94lrHJW2HVNF0n6K2oTvcH/B6hbfE755B19framkkoabMEw0
 BvvUv0BrxnSvQPj2cYE1TCjP9JlAi3Oz3/2L/BeRO4/DR9AJYHWMhZQYY
 XRku84wgCEZ9qLFmvnQm8FkokMsOY0hoQINuvbyVe0SDZ6Uf1Z511Dki/
 /HgAkOH3bM241ylm+kloeM+1kLZlYCe6qBzLJGHhGOiV1wn5Ekvxs7p4I
 qQiWo3rk1muFQ/vTImmRh9thKPMlyF94uYU9YbkQ7zKhb6btYl8kc5gaI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="305019788"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="305019788"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 08:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="743245438"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="743245438"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jan 2023 08:37:38 -0800
Message-ID: <5f54c5a3-caf0-2920-e90f-68124ed2e06c@linux.intel.com>
Date: Mon, 2 Jan 2023 18:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-8-quic_wcheng@quicinc.com>
 <7dfe215b-4cc7-f95f-17c3-563c0120151a@linux.intel.com>
 <f7f80320-02bb-a573-dd95-b6d58c260624@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 07/14] usb: host: xhci: Add XHCI secondary interrupter
 support
In-Reply-To: <f7f80320-02bb-a573-dd95-b6d58c260624@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 29.12.2022 23.14, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 12/28/2022 7:47 AM, Mathias Nyman wrote:
>> On 24.12.2022 1.31, Wesley Cheng wrote:
>>> Implement the XHCI operations for allocating and requesting for a secondary
>>> interrupter.  The secondary interrupter can allow for events for a
>>> particular endpoint to be routed to a separate event ring.  The event
>>> routing is defined when submitting a transfer descriptor to the USB HW.
>>> There is a specific field which denotes which interrupter ring to route the
>>> event to when the transfer is completed.
>>>
>>> An example use case, such as audio packet offloading can utilize a separate
>>> event ring, so that these events can be routed to a different processor
>>> within the system.  The processor would be able to independently submit
>>> transfers and handle its completions without intervention from the main
>>> processor.
>>>
>>
>> Adding support for more xHCI interrupters than just the primary one make sense for
>> both the offloading and virtualization cases.
>>
>> xHCI support for several interrupters was probably added to support virtualization,
>> to hand over usb devices to virtual machines and give them their own event ring and
>> MSI/MSI-X vector.
>>
>> In this offloading case you probably want to avoid xHC interrupts from this device
>> completely, making sure it doesn't wake up the main CPU unnecessarily.
>>
>> So is the idea here to let xhci driver set up the new interrupter, its event ring,
>> and the endpoint transfer rings. Then pass the address of the endpoint transfer rings
>> and the new event ring to the separate processor.
>>
>> This separate processor then both polls the event ring for new events, sets its dequeue
>> pointer, clears EHB bit, and queues new TRBs on the transfer ring.
>>
>> so xhci driver does not handle any events for the audio part, and no audio data URBs
>> are sent to usb core?
> 
> Your entire description is correct.  To clarify, the interfaces which are non-audio will still be handled by the main processor.  For example, a USB headset can have a HID interface as well for volume control.  The HID interface will still be handled by the main processor, and events routed to the main event ring.
> 
>>
>> How about the control part?
>> Is the control endpoint for this device still handled normally by usb core/xhci?
>>
> 
> Control transfers are always handled on the main processor.  Only audio interface's endpoints.

Good to know, that means interrupter should be chosen per endpoint, not per device.

> 
>> For the xhci parts I think we should start start by adding generic support for several
>> interrupters, then add parts needed for offloading.
> 
> I can split up the patchsets to add interrupters first, then adding the offloading APIs in a separate patch.


I started looking at supporting secondary interrupters myself.
Let me work on that part a bit first. We have a bit different end goals.
I want to handle interrupts from a secondary interrupter, while this audio offload
really just wants to mask some interrupts.

Thanks
Mathias

