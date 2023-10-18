Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 461AD7CE910
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 22:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CD5836;
	Wed, 18 Oct 2023 22:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CD5836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697661276;
	bh=ykcNfjthlvWRPElbp9HSGImDePcD/G84f8taKq7sm3Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuxY3AAmxTJYoNHdGsjDwNJZd0E/elXRhf7pu61PCFAUwwpGxuZde10RXnW9QxQGE
	 vNAXgFl0jZG1gORuGKAIbBy87B90GUQYc1imN9vj0/pRB5QnZfZZJ1gbvBWJ9Mxkis
	 91MQuZH/pNdwG0TNt/L3RVgPD/xKnt062E3rJKxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDEFAF80536; Wed, 18 Oct 2023 22:33:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37A79F8024E;
	Wed, 18 Oct 2023 22:33:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 742E9F8025F; Wed, 18 Oct 2023 22:33:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 39B9CF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 22:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B9CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=HYRGvFZR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39IKXGjj008745;
	Wed, 18 Oct 2023 20:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D3VEipluic1dnj4xaArrQ04lPUUz9iyghjTrQJeu5aE=;
 b=HYRGvFZRbv9ZGlNVYgJ0bbpCQaouRJDG5GUWgOJMv8bbGAA6WVtbowAcpNgL1UIXgMf/
 y50Q2HXtqKrGtoRkoxHIGNsZg/KRUx82bSURxVn8GlnUD0hKAcef5jIg57jToidW83gF
 /23UwY9CiDh7BiNTTijZl9a34YGWQ7NBq3xASPduJKSoMFsA5GOq1lSfQ8TxdTEIYPQn
 cXWTcYUbJj4i8e1TttKiXXDIs5icR3UvmFXC1k1Os16QVfcmoYhq+/UkLdWcODIbv4VC
 rZDmGV+KbdLAT5Oy0EFnJMxKBjKtJNrYMdvFh2KPyoUOMlIul2f9XJ5ladpkYnZf9jwh fg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttb7ahrvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:33:26 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39IKXPdM003412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:33:25 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 13:33:24 -0700
Message-ID: <09bf52fe-0234-3fc6-1911-9d0f8217d8ad@quicinc.com>
Date: Wed, 18 Oct 2023 13:33:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 21/34] ASoC: usb: Add PCM format check API for USB
 backend
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
 <20231017200109.11407-22-quic_wcheng@quicinc.com>
 <dbb1f64b-8112-4a2f-9138-616e04bdc53c@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <dbb1f64b-8112-4a2f-9138-616e04bdc53c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GnQCwHKt7WkSwgc5_0rgRzLNxfyB9Hpg
X-Proofpoint-GUID: GnQCwHKt7WkSwgc5_0rgRzLNxfyB9Hpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_18,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 mlxlogscore=727 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180169
Message-ID-Hash: MHHWRRTYXPUHZTTQO3BAF4WR2IT3EIW6
X-Message-ID-Hash: MHHWRRTYXPUHZTTQO3BAF4WR2IT3EIW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHHWRRTYXPUHZTTQO3BAF4WR2IT3EIW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/17/2023 3:33 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:00, Wesley Cheng wrote:
>> Introduce a check for if a particular PCM format is supported by the USB
> 
> Introduce a helper to check if a ...
> 

Ack.

>> audio device connected.  If the USB audio device does not have an audio
>> profile which can support the requested format, then notify the USB
>> backend.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   include/sound/soc-usb.h |  3 +++
>>   sound/soc/soc-usb.c     | 13 +++++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
>> index 58c686f4f7ba..c6ddc055c4cd 100644
>> --- a/include/sound/soc-usb.h
>> +++ b/include/sound/soc-usb.h
>> @@ -37,6 +37,9 @@ struct snd_soc_usb {
>>   	void *priv_data;
>>   };
>>   
>> +int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
>> +			int direction);
>> +
>>   int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
>>   int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
>>   void *snd_soc_usb_find_priv_data(struct device *usbdev);
>> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
>> index 73b1bcc3b506..7407678a993e 100644
>> --- a/sound/soc/soc-usb.c
>> +++ b/sound/soc/soc-usb.c
>> @@ -63,6 +63,19 @@ void *snd_soc_usb_find_priv_data(struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
>>   
>> +int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
>> +			int direction)
>> +{
>> +	struct snd_usb_stream *as;
>> +
>> +	as = snd_usb_find_suppported_substream(card_idx, params, direction);
>> +	if (!as)
>> +		return -EOPNOTSUPP;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
> 
> Is this the right way to check for formats?
> 
> formats are defined within the scope of an endpoint, and those endpoints
> are themselves defined within the scope of an interface?
> 
> I don't see a notion of endpoint here. Does this assume all endpoints
> are valid, or maybe the existence of a single endpoint in a device?
> 
> Confused.

At least in terms of USB and USB UAC, formats are defined within an 
audio streaming interface descriptor, which will include multiple (up to 
2) USB endpoints.  Those endpoints will be described w/ both an audio 
streaming endpoint descriptor as well as a standard USB endpoint 
descriptor.  The audio interface/format descriptors are the ones that 
carry the information about what formats are supported by the USB 
device.  So this API finds a possible USB AS streaming descriptor on the 
device that matches the requested one.  Endpoints will be opened 
subsequently when the audio stream is started, and an interface is 
enabled by sending a SET_INTERFACE control packet on the USB bus.

Thanks
Wesley Cheng
