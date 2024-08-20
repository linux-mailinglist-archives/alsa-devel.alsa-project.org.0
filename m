Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA1958DDF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 20:19:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED860822;
	Tue, 20 Aug 2024 20:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED860822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724177961;
	bh=j39p8v3Kemq1L00i10J4aauTEUR68m7EeDEctPrI3WU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vq7rj87TZ5AzuK6jE+Q7iFPrnXjm56M0BiYtyGVcUHALDNnTS69/++wbF1uYexYIf
	 Gx/9iecTvRw+/yzAKXMDmx0YdhNGeo4zo6gY0iTPQXhztJmr8Ra1IYFjNMPvFpfYR1
	 OYquw9SGtshwu2uyS6dIr1Ip0XyKKbIKhxwJmF1U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE7C3F805B3; Tue, 20 Aug 2024 20:18:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B7FF805AE;
	Tue, 20 Aug 2024 20:18:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1F37F80494; Tue, 20 Aug 2024 20:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3137F8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 20:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3137F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=lqHXDsSj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47KEhB2H022324;
	Tue, 20 Aug 2024 18:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j39p8v3Kemq1L00i10J4aauTEUR68m7EeDEctPrI3WU=; b=lqHXDsSjqyfYdNzw
	NYjBORsCyc/5LiAxJkqJp28M9V+iLKY9ZRIMCpjVnrqI2HmFWZ0lzoeDcBQnH/6+
	azU2SnDvGNZFNrxoC0mly4GJd2R4oGVrGHxOQuZ2SL5uMyQieT1Riab99VZnABbY
	l/Rwj3kVj22kx7kZWwIbFCmkjodVfEKTDK1yt1ZX+f+WMISpa+1/kMoOKuQ7RKri
	wGs6g2gLgEBZKx64ON+yYzZnPIuyaArNAJPQpFUAlbA7JG/eyXV18n/jHRC0FaSY
	H/kN4UD7sSElwIc68vS//hKhcN4Fan5M/8ey12GyTWOsHbLPxFFE55XI16+OzWFJ
	kzSPbA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdm9uqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:18:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47KIIJR3018538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:18:19 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 11:18:18 -0700
Message-ID: <638d5561-4fa0-4e14-a852-9905956445e4@quicinc.com>
Date: Tue, 20 Aug 2024 11:18:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/34] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-6-quic_wcheng@quicinc.com>
 <b8e67410-49a0-4ee8-a0a5-4b7ba03483c8@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <b8e67410-49a0-4ee8-a0a5-4b7ba03483c8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UWkYDDgbhQPhqEUQs4fcxqcxFpTWYE2z
X-Proofpoint-ORIG-GUID: UWkYDDgbhQPhqEUQs4fcxqcxFpTWYE2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_14,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200136
Message-ID-Hash: BOH2JWP6P277XNYCGHWLPW36XNI7FX3H
X-Message-ID-Hash: BOH2JWP6P277XNYCGHWLPW36XNI7FX3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOH2JWP6P277XNYCGHWLPW36XNI7FX3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 8/6/2024 7:50 AM, Amadeusz Sławiński wrote:
> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>> As part of xHCI bus suspend, the XHCI is halted.  However, if there are
>
> XHCI -> xHCI
>
Got it.
>> pending events in the secondary event ring, it is observed that the xHCI
>> controller stops responding to further commands upon host or device
>> initiated bus resume.  Iterate through all pending events and update the
>> dequeue pointer to the beginning of the event ring.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/host/xhci-mem.c  |  7 ++++++-
>>   drivers/usb/host/xhci-ring.c | 33 ++++++++++++++++++++++++++++++++-
>>   drivers/usb/host/xhci.c      |  2 +-
>>   drivers/usb/host/xhci.h      |  6 ++++++
>>   4 files changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index 2ca5937b73f4..60dfc59260d8 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -1816,7 +1816,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>>           tmp &= ERST_SIZE_MASK;
>>           writel(tmp, &ir->ir_set->erst_size);
>>   -        xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
>> +        xhci_update_erst_dequeue(xhci, ir, true);
>>       }
>>   }
>>   @@ -1859,6 +1859,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
>>           return;
>>       }
>>   +    /*
>> +     * Cleanup secondary interrupter to ensure there are no pending events.
>> +     * This also updates event ring dequeue pointer back to the start.
>> +     */
>> +    xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
>>       intr_num = ir->intr_num;
>>         xhci_remove_interrupter(xhci, ir);
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 80dca780317a..a012ddf94fb5 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -3012,7 +3012,7 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
>>    * - When all events have finished
>>    * - To avoid "Event Ring Full Error" condition
>>    */
>> -static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>> +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>>                        struct xhci_interrupter *ir,
>>                        bool clear_ehb)
>>   {
>> @@ -3112,6 +3112,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
>>       return 0;
>>   }
>>   +/*
>> + * Move the event ring dequeue pointer to skip events kept in the secondary
>> + * event ring.  This is used to ensure that pending events in the ring are
>> + * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The
>
> XHCI -> xHCI
>
Will fix.
>> + * secondary ring is typically maintained by an external component.
>> + */
>> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
>> +    struct xhci_ring *ring,    struct xhci_interrupter *ir)
>> +{
>> +    union xhci_trb *current_trb;
>> +    u64 erdp_reg;
>> +    dma_addr_t deq;
>> +
>> +    /* disable irq, ack pending interrupt and ack all pending events */
>> +    xhci_disable_interrupter(ir);
>
> That seems like a bit weird place to disable interrupter? Perhaps suspend and resume functions should be updated to handle more interrupters instead?
>
At least in the current implementation that we have, during cases where autosuspend is enabled, we obviously have to ensure that the audio offload path is fully stopped before we can have the HCD suspend the bus.  We don't want to run into a situation where the audio DSP is trying to execute audio transfers over the link while we're suspending.  So in short, the xhci_skip_sec_intr_events() is currently only used for cases where we are cleaning up the secondary interrupter. (due to the stopping of the audio offload session)  This will ensure that if the audio DSP didn't clean up the event ring properly, we'll just skip the pending events, since they will be stale once the audio stream is restarted at a later time.

Thanks

Wesley Cheng

