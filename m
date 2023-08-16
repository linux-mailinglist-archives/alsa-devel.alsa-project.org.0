Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2D77D7C7
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 03:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15661741;
	Wed, 16 Aug 2023 03:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15661741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692149994;
	bh=9F+exFJJ2AUS0RZWkm5vCdfGnr4jy6YmZu5Pjxz7Zas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Az9l9+qd2dcgORjCA6L3Ubokp2DialL3zMfkRMfR/0bj+xpJdD7T0Rdp+O86dcL7S
	 P2UM2eQukvblcOTg+vYJw6ih8EMaXC+O5JXGiG6YZd3U3fSGm2o+8myjy11Lsvlplc
	 Uvb4NjTzSI1Tdqp3dNr+cbVkNggqFrlUkSaxAaPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69582F8016A; Wed, 16 Aug 2023 03:39:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6692F8016A;
	Wed, 16 Aug 2023 03:39:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8609F8016D; Wed, 16 Aug 2023 03:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6FF1F80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 03:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FF1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=cUrakPLb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37G1WQHV006698;
	Wed, 16 Aug 2023 01:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=koRzxrmeNQzJ9pi6tjKMz8jrP9wCwbUXOe6N2acoMR8=;
 b=cUrakPLbQ1xfArW5yKWNrWezJ52VtZO1F/+tWlQnq4iP0dACVaRZC2LOtty80ILyMN53
 nq/eS2GE95FAYYEbd7eC0ZZhWpIb1fNi76cJJLXoEEcnyTSRk7/EfOtRj3lr4G1fdlRR
 1C3fiC9rmIJs9bsMq/lyVic6NTYIWkZR2pnuZYXFogqETacbbminN/5e6ynRq8rgo8uR
 Vmbs3+2u0ch+MCslaxAvceIBot8vuQnnCRdCOuvTMMGJz/sF2ccB7Bf02b7u2nKMFkNX
 hHryA0pQpvfS3wCT43X+9vc9+iHsBSdX+G/Q6Y8lonjETtd6yZxS+oUqHhwInc/QR8Vo jQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sfuhujk7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 01:38:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37G1ck9X021595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 01:38:46 GMT
Received: from [10.110.95.218] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 15 Aug
 2023 18:38:44 -0700
Message-ID: <d42b4db3-d36d-d8fd-90ca-e00c2151195c@quicinc.com>
Date: Tue, 15 Aug 2023 18:38:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 31/32] sound: usb: card: Allow for rediscovery of
 connected USB SND devices
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <oneukum@suse.com>,
        <albertccwang@google.com>, <o-takashi@sakamocchi.jp>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-32-quic_wcheng@quicinc.com>
 <671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Pa7zWAzvySZs5rUBazuPdUgsyvuZC4bf
X-Proofpoint-ORIG-GUID: Pa7zWAzvySZs5rUBazuPdUgsyvuZC4bf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_22,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160013
Message-ID-Hash: OBK2RMG2AWUMXDUOZFV334WLIWYY6L57
X-Message-ID-Hash: OBK2RMG2AWUMXDUOZFV334WLIWYY6L57
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBK2RMG2AWUMXDUOZFV334WLIWYY6L57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 7/25/2023 2:15 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/25/23 04:34, Wesley Cheng wrote:
>> In case of notifying SND platform drivers of connection events, some of
>> these use cases, such as offloading, require an ASoC USB backend device to
>> be initialized before the events can be handled.  If the USB backend device
>> has not yet been probed, this leads to missing initial USB audio device
>> connection events.
>>
>> Expose an API that traverses the usb_chip array for connected devices, and
>> to call the respective connection callback registered to the SND platform
>> driver.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 19 +++++++++++++++++++
>>   sound/usb/card.h |  2 ++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 365f6d978608..27a89aaa0bf3 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -170,6 +170,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>>   }
>>   EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>>   
>> +/*
>> + * in case the platform driver was not ready at the time of USB SND
>> + * device connect, expose an API to discover all connected USB devices
>> + * so it can populate any dependent resources/structures.
>> + */
>> +void snd_usb_rediscover_devices(void)
>> +{
>> +	int i;
>> +
>> +	mutex_lock(&register_mutex);
>> +	for (i = 0; i < SNDRV_CARDS; i++) {
>> +		if (usb_chip[i])
>> +			if (platform_ops && platform_ops->connect_cb)
>> +				platform_ops->connect_cb(usb_chip[i]);
> 
> what happens if the USB device is removed while the platform device adds
> a port?
> 
> This sounds super-racy to me. It's the same set of problems we're having
> between audio and display/DRM, I would be surprised if this function
> dealt with all corner cases of insertion/removal, bind/unbind.
> 

The chip array entries are all populated and removed while under the 
register_mutex, so going over your race condition, we should see:

Thread#1:
q6usb_component_probe()
--> snd_soc_usb_add_port()
   --> snd_usb_rediscover_devices()
     --> mutex_lock(register_mutex)

Thread#2
--> usb_audio_disconnect()
   --> mutex_lock(register_mutex)

So either thread#1 or thread#2 will complete first.  If

Thread#1 completes before thread#2:
   SOC USB will notify DPCM backend of the device connection.  Shortly 
after, once thread#2 runs, we will get a disconnect event for the 
connected device.

Thread#2 completes before thread#1:
   Then during snd_usb_rediscover_devices() we won't notify of any 
connection for that particular chip index.

Thanks
Wesley Cheng

