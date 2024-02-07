Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2E84C138
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 01:09:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 773BEB60;
	Wed,  7 Feb 2024 01:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 773BEB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707264548;
	bh=g1wkrCHZJPUJiczeRtLCyl0OxKSBFtJD7ZdL0Innc3A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lcLr0wy7yta9pRIFL7pjAiGtAoAgIUnZLam1Xv/FhF7/Iengv5cPRzTOYjdnLpmzv
	 MMKcEnzF9SuYy7mMFj7N3dA1gioWLy31VPm2J0G7E/s7OXkQHHNUNvnDHJVn4okJ93
	 lAw8ljonzgkW2tCpztVix1aX9mUoJYfWJFYkktYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DD66F805C3; Wed,  7 Feb 2024 01:08:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4773FF80548;
	Wed,  7 Feb 2024 01:08:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB84DF80548; Wed,  7 Feb 2024 01:08:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 17DA0F8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 01:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DA0F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EAVvHDP6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 416N3por015273;
	Wed, 7 Feb 2024 00:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Br0O+jemYZqsYtS1SyNg5WN/92FNWZLdy8IQgi7FiCE=; b=EA
	VvHDP67eE8M5AXnA7zoxlhD6DH7oYiEWpyHgK8vgzv6UrRxMbG9AvhWPGCn4ZK3e
	GxI/p/main661p0/ik89OTPjkAnfXjkOiPrjHS8HdvgTxtaOMp+5x2zTYyI6v1XX
	RJ7JLmtFfCN8g9lwQ5R3DJZ873X4GW0rYwAlh9m4mVSEhPZHPldo/rTl+cllRI+K
	kMg6qQangFv4O8m6Enl1SuCQf5v5WrhrPx44BW9f2tpynoJy3b6Iimm7hVEqoUqX
	Cc8t+seSUb/BtSVfXrl0oN/cwFvUhFTQ+MJWYABWnuOSiZMneenGt+dQCQVWEpQK
	tIQajXN7MpkBSn4wvlOQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3hyvhtqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 00:08:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41708bRo007736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Feb 2024 00:08:37 GMT
Received: from [10.110.7.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 16:08:36 -0800
Message-ID: <75f8962c-192b-b7a4-1eae-35d8c46a7d74@quicinc.com>
Date: Tue, 6 Feb 2024 16:08:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v13 32/53] ALSA: usb-audio: Check for support for
 requested audio format
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
 <20240203023645.31105-33-quic_wcheng@quicinc.com>
 <87wmrhvir7.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87wmrhvir7.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ue4lzn1jeh_HbQIeyoDXs_Vu1MkEVnMz
X-Proofpoint-GUID: ue4lzn1jeh_HbQIeyoDXs_Vu1MkEVnMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_15,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060171
Message-ID-Hash: ZEHIZKJ5ZTMCBEEZXSBUCVQXSSDHIAQ7
X-Message-ID-Hash: ZEHIZKJ5ZTMCBEEZXSBUCVQXSSDHIAQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEHIZKJ5ZTMCBEEZXSBUCVQXSSDHIAQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/6/2024 5:12 AM, Takashi Iwai wrote:
> On Sat, 03 Feb 2024 03:36:24 +0100,
> Wesley Cheng wrote:
>>
>> Allow for checks on a specific USB audio device to see if a requested PCM
>> format is supported.  This is needed for support when playback is
>> initiated by the ASoC USB backend path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Just cosmetic:
> 
>> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction)
>> +{
>> +	struct snd_usb_audio *chip;
>> +	struct snd_usb_substream *subs;
>> +	struct snd_usb_stream *as;
>> +	const struct audioformat *fmt;
>> +
>> +	/*
>> +	 * Register mutex is held when populating and clearing usb_chip
>> +	 * array.
>> +	 */
>> +	mutex_lock(&register_mutex);
>> +	chip = usb_chip[card_idx];
>> +	if (!chip) {
>> +		mutex_unlock(&register_mutex);
>> +		return NULL;
>> +	}
>> +
>> +	if (enable[card_idx]) {
>> +		list_for_each_entry(as, &chip->pcm_list, list) {
>> +			subs = &as->substream[direction];
>> +			fmt = snd_usb_find_substream_format(subs, params);
>> +			if (fmt) {
>> +				mutex_unlock(&register_mutex);
>> +				return as;
>> +			}
>> +		}
>> +	}
>> +	mutex_unlock(&register_mutex);
> 
> I prefer having the single lock/unlock call pair, e.g.
> 
> 	struct snd_usb_stream *as, *ret;
> 
> 	ret = NULL;
> 	mutex_lock(&register_mutex);
> 	chip = usb_chip[card_idx];
> 	if (chip && enable[card_idx]) {
> 		list_for_each_entry(as, &chip->pcm_list, list) {
> 			subs = &as->substream[direction];
> 			if (snd_usb_find_substream_format(subs, params)) {
> 				ret = as;
> 				break;
> 			}
> 		}
> 	}
> 	mutex_unlock(&register_mutex);
> 	return ret;
> }
> 
> In this case, we shouldn't reuse "as" for the return value since it
> can be non-NULL after the loop end.
> 
> 
Sure will do, thanks for taking a look.

Thanks
Wesley Cheng
