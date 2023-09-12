Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383D79C485
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 06:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D998E7F8;
	Tue, 12 Sep 2023 06:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D998E7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694491689;
	bh=poKkthx/MzVmYTk99wzvVhuhRbbIdorJ4msi00YPxHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BZzJNvfxWYA0+vu8ghyNsFhJWfZiAc+52sMJnbakAhBkiMK2F+0bctLcQ5olpV0kd
	 +GiakAoR8wWwhWWub3BkC4UQobR6GfJnwRWi7jtVbHt6Ua6aFNv7qOrJdQfz/e8Zme
	 J2/dz5kM4IQcObCZszlWUBdx04cAqgcA/oqiO+Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67647F80552; Tue, 12 Sep 2023 06:07:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 148E6F80246;
	Tue, 12 Sep 2023 06:07:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E965F80425; Tue, 12 Sep 2023 06:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAAC4F80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 06:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAAC4F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=h/3dQepi
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bf6b37859eso59993031fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 21:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694491571; x=1695096371;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY651OO1B0IxuzfBqgJwCa8ka7JoB/h/4oHm1Vke1kc=;
        b=h/3dQepiweCotc7K7uvqwHvOxNXZ+3J9MCVoDPNsflQFdsTMAUac9OaGvXVy36iO10
         /LKH/IOlOXLBewlzuvsvvj8dK7ONI6YN5mhjJe8K5+ZhkgkYKgLZE9jRbFoYdE3SRhg/
         HUmTlB1Xfhv+xAhvKJDwg8LHAfr/gxNPuUlif4S1rsvILZZbe1cwpElsADnYyM2PX2Ys
         3IXh8BPfrT4maIxff2lAzURwjTFlzvvlbWX79bB6fDNzOvDKK8aHymyhOtd4bXRlXuvQ
         eQObYS1tN9/vYx4hIE/npv1qwC2O72aD4qKPBWXZNBHEeQ9nqNVHBv3iNXxiGOnn+IHi
         4yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491571; x=1695096371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY651OO1B0IxuzfBqgJwCa8ka7JoB/h/4oHm1Vke1kc=;
        b=geQ3A4CJIxqlXXS0ZM2b6JS0PeOmYnk3RsIW/Wzx3ZN6Rit6RGucKHsNfNpu4QIpzm
         XmTyfmuu8GdxoTr15jgddWU7VI0uJ3hZxJFgmMuC/JvuAS567gkcWQH7xqPgSCEU9vFf
         gLqB0e0yffYYT5Rvx0ZnriiLSBFZDaCmbjl/ajSDmlzppQSi1F5+HNs/ueOZddujLC6D
         7lmGwIL6zkPBX07JYOMeKXGYPaLFnzyp07nySdVPz2ZGLLSBzI9zvKUMufYovrZNrBMK
         YBssue2JwNtofiN0tWFY592an0jL08G/6RaWjVd72htkduZzG1N2SoObarxWYFYsWBr1
         /lqw==
X-Gm-Message-State: AOJu0Yy6UiGQjpBS96L3U6odP9cySW2ys+TKJuryVQVt0LS2PzFZKT8P
	HXtnmlK7AY8CntMO5JOD1cA=
X-Google-Smtp-Source: 
 AGHT+IF6aSP6f/4l0YUbqhOMf7LJmWkovprm2vd7CGEJbPM43nKLDcefTsH2sxu/IuXFuDa+st59Kg==
X-Received: by 2002:a2e:8858:0:b0:2bc:feb6:6da4 with SMTP id
 z24-20020a2e8858000000b002bcfeb66da4mr10671516ljj.33.1694491570763;
        Mon, 11 Sep 2023 21:06:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id
 x16-20020a170906135000b009a9f00bdf8dsm6204908ejb.191.2023.09.11.21.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:06:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 20/54] ASoC: sunxi: convert not to use asoc_xxx()
Date: Tue, 12 Sep 2023 06:06:09 +0200
Message-ID: <8267893.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <87o7i8qnie.wl-kuninori.morimoto.gx@renesas.com>
References: 
 <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
 <87o7i8qnie.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: UDTXXXRUMU65JYENX4YWJUX7AHCKWXHV
