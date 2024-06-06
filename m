Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F28FF42C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 19:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 737FD851;
	Thu,  6 Jun 2024 19:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 737FD851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717696680;
	bh=gkCUgE7P7NzShBjfKiNhvn1MyEbe7axgv1vrcTnyD4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bwG73Vf1UqdW2AFXP1xRHSlDUpa5Nl7oqa0AkHRYllGwn3/JvKjsx4sw5qYOAnYAa
	 6xGEsg0DC57/QNu/dtUpSyCVE9mV5PEwYvOdeMj6E+e3pBnT/TuBh5K4t23cFPvrtq
	 2PgaX6RWdvFUFzlYWweh+zvOlgwrz7vimQJKTEqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5308DF805AC; Thu,  6 Jun 2024 19:57:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5595F804FD;
	Thu,  6 Jun 2024 19:57:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A02EBF804E5; Thu,  6 Jun 2024 19:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C79EF80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 19:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C79EF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V/FaQLm4
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52b962c4bb6so1871868e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717696635; x=1718301435;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bzgl98bn7gL5PMnWW0uBPTQqYfyzdwW025Pm9JSfbr4=;
        b=V/FaQLm4gYo0zFMj8KQ9vCybWY91BoyiQMc16YOsn/MuOlWCKSQ1EssJGVNqujUjPX
         T4rxxHESRJu2ACAqSiXejxkYyAhR6UWyTS63pYU+rDJdWlgG5rsPgMLF2K2ahSHk1sFn
         Q1YKfcThMxa+gxEK4HHhio42+tfqS4wL/QiVmMgIpJ5rN8qJHovXVGKKmqbwmDkFl7nI
         IPk6ol4GlqPFr57Lgze95wh3YTXVhN44S3nxy8GrEWv2GgcawJ9rckoH3AorLB03gcYD
         F1WDsqRAeW3H7kT5TuySbNYMOMVXTfB7mNJfiuA3rx8COV4gBiYzIwotbhE60VHB/nHQ
         HD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717696635; x=1718301435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzgl98bn7gL5PMnWW0uBPTQqYfyzdwW025Pm9JSfbr4=;
        b=Ieb0zwj8DyYIg1MaJeBai7dNsczEVbhUeQnFx6UXSoTGMpK2GDu3/MO8CdCQdRiZK+
         IiQqi3ZU14QWeMSaJmFg/aJgABAdoMmCHI1masBmie7P0uO+76eDPG+Djhy9xRprzz/+
         oT4GU0vdZKsL3OvBLuQSK6FA7PrYJqf5Zm7gOblCjg6bEEuI0sJqE1QbK9pVMOqN67/H
         OuTNXRZB+YyctScEaR8EvbLmH4mSBAaiDFr+0DKTRy9Z9N39bDOauWv2Q8rm/3VaJZm9
         VzGjoYalrfhWeCtZaz1fbiWJB2FDBJTsjk8/rMB6j/7zFISNkB/8i30HYgtKI/FxCWt5
         l+wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEooTf59elQcwZNZqPf4t+PnrBbBnuIVG0iG088v4UQCatclvS/t0hLHIETmJ7sWZ3O+eHDgc+KyVV0EG8YMlflfk/l38ujlacDLw=
X-Gm-Message-State: AOJu0Yxy/gYmpeAVb85wSP4vL/NyQ5S3ofbu1mAK9tWkheRZdUMUGIWP
	o2xpD+L1VyHfeQt9rXuQMLsQ/LNWGHAMKdUIT2kAec0tI6unFdjy
X-Google-Smtp-Source: 
 AGHT+IHfsZTaWw8cyEJODnWTHek4v/td5BgR07Fxe0Qt5gqajahKNvtk8vdCRCB90tggvG/AdMdglw==
X-Received: by 2002:ac2:4472:0:b0:52b:872f:228e with SMTP id
 2adb3069b0e04-52bb9f8a542mr317359e87.41.1717696634711;
        Thu, 06 Jun 2024 10:57:14 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi.
 [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb423d528sm258759e87.191.2024.06.06.10.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 10:57:14 -0700 (PDT)
Message-ID: <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
Date: Thu, 6 Jun 2024 21:00:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
To: Primoz Fiser <primoz.fiser@norik.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240606070645.3519459-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BOR4KWNN4RC7ZHNU7Q2RKMYNCK7RC7NY
X-Message-ID-Hash: BOR4KWNN4RC7ZHNU7Q2RKMYNCK7RC7NY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOR4KWNN4RC7ZHNU7Q2RKMYNCK7RC7NY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/6/24 10:06 AM, Primoz Fiser wrote:
> Set driver name to DRV_NAME. This simplifies the code and gets rid of
> the following error messages:
> 
>   ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  sound/soc/ti/omap-hdmi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
> index 639bc83f4263..3f35eedeea41 100644
> --- a/sound/soc/ti/omap-hdmi.c
> +++ b/sound/soc/ti/omap-hdmi.c
> @@ -354,11 +354,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
>  	if (!card)
>  		return -ENOMEM;
>  
> -	card->name = devm_kasprintf(dev, GFP_KERNEL,
> -				    "HDMI %s", dev_name(ad->dssdev));
> -	if (!card->name)
> -		return -ENOMEM;
> -
> +	card->name = DRV_NAME;

I think it would be better to name is simply "HDMI" instead

>  	card->owner = THIS_MODULE;
>  	card->dai_link =
>  		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);

-- 
Péter
