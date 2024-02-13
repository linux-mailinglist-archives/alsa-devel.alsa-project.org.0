Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37945852E32
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 11:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 316191F4;
	Tue, 13 Feb 2024 11:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 316191F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707820871;
	bh=krsCH14lzt/9Maep29rwlQil5zrN1KmqSS4gA+WXvOk=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oyx5ezG95GlJ0kU7JIVPVY4vjCkFZor1dL0PFRKiq1FfnDbuwtn2NS5Jv6o/E9xeI
	 2eN+Xt+80rUzJ8jTeTWWRX6P59pcpCdpHCFGa/Bz+ePVYu02/PrqiLuqwejW1ECidC
	 9Ea442eMJppT7osT2lHJ7UwPz3qwDaauqxIctfLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21439F805AF; Tue, 13 Feb 2024 11:40:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BB14F8056F;
	Tue, 13 Feb 2024 11:40:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A632F80238; Tue, 13 Feb 2024 11:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4988EF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4988EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qI7vSxME
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-410cb93185dso15772115e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707820825;
 x=1708425625; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=73nQOWwOG85LqUQijwY3y2kTDnNiZFOlELYxkV2QtZQ=;
        b=qI7vSxMEqwa8UVfo543ksrnkwC76L6fXxpET0NHPPShveUjxHwBJHT+DO509RTgefN
         vfcaS8fuLgIaLIMJ28xOzJ+EffwparKEzVEqmjJ/pQPyZh30GPxoak+3eR4gBg4dpi0b
         LrxQJxXOYeyhA7kvXfTh2zSiEIKw7c0g/4VFDU7+HWSvzSjFhk62PyVgvLeNBDaTAZiK
         yu8WXQZKrJgqIpdoqxuBayOULtKQy+3YuSM/LB3tas9JOZWlFCIioOwkXKzAsZYwCWlu
         gm/ORAZFGOWM8VTgDXf16blEiMfWc6w0NMuCBNjasoSUl1ozYajv/Cvydst8RGfazzgN
         WOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820825; x=1708425625;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73nQOWwOG85LqUQijwY3y2kTDnNiZFOlELYxkV2QtZQ=;
        b=BtxHAy1VAjfQTlXlmsIx9x316YRV9ay5EeHdVcjNzZZbZfia+THOIMIFy7Oc4oP25i
         W4F7yq8R1U8QSVe2MYNhuSY4RN8FvXb/Sz0PnzHHPNlz+kwQP4aGN28G8Sb17r9UIKWD
         /iSX8wWbeftgG2/RwnpOBbYMB44TnutgjMwyO79n/+Y1MVhV17RV5OVnsiOfsgh39qdF
         T4Nh1ru9PSZ0yCjZKq/32rzgZofzu7Iv82AvsqCxjDZdAMYy4TWISbc30RVBo12VuzlW
         AJOsceKMpbYy1veZ/mz+nT4HTYqfaZHxmIo72QWLdEwaUrvgB9YqNesVeVdrrOvOTZdE
         KyNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpAxY9gUxWVjtPR3tSuQEHmBy6NAXsedd6gXpnpJCh0EGsFtXG9FHEFuFd6F2rN5fn661Reb08pub4I97xDxX17r+it+hAvF/CFd8=
X-Gm-Message-State: AOJu0YwH+7aKG1FkppuVBrXz8/WHg55GsqsANjcc8vSLBZl2XVhCfC/1
	hdPw5M7diz6stbXrc/M0UWFRnZEqn/QlajvAer2tN5PHR21yFIcFUSvewLZoLqE=
X-Google-Smtp-Source: 
 AGHT+IFE2dDl+7H9jhreEKYF+PUjtVPBRcNJ1aERTrrwwC5G4DL6A6zOSd3wAcqga8EO4wTyXt03Pg==
