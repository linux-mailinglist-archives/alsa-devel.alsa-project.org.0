Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B98C07B4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 01:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A15B76;
	Thu,  9 May 2024 01:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A15B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715211316;
	bh=HNemVXb/OpYjkw6qwSxFgtYqSMxSdSFOgSexH+uBWTg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NywoDEr2Rp42+WgMAFvfg0m0/FXqyI524tx4rjUvEAMXBrMwJfuD5nAtT5XzxzM+P
	 t/3IfmWyTOaQyaMFS0SKclm3btkpWoQOsTnITyohEuwEZQrfeOwK0HdrnmPGp8HpHz
	 cwqJSnOM3hSZcYOwE1/p67FQEiT+ZfFGbWhjAJ2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C898F805AA; Thu,  9 May 2024 01:34:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51634F805A1;
	Thu,  9 May 2024 01:34:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71E48F8049C; Thu,  9 May 2024 01:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0741FF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 01:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0741FF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ELB1v/qs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448G4E8e024341;
	Wed, 8 May 2024 23:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=dtWu/6+BYJMadcGc6nDqhDflB2UOVBkrkN6Fgjdp0QI=; b=EL
	B1v/qsGGCp0fOXdKXuvSA/2rKZcbcmx1hrrQcKAGQjEomTUaVU4/EgTDdQedD1Qq
	bwzM4nYGnvKhC96w4jnoXi2JK+zUcNzKYfNZ5tDOle/olW1IIf92Gc2N17GSaCp4
	fSYk/ikBULt7MUM6XUiQbdfetSJigNQPcBGJjG7DxiCjTZw+kpICPqkgKI3jorLc
	cM5cwACGG5/wbWwVjAkFBCSLSCn7Uk++OfMFJnAEpGIaIVJGcNcwUj9dwJtfDcJ0
	yHST7SzG4OkCg7AtJ9sg5v5oj/LRYLcaE4RP9sl1T92C9koGJe0/mn+r1fDX7RAP
	fUQRdzTqHj7towrUe39Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wfsj65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 23:34:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 448NYMGc001242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 23:34:22 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 16:34:21 -0700
Message-ID: <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
Date: Wed, 8 May 2024 16:34:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-10-quic_wcheng@quicinc.com>
 <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KE0zh6uJcMg3J7raJjI_KCNq_czRl405
X-Proofpoint-ORIG-GUID: KE0zh6uJcMg3J7raJjI_KCNq_czRl405
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=718
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080176
Message-ID-Hash: BPZGLF7BQZH5HWIP3YSUVJBOTH33RCYW
X-Message-ID-Hash: BPZGLF7BQZH5HWIP3YSUVJBOTH33RCYW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPZGLF7BQZH5HWIP3YSUVJBOTH33RCYW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/7/2024 1:37 PM, Pierre-Louis Bossart wrote:
> 
>>   static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>> +	{
>> +		.playback = {
>> +			.stream_name = "USB Playback",
>> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
>> +					SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
>> +					SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
>> +					SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
>> +					SNDRV_PCM_RATE_192000,
>> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
>> +					SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
>> +					SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
>> +					SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
>> +			.channels_min = 1,
>> +			.channels_max = 2,
>> +			.rate_min =	8000,
>> +			.rate_max = 192000,
>> +		},
>> +		.id = USB_RX,
>> +		.name = "USB_RX",
>> +	},
> 
> Wait, is this saying you will have exactly one PCM device/FE DAI
> connected to the USB BE DAI exposed in patch 11?
> 
>> +	SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
>> +			   usb_mixer_controls,
>> +			   ARRAY_SIZE(usb_mixer_controls)),
>> +
> 
> And then what is the role of the USB mixer if you only have one input?
> 
> I must be missing something.
> 

Not sure if this is a QCOM specific implementation, but the way the DT 
is defined for the USB offload path is as follows:

	usb-dai-link {
		link-name = "USB Playback";

		cpu {
			sound-dai = <&q6afedai USB_RX>;
		};

		codec {
			sound-dai = <&usbdai USB_RX>;
		};

		platform {
			sound-dai = <&q6routing>;
		};
	};

Based on our DT parser helper API (qcom_snd_parse_of()) this isn't going 
to create a PCM device.  The PCM devices are created for nodes that 
don't have a codec and platform defined:

	mm1-dai-link {
		link-name = "MultiMedia1";
		cpu {
			sound-dai = <&q6asmdai  	MSM_FRONTEND_DAI_MULTIMEDIA1>;
		};
	};

The ASM path is the entity that defines the number of PCM devices that 
is created for the QC ASoC platform card, and is where the actual PCM 
data is sent over to the DSP.  So there could be several PCM devices 
that can use the USB BE DAI.

Thanks
Wesley Cheng


