Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 119667CE7E5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 21:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F002E829;
	Wed, 18 Oct 2023 21:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F002E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697658034;
	bh=+W1TkCX3RdqsZz4M+eVmFRLh1tRbopbf8T0Qs2d2FhQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IjR1/ZBPpvfYHV/t4nyXIuEwXfBaD8NmWMaUiHEb/cHzIRb9Rr2Uu+z3kcJ34RSEQ
	 zezjVsZa22KEo7TItbiuUFLWuOVeYkpDcdB6v/1pkuX6CDKHpMTGo+gVPs3kPn0xXW
	 Vk0I8miBZZPMufW+08br+JBfzkE5cSWpvefLjV48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A0ACF8027B; Wed, 18 Oct 2023 21:39:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D02E7F8024E;
	Wed, 18 Oct 2023 21:39:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C931F8025F; Wed, 18 Oct 2023 21:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0774DF80236
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 21:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0774DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ToCA+Qdp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39IJaG89014404;
	Wed, 18 Oct 2023 19:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TEATBtwlN0xdO7XyXRXGo39Ssf+eHUfF3pME+T6mWEs=;
 b=ToCA+QdpMzm9hMH5AfLrLDf54I1WgNJcXcva0b13rUQdEjeWsguIh3C2VYWteWqmmUHq
 /vn6HyyCIYJrsfULZfpdqHsAy4UTCnaTuT8ulj1BV2XKDL4AXz1DPvOjwwVIW4rbCb1Z
 DLTX2RNZDgtT4A54IhUlGjubGUsfqg1Y88hVBJfHV6IRZXBiV8r6wlW3xlYacpRGqMNr
 KdiRz4s2WyHwfD+ii4Ap/cn3eL6/jQz9jvK38RrNL8hWJykG3CjoKbnmpf2jbmarC81V
 dKaTGnzcC4eQXfyhkHXgj+jqDAaA6mX6UzqMdZMNj3D2XiosdgI6CeYWbNUen83M6LuM LQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttnnag02n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 19:36:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39IJaJAF005566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 19:36:20 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 12:36:19 -0700
Message-ID: <fcaa93ba-3ca4-5a18-d3bd-afebe8def327@quicinc.com>
Date: Wed, 18 Oct 2023 12:36:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 09/34] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
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
 <20231017200109.11407-10-quic_wcheng@quicinc.com>
 <7aa4ea87-9d1f-400a-bcc5-b56e5b4500c6@linux.intel.com>
 <c72bcf47-af0b-8819-1c30-06b51358381e@quicinc.com>
 <2f05708e-3ee8-472e-a24f-6f3eb118133c@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2f05708e-3ee8-472e-a24f-6f3eb118133c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NFa6HSMZ_yo8oCq0OUSdSUKJSyyyPtQe
X-Proofpoint-ORIG-GUID: NFa6HSMZ_yo8oCq0OUSdSUKJSyyyPtQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_18,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=525 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180161
Message-ID-Hash: NDK2EUCNNOLK55PA4J37RS6PZQZ72SJL
X-Message-ID-Hash: NDK2EUCNNOLK55PA4J37RS6PZQZ72SJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDK2EUCNNOLK55PA4J37RS6PZQZ72SJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/18/2023 6:47 AM, Pierre-Louis Bossart wrote:
> 
>>>> Specifically, the QC ADSP can support all potential endpoints that are
>>>> exposed by the audio data interface.  This includes, feedback endpoints
>>>> (both implicit and explicit) as well as the isochronous (data)
>>>> endpoints.
>>>
>>> implicit feedback means support for capture. This is confusing...
>>>
>>
>> I mean, a USB device can expose a capture path, but as of now, we won't
>> enable the offloading to the audio DSP for it.  However, if we're
>> executing playback, and device does support implicit feedback, we will
>> pass that along to the audio DSP to utilize.
> 
> Not following. Implicit feedback means a capture stream *SHALL* be
> started. Are you saying this capture stream is hidden and handled at the
> DSP level only? If yes, what prevents you from exposing the capture
> stream to userspace as well?
> 
> I must be missing something.
> 

My understanding is that with implicit feedback endpoints, it allows for 
another data endpoint in the opposite direction to be utilized as a 
feedback endpoint (versus having to expose another EP, such as in the 
case of explicit feedback).  For example, if we are enabling the 
playback path (and the device does have a capture data ep) then the data 
ep used for the capture path can be used.

USB2.0 spec, section 5.12.4.3 (Implicit Feedback)
"
Two cases can arise:
• One or more asynchronous sink endpoints are accompanied by an 
asynchronous source endpoint. The
data rate on the source endpoint can be used as implicit feedback 
information to adjust the data rate on
the sink endpoint(s).
• One or more adaptive source endpoints are accompanied by an adaptive 
sink endpoint. The source
endpoint can adjust its data rate based on the data rate received by the 
sink endpoint.
"

The DSP will get this as part of the USB sync endpoint information which 
it will use to enable this EP.

>>>>    +static const struct snd_soc_dai_ops q6usb_ops = {
>>>> +    .probe        = msm_dai_q6_dai_probe,
>>>> +    .prepare    = q6afe_dai_prepare,
>>>> +    .hw_params    = q6usb_hw_params,
>>>
>>> this is rather confusing with two different layers used for hw_params
>>> and prepare? Additional comments or explanations wouldn't hurt.
>>>
>>
>> I thought this was how the ASoC design was.  Each DAI defined for a
>> particular path has it own set of callbacks implemented to bring up any
>> required resources for that entity.  So in this case, it initializes the
>> "cpu" DAI, which is the main component that handles communication with
>> the audio DSP.
> 
> Usually prepare and hw_params rely on the type of DAI callbacks, but
> here you are mixing "q6afe" and "q6usb" which are shown in your Patch0
> diagram as "cpu" and "codec" dais respectively. I don't think it's
> correct to tie the two, it's a clear layering violation IMHO. The codec
> dai .prepare should not invoke something that modifies the state of the
> CPU dai, which should have its own .prepare callback.

OK, I think I know where the misunderstanding is.  The API callback for 
hw_params() that is being registered here exists in q6afe, but with the 
q6usb prefix.  I will fix that in the next rev.

Thanks
Wesley Cheng
