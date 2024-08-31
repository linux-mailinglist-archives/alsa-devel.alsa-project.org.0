Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27091966EAD
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2024 03:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 589B5847;
	Sat, 31 Aug 2024 03:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 589B5847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725068994;
	bh=COgP8gtOwj9866IMzZkzcjlN1M8qSRLRfPhLqL3mK+A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NTwxpRLpFf+nXzzZwQk0NP4tIKmghQNvefBP6YN1ZcvcrR3fE1YX8Ppqh6r71qRse
	 QpRwmW6tcCyHoMvg49MThewE9SVUyEzpJ3NQUSt3kaYIE75RRW+apuzYHwTms1yxcG
	 2b6U1nQnlA6ZTTiJYIt3fPb/tP3N+bPSRhHh8xt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C73F805A1; Sat, 31 Aug 2024 03:49:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D99F805A9;
	Sat, 31 Aug 2024 03:49:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1745FF80518; Sat, 31 Aug 2024 03:49:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9059F8025E
	for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2024 03:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9059F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=U38Ldbdo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47V1lkCb014463;
	Sat, 31 Aug 2024 01:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/G28frVMVZQFN7ykoLWCfBQ91+/BjNk3d7oGSSViOkc=; b=U38Ldbdoft5FS4jS
	FGIsftdcLD4R5LALOdJe2Li7yl7bWJvSriY7C9/G/+b2IK9+QjkqGIiVBYrTkZsR
	PRGTGPvaYjKET9r1vOCxCMbK78Y61p8w87LfVDb36fYtdtULvClkUIdZKlYwq7bo
	tCwbdc5ZiuKt73Cn5wZqffSM78SIe+FZb9LRqUxDbC6mwibL4bKg61Q9oP4xZOta
	T7c3Vmk7//oXhqdDoGDrMf6uFSNyMLho9KtGjoR0wxluNRbq75VTxpHPQi0a4eZ5
	ToqbLViLcOGzVvK6la1BowVyWCz3t1ZD+0WTA9PQKQ2uBFITbNdq86NqjybH8IXd
	f/i8bA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ax4mm825-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 Aug 2024 01:49:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47V1nBQb020803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 Aug 2024 01:49:11 GMT
Received: from [10.110.4.92] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 18:49:10 -0700
Message-ID: <b027dd79-56e3-40d8-a4ca-779b4b5914c5@quicinc.com>
Date: Fri, 30 Aug 2024 18:49:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 16/33] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-17-quic_wcheng@quicinc.com>
 <522dd841-2060-4e7c-b8ce-7e9ea2fa8498@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <522dd841-2060-4e7c-b8ce-7e9ea2fa8498@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZLPf2EcXuyfBRx9vfV8fRBTvbL_dFQ2S
X-Proofpoint-ORIG-GUID: ZLPf2EcXuyfBRx9vfV8fRBTvbL_dFQ2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_12,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=910
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408310012
Message-ID-Hash: TFUDPKWBCMZBNTBLHYLMMMMBCY6XCAQ2
X-Message-ID-Hash: TFUDPKWBCMZBNTBLHYLMMMMBCY6XCAQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFUDPKWBCMZBNTBLHYLMMMMBCY6XCAQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/30/2024 2:03 AM, Pierre-Louis Bossart wrote:
>> diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
>> index e57df2dab2fd..8bed8f8f48da 100644
>> --- a/Documentation/sound/soc/index.rst
>> +++ b/Documentation/sound/soc/index.rst
>> @@ -18,3 +18,4 @@ The documentation is spilt into the following sections:-
>>     jack
>>     dpcm
>>     codec-to-codec
>> +   usb
>> diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
>> new file mode 100644
>> index 000000000000..bd3d9eb86b07
>> --- /dev/null
>> +++ b/Documentation/sound/soc/usb.rst
>> @@ -0,0 +1,429 @@
>> +================
>> +ASoC USB support
>> +================
>> +
>> +Overview
>> +========
>> +In order to leverage the existing USB sound device support in ALSA, the
>> +ASoC USB APIs are introduced to allow for the entities to communicate
>> +with one another.
> nit-pick: entities is rather vague and an overloaded term in USB audio.
> Maybe "allow the subsystems to exchange configuration information"
Sure, will make that change.
>> +One potential use case would be to support USB audio offloading, which is
>> +an implementation that allows for an external DSP on the SoC to handle the
> nit-pick: not sure about the reference to an 'external DSP'. "external"
> would usually to a stand-alone device and there's no real need for DSP
> capabilities for USB offload, e.g. a regular embedded core would do just
> fine.
>
> maybe "allows for an alternate power-optimized path in the audio
> subsystem to handle the transfer of audio data over the USB bus"
Yeah, I guess external doesn't make sense, its just another core within the SoC.
>> +transfer of audio data over the USB bus.  This would let the main
>> +processor to stay in lower power modes for longer duration.  The following
>> +is an example design of how the ASoC and ALSA pieces can be connected
>> +together to achieve this:
>> +	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
>> +					     int direction, long *route)
>> +..
>> +
>> +  - ``dev``: USB device to look up offload path mapping
>> +  - ``card``: USB sound card index
>> +  - ``pcm``: USB sound PCM device index
>> +  - ``direction``: direction to fetch offload routing information
>> +  - ``route``: mapping of sound card and pcm indexes for the offload path
> nit-pick: again explain how the card and pcm indices are handled.
>
Will do.
>> +--------------------------------
>> +USB devices can be hotplugged into the USB root hub at any point in time.
> "root hub" really?
>
> Is this really required? I would think the entire framework would work
> just fine if the device is connected to any hub at any level, not just
> "the" root hub.

Yes, you're right. Will clarify this as well.  My test set up for this involves doing audio transfers on multiple devices over an external 4port USB hub.

Thanks

Wesley Cheng

>
