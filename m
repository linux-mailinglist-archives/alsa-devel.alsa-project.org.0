Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C538C0570
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 22:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526CAB6A;
	Wed,  8 May 2024 22:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526CAB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715199443;
	bh=U09Rnr9ntnBO7MwvNoJCHqyP9+H/89CU40V7dG6FWYM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AIcNrdX5o/ZkhQZSmTA0Ga7FYPlAHwFaigS3uQhWaQ1Hg5ivYKM0pcyRjsePf4QpS
	 4gcNH15xurWMNQYw37duOD2UjsCU4JcaQgnazHT8Bt9cxidHD+gewgEo+4lTX/JTXP
	 AQat/etT4x8Vd3iGnf0KLgBu+54Dua7Dhc1xMots=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CBCEF80564; Wed,  8 May 2024 22:16:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C57F804FB;
	Wed,  8 May 2024 22:16:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A713CF8049C; Wed,  8 May 2024 22:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DC8CF8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 22:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC8CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=G3CeZyZ4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 448Ae8bk004926;
	Wed, 8 May 2024 20:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/h/CzWxCJAWdECYePSx/kcEaFq6W4rE/eXk8NJV+0HY=; b=G3
	CeZyZ4ePRk73R5cwnSmeBM0urCxyVcmWeyXqhE8ksxx8PFJfRosXjZCP+ZyMToPN
	uNqBaQVN5NKDYn1Dfoxe6mKwRQYhcJit7YwGf0fDPpfUVCAEWutXU2pYwv7fXVo1
	GCpYVr/RvAJv72ihoMCpzkzPYc62Z9OHZMoQafRrIv/K40lutuUFCvNN5Ek8cuoW
	jbTh2fT7eTfHETpiR0Ubw7N9LetZy5ZU4w1/Lnm3GrS9UO13cuTMDMyC+h+5e6uL
	PwiYxnkOw4+sNSb2BUjPYJazkYjT1xstgNZFALufEONUoZ5sWvfiemtT0iKE8l3w
	OfadCVyIIsNml6LKrMVQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u999yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:16:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 448KGdbW007663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:16:39 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 13:16:38 -0700
Message-ID: <106711dc-0250-4d07-254d-2829f89e0a5d@quicinc.com>
Date: Wed, 8 May 2024 13:16:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 07/39] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240507195116.9464-8-quic_wcheng@quicinc.com>
 <507953f7-c4da-499b-bcd7-76be0e04b766@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <507953f7-c4da-499b-bcd7-76be0e04b766@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RJxVdkI85z4HvNEsdpbVz7wQbcrOhP3J
X-Proofpoint-ORIG-GUID: RJxVdkI85z4HvNEsdpbVz7wQbcrOhP3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080149
Message-ID-Hash: YNC4PC6OP26OSQQKRL42EHWROGODSBF3
X-Message-ID-Hash: YNC4PC6OP26OSQQKRL42EHWROGODSBF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNC4PC6OP26OSQQKRL42EHWROGODSBF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 5/7/2024 1:26 PM, Pierre-Louis Bossart wrote:
> 
>> +const char *snd_soc_usb_get_components_tag(bool playback)
>> +{
>> +	if (playback)
>> +		return "usbplaybackoffload: 1";
>> +	else
>> +		return "usbcaptureoffload : 1";
> 
> why are there different spaces and do we need spaces in the first place?
> 

Will remove these spaces once we clarify if this is still needed.

>> +int snd_soc_usb_add_port(struct snd_soc_usb *usb)
>> +{
>> +	mutex_lock(&ctx_mutex);
>> +	list_add_tail(&usb->list, &usb_ctx_list);
>> +	mutex_unlock(&ctx_mutex);
>> +
>> +	return 0;
> 
> make the function return void?
> 

Ack.

>> +int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
>> +{
>> +	struct snd_soc_usb *ctx, *tmp;
>> +
>> +	mutex_lock(&ctx_mutex);
>> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
>> +		if (ctx == usb) {
>> +			list_del(&ctx->list);
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&ctx_mutex);
>> +
>> +	return 0;
> 
> make this return void?
> 
> 

Ack.

Thanks
Wesley Cheng
