Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9279AAA6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 19:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C1A84C;
	Mon, 11 Sep 2023 19:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C1A84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694455142;
	bh=bAETadl6H10/LYYLhxP8SJoZ+haMsxknzcvbKPw5mDE=;
	h=Date:From:Subject:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bKCFUH0cM9UHUHBiQWEL7HHVpmTM8GfqfTJDZM9dcg2PCbmK0eO1eM100dtUDntKa
	 dd/3NsE6900F/Yf+GLkjcxOT9/x2R6tHBHQFIbEBWY/mdpOLCpbNhzYYS6JCXVmZA2
	 kPqhJP2/wBawMrO0djYUql1yF43S7q0PfcubuPyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F40F80552; Mon, 11 Sep 2023 19:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B276CF80246;
	Mon, 11 Sep 2023 19:58:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D37AFF80425; Mon, 11 Sep 2023 19:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34A1BF800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 19:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34A1BF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Bz1/kXFc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38BDgOto006536;
	Mon, 11 Sep 2023 17:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0TQHaYZr4yaKy9H6ZvKL+gKEicqG4S0R+N5+Acl4ZZg=;
 b=Bz1/kXFcBokSYDq0Dbx2o1WkSy+f+1dU6uBJcyO2E7whOFzCi4gTGECnwfk3RxoOgV6s
 F9jXt/T3hxD1zgb2enq9KQ4b7myTC8tvou1JIoS1T1z7FBAWiYVsxyGe/KzDNpK3V8BA
 bjifzRHncdk7MiRy4OCzcJC7BKugv9nCMEbrNhmQGiLcKeojLYbGdvF5jFZV34dQgDLD
 Mx0j1nu3+/MjM6NItNQUvT7M/nBCGNi2Al77FFdYdbLjSM8SsQcT7F5yvEB2qyAYrTTg
 kw5DlsFkwAm3BV9F/qyclXv4sZ3xTPQRoDxeIQexlNpIYea7MiSDHrjjqvY4pF8TFiS+ eQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1xjmscnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 17:57:45 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38BHvhFc012981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 17:57:43 GMT
Received: from [10.110.109.129] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 10:57:42 -0700
Message-ID: <c32e6983-4641-1849-cb25-d29da27bff15@quicinc.com>
Date: Mon, 11 Sep 2023 10:57:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v5 11/32] sound: usb: card: Introduce USB SND platform op
 callbacks
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
Content-Language: en-US
In-Reply-To: <875y4matbc.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 834pxEf4zEHVF-QZwWGA1QQnukw4rdPa
X-Proofpoint-GUID: 834pxEf4zEHVF-QZwWGA1QQnukw4rdPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110164
Message-ID-Hash: 62BQIAVAZRN5A7J3XKS6XLHAZAVZUAHK
X-Message-ID-Hash: 62BQIAVAZRN5A7J3XKS6XLHAZAVZUAHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62BQIAVAZRN5A7J3XKS6XLHAZAVZUAHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 9/7/2023 8:36 AM, Takashi Iwai wrote:
> On Tue, 29 Aug 2023 23:06:36 +0200,
> Wesley Cheng wrote:
>>
>> Allow for different platforms to be notified on USB SND connect/disconnect
>> seqeunces.  This allows for platform USB SND modules to properly initialize
>> and populate internal structures with references to the USB SND chip
>> device.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>   sound/usb/card.h |  9 +++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 1b2edc0fd2e9..067a1e82f4bf 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -118,6 +118,34 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>>   static DEFINE_MUTEX(register_mutex);
>>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>   static struct usb_driver usb_audio_driver;
>> +static struct snd_usb_platform_ops *platform_ops;
>> +
>> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&register_mutex);
>> +	if (platform_ops) {
>> +		ret = -EEXIST;
>> +		goto out;
>> +	}
>> +
>> +	platform_ops = ops;
>> +out:
>> +	mutex_unlock(&register_mutex);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> 
> For adding this kind of API, please give the proper comment.
> Especially this API is special and need a caution, to mention that it
> can be used only for a single instance.
> 
> Also, it should be mentioned that all callbacks are exclusive under
> the global register_mutex.
> 

Thanks for taking the time to review.  Sure, I'll add some comments in 
these new APIs to document what they are used for and how they are 
protected and limited.

>> @@ -910,7 +938,11 @@ static int usb_audio_probe(struct usb_interface *intf,
>>   	chip->num_interfaces++;
>>   	usb_set_intfdata(intf, chip);
>>   	atomic_dec(&chip->active);
>> +
>> +	if (platform_ops && platform_ops->connect_cb)
>> +		platform_ops->connect_cb(chip);
>>   	mutex_unlock(&register_mutex);
> 
> One uncertain thing is the argument for connect_cb and disconnect_cb.
> Those take snd_usb_audio object, but the callback gets called per
> interface at each probe and disconnect.  How does the callee handle
> multiple calls?

I guess it should depend on how the platform driver wants to handle it? 
  I haven't run into a device with multiple UAC interfaces before, so 
I'll need to mimic this configuration on a device, so I can see how it 
exposes itself.

Will investigate this a bit more on my end and come back with my findings.

> 
> Last but not least, the patch subject should be with "ALSA:" prefix,
> and in this case, at best "ALSA: usb-audio: xxx".
> 
> 

Got it, thanks!

Thanks
Wesley Cheng
