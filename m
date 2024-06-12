Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1C905C30
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 21:42:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BCDB60;
	Wed, 12 Jun 2024 21:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BCDB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718221361;
	bh=pDSZX9Af0xVAg7LLNOszTGqVEN82uIz8zv48UiJ6S0M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gh1eCUV/chVSlWyVpDYwOVQ9L2jAvWvJFpeHLfZOADFVwWioPFddCrAkZiwZYfLL+
	 kCTUUu6ufGblN624JtevbtyWIRwbERlgs8z3bZicb/wCndMqUHrmRvViiY0SdgNPAD
	 1JYNxQl8YLKQaLjrYVodgjDwioiI8kgBZVqJCjKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DE72F8058C; Wed, 12 Jun 2024 21:42:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD037F805B3;
	Wed, 12 Jun 2024 21:42:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75D7EF8057A; Wed, 12 Jun 2024 21:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2EC8F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 21:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2EC8F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=W/uDea87
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45CGP0sX011626;
	Wed, 12 Jun 2024 19:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdJiCwseTYEbH67fNg3E7Ksutmzps8Sc9w3Of4YBUg4=; b=W/uDea87Eq/bxFk+
	k7GEaJmZEuucMsc8CRnC0CjZMr2jOm9a8+xmhIk0LsNnOIXNkWAthHGg2wOCzO83
	SXJU3h1qWYT+ZUlLBliF/j7QWx2NX+J4Ns7iwWGOjiH0g3Dfina6mh+wNkaMheK9
	Z23bEGO4WgGwr0nQaCKk+82KQzrd5MGah3CVYslGVFx9ScGjUnY9ivu2fQU3PtgE
	AicnAdDq/t4Z5aKOGfQXBOyE6pL1O/tYeihBLxVcEtwmT7kJ5jygcxo2042aKdR8
	S9exrw6YXtb3L7lZcpsDk9AXcus9VE3F3Q4FLP9tOKl3rIzDstA6ZdV7h7xoDPwW
	efF4OA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq83wha90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:41:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJfsI4025685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:41:54 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:41:53 -0700
Message-ID: <093fbd61-1687-d3fd-7a0b-9d8c8c6391eb@quicinc.com>
Date: Wed, 12 Jun 2024 12:41:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 00/32] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
 <fabc7ac8-6c44-4395-bd16-59257a949e9b@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <fabc7ac8-6c44-4395-bd16-59257a949e9b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DNRhbyszMdFqqGGLMNOftX4yZCUTolrU
X-Proofpoint-ORIG-GUID: DNRhbyszMdFqqGGLMNOftX4yZCUTolrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120139
Message-ID-Hash: GGW5TVY5E64AKIN5A7COVDUZC7ZB6O27
X-Message-ID-Hash: GGW5TVY5E64AKIN5A7COVDUZC7ZB6O27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGW5TVY5E64AKIN5A7COVDUZC7ZB6O27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 6/12/2024 7:59 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 6/12/24 16:50, Amadeusz Sławiński wrote:
>> On 6/11/2024 1:57 AM, Wesley Cheng wrote:
>>
>>> Wesley Cheng (32):
>>>     ASoC: Add SOC USB APIs for adding an USB backend
>>>     ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>>>     ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>>>     ASoC: qdsp6: q6afe: Increase APR timeout
>>>     ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>>>     ALSA: usb-audio: Introduce USB SND platform op callbacks
>>>     ALSA: usb-audio: Export USB SND APIs for modules
>>>     ALSA: usb-audio: Save UAC sample size information
>>>     usb: dwc3: Specify maximum number of XHCI interrupters
>>>     usb: host: xhci-plat: Set XHCI max interrupters if property is present
>>>     ALSA: usb-audio: qcom: Add USB QMI definitions
>>>     ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>>>     ALSA: usb-audio: Check for support for requested audio format
>>>     ASoC: usb: Add PCM format check API for USB backend
>>>     ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>>>     ALSA: usb-audio: Prevent starting of audio stream if in use
>>>     ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>>>     ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>>>     ALSA: usb-audio: qcom: Populate PCM and USB chip information
>>>     ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>>>     ASoC: Introduce SND kcontrols to select sound card and PCM device
>>>     ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>>>     ASoC: Introduce SND kcontrols to track USB offloading state
>>>     ASoC: qcom: qdsp6: Add PCM ops to track current state
>>>     ASoC: usb: Create SOC USB SND jack kcontrol
>>>     ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>>>     ASoC: usb: Fetch ASoC sound card information
>>>     ALSA: usb-audio: Add USB offloading capable kcontrol
>>>     ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>>>     ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>>>     ASoC: usb: Rediscover USB SND devices on USB port add
>>>     ASoC: doc: Add documentation for SOC USB
>>
>> I'm not sure how other reviewers feel about this, but is there any
>> chance to group patches in some logical order? It is bit hard to review
>> when I need to jump from generic ALSA to ASoC then QCOM code and then
>> there are dt-bindings mixed in between and back again.
> 
> Completely agree. And splitting the 32 patches in smaller sets would
> help as well, every time I want to review I just don't have the time to
> go through 32 heavy-duty patches across USB/ALSA/ASoC.

Will try my best, but I've already attempted to compartmentalize 
everything as how it is.  Will try to first re-organize the patches 
based on what Amadeusz recommended and see if that helps.

Thanks
Wesley Cheng
