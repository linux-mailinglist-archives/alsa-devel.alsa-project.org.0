Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D384FEF7
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 22:35:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497A084D;
	Fri,  9 Feb 2024 22:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497A084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707514500;
	bh=3RS6nTB/bSq16p1MiQ52S5A/vunTmwlUSRNhqUphYNY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X+zAtmFZlp699TcWDQf474XRjUyG/3pyrECRX3RgkG/UALtBuUkmGH46EuJcwyJnV
	 ROPQh36Uq02ZjqaOQ73kgGUiLc++DrzYP/cnFlvNE1vNDGJ6dn9XjBAYZVYpQst5ww
	 5ULo/y2dJ1Yj7qDRajChf9CXeLUC58LsDBGaAikk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA466F805AC; Fri,  9 Feb 2024 22:34:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD08F80578;
	Fri,  9 Feb 2024 22:34:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E8E9F801EB; Fri,  9 Feb 2024 22:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBF5BF800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 22:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF5BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=HtN11k7B
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 419L0VMx029556;
	Fri, 9 Feb 2024 21:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=LsuqDkQrOLRCvVF/GOV2mZSSM5+gzqlLGeKCqtykZkE=; b=Ht
	N11k7BIDH563l5K6m0TvWmOoCzJ9WlBPrjosmpkbEfTpkS5uzfrhCOts23PW5DYQ
	020Z898NKaMJQ4YECfYRKe7rTTvZeILPHY/kjgFjd2GLVLe+11t22hYgyamUWI+/
	sMrKP5gdFiHJ+XvegII76kblc15PDj7ZCcoJjvJ3t/0fmruFdyyjzcrcQbHv33S1
	G/LjaRS8Q5wvxi+bApwZUtvK4oSEoTV4RP9JkE06ga7AMkBFsfbpNM9mES5AHV96
	GfJ+1IprjL/dgiyyW/YiBsw5vLG9jAUPXhgCms3JWtmw9KtEIJF6CbCcUfzdof8n
	VQquLDHlBgZycZhptyNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4rk853xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 21:34:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 419LY7lv012787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 21:34:07 GMT
Received: from [10.110.93.252] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 13:34:06 -0800
Message-ID: <cb3b7857-dc6c-80db-4fa7-6772a856f328@quicinc.com>
Date: Fri, 9 Feb 2024 13:34:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v14 32/53] ALSA: usb-audio: Check for support for
 requested audio format
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
 <20240208231406.27397-33-quic_wcheng@quicinc.com>
 <87v86x2a27.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87v86x2a27.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VBvEnHykC4dfcREjqKdafvl0xJaIJlIe
X-Proofpoint-ORIG-GUID: VBvEnHykC4dfcREjqKdafvl0xJaIJlIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=899 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090156
Message-ID-Hash: M26N6FYXKGWM77WZ3YDVZVHPAXZX3Z6H
X-Message-ID-Hash: M26N6FYXKGWM77WZ3YDVZVHPAXZX3Z6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M26N6FYXKGWM77WZ3YDVZVHPAXZX3Z6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/9/2024 2:42 AM, Takashi Iwai wrote:
> On Fri, 09 Feb 2024 00:13:45 +0100,
> Wesley Cheng wrote:
>>
>> Allow for checks on a specific USB audio device to see if a requested PCM
>> format is supported.  This is needed for support when playback is
>> initiated by the ASoC USB backend path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 31 +++++++++++++++++++++++++++++++
>>   sound/usb/card.h | 11 +++++++++++
>>   2 files changed, 42 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 7dc8007ba839..1ad99a462038 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -155,6 +155,37 @@ int snd_usb_unregister_platform_ops(void)
>>   }
>>   EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>>   
>> +/*
>> + * Checks to see if requested audio profile, i.e sample rate, # of
>> + * channels, etc... is supported by the substream associated to the
>> + * USB audio device.
>> + */
>> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction)
>> +{
>> +	struct snd_usb_audio *chip;
>> +	struct snd_usb_substream *subs;
>> +	struct snd_usb_stream *as;
>> +
>> +	/*
>> +	 * Register mutex is held when populating and clearing usb_chip
>> +	 * array.
>> +	 */
>> +	guard(mutex)(&register_mutex);
>> +	chip = usb_chip[card_idx];
>> +
>> +	if (chip && enable[card_idx]) {
>> +		list_for_each_entry(as, &chip->pcm_list, list) {
>> +			subs = &as->substream[direction];
>> +			if (snd_usb_find_substream_format(subs, params))
>> +				return as;
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>> +
>>   /*
>>    * disconnect streams
>>    * called from usb_audio_disconnect()
>> diff --git a/sound/usb/card.h b/sound/usb/card.h
>> index 02e4ea898db5..ed4a664e24e5 100644
>> --- a/sound/usb/card.h
>> +++ b/sound/usb/card.h
>> @@ -217,4 +217,15 @@ struct snd_usb_platform_ops {
>>   
>>   int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
>>   int snd_usb_unregister_platform_ops(void);
>> +
>> +#if IS_ENABLED(CONFIG_SND_USB_AUDIO)
>> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction);
>> +#else
>> +static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction)
>> +{
>> +	return NULL;
>> +}
>> +#endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
> 
> The usefulness of ifdef guard here is doubtful, IMO.  This header is
> only for USB-audio driver enablement, and not seen as generic
> helpers.  So, just add the new function declarations without dummy
> definitions.
> 

Got it, will remove it.  We also have a dependency in place for the 
qc_audio_offload driver and SND USB AUDIO in the Kconfig.

Thanks
Wesley Cheng
