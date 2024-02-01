Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9A844F07
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 03:12:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3BC950;
	Thu,  1 Feb 2024 03:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3BC950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706753550;
	bh=GEHSgsu0BZcuUy9oj10MDz3Ju71xKXpFfee68XOSut4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AvSuK/3Oxjle3x0UzxeLu8KAww+lPTstAw4+XY1TOxcQXkF3lgFEZ6PkOZTYxGd8/
	 3qDosXf9WzSRTB5j+4oX65OU6BscYftSlYwMQqlravHsadBoLyf9qqZ0Petj9fmJhB
	 l7bEIzVVhYR0WkxiTQ5av26ZcF1GLtPnBopQxLpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C79EF80589; Thu,  1 Feb 2024 03:11:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A866F80588;
	Thu,  1 Feb 2024 03:11:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB549F8055C; Thu,  1 Feb 2024 03:11:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52546F80149
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 03:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52546F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=T0D0+NJu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 411020og008375;
	Thu, 1 Feb 2024 02:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=RWnYYJY5eR7CWR2cSLbZQZuLEMhedY0ZNp51BM7vOHg=; b=T0
	D0+NJul2CGun8Z+yt/tA6Z30WlPQoo6obHCjD7VinRSBDDS0CLcE7faWiQ8/8e7g
	oduejLaT9isUGmXW40W2RVX+55/eYBHgG1FY+cc0UIR5aLH/3aDDa6uzVmgnqYJ2
	CZHcNFZ06oddzZBTSRVSqMA0mEFTR/wqSBu3p/qJhrHsi3l2J9fRuNAtEdTmDd1S
	SYPm0iTzxX4ANxJxINlFjkg2EyXdZBzYYnJ3FapnAhlBH4NSguXpsFGPIwVYHKmu
	pkXjhipaWgS6MJiZEHuzzU35X23JtA3kETtxLn3gt+3WSKjqoLzsE/0tmwyuO6qA
	67vy67925RDdJJ28DmVA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w00dc06wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 02:11:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4112BbuJ018472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 02:11:37 GMT
Received: from [10.110.47.187] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 18:11:36 -0800
Message-ID: <775b6010-0d9f-eb6f-2402-325bfba73094@quicinc.com>
Date: Wed, 31 Jan 2024 18:11:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v12 04/41] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        "Neronin, Niklas" <niklas.neronin@intel.com>
References: <20240102214549.22498-1-quic_wcheng@quicinc.com>
 <20240102214549.22498-5-quic_wcheng@quicinc.com>
 <734591a1-50b4-6dc7-0b93-077355ec12e4@linux.intel.com>
 <7b2ec96b-b72f-c848-7c35-36e61a4072ac@quicinc.com>
 <b254f73b-a1bc-3dd4-f485-a3acf556835d@quicinc.com>
 <2178e799-2068-7443-59b2-310dfdd1ddee@linux.intel.com>
 <ae64ce69-dc1b-1534-7950-0a35c4a56f58@quicinc.com>
 <ff0bff8b-f26a-87bd-9762-9f2af98abcca@quicinc.com>
 <44a3d4db-7759-dd93-782a-1efbebfdb22c@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <44a3d4db-7759-dd93-782a-1efbebfdb22c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wfVeILWC3-aNJKK-XfQL6Zc9ABL1hHzi
X-Proofpoint-GUID: wfVeILWC3-aNJKK-XfQL6Zc9ABL1hHzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2402010015
Message-ID-Hash: T3KCSG37EEG7VNTAYCP2P7HEQP3CFLY3
X-Message-ID-Hash: T3KCSG37EEG7VNTAYCP2P7HEQP3CFLY3
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3KCSG37EEG7VNTAYCP2P7HEQP3CFLY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mathias,

