Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16DE958DC2
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 20:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25983E8;
	Tue, 20 Aug 2024 20:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25983E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724177068;
	bh=puNTaviJaIe5l57uc3KyTjdZ/dte2zQ+D4ZC0RIIOhQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wwnsp/oywVnC546zGLNELb2Y+qrac5GTt+YHmjivBDBoothpOJozrZWOo/klxZhOH
	 iQEzGXVHOHQR7KrfBND8nbfB7mDSb2v2Z9yV5JPbujXtVXr2Tz4bJsJJehBmboGPCo
	 ehgSXS9pwHbQcC5N3uZ/Tn3TZkc1jsOi2U/bddf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78FECF805AB; Tue, 20 Aug 2024 20:03:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F9B6F80517;
	Tue, 20 Aug 2024 20:03:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 255BCF80494; Tue, 20 Aug 2024 20:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A119DF80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 20:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A119DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ALv6+/Bs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47KG49cK026263;
	Tue, 20 Aug 2024 18:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puNTaviJaIe5l57uc3KyTjdZ/dte2zQ+D4ZC0RIIOhQ=; b=ALv6+/BsQ0hJFV+S
	CUQPgHIcV8cSccNqMKrEjJD+CwyPj1IdwuzTWEEvkKeOPqsUlDEmWzpn1jhbRkHN
	uBFS8fbVZ4qlY5pCvwV1cEOi8vzz5N1N/chcg+vdn9NP0FIyUGjOZ/PzbdryMN83
	H+hLk4Es4zv2QndJu/Iz2gT7/gchg89+dpWmgx1KOP3uW2/EEQhtq5iphVcCY3d5
	ePpZlve5CGVnFFPyWr4n9kqkpKgCDFbOAUsZOGLJG4bGabwISmzZ1JbAJ2pEnOzT
	FY5cgF0ACXd6vK70kB+18L5BYQqmvoz26mtDwEFq0/wu0VJphX3FCgFyIeTVpVBm
	gnnjSA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414xb9g9jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:03:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47KI3ap4030929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:03:36 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 11:03:36 -0700
Message-ID: <f7e54095-c667-4195-988f-4450c533cfa2@quicinc.com>
Date: Tue, 20 Aug 2024 11:03:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 03/34] xhci: sideband: add initial api to register a
 sideband entity
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
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-4-quic_wcheng@quicinc.com>
 <1a80c749-1cbc-4ad9-ac14-dec660bd7f8b@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1a80c749-1cbc-4ad9-ac14-dec660bd7f8b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FStADRAA5-hParYeCmegweSox3NlqBjV
