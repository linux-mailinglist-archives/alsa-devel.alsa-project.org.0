Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769892AC81
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 01:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A441852;
	Tue,  9 Jul 2024 01:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A441852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720480650;
	bh=ot1u6OTzxoyDTwo+eK/wbJjVct3Ek2PtZgKlmu5NiR0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XRJc1ok8CZ2y3S6oV1/yxwU5ZXV8moHPW4FYmaziDtorHP1B3q/gZRCTgbPZMvAED
	 0z3L0ORRPQKYVC5Rw1y6yaaUb2MYh70aLqQTBywKQ81QIAtUhwNE+7CiUKbGQ/yH6J
	 u5vwizet9CGnUeA1jEL5gj93a4BhKtA0ZEd5mNl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7F06F805B6; Tue,  9 Jul 2024 01:16:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC92CF805AA;
	Tue,  9 Jul 2024 01:16:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ECD1F801F5; Tue,  9 Jul 2024 01:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 407DCF80074
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 01:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 407DCF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=gpER7pGo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 468BNucm015979;
	Mon, 8 Jul 2024 23:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ot1u6OTzxoyDTwo+eK/wbJjVct3Ek2PtZgKlmu5NiR0=; b=gpER7pGokSnPyMBQ
	E0hK8d59ydXgFrXdwqvaoPS6I9NqI3c6kNDqEeYVKTosJGdhxshJeoTaLDp1dn26
	GaRqk8LR+SGWXqIfXhC6YNYpFPxtx8yw6hv6jonZAyIpzhkE1VaqZvW7UyjOBWmt
	OQaj2fnRxqC6vzfgzVKZ6MahNyRA3YEmSHvfExQtGn3koviqQJxtrcBqF9ZU4Dqh
	NVm2dopJ/zWn7+KsHOA++XIYmYNRgr+yRXgmFBYFUC4mFIlnsSVhbNaxaWIo8Uj0
	45iY2rahdcKvNQz1hXhYbBc78rX/gigM2r5voKu274PqUpwrXF/hbWpmFgDy8sW9
	4cEXMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hcnwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 23:16:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 468NGdZ6015320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 23:16:39 GMT
Received: from [10.110.59.6] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 16:16:38 -0700
Message-ID: <3634f704-a496-4341-a01d-07182248eccf@quicinc.com>
Date: Mon, 8 Jul 2024 16:16:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
 <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
 <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
 <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
 <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
 <ccbf9366-f3de-4a80-bffc-e32a8409e1a7@quicinc.com>
 <adb4e27b-b328-4eef-87ca-9b8bad6639e6@linux.intel.com>
 <f9923336-3dd3-4f36-b5f6-f45f4ed09e0c@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f9923336-3dd3-4f36-b5f6-f45f4ed09e0c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: v9mYHUxrcmua7d02H3O-1kesImQnOIF4
X-Proofpoint-GUID: v9mYHUxrcmua7d02H3O-1kesImQnOIF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_13,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=713 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080173
Message-ID-Hash: 2GGEW7PR26WKG5GXUIJ6SHT6WQ4SGPS4
X-Message-ID-Hash: 2GGEW7PR26WKG5GXUIJ6SHT6WQ4SGPS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GGEW7PR26WKG5GXUIJ6SHT6WQ4SGPS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/4/2024 4:25 AM, Pierre-Louis Bossart wrote:
>>> Just so I understand...is it really desired that userspace doesn't
>>> have the flexibility to choose which USB device is offloaded?  I know
>>> it complicates what needs to be done, but it could be just an
>>> additional feature that can be added later on.  Again, by default, we
>>> select the last USB headset plugged in to be enabled for offload by
>>> default.
>> If it chooses endpoint by itself perhaps you can send patch set without
>> controls first? This has added benefit of less patches in series, making
>> it easier to review and it won't block whole patch set by discussion on
>> controls feature. Controls can be added in followup series.
> We do need read-only controls for userspace to know that offload is
> possible and which card/device to use. That can be done in a first step
> assuming there's a single device plugged-in.

I agree, some kcontrol need to be present to at least determine:

1. USB SND device is offload capable (ASoC card and PCM index)- Fetches associated (mapped) ASoC platform card and PCM index (read only)

2. ASoC platform card offload status - Current offload status (read only)

Those would be the minimum kcontrols we could have at this time.  I will remove the device selection part, and leave that for future discussions.  Does this sound good, Amadeusz/Pierre?

> Dealing with multiple devices and defining rules or configuration
> options to select the offloaded device is a second-level problem.
>
> In most cases the only thing that will be offloaded is a headset
> anyways, so the selection could be rather static based on a
> vendor/system ID, all other USB devices would be ignored.

If the USB SND offload driver (ie qc_audio_offload) isn't compiled in, then it would be disabled.  Do we need some over-arching mechanism to disable the offload functionality?  Although, one thing I can see if I can add is some device classification within the USB offload vendor driver.

Thanks

Wesley Cheng

