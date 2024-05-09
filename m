Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D98C18A6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 23:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F210EBE;
	Thu,  9 May 2024 23:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F210EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715291412;
	bh=YCmpm9M7rg8bBTlTTi1uizIbI7KtF4vkiyWgevlyEds=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TcWdCIr3aPQj7ikEzZqm2qeYl50et0T8lgQPjBBWbFD7t8CQlIFm5/WZrzAnW2OKz
	 yq5kz2Y4SHX1FfXETIVY+3Zqrd5FNMW4xO598YC+maPILdfI1twGtJi3rNH6BOKuU5
	 0eyxEdIzRjkbqVak8lVIp0egvCb+84qSX+2HaKFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75BEEF80563; Thu,  9 May 2024 23:49:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4F0F805A8;
	Thu,  9 May 2024 23:49:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19A1F8049C; Thu,  9 May 2024 23:49:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81478F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 23:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81478F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Wec7jvMq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 449LeJ75002135;
	Thu, 9 May 2024 21:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vsHhs1cefp7jBsXfNMjMddfKHMvYPmG767OdbGYguio=; b=We
	c7jvMqaesiri1Q+2hFG3qFpCtMJXuUwvOlGGiIV55AquBd4b4NMIjxvRgSRDAA2H
	Qc83nV+Lnut39c/jpF8qLaz1zfrcYly+9a3fHDqAtSNBKJ3s/2bmupPzjF+noPx7
	028F/a/AWN9r/RpZAu48vljrXKG0Qv5BxWIeV1Io1mHOoHMCCkb/UWAIZYM2WuVm
	yWgv9lUAWpavCqA/vrB+bFVeRS8bf1zLQeTsurosT8m5JuKlRx3a4+WHLtsCUDS2
	ygVDiNObE4hRSVDdUds2jJr2Q3P7K3RgLAX3TG0lP2O4EbZuJSkeSfgHj2tImZoM
	cbc7eNZOhCDXbEgHKuUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16kp80bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 21:49:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 449LnLKn030148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 21:49:21 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 14:49:20 -0700
Message-ID: <072960e7-c8db-b25c-46f8-019534d325d4@quicinc.com>
Date: Thu, 9 May 2024 14:49:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 26/39] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
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
 <20240507195116.9464-27-quic_wcheng@quicinc.com>
 <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
 <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
 <76a943f7-d839-4378-aa12-7fb32e3077e6@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <76a943f7-d839-4378-aa12-7fb32e3077e6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZQ3i_RvxmNE7-LOMZcLE_vjCphChvZ9_
X-Proofpoint-ORIG-GUID: ZQ3i_RvxmNE7-LOMZcLE_vjCphChvZ9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=827 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405090155
Message-ID-Hash: 7RQRG7LS633P6G73LDOY3IG76AC5AHEK
X-Message-ID-Hash: 7RQRG7LS633P6G73LDOY3IG76AC5AHEK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RQRG7LS633P6G73LDOY3IG76AC5AHEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/9/2024 6:02 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/8/24 18:57, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 5/7/2024 2:23 PM, Pierre-Louis Bossart wrote:
>>>
>>>> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct
>>>> snd_soc_usb *usb,
>>>>        if (connected) {
>>>>            /* We only track the latest USB headset plugged in */
>>>>            data->active_usb_chip_idx = sdev->card_idx;
>>>> +
>>>> +        set_bit(sdev->card_idx, &data->available_card_slot);
>>>> +        data->status[sdev->card_idx].sdev = sdev;
>>>
>>> Not following the 'only track the latest USB headset plugged in', I
>>> don't see anything that discard the previously latest headset...
>>>
>>> If you plug headset1, then headset2, how is headset1 marked as not
>>> available for USB offload?
>>>
>>
>> It won't mark headset1 as not available for offload, because offload
>> could happen on either depending on what is selected (from the kcontrol
>> as well).
> 
> Right, so the wording 'only track the latest USB headset plugged in' is
> incorrect or obsolete, isn't it?

Sure, I can reword it.  Will specify that it
"selects the latest USB headset plugged in for offloading"

Thanks
Wesley Cheng
