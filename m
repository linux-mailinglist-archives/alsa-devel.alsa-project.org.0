Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1E96C7E0
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 21:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69B61E72;
	Wed,  4 Sep 2024 21:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69B61E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725479209;
	bh=e5YRCfHcSxajoDuqX351heIe3Wzdm2U2L0IQCNWWeXQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LW9+9zZvC4ozkrmjnSinoEz7UtQuO2Gp78pFE2beP6XxeDAvKG4hHw1Si0lrW7zP1
	 F0dPdk0EfSl/gvKbN2dX1Hd5WJyKqXAzL3CuFykOcA9SipGJmIFQQ44Imwu4Lk6xOh
	 y9y+Zqsvc+cp+96v/60SX+oMyobf1VcOrScowUSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88FCBF805B1; Wed,  4 Sep 2024 21:46:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2B8F805A1;
	Wed,  4 Sep 2024 21:46:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C73DEF8016C; Wed,  4 Sep 2024 21:46:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B118FF800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 21:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B118FF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=l4NlHtMR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 484IoaCp028269;
	Wed, 4 Sep 2024 19:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L5/ijFquyhl43s4ge7n4rzdYP9Bspig+YmhsVPizDQ=; b=l4NlHtMRF8vNO7MP
	nOQCFcFhJ2p34IS3ayCQypwnosMjNNcY1PKjL2lmN+4U6e52LGqMnttmJHnMZ6Sk
	tprRbJDmIDPf1A7LIrtMXJkT/SLsVAIWKE/3iqWfY/mJK0AHJ7syVBy7HwXAW+3P
	k/YsDqdmGUX0MjtBMA8Okxj9PO5NZu13f0hJ0Ptl2vb7YPPRYGPfIFl2LvbiqU+8
	z/3WnSZ+/k+LeqBkSYJFkT5y2J8LczrwNup0TWjbkAJowbTOnPLVtW3Ul3fmLvG+
	YrieTiYgDm999u0Y9qoZYtf9XqKdE4Z/I+6FLDV6L8kFZEZl7q8YDrmdBHeVLUXx
	lINI9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxuu79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 19:46:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 484Jk4kw023645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 19:46:04 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 12:46:03 -0700
Message-ID: <93d2eecf-ed79-41cf-b38b-ede432093aec@quicinc.com>
Date: Wed, 4 Sep 2024 12:46:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 30/33] ALSA: usb-audio: qcom: Use card and PCM index
 from QMI request
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
 <20240829194105.1504814-31-quic_wcheng@quicinc.com>
 <f8090415-e0ae-4923-bdc8-58622623fc9d@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f8090415-e0ae-4923-bdc8-58622623fc9d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r8piAAQeh2qxXzfDR-ckpRBOOeNMPYga
X-Proofpoint-ORIG-GUID: r8piAAQeh2qxXzfDR-ckpRBOOeNMPYga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_17,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409040149
Message-ID-Hash: XG7QAUG6J6ACGI3HVHYAAT6Z34B6IQRF
X-Message-ID-Hash: XG7QAUG6J6ACGI3HVHYAAT6Z34B6IQRF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XG7QAUG6J6ACGI3HVHYAAT6Z34B6IQRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:58 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:41, Wesley Cheng wrote:
>> Utilize the card and PCM index coming from the USB QMI stream request.
>> This field follows what is set by the ASoC USB backend, and could
>> potentially carry information about a specific device selected through the
>> ASoC USB backend.  The backend also has information about the last USB
>> sound device plugged in, so it can choose to select the last device plugged
>> in, accordingly.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/qcom/qc_audio_offload.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index 0bd533f539e4..a7ad15404fd1 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -106,8 +106,6 @@ struct uaudio_qmi_dev {
>>  	bool er_mapped;
>>  	/* reference count to number of possible consumers */
>>  	atomic_t qdev_in_use;
>> -	/* idx to last udev card number plugged in */
>> -	unsigned int last_card_num;
>>  };
>>  
>>  struct uaudio_dev {
>> @@ -1261,7 +1259,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
>>  
>>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
>>  	xfer_buf_len = req_msg->xfer_buff_size;
>> -	card_num = uaudio_qdev->last_card_num;
>> +	card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>>  
>>  	if (!uadev[card_num].ctrl_intf) {
>>  		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
>> @@ -1455,8 +1453,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  
>>  	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
>>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
>> -	pcm_card_num = req_msg->enable ? uaudio_qdev->last_card_num :
>> -				ffs(uaudio_qdev->card_slot) - 1;
>> +	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>>  	if (pcm_card_num >= SNDRV_CARDS) {
>>  		ret = -EINVAL;
>>  		goto response;
>> @@ -1706,7 +1703,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>>  		sdev->card_idx = chip->card->number;
>>  		sdev->chip_idx = chip->index;
>>  
>> -		uaudio_qdev->last_card_num = chip->card->number;
>>  		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>>  	}
> This entire path seems like a bad split/merge, it removes stuff that was
> done earlier. Also it's not clear what this has to do with 'QMI', card
> and PCM device management is usually done at a higher level.
>
> not following, please be mindful of reviewer fatigue when adding such
> changes in patch 30/33....

I'll just add this as part of patch#28.  I think before I did the reordering of the series, this made a bit more sense to have as a patch on its own.  Now that the entire framework for the audio dsp to know about the card and pcm index is already done in previous patches, the plumbing is done for the qc_audio_offload to utilize the fields coming from the audio DSP, as they will carry valid values.

Thanks

Wesley Cheng

