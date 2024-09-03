Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58D96ACBD
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 01:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35400A4B;
	Wed,  4 Sep 2024 01:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35400A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725405719;
	bh=VVjKMPQCQbAndyPg1su7hyXIjAssdsdVvez66hoaFss=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kboL4LNkIUgsxHu2KaOiJQOJSK0WfBRDcxGABKZ+UqCUfbqDsArUNcse0NModdj57
	 P4eJ3pT7GsprSx8ySFgGQlohGw1NuntZUt4M9wtysBYuW+Tw0+Pbj9UBzKSBEyI/3C
	 xWPZ5t2oYubaGhXDaTKCnnv4A9SPCPCvTrLdZER0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B01BDF805B6; Wed,  4 Sep 2024 01:21:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56405F805B3;
	Wed,  4 Sep 2024 01:21:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D99BEF80199; Wed,  4 Sep 2024 01:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1F85F800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 01:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1F85F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=caxzjObD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 483HCHxK019944;
	Tue, 3 Sep 2024 23:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BhOo48oBZBd7tWt8QQ1bwGJh3mum88phCnQzDd2g6jM=; b=caxzjObDCr6OhPXC
	3L/G+1oPGeHQ+M0yjNFBcqFKnIBhSR+kHFUO4HR+0pzzBg0ozhMi3GldoBRRjIPX
	BDBfBq4wp+oCqJXaJx9JCO+C2yEr/TZFfYJf9gKWOPB04b+6b4mil/vpr9SbjV5R
	amGesc1PROOy+ftHPujmEG4W8h4woYlskL7a1BLpHAGUBGpRCC0lDdmphAZn2r7/
	gtxLcnLNxsHkbIUfZb1cwZ1XauGyNXktaiIKd+VSm8m1sFoXUoAtjQ72i3Jvuze0
	kJENzyEulyrE+uFBqrsCkb6l5ToI8Hkx4RdVnlk31jIYBUkvSipC5677GIe6wJzR
	EN19kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy22ckk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:21:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 483NLHCs015712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:21:17 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:21:16 -0700
Message-ID: <f71a248b-6ff7-472d-9d29-d5a0a9dd5b8e@quicinc.com>
Date: Tue, 3 Sep 2024 16:21:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 26/33] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240829194105.1504814-27-quic_wcheng@quicinc.com>
 <e8b11cb4-cda1-4904-b83f-e124066758e3@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e8b11cb4-cda1-4904-b83f-e124066758e3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: de8g6g3vHYmGmewsWFdt1FpLPyQCTuJ6
X-Proofpoint-ORIG-GUID: de8g6g3vHYmGmewsWFdt1FpLPyQCTuJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030186
Message-ID-Hash: 7ZXWMIJK67IGRTJTMG3A2ZMHAKS25ABO
X-Message-ID-Hash: 7ZXWMIJK67IGRTJTMG3A2ZMHAKS25ABO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZXWMIJK67IGRTJTMG3A2ZMHAKS25ABO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:45 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
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
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>
> I would also move this patch earlier in the series since it has no
> dependency on USB offload really, and if somehow it breaks USB audio
> regular paths we'd want to know early for bisection.

Sure I'll re-order this earlier since I'm going to send out another rev.

Thanks

Wesley Cheng

>
>> ---
>>  sound/usb/card.h |  1 +
>>  sound/usb/pcm.c  | 29 ++++++++++++++++++++++++++---
>>  2 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/usb/card.h b/sound/usb/card.h
>> index 15cda1730076..d8b8522e1613 100644
>> --- a/sound/usb/card.h
>> +++ b/sound/usb/card.h
>> @@ -165,6 +165,7 @@ struct snd_usb_substream {
>>  	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
>>  	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
>>  
>> +	unsigned int opened:1;		/* pcm device opened */
>>  	unsigned int running: 1;	/* running status */
>>  	unsigned int period_elapsed_pending;	/* delay period handling */
>>  
>> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
>> index 18467da6fd9e..b24ee38fad72 100644
>> --- a/sound/usb/pcm.c
>> +++ b/sound/usb/pcm.c
>> @@ -1241,8 +1241,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>>  	struct snd_pcm_runtime *runtime = substream->runtime;
>>  	struct snd_usb_substream *subs = &as->substream[direction];
>> +	struct snd_usb_audio *chip = subs->stream->chip;
>>  	int ret;
>>  
>> +	mutex_lock(&chip->mutex);
>> +	if (subs->opened) {
>> +		mutex_unlock(&chip->mutex);
>> +		return -EBUSY;
>> +	}
>> +	subs->opened = 1;
>> +	mutex_unlock(&chip->mutex);
>> +
>>  	runtime->hw = snd_usb_hardware;
>>  	/* need an explicit sync to catch applptr update in low-latency mode */
>>  	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
>> @@ -1259,13 +1268,23 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>>  
>>  	ret = setup_hw_info(runtime, subs);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto err_open;
>>  	ret = snd_usb_autoresume(subs->stream->chip);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto err_open;
>>  	ret = snd_media_stream_init(subs, as->pcm, direction);
>>  	if (ret < 0)
>> -		snd_usb_autosuspend(subs->stream->chip);
>> +		goto err_resume;
>> +
>> +	return 0;
>> +
>> +err_resume:
>> +	snd_usb_autosuspend(subs->stream->chip);
>> +err_open:
>> +	mutex_lock(&chip->mutex);
>> +	subs->opened = 0;
>> +	mutex_unlock(&chip->mutex);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -1274,6 +1293,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>>  	int direction = substream->stream;
>>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>>  	struct snd_usb_substream *subs = &as->substream[direction];
>> +	struct snd_usb_audio *chip = subs->stream->chip;
>>  	int ret;
>>  
>>  	snd_media_stop_pipeline(subs);
>> @@ -1287,6 +1307,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>>  
>>  	subs->pcm_substream = NULL;
>>  	snd_usb_autosuspend(subs->stream->chip);
>> +	mutex_lock(&chip->mutex);
>> +	subs->opened = 0;
>> +	mutex_unlock(&chip->mutex);
>>  
>>  	return 0;
>>  }
