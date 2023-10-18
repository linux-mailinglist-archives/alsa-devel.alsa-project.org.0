Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9067CE916
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 22:35:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2414D9F6;
	Wed, 18 Oct 2023 22:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2414D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697661327;
	bh=gbZ7M40YqbXSVXNp9da3/bjgZ+fnNxR/dRuTtlxN6Eg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c7IOP1TgKJOAMwiHg/HV5VcZhtVUTnhlE4vNa3/U532tPwEN2jhQDmKY47G6dPORY
	 ysWxHZ/vJ6vkxXLUY0IVlV4l0j73G+4QCKCRYVMmsVtLPLwkEWXwUCdMKJG4MmQQoW
	 8JSQOLWe9Spnhe2sgYB70Mx8k4+5mdHLI9pzh4jE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B827F8056F; Wed, 18 Oct 2023 22:34:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F36F8055A;
	Wed, 18 Oct 2023 22:34:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72E65F8055B; Wed, 18 Oct 2023 22:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93D11F8032D
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 22:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D11F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=KW4cTeCv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39IHNxlB003122;
	Wed, 18 Oct 2023 20:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iaF4fZOLwaJ/KZ0QOfrm4IVew7yLHfkgzzwK04I4AIE=;
 b=KW4cTeCvVOwZRO6FsDVGC3bRI3dP+g76ArcwLxyrRqT0WZ+6xBj6WvujSbDhG6lshS0B
 yvvsB++TFm+Ss3Gph9w9V4SXXyWfaKPAfzS/ozuJLVsAaGeqjEX9a4Qr5tBvK/DUA4Kj
 2J4rxNTn86z2QZ8cUuCYjJNLqaIU3/LacdPafs1coND6QAzy5OwVerPKS5OAJjFM0ZMU
 M5b+YJJyBAXrMFGUkS83fpeQNvMxZdl3i45o0N4fQaTolrKlgu/rIKsdy6HVXbzH9xiE
 vhDJPTRRQdvyO5dKRAoQHIjt6aOrVqy4bw7BaAwhbBv8igsdAMsM03OXlFltI70oZofL xw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttg82s19j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:33:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39IKXwRX024079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:33:58 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 13:33:57 -0700
Message-ID: <4ad7b474-257c-9934-8f1b-8ceb3a90af60@quicinc.com>
Date: Wed, 18 Oct 2023 13:33:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20231017200109.11407-24-quic_wcheng@quicinc.com>
 <a8dc2a3a-27a2-40d6-9e67-6ea475701e44@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <a8dc2a3a-27a2-40d6-9e67-6ea475701e44@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TXpSOcmW4EEgl-PLKgoKBfqn-fPLzaEx
X-Proofpoint-ORIG-GUID: TXpSOcmW4EEgl-PLKgoKBfqn-fPLzaEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_18,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=667 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310180169
Message-ID-Hash: RHLUBRA3QHN4REWQNRNYCDIQJZ66XHOM
X-Message-ID-Hash: RHLUBRA3QHN4REWQNRNYCDIQJZ66XHOM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHLUBRA3QHN4REWQNRNYCDIQJZ66XHOM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/17/2023 3:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:00, Wesley Cheng wrote:
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
>> ---
>>   sound/usb/card.h                  |  1 +
>>   sound/usb/pcm.c                   | 19 +++++++++++++++++--
>>   sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
> 
> should this be split in a generic part and a more specific qcom patch?
> 

Got it.

Thanks
Wesley Cheng
