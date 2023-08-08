Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3704773523
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 01:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE61823;
	Tue,  8 Aug 2023 01:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE61823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691451650;
	bh=v6JKqD81R7mD2JI4mqoR4U9voGgl8I3AyBJgT5RFq5M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZIKgcW58AgwHXy/xnt2xFRbr5UnL5pkULL7uYKmTa++acKtME0N3A1o4+cmFSJFv
	 N4S3cQPItKKNU6+43HRnEv2ryLAT4Wj9Kl5JGUdup/Ua50rQwxE1RHieN5y0q136Ii
	 3FlQaFBLXjtBr9LnN98OYv0iCyY/OwZUhIGUdzCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B0DAF8016B; Tue,  8 Aug 2023 01:39:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F73F8016B;
	Tue,  8 Aug 2023 01:39:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E144F8016D; Tue,  8 Aug 2023 01:39:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C2C9F8016A
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 01:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2C9F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Zso+mmjP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377Mqs1P009757;
	Mon, 7 Aug 2023 23:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0RfEQDLxhKFTA8DuiPQcRgmthhpURSf1M+h5DOhmCvk=;
 b=Zso+mmjPZkTMYGLEjTsJUZJwvalERlNMYyIvZDS0c87Rk+niX1fAVObAL2CKx8xqD+lm
 bH3V/w6/NdnoJ+EP+uo75jw7meW5ro4VuJhUg+7j1cOb2liDUPXafdGBMOA+iotD0Rj3
 FiTWt4c1XLP8otUxr5eqQ7fKiO1ecPVfFrxibP9svjYo0BFXqp8XoXFXhXyoRvnB9rww
 m61HVdLyFTJ4myq3ZtK6S3AoT2Te6x/uf1IhXMSUGiqoscNTLNzI+AvGquiRxGXP+qCY
 +r8XKoBiCIZuH05USigMU4XdVt4DUU1c6Ol7Ar3Mbc02clXZ9uLF1qjPWmntmiFRWaTS DQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sb6jbrca7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 23:39:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 377NdYYe031201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Aug 2023 23:39:34 GMT
Received: from [10.110.124.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 16:39:32 -0700
Message-ID: <6372908e-7dbd-c36f-bfa4-ad3c342e5ce8@quicinc.com>
Date: Mon, 7 Aug 2023 16:39:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 08/32] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <oneukum@suse.com>,
        <albertccwang@google.com>, <o-takashi@sakamocchi.jp>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-9-quic_wcheng@quicinc.com>
 <eb1c679b-f50b-1f20-c7c8-da3f4857bec1@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <eb1c679b-f50b-1f20-c7c8-da3f4857bec1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OsnD4NoW4TBRS7pMQG0naicr_t7--X2B
