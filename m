Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEA85566F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 23:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79FB5B70;
	Wed, 14 Feb 2024 23:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79FB5B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707951521;
	bh=gSUvTrZr3rXl9rxa9h+n04kX3glePcNe2dBEl2CvPt4=;
	h=Date:From:Subject:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nGsCdVbDazzgEtB/lZZN25agpar6fz+QkfzkwcD5+/LQWkHsVE+3g3Yh1erSKhp+m
	 0hYySX2tKC74lADnLERuA3xpW6/sB5KOmAYKIvbAWKl11s9u2alenWeEU8XWY4d/gj
	 WMQ359Vic/CFDklD1iFnJydf3SeU97REeI2o5pQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB59F805A8; Wed, 14 Feb 2024 23:58:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C2ABF805A0;
	Wed, 14 Feb 2024 23:58:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE2BF80238; Wed, 14 Feb 2024 23:58:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 360ADF80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 23:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 360ADF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=b0TWz7o/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41ELrHsR010715;
	Wed, 14 Feb 2024 22:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:from:subject:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=P3WE3lMB3U1jVjyqfIrkGAFwODySyS5IO0j1eUTCPyk=; b=b0
	TWz7o/x3N8/AZ1opgEr/avUwTe6jB8c4OuL3f6079KX9ut38Qho6sMnDxX0/NXRl
	HF9luXKQE71ywu7/88LW1oFOxyhL4GgW3w37hUAn8grY5IK6NIxHgxtQkCcIcGvB
	/ROTjG1H+NIDuw05+h5w8TL+iMduX8yzNMv1Dcxhtf0CGb0n7QzBMnl+V2i2GnTu
	bGgQGVYb/vt9h8ydnmspVOxAbq5g3dcVhRW/397fx3YS2Cy23oRZvFKIaNBNlAiR
	XeWUvyRouBn57ifET7HUpot6IpyddxUxOylXbX5DTuwTJKoJ4uDgDZdUuDUV9ccf
	q4lMtWv3KqmsFRiSHLzQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w92fxghd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 22:57:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41EMvpng005245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 22:57:51 GMT
Received: from [10.71.114.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 14:57:50 -0800
Message-ID: <f2952acb-4f9e-9283-a5bc-1b62164df9bc@quicinc.com>
Date: Wed, 14 Feb 2024 14:57:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v15 39/50] ASoC: Introduce SND kcontrols to select sound
 card and PCM device
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
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
 <20240213005422.3121-40-quic_wcheng@quicinc.com>
 <87y1boy6ps.wl-tiwai@suse.de>
Content-Language: en-US
In-Reply-To: <87y1boy6ps.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iiFOt1LHNH-vK7dJGiW2u-pqhV-t6b_L
X-Proofpoint-ORIG-GUID: iiFOt1LHNH-vK7dJGiW2u-pqhV-t6b_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_14,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140174
Message-ID-Hash: WYMOXLBE3AQZOZLUWT3B3CTUZ34HA7V6
X-Message-ID-Hash: WYMOXLBE3AQZOZLUWT3B3CTUZ34HA7V6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYMOXLBE3AQZOZLUWT3B3CTUZ34HA7V6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/13/2024 2:54 AM, Takashi Iwai wrote:
> On Tue, 13 Feb 2024 01:54:11 +0100,
> Wesley Cheng wrote:
>>
>> +static int soc_usb_get_offload_dev(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct snd_soc_usb *ctx = snd_soc_usb_find_priv_data(component->dev);
>> +	int ret = 0;
>> +
>> +	mutex_lock(&ctx_mutex);
>> +	if (ctx && ctx->get_offload_dev)
>> +		ret = ctx->get_offload_dev(kcontrol, ucontrol);
>> +	mutex_unlock(&ctx_mutex);
> 
> It might be safer to initialize the values with -1 in case when the
> callback isn't available?
> 

Make sense, will do.

>>   /**
>>    * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
>>    * @playback: direction of audio stream
>> @@ -157,6 +218,12 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
>>    */
>>   int snd_soc_usb_add_port(struct snd_soc_usb *usb)
>>   {
>> +	int ret;
>> +
>> +	ret = snd_soc_usb_control_init(usb->component);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>   	mutex_lock(&ctx_mutex);
>>   	list_add_tail(&usb->list, &usb_ctx_list);
>>   	mutex_unlock(&ctx_mutex);
> 
> We may need to remove the control element upon the driver removal,
> too?  In theory, you can unload the offload stuff while snd-usb-audio
> is still active.
> 

This is managing the control for the ASoC platform card that supports 
offloading.  If we compile the different kernel entities as modules, we 
see that the soc_usb layer has the following users:

soc_usb 16384 3 q6usb,snd_usb_audio_qmi,snd_soc_qcom_offload_utils

So we'd need to remove all these modules before we can unload soc_usb. 
The entity which would be related to the kcontrols created for the ASoC 
sound card would be the q6usb module.  Since the q6usb module is tightly 
coupled with the platform soundcard itself in our design, for the q6usb 
module to be removed, we have to remove the entire ASoC sound card. (in 
which the kcontrols will also be removed)

However, that might not always be the case...so its a good idea to just 
manually remove the kcontrols in soc-usb as you guided.

Thanks
Wesley Cheng

