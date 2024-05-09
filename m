Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4308C193D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 00:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAAD14EA;
	Fri, 10 May 2024 00:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAAD14EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715292589;
	bh=dSr0oxLlibKNvuTG5gujhJneI5aqNdgz3TUp6moOfds=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eIeQCYmpl2bQ3Vd9goqbvj8jc8En3uz+3RFg5Dzi6lBId7hmMesFs7IBIAtulL+2E
	 08/dLMzwy1qKerUpxe+Alp0XiwVqk0lE/YkppIbrXNrFke8dUP1PTVTiVevMifNAB6
	 Ln0EHDJpDZtZejpq2ly5Yf3wznxgnn6yQJmyvGaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA706F805AC; Fri, 10 May 2024 00:09:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1CE2F805A8;
	Fri, 10 May 2024 00:09:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD0E4F8049C; Fri, 10 May 2024 00:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBFC2F800E2
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 00:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBFC2F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eSOPKI0x
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 449M04T1014634;
	Thu, 9 May 2024 22:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=duuW4RPEH3OftDT3NUAKs6T19v0gBVzrmpREhIv0D1Y=; b=eS
	OPKI0xJbEG2v45oQ7va5DfqzXPveE9N9ZokpdZuY1122uprUGZW4xg9S5ceLPlow
	SiuoZMgogOnQ0ONj2+2SfLT99jtvC47/rOJqJ9UzMI8Cim98A+jXoj6nHOGUXE5F
	nZu5AGHDpNDDzZDNP6oSMYBPUpDcbJMoN6513791QcxDQFkV3vEcySAp8BRkQPk8
	WuWVNie1kc5DnH+g8RUOKeAzky1q0IAor8a4qzuxn+Y3FIRlp6lmJMj83/1E3gz8
	1LdyyRtKzTvteBSNvqvBlYGJCxC0uY/kDmCJDIuoUhjNh9l3E5bCGeO29zZ1+Qrd
	9MUSR2popFDzLbK/KUUQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w180gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 22:09:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 449M9235023015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 22:09:02 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 15:09:01 -0700
Message-ID: <96fe827b-e65f-570c-30de-1e51793f61a2@quicinc.com>
Date: Thu, 9 May 2024 15:09:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 38/39] ASoC: qcom: Populate SoC components string
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
 <20240507195116.9464-39-quic_wcheng@quicinc.com>
 <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
 <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
 <92abca40-5eda-49d0-bc9d-eeb1a76e3461@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <92abca40-5eda-49d0-bc9d-eeb1a76e3461@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FIieVROshBWYeBTCKPjUthilHzKh18GX
X-Proofpoint-ORIG-GUID: FIieVROshBWYeBTCKPjUthilHzKh18GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=712
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405090157
Message-ID-Hash: YUR6T7ZS2PJUPTPUB3LFGLUSWUELFA6F
X-Message-ID-Hash: YUR6T7ZS2PJUPTPUB3LFGLUSWUELFA6F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUR6T7ZS2PJUPTPUB3LFGLUSWUELFA6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/9/2024 6:17 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/8/24 15:06, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 5/7/2024 2:40 PM, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 5/7/24 14:51, Wesley Cheng wrote:
>>>> For userspace to know about certain capabilities of the current platform
>>>> card, add tags to the components string that it can use to enable
>>>> support
>>>> for that audio path.  In case of USB offloading, the "usboffldplybk:
>>>> 1" tag
>>>
>>> usboffloadplayback?
>>>
>>> same question as before, do we need spaces?
>>>
>>
>> I think spaces are currently used as a delimiter, so I'll remove the
>> spaces.
>>
>>> And if we have controls, why do we need component strings? The component
>>> string is not dynamic to the best of my knowledge, this could be
>>> problematic if the card is no longer capable of supporting this stream,
>>> while a control can be updated at will.
>>>
>>
>> Maybe I misunderstood your comment here:
>>
>> https://lore.kernel.org/linux-usb/925d7c03-c288-49a4-8bcd-395b32810d75@linux.intel.com/
>>
>> At the time, I didn't include the kcontrols on the USB SND portion of
>> it, which was added after this series.  My interpretation was that there
>> were userspace entities that could query for general information about
>> what the card supports based on the components string, or sound card
>> name.  I treated this as an independent identifier, since the change to
>> add the offload capable jack was present.
> 
> My comment at the time stands: it's very hard to figure out that a
> random card supports USB and is connected to a given endpoint.
> 
> It'd be much easier as you wrote in the comments on patch 34 to have a
> control in the "regular" USB card to point to the 'better' offloaded
> path exposed by another card. Applications wouldn't need to know what
> this other card is, they would then use the card:device information
> directly.

OK, then it might be fine to remove the components tag if patch#34 is 
there.  That kcontrol is exposed as part of the sound card created for 
the USB device, so if applications queried, it would signify that there 
is an offload path available.

For this kcontrol, it will return the ASoC platform card index, would 
that be sufficient?

Thanks
Wesley Cheng
