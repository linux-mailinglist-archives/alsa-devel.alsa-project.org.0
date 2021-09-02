Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD4A3FE8DB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 07:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7B01775;
	Thu,  2 Sep 2021 07:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7B01775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630561563;
	bh=RY7s5mcRXJr1CGFxte7p1vFiD54Jy7Vvv8B26oYEY8E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUiiZ5P4xaonH0yXSszOforsVsoy30XU5O8ErWAHmRBKuOC8NCxPV/GF1jZ54YvNo
	 5ZLGeCJSKnm9enuBMe5QsePmkkPFL7YQlL4iQ5NaRyOpOMyWlO1rkUL5RxzHWNQyOS
	 RKrq9j/SHGIaYDj1Wadtxg/9Gc+oaQmAkOEDQIdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94571F80125;
	Thu,  2 Sep 2021 07:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA539F80269; Thu,  2 Sep 2021 07:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08B54F8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 07:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B54F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SflWTuRV"
Received: by mail-lj1-x231.google.com with SMTP id p15so1415099ljn.3
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=whtV4mfvH1NLVqepuQoF5mH+azqIMtCQpWr7A8sgds8=;
 b=SflWTuRVnPnyoXhl1IDxe8Xhe1X3He0u1LQUl9xdq8VoKmatudBt38yCMfhCOyLRwA
 27LAUAnu6ZZZ4MUxJHwqoZB3a8YbmECVSQErelN/6POW1UXw83HIV2YzOGR/r/MLFOvj
 GDJSbRyjSFncm33xccJJZhE/f31DdMVTe4shtUqnf4Bt7gtHr4CAlG/tsZkFY6VYl6Py
 JFyvYSgPape+UxjoOmFp74GDigJ6OwgmL+7JNNe2VCbuyS/Aw32KLbxA2+WcQhEayzV9
 xgdkL+wzClFNIVhnogRI30f3Ro7K9aBoUz+WQ19y9cWXHfDe2gaaTuUE+ycmSGb5L8JZ
 DdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=whtV4mfvH1NLVqepuQoF5mH+azqIMtCQpWr7A8sgds8=;
 b=lDuFQ0jaPhi75fdL8TasUJZGyAbquoOMjsc3hHlBX7XFfHfqCFgh3BBrm1avsXO33M
 BDNAx70oKMTgB0867sNtx4I5cG20M6mk0jzBXR9vdpX8jDMAgNq/iDRNgiUbsJA7iKt5
 Uh8f9NPOKnKOQgkkpXriNL7QzjSmf2sjPs/RPJhYMLzVwtYrCrKpmjZjGgnPMtFA1Pg7
 ryKW0FjLAblFBF9OxaGyVRje29KqLya/yWy47Ly8N5c+kz/my+SGHRaJXinWE9VGPFdm
 AH2+nlddK6ou5zfIks6vBrLaIOaObUoP+jZ2CBEy4PEBv3UC58VPGihtCpojaqhK5/W/
 /qHw==
X-Gm-Message-State: AOAM530DSuufbBQIaGGAIG6qrfXPG7/bgfHzIWOfAA9LBaBkcP8nEn2P
 ZOWeClBXxQmnH/qHVPXe5U4=
X-Google-Smtp-Source: ABdhPJyV/25oXu9weIAPEu81AwyV5yGPI5+pU6NMDGYNq7Am9/WGIHp7CTHevGSEs3uixH6nBSuOxQ==
X-Received: by 2002:a2e:991a:: with SMTP id v26mr1103580lji.111.1630561478507; 
 Wed, 01 Sep 2021 22:44:38 -0700 (PDT)
Received: from [10.0.0.115] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id t12sm91315lfg.151.2021.09.01.22.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 22:44:37 -0700 (PDT)
Subject: Re: [PATCH] ASoC: ti: rename CONFIG_SND_SOC_DM365_VOICE_CODEC_MODULE
To: Masahiro Yamada <masahiroy@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20210901164009.1546967-1-masahiroy@kernel.org>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <2f5d4845-631c-525f-c624-c41bd71f5815@gmail.com>
Date: Thu, 2 Sep 2021 08:44:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901164009.1546967-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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



On 01/09/2021 19:40, Masahiro Yamada wrote:
> Kconfig generates include/generated/autoconf.h to make CONFIG options
> available to the pre-processor. Symbols with the value 'm' are suffixed
> with '_MODULE'
> 
> Here is a conflict; CONFIG_FOO=m results in '#define CONFIG_FOO_MODULE 1',
> but CONFIG_FOO_MODULE=y also results in the same define.
> 
> Also, CONFIG options that end with '_MODULE' confuse the Kconfig/fixdep
> interaction; fixdep always assumes CONFIG_FOO_MODULE comes from
> CONFIG_FOO=m, so the dependency is not properly tracked for symbols
> that end with '_MODULE'.
> 
> For these reasons, CONFIG options that end with '_MODULE' should be
> avoided in general. (I am planning on adding a check in Kconfig.)
> 
> This is the only case in the current kernel.
> 
> The new option name was suggested by Péter Ujfalusi. [1]
> 
> [1] https://lore.kernel.org/all/d9e777dc-d274-92ee-4d77-711bfd553611@gmail.com/
> 
> Fixes: 147162f57515 ("ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thank you,

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> ---
> 
>  sound/soc/ti/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
> index 698d7bc84dcf..3260a30d3d54 100644
> --- a/sound/soc/ti/Kconfig
> +++ b/sound/soc/ti/Kconfig
> @@ -211,7 +211,7 @@ config SND_SOC_DM365_VOICE_CODEC
>  	  Say Y if you want to add support for SoC On-chip voice codec
>  endchoice
>  
> -config SND_SOC_DM365_VOICE_CODEC_MODULE
> +config SND_SOC_DM365_SELECT_VOICE_CODECS
>  	def_tristate y
>  	depends on SND_SOC_DM365_VOICE_CODEC && SND_SOC
>  	select MFD_DAVINCI_VOICECODEC
> 

-- 
Péter
