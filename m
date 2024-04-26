Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA88B40A6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 22:04:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0389AB71;
	Fri, 26 Apr 2024 22:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0389AB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714161873;
	bh=4Y/1SNbJpP6Iq6bpaDNDG2do5EqjdK+s/ofDm4Cz0GM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imPHOVRvkAZitoFpUzNKqJXGJBnhC+FfjlMHB6joRjOIWE4e7JlwuXcsO4ZYIudol
	 F1aEY4Pn91BlZYSjOiuK1MQfvNVn0KWrAa2tDluj7CkFxUQyLlXddhoHv8Bbok/8ZZ
	 n05zmcU4SISa0sxMAreO6IWxKnRWFVBLRUW9RMyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75C40F80589; Fri, 26 Apr 2024 22:04:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA72F80579;
	Fri, 26 Apr 2024 22:04:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E60BEF80423; Fri, 26 Apr 2024 22:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE6ACF8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 22:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6ACF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LTutAkMA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43QCBwdj013759;
	Fri, 26 Apr 2024 20:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CVAZFTsLc+ZUqoicJEH8S6rIGArbQdqBeftallr55BM=; b=LT
	utAkMA83j3mmHOC5EsZVXQFScJhAWIiDmS8EZZ4zx+ionvatYbvZqsiDHEfColcc
	7kCdPpAoqcqMyi/cELiDp7YnXq5mKUSf9pFl/VQ+68TA1K2PDLZq14FrAsdZ+sRc
	5I1uSrAgY4z0vN/tS46aJGRrZPqzUNRhGPORUtSInegHg7NHitHelXU6yuFRRa7O
	slbqL4ICvyNl4k9ruQfB6OGdpY9qYtwxiITczJ+mBsayfGrEqrVO/u7akFNr/c15
	w9OA2Gv8q9x0tF4yvDw54aMxyIEqQjy8rk+zm79qCigYm90O6E38t9ED39FwJ7aV
	s4VUIExgbu0B8W4k2QJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xr35ettv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 20:03:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43QK3Hd7016370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 20:03:18 GMT
Received: from [10.110.6.235] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 13:03:17 -0700
Message-ID: <a24aac59-961f-0a1a-4558-61e333c6fa7f@quicinc.com>
Date: Fri, 26 Apr 2024 13:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v20 08/41] usb: host: xhci-mem: Allow for interrupter
 clients to choose specific index
Content-Language: en-US
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
 <20240425215125.29761-9-quic_wcheng@quicinc.com>
 <60c17b0c-8069-4019-b062-3b3cb892297b@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <60c17b0c-8069-4019-b062-3b3cb892297b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g6oaGlBmz1dhPebrOegIfxkgZhb6mMgK
X-Proofpoint-ORIG-GUID: g6oaGlBmz1dhPebrOegIfxkgZhb6mMgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_17,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=718
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404260139
Message-ID-Hash: YLC7QV6PBQKYAEYWECQI2FRODHXPVMQM
X-Message-ID-Hash: YLC7QV6PBQKYAEYWECQI2FRODHXPVMQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLC7QV6PBQKYAEYWECQI2FRODHXPVMQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 4/26/2024 6:24 AM, Amadeusz Sławiński wrote:
> On 4/25/2024 11:50 PM, Wesley Cheng wrote:
>> Some clients may operate only on a specific XHCI interrupter instance.
>> Allow for the associated class driver to request for the interrupter that
>> it requires.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> 
> (...)
> 
>> -
>> -    /* Find available secondary interrupter, interrupter 0 is 
>> reserved for primary */
>> +    /* Find available secondary interrupter, interrupter 0 is 
>> reserverd for primary */
> 
> You introduce a typo in here.

Thanks for the review!  Will fix it.

Thanks
Wesley Cheng
