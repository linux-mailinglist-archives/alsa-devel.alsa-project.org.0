Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E027594B49F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 03:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAEDB76;
	Thu,  8 Aug 2024 03:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAEDB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723080276;
	bh=Wq2V+URM8X6t0tiJlQDxKR2P6vbpnEkooM3I2HkeLKQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q05c7Xjf5KiIZvWMtqxh/36BXaA/AkiSjHR5lhOgr/WDOQqsZDikOimUqT9cVgf1n
	 caDJJleynLFPQuC9653TRIryEZmzKjR0pIsW1tJLZbDbZ6eoh+l6yl5FJuxtQa55Zz
	 PZ31LbwVVTUTyhts3BLpm4YRDo2DrXz+u8tXjw9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7F5CF8049C; Thu,  8 Aug 2024 03:24:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73EC7F805B0;
	Thu,  8 Aug 2024 03:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A145EF802DB; Thu,  8 Aug 2024 03:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D18DF80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 03:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D18DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=WMyNtwaF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 477NdsFT011985;
	Thu, 8 Aug 2024 01:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wq2V+URM8X6t0tiJlQDxKR2P6vbpnEkooM3I2HkeLKQ=; b=WMyNtwaFmkf1Qp1o
	VMNMKSxvx5Pzkx4zzziBDcrYNlA8vgB2dJ1VYTu47rACjwCrWflPxdSTsyQbmw4u
	hB17KItl7QqtdKAz8HjAx2i8xSB09md713lEXXxLPiVS6TZOlNmlO0uNxoFQILm9
	u5y+rzvG//mm9xHZ2PsCVNb6GvJ2PtQu5DVCUW8hf+yLrvCIOuJLY6KLVrV01etY
	yzDZQi7RoYip1a4XuN1sd00KYh1vF1gE5JHAub2Mq5j6ANJrHYTjtLH6gLS7y9vZ
	uL4My0ycD9CcWm0xdFQSnCfL2zLgwYVLeHkjBBg72R3jJDGeadIqNbJi5amkhi+p
	zSGCSA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sa8f4crg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:23:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4781NkGD008725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:23:46 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:23:45 -0700
Message-ID: <d2a7ea11-bff3-406e-945c-2edd427da234@quicinc.com>
Date: Wed, 7 Aug 2024 18:23:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
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
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
 <1a93dbae-6fba-4f07-a732-51a4cd98ff2a@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1a93dbae-6fba-4f07-a732-51a4cd98ff2a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: V0cUcdzHelabXu5uAdaJg1g3v8T3tWBE
X-Proofpoint-ORIG-GUID: V0cUcdzHelabXu5uAdaJg1g3v8T3tWBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=970
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080008
Message-ID-Hash: HNAZXQKJS6H57LGMHTUQ3HTRRFISWR63
X-Message-ID-Hash: HNAZXQKJS6H57LGMHTUQ3HTRRFISWR63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNAZXQKJS6H57LGMHTUQ3HTRRFISWR63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>> With the introduction of the soc-usb driver, add documentation highlighting
>> details on how to utilize the new driver and how it interacts with
>> different components in USB SND and ASoC.  It provides examples on how to
>> implement the drivers that will need to be introduced in order to enable
>> USB audio offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>
> (...)
>
>> +
>> +One potential use case would be to support USB audio offloading, which is
>> +an implementation that allows for an external DSP on the SoC to handle the
>> +transfer of audio data over the USB bus.  This would let the main
>> +processor to stay in lower power modes for longer durations.  The following
>
> *duration
>
> (...)
>
>> +
>> +In order to account for conditions where driver or device existence is
>> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
>> +connect events for any identified USB audio interfaces.  Consider the
>> +the following situtation:
>
> *situation
>
>> +USB Offload Related Kcontrols
>> +=============================
>> +Details
>> +-------
>> +A set of kcontrols can be utilized by applications to help select the proper sound
>> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
>> +callback that designs can use to ensure that the proper indices are returned to the
>> +application.
>
> At the moment I only see getter below, how does application set it?
>
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
>> +                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>> +      1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
>> +                        Plantronics Plantronics Blackwire 3225 Seri at usb-xhci-hcd.1.auto-1.1, full sp
>> +      2 [C320M          ]: USB-Audio - Plantronics C320-M
>> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
>> +
>> +  **USB Sound Card** - card#1:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
>> +
>> +  **USB Sound Card** - card#2:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Route PCM#0        0, 1 (range -1->255)
>> +
>> +The above example shows a scenario where the system has one ASoC platform card
>> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
>> +the available kcontrols for each USB audio device, the following kcontrol lists
>> +the mapped offload path for the specific device:
>> +
>> +    "USB Offload Playback Route#*"
>> +
>> +The kcontrol is indexed, because a USB audio device could potentially have
>> +several PCM devices.  The above kcontrols are defined as:
>> +
>> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
>> +    card and PCM device index.  The output "0, 1" (card index, PCM device index)
>> +    signifies that there is an available offload path for the USB SND device
>> +    through card#0-PCM device#1.  If "-1, -1" is seen, then no offload path is
>> +    available for the USB SND device.
>> +
>
> That's better, although I'm still not convinced end users care where offload happens.
>
> Few questions though, so I'm sure I understand how it works:
> Does "0, 1" in this case means that if you try to open device 1 on card 0, you won't be able to do it, because it is offloading USB?
>
No, it means that if you open device 1 on card 0, that will be the USB offload path to the USB audio device.
> In case it is "-1, -1" is there a chance that it can change?
>
It can change to non-negative when the offload path is enabled for that device.  Currently, since we removed the device selection logic entirely (for now), if say you have 2 USB audio devices connected.  As mentioned previously, we will select the latest USB headset connected, and the other will have "-1, -1" as the output when reading its controls.  Now, if the last USB headset is unplugged, then there is still an available USB device that can be offloaded, so it will switch to allowing that device to be offloaded, and you should see that be a non-negative kcontrol.

Thanks

Wesley Cheng