X-Message-ID-Hash: UDTXXXRUMU65JYENX4YWJUX7AHCKWXHV
X-MailFrom: jernej.skrabec@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDTXXXRUMU65JYENX4YWJUX7AHCKWXHV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne torek, 12. september 2023 ob 01:49:13 CEST je Kuninori Morimoto 
napisal(a):
> ASoC is now unified asoc_xxx() into snd_soc_xxx().
> This patch convert asoc_xxx() to snd_soc_xxx().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-codec.c | 12 ++++++------
>  sound/soc/sunxi/sun4i-spdif.c |  4 ++--
>  sound/soc/sunxi/sun50i-dmic.c |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index f0a5fd9011018..ad6336cefaea4 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -282,7 +282,7 @@ static void sun4i_codec_stop_capture(struct sun4i_codec
> *scodec) static int sun4i_codec_trigger(struct snd_pcm_substream
> *substream, int cmd, struct snd_soc_dai *dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> +	struct snd_soc_pcm_runtime *rtd = 
snd_soc_substream_to_rtd(substream);
>  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
> 
>  	switch (cmd) {
> @@ -314,7 +314,7 @@ static int sun4i_codec_trigger(struct snd_pcm_substream
> *substream, int cmd, static int sun4i_codec_prepare_capture(struct
> snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> +	struct snd_soc_pcm_runtime *rtd = 
snd_soc_substream_to_rtd(substream);
>  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
> 
> 
> @@ -355,7 +355,7 @@ static int sun4i_codec_prepare_capture(struct
> snd_pcm_substream *substream, static int
> sun4i_codec_prepare_playback(struct snd_pcm_substream *substream, struct
> snd_soc_dai *dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> +	struct snd_soc_pcm_runtime *rtd = 
snd_soc_substream_to_rtd(substream);
>  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
>  	u32 val;
> 
> @@ -556,7 +556,7 @@ static int sun4i_codec_hw_params(struct
> snd_pcm_substream *substream, struct snd_pcm_hw_params *params,
>  				 struct snd_soc_dai *dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> +	struct snd_soc_pcm_runtime *rtd = 
snd_soc_substream_to_rtd(substream);
>  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
>  	unsigned long clk_freq;
>  	int ret, hwrate;
> @@ -597,7 +597,7 @@ static struct snd_pcm_hw_constraint_list
> sun4i_codec_constraints = { static int sun4i_codec_startup(struct
> snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> +	struct snd_soc_pcm_runtime *rtd = 
snd_soc_substream_to_rtd(substream);
>  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
> 
>  	snd_pcm_hw_constraint_list(substream->runtime, 0,
> @@ -616,7 +616,7 @@ static int sun4i_codec_startup(struct snd_pcm_substream
> *substream, static void sun4i_codec_shutdown(struct snd_pcm_substream
> *substream, struct snd_soc_dai *dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> +	struct snd_soc_pcm_runtime *rtd = 
snd_soc_substream_to_rtd(substream);
>  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
> 
>  	clk_disable_unprepare(scodec->clk_module);
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index b849bb7cf58e2..199cfee41d319 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -246,8 +246,8 @@ static void sun4i_snd_txctrl_off(struct
> snd_pcm_substream *substream, static int sun4i_spdif_startup(struct
> snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = 
asoc_substream_to_rtd(substream);
> -	struct sun4i_spdif_dev *host =
> snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0)); +	struct
> snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream); +	
struct
> sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd,
> 0));
> 
>  	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
>  		return -EINVAL;
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index 2599683a582dc..3f6fdab75b5fc 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -75,7 +75,7 @@ static int sun50i_dmic_startup(struct snd_pcm_substream
> *substream, struct snd_soc_dai *cpu_dai)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct sun50i_dmic_dev *host =
> snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0)); +	struct 
sun50i_dmic_dev
> *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
> 
>  	/* only support capture */
>  	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)




