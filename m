Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4B7CD0B5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB7AA4D;
	Wed, 18 Oct 2023 01:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB7AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585166;
	bh=bY8IDP9nHnBzIrIijoSoaM2EG63hwL5A89taKGCs7bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FCWl2FgSluQU8kwBFjQ8pXSEKGuSZBsvrhCdXMEfJWJyYBPmMNZN56GxS34rCvR6j
	 g0wjbBfU9akNvGCqZdNNIz1W2I3gYcNE+zNVr5FTXRfBmAYRvvyPKyKtnYYqxzE5XY
	 oAX5+XiftPVZ7YsWahewkQcbdCQ7RCLCKx5FOpus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1D6AF805BF; Wed, 18 Oct 2023 01:23:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE91F805BD;
	Wed, 18 Oct 2023 01:23:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A57ABF80578; Wed, 18 Oct 2023 01:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7513F8024E
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7513F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bTnmBpvN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585005; x=1729121005;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bY8IDP9nHnBzIrIijoSoaM2EG63hwL5A89taKGCs7bc=;
  b=bTnmBpvNYA6EJtafuiX/S9Qeu/aUPztP47Hb/6LHYZI4QC8nu9lSv2UH
   qTHdOGTagfWlzyRUCBcRvL4FpJ+I5mvwCnte4IZPALWBpkJKm2icLlnmW
   6lkXSjkHzNPYk4ieVyG2/sV1kIQImnKcLXGkXi/d3t3cwHzMiCV12mEjX
   VttttVY0Z9W7Q5BB+4hrN5PXg979pgipxC0yw616RZgYuGMlL2mIwF9EQ
   Lqzo47qDTpbQ0u0arx8qrE4LyUnG73PvSLDtXifrrmW72yhQ9AcnN9N9d
   uOvYBfEIBIrcGyCqPyh93LZPO62iyyJk6ISidLfwcgngwiMC7T6iYceAY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778159"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637489"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637489"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:22 -0700
Message-ID: <d188fcef-2cc4-43b7-b296-7091e5d1a973@linux.intel.com>
Date: Tue, 17 Oct 2023 17:41:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/34] ALSA: usb-audio: qcom: Populate PCM and USB chip
 information
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-28-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-28-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HC3I7F5LTNFCDBSC3YTQ7LGRGRQS3WFC
X-Message-ID-Hash: HC3I7F5LTNFCDBSC3YTQ7LGRGRQS3WFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HC3I7F5LTNFCDBSC3YTQ7LGRGRQS3WFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:01, Wesley Cheng wrote:
> Currently, only the index to the USB SND card array is passed to the USB
> backend.  Pass through more information, specifically the USB SND card
> number and the number of PCM devices available.  This allows for the DPCM
> backend to determine what USB resources are available during situations,
> such as USB audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index bd6b84f72c74..ae74098b41f5 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -173,6 +173,21 @@ enum usb_qmi_audio_format {
>  	USB_QMI_PCM_FORMAT_U32_BE,
>  };
>  
> +static int usb_qmi_get_pcm_num(struct snd_usb_audio *chip, int direction)
> +{
> +	struct snd_usb_substream *subs = NULL;
> +	struct snd_usb_stream *as;
> +	int count = 0;
> +
> +	list_for_each_entry(as, &chip->pcm_list, list) {
> +		subs = &as->substream[direction];
> +		if (subs->ep_num)
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
>  static enum usb_qmi_audio_device_speed_enum_v01
>  get_speed_info(enum usb_device_speed udev_speed)
>  {
> @@ -1592,6 +1607,8 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>  
>  	sdev->card_idx = chip->card->number;
>  	sdev->chip_idx = chip->index;
> +	sdev->num_playback = usb_qmi_get_pcm_num(chip, 0);
> +	sdev->num_capture = usb_qmi_get_pcm_num(chip, 1);
>  	uadev[chip->card->number].sdev = sdev;
>  
>  	uaudio_qdev->last_card_num = chip->card->number;
> @@ -1706,10 +1723,8 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
>  	mutex_unlock(&chip->mutex);
>  
>  	atomic_dec(&uaudio_qdev->qdev_in_use);
> -	if (!atomic_read(&uaudio_qdev->qdev_in_use)) {
> -		snd_soc_usb_disconnect(usb_get_usb_backend(udev));

this also feels like a patch split issue, removing this
snd_soc_usb_disconnect() has nothing to do with the "populate PCM and
USB chip information" ?

> +	if (!atomic_read(&uaudio_qdev->qdev_in_use))
>  		qc_usb_audio_cleanup_qmi_dev();
> -	}
>  	mutex_unlock(&qdev_mutex);
>  }
>  
