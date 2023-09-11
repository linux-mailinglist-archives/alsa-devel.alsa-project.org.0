Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2379AAA7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 19:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA139F6;
	Mon, 11 Sep 2023 19:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA139F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694455187;
	bh=5MwKGODBQPJkHOC/Wekkq6FBLDgw3ZcbIcHG84HLHMA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Okx4xz06II1CcWQihIWomqrtlKBvPeB9FuJxA/h+x4B9oMKGisp/iAllKHSHZScj1
	 kcLofmaRwVwcA9mX9Lyj0prr/s0bSMEpOd56SknYCVhO29M3c+OlxDK8MacgClfm5B
	 B2+y9brmJGv2BkpnvB8Gh8XG8hA37QKcnkOeA9YM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31BC0F80246; Mon, 11 Sep 2023 19:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB4B0F80246;
	Mon, 11 Sep 2023 19:58:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C787BF80431; Mon, 11 Sep 2023 19:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5314F80425
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 19:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5314F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Ljc6fkhg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38BFrOYO018104;
	Mon, 11 Sep 2023 17:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=w+G3DneCyl/+8+LM2jmeftpB3JPy3zCmFZHnSrYU5mU=;
 b=Ljc6fkhgtobFwtqAIDDoA1TTdsrgilgiCV1+x27KZCbuTejyk67Qe0dDVT66omP26EV6
 MDv5vdrsa5n+3LQnYmlPkBFslr5P//xEIJInSigOG38WS696gy5I/qwIuO66sgf0zE9q
 ZvHXpVqxxZikIM741tNJdOQTWhLP8Eol6R7Odc1/IUFYE2KNfZ7jwP1VGJodjkrlgjgM
 qRtKll7XWP8zE14G39vniGK7jtNQlinwSz/12IP8bRq9sdkWeu2aV4s+HiztRfguo76Y
 w7YVo2/6/qNDQoYSi653fsuNi01xRxjJRkcOYARE0BK4w+yWfyAJaVsPm5S9Vh0En5As NA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1xjmscqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 17:58:48 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38BHwkPY013802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 17:58:47 GMT
Received: from [10.110.109.129] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 10:58:45 -0700
Message-ID: <6a7ff8ae-1ce5-84a9-8cec-b785e88b6fda@quicinc.com>
Date: Mon, 11 Sep 2023 10:58:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 12/32] sound: usb: Export USB SND APIs for modules
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, <quic_plai@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-13-quic_wcheng@quicinc.com>
 <874jk6at85.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <874jk6at85.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: s0XTIQ5vwfRw4gnEAniwQbfVq5ML631d
X-Proofpoint-GUID: s0XTIQ5vwfRw4gnEAniwQbfVq5ML631d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=709
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110164
Message-ID-Hash: 3NHDSTS2JTN4PPUNMFTUAEGSL7SOSJAN
X-Message-ID-Hash: 3NHDSTS2JTN4PPUNMFTUAEGSL7SOSJAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NHDSTS2JTN4PPUNMFTUAEGSL7SOSJAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 9/7/2023 8:38 AM, Takashi Iwai wrote:
> On Tue, 29 Aug 2023 23:06:37 +0200,
> Wesley Cheng wrote:
>> -/*
>> - * hw_params callback
>> - *
>> - * allocate a buffer and set the given audio format.
>> - *
>> - * so far we use a physically linear buffer although packetize transfer
>> - * doesn't need a continuous area.
>> - * if sg buffer is supported on the later version of alsa, we'll follow
>> - * that.
>> - */
>> -static int snd_usb_hw_params(struct snd_pcm_substream *substream,
>> -			     struct snd_pcm_hw_params *hw_params)
>> +int snd_usb_attach_endpoints(struct snd_usb_substream *subs,
>> +				struct snd_pcm_hw_params *hw_params)
> 
> This doesn't only "attach" endpoints, but it does more other things
> that are needed for PCM hw_params procedure.  I'd rather keep
> hw_params in the function name instead of creating completely
> different one.
> 
> Ditto for hw_free.
> 

Sure I'll keep the same nomenclature as it was previously.

Thanks
Wesley Cheng
