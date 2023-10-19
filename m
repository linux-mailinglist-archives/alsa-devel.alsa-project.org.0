Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438AF7D0286
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 21:27:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E0284A;
	Thu, 19 Oct 2023 21:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E0284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697743632;
	bh=sQ6vQBZV0/AsiBik8uduMfEXsvfMzbKyzxTzbNUc6kI=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hf+KcoKXP0OFh/X+YuujGJMJAx2EOJvFxY2U1U1GoVgk3xPRe1LRuIVJbRYPFP7EO
	 6D8JG5MboapmSGmVR+XtXI8Axliu8b0sKcn1Q9SaHUjeQ+I6nzryfJ6VReXH8qh0vt
	 7prCkYM7i4PM0UI41/ZpiEoHt0qJ+tH9AJGxXsMM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67AF1F80553; Thu, 19 Oct 2023 21:25:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8A7F8024E;
	Thu, 19 Oct 2023 21:25:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 293B2F8025F; Thu, 19 Oct 2023 21:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D130F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 21:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D130F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=md0+6fSV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JHS4wG021989;
	Thu, 19 Oct 2023 19:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7nZlr836Z1yRwKSJGkQXZps55FXeuMStkqXPcw7VZbM=;
 b=md0+6fSVejV8AMgpKlPvnBLl4J3FgpVtckN9oWAateqmPfpdkPBiI86G6LuaSblLw6UL
 r8DyTGz9RV+c/V2HTw5AesWtqrxjTxwXfgB8mxMm0UFqbmrO3fMq07cmq4yj7FdYmfyH
 8nrCTTZ6DL4nMFLP0NMMqU7pEI+ZZeXUzmql10dl+Nyz4OVUqdo4wNitnAFjlrtWIb8f
 DHe3yjPLyUFi2UBC1FoDOQgopgqP4HP/AXmrN0ls7nkxL0c3vRNo+JYD30clGBtGHLoX
 LOBd1TafidfkchfJfwD8eAUYCeuCD75TfJ/GkGhyP4gTfve0uhE2RsLSzyrE9EJcWk9l ew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu14csexk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 19:25:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39JJPZKQ008993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 19:25:35 GMT
Received: from [10.110.99.208] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 12:25:35 -0700
Message-ID: <2e300bef-3722-8b00-2bdf-e9386796f38f@quicinc.com>
Date: Thu, 19 Oct 2023 12:25:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 30/34] ASoC: qcom: qdsp6: Add SND kcontrol for fetching
 offload status
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-31-quic_wcheng@quicinc.com>
 <92971bbf-b890-4e41-8ef1-9213e15d81b2@linux.intel.com>
 <c9c5f13f-b3e7-6591-f277-cd86162152e4@quicinc.com>
In-Reply-To: <c9c5f13f-b3e7-6591-f277-cd86162152e4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: szZLkW7qgmVniayGieMMDVKlAabQiICH
X-Proofpoint-ORIG-GUID: szZLkW7qgmVniayGieMMDVKlAabQiICH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_18,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=459 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190164
Message-ID-Hash: YZRMWCIQXTTEZSLRYB2CLGV6KY7W6ZSN
X-Message-ID-Hash: YZRMWCIQXTTEZSLRYB2CLGV6KY7W6ZSN
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZRMWCIQXTTEZSLRYB2CLGV6KY7W6ZSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/18/2023 6:41 PM, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 10/17/2023 3:53 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/17/23 15:01, Wesley Cheng wrote:
>>> Add a kcontrol to the platform sound card to fetch the current offload
>>> status.  This can allow for userspace to ensure/check which USB SND
>>> resources are actually busy versus having to attempt opening the USB SND
>>> devices, which will result in an error if offloading is active.
>>
>> I think I mentioned this a while back, but why not add the status in the
>> USB card itself? That's a generic component that all userspace agent
>> could query. Having a QCOM-specific control doesn't make the life of
>> userspace easier IMHO.
>>
>>
> 
> Will take a look at this based on the comments you had in the other 
> kcontrol patch.  Seeing if we can move it to a more generic layer.
> 

I think it would make more sense to see if we can keep all the offload 
kcontrols under the sound card exposed by the platform.  Especially, if 
we are going to modify the components string of the card to signify that 
it supports USB offload.

Thanks
Wesley Cheng
