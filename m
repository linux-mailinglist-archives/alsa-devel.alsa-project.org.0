Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D05B31D0
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 10:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59FAA1652;
	Fri,  9 Sep 2022 10:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59FAA1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662712552;
	bh=97eH85sxqFK+y54LqBAJk9bTO6v2biB3o8rX9kSQmV8=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m326Tk8s5m9UngsRAp+4BodRl2lCHJRe82AjWvWRbGtwRk24DQY6vzosne9hQOlmj
	 C2aDDdtrhMxVm4QOeUohtKRa/a3A9E1YJ5SRsQ+Me8ipl6S6x0J8YpbVhwbu1HJwBa
	 LNfkEsq+bv2fe+oQhvc2SNQd3I3gGjS5mg+xilf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A0AF8032B;
	Fri,  9 Sep 2022 10:34:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AA2BF8011C; Fri,  9 Sep 2022 10:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E388F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 10:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E388F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="3JHJpp1m"
Received: by mail-wm1-x333.google.com with SMTP id k17so847505wmr.2
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date;
 bh=cJmKXbrEOH7YaSjVFnJaRcO9sHnhjmplPO8XOTbGbo0=;
 b=3JHJpp1mpo+lyuQb26Me3R09iGgAsiMXetyoop2R8XJ8I/ueXwZdKqRE0QvlVkzYb6
 gwJRjOSa9s30C5IT6TilFAn8RxjOO3PsWplW6ezXe5DQX0SKjkWsEbrZ5dn0H1kLmVBu
 UC/0GShVCB0orbu8OQu03YuOKXrb8dIlpBphdDGG8Lv00/MbnxkRUnGPCyeYXfNbeoqO
 Az5qtK1dofCA0sSSLG3WvIcLi7sk/vIe89uNqZpduemxd7wF2WAeupvNrv+aixVI31iw
 tVpgAREA/PMZ/FTC2KY3TatA8EgfuXzmbo8yyQuk74xZ9UoGH/J4qx5TSNEd7XW2Q+BB
 S74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
 bh=cJmKXbrEOH7YaSjVFnJaRcO9sHnhjmplPO8XOTbGbo0=;
 b=tT6eu2DWaybzMmIr9cho9pTKHB9QnEEYz/wxhFH9PdmTcisnznl9hIINy1gPGdVj2d
 97BHS+zOI+VPVVgSJ2LwuxBMw4qCAk6Y9QGpVBxWv9+5ARAHptXqioKYzQktQ0WhdTo8
 To8gVSi+5+cKv9YIWBWZc3JH0zHPSv/y9WGH5MDWv01doj8+c/hNH5G2mVKeNoXFNqdz
 IrKqHE06CJENgnCG/Z9zMMskLOw8gLm9+uBfuZEi8qqKGmlMMeqlquN9CHj04eeDmGes
 9kInjFMLrAw/u7+1rbxoFAlQtbndq5iuw9V8ehMuTOzA1riTCliusZ1Z2KMDJIh3CpU0
 XRpw==
X-Gm-Message-State: ACgBeo2Eh7j0Ugt+NmzuaNrU1c7GF8Eflu7/S23RSIPaFU0V+10Dl2Qa
 vz4oQO6DuMpFibVyh5KIFHvgaw==
X-Google-Smtp-Source: AA6agR7Py4WKeGqhTQpvX9qE2taTc78C4DOL0egvGJEoYxY8FZ/UpjRKMvUtDCSF1lkq3DadlUbdGw==
X-Received: by 2002:a05:600c:3c96:b0:3a6:58b2:a98 with SMTP id
 bg22-20020a05600c3c9600b003a658b20a98mr4801361wmb.43.1662712483138; 
 Fri, 09 Sep 2022 01:34:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 f1-20020a0560001b0100b00228d94931dcsm1238158wrz.116.2022.09.09.01.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 01:34:42 -0700 (PDT)
References: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(), and remove
 .remove function
Date: Fri, 09 Sep 2022 10:27:22 +0200
In-reply-to: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri 09 Sep 2022 at 01:21, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current aiu-fifo.c is using kzalloc()/kfree(), but we can replace
> it by devm_kzalloc(), and remove kfree().
> This patch do it.

I'm not sure about this change Kuninori.

This is the dai probe, not the device driver probe.
If I'm not mistaken it gets called when binding the card.

The components and card drivers are different here.

If the card probes several times for any reason, EPROBE_DEFER for
example, wouldn't this allocate the memory several times without
releasing it ?

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/aiu-fifo.c | 10 +---------
>  sound/soc/meson/aiu-fifo.h |  1 -
>  sound/soc/meson/aiu.c      |  2 --
>  3 files changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
> index d67ff4cdabd5..843e5067e07d 100644
> --- a/sound/soc/meson/aiu-fifo.c
> +++ b/sound/soc/meson/aiu-fifo.c
> @@ -196,7 +196,7 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct aiu_fifo *fifo;
>  
> -	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
> +	fifo = devm_kzalloc(dai->dev, sizeof(*fifo), GFP_KERNEL);
>  	if (!fifo)
>  		return -ENOMEM;
>  
> @@ -204,11 +204,3 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
>  
>  	return 0;
>  }
> -
> -int aiu_fifo_dai_remove(struct snd_soc_dai *dai)
> -{
> -	kfree(dai->playback_dma_data);
> -
> -	return 0;
> -}
> -
> diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
> index 42ce266677cc..fb323a4385f7 100644
> --- a/sound/soc/meson/aiu-fifo.h
> +++ b/sound/soc/meson/aiu-fifo.h
> @@ -26,7 +26,6 @@ struct aiu_fifo {
>  };
>  
>  int aiu_fifo_dai_probe(struct snd_soc_dai *dai);
> -int aiu_fifo_dai_remove(struct snd_soc_dai *dai);
>  
>  snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>  				   struct snd_pcm_substream *substream);
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 88e611e64d14..7e632aa31368 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -123,7 +123,6 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
>  		.ops		= &aiu_fifo_i2s_dai_ops,
>  		.pcm_new	= aiu_fifo_pcm_new,
>  		.probe		= aiu_fifo_i2s_dai_probe,
> -		.remove		= aiu_fifo_dai_remove,
>  	},
>  	[CPU_SPDIF_FIFO] = {
>  		.name = "SPDIF FIFO",
> @@ -139,7 +138,6 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
>  		.ops		= &aiu_fifo_spdif_dai_ops,
>  		.pcm_new	= aiu_fifo_pcm_new,
>  		.probe		= aiu_fifo_spdif_dai_probe,
> -		.remove		= aiu_fifo_dai_remove,
>  	},
>  	[CPU_I2S_ENCODER] = {
>  		.name = "I2S Encoder",

