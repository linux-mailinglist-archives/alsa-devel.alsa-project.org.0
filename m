Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B679DBF1
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 00:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A43E0852;
	Wed, 13 Sep 2023 00:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A43E0852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694558241;
	bh=7c8MIQDIGUfNhe51LzzCN3cgRnI5dCa8fH6M1M6Md28=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AmhhgMNaF8lv9reuUMfYrjwFZ3P6kWSfgXu3T4BsW7E6O1H6NsD4hNbSaG/7mhtTb
	 JcXQlt5lJTHLvkzlQ34k+qcBYmdPrCgXof2Tk/p1Wmgb1FBVQxuTeMMP6418c1EFH0
	 vlC7AoCS96KaKJEuCMhRRnRB9Bn/nSMemfiBzMmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 379CDF80212; Wed, 13 Sep 2023 00:36:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F1E9F80212;
	Wed, 13 Sep 2023 00:36:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3111AF80425; Wed, 13 Sep 2023 00:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53290F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 00:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53290F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=NyRI8BCe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38CMU7iL030289;
	Tue, 12 Sep 2023 22:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UaTnHeO1N17XMeP3R8HyybsrVR9D1k53M3M4sUTm4Cs=;
 b=NyRI8BCeCIIu/1F0zV7YlHJjyGAQivkH0NXxeTdnSLwBe38zBn5fzOjqiGAUlpkc/vL1
 weq8UN9VWiGUyGFZNNukANOgR8o2Rqpe/Pg2FkqQToMtENMrsoxCEh6tvnmcf8wpXKZW
 lZ8sGmYK2x5IzcrauB35UW9zIm7I6O+9X8GX51kwSp/87mRQR0rNEGY06+C9+uaWB4RN
 VlSlubUe10/XgdEh/FSVKdtbzQm/PDVUOrsuNzarR3/HtI/aHYbt17/rqdjtT/ecOlP6
 AEn+ekyZcWb53ChfJQidBV3PYh38OlFQaOxkdqaTqq8qXlKDMPWpFUumqp51sZx3qMKe dQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y7q85t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 22:36:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38CMa83Y032531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 22:36:08 GMT
Received: from [10.110.43.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 15:36:08 -0700
Message-ID: <59d28227-d37f-7131-6d1c-ec55e67d65b7@quicinc.com>
Date: Tue, 12 Sep 2023 15:36:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 11/32] sound: usb: card: Introduce USB SND platform op
 callbacks
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, <quic_plai@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-12-quic_wcheng@quicinc.com>
 <875y4matbc.wl-tiwai@suse.de>
 <c32e6983-4641-1849-cb25-d29da27bff15@quicinc.com>
In-Reply-To: <c32e6983-4641-1849-cb25-d29da27bff15@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pwjM0j_5nv6oOWpimdf5CMUCILqAYhjI
X-Proofpoint-ORIG-GUID: pwjM0j_5nv6oOWpimdf5CMUCILqAYhjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_22,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120192
Message-ID-Hash: NU4CV7552R4TYCJ2WCNMZGAWCLYSFKLX
X-Message-ID-Hash: NU4CV7552R4TYCJ2WCNMZGAWCLYSFKLX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NU4CV7552R4TYCJ2WCNMZGAWCLYSFKLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 9/11/2023 10:57 AM, Wesley Cheng wrote:
> Hi Takashi,
> 
> On 9/7/2023 8:36 AM, Takashi Iwai wrote:
>> On Tue, 29 Aug 2023 23:06:36 +0200,
>> Wesley Cheng wrote:
>>>
>>> Allow for different platforms to be notified on USB SND 
>>> connect/disconnect
>>> seqeunces.  This allows for platform USB SND modules to properly 
>>> initialize
>>> and populate internal structures with references to the USB SND chip
>>> device.
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>   sound/usb/card.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>>   sound/usb/card.h |  9 +++++++++
>>>   2 files changed, 54 insertions(+)
>>>
>>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>>> index 1b2edc0fd2e9..067a1e82f4bf 100644
>>> --- a/sound/usb/card.c
>>> +++ b/sound/usb/card.c
>>> @@ -118,6 +118,34 @@ MODULE_PARM_DESC(skip_validation, "Skip unit 
>>> descriptor validation (default: no)
>>>   static DEFINE_MUTEX(register_mutex);
>>>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>>   static struct usb_driver usb_audio_driver;
>>> +static struct snd_usb_platform_ops *platform_ops;
>>> +
>>> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
>>> +{
>>> +    int ret;
>>> +
>>> +    mutex_lock(&register_mutex);
>>> +    if (platform_ops) {
>>> +        ret = -EEXIST;
>>> +        goto out;
>>> +    }
>>> +
>>> +    platform_ops = ops;
>>> +out:
>>> +    mutex_unlock(&register_mutex);
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
>>
>> For adding this kind of API, please give the proper comment.
>> Especially this API is special and need a caution, to mention that it
>> can be used only for a single instance.
>>
>> Also, it should be mentioned that all callbacks are exclusive under
>> the global register_mutex.
>>
> 
> Thanks for taking the time to review.  Sure, I'll add some comments in 
> these new APIs to document what they are used for and how they are 
> protected and limited.
> 
>>> @@ -910,7 +938,11 @@ static int usb_audio_probe(struct usb_interface 
>>> *intf,
>>>       chip->num_interfaces++;
>>>       usb_set_intfdata(intf, chip);
>>>       atomic_dec(&chip->active);
>>> +
>>> +    if (platform_ops && platform_ops->connect_cb)
>>> +        platform_ops->connect_cb(chip);
>>>       mutex_unlock(&register_mutex);
>>
>> One uncertain thing is the argument for connect_cb and disconnect_cb.
>> Those take snd_usb_audio object, but the callback gets called per
>> interface at each probe and disconnect.  How does the callee handle
>> multiple calls?
> 
> I guess it should depend on how the platform driver wants to handle it? 
>   I haven't run into a device with multiple UAC interfaces before, so 
> I'll need to mimic this configuration on a device, so I can see how it 
> exposes itself.
> 
> Will investigate this a bit more on my end and come back with my findings.
> 

So looks like if there is a device that has multiple UAC interfaces, 
then it just results in one USB sound card with multiple USB streams. 
As of now, we do expose a ksndcontrol that allows for userspace to 
specify which card and PCM device to issue the audio playback on.  Then 
based on the audio profile received by the audio DSP, it will narrow it 
down to see if that substream supports the requested profile.

This selection is done in the DPCM backend driver (q6usb), since the 
overall QMI USB stream request stems from the audio dsp, and will carry 
this information about which PCM device and card the USB offload driver 
should use.  This may differ based on the implementation of the offload 
path, hence why I mentioned that it might be platform specific.

There is one improvement I need to make in our QC offload driver to 
accommodate for this scenario, and that is to avoid having to 
re-register for the XHCI sideband if there is already a USB SND card 
allocated, which I will fix and submit in the next revision.

Thanks
Wesley Cheng
