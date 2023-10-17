Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1CE7CD0B3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B0BD857;
	Wed, 18 Oct 2023 01:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B0BD857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585130;
	bh=KOWPP1PSMoIxt93fKxE8ER0QAdyM8P4EOniZbIxKM6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OItvAXcvza0xqhD3t/0xgNia2ahGEu81Z0dAm6ibjx2FjZ5GxAG1iKSPEX98GMQof
	 5INPejEIrrzNNUbHjFMnRXNK2E63J+/lyT7NGs5BFdKsittNg/WiEg//Q8v5UVWocZ
	 m9qDNrgx2ZkCyEziP4vdmSc+0+XFEu120ZHU4Fbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64352F805A0; Wed, 18 Oct 2023 01:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F635F805A0;
	Wed, 18 Oct 2023 01:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0611F80571; Wed, 18 Oct 2023 01:23:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64FE1F80552
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64FE1F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U0FM4sVR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585004; x=1729121004;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KOWPP1PSMoIxt93fKxE8ER0QAdyM8P4EOniZbIxKM6g=;
  b=U0FM4sVRlsI0t5ScSPVthJsOfXytfPvx/9oPQFESIah15dXXzgdYsGo4
   h5cqlPpxNwbVAnJffIhK2S/AxE0AtMSCWtNpLECl1vvLZspNbHR4+sqWe
   trE3rtXNRFvNNZfsjNchI1QyTNrspI6zWqE8Y8u8FKjN9fVhb6OFsWF3u
   kZ86LPTCxpc5GXLIr7AWwwnjiN9z2s7abV2ynQKouUK54XaiKQsEPV3gO
   BnEcHAciTdFe00WkxZFtyb4Pvie31jJimU5Ji3DXhb1qToEed5walkIdo
   DfQZ2xuHxa0OXW7grdXEedJr7Wdy+Juq4SzI2yp0BRgopC9DEL8fuGyJJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778133"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778133"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637475"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637475"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:20 -0700
Message-ID: <a8dc2a3a-27a2-40d6-9e67-6ea475701e44@linux.intel.com>
Date: Tue, 17 Oct 2023 17:37:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20231017200109.11407-24-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-24-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OKURAUDG6BYVAPPS55S5O3UPCPRE46M2
X-Message-ID-Hash: OKURAUDG6BYVAPPS55S5O3UPCPRE46M2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKURAUDG6BYVAPPS55S5O3UPCPRE46M2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:00, Wesley Cheng wrote:
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
> ---
>  sound/usb/card.h                  |  1 +
>  sound/usb/pcm.c                   | 19 +++++++++++++++++--
>  sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-

should this be split in a generic part and a more specific qcom patch?

>  3 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index e26292363cf0..01f7e10f30f4 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -164,6 +164,7 @@ struct snd_usb_substream {
>  	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
>  	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
>  
> +	unsigned int opened:1;		/* pcm device opened */
>  	unsigned int running: 1;	/* running status */
>  	unsigned int period_elapsed_pending;	/* delay period handling */
>  
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index 3adb09ce1702..c2cb52cd5d23 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1241,8 +1241,15 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
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
> +
>  	runtime->hw = snd_usb_hardware;
>  	/* need an explicit sync to catch applptr update in low-latency mode */
>  	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
> @@ -1259,13 +1266,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>  
>  	ret = setup_hw_info(runtime, subs);
>  	if (ret < 0)
> -		return ret;
> +		goto out;
>  	ret = snd_usb_autoresume(subs->stream->chip);
>  	if (ret < 0)
> -		return ret;
> +		goto out;
>  	ret = snd_media_stream_init(subs, as->pcm, direction);
>  	if (ret < 0)
>  		snd_usb_autosuspend(subs->stream->chip);
> +	subs->opened = 1;
> +out:
> +	mutex_unlock(&chip->mutex);
> +
>  	return ret;
>  }
>  
> @@ -1274,6 +1285,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>  	int direction = substream->stream;
>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>  	struct snd_usb_substream *subs = &as->substream[direction];
> +	struct snd_usb_audio *chip = subs->stream->chip;
>  	int ret;
>  
>  	snd_media_stop_pipeline(subs);
> @@ -1287,6 +1299,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>  
>  	subs->pcm_substream = NULL;
>  	snd_usb_autosuspend(subs->stream->chip);
> +	mutex_lock(&chip->mutex);
> +	subs->opened = 0;
> +	mutex_unlock(&chip->mutex);
>  
>  	return 0;
>  }
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 320ce3a6688f..bd6b84f72c74 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -1413,12 +1413,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  		goto response;
>  	}
>  
> +	mutex_lock(&chip->mutex);
>  	if (req_msg->enable) {
> -		if (info_idx < 0 || chip->system_suspend) {
> +		if (info_idx < 0 || chip->system_suspend || subs->opened) {
>  			ret = -EBUSY;
> +			mutex_unlock(&chip->mutex);
> +
>  			goto response;
>  		}
> +		subs->opened = 1;
>  	}
> +	mutex_unlock(&chip->mutex);
>  
>  	if (req_msg->service_interval_valid) {
>  		ret = get_data_interval_from_si(subs,
> @@ -1440,6 +1445,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  		if (!ret)
>  			ret = prepare_qmi_response(subs, req_msg, &resp,
>  					info_idx);
> +		if (ret < 0) {
> +			mutex_lock(&chip->mutex);
> +			subs->opened = 0;
> +			mutex_unlock(&chip->mutex);
> +		}
>  	} else {
>  		info = &uadev[pcm_card_num].info[info_idx];
>  		if (info->data_ep_pipe) {
> @@ -1463,6 +1473,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  		}
>  
>  		disable_audio_stream(subs);
> +		mutex_lock(&chip->mutex);
> +		subs->opened = 0;
> +		mutex_unlock(&chip->mutex);
>  	}
>  
>  response:
