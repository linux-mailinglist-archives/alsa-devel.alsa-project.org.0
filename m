Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D08FF362
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 19:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D1E844;
	Thu,  6 Jun 2024 19:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D1E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717693877;
	bh=M70tp6532oErosXvST9jh7Vo9666z4tcB3oOndDwuWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DplCN1DoqecFB1S5WRHcHSW6EGcb/E65jEP8srgtKLW33rqhPcJjYKZ68frLhEKI+
	 71sXhKSk/U/UTVti9R3gogaDP42OR3epzclqXM12thue6UlNixaSqEg2AALoA6NM6M
	 9yFcJG7zSAa/C76bH1J+/sjtqCaqajhqW3c8FtkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4129EF805B2; Thu,  6 Jun 2024 19:10:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E201EF80589;
	Thu,  6 Jun 2024 19:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F022F804E5; Thu,  6 Jun 2024 19:10:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9338EF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 19:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9338EF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Cvn5t/dn
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b962c4bb6so1804587e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717693823; x=1718298623;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfcPheLV0NZCmf87grsxqRgL031WLMyzJrb0w/6enLU=;
        b=Cvn5t/dnXPcYuctsomK6H6ilRaiPRX7rYMpJt59qPh0ZmdueiMcjPd5jo6coyX56Gj
         cuOQwCM+4FypZI7tjOKaih0yw1YcnMzYYuDhylHiFlZiidT46/ba25KLSuL9ORDX/VjK
         VUzN//OdRx92dKE0YgYYiGs3FRh+m/lyqQA3TgncXa8qiXjcZZM0qU4ejVI+c9hqL6Yx
         n1qKEiAaoxBQNG5sCqdVwhjcUttgPftvBiXC/oy9hBo2+VsPynge6hBRBjDeF+Ag5hHN
         +XoJsHNoZM02RAlGfECiIOF5m2L9ZV6fhegGaLxlL2GCKidIg8T3EPpam59c+GlMDiqj
         EOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717693823; x=1718298623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfcPheLV0NZCmf87grsxqRgL031WLMyzJrb0w/6enLU=;
        b=uyuiE0bm2gb4AowirrrZ7ONFjrkNw305lOdpPejRaxbJIor/qKICAFKKhn7wEYppMQ
         b23DHzeA23UI4WfwuVYF9n4mY67Q6iVxoM1oSAkWo2WLnrRKm4KPcdFKUb6U10rR99OK
         nC4uvfHQs4RQfG14SIfPdAnIum2TCCSXibiuquP+3LDHausmz6Vm4yFrC/7kAaMTOC78
         e72jpXghs6AJ68LJJFLO624w4qGF8tOJHVZr7X0aKZYiDJ0EFOr23dmyDMewRdfUafLM
         dX+r/LwNmzwp1kCJheDglmt21SdMbFaHw1N1EUZh1/mIgoJhi/Ou5GCuq/rm+J+dN8RW
         8RNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzh/gF+/8fN/vL+9+JVQ14vUAsd2ygicyxIZZBtJMYh3lMulggyH9IlITJJCYEY/B60UGUKUxSbMzggw0uugdt6vF8ZS3zlRmphAY=
X-Gm-Message-State: AOJu0Yzg7C1m+tKedKIRN5dBbw9gmPdzYcxmC8aJYgDnpjmM7s6mInNj
	wlHRQGyiDj4U9Ujhp8RxKONHvo2Hb8dXgnchC92H8QevviRaXPJZ
X-Google-Smtp-Source: 
 AGHT+IHjAV1sRFdp+OWciQrMCzE/Ou7KGCZoDPrUBVN8JEZkK68c3eqRAB4TI9M5ylBpowsDZcF8Qg==
X-Received: by 2002:a05:6512:3f09:b0:51f:3e0c:ace3 with SMTP id
 2adb3069b0e04-52bb9f785d9mr227002e87.16.1717693822817;
        Thu, 06 Jun 2024 10:10:22 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi.
 [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb423cf28sm246062e87.194.2024.06.06.10.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 10:10:22 -0700 (PDT)
Message-ID: <6a88c1b3-b3d0-48d0-a620-b17464cb559e@gmail.com>
Date: Thu, 6 Jun 2024 20:13:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: ti: davinci-mcasp: Set min period size using
 FIFO config
To: Jai Luthra <j-luthra@ti.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
 <20240604-asoc_next-v1-2-e895c88e744d@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240604-asoc_next-v1-2-e895c88e744d@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ZNZGYMRKQAUZNX6IHEUD47TKHIQA2OP
X-Message-ID-Hash: 3ZNZGYMRKQAUZNX6IHEUD47TKHIQA2OP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZNZGYMRKQAUZNX6IHEUD47TKHIQA2OP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 6/4/24 1:01 PM, Jai Luthra wrote:
> The minimum period size was enforced to 64 as older devices integrating
> McASP with EDMA used an internal FIFO of 64 samples.
> 
> With UDMA based platforms this internal McASP FIFO is optional, as the
> DMA engine internally does some buffering which is already accounted for
> when registering the platform. So we should read the actual FIFO
> configuration (txnumevt/rxnumevt) instead of hardcoding frames.min to
> 64.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 1e760c315521..2a53fb7e72eb 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -70,6 +70,7 @@ struct davinci_mcasp_context {
>  struct davinci_mcasp_ruledata {
>  	struct davinci_mcasp *mcasp;
>  	int serializers;
> +	u8 numevt;
>  };
>  
>  struct davinci_mcasp {
> @@ -1470,12 +1471,13 @@ static int davinci_mcasp_hw_rule_format(struct snd_pcm_hw_params *params,
>  static int davinci_mcasp_hw_rule_min_periodsize(
>  		struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
>  {
> +	struct davinci_mcasp_ruledata *rd = rule->private;
>  	struct snd_interval *period_size = hw_param_interval(params,
>  						SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
>  	struct snd_interval frames;
>  
>  	snd_interval_any(&frames);
> -	frames.min = 64;
> +	frames.min = rd->numevt;

64 was a nice number ;)

>  	frames.integer = 1;
>  
>  	return snd_interval_refine(period_size, &frames);
> @@ -1516,6 +1518,9 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
>  		if (mcasp->serial_dir[i] == dir)
>  			max_channels++;
>  	}
> +	ruledata->numevt = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
> +				   mcasp->txnumevt :
> +				   mcasp->rxnumevt;

Do this at the same location where the rest of the ruledata members are
initialized, or

>  	ruledata->serializers = max_channels;
>  	ruledata->mcasp = mcasp;
>  	max_channels *= tdm_slots;
> @@ -1591,7 +1596,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
>  
>  	snd_pcm_hw_rule_add(substream->runtime, 0,
>  			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> -			    davinci_mcasp_hw_rule_min_periodsize, NULL,
> +			    davinci_mcasp_hw_rule_min_periodsize, ruledata,

You could just pass a pointer to txnumevt/rxnumevt directly...

>  			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
>  
>  	return 0;
> 

-- 
Péter
