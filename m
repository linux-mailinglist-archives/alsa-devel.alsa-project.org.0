Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BED84C136
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 01:08:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB84C832;
	Wed,  7 Feb 2024 01:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB84C832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707264535;
	bh=mFIrM+Di9InkZwQXHNBXM1hyZVucQXVbLEjHXOAJ6EU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G4iMkR6ZHRDS8gquwuHNx+abH8+S6osbEvHghBfWvrWF8J5gZj3wXQ9QwH6Njv3ik
	 OuKvTxadPvvPl7wBtwT90fqptxSYsjqLCdHOPCewAkuHWxUy/pQWDfvG+xYhUstxsL
	 u+vtkVzJ0mFnrm8B5ltp+qUMR8X/zwT8Gu0sraV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EBEAF80580; Wed,  7 Feb 2024 01:08:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE97F8059F;
	Wed,  7 Feb 2024 01:08:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06AABF801EB; Wed,  7 Feb 2024 01:08:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB0CF8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 01:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB0CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Y2PtoaEX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 416NpWNL030915;
	Wed, 7 Feb 2024 00:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+D4nktpCYUtZM2am9USds2jdVYtzFu8/AHIYCkKZE+I=; b=Y2
	PtoaEXIjnihGpiCg6oKnkBK+zLcYcdmGipTAQM46Fnqz4sDXtlGo2eaqgQgACc60
	3Bu3KpgMW8IphxFDY35ZlAXW5aNNFnocXJ3kAEaeZbgVSpTYFsgCgwwMadCeW8L/
	a5guZ7DLbpURgr++VkhoAoLABkLdKuuDF9gCd15VVSKycv2OR+rCyOirlw9BBc0A
	H0V20CApS5+twrmoQs0kOlQf0efnsV44nS9poefHImTLf5Hl6cWYGQYWjo3akhC3
	9W2v62JUrvPUu7moPtfYUazJEvnNU/obI0TYf+zffZ/ADF3vPCX5sslCuzWjLHZG
	7XiTzbvjQ4WX0ZfD2l+w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3hyvhtp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 00:08:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4170823w004677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Feb 2024 00:08:02 GMT
Received: from [10.110.7.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 16:08:01 -0800
Message-ID: <ef83036f-6605-1db3-d962-ac28a10711ac@quicinc.com>
Date: Tue, 6 Feb 2024 16:08:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v13 35/53] ALSA: usb-audio: Prevent starting of audio
 stream if in use
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-36-quic_wcheng@quicinc.com>
 <87y1bxvj0o.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87y1bxvj0o.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qIQyJL9pDt7huHZmKIMEX-BC0aAcy2JV
X-Proofpoint-GUID: qIQyJL9pDt7huHZmKIMEX-BC0aAcy2JV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_15,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=879
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060171
Message-ID-Hash: FFEFOQIN5NK7DUUFJD3WUIBCEYNFG4VM
X-Message-ID-Hash: FFEFOQIN5NK7DUUFJD3WUIBCEYNFG4VM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFEFOQIN5NK7DUUFJD3WUIBCEYNFG4VM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/6/2024 5:07 AM, Takashi Iwai wrote:
> On Sat, 03 Feb 2024 03:36:27 +0100,
> Wesley Cheng wrote:
>>
>> With USB audio offloading, an audio session is started from the ASoC
>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>> readily available for use, in case the non-offload path is desired.  In
>> order to prevent the two entities from attempting to use the USB bus,
>> introduce a flag that determines when either paths are in use.
>>
>> If a PCM device is already in use, the check will return an error to
>> userspace notifying that the stream is currently busy.  This ensures that
>> only one path is using the USB substream.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Hm, I'm not sure whether it's safe to hold chip->mutex there for the
> long code path.  It even kicks off the auto-resume, which may call
> various functions at resuming, and some of them may re-hold
> chip->mutex.
> 

That's a good point.

> If it's only about the open flag, protect only the flag access with
> the mutex, not covering the all open function.  At least the re-entry
> can be avoided by that.
> 

Sure, let me re-order the check/assignment and the mutex locking.  Since 
this is now checked here in USB PCM and the QC offload driver, we want 
to make sure that if there was some application attempting to open both 
at the same time, we prevent any possible races.

I think the best way to address this would be something like:

static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
{
...
	mutex_lock(&chip->mutex);
	if (subs->opened) {
		mutex_unlock(&chip->mutex);
		return -EBUSY;
	}
	subs->opened = 1;
	mutex_unlock(&chip->mutex);

//Execute bulk of PCM open routine
...
	return 0;

// If any errors are seen, unwind
err_resume:
	snd_usb_autosuspend(subs->stream->chip);
err_open:
	mutex_lock(&chip->mutex);
	subs->opened = 0;
	mutex_unlock(&chip->mutex);

	return ret;
}

Set the opened flag first, so that if QC offload checks it, it can exit 
early and vice versa.  Otherwise, if we set the opened flag at the same 
position as the previous patch, we may be calling the other routines in 
parallel to the QC offload enable stream routine.  The only thing with 
this patch is that we'd need some error handling unwinding.

Thanks
Wesley Cheng
