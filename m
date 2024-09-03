Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCD96A9E2
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 23:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF99F857;
	Tue,  3 Sep 2024 23:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF99F857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725398357;
	bh=U1ukEr8EN1FDDvS4Y7RULLGTH93cVAvfVFqw0l1CRb8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tEeD7g89U6zBtROl2mXjImfcMrY9OsTUGGHSZtLdTipE6++QyLhB9UX/uqTxi+JFP
	 5tFy8M/p4MO+ezdmyUYvbKwV7raoHEmXylZa7e8qRyTK30tggrQpl9vhRot6ZYHrue
	 XJq+f/JhW/Y247s71CSE55muf1veQbQrDPLojveg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B018BF805B6; Tue,  3 Sep 2024 23:18:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B81DF805AC;
	Tue,  3 Sep 2024 23:18:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE10AF80199; Tue,  3 Sep 2024 23:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3D1BF800E9
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 23:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D1BF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Bx4JhlQN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 483D99Pm014645;
	Tue, 3 Sep 2024 21:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccVhMBdxEk5S4mL0cUcGF7PalslkLp70MYvdg4jGv40=; b=Bx4JhlQNp4Mr4rRu
	3MWe1AssFm+F4CHy5VhRZ3BjpoN2yB3csvRBWkLkprI/xAQGZJbPNWhx0AaZIrIm
	mAfwCKFSfYoLcoJnaXt/yaZXcEgvmUigyRylvKtghA2K9O9No8LHrpGk8Fdzyfka
	qrLgeZnbAvN/k7+VxkPC8Hmmrh3sZreo7ZweNA9ilpFqlQRHIJASugyOtXzrtoZ8
	+GeYzosmCwLSIDTRYE5eviuKd4dKB7wyBQDOgfY7UJHlYf2VL8ZolXkhmrrZwj4u
	JzePcTc+ZynZsxZTSdX1mziwIu9x45dj/QazjTSIJ4edSo+329AexEcIyL0s90be
	dbmR/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69avfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 21:18:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 483LIbs9019044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 21:18:37 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 14:18:36 -0700
Message-ID: <5b23cbaf-05e2-4310-aad0-7e5bd01c9d3b@quicinc.com>
Date: Tue, 3 Sep 2024 14:18:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 21/33] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-22-quic_wcheng@quicinc.com>
 <afe37014-8ec5-4808-bc24-09ac0f2d93b6@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <afe37014-8ec5-4808-bc24-09ac0f2d93b6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zJj5FS5k0LAWrU0MGLzu1kKo2bkGDL1O
X-Proofpoint-ORIG-GUID: zJj5FS5k0LAWrU0MGLzu1kKo2bkGDL1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_09,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030171
Message-ID-Hash: KBEQRQYEN6C3EEB7VPAWWZKZDVAKKNCW
X-Message-ID-Hash: KBEQRQYEN6C3EEB7VPAWWZKZDVAKKNCW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBEQRQYEN6C3EEB7VPAWWZKZDVAKKNCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:21 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> Create a USB BE component that will register a new USB port to the ASoC USB
>> framework.  This will handle determination on if the requested audio
>> profile is supported by the USB device currently selected.
>>
>> Check for if the PCM format is supported during the hw_params callback.  If
>> the profile is not supported then the userspace ALSA entity will receive an
>> error, and can take further action.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  include/sound/q6usboffload.h  |  20 +++
>>  sound/soc/qcom/Kconfig        |  10 ++
>>  sound/soc/qcom/qdsp6/Makefile |   1 +
>>  sound/soc/qcom/qdsp6/q6usb.c  | 246 ++++++++++++++++++++++++++++++++++
>>  4 files changed, 277 insertions(+)
>>  create mode 100644 include/sound/q6usboffload.h
>>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>>
>> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
>> new file mode 100644
>> index 000000000000..49ab2c34b84c
>> --- /dev/null
>> +++ b/include/sound/q6usboffload.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * linux/sound/q6usboffload.h -- QDSP6 USB offload
> not sure about the linux/ prefix?
>
>> + *
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/**
>> + * struct q6usb_offload
>> + * @dev - dev handle to usb be
>> + * @sid - streamID for iommu
>> + * @intr_num - usb interrupter number
>> + * @domain - allocated iommu domain
>> + **/
>> +struct q6usb_offload {
>> +	struct device *dev;
>> +	long long sid;
>> +	u16 intr_num;
>> +	struct iommu_domain *domain;
>> +};
> consider reordering to avoid holes/alignment issues, e.g. all pointers
> first, then long long then u16
>
Will fix these.
>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>> +			   struct snd_pcm_hw_params *params,
>> +			   struct snd_soc_dai *dai)
>> +{
>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	int direction = substream->stream;
>> +	struct q6afe_port *q6usb_afe;
>> +	struct snd_soc_usb_device *sdev;
>> +	int ret = -EINVAL;
>> +
>> +	mutex_lock(&data->mutex);
>> +
>> +	/* No active chip index */
>> +	if (list_empty(&data->devices))
>> +		goto out;
> -ENODEV for the default return value>?
Sure.
>> +
>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>> +
>> +	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>> +	if (IS_ERR(q6usb_afe))
>> +		goto out;
>> +
>> +	/* Notify audio DSP about the devices being offloaded */
>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>> +					  sdev->ppcm_idx[sdev->num_playback - 1]);
> don't you need a symmetrical notification upon hw_free()?
>
> Also what happens if there are multiple calls to hw_params, which is
> quite legit in ALSA/ASoC?

The afe_port_send_usb_dev_param() is meant to just update the device selected for offload on the audio DSP end, and this won't be referenced until our Q6AFE DAI sends the port start command in its prepare() callback.  Don't think we need to handle anything specific in the hw_free() case.  As long as the hw_params() callback is called before any audio session is started, then we'll ensure that the device selected is always updated to the audio DSP.

Thanks

Wesley Cheng

