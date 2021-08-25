Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBFA3F74B1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 14:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 574351678;
	Wed, 25 Aug 2021 14:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 574351678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629892850;
	bh=fHxj9vn9A7HYMysygAdNL9lyIa2Wxc3BwC6sN107Ubw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8ky2gwKmgoSvQQyHn2Q0xe1Os4Eud0ZOgd0AK/VpbcsWmLwidqqq7rUwdXvS77jH
	 4y6FDX8tXwMRBc3ti5ygF11+wZ+8+c7ezcrSFgskcVK3+cCuf6bQuv0ZrRo1b4ylox
	 eVoEVT59gElGs+MKCyrSUNHvcB+FdihVaNl+6dkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C538F8020D;
	Wed, 25 Aug 2021 13:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96B65F8020C; Wed, 25 Aug 2021 13:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C3DF8003C
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 13:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C3DF8003C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B991xy72"
Received: by mail-lf1-x132.google.com with SMTP id x27so52397976lfu.5
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sh8Hhajj0pnPnQiiu2aiUUMwiCEAyqctL4Ajg0R6YEk=;
 b=B991xy72YQIKeK0YL5CfnvOiwxExWCwzKOYLrnvKItU/etqhJMEKUz7vP9FXPGV+tN
 R835TLWh68zmwjW6AD/WIdDH9ucNKaeetxUlQEB1f1faIk6+LeE/obwFpDi27ryBN/5s
 oK41Udd/lIgQD3ZgHCMv7tDY0u1AiGAujDl1gJotGb4wI4NiGhjuQJlb6tHaIqHLSgxu
 n7dwouk7paFuajiTYIjBAHmWSGj+asfv7tTZN5hjDR29CmqHfTJePRDiXsKGO7yfsWpv
 FH/lspZH+agBQkPTOaZeuwaCVkBz7OTVMklUjSm+glte/NAt0uO12lWT+CPt+Qv9+Lut
 zsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sh8Hhajj0pnPnQiiu2aiUUMwiCEAyqctL4Ajg0R6YEk=;
 b=UKIUlphZGLjudrpMzmYWGwWy8k81uMhkrMi2AQ0MJpehZ9ZtWJP9+EYKD5GNasA8Ca
 7n2E36A01OMnbN7rGIvL+Tgb1+SBloLx25cjjxSgHL1pE3UtVC/GrPCcGO7WDVtCV4ro
 5lZOkNW2xCx6dDftbjWPqPY64MSItJp0gk2XWPOBM2NXxGPttmiIuQuRG/0CNp1mw2TL
 jNqshuZMVyYv8V12BXsmznFHn/3UaqzRnaSDpOHoXHbOulF9EsIfekytCOZM1UJAfXAX
 xyNtPSF+4M7BT4gTso5dUSF/bqrhoGLr41v1bIxYAYaxh2BFZQ5FuZQ01n36CzGrk07k
 g2yg==
X-Gm-Message-State: AOAM532STrgWLehkMzsRaisVTKbol75uOS1hhTVtlhJnbC2VnRtT7A8p
 TRfLPp9uhFi2YS0QhCwxqj4=
X-Google-Smtp-Source: ABdhPJxKumqkjQ/ZfaCK/Nc1KFD2ooxUYCqnUe8SWu8yZCKpTaP98/h7PeQqDZDQpVbBRdfWVKdV/A==
X-Received: by 2002:a19:c350:: with SMTP id t77mr1506784lff.33.1629892766712; 
 Wed, 25 Aug 2021 04:59:26 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id k23sm2104796ljg.73.2021.08.25.04.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 04:59:26 -0700 (PDT)
Subject: Re: [PATCH] kconfig: forbid symbols that end with '_MODULE'
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 arnd@arndb.de
References: <20210825041637.365171-1-masahiroy@kernel.org>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <9df591f6-53fc-4567-8758-0eb1be4eade5@gmail.com>
Date: Wed, 25 Aug 2021 14:59:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825041637.365171-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-wireless@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Luca Coelho <luciano.coelho@intel.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>
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

Hi,

