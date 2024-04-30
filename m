Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C28B6C67
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 10:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 180B883E;
	Tue, 30 Apr 2024 10:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 180B883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714464157;
	bh=yVJdK01yhCnUukA30JdDhN5ZSKoRK85R+ezjnS2GijM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mDqTCogcqi1roF6aUOl/j6WLZFFfAbpj8JYaFmdmOkjN6hvGhetAljVfsWNjd3C8H
	 QWxfnCCqg2h+Jmt9jso+B8ITIG32PiVvNisA9basfll5P0PPqIN+7IjVYiqYSv+FyT
	 MV6YbufTab6ku5ueul1vMJlr8PkDiOMKm4+TNRpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05FB8F80269; Tue, 30 Apr 2024 10:02:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B32F805A8;
	Tue, 30 Apr 2024 10:02:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9EF8F80266; Tue, 30 Apr 2024 10:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81D1DF8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 10:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D1DF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Wci2KBcs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43U3tGxi028667;
	Tue, 30 Apr 2024 08:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GbwTd6BSjMG9RMTPFLFiWPip1PAsE7tlTno/hl5oWyc=; b=Wc
	i2KBcsfht+cUMJKoqoB3EdqTZh6AduhAAH+HsCPqs5ajqiGHVRVpTEMkvclbRipM
	x09kwYuCYoH0le70E6aLmknVp5fvTLvFgXtNFPZ7aa4bQrrorhiMQw9KgUCzufqf
	/EJ8beUBFumjECZNGB2kWcGPZnldJjPpLVvoWcK6MT/nFRW5rdE1uqgn247NZ/L1
	/u2qvAjm7wAuttXX1UlLjv+qlDlV0Jo33cRjEnus+jxbxZPVk7mhXxvzdb+h0JJe
	4GzVe105ObdfaMfYAP4Pae6Jke554uusHFVOJniLhL7lroaRMam1HCO3uihVsAAs
	nsXnUdkHSu52Hwz5c95Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtqkr8vc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 08:01:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43U81Z3I021417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 08:01:35 GMT
Received: from [10.110.61.50] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 01:01:34 -0700
Message-ID: <9707364c-9743-83e2-2fc6-86c76322a1da@quicinc.com>
Date: Tue, 30 Apr 2024 01:01:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v20 22/41] ASoC: usb: Add PCM format check API for USB
 backend
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-23-quic_wcheng@quicinc.com>
 <3d70c19f-bab8-4e50-9551-de406a0e0314@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <3d70c19f-bab8-4e50-9551-de406a0e0314@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: btr3Xp9rudx4won1D-9fWNtZMOuVnQ-Y
X-Proofpoint-ORIG-GUID: btr3Xp9rudx4won1D-9fWNtZMOuVnQ-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=874 malwarescore=0
 phishscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300057
Message-ID-Hash: 4JVFGEVBNBWTZHLMXISLZJT7E7VLE4PX
X-Message-ID-Hash: 4JVFGEVBNBWTZHLMXISLZJT7E7VLE4PX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JVFGEVBNBWTZHLMXISLZJT7E7VLE4PX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 4/26/2024 6:25 AM, Amadeusz Sławiński wrote:
> On 4/25/2024 11:51 PM, Wesley Cheng wrote:
>> Introduce a helper to check if a particular PCM format is supported by 
>> the
>> USB audio device connected.  If the USB audio device does not have an
>> audio profile which can support the requested format, then notify the USB
>> backend.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> 
> (...)
> 
>> +/**
>> + * snd_soc_usb_find_format() - Check if audio format is supported
>> + * @card_idx: USB sound chip array index
>> + * @params: PCM parameters
>> + * @direction: capture or playback
>> + *
>> + * Ensure that a requested audio profile from the ASoC side is able 
>> to be
>> + * supported by the USB device.
>> + *
>> + * Return 0 on success, negative on error.
>> + *
>> + */
>> +int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params 
>> *params,
>> +            int direction)
> 
> Perhaps name function similar to its snd_usb equivalent, so 
> snd_soc_usb_find_supported_format?
> 

Will do.

Thanks
Wesley Cheng