On 1/29/2024 7:44 AM, Mathias Nyman wrote:
> On 26.1.2024 23.13, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 1/16/2024 12:24 PM, Wesley Cheng wrote:
>>> Hi Mathias,
>>>
>>> On 1/15/2024 6:01 AM, Mathias Nyman wrote:
>>>> On 10.1.2024 1.42, Wesley Cheng wrote:
>>>>> Hi Mathias,
>>>>>
>>>>> On 1/8/2024 12:51 PM, Wesley Cheng wrote:
>>>>>> Hi Mathias,
>>>>>>
>>>>>> On 1/4/2024 6:48 AM, Mathias Nyman wrote:
>>>>>>> On 2.1.2024 23.45, Wesley Cheng wrote:
>>>>>>>> As part of xHCI bus suspend, the XHCI is halted.  However, if 
>>>>>>>> there are
>>>>>>>> pending events in the secondary event ring, it is observed that 
>>>>>>>> the xHCI
>>>>>>>> controller stops responding to further commands upon host or device
>>>>>>>> initiated bus resume.  Iterate through all pending events and 
>>>>>>>> update the
>>>>>>>> dequeue pointer to the beginning of the event ring.
>>>>>>>>
>>>>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>>>> ...
>>>>>>>> +/*
>>>>>>>> + * Move the event ring dequeue pointer to skip events kept in 
>>>>>>>> the secondary
>>>>>>>> + * event ring.  This is used to ensure that pending events in 
>>>>>>>> the ring are
>>>>>>>> + * acknowledged, so the XHCI HCD can properly enter 
>>>>>>>> suspend/resume. The
>>>>>>>> + * secondary ring is typically maintained by an external 
>>>>>>>> component.
>>>>>>>> + */
>>>>>>>> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
>>>>>>>> +    struct xhci_ring *ring,    struct xhci_interrupter *ir)
>>>>>>>> +{
>>>>>>>> +    union xhci_trb *erdp_trb, *current_trb;
>>>>>>>> +    u64 erdp_reg;
>>>>>>>> +    u32 iman_reg;
>>>>>>>> +    dma_addr_t deq;
>>>>>>>> +
>>>>>>>> +    /* disable irq, ack pending interrupt and ack all pending 
>>>>>>>> events */
>>>>>>>> +    xhci_disable_interrupter(ir);
>>>>>>>> +    iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
>>>>>>>> +    if (iman_reg & IMAN_IP)
>>>>>>>> +        writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
>>>>>>>> +
>>>>>>>> +    /* last acked event trb is in erdp reg  */
>>>>>>>> +    erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
>>>>>>>> +    deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
>>>>>>>> +    if (!deq) {
>>>>>>>> +        xhci_err(xhci, "event ring handling not required\n");
>>>>>>>> +        return;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    erdp_trb = current_trb = ir->event_ring->dequeue;
>>>>>>>> +    /* read cycle state of the last acked trb to find out CCS */
>>>>>>>> +    ring->cycle_state = 
>>>>>>>> le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
>>>>>>>> +
>>>>>>>> +    while (1) {
>>>>>>>> +        inc_deq(xhci, ir->event_ring);
>>>>>>>> +        erdp_trb = ir->event_ring->dequeue;
>>>>>>>> +        /* cycle state transition */
>>>>>>>> +        if ((le32_to_cpu(erdp_trb->event_cmd.flags) & 
>>>>>>>> TRB_CYCLE) !=
>>>>>>>> +            ring->cycle_state)
>>>>>>>> +            break;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    xhci_update_erst_dequeue(xhci, ir, current_trb, true);
>>>>>>>> +}
>>>>>>>
>>>>>>> Code above is very similar to the existing event ring processing 
>>>>>>> parts of xhci_irq()
>>>>>>> and xhci_handle_event()
>>>>>>>
>>>>>>> I'll see if I can refactor the existing event ring processing, 
>>>>>>> decouple it from
>>>>>>> event handling so that it could be used by primary and secondary 
>>>>>>> interrupters with
>>>>>>> handlers, and this case where we just want to clear the event ring.
>>>>>>>
>>>>>>
>>>>>> Thanks, that makes sense.  Will take a look as well.
>>>>>>
>>>>>
>>>>> How about something like the below?  Tested this on my set up and 
>>>>> everything looks to be working fine.  Had to add another param to 
>>>>> struct xhci_interrupters to tell the XHCI interrupt handler to say 
>>>>> if that particular interrupter wants to skip_events (handling).  
>>>>> This way, its something that the class driver utilizing the 
>>>>> interrupter will have to tell XHCI sideband.  It would allow the 
>>>>> user to determine if they want to use the interrupter to actually 
>>>>> handle events or not on the proc running Linux.
>>>>>
>>>>
>>>> Yes, I have something similar.
>>>> I'll share it soon, just need to
>>>> clean it up a bit fist.
>>>>
>>>
>>> Sure, no worries.  Will test it when its available.  Thanks!
>>>
>>
>> Was just wondering if you had the time to clean up the changes?  If 
>> not, maybe you can provide a patch with whatever you have, and I can 
>> try my best to clean it up to your liking?  Thanks!
> 
> Sure, got stuck fixing other issues.
>

No worries, tested the code briefly as is and it is working, with some 
minor modifications.

> Code is not yet cleaned up, commit messages are not ready etc, but 
> current work is in
> a fix_eventhandling branch:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git  
> fix_eventhandling
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_eventhandling 
> 
> 
> I was in the middle of figuring out when and where the ip_autoclear and 
> interrupt
> moderation values should be set for secondary interrupters
> 

I set these currently when the client driver requests for the 
interrupter, ie xhci_sideband_create_interrupter().  If the client 
driver wants to actually have the secondary interrupter events handled 
by the OS then I added a path to call xhci_enable_interrupter() to 
enable that IRQ line.  Likewise, based on XHCI spec Figure 4-22, the 
IMAN interrupt enable (IE) bit controls basically when IMOD and IP 
autoclear mechanisms would come into the picture, so I placed these 
configurations before we set the IE bit.

For the most part, if we offload event ring handling to another 
processor, then IMOD and IE settings would be irrelevant IMO.

The only pitfall with this is that it gets a bit cumbersome (although 
flexible) for the client driver to know what these arguments actually do 
within the XHCI layer.  Working through your changes and will push 
something soon.  Thanks again for sharing the changes!

Thanks
Wesley Cheng
