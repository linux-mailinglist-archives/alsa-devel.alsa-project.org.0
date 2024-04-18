Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74F8AA15F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 19:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2DA1945;
	Thu, 18 Apr 2024 19:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2DA1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713462581;
	bh=P2+1M5xlz5nO98fQHEzHTaHBC6pZovHWDXMrzDKvvkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rpjcf7VOBVrptlim8hCaa9M1rB8GATVk4QetJVYKQ1jEA6iDttDJdGsEdR8iifIu0
	 YKbpEI7kVBywiq61sSgTiwZ6yEPIn2hL+uD4biu94UEtCU38GXZ+5ElKgKstre0PaO
	 7u99qGv+qgGRNl8Re++LfrD6w3UweYN52dKlAFyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5BDAF805AE; Thu, 18 Apr 2024 19:49:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CFF8F805A0;
	Thu, 18 Apr 2024 19:49:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AFA3F8025A; Thu, 18 Apr 2024 19:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54E80F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 19:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E80F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G1rP+qlI
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d9fe2b37acso15166501fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Apr 2024 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713462535; x=1714067335;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWjRP/RRJQ8mM83fkHijl/axycbWYPWuBIUVY65UOGA=;
        b=G1rP+qlIdUdBH5rTZ3jqiA/N9eAR6gJDTz6luNdp73LY2Ohs7my+XlyVm/BOwzs8KC
         Iss/EUB/iY2SPUu/qs70eopGT3gVESRaxI632PtJLwGxzutRVpbW6YgMbA/iz7IrtqwJ
         9N82RRWGtCdobmTT2oL4+HOtOKYx38ZYW5vPoPuFvt74oI71ekV31vU8IVoOUokGFBDl
         wdSOeZ9KkpG7fohJlxnuexhk5wgQo8H5Q2HgQAbgNHRSobRf2pU9a+DbZA9yEt44zzkY
         j2N9WyghjhypF6s2y9QwFBlRIhObGuET7bJ6BlqpIVnY8FyZ6lpyF7PA0yCU6BBbWf+m
         EWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713462535; x=1714067335;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWjRP/RRJQ8mM83fkHijl/axycbWYPWuBIUVY65UOGA=;
        b=GswDJz4QFvjC9DLCCRZ/qpr3I5uM4dwJXsb7hZNwLOslErhdsTZQelesS/X0K0kDUN
         DBk86RMb/1HNA4Lw+5p36qpIbhvWwz1fF9MenQz88Zp58LmtOP159YSSSYidA7/P/eLF
         fFXrbIYchN32Qj+U5Vh6ZiY6z7Vzc5Mz4/q7hZSxvnb3134yGWJxZ4WSvbjge5w4NBHA
         xvEFveU6jEZIqzRkJwkeAmjz8nC8PRcwDhUEjbyG6CNHMkoNsAc6vfxsFDAMLP4FqPDO
         DFWDo9i0zexS41ru2T8CcH+mTayIBaxGucJjgjXZ5gZH+TIAGRqpBkevLRcR5B4O0M2t
         cHeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEg2sXnpFOd5S0RmH2ODvuABvezgJVMJtlqB5RxFoFLxT/oE742DjokcfyxBoXGFaTgW11hqxNmHxqEkXwmRDDnVbc7q6j8AiJqHo=
X-Gm-Message-State: AOJu0YyFVi/uu9TkPfm3eWBka5eZzRH7AevjziBLt/dfMGX7DxOKT2S8
	42uGMqd83AvkFXMkncCVU4UTMxnGitt+38EPeX9e06fgKDcv5UuS
X-Google-Smtp-Source: 
 AGHT+IFLN8AVKD6AbFTXCtyt/i2xPnyVSWhKPGW1JF/2/FqWjGy5naOgcXt0w7tJVCAdQgHvWpQApQ==
