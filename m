Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3826C89DD
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Mar 2023 02:17:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2B4FE7E;
	Sat, 25 Mar 2023 02:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2B4FE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679707038;
	bh=BP35YZvk8FLlEqWdmT0gYtx0cLDptNrJ0W/Ef/CJxvM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nwIdnc1TaLvWNfl6VVhj2L/CIH4NymqhVrw03hD8SHehNdJCylsQ9RFcXfwcmcQ3B
	 pX6tZIOd+WznbFCVx8nN+q04UvXkj6M2zFD9briZx0FWEQE7HEESA8fRb0W7cq2jH8
	 ZHbRSJBUgKOa9G/2X+P6Xven9M3tXNsLguXDQUk0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9020BF8027B;
	Sat, 25 Mar 2023 02:16:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3FA2F802E8; Sat, 25 Mar 2023 02:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1082F80254
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 02:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1082F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=TmGDT2Kv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32P19H3f015520;
	Sat, 25 Mar 2023 01:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bhYjiuvUfwpUCea0950cvK2HHYTarKFcAn58TsVx+2E=;
 b=TmGDT2KvUAujQf21HnAjsCtf65vznBdpzxn+q4Syf/fE12FrUmPGXccgLwBBLBQ+YB7q
 y2+r5IM0cxIPG93qqucTe/PP6dEwGNtrV7IRE4ZtA7SlrPPuJv9/lWtP1cwvYFM2u0az
 OINZPMkKYI3neNygHLvPr/yOsde85I6RMaNrNNNdkQ1VIVzwtlBT5i+H2rD7OYMK7UH8
 OlDbPgct3kpiPE2nLe4j50UhuNmMoK5UmD+hlViikRDJJpsMJveBtt1a5KA4YvIrJ3l3
 aF62+ZuWOf5QKXXlMBPDzLMiS06WgP85X2MnhkPcUr8/Kp1104/Xr13oEIIdv9Ux9Nk4 yg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phgtu8sas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Mar 2023 01:16:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 32P1G5S8018750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Mar 2023 01:16:05 GMT
Received: from [10.110.22.108] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Mar
 2023 18:16:03 -0700
Message-ID: <318549cb-dd83-55f2-fa05-57fce041ed40@quicinc.com>
Date: Fri, 24 Mar 2023 18:15:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 08/28] ASoC: qcom: Add USB backend ASoC driver for Q6
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <agross@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-9-quic_wcheng@quicinc.com>
 <ad7dd26d-0ee6-675f-72a5-a93bb0240121@linaro.org>
 <64fc529a-3250-e655-e06e-952f25b1ac2b@quicinc.com>
 <3795f87d-ae1b-bc58-79b7-56c67329de02@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <3795f87d-ae1b-bc58-79b7-56c67329de02@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oUTp3vkfgygB_tfMuxg05aK4khzpnl5J
X-Proofpoint-GUID: oUTp3vkfgygB_tfMuxg05aK4khzpnl5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=788 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303250007
Message-ID-Hash: O6TQREOHCF56VHPUIDMUFB6BFYI2POMF
X-Message-ID-Hash: O6TQREOHCF56VHPUIDMUFB6BFYI2POMF
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6TQREOHCF56VHPUIDMUFB6BFYI2POMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srini,

On 3/9/2023 11:21 PM, Srinivas Kandagatla wrote:
> 
> 
> On 09/03/2023 19:38, Wesley Cheng wrote:
>> Hi Srinivas,
>>
>> On 3/9/2023 1:01 AM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 08/03/2023 23:57, Wesley Cheng wrote:
>>>> Create a USB BE component that will register a new USB port to the 
>>>> ASoC USB
>>>> framework.  This will handle determination on if the requested audio
>>>> profile is supported by the USB device currently selected.
>>>>
>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>
>>> Thanks Wesley for the patch, I have few minor comments.
>>>
>>
>> Thanks for the review!
>>
>>>> ---
>>>>   include/sound/q6usboffload.h  |  20 ++++
>>>>   sound/soc/qcom/Kconfig        |   4 +
>>>>   sound/soc/qcom/qdsp6/Makefile |   1 +
>>>>   sound/soc/qcom/qdsp6/q6usb.c  | 208 
>>>> ++++++++++++++++++++++++++++++++++
>>>>   4 files changed, 233 insertions(+)
>>>>   create mode 100644 include/sound/q6usboffload.h
>>>>   create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>>>>
>>>> diff --git a/include/sound/q6usboffload.h 
>>>> b/include/sound/q6usboffload.h
>>>> new file mode 100644
>>>> index 000000000000..4fb1912d9f55
>>>> --- /dev/null
>>>> +++ b/include/sound/q6usboffload.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0
>>>> + *
>>>> + * linux/sound/q6usboffload.h -- QDSP6 USB offload
>>>> + *
>>>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>>>> rights reserved.
>>>> + */
>>>> +
>>>> +/**
>>>> + * struct q6usb_offload
>>>> + * @dev - dev handle to usb be
>>>> + * @sid - streamID for iommu
>>>> + * @intr_num - usb interrupter number
>>>> + * @domain - allocated iommu domain
>>>> + **/
>>>> +struct q6usb_offload {
>>>> +    struct device *dev;
>>>> +    long long sid;
>>>> +    u32 intr_num;
>>>> +    struct iommu_domain *domain;
>>> Why do we need to store this domain, You can remove this along with 
>>> the one line that gets domain in probe function.
>>>
>>
>> We'll need a reference to the iommu domain, because the QC USB offload 
>> driver will be the one that is going to map the XHCI interrupter and 
>> transfer ring regions for the audio DSP.  This happens when a USB QMI 
> 
> this is okay, AFAIU, as long as uaudio_qdev->dev pointer is used in dma 
> alloc apis like dma_map*, dma_alloc_* you would not need to handle 
> iommu_domain directly like this in drivers.
> 

Was looking into this a bit more, but couldn't figure out the proper DMA 
API that would achieve what we're attempting to do.  So we are trying to 
map the PA of the memory allocated by the XHCI driver, for say...the 
xfer buffers being used for the ISOC ep.

If I call the DMA MAP variants, ie dma_map_single_attrs, we pass in a 
virtual address only, and the DMA map api will map to a PA that it 
derives from that.  However, we're trying to map to memory accessible by 
the audio DSP, which is the virtual address we're passing into 
iommu_map(), and the PA mapping to is the XHCI xfer buffer.  There 
wasn't a similar API that achieved this.  Please clarify if there might 
be something I'm missing.

Thanks
Wesley Cheng
