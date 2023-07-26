Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8776425A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 01:07:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE7D7F8;
	Thu, 27 Jul 2023 01:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE7D7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690412870;
	bh=tUdXh4MN8UDJsJh4wmwb8QPK3sFtNWtKN2bLQQerCsk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=umAJyX0yugKCC0SlIijMWTMF1BaMzrJIs5HNUmfpfD+gQPltnEwf/ovwIpgkZ+gEY
	 N0ZizlkYLS8dfVnUuwXcokSG8dvTg90ruhl9JJMsnfNjKujsbnN353d8ZFaKUu66Qd
	 xea6ivkNJo32tTR25KZm3lNQEl6fCB0DmYQ0cAjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B94E3F802E8; Thu, 27 Jul 2023 01:06:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63A56F80163;
	Thu, 27 Jul 2023 01:06:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93BDF8019B; Thu, 27 Jul 2023 01:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B39FBF80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 01:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39FBF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=k+D9BFUC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QN1hxG022941;
	Wed, 26 Jul 2023 23:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hst80EK+5jLT39EI5q3/zwn9B9Ep+cXarB3YmbOzyXc=;
 b=k+D9BFUC0fJBW78f71nfk0im2alc0BGH1qMBS4AYsZnYbJloNpoqDNB9xDoR+QBuGCmy
 y3h7ItHHHOurVFQnRhiGXo3yCkpI/vjB6yWNMrO3k+IJ+OzxHs7GzA2jyeg5va8SwJsg
 EazS5Yaj0LfyuVpRU82PCm0q/XB/ExbaVVx+WQgPuH99DR50k7HtrQup43hoKUTxEDJb
 uWyfFCg5bz3S6nfwTkmj2jHD4je+AWd/bm8cfH88ScAh0bv3AnlTkw09ndIwTx251Si3
 Amnh0dqAC7dwY+9crEGIa0DQE4swWFSl3IqJIpaVFLOHLCM4YUExeiiG1rNJSHRqfZ5Z ug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3afyr785-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 23:06:44 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36QN6hoF031629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 23:06:43 GMT
Received: from [10.110.23.161] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 16:06:42 -0700
Message-ID: <e0167cad-6af7-fc2a-f783-609a114d94fd@quicinc.com>
Date: Wed, 26 Jul 2023 16:06:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 27/32] sound: soc: qdsp6: Add SND kcontrol to select
 offload device
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
 <20230725023416.11205-28-quic_wcheng@quicinc.com>
 <82568c9d-05b8-54dc-47e9-05c74a9260be@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <82568c9d-05b8-54dc-47e9-05c74a9260be@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zHrkparVg1APzQLo3hBS0lfjhvKXkqdF
X-Proofpoint-ORIG-GUID: zHrkparVg1APzQLo3hBS0lfjhvKXkqdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260207
Message-ID-Hash: XMBCMDEZ4XJWWOX2VIMIW45T5N5EERRR
X-Message-ID-Hash: XMBCMDEZ4XJWWOX2VIMIW45T5N5EERRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMBCMDEZ4XJWWOX2VIMIW45T5N5EERRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 7/25/2023 2:16 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/25/23 04:34, Wesley Cheng wrote:
>> Expose a kcontrol on the platform sound card, which will allow for
>> userspace to determine which USB card number and PCM device to offload.
>> This allows for userspace to potentially tag an alternate path for a
>> specific USB SND card and PCM device.  Previously, control was absent, and
>> the offload path would be enabled on the last USB SND device which was
>> connected.  This logic will continue to be applicable if no mixer input is
>> received for specific device selection.
>>
>> An example to configure the offload device using tinymix:
>> tinymix -D 0 set 'Q6USB offload SND device select' 1 0
>>
>> The above will set the Q6AFE device token to choose offload on card#1 and
>> pcm#0.  Device selection is made possible by setting the Q6AFE device
>> token.  The audio DSP utilizes this parameter, and will pass this field
>> back to the USB offload driver within the QMI stream requests.
> 
> I must be missing something... If you have a card 0 which exposes a
> control to change what the card1 does, then it means you have a card0
> with a PCM device what can potentially be used concurrently with the
> card1 exposing an offload device.
> 
> Is there any sort of mutual exclusion to make sure the same USB endpoint
> is not used twice?
> > One would hope that when a device is opened the matching non-offloaded
> one (or ones in the case of implicit feedback) is disabled or marked as
> used?
> 
> I would guess in your Android setup you have control on such behavior at
> the HAL level, but in the more generic Linux use I don't see what
> would orchestrate the use of two devices, and at the kernel level what
> would prevent it.
> 
Still going through the comments and trying to address the suggestions 
in the code, so will reply pack to those as I make the needed changes.

As for the above question, the following change was made with the 
intention to prevent the above scenario.

https://lore.kernel.org/linux-usb/20230725023416.11205-23-quic_wcheng@quicinc.com/

Thanks
Wesley Cheng
