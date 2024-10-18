Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9A9A3196
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 02:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7563F93A;
	Fri, 18 Oct 2024 02:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7563F93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729210079;
	bh=D9ULUqk+TbUqMTKGR0bFo25YiiZ2cs6nBE1a1b8WqFQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SzWkPAfCr0jeDEBRKNrw4V2hOsf2TECafbGq3fFkV3TBXmrs2j7OB2RcGxHNd01gj
	 ptcs4697F8hHDOXPIO1aGKhRYj4SQyNdhhBE9f3TiNQXboeeSTGDtKlXDQQN9kMUdT
	 GMSr9jC4EJwE+Wwux9kFH+ZHozs7XMqQSfCBVQgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCD43F8058C; Fri, 18 Oct 2024 02:07:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B4DF8057A;
	Fri, 18 Oct 2024 02:07:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B0CF80448; Fri, 18 Oct 2024 02:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14F6CF80104
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 02:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F6CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=RX9Ouqrq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49HDcuMX016699;
	Fri, 18 Oct 2024 00:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxBavpTgL71vWYYy2sA8sf5j3chQYVV9GD147SGaeIE=; b=RX9Ouqrq4NFVay6j
	q4ttG0ZDVQRxiFHqWMz1ETLYdt9a14mSskOsu4TE50T7xoN7Yz1fi1sDfPZMXDCw
	Nid3g40KR97d0eIZ6brHzq3xJa0t7AKSCcSoS1FsTDUta85y2SVt5RKKQm0XC+UZ
	ftQLUofQozfcyUcqlpajRTWKzTMpeConXTyXCrqh/KO8LjdXl+5S0psOcWaD3SwG
	eOo+yjKkMRzwm4hTVhc4CuOPc0GaEqSVtAgn1QRp3uyc4I+1HGARPsbBQgpR7NKS
	e8ZqYMKHlVOTbVP2mGtD6UeD4JYw2esaE4AGL3vN9Ffk9mC3fy0oma7dgzZ3FTyN
	IRBG3A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6pdcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 00:07:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49I07EUv021198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 00:07:14 GMT
Received: from [10.71.112.85] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 17:07:13 -0700
Message-ID: <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
Date: Thu, 17 Oct 2024 17:07:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD
 for secondary interrupters
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2024101747-defog-squiggly-ef54@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IbNrRGE8x9UV4v1k3a1frmTMQ3tDVf0N
X-Proofpoint-ORIG-GUID: IbNrRGE8x9UV4v1k3a1frmTMQ3tDVf0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=607
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170163
Message-ID-Hash: HJ7VNIMEKVNXQTQKWPPTBHFJF6W76M27
X-Message-ID-Hash: HJ7VNIMEKVNXQTQKWPPTBHFJF6W76M27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJ7VNIMEKVNXQTQKWPPTBHFJF6W76M27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On 10/16/2024 11:40 PM, Greg KH wrote:
> On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Allow creators of xHCI secondary interrupters to specify the interrupt
>> moderation interval value in nanoseconds when creating the interrupter.
>>
>> If not sure what value to use then use the xhci driver default
>> xhci->imod_interval
>>
>> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>  drivers/usb/host/xhci-mem.c | 8 +++++++-
>>  drivers/usb/host/xhci.c     | 4 ++--
>>  drivers/usb/host/xhci.h     | 5 ++++-
>>  3 files changed, 13 insertions(+), 4 deletions(-)
> This is already in 6.12-rc1, which makes me confused as to what tree you
> made this series against.

Sorry, I didn't fetch the latest changes from usb-next.  In this case, should I rebase and resbumit?

Thanks

Wesley Cheng

> thanks,
>
> greg k-h