X-Received: by 2002:a2e:8807:0:b0:2da:9ebe:e35f with SMTP id
 x7-20020a2e8807000000b002da9ebee35fmr1923468ljh.22.1713462534894;
        Thu, 18 Apr 2024 10:48:54 -0700 (PDT)
Received: from [10.0.0.100] (host-213-145-200-116.kaisa-laajakaista.fi.
 [213.145.200.116])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a2ea40c000000b002d80b78c1e0sm268671ljn.117.2024.04.18.10.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 10:48:54 -0700 (PDT)
Message-ID: <f0dcab9a-1f9d-4db5-b886-0d2174070f37@gmail.com>
Date: Thu, 18 Apr 2024 20:49:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Fix race condition during probe
To: Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Jai Luthra <j-luthra@ti.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240417184138.1104774-1-jpaulo.silvagoncalves@gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20240417184138.1104774-1-jpaulo.silvagoncalves@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JNZEF6CW6FYIBPJ6K26OLXD5OILZH2GF
X-Message-ID-Hash: JNZEF6CW6FYIBPJ6K26OLXD5OILZH2GF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNZEF6CW6FYIBPJ6K26OLXD5OILZH2GF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 17/04/2024 21:41, Joao Paulo Goncalves wrote:
> From: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> 
> When using davinci-mcasp as CPU DAI with simple-card, there are some
> conditions that cause simple-card to finish registering a sound card before
> davinci-mcasp finishes registering all sound components. This creates a
> non-working sound card from userspace with no problem indication apart
> from not being able to play/record audio on a PCM stream. The issue
> arises during simultaneous probe execution of both drivers. Specifically,
> the simple-card driver, awaiting a CPU DAI, proceeds as soon as
> davinci-mcasp registers its DAI. However, this process can lead to the
> client mutex lock (client_mutex in soc-core.c) being held or davinci-mcasp
> being preempted before PCM DMA registration on davinci-mcasp finishes.
> This situation occurs when the probes of both drivers run concurrently.
> Below is the code path for this condition. To solve the issue, defer
> davinci-mcasp CPU DAI registration to the last step in the audio part of
> it. This way, simple-card CPU DAI parsing will be deferred until all
> audio components are registered.
> 
> Fail Code Path:
> 
> simple-card.c: probe starts
> simple-card.c: simple_dai_link_of: simple_parse_node(..,cpu,..) returns EPROBE_DEFER, no CPU DAI yet
> davinci-mcasp.c: probe starts
> davinci-mcasp.c: devm_snd_soc_register_component() register CPU DAI
> simple-card.c: probes again, finish CPU DAI parsing and call devm_snd_soc_register_card()
> simple-card.c: finish probe
> davinci-mcasp.c: *dma_pcm_platform_register() register PCM  DMA
> davinci-mcasp.c: probe finish

Interesting... Thanks for the details.
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Cc: stable@vger.kernel.org
> Fixes: 9fbd58cf4ab0 ("ASoC: davinci-mcasp: Choose PCM driver based on configured DMA controller")

Just to note that the DAI registration was always before the platform
registration (ever since the DAI driver started to register the
platform) and I think most TI (and probably other vendor's) driver does
things this way. McASP does a bit of lifting by requesting a DMA channel
to figure out the type of DMA...

> Signed-off-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index b892d66f78470..1e760c3155213 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2417,12 +2417,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>  
>  	mcasp_reparent_fck(pdev);
>  
> -	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
> -					      &davinci_mcasp_dai[mcasp->op_mode], 1);
> -
> -	if (ret != 0)
> -		goto err;
> -
>  	ret = davinci_mcasp_get_dma_type(mcasp);
>  	switch (ret) {
>  	case PCM_EDMA:
> @@ -2449,6 +2443,12 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> +	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
> +					      &davinci_mcasp_dai[mcasp->op_mode], 1);
> +
> +	if (ret != 0)
> +		goto err;
> +
>  no_audio:
>  	ret = davinci_mcasp_init_gpiochip(mcasp);
>  	if (ret) {

-- 
Péter
