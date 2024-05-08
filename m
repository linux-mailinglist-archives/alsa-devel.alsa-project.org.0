Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CE68C0555
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 22:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E27DF8;
	Wed,  8 May 2024 22:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E27DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715198845;
	bh=4S6Kj4fjhCMZSsEZ0ttJOfsfwcZBTcBuK40ggT4QtZs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HdFaFiPGc4dZZohZakcXJ0Y9qJsXVUUp01kKLLxd4axGwXjYLXDq6PC3cqMtzX26t
	 GISQmSHNtyLXMvc0/G6UpWZnW/vO6KCMkZOxwH2yihf0vhZBBkVFhch6YZ1jvyi+bm
	 JhRZO9+nqFHSHgFlRRJFNPeTq3SYKW1H68pd0j6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21D3AF805AA; Wed,  8 May 2024 22:06:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CCCF80571;
	Wed,  8 May 2024 22:06:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BBE3F8049C; Wed,  8 May 2024 22:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88651F8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 22:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88651F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=TqOFDe5c
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448GUPc9007934;
	Wed, 8 May 2024 20:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zHOpw1FS1KuqIMtD/11gtpauLVx+8gzcq0ToefX61Sc=; b=Tq
	OFDe5c6EYYwzM8eYj9kQj/YjqNEVQH4icw+Pudw0I4DLs8riYVHKtznutuXMvfxP
	Y/aU/yC3wgEHwmTMDMebDcMB3LdPceu1QzFdLeLkpdzzzu4kcirnX+PlQ3NiLyu1
	BiwPQru9P0xDviOkK3QGiENtP5WB7acQEHVvBilbezauzYTuXez4dRl7u84GpHDj
	H47YR1pjxc7G+o+uTOwqCAIUvsjRspzbpl2r0qAh3kcF8/yyWcSf+W+BegMG3BHQ
	eb4S8jS4ZYWt3KC3SvycIONok0TDU593+N4ET2bhpg6ncv3ypkTRFagGfHmNF+g9
	XBfVB9Mqt3b7yHyZ5l9A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09ejs1tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:06:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 448K6bhI013788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:06:37 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 13:06:36 -0700
Message-ID: <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
Date: Wed, 8 May 2024 13:06:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 38/39] ASoC: qcom: Populate SoC components string
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
 <20240507195116.9464-39-quic_wcheng@quicinc.com>
 <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0HWWRHzjF62aoHv3TqU5TLnPiHUa5_Sf
X-Proofpoint-ORIG-GUID: 0HWWRHzjF62aoHv3TqU5TLnPiHUa5_Sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=992 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080147
Message-ID-Hash: UQUOUK3YCHPJUJNJOTU6EJ4S6S7MKGZ4
X-Message-ID-Hash: UQUOUK3YCHPJUJNJOTU6EJ4S6S7MKGZ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQUOUK3YCHPJUJNJOTU6EJ4S6S7MKGZ4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/7/2024 2:40 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/24 14:51, Wesley Cheng wrote:
>> For userspace to know about certain capabilities of the current platform
>> card, add tags to the components string that it can use to enable support
>> for that audio path.  In case of USB offloading, the "usboffldplybk: 1" tag
> 
> usboffloadplayback?
> 
> same question as before, do we need spaces?
> 

I think spaces are currently used as a delimiter, so I'll remove the spaces.

> And if we have controls, why do we need component strings? The component
> string is not dynamic to the best of my knowledge, this could be
> problematic if the card is no longer capable of supporting this stream,
> while a control can be updated at will.
> 

Maybe I misunderstood your comment here:

https://lore.kernel.org/linux-usb/925d7c03-c288-49a4-8bcd-395b32810d75@linux.intel.com/

At the time, I didn't include the kcontrols on the USB SND portion of 
it, which was added after this series.  My interpretation was that there 
were userspace entities that could query for general information about 
what the card supports based on the components string, or sound card 
name.  I treated this as an independent identifier, since the change to 
add the offload capable jack was present.

Thanks
Wesley Cheng


