Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6817D41FF
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 23:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FACC83A;
	Mon, 23 Oct 2023 23:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FACC83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698098162;
	bh=YSesIYt7lkV6wzE4pWZdEWyehQtW71+l5ytKop8Vg7w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JwsSA5EenZK2r7oCyGb26wg8px6lxBJ57NWaL5y3pCIU/UQqapeMqXKCZkljFiJ5o
	 bOWd+A5fecNzdVvfTC42luAdMj7u7Dl5htD906LBWZ4en6Oo67NVONlYAPp/ODDlil
	 XAy3YjOW+NtTAx99ksU3wMoi0hjhqBG5zk3FkiMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D7AF80537; Mon, 23 Oct 2023 23:55:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1EBF8032D;
	Mon, 23 Oct 2023 23:55:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 673B5F804F3; Mon, 23 Oct 2023 23:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D689F80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 23:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D689F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=WRksQS2g
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39NJdt1X002491;
	Mon, 23 Oct 2023 21:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hVa/mq2VQpyWbZU8AbMbE350it4l72isr/X7+dQsCVw=;
 b=WRksQS2ghff9LS+dck6Eb9LoSUZajKXQPzLoN0iBfuMrRhwp9+whWjZLG9kV2ZI0bq84
 BkICQs1jVcdFakCj/zkMJUHVeHEwhCS3XBgSSmE4DCyRD+XJxCWadFRbSO0upGibuy9M
 dxxApoyvDi9By5YP6R5SoPb7fKm4z7Mpl1b4vNX4Z/+gluYx3X/5f+F5n/DZ3qH6KbZM
 f9O2u8AK+hAK7QJHcFqCOdMXgh09FxnTL/LpsSaN9syXq9cB4wbPDtSvpeezjmOU2zsM
 j33mz0FYjGZUPgfX1ogdrb5icHmvjIKa5KCc9NqHXO8d/m9luRO9RmrzGjedjf/EYRHe EQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tv40ungua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 21:54:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39NLsupN031852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 21:54:56 GMT
Received: from [10.110.22.156] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 23 Oct
 2023 14:54:55 -0700
Message-ID: <6409c486-7393-4352-489c-ecd488597c4c@quicinc.com>
Date: Mon, 23 Oct 2023 14:54:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 34/34] ASoC: usb: Rediscover USB SND devices on USB
 port add
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-35-quic_wcheng@quicinc.com>
 <b503058d-e23f-4a63-99b8-f0a62b2a2557@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <b503058d-e23f-4a63-99b8-f0a62b2a2557@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3O20EUy7dwzYWHIPEZCZdjjATpyogG3y
X-Proofpoint-ORIG-GUID: 3O20EUy7dwzYWHIPEZCZdjjATpyogG3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310230192
Message-ID-Hash: 6IO6L7FVB42SLAB3YDTRZVKPF2A3ZQNJ
X-Message-ID-Hash: 6IO6L7FVB42SLAB3YDTRZVKPF2A3ZQNJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IO6L7FVB42SLAB3YDTRZVKPF2A3ZQNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/17/2023 4:11 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:01, Wesley Cheng wrote:
>> In case the USB backend device has not been initialized/probed, USB SND
>> device connections can still occur.  When the USB backend is eventually
>> made available, previous USB SND device connections are not communicated to
>> the USB backend.  Call snd_usb_rediscover_devices() to generate the connect
>> callbacks for all USB SND devices connected.  This will allow for the USB
>> backend to be updated with the current set of devices available.
>>
>> The chip array entries are all populated and removed while under the
>> register_mutex, so going over potential race conditions:
>>
>> Thread#1:
>>    q6usb_component_probe()
>>      --> snd_soc_usb_add_port()
>>        --> snd_usb_rediscover_devices()
>>          --> mutex_lock(register_mutex)
>>
>> Thread#2
>>    --> usb_audio_disconnect()
>>      --> mutex_lock(register_mutex)
>>
>> So either thread#1 or thread#2 will complete first.  If
>>
>> Thread#1 completes before thread#2:
>>    SOC USB will notify DPCM backend of the device connection.  Shortly
>>    after, once thread#2 runs, we will get a disconnect event for the
>>    connected device.
>>
>> Thread#2 completes before thread#1:
>>    Then during snd_usb_rediscover_devices() it won't notify of any
>>    connection for that particular chip index.
> Looks like you are assuming the regular USB audio stuff is probed first?
> 
> What if it's not the case? Have you tested with a manual 'blacklist' and
> "modprobe" sequence long after all the DSP stuff is initialized?
> 
> It really reminds me of audio+display issues, and the same opens apply IMHO.

Not necessarily...if the USB audio driver is not probed, then that is 
the same scenario as when there is no USB audio capable device plugged 
in, while the offload path is waiting for the connect event. I think 
this is the standard scenario.

In the situation where the platform sound card hasn't probed yet and USB 
audio devices are being identified, then that is basically the scenario 
that would be more of an issue, since its USB SND that notifies of the 
connection state (at the time of connect/disconnect).

I've tried with building these drivers as modules and probing them at 
different times/sequences, and I haven't seen an issue so far.

Thanks
Wesley Cheng
