Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6966B1F2D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 10:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D64118AE;
	Thu,  9 Mar 2023 10:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D64118AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678352590;
	bh=Cgo4W6rFz3Q5VUS82mDk1MyT27KduuA9Bti6vXIfnK0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XJ4Qk9Tt02nz4YI26UBA3CGJrzsudxwvO0l9ruuCW/tLl572op4OM5sJJZ3msVWA8
	 RhdwgEa0bwfbdWcO4R34QOY2aZMPVEMq6lgUM97+T8v0bYHviVNZvEqmvvimLGkE2b
	 XlePxW9i1GUEjDMpC3dsJ322mj91BqKfJ4Q7z7SY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB61F80431;
	Thu,  9 Mar 2023 10:01:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCB94F80548; Thu,  9 Mar 2023 10:01:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B210F80527
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 10:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B210F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MYj5TE0j
Received: by mail-wr1-x42c.google.com with SMTP id t15so1103869wrz.7
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Mar 2023 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678352506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8CQkC9OKwU3VsIa2nf3U05xE98iUfK4LW1TYxB/3tI=;
        b=MYj5TE0jJc7l2vPVRyit2vIGEMAyUrDqLnBGepVOW1odiuc+k4ciras8kko/sozUUW
         vi4R/JU5OQcpp735C9i684ITMDmtOPxqpep+RJ6zLkzywq660S33mm4weKMRRBPp/1yS
         SMR+DyZ8YVKX0T3kTqhxO9GEQyeSzcaUWqJq2MWpM6wz5Cik8RdpzhTq0pcfxs/ncXVr
         QszU84uR8jVMI64hbupjTnlVovYh1piAUWiOTUDkBww5PRmVKhnxcHwUuAwZIrfpW5PE
         tOLzNt2AYSyhkjjwisAPTGC8VbmBsnVP85oQWugT+AxNkJD93mGqHE4webN/P6GoimDk
         OBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8CQkC9OKwU3VsIa2nf3U05xE98iUfK4LW1TYxB/3tI=;
        b=MPO0TVF5UpcMrnIrIn3x5ma1eB6cR+0hBWdWmLS6Qfm7Ql5Ci2neW6fCywlYhZw4lb
         1Co8hAW8MzssHrFNLTfmV3jRnI+0fkZR2GOzsOxUzamUMs32vgwU+yzwxcE9Lxki4wsT
         u6aex9VWKnxhBPSZAsebkA/NWywo0OSlgwqInmI1O7GCiEDtpQaWGfsyAUJQxBb7OB1s
         SUYDrjja/6eiL96nEq+osbEwT9gPACNurvXkPWgPdA6nIoL5h1wimxDj5Ri0Zija32GB
         CyUfjN9dCE5rn7pEUt8XoX0DfkTKHerZwCz+sii47fSd2KuHuoIMyU0G/AB8q+W61x0j
         5c+g==
X-Gm-Message-State: AO0yUKW2yqq6RKpElAGqyccz2SN1iRruUmbQECV5Z6jWu+rL5symmfWp
	h2S4+UPfeMDY3W4jZlN3SLgwxA==
X-Google-Smtp-Source: 
 AK7set94/uBbxAP9k/mAaOEV4tcPv7xSDqz7no4qrbr0MZqgg4K44iNP8R+95z+Ew4poEF3lN85/Mg==
X-Received: by 2002:a5d:5706:0:b0:2c7:b8a0:c42a with SMTP id
 a6-20020a5d5706000000b002c7b8a0c42amr11938511wrv.31.1678352506073;
        Thu, 09 Mar 2023 01:01:46 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm17689178wrw.116.2023.03.09.01.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:01:45 -0800 (PST)
