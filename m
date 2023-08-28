Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069F78BA3A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 23:26:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E618A203;
	Mon, 28 Aug 2023 23:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E618A203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693257993;
	bh=q9gYQ1a5diXKrkcc/Nkvpbm7EZNyUikHnadO3tos7jk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJpX5tdi/pdcLfAcWQYeb76I9iYgyFwRvAbYFQHZ3lNFguzSjmPQ7/m9fHV7uiMOc
	 HIQgISZ4nyeTOBlNWeogucCEP1FC3Lw2TnKIpUg16NvTSapCE0U+CzFLCov24YZkOh
	 QI1Ycq7fOWP1u/0ruwXfsJKarUln9jo92/hRV9Bg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F1F3F80249; Mon, 28 Aug 2023 23:25:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1329EF80155;
	Mon, 28 Aug 2023 23:25:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0EF9F80158; Mon, 28 Aug 2023 23:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A1C1F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 23:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A1C1F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=f0EaeEGE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SLIvvK028724;
	Mon, 28 Aug 2023 21:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1uSHgYD0BDqUs305pVO5lcfITQLJJ8STIOPYjWWcz9Y=;
 b=f0EaeEGETehYMCP/eFMvW5SeA1D5AKte3QWKLhY4eImCb8gZqM5lhw2drlTynUpiYPe8
 kR9IYjHbdvCqlSGmcKb3GMuy+V7TizXV7NOZdasXINixnZka8x/Tsr4KGF/VZaJXJUfj
 PNdfIkZwVIy+o6EOHmZHfsemI2OTEdIwx8/igKD1Yx5djwsgCCCIcmRiO5FOrzCn0e8G
 Nb85QTi/MLw35pYqXv2kLJ478YYEqLWJJziBbVIS/YRupJE+lRRflzlJNF/ULsNVqj3G
 A2yieFvENtr+kzn/Vpz9XpeOjhBgAcINXUUBDz2INu8IltEjy1DXcBypD1vIGVvSzLZi UQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss0520ck8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 21:25:23 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37SLPMfc004856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 21:25:22 GMT
Received: from [10.110.46.69] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 14:25:19 -0700
Message-ID: <2c0e76ab-1e3a-70d6-24dc-32b2e66c2a3a@quicinc.com>
Date: Mon, 28 Aug 2023 14:25:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 31/32] sound: usb: card: Allow for rediscovery of
 connected USB SND devices
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>
CC: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <oneukum@suse.com>,
        <albertccwang@google.com>, <o-takashi@sakamocchi.jp>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-32-quic_wcheng@quicinc.com>
 <671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
 <87wmyotk74.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87wmyotk74.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XYS_ImDuz8Qzx-sahzayo4WHzdp2KAHt
X-Proofpoint-GUID: XYS_ImDuz8Qzx-sahzayo4WHzdp2KAHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_18,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308280184
Message-ID-Hash: AVU2MT344KOK3PBDHIBEZ5DTME6YEULZ
X-Message-ID-Hash: AVU2MT344KOK3PBDHIBEZ5DTME6YEULZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVU2MT344KOK3PBDHIBEZ5DTME6YEULZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 7/25/2023 2:27 AM, Takashi Iwai wrote:
> On Tue, 25 Jul 2023 11:15:11 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 7/25/23 04:34, Wesley Cheng wrote:
>>> In case of notifying SND platform drivers of connection events, some of
>>> these use cases, such as offloading, require an ASoC USB backend device to
>>> be initialized before the events can be handled.  If the USB backend device
>>> has not yet been probed, this leads to missing initial USB audio device
>>> connection events.
>>>
>>> Expose an API that traverses the usb_chip array for connected devices, and
>>> to call the respective connection callback registered to the SND platform
>>> driver.
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>   sound/usb/card.c | 19 +++++++++++++++++++
>>>   sound/usb/card.h |  2 ++
>>>   2 files changed, 21 insertions(+)
>>>
>>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>>> index 365f6d978608..27a89aaa0bf3 100644
>>> --- a/sound/usb/card.c
>>> +++ b/sound/usb/card.c
>>> @@ -170,6 +170,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>>>   }
>>>   EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>>>   
>>> +/*
>>> + * in case the platform driver was not ready at the time of USB SND
>>> + * device connect, expose an API to discover all connected USB devices
>>> + * so it can populate any dependent resources/structures.
>>> + */
>>> +void snd_usb_rediscover_devices(void)
>>> +{
>>> +	int i;
>>> +
>>> +	mutex_lock(&register_mutex);
>>> +	for (i = 0; i < SNDRV_CARDS; i++) {
>>> +		if (usb_chip[i])
>>> +			if (platform_ops && platform_ops->connect_cb)
>>> +				platform_ops->connect_cb(usb_chip[i]);
>>
>> what happens if the USB device is removed while the platform device adds
>> a port?
> 
> That should be protected by the register_mutex.  But there can be
> other races (see below :)
> 
>> This sounds super-racy to me. It's the same set of problems we're having
>> between audio and display/DRM, I would be surprised if this function
>> dealt with all corner cases of insertion/removal, bind/unbind.
> 
> Yes, we need to be more careful about binding.
> 
> For example, in the current patch set, I see no way to prevent
> unloading snd-usb-audio-qmi module, and it allows user to cut off the
> stuff during operation, which may break things while the kernel is
> running the code of the unloaded module.  You need to have a proper
> module refcount management for avoiding such a scenario.  Most of
> drivers don't need it because ALSA core part already takes care of
> it.  But in this case, it requires a manual adjustment.
> 

Sorry for the delayed response...this was routed to another folder, and 
missed it.

I see, that is a valid situation, so I think the best way to address it 
is to do something like the following:

static void __exit qc_usb_audio_offload_exit(void)
{
...
	snd_usb_unregister_platform_ops();
	for (idx = 0; idx < SNDRV_CARDS; idx++)
		qc_usb_audio_offload_disconnect(uadev[idx].chip);

We'll first unregister the platform ops, so that we get no further 
connect/disconnect CBs, and then we'll forcefully ensure that all 
devices are removed/cleaned.  Part of the USB offload disconnect 
sequence will also forcefully stop the offload path on the external DSP 
by issuing a disconnect indication QMI message.

Then we can safely clean up the rest of the resources.  We do have 
refcounting in place for several of the other structures, but I think in 
the module exit case, we need to ensure the offload path is stopped fully.

Thanks
Wesley Cheng