X-Proofpoint-GUID: OsnD4NoW4TBRS7pMQG0naicr_t7--X2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_25,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070211
Message-ID-Hash: YVP7HKCALT6LM6PPPKPYUD6S4DOVZ6OO
X-Message-ID-Hash: YVP7HKCALT6LM6PPPKPYUD6S4DOVZ6OO
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 7/25/2023 1:27 AM, Pierre-Louis Bossart wrote:
> 
>> +static const struct snd_soc_dai_ops q6usb_ops = {
>> +	.prepare	= q6afe_dai_prepare,
>> +	.hw_params	= q6usb_hw_params,
>> +	.shutdown	= q6afe_dai_shutdown,
> 
> it's a bit odd to see a .shutdown without a .startup?
> 
> Is this intentional and should a comment be added?
> 
> 

That is correct, because the Q6AFE port start command needs to also pass 
in the PCM params, so we wait for the hw_params() callback before 
actually starting the port.  I will add a comment.

>> +/* device token of actual end USB aduio device */
> 
> audio
> 
>> +	u32                  dev_token;
>> +/* endianness of this interface */
>> +	u32                   endian;
>> +/* service interval */
>> +	u32                  service_interval;
>> +} __packed;
>> +
>> +/**
>> + * struct afe_param_id_usb_audio_dev_params
>> + * @cfg_minor_version: Minor version used for tracking USB audio device
>> + * configuration.
>> + * Supported values:
>> + *     AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
>> + * @dev_token: device token of actual end USB aduio device
> 
> audio. please run a spell-checker.
> 
> 

Will fix the typos.

>> +	svc_int.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
>> +	svc_int.svc_interval = pcfg->usb_cfg.service_interval;
>> +	ret = q6afe_port_set_param_v2(port, &svc_int,
>> +				      AFE_PARAM_ID_USB_AUDIO_SVC_INTERVAL,
>> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(svc_int));
>> +	if (ret) {
>> +		dev_err(port->afe->dev, "%s: AFE device param cmd svc_interval failed %d\n",
>> +			__func__, ret);
>> +		ret = -EINVAL;
> 
> why do you override the return value?
> 
>> +		goto exit;
> 
> not necessary, this is a jump to the next line. Looks like copy-paste ...
> 

Thanks, will fix.

>> +	}
>> +exit:
>> +	return ret;
>> +}
>> +
>> +/**
>> + * q6afe_usb_port_prepare() - Prepare usb afe port.
>> + *
>> + * @port: Instance of afe port
>> + * @cfg: USB configuration for the afe port
>> + *
>> + */
>> +void q6afe_usb_port_prepare(struct q6afe_port *port,
>> +			     struct q6afe_usb_cfg *cfg)
>> +{
>> +	union afe_port_config *pcfg = &port->port_cfg;
>> +
>> +	pcfg->usb_cfg.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
>> +	pcfg->usb_cfg.sample_rate = cfg->sample_rate;
>> +	pcfg->usb_cfg.num_channels = cfg->num_channels;
>> +	pcfg->usb_cfg.bit_width = cfg->bit_width;
>> +
>> +	afe_port_send_usb_dev_param(port, cfg);
>> +}
>> +EXPORT_SYMBOL_GPL(q6afe_usb_port_prepare);
>> +
>>   /**
>>    * q6afe_hdmi_port_prepare() - Prepare hdmi afe port.
>>    *
>> @@ -1611,7 +1791,10 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
>>   		break;
>>   	case AFE_PORT_ID_WSA_CODEC_DMA_RX_0 ... AFE_PORT_ID_RX_CODEC_DMA_RX_7:
>>   		cfg_type = AFE_PARAM_ID_CODEC_DMA_CONFIG;
>> -	break;
>> +		break;
>> +	case AFE_PORT_ID_USB_RX:
>> +		cfg_type = AFE_PARAM_ID_USB_AUDIO_CONFIG;
>> +		break;
>>   	default:
>>   		dev_err(dev, "Invalid port id 0x%x\n", port_id);
>>   		return ERR_PTR(-EINVAL);
>> diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
>> index 30fd77e2f458..e098a3e15135 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe.h
>> +++ b/sound/soc/qcom/qdsp6/q6afe.h
>> @@ -5,7 +5,7 @@
>>   
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   
>> -#define AFE_PORT_MAX		129
>> +#define AFE_PORT_MAX		130
>>   
>>   #define MSM_AFE_PORT_TYPE_RX 0
>>   #define MSM_AFE_PORT_TYPE_TX 1
>> @@ -205,6 +205,47 @@ struct q6afe_cdc_dma_cfg {
>>   	u16	active_channels_mask;
>>   };
>>   
>> +/**
>> + * struct q6afe_usb_cfg
>> + * @cfg_minor_version: Minor version used for tracking USB audio device
>> + * configuration.
>> + * Supported values:
>> + *     AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
>> + * @sample_rate: Sampling rate of the port
>> + *    Supported values:
>> + *      AFE_PORT_SAMPLE_RATE_8K
>> + *      AFE_PORT_SAMPLE_RATE_11025
>> + *      AFE_PORT_SAMPLE_RATE_12K
>> + *      AFE_PORT_SAMPLE_RATE_16K
>> + *      AFE_PORT_SAMPLE_RATE_22050
>> + *      AFE_PORT_SAMPLE_RATE_24K
>> + *      AFE_PORT_SAMPLE_RATE_32K
>> + *      AFE_PORT_SAMPLE_RATE_44P1K
>> + *      AFE_PORT_SAMPLE_RATE_48K
>> + *      AFE_PORT_SAMPLE_RATE_96K
>> + *      AFE_PORT_SAMPLE_RATE_192K
>> + * @bit_width: Bit width of the sample.
>> + *    Supported values: 16, 24
>> + * @num_channels: Number of channels
>> + *    Supported values: 1, 2
>> + * @data_format: Data format supported by the USB
>> + *    Supported values: 0
>> + * @reserved: this field must be 0
>> + * @dev_token: device token of actual end USB audio device
>> + * @endian: endianness of this interface
>> + * @service_interval: service interval
>> + **/
>> +struct q6afe_usb_cfg {
>> +	u32	cfg_minor_version;
>> +	u32     sample_rate;
>> +	u16	bit_width;
>> +	u16	num_channels;
>> +	u16	data_format;
>> +	u16	reserved;
>> +	u32	dev_token;
>> +	u32	endian;
>> +	u32	service_interval;
>> +};
> 
> this definition looks exactly the same as
> struct afe_param_id_usb_cfg
> ??
> 
> 

I'll remove some of the params that we aren't utilizing.

Thanks
Wesley Cheng
