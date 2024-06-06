Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4F8FF3A2
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 19:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5CD847;
	Thu,  6 Jun 2024 19:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5CD847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717694710;
	bh=dTxC9S5XIMg5ioG+Q/uZwME7wTTzhbUrfZPA4xxlN5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tiJ0pLWRNxlQ1/4VaCAzTn2ZECI8UxNXVtKOdhGXKCAb68t52cnrcVnN65qRiGmXN
	 93omCUHZZ+c0UsrYqCHBcCgA9jyb+Q/a9W7ZTYAeTlTWwsTxKyjoAZMeLXfIGqjGtU
	 fdKjXJ5Wo+JcB1TMIdj3lAXq64N3MQmCedfd8+xA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26CDAF805AA; Thu,  6 Jun 2024 19:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E2A2F8057A;
	Thu,  6 Jun 2024 19:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A8FF804E5; Thu,  6 Jun 2024 19:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BF80F80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 19:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF80F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PO2W1Vpg
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso1862074e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 10:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717694667; x=1718299467;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4LNbr7VfEe6izakn3pwLNIw70DykAuM2PJO0ynb8N4=;
        b=PO2W1VpgAZrNbpHlTE75HmMm8T5JFCzvkKwncMo/1iqt3uBWa1DYM6sW+QL4eqQVcN
         HRW2TnLHSezC3cG5hH2PtoN/WY1x2oCx5S2Z9te5C3sdj70CQ+EWl6NhTJ4dtg3cP1+W
         B/wUj6IaiBX1DbD0JSCVa6N6//ShxvO9NgjkJ5pzHRRubUKjq5RONBCslm8d0k6zKy5C
         +wkMpfIYEk0nVbnz0W3MO7HeaHuUASB47miAPED1CK+rUASxzU7eBwQ6PWfECHSxbjCM
         sYcX4F5CsrpXNDUW5XYE7YTES2oOT7WdxOScRpMPXL37HkVZOMxpaktrmt2Z3UmpfNbl
         p5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717694667; x=1718299467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4LNbr7VfEe6izakn3pwLNIw70DykAuM2PJO0ynb8N4=;
        b=QDDY1C8rr48PbMHz2axcIARMB9zKyF6/7+Bmra/P9WWCHglU8L5azurOEsg2L6kBOz
         RKYaki5J0jp33QzjjjB5vp7N8fIZO92VKGPfc/hzOCMWk74uYfRtW62UqVw+A55nQsHW
         bYIf2Jnj2jmZpyBDzid1ToKEUSIfOlbxx2rPTd00I/DQMuq9B/6iIG/WedJuZqIH3NPQ
         FbN4o/u7QuGg8Byj6n6xuvThxpS/3OnCrBxRvp93Et8LIRwklFlOYV/TmUfHoR0w8nM0
         +xNc1XUb4N5zDgVo291NOl8fOD5IkoQRTUun/h3eIijhf9cphbkyQGhxW43lbMJoSehU
         oFAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5UUyNgVSmeolFgKREsrxZQXkjmFrwHZJyJQw63Yu4+XvPMMQx/h6uTkeUzDPW+7a9NbN6XJ7FfEc3/I0YePAS5jZWR4Mnw4bFZmU=
X-Gm-Message-State: AOJu0YyBMag1BjxK4lFG2O5bjV/jU2OKpLnbzYqdIA4NFND4BnxdgAOb
	eC7ZMiKNMep9/4WX0MPHOKWpuStSspcxh/pabB9o9Qse77mHFIVj
X-Google-Smtp-Source: 
 AGHT+IFOjYFmBcUyHgIetl0AFa3Qy+ZmzXrs7sFeq0xkgOyXErd6aZfbK+diwqdTip7ERQeoicunDg==
X-Received: by 2002:a19:2d50:0:b0:52b:b89a:cec7 with SMTP id
 2adb3069b0e04-52bb9fd150dmr170915e87.60.1717694666798;
        Thu, 06 Jun 2024 10:24:26 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi.
 [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb41e1c29sm251177e87.5.2024.06.06.10.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 10:24:26 -0700 (PDT)
Message-ID: <43418c73-b240-461f-af4e-49735304eaa5@gmail.com>
Date: Thu, 6 Jun 2024 20:28:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: dmaengine: Synchronize dma channel in prepare()
To: Jai Luthra <j-luthra@ti.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
 <20240604-asoc_next-v1-1-e895c88e744d@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240604-asoc_next-v1-1-e895c88e744d@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HBWHIHRHWQT2JHVYIVJKQDL42X5U4IXZ
X-Message-ID-Hash: HBWHIHRHWQT2JHVYIVJKQDL42X5U4IXZ
X-MailFrom: peter.ujfalusi@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBWHIHRHWQT2JHVYIVJKQDL42X5U4IXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 1:01 PM, Jai Luthra wrote:
> Sometimes the stream may be stopped due to XRUN events, in which case
> the userspace can call snd_pcm_drop() and snd_pcm_prepare() to stop and
> start the stream again.
> 
> In these cases, we must wait for the DMA channel to synchronize before
> marking the stream as prepared for playback, as the DMA channel gets
> stopped by snd_pcm_drop() without any synchronization.

Right, this is a plausible scenario, the xrun is pointing to unhealthy
system, but before re-using the channel we indeed need to make sure that
it is finished with the stop.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  include/sound/dmaengine_pcm.h         |  1 +
>  sound/core/pcm_dmaengine.c            | 10 ++++++++++
>  sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
> index c11aaf8079fb..9c5800e5659f 100644
> --- a/include/sound/dmaengine_pcm.h
> +++ b/include/sound/dmaengine_pcm.h
> @@ -36,6 +36,7 @@ snd_pcm_uframes_t snd_dmaengine_pcm_pointer_no_residue(struct snd_pcm_substream
>  int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
>  	struct dma_chan *chan);
>  int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream);
> +int snd_dmaengine_pcm_prepare(struct snd_pcm_substream *substream);
>  
>  int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
>  	dma_filter_fn filter_fn, void *filter_data);
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 12aa1cef11a1..dbf5c6136d68 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -349,6 +349,16 @@ int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
>  }
>  EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
>  
> +int snd_dmaengine_pcm_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
> +
> +	dmaengine_synchronize(prtd->dma_chan);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_prepare);
> +
>  /**
>   * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
>   * @substream: PCM substream
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index ea3bc9318412..af439486d33a 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -318,6 +318,12 @@ static int dmaengine_copy(struct snd_soc_component *component,
>  	return 0;
>  }
>  
> +int dmaengine_pcm_prepare(struct snd_soc_component *component,
> +			  struct snd_pcm_substream *substream)
> +{
> +	return snd_dmaengine_pcm_prepare(substream);
> +}
> +
>  static const struct snd_soc_component_driver dmaengine_pcm_component = {
>  	.name		= SND_DMAENGINE_PCM_DRV_NAME,
>  	.probe_order	= SND_SOC_COMP_ORDER_LATE,
> @@ -327,6 +333,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
>  	.trigger	= dmaengine_pcm_trigger,
>  	.pointer	= dmaengine_pcm_pointer,
>  	.pcm_construct	= dmaengine_pcm_new,
> +	.prepare	= dmaengine_pcm_prepare,
>  };
>  
>  static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
> @@ -339,6 +346,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
>  	.pointer	= dmaengine_pcm_pointer,
>  	.copy		= dmaengine_copy,
>  	.pcm_construct	= dmaengine_pcm_new,
> +	.prepare	= dmaengine_pcm_prepare,
>  };
>  
>  static const char * const dmaengine_pcm_dma_channel_names[] = {
> 

-- 
Péter
