Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071A8C0539
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 21:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8201DDEE;
	Wed,  8 May 2024 21:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8201DDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715197329;
	bh=HapdOvbkq3cPe7mrnwPRJWY/JCHXpUP5zWlGDoia4vU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mbUcvirZQ4fdrpX5Sjun7zv+/JdqRPxWKtuGuW0m4sPMSAJT6lpAgQVz3N7dDAehy
	 W2UZUVNM4AuWNmlpMlrIW9SG0mwVsTwK0aqDIWLPR6NcmzjJYqRHIjEEZWCwRs9IMZ
	 5ZQ3wEoH/4V/Gg+JDtMyQmg36gWxSMs9J+jafYU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A49DF805AD; Wed,  8 May 2024 21:41:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B441BF80564;
	Wed,  8 May 2024 21:41:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 021FDF8049C; Wed,  8 May 2024 21:41:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 882A6F8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 21:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 882A6F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eO8Qobbh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448C4OBB027127;
	Wed, 8 May 2024 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=//8eQG+4DJgnx0oufJSB0Ib+8mNORV/5apGuxCNbiww=; b=eO
	8QobbhfFGKKMOMN0MklkBu/IIMkRiTUFvOXG2N0U+uncWf4fVgG9GtPXMgeIdubH
	J50HYgA+5bxk/nOeBJHHbq2HKS4j5zMZ/Q3kDh7dq/kv/49NO56vh1ECoLNr55EU
	DA3rlZra/g4d45My0ErWb2TBFfwn/+mWfuAVHYx8MVCGNaBlQNyJoTWp2Em/Bdsv
	noRyvN6Bi5XEkIJot+es0BoE4Pi6E91c9c8TnRmI35MoU3j788jIDFeUcUiWTXna
	4DXKNHqvzTUGvxIJnfOVGtLo+GEUrt52unFv9Gy1fHU9pzb2hr+0C0xfzEerqppB
	zzlAl1GT3Pp2WutiX/ug==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y0930s2f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 19:41:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 448JfGU3007751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 19:41:16 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 12:41:15 -0700
Message-ID: <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
Date: Wed, 8 May 2024 12:41:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 34/39] ALSA: usb-audio: Add USB offloading capable
 kcontrol
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
 <20240507195116.9464-35-quic_wcheng@quicinc.com>
 <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _92PkR2WXZJ-AELmvZ21blO6NJUTRqKm
X-Proofpoint-ORIG-GUID: _92PkR2WXZJ-AELmvZ21blO6NJUTRqKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080144
Message-ID-Hash: XYHUTJUXLF4AF4QVGDEMI45QNWYID2TA
X-Message-ID-Hash: XYHUTJUXLF4AF4QVGDEMI45QNWYID2TA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYHUTJUXLF4AF4QVGDEMI45QNWYID2TA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/7/2024 2:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/24 14:51, Wesley Cheng wrote:
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> index is associated with the ASoC platform card supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.  SOC USB will expose more
>> details about the current offloading status, which includes the USB sound
>> card and USB PCM device indexes currently being used.
>>
>> It is expected for the USB offloading driver to add the kcontrol to the
>> sound card associated with the USB audio device.  An example output would
>> look like:
>>
>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>> 0 (range -1->32)
> 
> You already gave the following examples in patch 29:
> 
> "
> USB offloading idle:
> tinymix -D 0 get 'USB Offload Playback Route Status'
> -->-1, -1 (range -1->32)
> 
> USB offloading active(USB card#1 pcm#0):
> tinymix -D 0 get 'USB Offload Playback Route Status'
> -->1, 0 (range -1->32)
> "
> 
> Can you clarify how many controls there would be in the end?

For USB offload situations, there will be a set of controls for playback 
status and playback select.  The offload jack will also be there to tell 
us if there is an offload path available for the platform ASoC sound card.

> Also isn't tinymix -D N going to give you the controls for card N?
> 

Yes, since the offload portion is handled as a DPCM DAI link to the 
platform ASoC card, it will be included as a kcontrol for that.

Thanks
Wesley Cheng

