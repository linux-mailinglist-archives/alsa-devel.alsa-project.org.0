Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CA850130
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Feb 2024 01:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D7B7F8;
	Sat, 10 Feb 2024 01:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D7B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707525144;
	bh=wCW3zFW/+d1IVAWJlYeFqcCbESpjv/UqBXVGgoe5JIw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gyQAiqWFKdpSVZh6bfI22tGcaMpQCUdT+UxnHiMgwEEPIOsliaEjUs1fix5hYh5XP
	 hY3OzjRoAtYbZskmkSAr92ObPayEj4jUhhg0Yp9RmIz6q5Og3qFpP9/Kqg+XpOEEaF
	 s9bJQhMgtZ0Qh8fehYtCLhcRV3of21DyWp0qjs4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90A8EF805AD; Sat, 10 Feb 2024 01:31:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3788F8057D;
	Sat, 10 Feb 2024 01:31:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E420F801EB; Sat, 10 Feb 2024 01:31:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41042F8016E
	for <alsa-devel@alsa-project.org>; Sat, 10 Feb 2024 01:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41042F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=lDV1ToMc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A0Jtde019670;
	Sat, 10 Feb 2024 00:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EPlrOpZcg7RkI/G3TQS7CRq1UauaWKip5XIBMtpCMdI=; b=lD
	V1ToMcNuHWUMK2sRmRjELeyICKvcd1iFgLKdVVnCFiJA6K+HMm8gwoDf2vRToov9
	LVRH4i1ySk/6SX3PMlNqVPTDEW6Awxl53kd2VgONmviD5GMullo1xJjVeMgxHzxk
	NUjPbAgU66FeVCbGXtecjXrlhjstR85s6HZWPGElqA3x4M0xcT9Ad/OGHPgoSPJs
	pxNeKepUMNcvPylLqriFJPmOvWR+1pGnI1Pm54Tv8Cu5er8RG6BN+7SkVw16uhX7
	s//TKg7ycszxHmGT5JabbGHfD120nGtIhQk+DDVEsSh/CdWkzEHEGHM770oua6Hg
	BJVmnP8fSnv+HBdTvRXg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5gk2hudt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 00:31:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41A0VMin029048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 00:31:22 GMT
Received: from [10.110.93.252] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 16:31:21 -0800
Message-ID: <43aa48a5-fab2-8d1c-a1c9-1553b47fe72c@quicinc.com>
Date: Fri, 9 Feb 2024 16:31:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v14 48/53] ALSA: usb-audio: mixer: Add USB offloading
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
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
 <20240208231406.27397-49-quic_wcheng@quicinc.com>
 <87y1bt2acg.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87y1bt2acg.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lXQuVPmFc1WXS-_N4GcNV_ReH1aK5jL-
X-Proofpoint-GUID: lXQuVPmFc1WXS-_N4GcNV_ReH1aK5jL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_20,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402100002
Message-ID-Hash: DZ7BAM6GAEHHGSNCWXWZP7PVFBPY2JDH
X-Message-ID-Hash: DZ7BAM6GAEHHGSNCWXWZP7PVFBPY2JDH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZ7BAM6GAEHHGSNCWXWZP7PVFBPY2JDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/9/2024 2:36 AM, Takashi Iwai wrote:
> On Fri, 09 Feb 2024 00:14:01 +0100,
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
> Now looking at this again, I noticed that this will bring the
> hard-dependency on ASoC stuff to USB-audio driver, since it adds the
> call of snd_soc_usb_device_offload_available().
> 
> Maybe we can let the add-on platform adding/removing the control
> element on the fly instead?
> 

Sure, I'll move it into the QC offload driver.  As long as we have a 
standard API within USB SND that other vendors can also add to their 
offload drivers, I think that is sufficient.

Thanks
Wesley Cheng

> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/usb/Kconfig             |  4 ++
>>   sound/usb/Makefile            |  1 +
>>   sound/usb/mixer.c             |  5 +++
>>   sound/usb/mixer_usb_offload.c | 72 +++++++++++++++++++++++++++++++++++
>>   sound/usb/mixer_usb_offload.h | 17 +++++++++
>>   5 files changed, 99 insertions(+)
>>   create mode 100644 sound/usb/mixer_usb_offload.c
>>   create mode 100644 sound/usb/mixer_usb_offload.h
>>
>> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
>> index 4c842fbe6365..3e7be258d0e3 100644
>> --- a/sound/usb/Kconfig
>> +++ b/sound/usb/Kconfig
>> @@ -176,10 +176,14 @@ config SND_BCD2000
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called snd-bcd2000.
>>   
>> +config SND_USB_OFFLOAD_MIXER
>> +	bool
>> +
>>   config SND_USB_AUDIO_QMI
>>   	tristate "Qualcomm Audio Offload driver"
>>   	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
>>   	select SND_PCM
>> +	select SND_USB_OFFLOAD_MIXER
>>   	help
>>   	  Say Y here to enable the Qualcomm USB audio offloading feature.
>>   
>> diff --git a/sound/usb/Makefile b/sound/usb/Makefile
>> index 246788268ddd..8c54660a11b0 100644
>> --- a/sound/usb/Makefile
>> +++ b/sound/usb/Makefile
>> @@ -22,6 +22,7 @@ snd-usb-audio-objs := 	card.o \
>>   			stream.o \
>>   			validate.o
>>   
>> +snd-usb-audio-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>>   snd-usb-audio-$(CONFIG_SND_USB_AUDIO_MIDI_V2) += midi2.o
>>   snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>>   
>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>> index 409fc1164694..09229e623469 100644
>> --- a/sound/usb/mixer.c
>> +++ b/sound/usb/mixer.c
>> @@ -48,6 +48,7 @@
>>   #include "mixer.h"
>>   #include "helper.h"
>>   #include "mixer_quirks.h"
>> +#include "mixer_usb_offload.h"
>>   #include "power.h"
>>   
>>   #define MAX_ID_ELEMS	256
>> @@ -3609,6 +3610,10 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
>>   	if (err < 0)
>>   		goto _error;
>>   
>> +	err = snd_usb_offload_init_mixer(mixer);
>> +	if (err < 0)
>> +		goto _error;
>> +
>>   	err = snd_device_new(chip->card, SNDRV_DEV_CODEC, mixer, &dev_ops);
>>   	if (err < 0)
>>   		goto _error;
>> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
>> new file mode 100644
>> index 000000000000..61b17359b987
>> --- /dev/null
>> +++ b/sound/usb/mixer_usb_offload.c
>> @@ -0,0 +1,72 @@
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
>> +#include "card.h"
>> +#include "mixer.h"
>> +#include "mixer_usb_offload.h"
>> +#include "usbaudio.h"
>> +
>> +static int
>> +snd_usb_offload_create_mixer(struct usb_mixer_interface *mixer,
>> +		       const struct snd_kcontrol_new *new_kctl)
>> +{
>> +	struct snd_usb_audio *chip = mixer->chip;
>> +	struct usb_device *udev = chip->dev;
>> +
>> +	return snd_ctl_add(chip->card,
>> +			   snd_ctl_new1(new_kctl, udev->bus->sysdev));
>> +}
>> +
>> +static int
>> +snd_usb_offload_available_get(struct snd_kcontrol *kcontrol,
>> +		      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
>> +	int ret;
>> +
>> +	ret = snd_soc_usb_device_offload_available(sysdev);
>> +	ucontrol->value.integer.value[0] = ret < 0 ? -1 : ret;
>> +
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int snd_usb_offload_available_info(struct snd_kcontrol *kcontrol,
>> +			      struct snd_ctl_elem_info *uinfo)
>> +{
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>> +	uinfo->count = 1;
>> +	uinfo->value.integer.min = -1;
>> +	uinfo->value.integer.max = SNDRV_CARDS;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct snd_kcontrol_new snd_usb_offload_available_ctl = {
>> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
>> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
>> +	.name = "USB Offload Playback Capable Card",
>> +	.info = snd_usb_offload_available_info,
>> +	.get = snd_usb_offload_available_get,
>> +};
>> +
>> +/**
>> + * snd_usb_offload_init_mixer() - Add USB offload bounded mixer
>> + * @mixer - USB mixer
>> + *
>> + * Creates a sound control for a USB audio device, so that applications can
>> + * query for if there is an available USB audio offload path, and which
>> + * card is managing it.
>> + */
>> +int snd_usb_offload_init_mixer(struct usb_mixer_interface *mixer)
>> +{
>> +	return snd_usb_offload_create_mixer(mixer, &snd_usb_offload_available_ctl);
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_offload_init_mixer);
>> diff --git a/sound/usb/mixer_usb_offload.h b/sound/usb/mixer_usb_offload.h
>> new file mode 100644
>> index 000000000000..fb88e872d8fa
>> --- /dev/null
>> +++ b/sound/usb/mixer_usb_offload.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __USB_OFFLOAD_MIXER_H
>> +#define __USB_OFFLOAD_MIXER_H
>> +
>> +#if IS_ENABLED(CONFIG_SND_USB_OFFLOAD_MIXER)
>> +int snd_usb_offload_init_mixer(struct usb_mixer_interface *mixer);
>> +#else
>> +static int snd_usb_offload_init_mixer(struct usb_mixer_interface *mixer)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +#endif /* __USB_OFFLOAD_MIXER_H */
