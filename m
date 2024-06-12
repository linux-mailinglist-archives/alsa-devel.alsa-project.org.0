Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC2905BF9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 21:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33AF6E85;
	Wed, 12 Jun 2024 21:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33AF6E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718220579;
	bh=m8a6feG9FUitFbvUvIrRN4n8RJcdSpN0pdOMLBnv/bE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S8YmRZU9AoQkLwoAqEVr/QkqisvEoFChlIn1V3izgvF1P5GV+SOTUFDSb2cvi73Wq
	 /zC71vQG6DpYnQhr0FN1mLAZWNazdYOodUarNAeESOGxCjIxk2pWtQ46nb0fw+OMQI
	 ZW8XuDoYPOtn95UrUmAV2lyN5tjHNcjjuh6C1xYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E91F8F805AC; Wed, 12 Jun 2024 21:29:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A39F805A8;
	Wed, 12 Jun 2024 21:29:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15C52F8057A; Wed, 12 Jun 2024 21:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68473F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 21:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68473F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ZarlGx8d
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45CGOwMZ032154;
	Wed, 12 Jun 2024 19:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCkqbtgD+H6fBegUBPh8HWnP7zadlp7CFVslclJwQlw=; b=ZarlGx8debYz7B5p
	EYodYSlVAT7aFS8RYs6MdKD7WbOXf0fqyFxvh3x5MDVqWNY1rVWIPaVJVA8lsPAF
	oDpXxBtdMdtvb+FWJK07LEOKF0mMn+MnvjWH/qOyBk6quWAH8A46c4N+cRJTORlI
	eRtp1ug8vXTHkLKY6Z/9JveeD8o/gz/W3N/bv/u9t+vTfwRL9FTLPEscQApnVDem
	8kH2gNhljIiVHqJGmnAgq49zpbnzi4lILTX/lGxXioPjadLlaB+ndjvNeZZDWEXX
	sfjUmH2QIX+AsUeC0YeYCB3c0pUPEyuMwFdTlOTKuX76oqiRM4WSi9hmT3ZFcWJw
	x0M2TQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s09rc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:28:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJSfcm009922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:28:41 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:28:40 -0700
