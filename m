Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C6D965E5A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA1DE66;
	Fri, 30 Aug 2024 12:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA1DE66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012971;
	bh=ZiV5juXZHsxC12Bco99ZwT2n9UA1i1g2rDetW/Sz2c0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gy9nD49rWuWcXAVfKib5il1tPcsl1njCK0lAL0iZ9Lb29a3yuPXB9GZQoWRzKZxv6
	 3prZJU5OQb58Zf8+FaSOaduJfu9J2l+l9aRJND89ojcNFC7jSNhX1Szx/FNjeBVY5y
	 9Pomh7z/C+9DT/ghTY3zP7gTFk1ABRxheSihWZYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92550F80772; Fri, 30 Aug 2024 12:13:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6317F80793;
	Fri, 30 Aug 2024 12:13:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C81ECF80772; Fri, 30 Aug 2024 12:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E56FF80771
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E56FF80771
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DdLHEZu9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012790; x=1756548790;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZiV5juXZHsxC12Bco99ZwT2n9UA1i1g2rDetW/Sz2c0=;
  b=DdLHEZu9ViYHCZnRsxanc+7Umlp48UYYsxYSBSSAt34qEYdlCFPVDjJo
   g0Q+BWrHYlHanP05icNJ/7Fo85NPgUFc9lATKjEhdV3rRN1K44+qtFjDB
   TCkTZBmpOOPO8FNiGwyxz7WomSJ5Q9WG1VL2fMdnn06Yye3/GreJkmhQy
   dXUVqxnf36AEYqHB1Q53qnkubFohK46dEFwlb+h8qS+OHS378KIiU3Ljh
   e6wbFDJdsIKdpP4fOKqquBdifZ5fSDs0PVmmShxVvur53Ybr80OwA5Xt7
   J70MaOnNXVIyXEpNTbkHX4r2kuqQpfg5coVIKsGxEDnjdY0PjHcjzeEbh
   A==;
X-CSE-ConnectionGUID: gp8SjHevRF6U/Sa9nm3/7g==
X-CSE-MsgGUID: 898ZNP0lT2m2EuN/8Pkczg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526361"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="27526361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:07 -0700
X-CSE-ConnectionGUID: FM08lA2vQK25MsRa4jxGGQ==
X-CSE-MsgGUID: hlPVQKuySCi3JE8FTvB74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="68013117"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:00 -0700
Message-ID: <e8b11cb4-cda1-4904-b83f-e124066758e3@linux.intel.com>
Date: Fri, 30 Aug 2024 11:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 26/33] ALSA: usb-audio: Prevent starting of audio
 stream if in use
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-27-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-27-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GXFPNWQTWU55UWBX72NQCV4URPP3FOQR
X-Message-ID-Hash: GXFPNWQTWU55UWBX72NQCV4URPP3FOQR
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXFPNWQTWU55UWBX72NQCV4URPP3FOQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> With USB audio offloading, an audio session is started from the ASoC
> platform sound card and PCM devices.  Likewise, the USB SND path is still
> readily available for use, in case the non-offload path is desired.  In
> order to prevent the two entities from attempting to use the USB bus,
> introduce a flag that determines when either paths are in use.
> 
> If a PCM device is already in use, the check will return an error to
> userspace notifying that the stream is currently busy.  This ensures that
> only one path is using the USB substream.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I would also move this patch earlier in the series since it has no
dependency on USB offload really, and if somehow it breaks USB audio
regular paths we'd want to know early for bisection.


> ---
>  sound/usb/card.h |  1 +
>  sound/usb/pcm.c  | 29 ++++++++++++++++++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 15cda1730076..d8b8522e1613 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -165,6 +165,7 @@ struct snd_usb_substream {
>  	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
>  	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
>  
> +	unsigned int opened:1;		/* pcm device opened */
>  	unsigned int running: 1;	/* running status */
>  	unsigned int period_elapsed_pending;	/* delay period handling */
>  
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index 18467da6fd9e..b24ee38fad72 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1241,8 +1241,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_usb_substream *subs = &as->substream[direction];
> +	struct snd_usb_audio *chip = subs->stream->chip;
>  	int ret;
>  
> +	mutex_lock(&chip->mutex);
> +	if (subs->opened) {
> +		mutex_unlock(&chip->mutex);
> +		return -EBUSY;
> +	}
> +	subs->opened = 1;
> +	mutex_unlock(&chip->mutex);
> +
>  	runtime->hw = snd_usb_hardware;
>  	/* need an explicit sync to catch applptr update in low-latency mode */
>  	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
> @@ -1259,13 +1268,23 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>  
>  	ret = setup_hw_info(runtime, subs);
>  	if (ret < 0)
> -		return ret;
> +		goto err_open;
>  	ret = snd_usb_autoresume(subs->stream->chip);
>  	if (ret < 0)
> -		return ret;
> +		goto err_open;
>  	ret = snd_media_stream_init(subs, as->pcm, direction);
>  	if (ret < 0)
> -		snd_usb_autosuspend(subs->stream->chip);
> +		goto err_resume;
> +
> +	return 0;
> +
> +err_resume:
> +	snd_usb_autosuspend(subs->stream->chip);
> +err_open:
> +	mutex_lock(&chip->mutex);
> +	subs->opened = 0;
> +	mutex_unlock(&chip->mutex);
> +
>  	return ret;
>  }
>  
> @@ -1274,6 +1293,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>  	int direction = substream->stream;
>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>  	struct snd_usb_substream *subs = &as->substream[direction];
> +	struct snd_usb_audio *chip = subs->stream->chip;
>  	int ret;
>  
>  	snd_media_stop_pipeline(subs);
> @@ -1287,6 +1307,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>  
>  	subs->pcm_substream = NULL;
>  	snd_usb_autosuspend(subs->stream->chip);
> +	mutex_lock(&chip->mutex);
> +	subs->opened = 0;
> +	mutex_unlock(&chip->mutex);
>  
>  	return 0;
>  }

