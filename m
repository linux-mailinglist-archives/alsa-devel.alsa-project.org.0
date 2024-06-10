Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF1902C8D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 01:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A778826;
	Tue, 11 Jun 2024 01:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A778826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718062661;
	bh=9cEJOPE2RpbqEAENzqQsuPtohaf5MRTGcoYQvOo+FjI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R4YabNU/NPTONgiGgbINXcb60mkzLr3ocVMOdL467aTwkbklQSXda5uhzkx/c/NxD
	 nf2dEIV4puOrZr/psxwDJp9Yk7J2ZkVOJnjlWabMaK6bamTxY88dnncfcoU9ErZX9Z
	 LaGKeqvsCbxw0wmT+KpXQYy07aARpnpiLubAQ66E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D45CF805BB; Tue, 11 Jun 2024 01:37:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A610F805A9;
	Tue, 11 Jun 2024 01:37:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E261FF80580; Tue, 11 Jun 2024 01:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8815F800D0
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 01:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8815F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MWnef0DN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45AECaKx021412;
	Mon, 10 Jun 2024 23:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EO1UzCQ1xrz9eOEjnbCgqr2cmZlDFwe8lIz5c9cEIyc=; b=MWnef0DNKfKuZ1fK
	ZN7ZGdRFVpslCF4wZONOZE2y/ZkEUFZJ/uqpTd5LldQbE9h/A5piYfoDpMmCk6RI
	FoQrmMwM58/i7bmBmO0qYrxYtifVE5pOoZsL20CHGW8MQLNF4Ijh7MZfiKZJ2A83
	3QEhUR4klMRN6HPtVPOsAWTfKh5HORUoQ9JTWeCUatBVtagx1SbuGPYFeKdhW4R3
	KOkW/hKI0ZxJKk5X+98E5K5O+wwMoEful11F8bc5I+qTkm8WWc3uG57/wq8+/Vuh
	L0TFbPGUv/ZLPfb1m8fm1q4UGUyW8Nl+0DvvFwHGFM0YoJxngT33fJYdk8LEIx2s
	UoTrQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8vyd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:36:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45ANapJU028562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:36:51 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 16:36:50 -0700
Message-ID: <de13199e-1c3f-df75-6357-d3c2333fc43b@quicinc.com>
Date: Mon, 10 Jun 2024 16:36:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v22 03/38] xhci: sideband: add initial api to register a
 sideband entity
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
 <20240524001043.10141-4-quic_wcheng@quicinc.com>
 <40e65895-fc87-4754-ab5c-29d7c95b6d17@quicinc.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <40e65895-fc87-4754-ab5c-29d7c95b6d17@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _L7t0l-o42xEQg3DEh7wPU1rsmp4SbO1
X-Proofpoint-ORIG-GUID: _L7t0l-o42xEQg3DEh7wPU1rsmp4SbO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100175
Message-ID-Hash: ZXKSB7QSSSWAU5K4YOKDAXJLEP43Y2AA
X-Message-ID-Hash: ZXKSB7QSSSWAU5K4YOKDAXJLEP43Y2AA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXKSB7QSSSWAU5K4YOKDAXJLEP43Y2AA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/2024 4:13 PM, Jeff Johnson wrote:
> On 5/23/2024 5:10 PM, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> [...]
>> +EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
>> +MODULE_LICENSE("GPL");
> 
> Please add missing MODULE_DESCRIPTION()
> 

Thanks, Jeff, will add this to the drivers that need it.

Thanks
Wesley Cheng