On 25/08/2021 07:16, Masahiro Yamada wrote:
> Kconfig (syncconfig) generates include/generated/autoconf.h to make
> CONFIG options available to the pre-processor.
> 
> The macros are suffixed with '_MODULE' for symbols with the value 'm'.
> 
> Here is a conflict; CONFIG_FOO=m results in '#define CONFIG_FOO_MODULE 1',
> but CONFIG_FOO_MODULE=y also results in the same define.
> 
> fixdep always assumes CONFIG_FOO_MODULE comes from CONFIG_FOO=m, so the
> dependency is not properly tracked for symbols that end with '_MODULE'.
> 
> This commit makes Kconfig error out if it finds a symbol suffixed with
> '_MODULE'. This restriction does not exist if the module feature is not
> supported (at least from the Kconfig perspective).
> 
> It detected one error:
>   error: SND_SOC_DM365_VOICE_CODEC_MODULE: symbol name must not end with '_MODULE'
> 
> Rename it to SND_SOC_DM365_VOICE_CODEC_MODULAR. Commit 147162f57515
> ("ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies") added it for
> internal use. So, this renaming has no impact on users.
> 
> Remove a comment from drivers/net/wireless/intel/iwlwifi/Kconfig since
> this is a hard error now.
> 
> Add a comment to include/linux/kconfig.h in order not to worry observant
> developers.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/net/wireless/intel/iwlwifi/Kconfig |  1 -
>  include/linux/kconfig.h                    |  3 ++
>  scripts/kconfig/parser.y                   | 40 +++++++++++++++++++++-
>  sound/soc/ti/Kconfig                       |  2 +-
>  4 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/wireless/intel/iwlwifi/Kconfig
> index 1085afbefba8..5b238243617c 100644
> --- a/drivers/net/wireless/intel/iwlwifi/Kconfig
> +++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
> @@ -70,7 +70,6 @@ config IWLMVM
>  	  of the devices that use this firmware is available here:
>  	  https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi#firmware
>  
> -# don't call it _MODULE -- will confuse Kconfig/fixdep/...
>  config IWLWIFI_OPMODE_MODULAR
>  	bool
>  	default y if IWLDVM=m
> diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
> index 20d1079e92b4..54f677e742fe 100644
> --- a/include/linux/kconfig.h
> +++ b/include/linux/kconfig.h
> @@ -53,6 +53,9 @@
>   * IS_MODULE(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'm', 0
>   * otherwise.  CONFIG_FOO=m results in "#define CONFIG_FOO_MODULE 1" in
>   * autoconf.h.
> + * CONFIG_FOO_MODULE=y would also result in "#define CONFIG_FOO_MODULE 1",
> + * but Kconfig forbids symbol names that end with '_MODULE', so that would
> + * not happen.
>   */
>  #define IS_MODULE(option) __is_defined(option##_MODULE)
>  
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index 2af7ce4e1531..b0f73f74ccd3 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -475,6 +475,37 @@ assign_val:
>  
>  %%
>  
> +/*
> + * Symbols suffixed with '_MODULE' would cause a macro conflict in autoconf.h,
> + * and also confuse the interaction between syncconfig and fixdep.
> + * Error out if a symbol with the '_MODULE' suffix is found.
> + */
> +static int sym_check_name(struct symbol *sym)
> +{
> +	static const char *suffix = "_MODULE";
> +	static const size_t suffix_len = strlen("_MODULE");
> +	char *name;
> +	size_t len;
> +
> +	name = sym->name;
> +
> +	if (!name)
> +		return 0;
> +
> +	len = strlen(name);
> +
> +	if (len < suffix_len)
> +		return 0;
> +
> +	if (strcmp(name + len - suffix_len, suffix))
> +		return 0;
> +
> +	fprintf(stderr, "error: %s: symbol name must not end with '%s'\n",
> +		name, suffix);
> +
> +	return -1;
> +}
> +
>  void conf_parse(const char *name)
>  {
>  	struct symbol *sym;
> @@ -493,8 +524,15 @@ void conf_parse(const char *name)
>  
>  	if (yynerrs)
>  		exit(1);
> -	if (!modules_sym)
> +
> +	if (modules_sym) {
> +		for_all_symbols(i, sym) {
> +			if (sym_check_name(sym))
> +				yynerrs++;
> +		}
> +	} else {
>  		modules_sym = sym_find( "n" );
> +	}
>  
>  	if (!menu_has_prompt(&rootmenu)) {
>  		current_entry = &rootmenu;
> diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
> index 698d7bc84dcf..c56a5789056f 100644
> --- a/sound/soc/ti/Kconfig
> +++ b/sound/soc/ti/Kconfig
> @@ -211,7 +211,7 @@ config SND_SOC_DM365_VOICE_CODEC
>  	  Say Y if you want to add support for SoC On-chip voice codec
>  endchoice
>  
> -config SND_SOC_DM365_VOICE_CODEC_MODULE
> +config SND_SOC_DM365_VOICE_CODEC_MODULAR

This Kconfig option is only used to select the codecs needed for the
voice mode, I think it would be better to use something like

SND_SOC_DM365_SELECT_VOICE_CODECS ?

>  	def_tristate y
>  	depends on SND_SOC_DM365_VOICE_CODEC && SND_SOC
>  	select MFD_DAVINCI_VOICECODEC
> 

-- 
Péter
