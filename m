Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7678D5598
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 00:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D642D7F8;
	Fri, 31 May 2024 00:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D642D7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717108951;
	bh=WiAN7mCP4BbmrvdS0pfRUWdmu5TIdZ3o1Bx36Asu42Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nfBqwKAuzo4rqZPBccsgJzVhkw+/RqRky42CTg+eaU07nBrrXO7BDBIykPdvaS4WU
	 aozH/D+HrOrc8OqXwOWf3ekBcw5afIgcMq29stegDW72RuLsw1LjFWp7W1k3zlJTLH
	 KozqT+u3UN7ES5Lyhn2XzjBp7TlxUB9++x4mrbDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28F59F805AB; Fri, 31 May 2024 00:41:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B198F80525;
	Fri, 31 May 2024 00:41:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53944F80149; Fri, 31 May 2024 00:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03358F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 00:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03358F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=o+zMV+sz
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e95a60454fso15874811fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 15:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717108900; x=1717713700;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hL5ealaynSKA2/99rePZ0VezSpsbAVXh2kWFZiS3nMs=;
        b=o+zMV+sz5jOu5yzH3MkKE1N/YYRs6mNN8GFyLZEc1d1nvjnLzypYoNZ8HhAIDGSUiG
         wwfGwIJOY37oeVQW0s862TC9MbYS4SfEuWYpJQ22KGa2kdQOp0/jqF28NA+u6q7p0bZG
         2cLz8QEEBiA9Sge0obFeBV3/c+KRCG9MQjttcMDoPAmkDXdKSnwOOYsRjMiB/8QKahyQ
         9tu3fB7IeUMYQ0FLHelyj0XuXucXGI6zy/eldWe//8u0mIDJy8k2WuGJe/KSuMPzUFQC
         dOrS2znD3DXuQgeuj8fnGoTSkX8jIXBLyYt4chRettuuk6vNGHOcrKolLzmfXEy8bMcL
         pxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717108900; x=1717713700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL5ealaynSKA2/99rePZ0VezSpsbAVXh2kWFZiS3nMs=;
        b=g6FWlwIL8+c2Rckacc7nq61KhAb75RatZSf97PQfKTpcPU0LbMPKQ/5xbQ5UbgfgqT
         FxZtELyvSimsyQKZXNNqqo9UNVxvgPkObgk2ZTqxWaxldWyeajplkjtocFdMFNMwXjAZ
         glozxJwrv5PVENee77gCHr/9DNhk/2iEq1YQCsZDf4f9dnbdFBYpbxXJcVC0ItLKt4/n
         1iZFL4hFNpqUQeARZnrCQcM6JQRIrk6Hamo2FkrmdI5CvrkiUchlv9ypyv1q2yls9OAC
         d5crYSkqwyMyyN/+SijVcfhh8R2NAfEOpj6qcjuPCE3ArplvHHASJkUtVPLQozCR204y
         SfVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvq00C+jV+aFdU8Ub+9r9Wc6AqsSo9RBwjNk+6v2nOiiFlNl/1ALoqX0caPnKGbELYtPg5bvg4PG3OlaXzlSA7QOG1BcYxr12MFD8=
X-Gm-Message-State: AOJu0YzaqS+1lxzw3z2JGUrmynwCBffdZ+VV8F5GQHEq4NdAWLsXclVM
	1JeUthCsPhxVulKuAKSjE3QuSwUM/X34i0L+WysLFS0w+TJiwYuyrUyVJvaQZgo=
X-Google-Smtp-Source: 
 AGHT+IFAau1nLv8qEemckp5VXI+lrBnMSwFK5i3H8fBmTARbV2eR4XpDxjdCszW6UdLAhDfhZSC6/w==
X-Received: by 2002:a05:651c:1a12:b0:2e5:67bc:739 with SMTP id
 38308e7fff4ca-2ea950b55b0mr1791951fa.2.1717108900247;
        Thu, 30 May 2024 15:41:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cc6401sm1041591fa.96.2024.05.30.15.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:41:39 -0700 (PDT)
Date: Fri, 31 May 2024 01:41:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Message-ID: <ZlkAotVPuGH_H9jg@eriador.lumag.spb.ru>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422134354.89291-4-srinivas.kandagatla@linaro.org>
Message-ID-Hash: 5IZ3YTRLZYO3AL22TRKGY5YTQSDR3FQL
X-Message-ID-Hash: 5IZ3YTRLZYO3AL22TRKGY5YTQSDR3FQL
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IZ3YTRLZYO3AL22TRKGY5YTQSDR3FQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 02:43:53PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Add support to Display Port Jack events, by making use of common helper
> function.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 878bd50ad4a7..38f97f19add9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -19,6 +19,7 @@ struct sc8280xp_snd_data {
>  	struct snd_soc_card *card;
>  	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>  	struct snd_soc_jack jack;
> +	struct snd_soc_jack hdmi_jack[8];
>  	bool jack_setup;
>  };
>  
> @@ -27,6 +28,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct snd_soc_card *card = rtd->card;
> +	struct snd_soc_jack *hdmi_jack  = NULL;
> +	int hdmi_pcm_id = 0;

Using hdmi_ prefix for DP jacks is counterintuitive at best.

>  
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
> @@ -41,10 +44,21 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
>  		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
>  		break;

I'd suggest either using DISPLAY_PORT_RX here or adding a comment to
point out that DP RX ids are not sequential.

> +	case DISPLAY_PORT_RX_0:
> +		hdmi_pcm_id = 0;
> +		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
> +		break;
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		hdmi_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
> +		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
> +		break;
>  	default:
>  		break;
>  	}
>  
> +	if (hdmi_jack)
> +		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
> +
>  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
