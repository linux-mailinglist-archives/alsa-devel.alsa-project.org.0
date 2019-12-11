Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0111A806
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 10:47:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D111614;
	Wed, 11 Dec 2019 10:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D111614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576057651;
	bh=3t0gCkYXDpo2DDBPG5FeesmFDm7SYCzm2veYFcu5gVU=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SY9aGXn4ELamABqGffQ/RsIxdwuFJmNF3Q6Bm43zpwv7+uTy9BxeODJsStROgCisS
	 F17R4uSG0LTqlg5tb6HqNiDI1kusqbUxmlOmpoDuAozdjJ4Bo+igGoWAsO89D5euc0
	 SCxEhPdvLLxCTUrbzIpSnXLLm28eAPDRLiatAWvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817B9F8019B;
	Wed, 11 Dec 2019 10:45:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E02F801F4; Wed, 11 Dec 2019 10:45:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B58FAF800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 10:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B58FAF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="1HI41Tu1"
Received: by mail-wm1-x343.google.com with SMTP id d73so3029552wmd.1
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=A2LeliFIgz5VQq9ufp0r+qdHLKih86IEHvfQ64OMcSg=;
 b=1HI41Tu1psU0v8RhB6XP0haBYdGQ3oG2gCP7r3G4M7K39JqWxbhw8HPfnzcvP5hC27
 XxTWwRBnPoF+3LlikIL23aNgZrj2imDtWuXMku2Gwtd3qwdJWxQiF4CtEzjHewOhAhLW
 EE8EdXXZVVPkN5KGEaHZFqm5vmkzsOpP2a4xuLCXfaWAgeG/XFZF4/3+5RlGxqsEtL9o
 5ZpkBsFJ2XOU5gSQSpNQ/o+fUsJE1KJLwAavLFWQBAz2oArEFH3CI3U6SesIJxXZkol4
 sPOkRRFllk2nXs3aDYYYV08r+tgjgHmHbcYVZewEJpcI9MVvvdvJlgRdSmjgSuKf2FTj
 9c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=A2LeliFIgz5VQq9ufp0r+qdHLKih86IEHvfQ64OMcSg=;
 b=uBkgJH0w+Ob78sPSrzFQnyUeDA1MzBklwZ1Zj3ukXog5POuDcFJ+KlPO2l2ELJa8HK
 7SYGU1DwOtntI4eVBZNV/0hia3V9N3lCIecPKOUzqlurw4Tq4YiyfCbewUgj9TbZuWn9
 ChXg6VcssG56v1G0J3Jn5xsjcApBJnuwvgz9ZGuklICHoFNs9c/hHpe81IsJqPInUp4k
 tY+OMiCo0nAbHdumINfzeoA34SvvUwWtggqz3XTm3WPLVg0nIGxkF1yNadq1lmC1FiEF
 5XrgJlTYbSLc2sqtFCXvdtGfuj3TwmsQLHGoaTHxMoDDfOgbo708EnlFRjl0B0HJIC2f
 VpOA==
X-Gm-Message-State: APjAAAXMuD9TQ6Sc946S7fL9esWmaciM6+LsoznZ6uT+L7Rc1No9idd9
 blsmSgbnLx8A7TUzHK8GNXxdzQ==
X-Google-Smtp-Source: APXvYqw9+Ek1sjVx1MWRxPwUv7xpMqUKeOxY9RPvwPBNU3UU4lPf56RpY6+d37bL1WKyp2aH1qQzhw==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr2405290wmg.18.1576057539752; 
 Wed, 11 Dec 2019 01:45:39 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w20sm1628138wmk.34.2019.12.11.01.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 01:45:39 -0800 (PST)
References: <20191210145406.21419-1-tiwai@suse.de>
 <20191210145406.21419-11-tiwai@suse.de>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
In-reply-to: <20191210145406.21419-11-tiwai@suse.de>
Date: Wed, 11 Dec 2019 10:45:38 +0100
Message-ID: <1jh827kxfh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH for-5.6 10/23] ASoC: meson: Drop
	superfluous ioctl PCM ops
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


On Tue 10 Dec 2019 at 15:53, Takashi Iwai <tiwai@suse.de> wrote:

> ASoC PCM core deals the empty ioctl field now as default.
> Let's kill the redundant lines.
>
> Cc: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/meson/axg-frddr.c | 3 ---
>  sound/soc/meson/axg-toddr.c | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
> index 665d75d49d7b..0a7d41257a38 100644
> --- a/sound/soc/meson/axg-frddr.c
> +++ b/sound/soc/meson/axg-frddr.c
> @@ -151,7 +151,6 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
>  	.num_dapm_routes	= ARRAY_SIZE(axg_frddr_dapm_routes),
>  	.open			= axg_fifo_pcm_open,
>  	.close			= axg_fifo_pcm_close,
> -	.ioctl			= snd_soc_pcm_lib_ioctl,
>  	.hw_params		= axg_fifo_pcm_hw_params,
>  	.hw_free		= axg_fifo_pcm_hw_free,
>  	.pointer		= axg_fifo_pcm_pointer,
> @@ -275,7 +274,6 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
>  	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
>  	.open			= axg_fifo_pcm_open,
>  	.close			= axg_fifo_pcm_close,
> -	.ioctl			= snd_soc_pcm_lib_ioctl,
>  	.hw_params		= g12a_fifo_pcm_hw_params,
>  	.hw_free		= axg_fifo_pcm_hw_free,
>  	.pointer		= axg_fifo_pcm_pointer,
> @@ -345,7 +343,6 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
>  	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
>  	.open			= axg_fifo_pcm_open,
>  	.close			= axg_fifo_pcm_close,
> -	.ioctl			= snd_soc_pcm_lib_ioctl,
>  	.hw_params		= g12a_fifo_pcm_hw_params,
>  	.hw_free		= axg_fifo_pcm_hw_free,
>  	.pointer		= axg_fifo_pcm_pointer,
> diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
> index 7fef0b961496..f6023397c8fe 100644
> --- a/sound/soc/meson/axg-toddr.c
> +++ b/sound/soc/meson/axg-toddr.c
> @@ -183,7 +183,6 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
>  	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
>  	.open			= axg_fifo_pcm_open,
>  	.close			= axg_fifo_pcm_close,
> -	.ioctl			= snd_soc_pcm_lib_ioctl,
>  	.hw_params		= axg_fifo_pcm_hw_params,
>  	.hw_free		= axg_fifo_pcm_hw_free,
>  	.pointer		= axg_fifo_pcm_pointer,
> @@ -222,7 +221,6 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
>  	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
>  	.open			= axg_fifo_pcm_open,
>  	.close			= axg_fifo_pcm_close,
> -	.ioctl			= snd_soc_pcm_lib_ioctl,
>  	.hw_params		= g12a_fifo_pcm_hw_params,
>  	.hw_free		= axg_fifo_pcm_hw_free,
>  	.pointer		= axg_fifo_pcm_pointer,
> @@ -292,7 +290,6 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
>  	.num_dapm_routes	= ARRAY_SIZE(sm1_toddr_dapm_routes),
>  	.open			= axg_fifo_pcm_open,
>  	.close			= axg_fifo_pcm_close,
> -	.ioctl			= snd_soc_pcm_lib_ioctl,
>  	.hw_params		= g12a_fifo_pcm_hw_params,
>  	.hw_free		= axg_fifo_pcm_hw_free,
>  	.pointer		= axg_fifo_pcm_pointer,

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
