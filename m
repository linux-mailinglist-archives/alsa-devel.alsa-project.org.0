Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F171760E58
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7286BED7;
	Tue, 25 Jul 2023 11:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7286BED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276798;
	bh=LKtaiWNgDWK8U+v+CSkjSmMLNgc+6CwnEmQrVA3o6hk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Il2f/elzgfZfxj5VBwKuP7PnVMqp/A2soPf7XdfRxPbKzdANgSrZTI4hDfPusUa2N
	 mnwY9t/6EyD+qncE48OFoui/PEmAm/ceV8vXKfLkHvZmcyN1DYpVPLwzpcEUYbhIa0
	 aOQbCZeazT/o0mSfF0FN7mUPHNxkeoanBXUfsmPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04DE4F80153; Tue, 25 Jul 2023 11:18:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 671B6F80153;
	Tue, 25 Jul 2023 11:18:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55D1FF80549; Tue, 25 Jul 2023 11:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FE86F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE86F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e863I8Jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276718; x=1721812718;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LKtaiWNgDWK8U+v+CSkjSmMLNgc+6CwnEmQrVA3o6hk=;
  b=e863I8JpgRIGBHGEW5jZmcDrPQqWIY7BhshJNFBAUcgBNz7Gk/W064At
   jocZeCUAqDk6Q+yQt+xfF5WnnWASUFRSGwzxWwx7XlJFzhWOhUbmcQKnO
   9vzqqqmLpNy8CSlRbDyRK/vmSXac4ZXLMPQrYTin8xuqrKrSAF8lbWkRk
   aRXsr3NuQwGr31Riu2yHOVsBAJM/Cd8LRtMdJK9/JaWsoYMlpLszCZEZd
   WoI4ptkzRqLxh6v8IhMu+mmGnRw0WOODW+dhdpRleormIVFDapyc6xOPe
   z2ZsvzcejGKni1lapHleodSLQnDbL3UuEYexMdPEVbzMEmGEZt6F05Uvv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="454048841"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="454048841"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980312"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="719980312"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:28 -0700
Message-ID: <eb1c679b-f50b-1f20-c7c8-da3f4857bec1@linux.intel.com>
Date: Tue, 25 Jul 2023 10:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 08/32] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, oneukum@suse.com, albertccwang@google.com,
 o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-9-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230725023416.11205-9-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZUVHFIFGEJ7QLFYYU66Y7XCGASM4SYPG
