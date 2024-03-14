Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1A87C48A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Mar 2024 21:58:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1495E19E7;
	Thu, 14 Mar 2024 21:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1495E19E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710449899;
	bh=i/In70euOucOu10Yn4mf9BZSNHDbmPI7QOVoNvr1wN0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RInipVZb7L5NhsLcPSve50CVTVU4Pdohmjtrg0DDhQFlj5TKHyAYCsbqJwhW/xix1
	 mri9ony4pyIoxsuX5c1sHaaZN6BZXLF6kXY1bqFyQ5ozTUsONT6WXdhQnUSMrpWhz7
	 frIeZlFxQxUa2sm4+GPeGgnO+MA2Ix0yHxg8bA8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AF59F80563; Thu, 14 Mar 2024 21:57:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D16A1F80563;
	Thu, 14 Mar 2024 21:57:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B2A8F8028D; Thu, 14 Mar 2024 21:57:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCAD8F800E4
	for <alsa-devel@alsa-project.org>; Thu, 14 Mar 2024 21:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCAD8F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VypaMdDu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42EKFsjk019502;
	Thu, 14 Mar 2024 20:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=i1RRwlY+GSx5CIfYwtnNU1qLUiFuXaO9rJ+b19a99LU=; b=Vy
	paMdDuLHTBjsvksPD2BnAdKbsOB51/5Li48ozD40T3l6rwY/B8nOD1KgUDng+sO3
	aiaKBQRFPLsVhYNNk1dD3NVvrA2h3AJs8i3LKGOkWHs91I3yKQS6k6Z8jXZAblbZ
	XnWX+kdgFjWTEj1sUGMlzP5+TQP0c3Ei+sRSCMdmlMD2M6GgRkigVqaZfBYHLpCA
	LC2sZrKu/v4LCyVOXaLBWxaJT/9sDaOofQ9xNSObmdPran5eK+ggiUNcp9u0YLSr
	gibSEaPxQ/pBdwBRDjOk/FkIOuSn23Ab+UZLXeuggME+SClx8erC9dBqmnIQtUZu
	mn4R55nTAKEDQkQ5LqJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv81bg2qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 20:57:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 42EKvK31005345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 20:57:20 GMT
Received: from [10.71.112.106] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 13:57:19 -0700
Message-ID: <0e9f0f2f-a404-3b76-3c52-9eca7594efa3@quicinc.com>
Date: Thu, 14 Mar 2024 13:57:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v18 20/41] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
Content-Language: en-US
To: Albert Wang <albertccwang@google.com>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
 <20240228013619.29758-21-quic_wcheng@quicinc.com>
 <CANqn-rjTgHgzssxZiuwvTKzOS31wzjS4Y9G-XacZN4a7c82MaA@mail.gmail.com>
 <d97f635f-053b-70a7-5ffe-a1ae273091d1@quicinc.com>
 <CANqn-ring2uf=A-F7VuRwnJ--n=FtFzSddCmR-=nfxCGcFAF2g@mail.gmail.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: 
 <CANqn-ring2uf=A-F7VuRwnJ--n=FtFzSddCmR-=nfxCGcFAF2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hogKYBgJv_8ag5r84EkBXjMbinIFbgfn
X-Proofpoint-ORIG-GUID: hogKYBgJv_8ag5r84EkBXjMbinIFbgfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403140161
Message-ID-Hash: FX7TQSPGZE6NT6LF3GMFRGL6CX5XJLIY
X-Message-ID-Hash: FX7TQSPGZE6NT6LF3GMFRGL6CX5XJLIY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FX7TQSPGZE6NT6LF3GMFRGL6CX5XJLIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Albert

On 3/14/2024 3:29 AM, Albert Wang wrote:
> On Thu, Mar 14, 2024 at 3:18 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>>
>> Hi Albert,
>>
>> On 3/13/2024 1:03 AM, Albert Wang wrote:
>>> Hi Wesley,
>>>
>>> The suspend function `qc_usb_audio_offload_suspend()` looks to stop
>>> the traffic on the bus, so that the bus can be suspended. That allows
>>> the application processor(AP) to enter suspend. There is a subtle
>>> difference with our feature, which is to allow AP suspend with the
>>> Host and USB controller active to continue the audio offloading. We
>>> call this feature `allow AP suspend in playback`. So, I have some
>>> points to clarify with you:
>>
>> Yes, I'm aware of that feature also.
>>
>>> 1. Will the suspend flow `usb_audio_suspend() -->
>>> platform_ops->suspend_cb() --> qc_usb_audio_offload_suspend()` be
>>> called when offloading is active?
>>
>> It can be.  This is why in our case, we are going to issue the
>> disconnect event to the audio DSP to stop the session if it is currently
>> in one.
>>
>>> 2. As my understanding, the suspend function is to allow AP suspend
>>> when the offloading is IDLE, but it won't allow AP suspend when in
>>> playback or capture. Please correct me if anything is wrong.
>>
>> As mentioned above, it will let apps go into PM suspend after forcing
>> the audio stream to be idle.  We won't block PM suspend entry.
>>
> Right. Your design is to force the audio stream idle, or say, inform
> the audio DSP
> to stop the current offloading session first, then AP can go into PM
> suspend as usual.
> Then I can say the current design did not support the `allow AP
> suspend in playback`
> feature, right?
> 

Correct, this series does not cover this mechanism.

>> Yes, I saw that patch as well.  I'll take a look once this series lands
>> upstream.
> 
> That patch is rejected and archived now. So we need to find another
> approach to do
> that, even based on your framework.
> 

We can discuss that offline and come up with an approach that is 
reviewable by maintainers and the community.

Thanks
Wesley Cheng

> Thanks,
> Albert
> 
> 
>>> 3. We would like to integrate the `allow AP suspend in playback`
>>> feature with your framework to become one upstream offload solution.
>>> Here is the patch:
>>> https://patchwork.kernel.org/project/linux-pm/patch/20240223143833.1509961-1-guanyulin@google.com/
>>> .
>>
>> Yes, I saw that patch as well.  I'll take a look once this series lands
>> upstream.
>>
>> Thanks
>> Wesley Cheng
