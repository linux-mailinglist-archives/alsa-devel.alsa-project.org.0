Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D7F11A4AA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF081661;
	Wed, 11 Dec 2019 07:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF081661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046670;
	bh=0b/2gtskvi6EyvNdgjzaaQRpxB+ZoycAshxpBUIciBs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gbxPMFcZqiYiXCwSwIbekR+wXvNZSkdZXVdKZdvLnHZqdkIKJcfCKo2ZpVUI6RV9Z
	 6XV5XfhlYZrZxvLqFbTmr61mqjLQUaJUyHhRkc3VC85614P02N+sBFXNFJ74ApTdYN
	 CmDLIDABCPqSiCMl8uTA/+v7fDflcD79Gw/d+z58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16021F8028D;
	Wed, 11 Dec 2019 07:38:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CBD0F8020C; Wed, 11 Dec 2019 01:21:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E90CF800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 01:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E90CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Kehvauqw"
Received: by mail-lj1-x242.google.com with SMTP id d20so21893746ljc.12
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1VokoVAqguOmvgzOqI/c3V5fhNbIk5gxq1x6O20X4Y=;
 b=Kehvauqw/H10xu5gY3izNt1R1jJ7Ujtg4jY95tmAqR4XZvH97WgACBrNmfHXvcNTgB
 kPkg08hiqJAEPS1LwtB4LCU66iUFjgtoteGVtvdY+IwIC8o7ZmDpT6Xz1T6YDyq2eUTZ
 TqqR0UehjY7dZMQjSC9RXhBxL4LCKd0H+Sh/lMpcbKxA0XhaoNhbA4Lm9rfKexOuVJ2R
 nNgXSjz1j/05QMopZNJwtVdrtXNLuWoKVQ+KQPus95bo3naCg6/oBbRITZHQK0drrhx9
 BkHUW+zcFB7V+wHSaalnZuTBuIhWSVhlhD+B5e6C7n1WpDvbHChEfRltfq1xzGobNaP/
 ribw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1VokoVAqguOmvgzOqI/c3V5fhNbIk5gxq1x6O20X4Y=;
 b=qJzuu9sAA/mOENMkGZkRe1VlfFR23dbQsSJElhEj1JXv/ro7yMr7UiG3km9LBRSgJP
 D4FyMBAI/RXkEw+2m3IvxQwmFmT9v14rqr6DF7k4lfS1x5tC1jlOFNk9ppZz786uV80h
 CspjwPA3Do5YljeEclKPRet/O1bNX9/OloDJ/eB5YzPcBof4y2Du0PNpDimblek+RSyp
 Rwko0n+PKNNq/fDzpxvC7kyFOIPzKqtap8aBHbOJvNiz6rZ0y17wdrToJYjhNxMpi1Fr
 t/DEpwVJO/ZutTXk//ay8BJE91b1Xp5Zrwzka7DL7MXcbvcTA/0J17rxNQoSja81nGTC
 2v+A==
X-Gm-Message-State: APjAAAW9Xpny3oxzS5Ykdf0Ft4a0WoBDeMgdiHfEkyvgCLV1xevewpAJ
 GpeldrnDuQj0ieof8RnRDgdzgu+3uaOO9cRcizlaSA==
X-Google-Smtp-Source: APXvYqyacIEvA6uKr28IH7zXo4wBjP5jDgLuj0WicIfpWZh+Q9wTnJWZ6YDfFA3cT2K1Wd4ScLZVWME5p7hppspk92k=
X-Received: by 2002:a2e:859a:: with SMTP id b26mr47404lji.137.1576023686365;
 Tue, 10 Dec 2019 16:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20191210145406.21419-1-tiwai@suse.de>
 <20191210145406.21419-18-tiwai@suse.de>
In-Reply-To: <20191210145406.21419-18-tiwai@suse.de>
From: Orson Zhai <orsonzhai@gmail.com>
Date: Wed, 11 Dec 2019 08:21:14 +0800
Message-ID: <CA+H2tpGWxhd8TOu1rnA19gPRxOuXBNCj33OxY9Gja=ZinmxszA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH for-5.6 17/23] ASoC: sprd: Drop superfluous
	ioctl PCM ops
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 10, 2019 at 10:54 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> ASoC PCM core deals the empty ioctl field now as default.
> Let's kill the redundant lines.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/sprd/sprd-pcm-dma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
> index da4b8f5f192b..2284558684bc 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -508,7 +508,6 @@ static const struct snd_soc_component_driver sprd_soc_component = {
>         .name           = DRV_NAME,
>         .open           = sprd_pcm_open,
>         .close          = sprd_pcm_close,
> -       .ioctl          = snd_soc_pcm_lib_ioctl,
>         .hw_params      = sprd_pcm_hw_params,
>         .hw_free        = sprd_pcm_hw_free,
>         .trigger        = sprd_pcm_trigger,
> --
> 2.16.4
>

Got it. Thank you!
-Orson
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
