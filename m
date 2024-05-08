Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E628C07D3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 01:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8555DDF8;
	Thu,  9 May 2024 01:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8555DDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715211663;
	bh=XHxrjqFEAkxk0OlBRxqEri56L1j3vEZ5UCKWMemhFoY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lyo6kj08DNHwoS+1l4jYGYWCU8tgHhOuJ5V0RPJzjeYf1SSpHfTJeXucUovprAVXl
	 1PfQ50nBoCrwFlQc2Qy+ZYWBa5izXqnN+HJWQ05wa9reD1/RTVP+8f/7osMECQEJMn
	 8dCg+n+5mZMxJ0DmKYtwLHq36nPmt9RAz6bYsQQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C281FF805AB; Thu,  9 May 2024 01:40:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E329EF805A0;
	Thu,  9 May 2024 01:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5984F8049C; Thu,  9 May 2024 01:40:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F88CF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 01:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F88CF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=fDsVxjMN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448NBoxd006086;
	Wed, 8 May 2024 23:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9HgzBBw6z3F0SqH/OB4mEKC34o1ooj2L1DEYGdkaaEU=; b=fD
	sVxjMNSuHybRUy6+brZOY1gM/KUZi8j+dfZjeMB62qyunphXs9n9ILxQeBL15v5L
	r1XLpLcZF6uQFiSF0+vdlPv6cvUuQNcF+oSx+CebdN+Wg3KRC37iYzZR8azTgBf4
	SjrUO5gBhDA9unGeALeg/cf/fqJucuY3vSXVJ7Qbsx8PrwZkIBobscb8943LKgwH
	Y6x+lSGwvlNMMoLQWz5d5q8KMNnYwJXjbAjgc1+34eFSDdD65oKsc9CrlLqH5TO4
	sD9TwBoEXXIwHKuUjullzRUdvzLnvWhaRe9+3dhGhhpfXf5eqPfH3dRgxZfrnsS9
	/rmUkhgl2GxPcpnKLAnw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u8sjhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 23:40:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 448NeKHf008061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 23:40:20 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 16:40:19 -0700
Message-ID: <066fe096-a9d3-2498-275d-185f709e9a02@quicinc.com>
Date: Wed, 8 May 2024 16:40:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 22/39] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240507195116.9464-23-quic_wcheng@quicinc.com>
 <1e98935e-e35a-49e0-bbbf-ff326d40b581@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1e98935e-e35a-49e0-bbbf-ff326d40b581@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mvZrtfZJK2u-V9ExiU9H9B2lUv-rtHBK
X-Proofpoint-ORIG-GUID: mvZrtfZJK2u-V9ExiU9H9B2lUv-rtHBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=821 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080177
Message-ID-Hash: RHLI3Y4MQVBUSCOFFM2ESHQNWVXPCP5G
X-Message-ID-Hash: RHLI3Y4MQVBUSCOFFM2ESHQNWVXPCP5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHLI3Y4MQVBUSCOFFM2ESHQNWVXPCP5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/7/2024 2:20 PM, Pierre-Louis Bossart wrote:
> 
>> If a PCM device is already in use, the check will return an error to
>> userspace notifying that the stream is currently busy.  This ensures that
>> only one path is using the USB substream.
> 
> What was the point of having a "USB Mixer" then?

The USB mixer is intended to enable/route the USB offloading path to the 
audio DSP, and is for controlling the ASoC specific entities.  This 
change is needed to resolve any contention between the USB SND PCM 
device (non offload path) and the ASoC USB BE DAI (offload path).

Thanks
Wesley Cheng