X-Proofpoint-ORIG-GUID: FStADRAA5-hParYeCmegweSox3NlqBjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200134
Message-ID-Hash: 4Y2TP7QC4HI3FITSLVJ7TSKFKDWL3FUQ
X-Message-ID-Hash: 4Y2TP7QC4HI3FITSLVJ7TSKFKDWL3FUQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Y2TP7QC4HI3FITSLVJ7TSKFKDWL3FUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 8/6/2024 7:49 AM, Amadeusz Sławiński wrote:
> On 8/1/2024 3:16 AM, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Introduce XHCI sideband, which manages the USB endpoints being requested by
>> a client driver.  This is used for when client drivers are attempting to
>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>> sideband will allow for drivers to fetch the required information about the
>> transfer ring, so the user can submit transfers independently.  Expose the
>> required APIs for drivers to register and request for a USB endpoint and to
>> manage XHCI secondary interrupters.
>>
>> Multiple ring segment page linking, proper endpoint clean up, and allowing
>> module compliation added by Wesley Cheng to complete original concept code
>> by Mathias Nyman.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/host/Kconfig          |   9 +
>>   drivers/usb/host/Makefile         |   2 +
>>   drivers/usb/host/xhci-sideband.c  | 419 ++++++++++++++++++++++++++++++
>>   drivers/usb/host/xhci.h           |   4 +
>>   include/linux/usb/xhci-sideband.h |  68 +++++
>>   5 files changed, 502 insertions(+)
>>   create mode 100644 drivers/usb/host/xhci-sideband.c
>>   create mode 100644 include/linux/usb/xhci-sideband.h
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 4448d0ab06f0..6135603c5dc4 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
>>         Say 'Y' to enable the support for the xHCI host controller
>>         found in Renesas RZ/V2M SoC.
>>   +config USB_XHCI_SIDEBAND
>> +    tristate "xHCI support for sideband"
>> +    help
>> +      Say 'Y' to enable the support for the xHCI sideband capability.
>> +      provide a mechanism for a sideband datapath for payload associated
>
> Sentence should start from capital letter, so provide -> Provide
Sorry for the late reply.  Been going through addressing the other comments.  Will fix.
>
>
>> +      with audio class endpoints. This allows for an audio DSP to use
>> +      xHCI USB endpoints directly, allowing CPU to sleep while playing
>> +      audio
>
> Missing '.' at the end of sentence.
Same.
>
> (...)
>
>> +/**
>> + * xhci_sideband_remove_endpoint - remove endpoint from sideband access list
>> + * @sb: sideband instance for this usb device
>> + * @host_ep: usb host endpoint
>> + *
>> + * Removes an endpoint from the list of sideband accessed endpoints for this usb
>> + * device.
>> + * sideband client should no longer touch the endpoint transfer buffer after
>> + * calling this.
>> + *
>> + * Return: 0 on success, negative error otherwise.
>> + */
>> +int
>> +xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>> +                  struct usb_host_endpoint *host_ep)
>> +{
>> +    struct xhci_virt_ep *ep;
>> +    unsigned int ep_index;
>> +
>> +    mutex_lock(&sb->mutex);
>> +    ep_index = xhci_get_endpoint_index(&host_ep->desc);
>> +    ep = sb->eps[ep_index];
>> +
>> +    if (!ep || !ep->sideband) {
>> +        mutex_unlock(&sb->mutex);
>> +        return -ENODEV;
>> +    }
>> +
>> +    __xhci_sideband_remove_endpoint(sb, ep);
>> +    xhci_initialize_ring_info(ep->ring, 1);
>> +    mutex_unlock(&sb->mutex);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
>> +
>> +int
>> +xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
>> +                struct usb_host_endpoint *host_ep)
>> +{
>> +    struct xhci_virt_ep *ep;
>> +    unsigned int ep_index;
>> +
>> +    ep_index = xhci_get_endpoint_index(&host_ep->desc);
>> +    ep = sb->eps[ep_index];
>> +
>> +    if (!ep || ep->sideband != sb)
>
> Any reason why we check if ep->sideband != sb only on stop but not on remove above?
>
I'll add the needed checks across all the APIs you've pointed out.  There wasn't a specific reason for leaving this check out.
>> +        return -EINVAL;
>> +
>> +    return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
>> +}
>> +EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
>> +
>> +/**
>> + * xhci_sideband_get_endpoint_buffer - gets the endpoint transfer buffer address
>> + * @sb: sideband instance for this usb device
>> + * @host_ep: usb host endpoint
>> + *
>> + * Returns the address of the endpoint buffer where xHC controller reads queued
>> + * transfer TRBs from. This is the starting address of the ringbuffer where the
>> + * sideband client should write TRBs to.
>> + *
>> + * Caller needs to free the returned sg_table
>> + *
>> + * Return: struct sg_table * if successful. NULL otherwise.
>> + */
>> +struct sg_table *
>> +xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
>> +                  struct usb_host_endpoint *host_ep)
>> +{
>> +    struct xhci_virt_ep *ep;
>> +    unsigned int ep_index;
>> +
>> +    ep_index = xhci_get_endpoint_index(&host_ep->desc);
>> +    ep = sb->eps[ep_index];
>> +
>> +    if (!ep)
>
> And here there is none of checks done in above 2 functions? Seems bit weird.
>
>> +        return NULL;
>> +
>> +    return xhci_ring_to_sgtable(sb, ep->ring);
>> +}
>> +EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
>> +
>
> (...)
>
>> +MODULE_DESCRIPTION("XHCI sideband driver for secondary interrupter management");
>
> XHCI -> xHCI
>
Fixed.
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index efbd1f651da4..9232c53d204a 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -693,6 +693,8 @@ struct xhci_virt_ep {
>>       int            next_frame_id;
>>       /* Use new Isoch TRB layout needed for extended TBC support */
>>       bool            use_extended_tbc;
>> +    /* set if this endpoint is controlled via sideband access*/
>> +    struct xhci_sideband            *sideband;
>>   };
>>     enum xhci_overhead_type {
>> @@ -755,6 +757,8 @@ struct xhci_virt_device {
>>       u16                current_mel;
>>       /* Used for the debugfs interfaces. */
>>       void                *debugfs_private;
>> +    /* set if this device is registered for sideband access */
>> +    struct xhci_sideband            *sideband;
>>   };
>>     /*
>> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
>> new file mode 100644
>> index 000000000000..1035dae43cee
>> --- /dev/null
>> +++ b/include/linux/usb/xhci-sideband.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * xHCI host controller sideband support
>> + *
>> + * Copyright (c) 2023, Intel Corporation.
>> + *
>> + * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>> + */
>> +
>> +#ifndef __LINUX_XHCI_SIDEBAND_H
>> +#define __LINUX_XHCI_SIDEBAND_H
>> +
>> +#include <linux/scatterlist.h>
>> +#include <linux/usb.h>
>> +
>> +#define    EP_CTX_PER_DEV        31    /* FIMXME defined twice, from xhci.h */
>
> If it is left for later, FIMXME -> FIXME

Ack.

Thanks

Wesley Cheng

>
> (...)
