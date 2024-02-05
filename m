Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E03818495C9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 10:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7DBA4A;
	Mon,  5 Feb 2024 10:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7DBA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707123723;
	bh=MtCVmkyd73igsHfqhm9GVwH5JT8L8I7oiOceUhAzTic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZUMWLSSVasRHT1bORRCfXxaPJWdbGRquzJdO7i9caxLnVbHcyC1UCxIg+uLODlCHg
	 iSTwXhWxUs4xYVbQFrPEE1RRVh/9AhtDH+SV+J/uPP9ZOzojWbBVdeD3db65T1WjXr
	 lLPb4l86WtxoP+0JqWE7XOjdbd5u7iOP1keFbx7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C8FCF805AD; Mon,  5 Feb 2024 10:01:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F90F8057B;
	Mon,  5 Feb 2024 10:01:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A71F801EB; Mon,  5 Feb 2024 10:01:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBAD9F8016E
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 10:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBAD9F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QN9G6Yql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707123677; x=1738659677;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MtCVmkyd73igsHfqhm9GVwH5JT8L8I7oiOceUhAzTic=;
  b=QN9G6YqlKbJri1wSIHunorU79Z57i+uFWEtLdZsBwpnZ/90kIU7Z6fhW
   /UvQRKm+xm+RUpGph8dZnbICtoL83OM3ypobKJt+Nyls4Mtw0t+e3Nwyf
   3SyhOGmdC8e8RNbS+SfCE5ldy0q1SB8Q/AU6tGWCeLU9yr6piHzlQZBg+
   x65x6GiEXVRvHtlx1GoUOnphwxgoGjkOkjEY2hBGwa9hihhaiWti6Dka6
   NG9magD5r3crFn1gG4tjI8hBte++du/Din5hsQJOSEmDPUpYofcWIBRRZ
   DWP/ATXeLKNSUj3FWqgD6J/SeUE/cc1z/VSSJT0/q8LC6Ig/Ekt71nOre
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="435614855"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400";
   d="scan'208";a="435614855"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="933099575"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400";
   d="scan'208";a="933099575"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:01:05 -0800
Message-ID: <aaa76d7a-4299-4e1c-83f1-cbbea763927f@linux.intel.com>
Date: Mon, 5 Feb 2024 10:01:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 50/53] ALSA: usb-audio: Allow for rediscovery of
 connected USB SND devices
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-51-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240203023645.31105-51-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FAT6FVWYFSXFU4M3US4WJ3JPUQJMRRNX
X-Message-ID-Hash: FAT6FVWYFSXFU4M3US4WJ3JPUQJMRRNX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAT6FVWYFSXFU4M3US4WJ3JPUQJMRRNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/3/2024 3:36 AM, Wesley Cheng wrote:
> In case of notifying SND platform drivers of connection events, some of
> these use cases, such as offloading, require an ASoC USB backend device to
> be initialized before the events can be handled.  If the USB backend device
> has not yet been probed, this leads to missing initial USB audio device
> connection events.
> 
> Expose an API that traverses the usb_chip array for connected devices, and
> to call the respective connection callback registered to the SND platform
> driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   sound/usb/card.c                  | 19 +++++++++++++++++++
>   sound/usb/card.h                  |  2 ++
>   sound/usb/qcom/qc_audio_offload.c |  2 ++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 11b827b7a2a5..995b2df676ab 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -202,6 +202,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>   }
>   EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>   
> +/*
> + * in case the platform driver was not ready at the time of USB SND
> + * device connect, expose an API to discover all connected USB devices
> + * so it can populate any dependent resources/structures.
> + */
> +void snd_usb_rediscover_devices(void)
> +{
> +	int i;
> +
> +	mutex_lock(&register_mutex);
> +	for (i = 0; i < SNDRV_CARDS; i++) {
> +		if (usb_chip[i])
> +			if (platform_ops && platform_ops->connect_cb)
> +				platform_ops->connect_cb(usb_chip[i]);

if inside if, it can just be && or maybe move callback check before 
mutex lock and just return early if it is not present?

> +	}
> +	mutex_unlock(&register_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
> +
>   /*
>    * disconnect streams
>    * called from usb_audio_disconnect()
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 6d59995440c3..3a0d68f453a1 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -222,11 +222,13 @@ int snd_usb_unregister_platform_ops(void);
>   #if IS_ENABLED(CONFIG_SND_USB_AUDIO)
>   struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>   			struct snd_pcm_hw_params *params, int direction);
> +void snd_usb_rediscover_devices(void);
>   #else
>   static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>   			struct snd_pcm_hw_params *params, int direction)
>   {
>   	return NULL;
>   }
> +static void snd_usb_rediscover_devices(void) { }
>   #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
>   #endif /* __USBAUDIO_CARD_H */
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 08af82ec22ad..9b0f98600e58 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -1867,6 +1867,8 @@ static int __init qc_usb_audio_offload_init(void)
>   	if (ret < 0)
>   		goto release_qmi;
>   
> +	snd_usb_rediscover_devices();
> +
>   	return 0;
>   
>   release_qmi:
> 

