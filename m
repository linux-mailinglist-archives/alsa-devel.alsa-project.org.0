Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B057E4D4869
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 14:51:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3830A1917;
	Thu, 10 Mar 2022 14:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3830A1917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646920318;
	bh=B149z3GN1P16hMO5PGzTi6kfqADAiGingCVXFWSd8zU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njGHYXqaqfvlAmxZuMpeSSjM+K4dQVI7GQ6RuVwmpaV91qRKdRBs9GdNDVc9NK5lX
	 vL+7UePqHZBMexeI2iF7ZKiM2zzSoTvWUkKfWQr980OMuoutAMxoGDooXpR3/Lu7Mu
	 YE8/Kn6DeSGy+pKvYdqp3xeXymbnQ7gmLmFxL4Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91185F8013C;
	Thu, 10 Mar 2022 14:50:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5DCF8012F; Thu, 10 Mar 2022 14:50:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8F0F800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8F0F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cvAuw81c"
Received: by mail-oi1-x22f.google.com with SMTP id n7so5970382oif.5
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sfFUIzklnWnVL4/NLqVCgmdPgAbKIY19ONnLn3h0ra4=;
 b=cvAuw81cbKvlDF4KrPUJNj0o7UpR3CYaey30BpZGkkkxLpj3fQLvslW18WvlIPjJPP
 BO6HDVgQ7DU8Qh3SmSYEBKHk04oxGGQ0Py41UzBe9R6bKngQB/TeLwNBhn80NtFI9QXa
 FTUvzX60HV41ym3my5zZFyCQeHpWSynkbvJEq8wN1+XhbBBKxZoL2OVBjtEheyfmWgOs
 cZcfiGpBXb1yz76a6OE610G/Y/8cqzQKY9xUavjsUeK68eCS5yknWBElya4f4XyyRArl
 Sb3gjMwaWTfkrs+oJe2V3qhC4BRza5ARsgaDtwwQaANa88ZTH7NS9nTw03IpxGCBrjqo
 C4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sfFUIzklnWnVL4/NLqVCgmdPgAbKIY19ONnLn3h0ra4=;
 b=0/mXQto+ngBduwOCflDx7VtMRUgbgYw4ggkgrkBlyjw/FDNg1BDulFo88T8UHSOwwC
 hBe19i6D7qY+c76TsfHAAyCnGdeOC1yxeCDR62Rk1wVzROrrjzZWPZi3VCUTppwFFb6P
 Ve/C/bVOPmLDLDrpKq5qGAmghfh4b8SHbDLwuWL0HEH8nQIDSjzB2qoUX/gxIIYXAIc1
 7PAXSzfVXjSJoeM3oRImrsGIviMHjv8NYl4TNt6GZ70eAYIihgWzsJZoNDUWqfUk0QvP
 F+IZcmZyT+ZyN1CZboM6271SlrkxHw4601jiY8B4b/H0zu2ut9k+TOQ+Xjtvq1YYg5SV
 C3xA==
X-Gm-Message-State: AOAM531/sBJh//FhN0aaGqW9ueIuvXQ96OXFlB/kNgMvGbO/y2fv0+to
 u1CahRlCJktVGRQa40noTGE=
X-Google-Smtp-Source: ABdhPJyzI2TV0h+xCRwqoK4+L08FfZrkS81PP/kX0mU1cY8SDEm8SUclFA58XIZpUE36ixoogBP7HA==
X-Received: by 2002:a05:6808:1208:b0:2d9:e030:c4b6 with SMTP id
 a8-20020a056808120800b002d9e030c4b6mr3359409oil.43.1646920244632; 
 Thu, 10 Mar 2022 05:50:44 -0800 (PST)
Received: from geday ([2804:7f2:8006:9c16:7142:ae6b:7594:53e3])
 by smtp.gmail.com with ESMTPSA id
 bb33-20020a056820162100b00320ecc89402sm2342295oob.36.2022.03.10.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 05:50:44 -0800 (PST)
Date: Thu, 10 Mar 2022 10:50:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Message-ID: <YioCPFDqnrOew+6q@geday>
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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

On Tue, Mar 08, 2022 at 08:00:14PM +0100, Heiner Kallweit wrote:
> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
> 
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs(). With the patch the error is
> gone and that's the debugfs entries.

Hi Heiner,

Thanks for the patches!

This one has been bugging me for quite some time, I'm glad you took time
to fix it.

I'm sure Martin and the BayLibre folks will soon review both of your patches,
just wanted to thank you.

> 
> /sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller
> 
> Because debugfs is affected only, this may not be something for stable.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  sound/soc/meson/aiu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d299a70db..c1a2aea5f 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>  
>  	*dai_name = dai->driver->name;
>  
> +	switch (component_id) {
> +	case AIU_CPU:
> +		component->debugfs_prefix = "aiu_cpu";
> +		break;
> +	case AIU_HDMI:
> +		component->debugfs_prefix = "aiu_hdmi";
> +		break;
> +	case AIU_ACODEC:
> +		component->debugfs_prefix = "aiu_acodec";
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.35.1
> 
