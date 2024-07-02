Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEA924C40
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 01:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912CC1926;
	Wed,  3 Jul 2024 01:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912CC1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719963784;
	bh=bWNtOrmIVD9qVmH8p+XwgfQLmkN1BjIh7YqW4kO8X1M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PEDFkBQACV8bgGhTbGJ7SfSnREx0oIXEsF7nulp2ysM0NqaIOzbA9EmKDKdWrnH+I
	 EfvO1MlnfNE2qwNeQ8aM+ObYQJ/tFGZ7MUCyuN75/QTEHY18f62QkUv7QOAEssNfb/
	 RJv7msI4MvDh4u7y6SPjoFLxR3WpVAuG+MxpbSnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 767F1F8059F; Wed,  3 Jul 2024 01:42:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61772F805AE;
	Wed,  3 Jul 2024 01:42:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9A5AF8014C; Wed,  3 Jul 2024 01:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74874F800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 01:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74874F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=UjyzXxDd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 462HJL7W023818;
	Tue, 2 Jul 2024 23:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNH3O5IfY6PoWnz4btQ0PNI/uE/ZJQXWAD5uRijVgoo=; b=UjyzXxDdt3+S5ipz
	Xqb3V2a6qismCtxLuKBWoGkFU/4i4P80dIpDf8hww/0NdkOcf7oQfGohv0VMi8R+
	y8DxI9fx6D9jhL9djOr4FdUF9VmxopCNyV025AvR+pdjiOiTXLLO+loqMAbT1kIQ
	sP7XTQYtIdSlr27WW/NYQK8KWkCInJaynzhFcl95Lqiaeijdrb7cmsYBYlvpixmx
	nzWHDiaZmNnfb7AcCthsYEruft40PmKI2wGPDttTquo/XrgCwa9HX2XXiMT+Jx9U
	h6Dq71Pv1qv5zq0fRBM98o672loSsxC2gatRt5lvBNg6VgY8RHqESJoTwc8qQcV4
	7ieS9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40297rt2vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 23:34:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 462NY96V026581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 23:34:09 GMT
Received: from [10.110.95.24] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 16:34:08 -0700
Message-ID: <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
Date: Tue, 2 Jul 2024 16:34:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sz5hhODFOp_NmTAUPVtNmQvfhu6jIR9c
X-Proofpoint-GUID: sz5hhODFOp_NmTAUPVtNmQvfhu6jIR9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_16,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020173
Message-ID-Hash: QR6CTXOEDDSNY3PLRY4ATANEN5SJPNNY
X-Message-ID-Hash: QR6CTXOEDDSNY3PLRY4ATANEN5SJPNNY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QR6CTXOEDDSNY3PLRY4ATANEN5SJPNNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre/Amadeusz,

On 7/2/2024 1:30 AM, Pierre-Louis Bossart wrote:
>>> There are really multiple layers to deal with
>>>
>>> a) is the controller able to support the offload path? IIRC this is
>>> embedded in an obscure XHCI property, it would make sense to expose it
>>> as a control, or component string, of the USB card.
>> If a component string/tag is desired, I already have some way of doing that.  I can add it to the USB card.
>>
>>> b) is there a companion card capable of dealing with the offload path?
>>> Since the presence of this card may depend on driver probe, there should
>>> be a control on the USB card. userspace could detect changes to this
>>> control and detect if that path is or is no longer enabled.
>> So currently, the "USB Offload Playback Capable Card" kcontrol (on the USB card) will determine if there is an offload path.  However, this differs than what Amadeusz is suggesting, in that he wants a single kcontrol created for EACH USB card identified (per USB audio device), and a simple enable/disable control to determine if the offload path is enabled for that card/pcm stream.
>>
>> It would be a simpler approach for the userspace, and if the card that handles the offload card isn't present, then these enable/disable control will be set to "disabled," and even if users attempt to set the control, it won't go through.
> Not following. Are you suggesting userspace would modify the
> enable/disable status?

Yes, this is the suggestion.  One writeable kcontrol on the USB SND audio device that will control if that USB audio device is going to be offloaded.  If the kcontrol reads back "enabled" (or 1) then userspace knows that the offload path is active.  Else, if it reads "disabled" (or 0) after the attempt to set the kcontrol, then the offload path was unsuccessfully enabled, ie maybe due to no available offload streams.

> I would just have a read-only control that reports what the hardware can
> do and which other card can deal with offload. It's up to userspace to
> select the offloaded PCM device or not.
>
That is what I have implemented in the previous patch series.  One USB SND kcontrol within each USB audio device, which points to the ASoC platform card that supports offloading:

"USB Offload Playback Capable Card" --> returns the card index to the ASoC platform card

>From there the offloading control is all within the ASoC platform card.  This is opposite to what Amaduesz suggested in that, the offload control of which USB device to offload should be within USB SND (not ASoC)

>
>>> c) which PCM device is actually offloaded? This could be plural for some
>>> implementations. The mapping between PCM devices exposed by the USB
>>> card, and those exposed by the companion card, should be known to
>>> userspace. I am not sure how this would be done though, a variable
>>> number of controls is a sure way to confuse userspace.
>> Expanding on Amadeusz's suggestion, my idea is to have an enable/disable kcontrol per USB stream.  For example, one USB card could have multiple PCM devices (USB streams).  So we would have something like:
>>
>> PCM Offload Playback Enable Stream#0  enable/disable
>>
>> PCM Offload Playback Enable Stream#1  enable/disable
>>
>> ....
> are those read-only or not?

No, writable and readable.

>
>> So we'd know which USB card and PCM device is selected for USB SND.  However, I see what you're getting at in case there are multiple supported streams, because userspace needs to know which ASoC card/pcm combination corresponds to which USB device/combination.
> I don't understand how this would help map the two parts? There's got to
> be an additional mapping...
It won't help with the mapping.  That is something which we'd need to add, suggestion below.
>> What do you think about having a USB card kcontrol to display the mapped ASoC card and PCM indexes?
>>
>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
>>
>> To summarize, if we did this, I'd plan to remove all the kcontrols in ASoC card, and have the following in the USB card for an USB audio device that supports one USB stream:
>>
>> PCM Offload Playback Enable Stream#0  enable/disable
>>
>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
> ... which is suggested here.
>
> Assuming these are read-only controls, we would need to know which PCM
> device on the USB card can be optimized with the use of which PCM device
> on the ASoC card. That means a set of three values. You would also want
> a number of streams to make the guesswork on controls less painful.

OK, so now to just figuring out something that both you and Amadeusz can agree on before I put time implementing it.  So I've implemented the "enable/disable" path that Amadeusz suggested, which is highlighted in my previous response, for evaluation purposes.  The overall question is which layer should control the devices that will be offloaded.  In my submissions up until now, the control was given to the ASoC platform card to determine which USB device to offload.  Amadeusz mentioned that it might be beneficial to move the control to the USB SND devices, because what if the offloading is NOT backed by ASoC. (highlighted in [1])  However, IMO the current implementation assumes there is ASoC involved, which should mean that there is some platform "card" that is backing the offload path.  Please let me know if my understanding is incorrect, @Amadeusz. 

[1] - Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB - Amadeusz Sławiński (kernel.org) <https://lore.kernel.org/linux-usb/510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com/>

Thanks

Wesley Cheng