X-Received: by 2002:a05:600c:35d6:b0:410:bb99:af83 with SMTP id
 r22-20020a05600c35d600b00410bb99af83mr5171034wmq.23.1707820824810;
        Tue, 13 Feb 2024 02:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmcpbchwPyNzBfnbLcEYhaLnxRQSdBvMKjGg0MfaCh7YWyITG3KZKFcRYjfwe4AlHSq1gIXWIjsiVyv1IInLv1tZVd8zmquscCy1pDKYwdz6ynaEkFHraLMWSkLqh5TRj+L/JjihgJpQCVLPbPVfylHTV3batPXQXXindEdpdMqE0SUk5RUOICCx9f4Eb8h5DTJ8vDSxJbXIeNoJfFhXRq8lNOY7jMZ0c+xcyncspd16YHa0IkYhvVU1WUQqEArUfvTF+SOUM4Dt6OU0uFU2i45yO6k7zltzOl+BYRYI7XlCDdoZkIcl6ELjYAmedeiuco7vlSNcPnTNVtdkYiXPyrZF4K/En7BMlacB3N5g8zIxanpUjM7LvvquL2djRo3o6JaZB2FQXw7cwz+qwougFRtQ5bk+HRzQ8Ra85TnWjlTyaRM3YUC2vSlcte05ZhhsU6FN+8sVvI8CBvm84Yfr43mveqKKKtpCM3lfNAJocWu3ZsxvGPwGF945dM0y7mcsU7DT3vSkHlfGIfh+vu1JdHCc99fhNPmRDiBz88JQwxFhk5TEvCYmvJFBeL6rPDrBlBgM2F5Ni3KdJGf3GhrGtWo9/OtDGksh6UCEtuWoWIVDh1P6usyEPmTFpYFe0IEzH8GUOB4to5Jo8wRg+cp9MHbcK38SJVltJ8NNXA
Received: from localhost ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.gmail.com with ESMTPSA id
 m20-20020a7bce14000000b00410e0fd6179sm4811973wmc.34.2024.02.13.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 02:40:24 -0800 (PST)
References: <20240213101220.459641-1-arnd@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jerome
 Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 11:36:28 +0100
In-reply-to: <20240213101220.459641-1-arnd@kernel.org>
Message-ID: <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: LUNCX7FUX2ZM5AW3AFUZTTLCKZGUYZG2
X-Message-ID-Hash: LUNCX7FUX2ZM5AW3AFUZTTLCKZGUYZG2
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUNCX7FUX2ZM5AW3AFUZTTLCKZGUYZG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Casting between incompatible function types causes a warning with clang-16
> because it breaks control flow integrity (KCFI) rules:
>
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to
> 'void (*)(void *)' converts to incompatible function type
> [-Werror,-Wcast-function-type-strict]
>   243 |                                        (void(*)(void *))clk_disable_unprepare,
>       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>   406 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to
> 'void (*)(void *)' converts to incompatible function type
> [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>   406 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
>
> These two meson drivers cast clk_disable_unprepare() into a different type
> in order to have it automatically called from the driver relase. Add
> trivial helpers to do the same using correct types.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/meson/aiu.c   | 9 ++++++---
>  sound/soc/meson/t9015.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..211f360df284 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
>  	[MCLK]	= "spdif_mclk_sel"
>  };
>  
> +static void aiu_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static int aiu_clk_get(struct device *dev)
>  {
>  	struct aiu *aiu = dev_get_drvdata(dev);
> @@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
>  		return ret;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> +	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);

Hi Arnd,

This probably pre-dates the introduction of devm_clk_get_enabled()
It would probably be better to use that instead of duplicating helper
functions which do the same thing.

If for any reason it is not possible, a common helper in clk.h would
preferable I think.

>  	if (ret)
>  		dev_err(dev, "failed to add reset action on pclk");
>  
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..e0f9a603a5e9 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
>  	.max_register		= POWER_CFG,
>  };
>  
> +static void t9015_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static int t9015_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> +	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
>  	if (ret)
>  		return ret;


-- 
Jerome
