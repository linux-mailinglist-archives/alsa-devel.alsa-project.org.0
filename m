Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA797CED11
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 03:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1ED850;
	Thu, 19 Oct 2023 02:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1ED850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697677244;
	bh=eavOACmHYokazsBkS+BBUG7CBgtzAzkIvZrRZIfZDlQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tfPm1kGM2PEpFTvTotMz3TMCwdQCetc9hPCtd3ty320KQu5ELEjiOJFT2nmQa4qWF
	 K49bzoxcrV8L/xw9sx33MPxgyD19RyP6FGsFoYiwjzdiq3LveQLZti0kDPbfOxTflT
	 e3g210VLetnH0ZRRwhL8PRQwd5chzChYdg1422Mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 799D7F80166; Thu, 19 Oct 2023 02:59:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF2D2F8024E;
	Thu, 19 Oct 2023 02:59:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85FC1F8025F; Thu, 19 Oct 2023 02:59:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 852F1F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 02:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852F1F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=NrXB02W0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39J0DwaD031587;
	Thu, 19 Oct 2023 00:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WHUvugpr6KLorkTcxKPRCIoYWT6kKL93ofu2ItgFQks=;
 b=NrXB02W0ztp9xUNXaiBgX2Mm+irAuZaa8/86sekmPoP7PyyKgAJHSQl4jc8z2PBPxaNc
 WdK/N/8aFLrSoji40fKBG6pan7yhVi9bj/G9bm13qgcledi1oLh+Yinffz3bClS3o3Fn
 JbztouNhI5xYHZAwGH1AQUgXL9nxNot/2rPehkzmY5gIDJjJjV5MsHIpMd9CPwytmFRe
 F2ZjYJyOeMWDVMw+7i49wiL/+WVkKNTonTN/gNNRCeBUKC8vT0huYRRXBKjyN3k/uL70
 0ZmL+mzv3sGYkXfHKOBc5kcdwYvu0wTX4QuZuwvzIWChvuFoYhZKvMcuWmDeHxkjPYnG rQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt9kjt9be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 00:59:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39J0xHfL013726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 00:59:17 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 17:59:16 -0700
Message-ID: <9deea5fb-f94b-a525-59f5-4390f9286ed6@quicinc.com>
Date: Wed, 18 Oct 2023 17:59:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 27/34] ALSA: usb-audio: qcom: Populate PCM and USB chip
 information
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
 <20231017200109.11407-28-quic_wcheng@quicinc.com>
 <d188fcef-2cc4-43b7-b296-7091e5d1a973@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <d188fcef-2cc4-43b7-b296-7091e5d1a973@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4neIZfdXtQw7b_eEd_Y_2yQC5ED7Bb8q
X-Proofpoint-GUID: 4neIZfdXtQw7b_eEd_Y_2yQC5ED7Bb8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_19,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=682 spamscore=0 mlxscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190005
Message-ID-Hash: 22FHOZBTFID3SL5MXZKBBJYDMRW4JDAA
X-Message-ID-Hash: 22FHOZBTFID3SL5MXZKBBJYDMRW4JDAA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22FHOZBTFID3SL5MXZKBBJYDMRW4JDAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/17/2023 3:41 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:01, Wesley Cheng wrote:
>> Currently, only the index to the USB SND card array is passed to the USB
>> backend.  Pass through more information, specifically the USB SND card
>> number and the number of PCM devices available.  This allows for the DPCM
>> backend to determine what USB resources are available during situations,
>> such as USB audio offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/qcom/qc_audio_offload.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index bd6b84f72c74..ae74098b41f5 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -173,6 +173,21 @@ enum usb_qmi_audio_format {
>>   	USB_QMI_PCM_FORMAT_U32_BE,
>>   };
>>   
>> +static int usb_qmi_get_pcm_num(struct snd_usb_audio *chip, int direction)
>> +{
>> +	struct snd_usb_substream *subs = NULL;
>> +	struct snd_usb_stream *as;
>> +	int count = 0;
>> +
>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>> +		subs = &as->substream[direction];
>> +		if (subs->ep_num)
>> +			count++;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>>   static enum usb_qmi_audio_device_speed_enum_v01
>>   get_speed_info(enum usb_device_speed udev_speed)
>>   {
>> @@ -1592,6 +1607,8 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>>   
>>   	sdev->card_idx = chip->card->number;
>>   	sdev->chip_idx = chip->index;
>> +	sdev->num_playback = usb_qmi_get_pcm_num(chip, 0);
>> +	sdev->num_capture = usb_qmi_get_pcm_num(chip, 1);
>>   	uadev[chip->card->number].sdev = sdev;
>>   
>>   	uaudio_qdev->last_card_num = chip->card->number;
>> @@ -1706,10 +1723,8 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
>>   	mutex_unlock(&chip->mutex);
>>   
>>   	atomic_dec(&uaudio_qdev->qdev_in_use);
>> -	if (!atomic_read(&uaudio_qdev->qdev_in_use)) {
>> -		snd_soc_usb_disconnect(usb_get_usb_backend(udev));
> 
> this also feels like a patch split issue, removing this
> snd_soc_usb_disconnect() has nothing to do with the "populate PCM and
> USB chip information" ?
> 

Will fix this.

Thanks
Wesley Cheng

