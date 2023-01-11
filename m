Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D322B665222
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 04:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3174179A9;
	Wed, 11 Jan 2023 04:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3174179A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673406770;
	bh=4js1yNJ8rGtshD4n0D1Ldm8Tu77Hr/jI4+sMLw/7CLA=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZSOmx3rCGRaOYiEGty8OUnRrn57Klb2pOxp3n1F9behgLb5GGX55HnTlJAP/mpHiM
	 SXGwyrkhF0/DvjBIGi1Ihl4cbX0Wj3biSIi19XB4jk9LElVHBn0czRW8oSqFTZN0Jb
	 PWtKkSz3eF+FPwU5w5B/SZ8weChqk/0zyNPQnTTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA461F80424;
	Wed, 11 Jan 2023 04:11:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC70F803DC; Wed, 11 Jan 2023 04:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47249F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 04:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47249F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=QOQS0KKL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B1bMCo020464; Wed, 11 Jan 2023 03:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fzOpVmaEgBnJzMqcOhijtm34iXCdOIxV6hFIOMpSFmo=;
 b=QOQS0KKLhfRQjH1UQ7EZHTAUylVbbeko1P2kP9tL13YDqRUg4hsEufk87iCkknTgCGap
 JtjsFuMtiDxiw6QZdrAgMHuzbNwturxYBbivOGBfo3UdSIkyKGlMRgeagQ8uDyGIWITP
 E+d9N8XNKUz2tVoja748VrN0s5sHqvdNchvlqKF4eXx99u6y1jwyz/z/HlWSgNWooCYp
 Gs2QmFQyJYfSdAar6fKl4guqrKFczhAbAzGlOLd4Y6adjJbuCFTEemReONDjfDhqU+ff
 iZK4cF+NU8hOYfODSRxHhrTHi+voTYZJaGY7ldiqNgL0aCtgbdFcFFpPDtNXod1D9Ud/ Tw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1km2g4m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 03:11:44 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30B3Bhbp007089
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 03:11:43 GMT
Received: from [10.110.66.166] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 10 Jan
 2023 19:11:41 -0800
Message-ID: <23037fab-1a9e-66c1-8e90-d94b213c8c7d@quicinc.com>
Date: Tue, 10 Jan 2023 19:11:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 07/14] usb: host: xhci: Add XHCI secondary interrupter
 support
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Albert Wang
 <albertccwang@google.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-8-quic_wcheng@quicinc.com>
 <7dfe215b-4cc7-f95f-17c3-563c0120151a@linux.intel.com>
 <f7f80320-02bb-a573-dd95-b6d58c260624@quicinc.com>
 <5f54c5a3-caf0-2920-e90f-68124ed2e06c@linux.intel.com>
 <d1334e58-1126-c068-d211-8fd3b7dcbf17@quicinc.com>
 <cefcc5c6-6a91-c737-252a-edf596f77473@linux.intel.com>
 <23a2b82e-4f4f-66e2-2c60-3613ffe7912f@quicinc.com>
In-Reply-To: <23a2b82e-4f4f-66e2-2c60-3613ffe7912f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: m_O4S12OuUZxEyOKxH4w0RkGGFAerNZZ
X-Proofpoint-GUID: m_O4S12OuUZxEyOKxH4w0RkGGFAerNZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301110022
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

Hi Mathias,

