Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12E8C0847
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 02:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC25B82B;
	Thu,  9 May 2024 02:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC25B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715213470;
	bh=BdWZkVRFBwd5j7dvagqwUn9G8yFkaTmkpBF77B9I/5M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kSx4hGh1Z9u72RW2nP9ft290BTxSy82ZGTBQB77z4ruKq3y5P6/TKhsb1BNMeSftS
	 MyMqKcusrIxuEI1TQ6mL4DoHn/QyPfnD0+hbudIl+du2h2L8YQCAPjwR5w81J1EsbA
	 3NRjwr4HpY3ZmwrqX2vWKIMgQ7NzKP4sTP/+6P38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D4E6F8057E; Thu,  9 May 2024 02:10:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75932F805A1;
	Thu,  9 May 2024 02:10:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A0A0F8049C; Thu,  9 May 2024 02:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7BDBF800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 02:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7BDBF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=P+wH3b3X
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448AiMH6006648;
	Thu, 9 May 2024 00:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=htshQXf3BliWLR5L8SE0WGh0HqbVq2MlJwUSH8LeGNI=; b=P+
	wH3b3Xz915z04eBscjYYQwEI+L0syogWqlf/y7+1Ehl5DTUaP82g2X/IbVqqNCs3
	ILqlAEr3j34LHWVcC7t0X0yUSLVLp4msxkzZYp4XKWNw3CQDXyV4dlCeyVmAhO5Q
	R7hq7OjDZ4fN7IObJJQIWWFdUzd7LqAJTwz2aCYIyOmObr7+6D76KFMdFsmPS/Ew
	Sl4glbIKnu4WzlbzAFIxVJZRUKJiXB5FEcuwyt1kvaxWxT2sVabErr21tDm9Ddyw
	76RxKjYY5lmvHI9RgFnrnHZeXDAWkwxklM6T/8bkRC0jNolz8HyJvdu7+KBts1c9
	MhpqDr3GBvicJVscNngA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wfskmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 00:10:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4490ATSL013890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 00:10:29 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 17:10:28 -0700
Message-ID: <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
Date: Wed, 8 May 2024 17:10:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 27/39] ASoC: Introduce SND kcontrols to select sound
 card and PCM device
Content-Language: en-US
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
 <20240507195116.9464-28-quic_wcheng@quicinc.com>
 <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xdE5J8-zgxy1rkT7StC50OZu7jDuPNDP
X-Proofpoint-ORIG-GUID: xdE5J8-zgxy1rkT7StC50OZu7jDuPNDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090000
Message-ID-Hash: 3XAIGU2SHBRRPHES34M2HFPS7P4TWOQG
X-Message-ID-Hash: 3XAIGU2SHBRRPHES34M2HFPS7P4TWOQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XAIGU2SHBRRPHES34M2HFPS7P4TWOQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/7/2024 2:26 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/24 14:51, Wesley Cheng wrote:
>> Add SND kcontrol to SOC USB, which will allow for userpsace to determine
>> which USB card number and PCM device to offload.  This allows for userspace
>> to potentially tag an alternate path for a specific USB SND card and PCM
>> device.  Previously, control was absent, and the offload path would be
>> enabled on the last USB SND device which was connected.  This logic will
>> continue to be applicable if no mixer input is received for specific device
>> selection.
>>
>> An example to configure the offload device using tinymix:
>> tinymix -D 0 set 'USB Offload Playback Route Select' 1 0
>>
>> The above command will configure the offload path to utilize card#1 and PCM
>> stream#0.
> 
> I don't know how this is usable in practice. Using card indices is
> really hard to do, it depends on the order in which devices are
> plugged-in...

How are the existing mechanisms handling USB audio devices, or what is 
the identifier being used?

Thanks
Wesley Cheng
