Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7194B491
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 03:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AAC2E66;
	Thu,  8 Aug 2024 03:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AAC2E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723080025;
	bh=E4NjcBtFoKMULPq+m54nVSONliuUrMPReoZj/ltGKeg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l0HL+4AX8qKfGmSN16MQc2EU7zuywSvWZxVd01YGU9KK1JWRmSiZkjc4fMBpGYxs5
	 kQhIoaD+71W73hgzQa2mDbkv+Sc/4sLcJ6xHji4ImEAX2KerUZIApliy0b0mEBv/WI
	 tuoMGGcO7aWRDXz7UAq2TyFs0njYdjTJFwOKGMeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77BECF805B0; Thu,  8 Aug 2024 03:19:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F3EF805AE;
	Thu,  8 Aug 2024 03:19:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9839FF800B0; Thu,  8 Aug 2024 03:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF8F2F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 03:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8F2F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=U5Im2512
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 477ID6VU012239;
	Thu, 8 Aug 2024 01:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiWDQGebIC+nZsacslE5RFhdstOKp1m7YUU31Ktsm98=; b=U5Im2512oxh0t/mX
	m8ehDNj6pUvuH8BFFmSwYVf1M0ANJ2YAHuq98irB1tU4X944g5TH3AQsMWnAz/lo
	jm09QErp62sCd27weApFMAxFd3k5ZNU8J9ldXcL1NKjGTECu0aV3mTUX7hQ4VBmq
	LjhdozDpq/+Gmet5huIkKHPuimDLrsLqBQW9hKtjTflIp6EzJiW6dcJ6bejFXUAm
	oq1YIeJIAZn+5VVhDPSMdOBJ8zXecL037To7o/mDRx4Iqa13yZnInVXN/WiJrOkP
	FidwPtb9eV5Qnym3FxO948gAQmUUeo+ukSh6fdR9+6NwC5qZU5UL1Ibqou4CcBH/
	0hbdug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6v9wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:03:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47813Sgp025454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:03:28 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:03:27 -0700
Message-ID: <e5fa1a3f-3fe2-40c5-9366-4d21221f9557@quicinc.com>
Date: Wed, 7 Aug 2024 18:03:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 26/34] ALSA: usb-audio: qcom: Don't allow USB offload
 path if PCM device is in use
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-27-quic_wcheng@quicinc.com>
 <c2ab91ed-a2e5-437e-bbdb-84988a052778@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <c2ab91ed-a2e5-437e-bbdb-84988a052778@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4CidAKI3zPEyUNyBFmQX_dZ-DRpw6yXZ
X-Proofpoint-GUID: 4CidAKI3zPEyUNyBFmQX_dZ-DRpw6yXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408080005
Message-ID-Hash: EN6ICSFONHVHROFHYHBZXEAVIVSUPP3Z
X-Message-ID-Hash: EN6ICSFONHVHROFHYHBZXEAVIVSUPP3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EN6ICSFONHVHROFHYHBZXEAVIVSUPP3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/1/2024 1:57 AM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 03:17, Wesley Cheng wrote:
>> Add proper checks and updates to the USB substream once receiving a USB QMI
>> stream enable request.  If the substream is already in use from the non
>> offload path, reject the stream enable request.  In addition, update the
>> USB substream opened parameter when enabling the offload path, so the
>> non offload path can be blocked.
> It's a bit weird that the mutual exclusion between the standard path and
> the offloaded path is handled at the vendor level. I would think this
> needs to be handled in the soc_usb framework, no?
>
Hmm...I guess that make sense.  In the end, the mutual exclusion check would need to either be handled by the vendor USB offload driver, or the USB backend DAI link.  I could consider adding another SOC USB API to query for the USB PCM status.  If it is open/active, then just return with an error, or maybe just rename the snd_soc_usb_find_format() API to something more generic which checks for parameters and current status before allowing offloading to start (ie snd_soc_check_offload_available())

Thanks

Wesley Cheng

>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index 8b0913b7256b..3b46d05f1421 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -1460,12 +1460,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
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
>> @@ -1487,6 +1492,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		if (!ret)
>>  			ret = prepare_qmi_response(subs, req_msg, &resp,
>>  					info_idx);
>> +		if (ret < 0) {
>> +			mutex_lock(&chip->mutex);
>> +			subs->opened = 0;
>> +			mutex_unlock(&chip->mutex);
>> +		}
>>  	} else {
>>  		info = &uadev[pcm_card_num].info[info_idx];
>>  		if (info->data_ep_pipe) {
>> @@ -1510,6 +1520,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		}
>>  
>>  		disable_audio_stream(subs);
>> +		mutex_lock(&chip->mutex);
>> +		subs->opened = 0;
>> +		mutex_unlock(&chip->mutex);
>>  	}
>>  
>>  response:
