Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A58268EB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 08:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CBA823;
	Mon,  8 Jan 2024 08:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CBA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704700355;
	bh=To0eeBUsmuKoCMR5vSVLIb47UtMgG6vqXZNIOcHHnIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sFyvkL1QMH8aSn5gNMQG2xMfapVfLy2LKGmh3m+5pueIcwRICMnMG4abPmIa7XXO/
	 XTLTYlpZELJLcGtKQ0Qg25WTZRZJFzH/J6j/psd23Xn/Xcmo1TjDWFu5Z7xjTVd11i
	 eUBx4UatHjCmG3ErhNzdMtdQJ2yNgdb7L95jxxAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0B1F8057C; Mon,  8 Jan 2024 08:51:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A2EDF804F1;
	Mon,  8 Jan 2024 08:51:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60458F80254; Mon,  8 Jan 2024 08:51:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 971D1F80086
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 08:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 971D1F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nl3uK+T8
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e7ddd999bso1467894e87.1
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 23:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704700301; x=1705305101;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xB6dTmy7PPONUEqk9zrc11jGA1ahX/VsK6NLrJv8Ibo=;
        b=Nl3uK+T8xDdmXHIEq6K73CAKBJlqYEjhCETmONPTS1PFew69uIl1X+Zz9w1DvaZj9G
         gp8i8Fl7qWiH+UqdDxFIPl3BBmJFGv1soC1FZEzxbPQ1ofSRrdGPkRN6bprvCr+jwVoo
         CcXtMhQOAIA/loWmRqJJaP5FM9pcfv1z8DSplsJNJAnXbAbERidVOh9pbKh4/rV725aA
         lCjCW9yJmdDAgpoaIQAkH5kSwG/W5CG8Cq09Wt1FoeSzXhvf+3LYY8FJ6u1fl+QtXGs+
         v6dCW3kYZceQ7iTag3pEyFfURQyWUxnXSCbb4AQ7eV1m0s/hT/k0pRxTiMs0hdV9EXpb
         evIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704700301; x=1705305101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xB6dTmy7PPONUEqk9zrc11jGA1ahX/VsK6NLrJv8Ibo=;
        b=Y2d6/9RepyI/1vsRkWLinnDOT1U/RkLcMlWGW/qyXM51Wq2LJoRCRWJTBn5ZrIH6jf
         br/it7EA4dlhBzTdnOQKP8MyfQ5RDfAFrdc7wo6KL8HbvyNYmcg39oZtigsXsfsQyUyv
         GBY/37ZroOxq+SPfBC8aU2Puv6vrNy2fEdkrPqEGtbNngQW5RJXtHGDaVT6wtHxKDFT6
         gyGTld4LhgpT448wT6BZ72atKOrmikbiUQdRGYRHb8VYCy4Y0c1xJZ7D9S174gB42G5f
         Wd1LChbpLk7mTOdXDkNTsRdXa3h3Y11MsTjitLlZdgcwR3Yd8GeJeAwwtUcSkdL8NsJ3
         acbQ==
X-Gm-Message-State: AOJu0Yxz9UjrQ4IgRV9naUhLeZl72Holrby6zD7ag4I0E3h8sm9wZyxd
	5WI1wDNYvwzfe1QTm5QjaaM=
X-Google-Smtp-Source: 
 AGHT+IFgZcByQqbr97652HkUV9fLE574WgqqSfXCYtLKE0ke5xjsGHFQbJJlJSSp27L/fI7gvAQaBQ==
X-Received: by 2002:a05:6512:48d1:b0:50e:7a04:2229 with SMTP id
 er17-20020a05651248d100b0050e7a042229mr1196568lfb.25.1704700300833;
        Sun, 07 Jan 2024 23:51:40 -0800 (PST)
Received: from [10.0.0.100] (host-213-145-197-219.kaisa-laajakaista.fi.
 [213.145.197.219])
        by smtp.gmail.com with ESMTPSA id
 f26-20020ac2533a000000b0050e7a97ae32sm1062227lfh.78.2024.01.07.23.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 23:51:40 -0800 (PST)
Message-ID: <20894f38-2e35-40c7-9e6c-f1b7f375a030@gmail.com>
Date: Mon, 8 Jan 2024 09:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: Use devm_kcalloc() instead of devm_kzalloc()
To: Erick Archer <erick.archer@gmx.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240106162752.18599-1-erick.archer@gmx.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240106162752.18599-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PNZLJZGUJ65GKSXJ4O6WFZUVVXQLE4IR
X-Message-ID-Hash: PNZLJZGUJ65GKSXJ4O6WFZUVVXQLE4IR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNZLJZGUJ65GKSXJ4O6WFZUVVXQLE4IR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 06/01/2024 18:27, Erick Archer wrote:
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Can you fix the commit title to:
ASoC: ti: j721e-evm.: Use devm_kcalloc() instead of devm_kzalloc()

and send v2 with my:
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> ---
>  sound/soc/ti/j721e-evm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
> index b4b158dc736e..d9d1e021f5b2 100644
> --- a/sound/soc/ti/j721e-evm.c
> +++ b/sound/soc/ti/j721e-evm.c
> @@ -649,7 +649,7 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
>  	 * Link 2: McASP10 <- pcm3168a_1 ADC
>  	 */
>  	comp_count = 6;
> -	compnent = devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
> +	compnent = devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
>  				GFP_KERNEL);
>  	if (!compnent) {
>  		ret = -ENOMEM;
> @@ -763,7 +763,7 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
>  	 *		   \ pcm3168a_b ADC
>  	 */
>  	comp_count = 8;
> -	compnent = devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
> +	compnent = devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
>  				GFP_KERNEL);
>  	if (!compnent) {
>  		ret = -ENOMEM;
> --
> 2.25.1
> 

-- 
Péter
