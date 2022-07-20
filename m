Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF357BDE6
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 20:35:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE11167D;
	Wed, 20 Jul 2022 20:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE11167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658342128;
	bh=9C/9XMcXahx8cW+Jv7lYe3EnQkkAKaQoFBk6CKin24g=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFd6CLORbbC0YQi4827yr6xFGJFMMSNZtRI/2JdJDIKGJ4oFn6aKloLVkNugByDeG
	 pE5pAPlQYx3PgcjswBmC7cy2wGamm3RCPq9bQ8gZIzt7x71roNx4DiWWO2cvBVL9S9
	 ZTuCAnI8S7/XJ/Rp6a/rLAOjcc0zC1ghGB0QPjgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D7FFF8025D;
	Wed, 20 Jul 2022 20:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E791F80169; Wed, 20 Jul 2022 20:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2DD7F80139
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 20:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2DD7F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iYFL0IJ7"
Received: by mail-lf1-x129.google.com with SMTP id t1so31604131lft.8
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=b2IGjPvv1choYzoAV1Tqhyte6OXYF3l5NgOtF5HHS20=;
 b=iYFL0IJ7Jkqoxjp1RcyQ2rt7c64g4N56f4zvzpC6OkXseA9YEoUigicZm4EbSoAbWn
 MAJbohHLv4MjcFefSfAZ5ZjWf6o2tKGwWL/3OnxSxN+aXZNvlFDFHvtcB2KmAUZW5VYF
 EVbUMrwO5a934pg4DSytH9B42vsodpul1HELuhluRODPL1ekWNCiq3SpCtotzI986d8N
 UBbV7+wHxF4z21kqlz7m1SmbuHSpqYTDWonRXvi+Iw6HXccNJSX7U9v3kkkShvwqdocK
 cz3NLO6xnqeuifyuN9PO/pCXFic+4z4xzcfaO5JOUApi1HYNJOVkJEvZ3xhBw9cUPTdV
 D5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=b2IGjPvv1choYzoAV1Tqhyte6OXYF3l5NgOtF5HHS20=;
 b=NcSEFgYKnQ+z+9DmA8QFXSHADhZyvT3xDbqhwtLGSQ1rFJNmycNhcb1bs1lZSgidOk
 R+RVjoXs34hJnK74rdWnT1r9OOxEqH3sVPa0MizHzWbRus309oteHKI54unwqkQEnu3y
 L+Slimk6K/wV0l40GGxcLs5s7fSOnnIGLY1Gl/NqQ9Ro7W8PH/bWnVPTTl5AiffqAqnt
 8x0mUojxeoxOPnXsq5bbj7YZ+uPnh9pyWMMfo6BjElOm6LJ/Yzti5oZ2iXFQ38ZMd1gd
 0PlCSfiSkNbjoeUcfwAR6nE/DLtJqbStPasvnYW3PsNqKufhF3iKDjTJmODtgzYCgfLA
 3HkQ==
X-Gm-Message-State: AJIora8KeBz31hELXJPfqQA9sSxZxaZe1pDA5QD0Zfy/X4GBmnVYSLIN
 YQhAZTzcMZkPECbM8yg6fY4=
X-Google-Smtp-Source: AGRyM1uUAYYbBd48fiG/kxsmXg01RYS7NmZ3PD6fqO0UdWLn4xzQMhfjvCplPxmst1VRf+olDmgAUg==
X-Received: by 2002:a05:6512:54e:b0:48a:19c9:2495 with SMTP id
 h14-20020a056512054e00b0048a19c92495mr16960596lfl.496.1658342060315; 
 Wed, 20 Jul 2022 11:34:20 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651c10ab00b0025a7bb04a7csm106390ljn.108.2022.07.20.11.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 11:34:19 -0700 (PDT)
Message-ID: <de72dd7f-639b-1733-a38b-a0ed9346f3d9@gmail.com>
Date: Wed, 20 Jul 2022 21:36:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
References: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: ti: remove sound support for DaVinci DM644x and
 DM646x
In-Reply-To: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Lukas,

On 20/07/2022 14:21, Lukas Bulwahn wrote:
> Commit 7dd33764486d ("ARM: davinci: Delete DM644x board files") and commit
> b4aed01de486 ("ARM: davinci: Delete DM646x board files") removes the
> support for DaVinci DM644x and DM646x boards.
> 
> Hence, remove the sound support for those boards as well.

This is not going to remove the sound support, it is just removes the
select, which is now rendered NOP as neither MACH_DAVINCI_EVM nor
MACH_DAVINCI_DM6467_EVM is an option to select...

There is still structs and some code in davinci-evm.c in the path of
if (machine_is_davinci_evm())
and
else if (machine_is_davinci_dm6467_evm())

Those can also go, but I can only  drop that in about two weeks from now...

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  sound/soc/ti/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
> index 40110e9a9e8a..35fddd7c501a 100644
> --- a/sound/soc/ti/Kconfig
> +++ b/sound/soc/ti/Kconfig
> @@ -180,9 +180,6 @@ config SND_SOC_DAVINCI_EVM
>  	select SND_SOC_DAVINCI_ASP if MACH_DAVINCI_DM355_EVM
>  	select SND_SOC_DAVINCI_ASP if SND_SOC_DM365_AIC3X_CODEC
>  	select SND_SOC_DAVINCI_VCIF if SND_SOC_DM365_VOICE_CODEC
> -	select SND_SOC_DAVINCI_ASP if MACH_DAVINCI_EVM # DM6446
> -	select SND_SOC_DAVINCI_MCASP if MACH_DAVINCI_DM6467_EVM
> -	select SND_SOC_SPDIF if MACH_DAVINCI_DM6467_EVM
>  	select SND_SOC_DAVINCI_MCASP if MACH_DAVINCI_DA830_EVM
>  	select SND_SOC_DAVINCI_MCASP if MACH_DAVINCI_DA850_EVM
>  	select SND_SOC_TLV320AIC3X
> @@ -191,8 +188,6 @@ config SND_SOC_DAVINCI_EVM
>  	  DaVinci EVM platforms:
>  	  - DM355
>  	  - DM365
> -	  - DM6446
> -	  - DM6447
>  	  - DM830
>  	  - DM850
>  

-- 
Péter
