Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 063EA96AD06
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 01:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687F4845;
	Wed,  4 Sep 2024 01:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687F4845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725407059;
	bh=6Rwo1ilfPPsZ7gdy1TKXHGJVAO72u7IzQqZ2DNioTu8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yx6WPVykBUYQztVQzDRgaQTb76GEdTbwoYQi6e9CWzzdMxEjrio7xrDNLt3IrABtU
	 WouHgeRWRj0SUA5fX3C5b0r0ow6dVIuNbeDUxfHm8bhZgRfLAMp6NR2AiTp/JkiyUB
	 dlsErrSzDg2Z8JTMeH/6q0c3dLOoa+kzsF706V40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 780FCF805AC; Wed,  4 Sep 2024 01:43:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F23F805B2;
	Wed,  4 Sep 2024 01:43:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA5D6F80199; Wed,  4 Sep 2024 01:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FA3FF80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 01:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA3FF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=fMuINMwE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 483M0IhB015973;
	Tue, 3 Sep 2024 23:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+d/0pC5aWWiDnnPCtqbZcR44t6XC0ztg5EHyBnbdrHo=; b=fMuINMwEsOPba3c5
	y0oZzN7xVAa0MqUD5w6yhGv3EkLodAsV3PJ6Frnq6abx0Ouy50ghZrR+a/6zHPpP
	9CRaCbLC1Dd+mkTnCZz/CG7NZ2qtHOqYWAoBsOKXvw759kyfTpy1Lsy1FnPvglAt
	cNZikGnpiO+KuyP1FziH8gyasNdX2scOlTVmr5dafHVuBC90e6P37LqgfzCoyOvQ
	od2C8lpVcZMxkK1yl9PQLkU0vitySTzC+hb/lgY3wjb8WTMqm183kC3Wi2P/+Zjo
	ySAJsZVreOz+i+SW+QVqzyrh1o+LWKfe3X5lh6kfFbxSBzzLZ+V6QAXjW2hCzKwX
	GBjU0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt4rh2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:43:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 483NhcWP013624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:43:38 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:43:37 -0700
Message-ID: <2a64c924-9957-4c53-bf93-a651d19c733f@quicinc.com>
Date: Tue, 3 Sep 2024 16:43:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 29/33] ALSA: usb-audio: qcom: Don't allow USB offload
 path if PCM device is in use
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-30-quic_wcheng@quicinc.com>
 <6e4e6e5f-dc55-4311-a658-5e2fcbeefab1@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <6e4e6e5f-dc55-4311-a658-5e2fcbeefab1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AqwsQLlJac7qYtTmxKUnBNZWHT_wNZ_l
X-Proofpoint-ORIG-GUID: AqwsQLlJac7qYtTmxKUnBNZWHT_wNZ_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030189
Message-ID-Hash: LJJDWIMYEMY7LDKJSNTWADG2QW4Y642F
X-Message-ID-Hash: LJJDWIMYEMY7LDKJSNTWADG2QW4Y642F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJJDWIMYEMY7LDKJSNTWADG2QW4Y642F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:55 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:41, Wesley Cheng wrote:
>> Add proper checks and updates to the USB substream once receiving a USB QMI
>> stream enable request.  If the substream is already in use from the non
>> offload path, reject the stream enable request.  In addition, update the
>> USB substream opened parameter when enabling the offload path, so the
>> non offload path can be blocked.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index e9f2fd6bbb41..0bd533f539e4 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -1482,12 +1482,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		goto response;
>>  	}
>>  
>> +	mutex_lock(&chip->mutex);
>>  	if (req_msg->enable) {
>> -		if (info_idx < 0 || chip->system_suspend) {
>> +		if (info_idx < 0 || chip->system_suspend || subs->opened) {
>>  			ret = -EBUSY;
>> +			mutex_unlock(&chip->mutex);
>> +
>>  			goto response;
>>  		}
>> +		subs->opened = 1;
>>  	}
>> +	mutex_unlock(&chip->mutex);
>>  
>>  	if (req_msg->service_interval_valid) {
>>  		ret = get_data_interval_from_si(subs,
>> @@ -1509,6 +1514,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		if (!ret)
>>  			ret = prepare_qmi_response(subs, req_msg, &resp,
>>  						   info_idx);
>> +		if (ret < 0) {
>> +			mutex_lock(&chip->mutex);
>> +			subs->opened = 0;
>> +			mutex_unlock(&chip->mutex);
>> +		}
>>  	} else {
>>  		info = &uadev[pcm_card_num].info[info_idx];
>>  		if (info->data_ep_pipe) {
>> @@ -1532,6 +1542,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		}
>>  
>>  		disable_audio_stream(subs);
>> +		mutex_lock(&chip->mutex);
>> +		subs->opened = 0;
>> +		mutex_unlock(&chip->mutex);
>>  	}
>>  
>
> This sounds ok but I wonder why all this needs to be done in
> Qualcomm-specific layers instead of soc-usb?
>
This is to prevent conflicts within the non-offload/legacy USB SND path and the USB SND offload vendor driver.  Don't think we need to involve anything with ASoC in these checks.

Thanks

Wesley Cheng

