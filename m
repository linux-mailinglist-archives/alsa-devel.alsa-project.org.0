Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E653663171
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 21:25:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7880ED27F;
	Mon,  9 Jan 2023 21:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7880ED27F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673295916;
	bh=HxBsRs8alAmsXM/o1jBqtc+CImifpf/e0klTX5BmMuU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iSNDiPMtvKzO9KvvqQ/5wPKA8hFXgbdiS/ub9XWU5gyX1HYwu8VxRK/McTHzxd88+
	 mX/bfXbh3kKt7UbyRgFNb1zplo6P2l+4IBojBc0Eyx7QxQ1vaJAInsOx7uN0MchtyC
	 gDidEdF6CCKoHY+1WGfLeq6x1+Tn7zVSnuzkupGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9609F803DC;
	Mon,  9 Jan 2023 21:24:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 098AAF8030F; Mon,  9 Jan 2023 21:24:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
 RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=no autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13B25F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 21:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B25F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LN442ifa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309KIXWr026037; Mon, 9 Jan 2023 20:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LLCj3LGRAZrmFeffHLVyUc3jXEZk+lrOrYUbp7dypIk=;
 b=LN442ifahNhEkthtzMH8B99mPu6BIl6NMDdl4iz23mGyqY4a40yA5hBEQN2mtQcyx9Xj
 1jVIuzYHOHVzXupoTpBNGVPm8PwXsPZl6qRXYVpdra05dyR94cSXDoUl68Wd+F9tJaa8
 nPJPCdu2KdZ18se7xA7Xph8gxSEY764hVyHIsoibn1P8OL2qDK85N6u1g5sKOZbET63b
 kBpR78vSH/K6ylARWWBTB07YRNPHHfqCUI60Fbij2WFrtHxmmzXKlALppORfKP8J4zRe
 UMRt8YaBtjVAbRwGywS9lrZ2iGWOrLtdk1ZI4rVRBtImbNK5ypnvPp10iWQjzsp7PSxH fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3my21fuy8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 20:24:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 309KOBX4017768
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jan 2023 20:24:11 GMT
Received: from [10.110.66.166] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 12:24:08 -0800
Message-ID: <d1334e58-1126-c068-d211-8fd3b7dcbf17@quicinc.com>
Date: Mon, 9 Jan 2023 12:24:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 07/14] usb: host: xhci: Add XHCI secondary interrupter
 support
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-8-quic_wcheng@quicinc.com>
 <7dfe215b-4cc7-f95f-17c3-563c0120151a@linux.intel.com>
 <f7f80320-02bb-a573-dd95-b6d58c260624@quicinc.com>
 <5f54c5a3-caf0-2920-e90f-68124ed2e06c@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5f54c5a3-caf0-2920-e90f-68124ed2e06c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vBXxt7hLQNCNiXx3Za6gRXDytqzy-VPJ
X-Proofpoint-GUID: vBXxt7hLQNCNiXx3Za6gRXDytqzy-VPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301090143
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

On 1/2/2023 8:38 AM, Mathias Nyman wrote:
> On 29.12.2022 23.14, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 12/28/2022 7:47 AM, Mathias Nyman wrote:
>>> On 24.12.2022 1.31, Wesley Cheng wrote:
>>>> Implement the XHCI operations for allocating and requesting for a 
>>>> secondary
>>>> interrupter.  The secondary interrupter can allow for events for a
>>>> particular endpoint to be routed to a separate event ring.  The event
>>>> routing is defined when submitting a transfer descriptor to the USB HW.
>>>> There is a specific field which denotes which interrupter ring to 
>>>> route the
>>>> event to when the transfer is completed.
>>>>
>>>> An example use case, such as audio packet offloading can utilize a 
>>>> separate
>>>> event ring, so that these events can be routed to a different processor
>>>> within the system.  The processor would be able to independently submit
>>>> transfers and handle its completions without intervention from the main
>>>> processor.
>>>>
>>>
>>> Adding support for more xHCI interrupters than just the primary one 
>>> make sense for
>>> both the offloading and virtualization cases.
>>>
>>> xHCI support for several interrupters was probably added to support 
>>> virtualization,
>>> to hand over usb devices to virtual machines and give them their own 
>>> event ring and
>>> MSI/MSI-X vector.
>>>
>>> In this offloading case you probably want to avoid xHC interrupts 
>>> from this device
>>> completely, making sure it doesn't wake up the main CPU unnecessarily.
>>>
>>> So is the idea here to let xhci driver set up the new interrupter, 
>>> its event ring,
>>> and the endpoint transfer rings. Then pass the address of the 
>>> endpoint transfer rings
>>> and the new event ring to the separate processor.
>>>
>>> This separate processor then both polls the event ring for new 
>>> events, sets its dequeue
>>> pointer, clears EHB bit, and queues new TRBs on the transfer ring.
>>>
>>> so xhci driver does not handle any events for the audio part, and no 
>>> audio data URBs
>>> are sent to usb core?
>>
>> Your entire description is correct.  To clarify, the interfaces which 
>> are non-audio will still be handled by the main processor.  For 
>> example, a USB headset can have a HID interface as well for volume 
>> control.  The HID interface will still be handled by the main 
>> processor, and events routed to the main event ring.
>>
>>>
>>> How about the control part?
>>> Is the control endpoint for this device still handled normally by usb 
>>> core/xhci?
>>>
>>
>> Control transfers are always handled on the main processor.  Only 
>> audio interface's endpoints.
> 
> Good to know, that means interrupter should be chosen per endpoint, not 
> per device.
> 
>>
>>> For the xhci parts I think we should start start by adding generic 
>>> support for several
>>> interrupters, then add parts needed for offloading.
>>
>> I can split up the patchsets to add interrupters first, then adding 
>> the offloading APIs in a separate patch.
> 
> 
> I started looking at supporting secondary interrupters myself.
> Let me work on that part a bit first. We have a bit different end goals.
> I want to handle interrupts from a secondary interrupter, while this 
> audio offload
> really just wants to mask some interrupts.
> 

I was looking at how we could possibly split up the XHCI secondary 
interrupter, and offloading parts.  Since the XHCI secondary interrupter 
is a feature that is defined in the XHCI spec (and we aren't doing 
anything outside of what is defined), I was thinking of having a 
separate XHCI driver (ie xhci-sec.c/h) that can be used to define all 
APIs related to setting up the event ring and ring management. 
(interrupt support can be added here)  This aligns a bit with what Alan 
suggested, and removing the APIs in the USB HCD, since this is XHCI 
specific stuff. ( 
https://lore.kernel.org/linux-usb/Y6zwZOquZOTZfnvP@rowland.harvard.edu/ )

For the offloading part, I think this is a bit more dependent on how 
different platforms implement it.  To use more of a generic approach 
like how Albert suggested here:

https://patchwork.kernel.org/project/linux-usb/list/?series=704174

Basically to give vendors the ability to define their own 
sequences/callbacks, and from which the XHCI driver will call into. (if 
needed)  These would need to be a separate set of XHCI drivers as well.

Do you think this is a proper model for us to go with, so that we can 
allow for vendors to easily add functionality?  Appreciate the inputs.

Thanks
Wesley Cheng


