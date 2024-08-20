Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A399B957BA6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 04:52:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37351741;
	Tue, 20 Aug 2024 04:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37351741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724122328;
	bh=EX7m7E4uVFpmQxuytLHn8Izj+uT6XzL1vKALGH1360A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S+85ZfzqBO1KuQ+m+4LGuC05TKMoqrS8H1FRG36OlWPZL9t3a8v9B4nYe+3z0R0C7
	 J7LNJdpyPxbXzDGZtZEHlMyqyMyW2GYnp+j01SBEhSODp8j9/vhvkFRl1Hp5WU1hdx
	 +06jbspEcbkMkDnRP7PYzIoUT99LPTftrVX1iCyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B8ADF805B4; Tue, 20 Aug 2024 04:51:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E30CF805AD;
	Tue, 20 Aug 2024 04:51:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D193F80494; Tue, 20 Aug 2024 04:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48E91F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 04:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E91F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=dDiqdbHN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47K2C282012421;
	Tue, 20 Aug 2024 02:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdvKqTI0IYHL1eLLYyhx4z9hi6k3a2+Z/kg0NhcHBQQ=; b=dDiqdbHNDfh0A2B2
	7lcKjF3MXhfcotG6OaBzKeZoe7WZxVfzkm79PzCip8UaoCzPB9YLLlydhq7ZhFOU
	xhgdFt8cipELYl7AaoRAT7wRs8y4xYjXdNmXVNzcfOK9d6evn2ejqfrfvj6ugDl8
	jGiFdwxeNPgQs24oWUKuLRULkxucJDdBnJFub23pNnAuoSoa2h6eb0iTwflXrwlY
	cpysxvpIFaGTZKiJZ06/YUekpzMq16Wq5CD43hniELuKbiuqKhd57R96+mQGr308
	NYNy7RTmP4oAzOgpI4eMAtuIXsmOcIerUif6sdc/z5y8NguzGWc0RuoWojG/nozR
	2/dpog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j5701bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 02:33:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47K2Xmw2030765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 02:33:48 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 19:33:47 -0700
Message-ID: <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
Date: Mon, 19 Aug 2024 19:33:47 -0700
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kHPYq0DIRqcezxG483IwCovOPnBE9jat
X-Proofpoint-GUID: kHPYq0DIRqcezxG483IwCovOPnBE9jat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200018
Message-ID-Hash: BG5W3ZP5IJSO5XYSHAL433OW6UAZA7NQ
X-Message-ID-Hash: BG5W3ZP5IJSO5XYSHAL433OW6UAZA7NQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BG5W3ZP5IJSO5XYSHAL433OW6UAZA7NQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/1/2024 2:02 AM, Pierre-Louis Bossart wrote:
>
>> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
>> +snd-usb-audio-qmi-objs += mixer_usb_offload.o
>> +endif
>> \ No newline at end of file
> add one?
>
>> diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
>> new file mode 100644
>> index 000000000000..c00770400c67
>> --- /dev/null
>> +++ b/sound/usb/qcom/mixer_usb_offload.c
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/usb.h>
>> +
>> +#include <sound/core.h>
>> +#include <sound/control.h>
>> +#include <sound/soc-usb.h>
>> +
>> +#include "../card.h"
>> +#include "../mixer.h"
>> +#include "../usbaudio.h"
>> +
>> +#include "mixer_usb_offload.h"
>> +
>> +#define PCM_IDX(n)  (n & 0xffff)
>> +#define CARD_IDX(n) (n >> 16)
>> +
>> +static int
>> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
>> +		      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
>> +	int card;
>> +	int pcm;
>> +
>> +	card = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
>> +					  PCM_IDX(kcontrol->private_value),
>> +					  SND_SOC_USB_KCTL_CARD_ROUTE);
>> +
>> +	pcm = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
>> +					 PCM_IDX(kcontrol->private_value),
>> +					 SND_SOC_USB_KCTL_PCM_ROUTE);
>> +	if (card < 0 || pcm < 0) {
>> +		card = -1;
>> +		pcm = -1;
>> +	}
>> +
>> +	ucontrol->value.integer.value[0] = card;
>> +	ucontrol->value.integer.value[1] = pcm;
>> +
>> +	return 0;
>> +}
> see my earlier comment, should those two calls be collapsed to return
> all the information in one shot?
>
>> +
>> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
>> +			      struct snd_ctl_elem_info *uinfo)
>> +{
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>> +	uinfo->count = 2;
>> +	uinfo->value.integer.min = -1;
>> +	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
>> +	uinfo->value.integer.max = 0xff;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
>> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
>> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
>> +	.info = snd_usb_offload_route_info,
>> +	.get = snd_usb_offload_route_get,
>> +};
>> +
>> +/**
>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>> + * @chip - USB SND chip device
>> + *
>> + * Creates a sound control for a USB audio device, so that applications can
>> + * query for if there is an available USB audio offload path, and which
>> + * card is managing it.
>> + */
>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>> +{
>> +	struct usb_device *udev = chip->dev;
>> +	struct snd_kcontrol_new *chip_kctl;
>> +	struct snd_usb_stream *as;
>> +	char ctl_name[37];
>> +	int ret;
>> +
>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>> +		chip_kctl->count = 1;
>> +		/*
>> +		 * Store the associated USB SND card number and PCM index for
>> +		 * the kctl.
>> +		 */
>> +		chip_kctl->private_value = as->pcm_index |
>> +					  chip->card->number << 16;
>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>> +			as->pcm_index);
>> +		chip_kctl->name = ctl_name;
>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>> +				  udev->bus->sysdev));
>> +		if (ret < 0)
>> +			break;
>> +	}
>> +
>> +	return ret;
Hi Pierre,
> None of this looks Qualcomm-specific, shouldn't this be part of the
> soc_usb framework instead of being added in the qcom/ stuff?

Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:

1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.

2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.

Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.

Thanks

Wesley Cheng

