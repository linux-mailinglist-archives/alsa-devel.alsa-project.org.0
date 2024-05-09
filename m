Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A448C192C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 00:06:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F8E914E5;
	Fri, 10 May 2024 00:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F8E914E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715292360;
	bh=rH6e0J1vmAW151AhHYeukL7y7x5TAeAfSG3fd7YpQUk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vXylgLFJ1Htwz8cFAYLbWWy7USuFKxr5AgtabZt/Fftv1j8DAaky8GBQOf1/nF88P
	 ISqHidvpspxYBaPVjsChiL56bVLDJKjntgZRImXqt+HrkMXdbQDKXcoPXadabYUjkb
	 LZPiMhXXd5CUezq0m5twGXO3Oj/ON/EEUwIoKRBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51E61F804F2; Fri, 10 May 2024 00:05:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 642EDF805A0;
	Fri, 10 May 2024 00:05:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96727F8049C; Fri, 10 May 2024 00:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3A0CF8003A
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 00:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A0CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=KsKSSrBY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 449M03LS030402;
	Thu, 9 May 2024 22:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UFzwS+gtnLFVF4fOXrWIsL7ONuzcSKpYbSLr3j5oWzE=; b=Ks
	KSSrBY+2RLajy+6XwhslTQcZ1sry1d8UiMW+bWWMHaVAcDqDNQNJPs6Mnwa0Nble
	r7jGMVfD2sAk/J3TYK6mHZOQQQUK+jEUJcen5ShAsb4nf/jM46+6ecCSPlUotncx
	r7ZSewTzQC+NesST15QidUEOHjccCr6dHOIXxi2wLVpAspgysUThNCSoxA4gcfwy
	6zqFIJ8wOfrTRQkLUT4Gxz6ai/4ECvdd1bzdbUvIprTWcUh4TcMSiliyY0b3K5T4
	f+P+FC7MjQ0tib5wtjjHQ1NyYGszoAx97tpPfipoOgALTtJpQoHYX+zygkAu/idA
	2ymxPNc1sNWWFOscMe1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w1g09w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 22:05:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 449M53pF005085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 22:05:03 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 15:05:02 -0700
Message-ID: <d3e6a9cb-2091-0792-603d-bb39abedfc7e@quicinc.com>
Date: Thu, 9 May 2024 15:05:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 34/39] ALSA: usb-audio: Add USB offloading capable
 kcontrol
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-35-quic_wcheng@quicinc.com>
 <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
 <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
 <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
 <f4d59f05-9279-4c89-b5e1-57a0b3e8cddf@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f4d59f05-9279-4c89-b5e1-57a0b3e8cddf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DsNj39Vuef5vKPXYBBA8A3efKOKlB28n
X-Proofpoint-GUID: DsNj39Vuef5vKPXYBBA8A3efKOKlB28n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090157
Message-ID-Hash: PCLJ6M3WMYQF75RQ5TBGALZBPS5LU3TL
X-Message-ID-Hash: PCLJ6M3WMYQF75RQ5TBGALZBPS5LU3TL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCLJ6M3WMYQF75RQ5TBGALZBPS5LU3TL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/9/2024 6:11 AM, Pierre-Louis Bossart wrote:
> 
>>>>> It is expected for the USB offloading driver to add the kcontrol to the
>>>>> sound card associated with the USB audio device.  An example output
>>>>> would
>>>>> look like:
>>>>>
>>>>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>>>>> 0 (range -1->32)
>>>>
>>>> You already gave the following examples in patch 29:
>>>>
>>>> "
>>>> USB offloading idle:
>>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>>> -->-1, -1 (range -1->32)
>>>>
>>>> USB offloading active(USB card#1 pcm#0):
>>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>>> -->1, 0 (range -1->32)
>>>> "
>>>>
>>>> Can you clarify how many controls there would be in the end?
>>>
>>> For USB offload situations, there will be a set of controls for
>>> playback status and playback select.  The offload jack will also be
>>> there to tell us if there is an offload path available for the
>>> platform ASoC sound card.
>>>
>>>> Also isn't tinymix -D N going to give you the controls for card N?
>>>>
>>>
>>> Yes, since the offload portion is handled as a DPCM DAI link to the
>>> platform ASoC card, it will be included as a kcontrol for that.
>>>
>>> Thanks
>>> Wesley Cheng
>>>
>>>
>>
>> Sorry for responding again.  I read your email again, and wanted to also
>> add that aside from the above, which are all within the ASoC layer, as
>> we discussed previously, we should have a kcontrol in the USB SND card
>> to determine if there is an ASoC platform card capable of offloading.
>> This is also available from the SND card created by the USB audio device.
> 
> That makes sense: if the application wanted to use a given endpoint, it
> could check if there is a 'better' path exposed by another card. It'd be
> a lot easier than reading controls from random cards.
> 
> Was this part of this patchset or more of an idea for a future addition?

Its part of this patchset.  Please refer to patch#34.  The 
mixer_usb_offload is initialized by the offload entity residing in USB 
SND (qc_usb_audio_offload), and will add it to the sound card associated 
with the USB device.

Thanks
Wesley Cheng
