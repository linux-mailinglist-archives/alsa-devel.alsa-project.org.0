Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC6760E63
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55381EDC;
	Tue, 25 Jul 2023 11:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55381EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276841;
	bh=R72RUzt3QoJsOVNYAWhWO4uGyKekfMANgpOv6MYiNDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BJvNwceKjCEfv0zgicO3w3SzvGX9hvwOqtkgJuTwfBJBVWax6FyTe17JLd/XOA0qA
	 jfFh+cvlF3N1QZopL8rgzsiOYa4UP1l2YgPn859GyxAzhyAoOIGZjpcDTK8bAc/Gb6
	 xrfC6BDmbxmNW6JMvlGs8dK4rTvgl7dVLDNvUnhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6632AF80580; Tue, 25 Jul 2023 11:19:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F10A4F8057D;
	Tue, 25 Jul 2023 11:19:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B81A2F8057E; Tue, 25 Jul 2023 11:19:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35D0DF80579
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35D0DF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kwmpeqSL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276739; x=1721812739;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R72RUzt3QoJsOVNYAWhWO4uGyKekfMANgpOv6MYiNDY=;
  b=kwmpeqSLNsr8YgbN0UPc7Sx1o6HA4HGZvurmxaO+5rJKK60GX0cD4EJT
   Beo7JL8DV8EVZ+0WW/17yz36qkyugFp2/YpIYsQoRW2Nv72lP/zNRbXTS
   O9vIpkIEKveyGSFysAySN19X4bbGf6knoeuB/Bx1mhvXufq68RMQWt54r
   JZWawl2zQ8h5k/ODCTeXbm7ataOhtF2EpoWoSp02tMqDwn3xD3tXAQdt0
   yoDkeIVaUNVItx1rjBCRT0lI37X7ytfqqmxE1r8Wfk9JAieavf0zGHScI
   fOZ5y7UmECjKTdX+CnISn2xdMdpRx83gEIVkGHOk/IxjiAm4mYg/3CXcq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="454048962"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="454048962"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980425"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="719980425"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:48 -0700
Message-ID: <2ac68f83-6300-fa61-e1ca-80df07fc1494@linux.intel.com>
Date: Tue, 25 Jul 2023 10:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 26/32] sound: Pass USB SND card and PCM information to
 SOC USB
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
 <20230725023416.11205-27-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230725023416.11205-27-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VPXCT4O43AFZTJVATLC5ZF6YBNKEYYMI
X-Message-ID-Hash: VPXCT4O43AFZTJVATLC5ZF6YBNKEYYMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPXCT4O43AFZTJVATLC5ZF6YBNKEYYMI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/25/23 04:34, Wesley Cheng wrote:
> Currently, only the index to the USB SND card array is passed to the USB
> backend.  Pass through more information, specifically the USB SND card
> number and the number of PCM devices available.  The USB backend should
> know about which sound resources are being shared between the ASoC and USB
> SND paths.  This can be utilized to properly select and maintain the
> offloading devices.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/soc-usb.h           |  9 +++++----
>  sound/soc/qcom/qdsp6/q6usb.c      | 20 ++++++++++++++++++--
>  sound/soc/soc-usb.c               | 12 +++++++-----
>  sound/usb/qcom/qc_audio_offload.c |  9 +++++----
>  4 files changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index 71e6e75e600a..606128332044 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -19,20 +19,21 @@ struct snd_soc_usb {
>  	struct device *dev;
>  	struct snd_soc_component *component;
>  	int (*connection_status_cb)(struct snd_soc_usb *usb, int card_idx,
> -				int connected);
> +				int chip_idx, int num_pcm, int connected);

I don't know what 'chip_idx' is.

The 'num_pcm' sounds problematic if there are different devices for
playback and capture. I would guess this is for playback only, but this
doesn't scale.

>  	void *priv_data;
>  };

> +struct q6usb_status {
> +	unsigned int num_pcm;
> +	unsigned int chip_index;
> +	unsigned int pcm_index;
> +};
> +
>  struct q6usb_port_data {
>  	struct q6afe_usb_cfg usb_cfg;
>  	struct snd_soc_usb *usb;
>  	struct q6usb_offload priv;
> +	unsigned long available_card_slot;

what is a card slot?

> +	struct q6usb_status status[SNDRV_CARDS];
>  	int active_idx;
>  };
>  
> @@ -97,7 +105,7 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
>  }
>  
>  static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
> -			int connected)
> +			int chip_idx, int num_pcm, int connected)
>  {
>  	struct snd_soc_dapm_context *dapm;
>  	struct q6usb_port_data *data;
> @@ -109,8 +117,16 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
>  		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
>  		/* We only track the latest USB headset plugged in */
>  		data->active_idx = card_idx;
> +
> +		set_bit(card_idx, &data->available_card_slot);
> +		data->status[card_idx].num_pcm = num_pcm;
> +		data->status[card_idx].chip_index = chip_idx;
>  	} else {
> -		snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
> +		clear_bit(card_idx, &data->available_card_slot);
> +		data->status[card_idx].num_pcm = 0;
> +		data->status[card_idx].chip_index = 0;
> +		if (!data->available_card_slot)
> +			snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");

not able to follow what this does, this patch is rather unclear and
lacks comments.

>  	}
>  	snd_soc_dapm_sync(dapm);