Message-ID: <ae214ad1-3eb0-3a54-d0d2-ac9812aad186@linaro.org>
Date: Thu, 9 Mar 2023 09:01:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 22/28] ASoC: qcom: qdsp6: q6afe: Split USB AFE
 dev_token param into separate API
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-23-quic_wcheng@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230308235751.495-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MMF46KVD6PCMF7P7VT5BF7LTRLEUF4J3
X-Message-ID-Hash: MMF46KVD6PCMF7P7VT5BF7LTRLEUF4J3
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMF46KVD6PCMF7P7VT5BF7LTRLEUF4J3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/03/2023 23:57, Wesley Cheng wrote:
> The Q6USB backend can carry information about the available USB SND cards
> and PCM devices discovered on the USB bus.  The dev_token field is used by
> the audio DSP to notify the USB offload driver of which card and PCM index
> to enable playback on.  Separate this into a dedicated API, so the USB
> backend can set the dev_token accordingly.  The audio DSP does not utilize
> this information until the AFE port start command is sent, which is done
> during the PCM prepare phase.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 49 +++++++++++++++++++++++++-----------
>   sound/soc/qcom/qdsp6/q6afe.h |  1 +
>   2 files changed, 36 insertions(+), 14 deletions(-)
> 
Looks like this could be part of [06/28] ASoC: qcom: qdsp6: Introduce 
USB AFE port to q6dsp

you are modifying the 06/28 patch in this patch.

other than that it looks fine to me.

--srini

> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index e9d5fa6b6b0d..505371c96987 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1394,10 +1394,42 @@ void q6afe_tdm_port_prepare(struct q6afe_port *port,
>   }
>   EXPORT_SYMBOL_GPL(q6afe_tdm_port_prepare);
>   
> -static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
> +/**
> + * afe_port_send_usb_dev_param() - Send USB dev token
> + *
> + * @port: Instance of afe port
> + * @cardidx: USB SND card index to reference
> + * @pcmidx: USB SND PCM device index to reference
> + *
> + * The USB dev token carries information about which USB SND card instance and
> + * PCM device to execute the offload on.  This information is carried through
> + * to the stream enable QMI request, which is handled by the offload class
> + * driver.  The information is parsed to determine which USB device to query
> + * the required resources for.
> + */
> +int afe_port_send_usb_dev_param(struct q6afe_port *port, int cardidx, int pcmidx)
>   {
> -	union afe_port_config *pcfg = &port->port_cfg;
>   	struct afe_param_id_usb_audio_dev_params usb_dev;
> +	int ret;
> +
> +	memset(&usb_dev, 0, sizeof(usb_dev));
> +
> +	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	usb_dev.dev_token = (cardidx << 16) | (pcmidx << 8);
> +	ret = q6afe_port_set_param_v2(port, &usb_dev,
> +				AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
> +				AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
> +	if (ret)
> +		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
> +			__func__, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(afe_port_send_usb_dev_param);
> +
> +static int afe_port_send_usb_params(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
> +{
> +	union afe_port_config *pcfg = &port->port_cfg;
>   	struct afe_param_id_usb_audio_dev_lpcm_fmt lpcm_fmt;
>   	struct afe_param_id_usb_audio_svc_interval svc_int;
>   	int ret = 0;
> @@ -1408,20 +1440,9 @@ static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb
>   		goto exit;
>   	}
>   
> -	memset(&usb_dev, 0, sizeof(usb_dev));
>   	memset(&lpcm_fmt, 0, sizeof(lpcm_fmt));
>   	memset(&svc_int, 0, sizeof(svc_int));
>   
> -	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> -	q6afe_port_set_param_v2(port, &usb_dev,
> -				AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
> -				AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
> -	if (ret) {
> -		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
>   	lpcm_fmt.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
>   	lpcm_fmt.endian = pcfg->usb_cfg.endian;
>   	ret = q6afe_port_set_param_v2(port, &lpcm_fmt,
> @@ -1465,7 +1486,7 @@ void q6afe_usb_port_prepare(struct q6afe_port *port,
>   	pcfg->usb_cfg.num_channels = cfg->num_channels;
>   	pcfg->usb_cfg.bit_width = cfg->bit_width;
>   
> -	afe_port_send_usb_dev_param(port, cfg);
> +	afe_port_send_usb_params(port, cfg);
>   }
>   EXPORT_SYMBOL_GPL(q6afe_usb_port_prepare);
>   
> diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
> index e098a3e15135..7980416275e9 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.h
> +++ b/sound/soc/qcom/qdsp6/q6afe.h
> @@ -274,6 +274,7 @@ void q6afe_tdm_port_prepare(struct q6afe_port *port, struct q6afe_tdm_cfg *cfg);
>   void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
>   				struct q6afe_cdc_dma_cfg *cfg);
>   
> +int afe_port_send_usb_dev_param(struct q6afe_port *port, int cardidx, int pcmidx);
>   int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   			  int clk_src, int clk_root,
>   			  unsigned int freq, int dir);
