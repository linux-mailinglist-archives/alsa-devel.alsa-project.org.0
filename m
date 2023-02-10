Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E2692A88
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 23:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F334839;
	Fri, 10 Feb 2023 23:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F334839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676069436;
	bh=7c2D7bXv5MD9HYihT/XnlsUtJmsyxIBfrcmhgd/GOtg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WaKgEPj0pZrjrkwmoghW66o+9x8qafD4cn1FTJqIpsQUXhSKISNqbCW1NcjHgT2Xq
	 l8CmMzyBk99hXLK+XNfRnI+W0Zn0F/5wMKhy3dZUFVZdiV9SPGf1jBbi2jyqljfLAE
	 k0C8mrmo1BeipA7rKrCGMUCrsbu3+uv8yUGn8qyc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 865F6F800B8;
	Fri, 10 Feb 2023 23:49:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 354A2F800E4; Fri, 10 Feb 2023 23:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08F93F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 23:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F93F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=iVT51v3M
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31AKPovC017965;
	Fri, 10 Feb 2023 22:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=h/mAMXh5kCQ0g0Z52GBqF6hgV9P8cj6Rm/BSDQE6EcI=;
 b=iVT51v3MpI7xwvFkLZ7xjf/UAguX6WRR1W6VobLi8lW4kI5d6s/TIi31B32T9CYH/c1+
 hzrolbNQQxBfnOJg2QzsZzuOSMsWeRNwG6GLGatW3BC4mqO638k+nTQXvo/HIU+sYYLI
 RB7Fj7lUGiw9lrCd2MHSHErQsu+gUU6EG4vApH04Ecklk/r9hSJJ+vaXMvexr0uzObSn
 G2raS7muJ3+BOsroTZKWyn5IprOSfrNX1o45ZtYkv4ff7EUpA6UbPPCaHjELFyFPMmoy
 vZ9TlJJFG447zpyJzfpsELgFyjgQhOQhp/fPULPKzELM6PvUHfB2J0S5qsS7tGtNa3Cb BQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nndu5ac2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 22:49:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 31AMna0V032756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 22:49:36 GMT
Received: from [10.110.21.35] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 10 Feb
 2023 14:49:35 -0800
Message-ID: <2c062ab0-905c-f1fe-eca2-02e23cc9fa6f@quicinc.com>
Date: Fri, 10 Feb 2023 14:49:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform
 op callbacks
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
 <Y9Ui82OaI54Qx8Ft@kroah.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Y9Ui82OaI54Qx8Ft@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oGpCI2pZrg6hVncDv50aU6L1diE3-Q0s
X-Proofpoint-GUID: oGpCI2pZrg6hVncDv50aU6L1diE3-Q0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=993 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100195
Message-ID-Hash: RMOD7DZOJWQ3K6WNB4QXZCM6KYRQ6OSO
X-Message-ID-Hash: RMOD7DZOJWQ3K6WNB4QXZCM6KYRQ6OSO
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMOD7DZOJWQ3K6WNB4QXZCM6KYRQ6OSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On 1/28/2023 5:28 AM, Greg KH wrote:
> On Wed, Jan 25, 2023 at 07:14:14PM -0800, Wesley Cheng wrote:
>> Allow for different platforms to be notified on USB SND connect/disconnect
>> seqeunces.  This allows for platform USB SND modules to properly initialize
>> and populate internal structures with references to the USB SND chip
>> device.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 28 ++++++++++++++++++++++++++++
>>   sound/usb/card.h | 20 ++++++++++++++++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 26268ffb8274..803230343c16 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>>   static DEFINE_MUTEX(register_mutex);
>>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>   static struct usb_driver usb_audio_driver;
>> +static struct snd_usb_platform_ops *platform_ops;
> 
> You can not have a single "platform_ops" pointer, this HAS to be
> per-bus.
> 

Agreed.

> And what is a "platform operations" anyway?  Shouldn't this be a driver
> type or something like that?  "offload_operations"?
> 

The reason for going with platform operations is because every platform 
may implement the offloading differently.  The offload operations term 
is more direct though in terms of explaining what the ops are going to 
be used for, so I can see the incentive of moving to that phrase.

>> +
>> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
>> +{
>> +	if (platform_ops)
>> +		return -EEXIST;
>> +
>> +	platform_ops = ops;
>> +	return 0;
> 
> No locking?  not good.
> 
> But again, this has to be per-USB-bus, it can NOT be system wide for
> obvious reasons.
> 

Sure, will change that when moving to per USB bus.

Thanks
Wesley Cheng
