Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D7905C03
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 21:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E7BB6A;
	Wed, 12 Jun 2024 21:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E7BB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718220683;
	bh=/ZMFjzeP+3mUcXmt5IOmYEwCnOMMsnMaPprtQmPzmHw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nd44YljmSF97owaUl8ZfiyKsRhECbKoCLkTmf2+Ocl7fwuf8u9IzYjJOou9Ioh+UA
	 KWopMm3y4AWPxoHVgAs+5d/XgVYEND64Fbu5XlqRj2ksHKNI3SxgMUyRqBoKqKrj84
	 3VnXmTq93/g4hXm+kV+MdQ6Pe/aAGTCH3c+bbc5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D51D2F805B5; Wed, 12 Jun 2024 21:30:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F879F80579;
	Wed, 12 Jun 2024 21:30:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4066AF80580; Wed, 12 Jun 2024 21:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96A84F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 21:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A84F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DxcjmtRq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45CDqm4x019114;
	Wed, 12 Jun 2024 19:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OweUuhdB9244WWdTLOqzMSffQaKHTaN0TxH31JMWZuE=; b=DxcjmtRqGYLq0qXS
	uismcLWhlL8oqdZzIskTBCPVUQ9DwMbvuxWQz0l9GvhYWDCGv2wUwzjc1+NZx6sY
	9Jj2iWcyz+9Z6/Fd+pwSubb1njHGlaidjEWebXJlPdya6h1MqrvjYqIPOSXkmT28
	3XK4jAs9mk3YVU6w2zqht0IQCnzTOQ1a+TORTN5FQDQo82HAO67pjSeW7KM3PIcI
	EwSi04aODYVBK81JhtcR+LqAixgeyFESdlnW5JAZgZIgHh7hxgHySgRKoU9/w/pu
	lUnRe0v0adiBkvscH/5d/k2EFfI56JWLAeEAZITJwKJ85LH+zqRAr7aom7wmnPlo
	X0BDHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqcxth268-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:30:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJUUXh011599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:30:31 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:30:30 -0700
Message-ID: <99457050-9848-03cb-0242-bd9448ea8f6c@quicinc.com>
Date: Wed, 12 Jun 2024 12:30:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <ZmmTr48zLCxRVlYf@archie.me>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZmmTr48zLCxRVlYf@archie.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ARVEH-kmyglR5rfomLqcwZY1_ab7eAOc
X-Proofpoint-GUID: ARVEH-kmyglR5rfomLqcwZY1_ab7eAOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=793 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120138
Message-ID-Hash: SEPQC2ODGCPDCGGMBXPFXISAQLWRMVZX
X-Message-ID-Hash: SEPQC2ODGCPDCGGMBXPFXISAQLWRMVZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEPQC2ODGCPDCGGMBXPFXISAQLWRMVZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Bagas,

On 6/12/2024 5:25 AM, Bagas Sanjaya wrote:
> On Mon, Jun 10, 2024 at 04:58:08PM -0700, Wesley Cheng wrote:
>> +Overview
>> +========
>> +In order to leverage the existing USB sound device support in ALSA, the
>> +introduction of the ASoC USB APIs, allow for the entities to communicate
>> +with one another.
> "... ASoC USB APIs are introduced to allow for ..."
> 
>> +USB Audio Device Connection Flow
>> +--------------------------------
>> +USB devices can be hotplugged into the USB root hub at any point in time.
>> +The BE DAI link should be aware of the current state of the physical USB
>> +port, i.e. if there are any USB devices with audio interface(s) connected.
>> +The following callback can be used to notify the BE DAI link of any change:
>> +
>> +	**connection_status_cb()**
> "... connection_status_cb() can be used to ..."
> 
> Thanks.
> 

Thanks for the review, will update

Thanks
Wesley Cheng
