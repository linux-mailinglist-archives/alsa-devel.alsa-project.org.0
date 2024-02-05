Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A784A755
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 22:28:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC2F182C;
	Mon,  5 Feb 2024 22:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC2F182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707168480;
	bh=WF79LcyptTYwzEhU/Gz6Jrq78t2eREqNKLqqvgDivhE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgyvS6k+mh36LlYnuo0YW6dhnY9W8tExlf63CxOwle1QKnYM81yWRY60jgk5mM/VT
	 Xdn3DVSBRgqqD8QxEWBbXniudSere34xrAEqqXx9ePRAAZake78nq5B4joj+OVJeJq
	 i8lPjHjgWLlOrDdGnA91RDL+30qNg6k4M/ZyR1qQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B5CF805A8; Mon,  5 Feb 2024 22:27:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F542F805A1;
	Mon,  5 Feb 2024 22:27:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88F36F801EB; Mon,  5 Feb 2024 22:27:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44414F8016E
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 22:27:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44414F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=E0XU/KjY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 415KZpZL013684;
	Mon, 5 Feb 2024 21:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=80XiqQagWrXSjkbFB7IZMeTVBIcws+/+UsrZOrDK37I=; b=E0
	XU/KjYVh5bclOJjOXgEj6T88+d0afhkJxj5YaelqQJ+m8FOEjWzsdu3CIHAI+ZIk
	jcwrtkEBcGhxNA9Qho3kXxKyzNE3HbI8qLUZdGrl89ScoD8hFJP8p29DjDZH0D4W
	SxB1pWPjN7t6dxhNPoX46jk/J3EPisOLhOpOYtlSSzUhHHdJqS3SmY9I25oCMAmt
	mnpp5hbnmSXzctKtYbTmgxpSvAxDIpfRvXa9fQtWdh7Rrs08s3L07CJ7ac5suS9R
	TGMIs2jrQk94HnbFTsZLYD7+JvjMU438r/HQ9KxgsNcp4fDa7/oAaZrym2m5ZysC
	NSkqWMWXECqDA8u+dnOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w32s1rqj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 21:27:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 415LR6JQ011461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Feb 2024 21:27:06 GMT
Received: from [10.110.7.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 13:27:05 -0800
Message-ID: <c5e9419d-1d16-4816-4fd0-c23c5eb358e1@quicinc.com>
Date: Mon, 5 Feb 2024 13:26:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v13 20/53] ASoC: Add SOC USB APIs for adding an USB
 backend
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-21-quic_wcheng@quicinc.com>
 <2abb6c0b-ea66-4649-b205-bafe49340aee@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2abb6c0b-ea66-4649-b205-bafe49340aee@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kbmUi6lAuyvjf1WEfxhQ6nHGodNDySsr
X-Proofpoint-ORIG-GUID: kbmUi6lAuyvjf1WEfxhQ6nHGodNDySsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_15,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=756 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050160
Message-ID-Hash: KGPHYLD26TD6PSWC4LSXM5RIFDCYMHAF
X-Message-ID-Hash: KGPHYLD26TD6PSWC4LSXM5RIFDCYMHAF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGPHYLD26TD6PSWC4LSXM5RIFDCYMHAF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 2/5/2024 12:20 AM, Amadeusz Sławiński wrote:
> On 2/3/2024 3:36 AM, Wesley Cheng wrote:
>> Some platforms may have support for offloading USB audio devices to a
>> dedicated audio DSP.  Introduce a set of APIs that allow for 
>> management of
>> USB sound card and PCM devices enumerated by the USB SND class driver.
>> This allows for the ASoC components to be aware of what USB devices are
>> available for offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> 
> ...
> 
>> +
>> +/**
>> + * snd_soc_usb_add_port() - Add a USB backend port
>> + * @dev: USB backend device
>> + * @priv: private data
>> + * @connection_cb: connection status callback
>> + *
>> + * Register a USB backend device to the SND USB SOC framework.  
>> Memory is
>> + * allocated as part of the USB backend device.
>> + *
>> + */
>> +int snd_soc_usb_add_port(struct snd_soc_usb *usb)
>> +{
>> +
>> +
> 
> Cosmetic, but why is there white space between start of function and 
> body of function?
> 

Thanks for catching this.  Will fix it.

Thanks
Wesley Cheng
