Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D6966EE4
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2024 04:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937B6829;
	Sat, 31 Aug 2024 04:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937B6829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725070304;
	bh=tnAqR6UfpTUbRxBq5PIZ41Adc1DmuhagL8RLHPVvYGs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d6Zq8gzSTkVFnntVVgBT5/lUm3DWa7hl15IsrjuoS40c+k+hNMlyFUMvQJxopOicm
	 uK8ze4Kkg5HxUl2Y8qAUgRreXIZiruqsvzFcO7hOH6ERrukeajP4/ykEVCciWi5y0l
	 ei2voTYtJaH8xyxd+3EAsTC9bIbhg/j7NJKExLE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81F01F805A8; Sat, 31 Aug 2024 04:11:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D25F7F805B3;
	Sat, 31 Aug 2024 04:11:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05148F80518; Sat, 31 Aug 2024 04:11:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CA59FF800AC
	for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2024 04:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA59FF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LLy7Gdev
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47V20ZCO010779;
	Sat, 31 Aug 2024 02:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXvT5Stw1lH4jky1fc80QPaN+DcFiwOANNRjZIvJNek=; b=LLy7GdevN+hNB1Ai
	+bsZ+P3IjSvNrxwWs3ZwWdhYuPYZD8oh5eGvmxZsJqMAFQrq5fFg9glCBVLSRmsh
	3Hex0z8dSaNES7OxFt5vE8T+vsOL5ksDQ0Og1kM/ryG1vP4cajBq2gmaFUP1eey4
	wwIRZYS6eljBkQoluIQhP/U8W8XV/Xj6B1n2j+uGm+RCkfK71TssORT6dub/ZH22
	1oIKoKNxzYwwqYn0D9N9dFmGFy/9SxOjdUqV0mMbj+6TE4oqRwBhbzYT4TplwV/b
	2uxQ+C1KO0TirfzzAd3a9V92lh5z/RIGILK1uItiZfs2UAAWiZR18RlcL2+iXJte
	ZCV8Dg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puvjjkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 Aug 2024 02:11:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47V2BBSn022950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 Aug 2024 02:11:11 GMT
Received: from [10.110.4.92] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 19:11:09 -0700
Message-ID: <15039aad-0485-4fe7-aca5-3b59ffadcccb@quicinc.com>
Date: Fri, 30 Aug 2024 19:11:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 19/33] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240829194105.1504814-20-quic_wcheng@quicinc.com>
 <ae0ae5f0-a3e9-49b4-95ba-524975d70659@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ae0ae5f0-a3e9-49b4-95ba-524975d70659@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VdoEpgeHo008CMaGqUIvxVZr5uOlC_nQ
X-Proofpoint-GUID: VdoEpgeHo008CMaGqUIvxVZr5uOlC_nQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_12,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=886 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408310016
Message-ID-Hash: OPSBGHDJNH5WYSM6DOOV2PTQ3BQE6HWU
X-Message-ID-Hash: OPSBGHDJNH5WYSM6DOOV2PTQ3BQE6HWU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPSBGHDJNH5WYSM6DOOV2PTQ3BQE6HWU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/30/2024 2:12 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> The QC ADSP is able to support USB playback endpoints, so that the main
>> application processor can be placed into lower CPU power modes.  This adds
>> the required AFE port configurations and port start command to start an
>> audio session.
>>
>> Specifically, the QC ADSP can support all potential endpoints that are
>> exposed by the audio data interface.  This includes, feedback endpoints
>> (both implicit and explicit) as well as the isochronous (data) endpoints.
> I think you meant
>
> "
> this includes isochronous data endpoints, in either synchronous mode or
> asynchronous mode. In the latter case both implicit or explicit feedback
> endpoints are supported.
> "
>
> And now I don't remember how *controls* are handled.
>
> Is this the case that all controls exposed by endpoint zero are visible
> in both the regular USB-audio card AND the offloaded card, with changes
> mirrored?
I think we had a discussion about this previously, but can't seem to find it.  The USB volume controls (ie controls still handled by the control EP) are going to still reside only within the USB SND card.  As of now, there aren't any kcontrols that are being added to the ASoC platform card for offload.
> It's important to explain so that the volumes are consistent no matter
> which path is used. This should be added to the documentation.
>
>
>> +static const struct snd_soc_dai_ops q6afe_usb_ops = {
>> +	.probe		= msm_dai_q6_dai_probe,
>> +	.prepare	= q6afe_dai_prepare,
>> +	.hw_params	= q6afe_usb_hw_params,
>> +	/*
>> +	 * Shutdown callback required to stop the USB AFE port, which is enabled
>> +	 * by the prepare() stage.  This stops the audio traffic on the USB AFE
>> +	 * port on the Q6DSP.
>> +	 */
>> +	.shutdown	= q6afe_dai_shutdown,
>> +	/*
>> +	 * Startup callback not needed, as AFE port start command passes the PCM
>> +	 * parameters within the AFE command, which is provided by the PCM core
>> +	 * during the prepare() stage.
>> +	 */
> Humm, now this is a bit confusing. Why would you need a shutdown, can't
> you use the hw_free() callback for symmetry with prepare()?

I thought that it was hw_params() -- hw_free() and prepare() -- shutdown()?

"DPCM runs the PCM trigger(stop), hw_free(), shutdown() operations on DAI0 for headset since the path is now disabled.

DPCM runs the PCM ops for startup(), hw_params(), prepare() and trigger(start) for DAI1 Speakers since the path is enabled."

https://www.kernel.org/doc/html/v6.10/sound/soc/dpcm.html

Thanks

Wesley Cheng

>