On 1/10/2023 12:03 PM, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 1/10/2023 11:47 AM, Mathias Nyman wrote:
>> On 9.1.2023 22.24, Wesley Cheng wrote:
>>> Hi Mathias,
>>>
>>> On 1/2/2023 8:38 AM, Mathias Nyman wrote:
>>>> On 29.12.2022 23.14, Wesley Cheng wrote:
>>>>> Hi Mathias,
>>>>>
>>>>> On 12/28/2022 7:47 AM, Mathias Nyman wrote:
>>>>>> On 24.12.2022 1.31, Wesley Cheng wrote:
>>>>>>> Implement the XHCI operations for allocating and requesting for a 
>>>>>>> secondary
>>>>>>> interrupter.  The secondary interrupter can allow for events for a
>>>>>>> particular endpoint to be routed to a separate event ring.  The 
>>>>>>> event
>>>>>>> routing is defined when submitting a transfer descriptor to the 
>>>>>>> USB HW.
>>>>>>> There is a specific field which denotes which interrupter ring to 
>>>>>>> route the
>>>>>>> event to when the transfer is completed.
>>>>>>>
>>>>>>> An example use case, such as audio packet offloading can utilize 
>>>>>>> a separate
>>>>>>> event ring, so that these events can be routed to a different 
>>>>>>> processor
>>>>>>> within the system.  The processor would be able to independently 
>>>>>>> submit
>>>>>>> transfers and handle its completions without intervention from 
>>>>>>> the main
>>>>>>> processor.
>>>>>>>
>>>>>>
>>>>>> Adding support for more xHCI interrupters than just the primary 
>>>>>> one make sense for
>>>>>> both the offloading and virtualization cases.
>>>>>>
>>>>>> xHCI support for several interrupters was probably added to 
>>>>>> support virtualization,
>>>>>> to hand over usb devices to virtual machines and give them their 
>>>>>> own event ring and
>>>>>> MSI/MSI-X vector.
>>>>>>
>>>>>> In this offloading case you probably want to avoid xHC interrupts 
>>>>>> from this device
>>>>>> completely, making sure it doesn't wake up the main CPU 
>>>>>> unnecessarily.
>>>>>>
>>>>>> So is the idea here to let xhci driver set up the new interrupter, 
>>>>>> its event ring,
>>>>>> and the endpoint transfer rings. Then pass the address of the 
>>>>>> endpoint transfer rings
>>>>>> and the new event ring to the separate processor.
>>>>>>
>>>>>> This separate processor then both polls the event ring for new 
>>>>>> events, sets its dequeue
>>>>>> pointer, clears EHB bit, and queues new TRBs on the transfer ring.
>>>>>>
>>>>>> so xhci driver does not handle any events for the audio part, and 
>>>>>> no audio data URBs
>>>>>> are sent to usb core?
>>>>>
>>>>> Your entire description is correct.  To clarify, the interfaces 
>>>>> which are non-audio will still be handled by the main processor. 
>>>>> For example, a USB headset can have a HID interface as well for 
>>>>> volume control.  The HID interface will still be handled by the 
>>>>> main processor, and events routed to the main event ring.
>>>>>
>>>>>>
>>>>>> How about the control part?
>>>>>> Is the control endpoint for this device still handled normally by 
>>>>>> usb core/xhci?
>>>>>>
>>>>>
>>>>> Control transfers are always handled on the main processor.  Only 
>>>>> audio interface's endpoints.
>>>>
>>>> Good to know, that means interrupter should be chosen per endpoint, 
>>>> not per device.
>>>>
>>>>>
>>>>>> For the xhci parts I think we should start start by adding generic 
>>>>>> support for several
>>>>>> interrupters, then add parts needed for offloading.
>>>>>
>>>> I can split up the patchsets to add interrupters first, then adding 
>>>> the offloading APIs in a separate patch.
>>>>
>>>>
>>>> I started looking at supporting secondary interrupters myself.
>>>> Let me work on that part a bit first. We have a bit different end 
>>>> goals.
>>>> I want to handle interrupts from a secondary interrupter, while this 
>>>> audio offload
>>>> really just wants to mask some interrupts.
>>>>
>>>
>>> I was looking at how we could possibly split up the XHCI secondary 
>>> interrupter, and offloading parts.  Since the XHCI secondary 
>>> interrupter is a feature that is defined in the XHCI spec (and we 
>>> aren't doing anything outside of what is defined), I was thinking of 
>>> having a separate XHCI driver (ie xhci-sec.c/h) that can be used to 
>>> define all APIs related to setting up the event ring and ring 
>>> management. (interrupt support can be added here)  This aligns a bit 
>>> with what Alan suggested, and removing the APIs in the USB HCD, since 
>>> this is XHCI specific stuff. ( 
>>> https://lore.kernel.org/linux-usb/Y6zwZOquZOTZfnvP@rowland.harvard.edu/ 
>>> )
>>
>> Already started working on the interrupter, that part fits well into 
>> current driver.
>>
>> Code (untested, will be randomly rebased etc) can be found in my 
>> feature_interrupters branch:
>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git 
>> feature_interrupters
>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters 
>>
> 
> Oh perfect, let me take a look.  Thanks for this!
> 

I actually tried to see if I could get our audio offloading to work with 
your current series.  (I understand its still work in progress)  I did 
have to make some changes to expose the APIs to our class driver, but I 
wanted to let you know about one of the issues I saw when developing my 
implementation, because I am seeing the same behavior w/ yours. (and 
there's a discrepancy w/ what's stated in the XHCI spec :))

So the reason why my initial submission did the event ring allocation 
and set up before the run/stop bit was set, is that I found that when 
writing to the ir_set->erst_base in this scenario (for the secondary 
interrupter), it lead to a SMMU fault from the DWC3 controller.  One 
thing I noticed, was that the SMMU fault address was the lower 32 bits 
of the segment table base address allocated.  The XHCI driver utilizes 
the xhci_write_64() api which first writes the lower 32 bits then the 
upper 32 bits.  The XHCI spec states that:

Table 5-41: Event Ring Segment Table Base Address Register Bit 
Definitions (ERSTBA)

"Event Ring Segment Table Base Address Register – RW. Default = ‘0’. 
This field defines the
high order bits of the start address of the Event Ring Segment Table.
Writing this register sets the Event Ring State Machine:EREP Advancement 
to the Start state.
Refer to Figure 4-12 for more information.
**For Secondary Interrupters: This field may be modified at any time.**"

I'm not sure if this is an issue with the specific controller we're 
using, so maybe I will wait until you can give this a try on your set 
up.  However, it doesn't seem to be true that we can write the ERSTBA 
any time we want to.  My assumption is that once I made the lower 32 bit 
write, the controller attempted to enable the Event Ring State machine 
(Figure 4-12), and this led to a SMMU fault, since the upper 64 bits 
haven't been written.  I also did some bit banging manually as well 
(using devmem) and any time I write to the secondary ring ERSTBA 
register it generates a fault. (before any offloading has started)

Thanks
Wesley Cheng
