Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89830959147
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 01:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CF820C;
	Wed, 21 Aug 2024 01:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CF820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724197164;
	bh=Oz4ictvZa/glJJtpD3FaAHLOq4xAQvkCo3lPcmuXIXc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tbzpWKBQp8Kkfz6JXJ2DdLvhcPJFz7WgFPZhb1hizxEv66+A4cwFB+w7XLvTMvauq
	 cuDcmC0f4JXH5spLTXVgJBlx3mOi7/hQYDdIiS3Ck8IMP5pHfB3N19Id7NOG3rYWbt
	 E3mljk7KEfTtwYz4/D8Hv3RcdKB9wFPOpHdcCK5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795A2F805B6; Wed, 21 Aug 2024 01:38:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9619AF805AB;
	Wed, 21 Aug 2024 01:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9641F80494; Wed, 21 Aug 2024 01:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA915F8014C
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 01:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA915F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=S87Sj045
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47KG3tSU026084;
	Tue, 20 Aug 2024 23:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2xSHxx/O1IBD0VFXMURcOHZcfL9/KRzxqHJdamFR6E=; b=S87Sj045LK14QvkR
	87oyKdX0PA02Tl+lnuUD20KN8C3v8sP/bJwqMRWeSSFHTR8ESbKHgIAt9iFm5oU6
	h/p4o0VisAKXFZCfaoDYt3n8nEYghAtZkPLYSbJEH1WRmrKABYI7lghQyVa4WbQs
	Dya4kFb5QCf8QW+hFS/4jsUuG38a0LVKCgJ0Hxky7/xqu9Gax/mZe3iRtWkIrWOA
	7zV448qd9W+SKs1wZhSpjmjrjRzNh0L+N0GSYBnmrUPDkgh6gAVi3nJr/FKFomqp
	dy/5W8g+0s+rBdDacKuJgq4VbkqejVy24LKnfN7jnIAj/5skB6Om2CTeJ6gikLE5
	GjIJNg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414xb9gw5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 23:38:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47KNcOpI017411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 23:38:24 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 16:38:23 -0700
Message-ID: <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
Date: Tue, 20 Aug 2024 16:38:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
From: Wesley Cheng <quic_wcheng@quicinc.com>
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
 <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
Content-Language: en-US
In-Reply-To: <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ST7IiTIh_vJ13SBgn85S-sPx1NsnI_FY
X-Proofpoint-ORIG-GUID: ST7IiTIh_vJ13SBgn85S-sPx1NsnI_FY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=985 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200173
Message-ID-Hash: WM4Z7XJJDVEKRQ26H5Z3ISA3UXXFLOHW
X-Message-ID-Hash: WM4Z7XJJDVEKRQ26H5Z3ISA3UXXFLOHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WM4Z7XJJDVEKRQ26H5Z3ISA3UXXFLOHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/20/2024 10:37 AM, Wesley Cheng wrote:
> Hi Pierre,
>
> On 8/19/2024 11:39 PM, Pierre-Louis Bossart wrote:
>>>>> +/**
>>>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>>>> + * @chip - USB SND chip device
>>>>> + *
>>>>> + * Creates a sound control for a USB audio device, so that applications can
>>>>> + * query for if there is an available USB audio offload path, and which
>>>>> + * card is managing it.
>>>>> + */
>>>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>>>> +{
>>>>> +	struct usb_device *udev = chip->dev;
>>>>> +	struct snd_kcontrol_new *chip_kctl;
>>>>> +	struct snd_usb_stream *as;
>>>>> +	char ctl_name[37];
>>>>> +	int ret;
>>>>> +
>>>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>>>> +		chip_kctl->count = 1;
>>>>> +		/*
>>>>> +		 * Store the associated USB SND card number and PCM index for
>>>>> +		 * the kctl.
>>>>> +		 */
>>>>> +		chip_kctl->private_value = as->pcm_index |
>>>>> +					  chip->card->number << 16;
>>>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>>>> +			as->pcm_index);
>>>>> +		chip_kctl->name = ctl_name;
>>>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>>>> +				  udev->bus->sysdev));
>>>>> +		if (ret < 0)
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	return ret;
>>> Hi Pierre,
>>>> None of this looks Qualcomm-specific, shouldn't this be part of the
>>>> soc_usb framework instead of being added in the qcom/ stuff?
>>> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
>>>
>>> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
>>>
>>> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
>>>
>>> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.
>> My comment was only referring to the location of the code, it's now in
>> sound/usb/qcom/mixer_usb_offload.c but does not contain anything
>> specific to Qualcomm. I was not asking for any encapsulation inside of
>> soc-usb, I was only suggesting a move of the code to a shared helper
>> library so that this code can be reused as is and not duplicated if the
>> QCOM parts are not compiled in.
> Ah, great, thanks for the clarification.  Let me take a look with that perspective.
>
Going back on the history behind moving it into qcom/ was based off feedback that Takashi pointed out in v14[1].  It was mainly due to the fact that we would be adding another hard dependency between USB SND and the offloading components.  Hence the reason for moving it to within the QCOM offloading package. 

Thanks

Wesley Cheng

[1]: https://lore.kernel.org/linux-usb/87y1bt2acg.wl-tiwai@suse.de/

