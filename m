Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE37CEDA3
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 03:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E585784A;
	Thu, 19 Oct 2023 03:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E585784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697679634;
	bh=vxdAGujpDtCNI12G6NXOlJFZSVNKFibMBqx/hbZD/ls=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MqBgcP5kXr2pyfjwJUDxa4Xym7CrtmcllsOPJkCc8QY1HCbAWzG3b/02lTv6lLolI
	 uQjXLIW7DdLsnthvX2VQvb+1EuXn7n85YDRUYEafBo5yE3xoMYLiFGnVVyEjJWfYMn
	 Wc9uqHd6ypmIIP950RwYhpr3ePQMepl/rEgbLkYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22647F800C9; Thu, 19 Oct 2023 03:39:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0723BF8024E;
	Thu, 19 Oct 2023 03:39:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A292F8025F; Thu, 19 Oct 2023 03:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D5A2F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 03:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5A2F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=iq2kN6e6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39J0fwvC016015;
	Thu, 19 Oct 2023 01:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RFlXQZL0GJrOfdJ6F4mLGhNhvWTNn3ZBCbC8IEXKLm8=;
 b=iq2kN6e6SPT4AxACP3T0IWzWC2felSJrrJw76Id655m6Uk6vTZK1788SLphMznZKrj+V
 ToaISwRzDTFk4h9QC8qzhmk26lDiL/a4bbDJcS3jpO49nv+s3BXa0Afkokzf02g4n4IJ
 JvTO/DFnRtDw06bT0w3THm+SR+xdgbTLI9iKX7GR9p8l20pFadPsfctFfwEcEkia04Y/
 T0KJQRxcJe08+Qn3XrZ8x/YNEmAA9F1VZA2T3YMA/W/G26uqmJGtHL0fepF6zku3vfql
 GX4ZRM4NN4Jgk9n/Hr150bgauCcpeUSTVD+1LshOZ38sY+vD87cT7ZCSAmQ5LwMPKmUb Sg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttnnagjgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 01:39:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39J1dH7m025544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 01:39:17 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 18:39:16 -0700
Message-ID: <8e08fd5e-91b8-c73e-1d97-7cf4d98573d4@quicinc.com>
Date: Wed, 18 Oct 2023 18:39:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 29/34] ASoC: qcom: qdsp6: Add SND kcontrol to select
 offload device
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
 <20231017200109.11407-30-quic_wcheng@quicinc.com>
 <d218b8e2-d7b9-40a3-bfb3-da6a90404a8c@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <d218b8e2-d7b9-40a3-bfb3-da6a90404a8c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ScvzUo-ubiID8YuRcoK0RmZmXn3qUkAw
X-Proofpoint-ORIG-GUID: ScvzUo-ubiID8YuRcoK0RmZmXn3qUkAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_02,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190011
Message-ID-Hash: CQCDLQBAR2FAY3A5SPX52LDW25FH53E5
X-Message-ID-Hash: CQCDLQBAR2FAY3A5SPX52LDW25FH53E5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQCDLQBAR2FAY3A5SPX52LDW25FH53E5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/17/2023 3:50 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:01, Wesley Cheng wrote:
>> Expose a kcontrol on the platform sound card, which will allow for
>> userspace to determine which USB card number and PCM device to offload.
>> This allows for userspace to potentially tag an alternate path for a
>> specific USB SND card and PCM device.  Previously, control was absent, and
>> the offload path would be enabled on the last USB SND device which was
>> connected.  This logic will continue to be applicable if no mixer input is
>> received for specific device selection.
>>
>> An example to configure the offload device using tinymix:
>> tinymix -D 0 set 'Q6USB offload SND device select' 1 0
>>
>> The above will set the Q6AFE device token to choose offload on card#1 and
>> pcm#0.  Device selection is made possible by setting the Q6AFE device
>> token.  The audio DSP utilizes this parameter, and will pass this field
>> back to the USB offload driver within the QMI stream requests.
> 
> This still begs the question on how userspace would figure what the
> card1 is and which endpoint is used when PCM0 is opened?
> 

Assuming we have something maybe in the component string for card1, then 
maybe that will help in this case as you mentioned earlier.  Again, I 
think my understanding of "endpoint" here is referring to the USB 
endpoint.  However, that isn't normally how we should think about it. 
 From the USB sound perspective, it would be the USB interface that is 
selected, and the USB endpoints that that interface descriptor includes 
(up to 2 usb eps).

> Ideally userpace would not have to know anything about "Q6USB".
> Presumably when other vendors expose their USB offload solution, we
> would want a generic control name, no?
> 

Hmm...initially I was keeping the sound kcontrol implementation based on 
a vendor specific approach.  Although, it might be good to standardize 
it a bit.  I could see if we can add this to within soc-usb so whenever 
we just create a soc usb device, it would also create and initialize the 
kcontrols as well?

> Jaroslav should chime in on this one :-)
> 
> 
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6usb.c | 125 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 122 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
>> index d697cbe7f184..a95276b7d91d 100644
>> --- a/sound/soc/qcom/qdsp6/q6usb.c
>> +++ b/sound/soc/qcom/qdsp6/q6usb.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/dma-map-ops.h>
>>   
>>   #include <sound/pcm.h>
>> +#include <sound/control.h>
>>   #include <sound/soc.h>
>>   #include <sound/soc-usb.h>
>>   #include <sound/pcm_params.h>
>> @@ -35,9 +36,12 @@ struct q6usb_port_data {
>>   	struct q6afe_usb_cfg usb_cfg;
>>   	struct snd_soc_usb *usb;
>>   	struct q6usb_offload priv;
>> +	struct mutex mutex;
> 
> missing comment on what this protects. "mutex" is really a poor
> choice/name if I am honest.
> 
>>   	unsigned long available_card_slot;
>>   	struct q6usb_status status[SNDRV_CARDS];
>> -	int active_idx;
>> +	bool idx_valid;
>> +	int sel_card_idx;
>> +	int sel_pcm_idx;
>>   };
> 
>> +/* Build a mixer control for a UAC connector control (jack-detect) */
>> +static void q6usb_connector_control_init(struct snd_soc_component *component)
>> +{
>> +	int ret;
>> +
>> +	ret = snd_ctl_add(component->card->snd_card,
>> +				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
>> +	if (ret < 0)
>> +		return;
> 
> that error handling does not seem terribly useful...
> 

Based on your earlier comment, this might change :)

Thanks
Wesley Cheng

