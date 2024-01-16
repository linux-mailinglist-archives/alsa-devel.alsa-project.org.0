Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6582F78B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 21:25:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CC2200;
	Tue, 16 Jan 2024 21:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CC2200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705436702;
	bh=/iZ/XhGDPKyEC2qDhr4v1BM7WX19k4XGo31kibxi7/c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hfc0NzhjAlM3UhHy50SJsR7X+lQ9em4LUlDdNsFOqhXXFGskxF+u8fDc4wn12u/SW
	 dU8s2OxUKQxAD1h9XasaZDiYpmeeYwQ9jPDBF3wQH5IVGasfvLZMPi7x+rj6XSkPZ9
	 PhXZM5M3pmvvGBEeeCh5Fp1QCFeOT7mqhE7z+lFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4BFCF802E8; Tue, 16 Jan 2024 21:24:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B057F8057C;
	Tue, 16 Jan 2024 21:24:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48224F801F5; Tue, 16 Jan 2024 21:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54F44F80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 21:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F44F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=jcFDUvS8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GHIZnb009500;
	Tue, 16 Jan 2024 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GofOW4URAae/4uEZ/e91nCMdR8b1OaSRGCZlIwPE/Lo=; b=jc
	FDUvS8xUL/XwSmOBNAzwFoHw9phsJ2rxpweAyt/aNdWyNeTOQBXnG/4EaUSvjdn4
	e4VeKfj2iebK3z3zyQw/hU5naw+rVsiLQlBEJHN0p5y/vXyIS6YaRUIFQNEVo3iQ
	D5r/wmSkg3BTlCNDJpXVP3FEhpYymSc7ct/VpJ6Xc2jYFfZ/X2JoyJy5heswIjH8
	14hQY2tMXqU/iAeaebQHjoL0RAxLRz4eaOt90do2NB/8QgZHv3mffMr0L4qRQLXm
	mT13uZpErelnjts2708WHxQgYTgwntwzgNVAx2sit3207PO+OlIFuHnNbTCzctlo
	9f7mPiN1sHyF3nAPgaZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vns4m9b1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 20:24:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 40GKODnx024586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 20:24:13 GMT
Received: from [10.71.112.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 12:24:12 -0800
Message-ID: <ae64ce69-dc1b-1534-7950-0a35c4a56f58@quicinc.com>
Date: Tue, 16 Jan 2024 12:24:08 -0800
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
        <alsa-devel@alsa-project.org>
References: <20240102214549.22498-1-quic_wcheng@quicinc.com>
 <20240102214549.22498-5-quic_wcheng@quicinc.com>
 <734591a1-50b4-6dc7-0b93-077355ec12e4@linux.intel.com>
 <7b2ec96b-b72f-c848-7c35-36e61a4072ac@quicinc.com>
 <b254f73b-a1bc-3dd4-f485-a3acf556835d@quicinc.com>
 <2178e799-2068-7443-59b2-310dfdd1ddee@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2178e799-2068-7443-59b2-310dfdd1ddee@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gbHT4oiS8cADCWPxnU5049TNAUcUkFXq
X-Proofpoint-ORIG-GUID: gbHT4oiS8cADCWPxnU5049TNAUcUkFXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=720
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401160161
Message-ID-Hash: RZWHDKJA3C6AB7SCJUSRVKMAH6I5RCII
X-Message-ID-Hash: RZWHDKJA3C6AB7SCJUSRVKMAH6I5RCII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZWHDKJA3C6AB7SCJUSRVKMAH6I5RCII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mathias,

On 1/15/2024 6:01 AM, Mathias Nyman wrote:
> On 10.1.2024 1.42, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 1/8/2024 12:51 PM, Wesley Cheng wrote:
>>> Hi Mathias,
>>>
>>> On 1/4/2024 6:48 AM, Mathias Nyman wrote:
>>>> On 2.1.2024 23.45, Wesley Cheng wrote:
>>>>> As part of xHCI bus suspend, the XHCI is halted.  However, if there 
>>>>> are
>>>>> pending events in the secondary event ring, it is observed that the 
>>>>> xHCI
>>>>> controller stops responding to further commands upon host or device
>>>>> initiated bus resume.  Iterate through all pending events and 
>>>>> update the
>>>>> dequeue pointer to the beginning of the event ring.
>>>>>
>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>> ...
>>>>> +/*
>>>>> + * Move the event ring dequeue pointer to skip events kept in the 
>>>>> secondary
>>>>> + * event ring.  This is used to ensure that pending events in the 
>>>>> ring are
>>>>> + * acknowledged, so the XHCI HCD can properly enter 
>>>>> suspend/resume. The
>>>>> + * secondary ring is typically maintained by an external component.
>>>>> + */
>>>>> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
>>>>> +    struct xhci_ring *ring,    struct xhci_interrupter *ir)
>>>>> +{
>>>>> +    union xhci_trb *erdp_trb, *current_trb;
>>>>> +    u64 erdp_reg;
>>>>> +    u32 iman_reg;
>>>>> +    dma_addr_t deq;
>>>>> +
>>>>> +    /* disable irq, ack pending interrupt and ack all pending 
>>>>> events */
>>>>> +    xhci_disable_interrupter(ir);
>>>>> +    iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
>>>>> +    if (iman_reg & IMAN_IP)
>>>>> +        writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
>>>>> +
>>>>> +    /* last acked event trb is in erdp reg  */
>>>>> +    erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
>>>>> +    deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
>>>>> +    if (!deq) {
>>>>> +        xhci_err(xhci, "event ring handling not required\n");
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    erdp_trb = current_trb = ir->event_ring->dequeue;
>>>>> +    /* read cycle state of the last acked trb to find out CCS */
>>>>> +    ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) 
>>>>> & TRB_CYCLE;
>>>>> +
>>>>> +    while (1) {
>>>>> +        inc_deq(xhci, ir->event_ring);
>>>>> +        erdp_trb = ir->event_ring->dequeue;
>>>>> +        /* cycle state transition */
>>>>> +        if ((le32_to_cpu(erdp_trb->event_cmd.flags) & TRB_CYCLE) !=
>>>>> +            ring->cycle_state)
>>>>> +            break;
>>>>> +    }
>>>>> +
>>>>> +    xhci_update_erst_dequeue(xhci, ir, current_trb, true);
>>>>> +}
>>>>
>>>> Code above is very similar to the existing event ring processing 
>>>> parts of xhci_irq()
>>>> and xhci_handle_event()
>>>>
>>>> I'll see if I can refactor the existing event ring processing, 
>>>> decouple it from
>>>> event handling so that it could be used by primary and secondary 
>>>> interrupters with
>>>> handlers, and this case where we just want to clear the event ring.
>>>>
>>>
>>> Thanks, that makes sense.  Will take a look as well.
>>>
>>
>> How about something like the below?  Tested this on my set up and 
>> everything looks to be working fine.  Had to add another param to 
>> struct xhci_interrupters to tell the XHCI interrupt handler to say if 
>> that particular interrupter wants to skip_events (handling).  This 
>> way, its something that the class driver utilizing the interrupter 
>> will have to tell XHCI sideband.  It would allow the user to determine 
>> if they want to use the interrupter to actually handle events or not 
>> on the proc running Linux.
>>
> 
> Yes, I have something similar.
> I'll share it soon, just need to
> clean it up a bit fist.
> 

Sure, no worries.  Will test it when its available.  Thanks!

Thanks
Wesley Cheng
