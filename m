Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384079454AE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 00:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A723D61;
	Fri,  2 Aug 2024 00:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A723D61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722553055;
	bh=YgcMeHbecvcwAZcMU2fEaHUgFYpRhsPXQb6yZzvX9Mg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I1efXu7ucjj+vt94ORsgTmKG8qMpqWejcpIcriEtBTf4zvE36tKNnw5CssWmH6HDD
	 y76dp91+yRROWitmCsV+S+qeoX0/AGQmcLe3NsFXcN7oPq4ChW+jzZcEEwlPVxI7P3
	 9EksLj9TeQWRYFLfIp2hyKeeDVHgxzfIh7pCgzD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8ED3F805C0; Fri,  2 Aug 2024 00:57:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8172BF805AD;
	Fri,  2 Aug 2024 00:57:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 744B7F802DB; Fri,  2 Aug 2024 00:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8773AF800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 00:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8773AF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=lfF305o6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 471LajVc024593;
	Thu, 1 Aug 2024 22:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGG1xu/Ws5ZdwYrfCVjBOTjooBbgHwtQA2Br32FjgVM=; b=lfF305o6k0ZUPcjF
	xQE4GP+uieLUOfwU/0EURArLd0ql2Kk6uvVxiIcGMyVAa24SwZvRB3li6fN90iji
	beLTmNS/KORCWwbXVwmuCahg/+Hr8vrPY+xCAu2UmVjSXDl4k1E0dw8WFStplj/Y
	kQHH2Je/H6q4DxblHgepb4U7X76/mmLqP3fHpDnP3iK2Uu2cE4uMRJPYF551aiZX
	8G/u4d4IA+Bo9/BS9gNfOV9aHJ6BSmvxWqCyUI7f6T5rol3fW1sBzlAYJHBm+fAO
	8d//hvPKCdsNEUxVGOJsRHwns38tZW//3Is3UfDP3gV040FBVexg4++ytQn44aHc
	8LXX/A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje303h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 22:43:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471MhHdQ023311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 22:43:17 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:43:16 -0700
Message-ID: <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
Date: Thu, 1 Aug 2024 15:43:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
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
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
 <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gXHq5d8kZnKKMYYfVok95REoRv2uhT8d
X-Proofpoint-ORIG-GUID: gXHq5d8kZnKKMYYfVok95REoRv2uhT8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=966
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010152
Message-ID-Hash: ZPJATA2L3WNITN6BSAT7T7ATX5OTUQM4
X-Message-ID-Hash: ZPJATA2L3WNITN6BSAT7T7ATX5OTUQM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPJATA2L3WNITN6BSAT7T7ATX5OTUQM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/1/2024 1:07 AM, Pierre-Louis Bossart wrote:
>
>
>> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +						 struct snd_soc_jack *jack)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>> +{
>> +	return -ENODEV;
>> +}
> usually fallback functions return 0, is the error code intentional?
ACK.
>
>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +					struct snd_soc_jack *jack)
>> +{
>> +	int ret;
>> +
>> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
> do we need the reference to Playback?
No, will remove.
>> +					SND_JACK_HEADPHONE, jack);
> wondering if there would be any merit in defining a new type of jack,
> e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
> device connected. The type of device does not really matter, does it?
>
Not as of now, but I think we discussed in the past that maybe depending on if playback and capture is supported, we can notify SND_JACK_HEADSET?  That is something I will need to change depending on how we want to handle the comments on patch#9

Thanks

Wesley Cheng

>> +	if (ret < 0) {
>> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_component_set_jack(component, jack, NULL);
>> +	if (ret) {
>> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