X-Message-ID-Hash: ZUVHFIFGEJ7QLFYYU66Y7XCGASM4SYPG
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUVHFIFGEJ7QLFYYU66Y7XCGASM4SYPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static const struct snd_soc_dai_ops q6usb_ops = {
> +	.prepare	= q6afe_dai_prepare,
> +	.hw_params	= q6usb_hw_params,
> +	.shutdown	= q6afe_dai_shutdown,

it's a bit odd to see a .shutdown without a .startup?

Is this intentional and should a comment be added?


> +/* device token of actual end USB aduio device */

audio

> +	u32                  dev_token;
> +/* endianness of this interface */
> +	u32                   endian;
> +/* service interval */
> +	u32                  service_interval;
> +} __packed;
> +
> +/**
> + * struct afe_param_id_usb_audio_dev_params
> + * @cfg_minor_version: Minor version used for tracking USB audio device
> + * configuration.
> + * Supported values:
> + *     AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
> + * @dev_token: device token of actual end USB aduio device

audio. please run a spell-checker.


> +	svc_int.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	svc_int.svc_interval = pcfg->usb_cfg.service_interval;
> +	ret = q6afe_port_set_param_v2(port, &svc_int,
> +				      AFE_PARAM_ID_USB_AUDIO_SVC_INTERVAL,
> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(svc_int));
> +	if (ret) {
> +		dev_err(port->afe->dev, "%s: AFE device param cmd svc_interval failed %d\n",
> +			__func__, ret);
> +		ret = -EINVAL;

why do you override the return value?

> +		goto exit;

not necessary, this is a jump to the next line. Looks like copy-paste ...

> +	}
> +exit:
> +	return ret;
> +}
> +
> +/**
> + * q6afe_usb_port_prepare() - Prepare usb afe port.
> + *
> + * @port: Instance of afe port
> + * @cfg: USB configuration for the afe port
> + *
> + */
> +void q6afe_usb_port_prepare(struct q6afe_port *port,
> +			     struct q6afe_usb_cfg *cfg)
> +{
> +	union afe_port_config *pcfg = &port->port_cfg;
> +
> +	pcfg->usb_cfg.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	pcfg->usb_cfg.sample_rate = cfg->sample_rate;
> +	pcfg->usb_cfg.num_channels = cfg->num_channels;
> +	pcfg->usb_cfg.bit_width = cfg->bit_width;
> +
> +	afe_port_send_usb_dev_param(port, cfg);
> +}
> +EXPORT_SYMBOL_GPL(q6afe_usb_port_prepare);
> +
>  /**
>   * q6afe_hdmi_port_prepare() - Prepare hdmi afe port.
>   *
> @@ -1611,7 +1791,10 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
>  		break;
>  	case AFE_PORT_ID_WSA_CODEC_DMA_RX_0 ... AFE_PORT_ID_RX_CODEC_DMA_RX_7:
>  		cfg_type = AFE_PARAM_ID_CODEC_DMA_CONFIG;
> -	break;
> +		break;
> +	case AFE_PORT_ID_USB_RX:
> +		cfg_type = AFE_PARAM_ID_USB_AUDIO_CONFIG;
> +		break;
>  	default:
>  		dev_err(dev, "Invalid port id 0x%x\n", port_id);
>  		return ERR_PTR(-EINVAL);
> diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
> index 30fd77e2f458..e098a3e15135 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.h
> +++ b/sound/soc/qcom/qdsp6/q6afe.h
> @@ -5,7 +5,7 @@
>  
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  
> -#define AFE_PORT_MAX		129
> +#define AFE_PORT_MAX		130
>  
>  #define MSM_AFE_PORT_TYPE_RX 0
>  #define MSM_AFE_PORT_TYPE_TX 1
> @@ -205,6 +205,47 @@ struct q6afe_cdc_dma_cfg {
>  	u16	active_channels_mask;
>  };
>  
> +/**
> + * struct q6afe_usb_cfg
> + * @cfg_minor_version: Minor version used for tracking USB audio device
> + * configuration.
> + * Supported values:
> + *     AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
> + * @sample_rate: Sampling rate of the port
> + *    Supported values:
> + *      AFE_PORT_SAMPLE_RATE_8K
> + *      AFE_PORT_SAMPLE_RATE_11025
> + *      AFE_PORT_SAMPLE_RATE_12K
> + *      AFE_PORT_SAMPLE_RATE_16K
> + *      AFE_PORT_SAMPLE_RATE_22050
> + *      AFE_PORT_SAMPLE_RATE_24K
> + *      AFE_PORT_SAMPLE_RATE_32K
> + *      AFE_PORT_SAMPLE_RATE_44P1K
> + *      AFE_PORT_SAMPLE_RATE_48K
> + *      AFE_PORT_SAMPLE_RATE_96K
> + *      AFE_PORT_SAMPLE_RATE_192K
> + * @bit_width: Bit width of the sample.
> + *    Supported values: 16, 24
> + * @num_channels: Number of channels
> + *    Supported values: 1, 2
> + * @data_format: Data format supported by the USB
> + *    Supported values: 0
> + * @reserved: this field must be 0
> + * @dev_token: device token of actual end USB audio device
> + * @endian: endianness of this interface
> + * @service_interval: service interval
> + **/
> +struct q6afe_usb_cfg {
> +	u32	cfg_minor_version;
> +	u32     sample_rate;
> +	u16	bit_width;
> +	u16	num_channels;
> +	u16	data_format;
> +	u16	reserved;
> +	u32	dev_token;
> +	u32	endian;
> +	u32	service_interval;
> +};

this definition looks exactly the same as
struct afe_param_id_usb_cfg
??


