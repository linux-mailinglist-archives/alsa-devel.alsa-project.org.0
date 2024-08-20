Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E7958D7F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 19:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2AF6C1;
	Tue, 20 Aug 2024 19:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2AF6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724175475;
	bh=73ZZd1aR+uG/5gFkVloVfHgkK5o1HsdJzv0l9tqss74=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ag9JQt/fH5RHLcP3/YYv7YhNWdbfAzWXpHMRnF98ecM7+JCeFEYM0v90Rf53ptxMC
	 HURRJHqBAnKQbXHq3Iw6hrmFUvv22s97JGqFscQEBJACy7lGwwA1Z2OVHCtjW23c4w
	 FrV03+T0EwO14UqDoNGliIKx5GkqLC8QjBC7kQcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FCE1F80107; Tue, 20 Aug 2024 19:37:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2802F80588;
	Tue, 20 Aug 2024 19:37:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC3B2F80494; Tue, 20 Aug 2024 19:37:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9B97F80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 19:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B97F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=WjI7wo4B
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47KDZ3vR004724;
	Tue, 20 Aug 2024 17:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQEIRSDa39gdCwlCKq9JZIFIY0/NJ/3+eiPQAxdupj0=; b=WjI7wo4B5jTxrLVe
	+T7HypxeirX+Cl025E8AZwBqQmc4mPVs9/j2/UUmxNhgois4pBkW5eHsuEXSFzkb
	Dyl4xs+TrXB2sVS4lsnce9mP2JCY7gAi346q/TTgoYQ95lIw59jzZR3sFOpTP1cz
	lUORyOvQrRdeZt6jeksmH71vWbQ31wEZVmZMkzANngdae2T5Qe1ES0y6V50jPBly
	GnPj6my9LZYkvho6GkISvONC/qTPi22k11xxqbMaGDKI4g7VyqCt8WzhkC4t07AP
	2FJjUluSk8Ymi4WKD0NoRP+sX5VBGryQo7bUpX9RdvlujoxWi8HF05jqti+WFny6
	yTqbKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414v5c8mqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 17:37:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47KHbGRp025682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 17:37:16 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 10:37:15 -0700
Message-ID: <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
Date: Tue, 20 Aug 2024 10:37:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
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
 <20240801011730.4797-30-quic_wcheng@quicinc.com>
 <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
 <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
 <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gPOFw45hHTD_kkfGLRNEP9mvfNtZIqVH
X-Proofpoint-ORIG-GUID: gPOFw45hHTD_kkfGLRNEP9mvfNtZIqVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 mlxlogscore=937 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200131
Message-ID-Hash: 26DVT2GG7BI4OMXZJBCS2RAJE5JWD5OZ
X-Message-ID-Hash: 26DVT2GG7BI4OMXZJBCS2RAJE5JWD5OZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26DVT2GG7BI4OMXZJBCS2RAJE5JWD5OZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/19/2024 11:39 PM, Pierre-Louis Bossart wrote:
>>>> +/**
>>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>>> + * @chip - USB SND chip device
>>>> + *
>>>> + * Creates a sound control for a USB audio device, so that applications can
>>>> + * query for if there is an available USB audio offload path, and which
>>>> + * card is managing it.
>>>> + */
>>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>>> +{
>>>> +	struct usb_device *udev = chip->dev;
>>>> +	struct snd_kcontrol_new *chip_kctl;
>>>> +	struct snd_usb_stream *as;
>>>> +	char ctl_name[37];
>>>> +	int ret;
>>>> +
>>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>>> +		chip_kctl->count = 1;
>>>> +		/*
>>>> +		 * Store the associated USB SND card number and PCM index for
>>>> +		 * the kctl.
>>>> +		 */
>>>> +		chip_kctl->private_value = as->pcm_index |
>>>> +					  chip->card->number << 16;
>>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>>> +			as->pcm_index);
>>>> +		chip_kctl->name = ctl_name;
>>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>>> +				  udev->bus->sysdev));
>>>> +		if (ret < 0)
>>>> +			break;
>>>> +	}
>>>> +
>>>> +	return ret;
>> Hi Pierre,
>>> None of this looks Qualcomm-specific, shouldn't this be part of the
>>> soc_usb framework instead of being added in the qcom/ stuff?
>> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
>>
>> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
>>
>> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
>>
>> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.
> My comment was only referring to the location of the code, it's now in
> sound/usb/qcom/mixer_usb_offload.c but does not contain anything
> specific to Qualcomm. I was not asking for any encapsulation inside of
> soc-usb, I was only suggesting a move of the code to a shared helper
> library so that this code can be reused as is and not duplicated if the
> QCOM parts are not compiled in.

Ah, great, thanks for the clarification.  Let me take a look with that perspective.

Thanks

Wesley Cheng

