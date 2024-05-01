Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67468B83BF
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 02:33:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F1AE72;
	Wed,  1 May 2024 02:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F1AE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714523619;
	bh=3GxgYzbam8HgNyK+VdtYgp46UreAUNvtQ0s3h2WWRpU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LR42NqoycNiq68xC+ilYBjtebIog5mucJUA9XX4DhZLpHulDKyKdVmfnOgdhScNRY
	 GNrOKgyheeqD/C4mBifnAA37AlMGW2Cx6Mk3gx8+ESCUKPOOAoHPmwJ7B4vtHBwL+I
	 8HAtg1gZdLGou/eV8LKhaAO8XkG3zBlIlFTQwSSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C3AF8057F; Wed,  1 May 2024 02:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CFBF80587;
	Wed,  1 May 2024 02:33:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83551F80266; Wed,  1 May 2024 02:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EF5DF8023A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 02:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF5DF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=D0fGt0cW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43UNxo8v005742;
	Wed, 1 May 2024 00:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=LRnPNBK8fB5m3Wd6M+Ba4l+Ai4vlC8s1ZRRcL3qyiV8=; b=D0
	fGt0cWBkZIPWOJq1/d0Q52iDWMscdVnrML7zq7Mbq2eSO79vTDbgEhppVdmaZYB9
	W07e1ZyXYOAC1U9O8EZLDsYzZ/bpdB97r9bWIItYRofzjyHE/VY7+6V/JdLo6Fcx
	qY6g+5mkCVUTLisci98ZNdXtuwDMVR/rULDTu38jVUqwYaFijmmKAWZOdbSUYj+A
	pYi+sHTXkQW6eM6eGzbhl6MQ8jRsvz3fHaUHJahsaQ7ouVkBfc/FbF1I3Vi+BM9X
	h/s/nmOZbCRG4RGgMyTr+0iRCMdVjCr8fjnAXGop8Z5xU3QP8wIKGtaT/Ukm7qVz
	v/FZnk2+9pAbCBnH4CrA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtw1hj6qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 00:32:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4410WQEC025873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 May 2024 00:32:26 GMT
Received: from [10.110.61.50] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 17:32:25 -0700
Message-ID: <a1115d39-b60e-a5da-5c7e-79266d6ced17@quicinc.com>
Date: Tue, 30 Apr 2024 17:32:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v20 33/41] ASoC: usb: Create SOC USB SND jack kcontrol
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-34-quic_wcheng@quicinc.com>
 <c8bd16e8-b204-471b-a702-36e14c8695c5@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <c8bd16e8-b204-471b-a702-36e14c8695c5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ciB1uOnPTSzQscrGnEx8GYc3pFB6UvC6
X-Proofpoint-ORIG-GUID: ciB1uOnPTSzQscrGnEx8GYc3pFB6UvC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=877 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405010002
Message-ID-Hash: OVXXZIXVZDEIB3Z2PNVJX43LWHI3YT37
X-Message-ID-Hash: OVXXZIXVZDEIB3Z2PNVJX43LWHI3YT37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVXXZIXVZDEIB3Z2PNVJX43LWHI3YT37/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 4/26/2024 6:26 AM, Amadeusz Sławiński wrote:
> On 4/25/2024 11:51 PM, Wesley Cheng wrote:
>> Expose API for creation of a jack control for notifying of available
>> devices that are plugged in/discovered, and that support offloading.  
>> This
>> allows for control names to be standardized across implementations of USB
>> audio offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> 
> (...)
> 
>>   /* SOC USB sound kcontrols */
>> +/**
>> + * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
>> + * @component: USB DPCM backend DAI component
>> + * @jack: jack structure to create
>> + *
>> + * Creates a jack device for notifying userspace of the availability
>> + * of an offload capable device.
>> + *
>> + * Returns 0 on success, negative on error.
>> + *
>> + */
>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +                    struct snd_soc_jack *jack)
>> +{
>> +    int ret;
>> +
>> +    ret = snd_soc_card_jack_new(component->card, "USB Offload 
>> Playback Jack",
>> +                    SND_JACK_HEADPHONE, jack);
>> +    if (ret < 0) {
>> +        dev_err(component->card->dev, "Unable to add USB offload 
>> jack\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = snd_soc_component_set_jack(component, jack, NULL);
>> +    if (ret) {
>> +        dev_warn(component->card->dev, "Failed to set jack: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
>> +
>>   static int snd_soc_usb_get_offload_card_status(struct snd_kcontrol 
>> *kcontrol,
>>                      struct snd_ctl_elem_value *ucontrol)
>>   {
>>
> 
> I'm not sure if this should be handled in generic USB API, this feels 
> like something that should be handled in specific device driver side, 
> like all users currently do.
> 

In some of the previous comments, it was mentioned that maybe it was 
better to have more consistent/defined naming across devices that do 
have support for audio offload.  Initially, I did have these within our 
vendor specific ASoC platform driver also.

> Anyway I think there should also be some function that tears jack down, 
> by calling:
> snd_soc_component_set_jack(component, NULL, NULL);
> so it can get cleaned up properly?

I can add that.  I didn't realize there were some situations where maybe 
components would want to disable the jack.  I will leave the cleanup 
part to ASoC when the platform card is removed.

Thanks
Wesley Cheng
