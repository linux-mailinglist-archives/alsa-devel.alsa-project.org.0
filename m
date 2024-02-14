Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4378556DF
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 00:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A639DF6;
	Thu, 15 Feb 2024 00:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A639DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707951930;
	bh=NF5NUr80OtbglWaZRPMW8XuNliEAQsYjfE/zJTAavQA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GignsVEKCgjkbN+14ENLp4bvCB6dDNvgY/3LPlA1CNV4f+9AO9bUb6vfsdEA/URAA
	 ASPgI01xIKu1iePZX12OI+0cPnRwAO+Gdrc+/qLjE5ydx55m4+3k5D30Ndu6PiI3zo
	 GaQGIxGZNDzoFchisXMBW8F5pKOZjv5ucpiUEUcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A10F80579; Thu, 15 Feb 2024 00:04:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 738FCF80589;
	Thu, 15 Feb 2024 00:04:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1F22F80238; Thu, 15 Feb 2024 00:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15732F800EE
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 00:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15732F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=L4y8Ewfv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EMWmtR004681;
	Wed, 14 Feb 2024 23:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=y0Uz8mXSkjvYpXhQtlSAFEFG7yr5QWKHlI01ir09dWQ=; b=L4
	y8EwfvWY/MSIRk9KRaT27rQwH0bU8zFAw2ylQSlnqaMws8FoKxCNU1E7FKG3PKQD
	U69vxyTl+s7Gq8sA72GkfOvu48EXZeBEjDZfdcq9ITlMY5N+cYcYDwLzy3YUqVtH
	IZdPC5Rbm9S11S8pq0AQDtbieP1lGuH/EQbtqL6WjI9LDIlylGTs7USbsqfp0qBK
	ezREmJDaAP92qaGK2mxaocOpjqtToMsu6A9mmbCPFznTtDowSpYyKLNSaH0B+1XY
	JjzCDd5o6fmx2R453ESMwOpRRySCPeTkBeUB77dcz+ZXbR+nXvmTFjwcNaL46JW+
	rLbeB4Bi7TF8ZlhRfojg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9435raed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 23:04:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41EN4kmI001141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 23:04:46 GMT
Received: from [10.71.114.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 15:04:45 -0800
Message-ID: <ecec5590-1a96-9363-1209-342b4735096c@quicinc.com>
Date: Wed, 14 Feb 2024 15:04:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 18/50] ASoC: Add SOC USB APIs for adding an USB
 backend
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
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
 <20240213005422.3121-19-quic_wcheng@quicinc.com>
 <87zfw4y717.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87zfw4y717.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JuSmwtbiiWjb1-tzjemz6pa5NF-cujTB
X-Proofpoint-ORIG-GUID: JuSmwtbiiWjb1-tzjemz6pa5NF-cujTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_14,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140174
Message-ID-Hash: NKS4STWDR32T5UUEU2HTEVDZUYPW7IQI
X-Message-ID-Hash: NKS4STWDR32T5UUEU2HTEVDZUYPW7IQI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKS4STWDR32T5UUEU2HTEVDZUYPW7IQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/13/2024 2:48 AM, Takashi Iwai wrote:
> On Tue, 13 Feb 2024 01:53:50 +0100,
> Wesley Cheng wrote:
>>
>> --- a/sound/soc/Kconfig
>> +++ b/sound/soc/Kconfig
>> @@ -76,6 +76,15 @@ config SND_SOC_UTILS_KUNIT_TEST
>>   config SND_SOC_ACPI
>>   	tristate
>>   
>> +config SND_SOC_USB
>> +	bool "SoC based USB audio offloading"
>> +	help
>> +	  Enable this option if an ASoC platform card has support to handle
>> +	  USB audio offloading.  This enables the SoC USB layer, which will
>> +	  notifies the ASoC USB DPCM backend DAI link about available USB audio
>> +	  devices.  Based on the notifications, sequences to enable the audio
>> +	  stream can be taken based on the design.
> 
> This should be tristate, and...
> 
>> --- a/sound/soc/Makefile
>> +++ b/sound/soc/Makefile
>> @@ -31,6 +31,10 @@ endif
>>   
>>   obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
>>   
>> +ifneq ($(CONFIG_SND_SOC_USB),)
>> +snd-soc-core-objs += soc-usb.o
>> +endif
> 
> ... split it to an individual module, i.e.:
> 
> snd-soc-usb-objs := soc-usb.o
> obj-$(CONFIG_SND_SOC_USB) += snd-soc-usb.o
> 
> Otherwise it'll lead to a hard-dependency to snd-soc-core on
> snd-usb-audio, which is utterly unnecessary for most of other
> devices.
> 

Got it...getting this to compile as its own separate module also 
required some changes to the other layers I had.  Anyway, I've reworked 
some of the dependencies with other drivers and is working fine now.

Thanks
Wesley Cheng
