Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E288FBFB9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 01:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AA993A;
	Wed,  5 Jun 2024 01:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AA993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717542877;
	bh=y1mTtAlH2HuLUf25v/LySlH6akxKBu02tXMnW6gHWHk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IsbnGkQ+MPjb8trk8gcaWNjZyHiDCNbZ2c84iNcQbf5x6xciyME0wG4mdD4+yim+W
	 5YW1U6BWTkjwrXRzDJTrf0GeAR1FFWOcTy9HzCUN5uFl01O5DPWFSq+6pitmpOb8nQ
	 e9rahA6vDfAH/J4d/e4UEUG4C6Fuok9hAT371Kqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40E1FF805AA; Wed,  5 Jun 2024 01:14:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 979DFF80578;
	Wed,  5 Jun 2024 01:14:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46E5DF802DB; Wed,  5 Jun 2024 01:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4877F8003A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 01:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4877F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SwPFvpoN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 454LD832000945;
	Tue, 4 Jun 2024 23:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1mTtAlH2HuLUf25v/LySlH6akxKBu02tXMnW6gHWHk=; b=SwPFvpoNZE7dHwJc
	ir+h/O60rTin1bD+0PHOMpC9/sUgAnNqvY9cQW4X000flKMiH3YDT9DyymYl0DwB
	09clSjTJOetJWuB4GY3TNMPBnqVZc9+XVezXZwir6gj5oOAz8Kd9iXGxTP1zWGh3
	dZYgkS+NFueMl8QBhbmR9g34NjdOZDx9my8PcMJMwxsF7pmHPBjo0yMhB3LjMRRe
	7dFgx0Y3SKesHvvZB+PD5XfYgX82JwtF4qeqQpySF/c+yagt/YWd2cNJIVzNYXo6
	L4nQtMmve4rbOmQtknGF5iMArAVUhjcC9oGIoOH22E0HZxAGVSfUdmfE5OpEiUJq
	xwvB6w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjan2g5yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 23:13:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 454NDuo6025285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 23:13:56 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 16:13:55 -0700
Message-ID: <40e65895-fc87-4754-ab5c-29d7c95b6d17@quicinc.com>
Date: Tue, 4 Jun 2024 16:13:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 03/38] xhci: sideband: add initial api to register a
 sideband entity
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, <srinivas.kandagatla@linaro.org>,
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
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240524001043.10141-4-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vwSx6Pp3ZiBFJUsFcI3mthVu9lAH8gPT
X-Proofpoint-ORIG-GUID: vwSx6Pp3ZiBFJUsFcI3mthVu9lAH8gPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040188
Message-ID-Hash: ZI4BUDKRBD6QLVMJ72X7Z3HNZEGXBEVY
X-Message-ID-Hash: ZI4BUDKRBD6QLVMJ72X7Z3HNZEGXBEVY
X-MailFrom: quic_jjohnson@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZI4BUDKRBD6QLVMJ72X7Z3HNZEGXBEVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/23/2024 5:10 PM, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
[...]
> +EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
> +MODULE_LICENSE("GPL");

Please add missing MODULE_DESCRIPTION()