Message-ID: <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
Date: Wed, 12 Jun 2024 12:28:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
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
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u75kKKgEq47EV2fB7Am8Eqx2k17JInXf
X-Proofpoint-ORIG-GUID: u75kKKgEq47EV2fB7Am8Eqx2k17JInXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 mlxlogscore=998
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120137
Message-ID-Hash: UXGOOBGJYWWIA63GUZKQ73YWZ7YF3OF3
X-Message-ID-Hash: UXGOOBGJYWWIA63GUZKQ73YWZ7YF3OF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXGOOBGJYWWIA63GUZKQ73YWZ7YF3OF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
> 
> (...)
> 
>> +In the case where the USB offload driver is unbounded, while USB SND is
> 
> unbounded -> unbound
> 
> (...)
> 
>> +SOC USB and USB Sound Kcontrols
>> +===============================
>> +Details
>> +-------
>> +SOC USB and USB sound expose a set of SND kcontrols for applications 
>> to select
>> +and fetch the current offloading status for the ASoC platform sound 
>> card. Kcontrols
>> +are split between two layers:
>> +
>> +    - USB sound - Notifies the sound card number for the ASoC 
>> platform sound
>> +      card that it is registered to for supporting audio offload.
>> +
>> +    - SOC USB - Maintains the current status of the offload path, and 
>> device
>> +      (USB sound card and PCM device) information.  This would be the 
>> main
>> +      card that applications can read to determine offloading 
>> capabilities.
>> +
>> +Implementation
>> +--------------
>> +
>> +**Example:**
>> +
>> +  **Sound Cards**:
>> +
>> +    ::
>> +
>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>> +                     Plantronics Plantronics C320-M at 
>> usb-xhci-hcd.1.auto-1, full speed
>> +
>> +
>> +  **Platform Sound Card** - card#0:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>> +
>> +
>> +  **USB Sound Card** - card#1:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Capable Card         0 (range -1->32)
>> +
>> +
>> +The platform sound card(card#0) kcontrols are created as part of 
>> adding the SOC
>> +USB device using **snd_soc_usb_add_port()**.  The following kcontrols 
>> are defined
>> +as:
>> +
>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound 
>> card device index
>> +    that defines which USB SND resources are currently offloaded.  If 
>> -1 is seen, it
>> +    signifies that offload is not active.
>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM device 
>> index
>> +    that defines which USB SND resources are currently offloaded.  If 
>> -1 is seen, it
>> +    signifies that offload is not active.
>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB sound 
>> card index which
>> +    selects the USB device to initiate offloading on.  If no value is 
>> written to the
>> +    kcontrol, then the last USB device discovered card index will be 
>> chosen.
> 
> I see only one kcontrol, what if hardware is capable of offloading on 
> more cards, is it possible to do offloading on more than one device?
> 
>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>> index which selects
>> +    the USB device to initiate offloading on.  If no value is written 
>> to the
>> +    kcontrol, then the last USB device discovered PCM zero index will 
>> be chosen.
>> +
>> +The USB sound card(card#1) kcontrols are created as USB audio devices 
>> are plugged
>> +into the physical USB port and enumerated.  The kcontrols are defined 
>> as:
>> +
>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the sound 
>> card
>> +    number/index that supports USB offloading.  Further/follow up 
>> queries about
>> +    the current offload state can be handled by reading the offload 
>> status
>> +    kcontrol exposed by the platform card.
>> +
> 
> 
> Why do we need to some magic between cards? I feel like whole kcontrol 
> thing is overengineered a bit - I'm not sure I understand the need to do 
> linking between cards. It would feel a lot simpler if USB card exposed 
> one "USB Offload" kcontrol on USB card if USB controller supports 
> offloading and allowed to set it to true/false to allow user to choose 
> if they want to do offloading on device.
> 
> (...)

Based on feedback from Pierre, what I understood is that for some 
applications, there won't be an order on which sound card is 
queried/opened first.

So the end use case example given was if an application opened the USB 
sound card first, it can see if there is an offload path available.  If 
there is then it can enable the offload path on the corresponding card 
if desired.

>> +Mixer Examples
>> +--------------
>> +
>> +    ::
>> +
>> +      tinymix -D 0 set 'USB Offload Playback Route Card Select' 2
>> +      tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0
>> +
>> +
>> +    ::
>> +
>> +      tinymix -D 0 get 'USB Offload Playback Route Card Select'
>> +      --> 2 (range -1->32)
>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Select'
>> +      --> 0 (range -1->255)
>> +
>> +    ::
>> +
>> +      tinymix -D 0 get 'USB Offload Playback Route Card Status'
>> +      --> 2 (range -1->32)   [OFFLD active]
>> +      --> -1 (range -1->32) [OFFLD idle]
>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Status'
>> +      --> 0 (range -1->255)   [OFFLD active]
>> +      --> -1 (range -1->255) [OFFLD idle]
>> +
>> +    ::
>> +
>> +      tinymix -D 1 get 'USB Offload Playback Capable Card'
>> +      --> 0 (range -1->32)
>>
> 
> Yes, looking at examples again, I'm still not sure I understand. There 
> are two cards and you do linking between them, this feels broken by 
> design. From my point of view USB Offload should be property of USB card 
> and not involve any other card in a system.
> 

Main benefit to having two cards (keeping one for USB SND and another 
for the ASoC platform sound card) is that current applications won't 
break.  The behavior is the same, in that if something opens the USB 
sound card, it will go through the same non-offloaded path.  During 
initial reviews, I think this was a big point where folks wanted the USB 
PCM path to still be an option.

If applications want to add the offload capabilities to its environment, 
they can enable it as an additional feature.

Thanks
Wesley Cheng
