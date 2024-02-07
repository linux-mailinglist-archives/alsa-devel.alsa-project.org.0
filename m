Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6784C1E0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 02:25:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682F4202;
	Wed,  7 Feb 2024 02:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682F4202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707269149;
	bh=YNWm7VCwUiMbQ4q8yVKywcJhspzvtPPmE2IpmVn/494=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bk/WEj2RG7dN2ATTJyPKl2NSxz/rFc3kpJHDUPvDO6CoN9cyF8kZzmKxCkM0hppnS
	 tAf2+2m+V8SHZd5/64HpeK4UIoYUrv0AJJAflFPqIOG/jZDRiNKy21DyG0R0c+IyFf
	 sRWfhej2IeEiqDVX887yA7axsV4Xo6CRHLEtiv34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9317EF801D5; Wed,  7 Feb 2024 02:25:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE581F801D5;
	Wed,  7 Feb 2024 02:25:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B935F801EB; Wed,  7 Feb 2024 02:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B5AEF800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 02:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B5AEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Bwt5UhpS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 416N9VN0028901;
	Wed, 7 Feb 2024 01:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IgPl62Ica5DUxeR7iWfeniS7QkgQTS2Ho8V6ORfH3XA=; b=Bw
	t5UhpSEDOH4ZP8oIiK5+UqhoT8yL35uL3wgR2YDVILcXOFHxpkgzm2HDIBItbNec
	FCow4tRU+0pYxlA4ZZnC/Sj1eIWKb5afDzpODwBQ8W0Fu5HcAKm+0RWGORHiM6AA
	0PB/2k+TKStetZoxOEmYvNSTxoWfXHXQFWX1OQ50NsGEMPAE18bswMIZyeDoGR2+
	s7ClufMfQ9Fh1OhGJsNHkIgmJqwMUy0Kbp1H5TCx4QMgahhqPP6CMh+maGKybssQ
	aYosRASaNeW0XR0s/+w5vPhqaPkX97mu8G5KxKRgVx7mLoybtvhwxAXgW+peGxAL
	Ej5F7DeHuGoYO3eVGgJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3ub6gh8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 01:24:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4171Ol18029927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Feb 2024 01:24:47 GMT
Received: from [10.110.7.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 17:24:47 -0800
Message-ID: <dbe544de-dc04-59a8-6642-883fc00214f3@quicinc.com>
Date: Tue, 6 Feb 2024 17:24:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v13 48/53] ALSA: usb-audio: mixer: Add USB offloading
 mixer control
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
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-49-quic_wcheng@quicinc.com>
 <871q9pwy0l.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <871q9pwy0l.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bVpCbC7ibiiisGB-GI8oyNyTNgqoj7sy
X-Proofpoint-ORIG-GUID: bVpCbC7ibiiisGB-GI8oyNyTNgqoj7sy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070009
Message-ID-Hash: VCU7DSOKVAATP2KLRIXINHKT4JRNMAPW
X-Message-ID-Hash: VCU7DSOKVAATP2KLRIXINHKT4JRNMAPW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCU7DSOKVAATP2KLRIXINHKT4JRNMAPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/6/2024 4:57 AM, Takashi Iwai wrote:
> On Sat, 03 Feb 2024 03:36:40 +0100,
> Wesley Cheng wrote:
>>
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> index is associated with the ASoC platform card supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.  SOC USB will expose more
>> details about the current offloading status, which includes the USB sound
>> card and USB PCM device indexes currently being used.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> The concept is understandable, but the control element name ("SNDUSB
> OFFLD playback available") looks non-intrusive and non-conformant.
> Use a bit more understandable name instead.
> 
> This provides a card number where the offload driver is bound, and the
> name should indicate something about that.
> 

Hmmm, does USB sound have a naming convention that it usually follows 
for mixer/control interfaces?

For something that is more closely related, how about:
"USB offload capable card"

> Also, about the implementation:
> 
>> +static int
>> +snd_usb_offload_create_mixer(struct usb_mixer_interface *mixer,
>> +		       const struct snd_kcontrol_new *new_kctl)
>> +{
>> +	struct snd_kcontrol *kctl;
>> +	struct usb_mixer_elem_info *elem;
>> +
>> +	elem = kzalloc(sizeof(struct usb_mixer_elem_info), GFP_KERNEL);
>> +	if (!elem)
>> +		return -ENOMEM;
>> +
>> +	elem->head.mixer = mixer;
>> +	elem->val_type = USB_MIXER_S32;
>> +	elem->control = 0;
>> +	elem->head.id = 0;
>> +	elem->channels = 1;
>> +
>> +	kctl = snd_ctl_new1(new_kctl, elem);
>> +	if (!kctl) {
>> +		kfree(elem);
>> +		return -ENOMEM;
>> +	}
>> +	kctl->private_free = snd_usb_mixer_elem_free;
>> +
>> +	return snd_usb_mixer_add_control(&elem->head, kctl);
> 
> This control has almost little to do with the standard USB interface,
> and it'll be much simpler if you create a raw control element.
> Pass the bus or the sysdev to private_data, and that's all you need in
> the get callback.
> 

Sure, I'll remove the need to register over the SND USB mixer API, and 
just use the core SND control APIs.

> Also, don't forget to set the proper access bits (it's read-only).
> 

Thanks for pointing this out, will fix.

Thanks
Wesley Cheng

> 
> thanks,
> 
> Takashi
