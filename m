Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2A7D01FA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 20:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7AC0826;
	Thu, 19 Oct 2023 20:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7AC0826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697741014;
	bh=EVBcqP8B2TKh9Pq3xwKBVtf2sLnCT3Lz4s5bqLteSGc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=id7whjDQRKMML7JOjyoP6rZsN8DaY7B+4D8rUlq1KxcZdHdTyc2CrIZBXVEiYUS85
	 5jTcqepskTS1PRqOGV4Whbk/f+N/xo4VzhLFLSxxbauzxqzLQWiBxlxXUUHDPdhtS5
	 OqJJh4JTBxntZWkUGJrJJHDQ5AslUjf7RhSB9r08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A8B2F80166; Thu, 19 Oct 2023 20:42:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4768DF8019B;
	Thu, 19 Oct 2023 20:42:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 910C3F8025F; Thu, 19 Oct 2023 20:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EE99F8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 20:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE99F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=nT+MmY2W
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JHLeYc017772;
	Thu, 19 Oct 2023 18:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+WYtO5cbSnOWSh4A3pWMM/G3dupE15Bp2QKlH1BzWsI=;
 b=nT+MmY2WzSPKW196i552YTH0gwyJZGiZFYXUqprsFbil4DZFgftzvGeEKVvtUYaJAuGA
 huN0YQQjWNiQxTBRtKOTZeBhCEfRJ1tMhBBBn7ly5a3/CJTqGGw6q0F0Nu/bhogk/eCj
 dfhBZz7M3gqqWRzcleJk5qT2TAhsNipbDp/VXxkTMsMcD29Los9LHhRUmivk5de8tn8V
 yUDhfQI/UejhX4nCJS0olgOh9OQ2mlPz/qjuiigwRt3EuzxQQlq0Bvaq6drtH1jC7Olb
 TiTHgqy7GkJ4x4/67NmIiTiOQHtSafjQysNEJEmO3wUiaO/dksSr0JLXefRGG4iasLzO IQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttg82ums4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 18:42:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39JIgNob007271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 18:42:23 GMT
Received: from [10.110.99.208] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 11:42:22 -0700
Message-ID: <c39df4c7-ea78-0505-a8d9-db41119fc977@quicinc.com>
Date: Thu, 19 Oct 2023 11:42:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 09/34] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-10-quic_wcheng@quicinc.com>
 <7aa4ea87-9d1f-400a-bcc5-b56e5b4500c6@linux.intel.com>
 <c72bcf47-af0b-8819-1c30-06b51358381e@quicinc.com>
 <2f05708e-3ee8-472e-a24f-6f3eb118133c@linux.intel.com>
 <fcaa93ba-3ca4-5a18-d3bd-afebe8def327@quicinc.com>
 <ec25bb67-6c83-430b-bc79-234c03801250@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ec25bb67-6c83-430b-bc79-234c03801250@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: k5nkufEfbNCtKUCx8FQH5sYfnPcPKmKk
X-Proofpoint-ORIG-GUID: k5nkufEfbNCtKUCx8FQH5sYfnPcPKmKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_17,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_spam policy=outbound score=65
 clxscore=1015 impostorscore=0
 mlxlogscore=-26 spamscore=65 priorityscore=1501 adultscore=0 bulkscore=0
 mlxscore=65 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310190159
Message-ID-Hash: S5ABINUB7BMHRC5NER5EPIY6OMIAUSRL
X-Message-ID-Hash: S5ABINUB7BMHRC5NER5EPIY6OMIAUSRL
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5ABINUB7BMHRC5NER5EPIY6OMIAUSRL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/18/2023 6:00 PM, Pierre-Louis Bossart wrote:
> 
> 
>>>>>> Specifically, the QC ADSP can support all potential endpoints that are
>>>>>> exposed by the audio data interface.  This includes, feedback
>>>>>> endpoints
>>>>>> (both implicit and explicit) as well as the isochronous (data)
>>>>>> endpoints.
>>>>>
>>>>> implicit feedback means support for capture. This is confusing...
>>>>>
>>>>
>>>> I mean, a USB device can expose a capture path, but as of now, we won't
>>>> enable the offloading to the audio DSP for it.  However, if we're
>>>> executing playback, and device does support implicit feedback, we will
>>>> pass that along to the audio DSP to utilize.
>>>
>>> Not following. Implicit feedback means a capture stream *SHALL* be
>>> started. Are you saying this capture stream is hidden and handled at the
>>> DSP level only? If yes, what prevents you from exposing the capture
>>> stream to userspace as well?
>>>
>>> I must be missing something.
>>>
>>
>> My understanding is that with implicit feedback endpoints, it allows for
>> another data endpoint in the opposite direction to be utilized as a
>> feedback endpoint (versus having to expose another EP, such as in the
>> case of explicit feedback).  For example, if we are enabling the
>> playback path (and the device does have a capture data ep) then the data
>> ep used for the capture path can be used.
> 
> That's right, so all the plumbing is enabled for the capture path...
> Making a decision to discard the data is very odd, all the work has
> already been done at lower levels, so why not expose the captured data?
> 

So that would be at the USB level, but from the audio DSP end, there are 
still things that need to be enabled to route the data properly.  For 
feedback endpoints, the data we're actually sending won't involve the 
audio streaming side of things on the DSP.

Thanks
Wesley Cheng
