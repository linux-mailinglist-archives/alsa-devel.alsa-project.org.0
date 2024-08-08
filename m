Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A394B494
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 03:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD8DF54;
	Thu,  8 Aug 2024 03:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD8DF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723080057;
	bh=lXI75IJcy2WEgeKvcGi3ZGd2imiB9BbY5ue2ZNYXss0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hlYiZKv/mFGBf23EazDswj7HUi5z7hs9nlE+tuLQRvvw1+giCY8xz2ixvP8BkC/Y/
	 s89h24FWS66f68rihl/onp1SINvVDvD2Az2rSsH2fggWJ1m8bkYVmyb+Cfwj3DpPYc
	 2YvZleQZT8vbPX/5idpA3DjeA9nH0km8EAMRixsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DE17F8049C; Thu,  8 Aug 2024 03:20:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C044F805E3;
	Thu,  8 Aug 2024 03:20:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7C86F805A1; Thu,  8 Aug 2024 03:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07DBBF8023A
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 03:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DBBF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=b4gKN3+w
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 477Hxhj5020463;
	Thu, 8 Aug 2024 01:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/npPi7ba/WeC/JMiP+Sf/QXwjSMN5tPK9lDCU6TBq/s=; b=b4gKN3+wc9T78ftm
	GCqJVU8TmTCwIINMjdeIVyGxh1gFXl4h5SfUNn7IUnoMCT0nmLvM8U8Lyg57jH+g
	behMO8r5XT40TbxMrKN5ew1/EJSv7gf0/N1p6xZHJZxzOVCYBBCt5/28J4G/ZjFT
	dEY7G2GqwjncVgoGY23gIoJr+x/HFSjFlV7Uim6yks0Hrw++fmSk/0BRqZINse3b
	AzPBsVwdr/WM9bbZHk4ou2er9FNY4TzvLgGNBOl1cJLgloluuFDYsJRCrobIcF3b
	k2bWIgPp1+sHeWBrTQrV8MWPR8g2sOQowdp9NV68pJOeYxLkBhJbjbI2f8hDdIGI
	BLZS5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scmu4bpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:19:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4781JYwn026031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:19:34 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:19:34 -0700
Message-ID: <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
Date: Wed, 7 Aug 2024 18:19:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
 <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: H4OCoCeVN5FDgeBLWpQHKW-817o9LPGU
X-Proofpoint-GUID: H4OCoCeVN5FDgeBLWpQHKW-817o9LPGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080007
Message-ID-Hash: J2HQLJFNG7PQMP44JDNUTFZHW5EOJ4EF
X-Message-ID-Hash: J2HQLJFNG7PQMP44JDNUTFZHW5EOJ4EF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2HQLJFNG7PQMP44JDNUTFZHW5EOJ4EF/>
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
>> With USB audio offloading, an audio session is started from the ASoC
>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>> readily available for use, in case the non-offload path is desired.  In
>> order to prevent the two entities from attempting to use the USB bus,
>> introduce a flag that determines when either paths are in use.
>>
>
> How can this happen? Can you provide some example with list of devices and which one should block the other? If I recall correctly devices are already exclusive unless you support substreams which ASoC does not at the moment.
>
>From past discussions, I think so far everyone is on board with the idea of having both the USB sound card and PCM devices exist in conjunction w/ the USB offload path, which is going to be done over the ASoC platform card.  So for example,

/ # cat /proc/asound/cards
 0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
                      SM8250-MTP-WCD9380-WSA8810-VA-DMIC
 1 [C320M          ]: USB-Audio - Plantronics C320-M
                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed

This device currently has the following sound cards within the system:

- card#0 - ASoC platform card: handles USB offload, speaker, etc...

- card#1 - USB SND card: card created for interacting with the connected USB device.

So now, with USB offloading in the picture, there are basically two paths that can start attempting to utilize the same USB device endpoints.  Let's keep it simple and assume the device only has one playback substream (which means only one PCM device)

/proc/asound/card1 # cat stream0
Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed : USB Audio

Playback:
  Status: Stop
  Interface 2
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (ADAPTIVE)
    Rates: 8000, 16000, 24000, 32000, 44100, 48000
    Bits: 16
    Channel map: FL FR

So the patch here will prevent transfers from happening from both the offload path and directly over the USB SND PCM device, which correlates to the following paths:

- offload: card#0 pcm#0

- USB SND: card#1 pcm#0

Thanks

Wesley Cheng

