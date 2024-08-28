Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F061963092
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 20:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61317EC0;
	Wed, 28 Aug 2024 20:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61317EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724871597;
	bh=2oNMMsYsI+j+ejHVU5D5R1OZsviLXTfVtcjUTwfydlU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a9napSN9ntRNJ6A01AMfv6XAG4iHDLqHHA/M3qhrzuLDqeHkaX2HV+X02G8EOUy/S
	 DlR8tsOQFMQAD/ADkDFthI3cnVvzsn/JPgvYhceWJYI9gnqQN0fhJLEe1S4JsplxMn
	 m/3wSePyxn4YDY/yPNn6GAdwa+ipV2bw6QNP+FvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E17EFF805B1; Wed, 28 Aug 2024 20:59:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E34A5F805A1;
	Wed, 28 Aug 2024 20:59:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF62F80518; Wed, 28 Aug 2024 20:59:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A45DBF8025E
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 20:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A45DBF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=O0Xmz5bf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47SAiFvp020336;
	Wed, 28 Aug 2024 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+bp9nEmFMTVmWQTMXToBGklbro1PYiI6dvNZl24hjw=; b=O0Xmz5bf0/grb8CI
	bmXJR3TuhNpmeW4y21GNl1aEjQWl4aC+Zw12rl2gx9sHLwPb7UzoUi+A1JeaIMLb
	rJ6isSaBm9Rl5FQdWhMYTdDmDF/n1f2uzeX/WySv7ubqzQXaZakKtu+xG28hZAya
	qZubyj/54hHBgPJkUMf5boHQwa++N1WfMKVJzk9DFGVCTbvx8m+uhz0pWzYKXFPc
	CXtqn48VSVLt1A+pBcpA/Gcelit/+bFyltIEJpusDE4/9/tHlGo7c5XfaMWNL2Ze
	CUqHbpZ500s9jmP/u/1KKejrfapEoiLd7x84f/1mkz2Qm9YYtasGJavo6hOse+wN
	uGNWIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puttu87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 18:59:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47SIxEYk019455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 18:59:14 GMT
Received: from [10.110.100.101] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 11:59:13 -0700
Message-ID: <d44634b7-1285-4771-b7e0-4e852224d13f@quicinc.com>
Date: Wed, 28 Aug 2024 11:59:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 31/33] ALSA: usb-audio: Add USB offload route kcontrol
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-32-quic_wcheng@quicinc.com>
 <4149884a-7c60-40d8-848b-8876f16d6d7f@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4149884a-7c60-40d8-848b-8876f16d6d7f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X3n_XKtTrJz3EB77-0EvdjKlg6OlyTSW
X-Proofpoint-GUID: X3n_XKtTrJz3EB77-0EvdjKlg6OlyTSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=544 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280138
Message-ID-Hash: JCTN6WTKLGWA74MODHD26IZQ4HACMSBR
X-Message-ID-Hash: JCTN6WTKLGWA74MODHD26IZQ4HACMSBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCTN6WTKLGWA74MODHD26IZQ4HACMSBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/26/2024 2:09 AM, Pierre-Louis Bossart wrote:
>
>> +config SND_USB_OFFLOAD_MIXER
>> +	tristate "Qualcomm USB Audio Offload mixer control"
>> +	help
>> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
>> +	 This exposes an USB offload capable kcontrol to signal to
>> +	 applications about which platform sound card can support USB
>> +	 audio offload.  This can potentially be used to fetch further
>> +	 information about the offloading status from the platform sound
>> +	 card.
> I would remove reference to Qualcomm for this Kconfig, all the code
> seems generic to me? Probably a left-over from the previous version.

Ah, yes will remove any vendor stuff.

Thanks

Wesley Cheng

