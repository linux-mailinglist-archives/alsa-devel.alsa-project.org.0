Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 772348C1873
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 23:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDB014E7;
	Thu,  9 May 2024 23:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDB014E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715290500;
	bh=DMClA2EG4om7tUuZOout4+5pUV7yCTXmqNhHE4600xM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sSDafL9CMxoLvs0203SCjJSBy9tx0kW5LkgdM9AVCdMKw5t38aYhUnoNpBM9DdEOT
	 a/D+NlT+HhYp5VSAiTxa/cHTeiiATZx4/s8YT7pyPC9NR5RGhkLCqhYCzU5Vs8RKQT
	 10MvG0B+Wvz6/wgetSFlk2sYx8UGAg+blvzm/nK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A39F8057F; Thu,  9 May 2024 23:34:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6511F805A0;
	Thu,  9 May 2024 23:34:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00F7CF8049C; Thu,  9 May 2024 23:34:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBB35F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 23:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB35F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LI9r2ZDo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 449KtB8X012405;
	Thu, 9 May 2024 21:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cIukUmTAz21I3U9U4WGeVwO7Ge0VeW/gUAEvuX3Cztc=; b=LI
	9r2ZDod4f1CfRw0lzzeck32b+xIyPiWNzUzL70jaE0GWi79OrRqe7hiTMCQnshjR
	M+YlIEWTxolltwsRLJ54IH3eQAVAfx6gcOgoYnTbqddSIGXfr4qbfsg6nT68hFqO
	QD+/f7xVKlSdtjj19rpQSd71bm2wPqoPodM2bvcyFL0IrobV0qXFffIAnj3Ryx4J
	JkuENjg/HdYm0UBiz4/P7WlHIMudK0ofQWhMMPONf+EumzP5KCSW7HoT6VWYJtZN
	zWuTKpTSAZ6kshg6Mmp5jHEUYmxIwgY55lQPpGltrPb6wjXOMB58KgHKcBKe7MS2
	WRXOLrTOkp1Gwm7T7XUw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09f5unjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 21:34:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 449LY6PO000667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 21:34:06 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 14:34:05 -0700
Message-ID: <d0c1e6a8-3caa-3530-d49a-a8b820d19cf1@quicinc.com>
Date: Thu, 9 May 2024 14:34:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
 <726e7006-30b4-4525-84c8-4fb2ef380994@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <726e7006-30b4-4525-84c8-4fb2ef380994@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ElA1DleWGwoZYGAQNwZNxyKuF9wVF_HB
X-Proofpoint-ORIG-GUID: ElA1DleWGwoZYGAQNwZNxyKuF9wVF_HB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=576 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090152
Message-ID-Hash: 43MA4W3R66IVDXRII2BKJV22EX6POUVV
X-Message-ID-Hash: 43MA4W3R66IVDXRII2BKJV22EX6POUVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43MA4W3R66IVDXRII2BKJV22EX6POUVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/9/2024 5:54 AM, Pierre-Louis Bossart wrote:
> 
> 
> 
>>> Wait, is this saying you will have exactly one PCM device/FE DAI
>>> connected to the USB BE DAI exposed in patch 11?
>>>
>>>> +    SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
>>>> +               usb_mixer_controls,
>>>> +               ARRAY_SIZE(usb_mixer_controls)),
>>>> +
>>>
>>> And then what is the role of the USB mixer if you only have one input?
>>>
>>> I must be missing something.
>>>
>>
>> Not sure if this is a QCOM specific implementation, but the way the DT
>> is defined for the USB offload path is as follows:
>>
>>      usb-dai-link {
>>          link-name = "USB Playback";
>>
>>          cpu {
>>              sound-dai = <&q6afedai USB_RX>;
>>          };
>>
>>          codec {
>>              sound-dai = <&usbdai USB_RX>;
>>          };
>>
>>          platform {
>>              sound-dai = <&q6routing>;
>>          };
>>      };
>>
>> Based on our DT parser helper API (qcom_snd_parse_of()) this isn't going
>> to create a PCM device.  The PCM devices are created for nodes that
>> don't have a codec and platform defined:
>>
>>      mm1-dai-link {
>>          link-name = "MultiMedia1";
>>          cpu {
>>              sound-dai = <&q6asmdai      MSM_FRONTEND_DAI_MULTIMEDIA1>;
>>          };
>>      };
>>
>> The ASM path is the entity that defines the number of PCM devices that
>> is created for the QC ASoC platform card, and is where the actual PCM
>> data is sent over to the DSP.  So there could be several PCM devices
>> that can use the USB BE DAI.
> 
> ok, but then how would this work with the ALSA controls reporting which
> PCM device can be used? I didn't see a mechanism allowing for more than
> one offloaded device, IIRC the control reported just ONE PCM device number.

With respects to the PCM devices exposed by the ASoC card, the USB Mixer 
controls which "Multimedia" (ASM) path can be routed to the USB BE DAI.

The kcontrols you are mentioning are controlling which USB card and USB 
PCM device to execute the offloading on.  As of now, at least for the 
QCOM implementation, we support only offloading on one path/USB 
interface.  I can't comment on how other offloading solutions look like, 
but we pass the USB PCM and card index as part of our AFE port open 
command (done from USB BE DAI).  This will result in a USB QMI message 
back (from ADSP) to our USB SND offload driver, which carries all the 
information about the selected card and PCM index to execute offloading on.

One thing I can do is to actually make the kcontrols for selecting the 
PCM and card devices to look at the num_supported_streams.  This would 
at least allow for vendors that have support for more potential 
offloading streams to select more than one.

Thanks
Wesley Cheng
