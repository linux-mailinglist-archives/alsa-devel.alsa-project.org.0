Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8C84F30A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 11:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B653A82A;
	Fri,  9 Feb 2024 11:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B653A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707473718;
	bh=/KABvIj3e9rj16qAEooLsTOrj900LTNl306j3UBUFeA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ABNK/P5vW3F4NUsgmINXbaalnKWyGauH+OLhVvLR5WtAnZjV/30sXXCSuOzxZfVt9
	 +IXvBP/6Rr7B+vK9duRULwDrZc9ZHiIKIfReKynxEC4vVLF61onHIO1cqx/SDi2Seo
	 YlJWu6yd9e0B6rQ88Jki+hYh9nO3PTijQ32TQ2ro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7B7F805AC; Fri,  9 Feb 2024 11:14:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6D1F80567;
	Fri,  9 Feb 2024 11:14:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 771A0F801EB; Fri,  9 Feb 2024 11:14:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5530F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 11:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5530F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=BC96Ppnk;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=BC96Ppnk
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 7ED40CD43;
	Fri,  9 Feb 2024 11:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707473657; bh=/KABvIj3e9rj16qAEooLsTOrj900LTNl306j3UBUFeA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BC96PpnkHKMuX1RSrhNbYoLvu1+ErUy0yfqgvmpCqfsNOeGmHG+4qWbSZHlXqfch4
	 74qwrcUml0HPhjg8FvJLB8b7JBBH2YNytjIV3YbSVqM9jpJE61IEPIp2oqBye/DxoH
	 X233kSqqM7BpL+nJsqynYn6H8P/BQ45leoBzAHUI=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOYdeZXz5WBp; Fri,  9 Feb 2024 11:14:17 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id E609DDCB2;
	Fri,  9 Feb 2024 11:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707473657; bh=/KABvIj3e9rj16qAEooLsTOrj900LTNl306j3UBUFeA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BC96PpnkHKMuX1RSrhNbYoLvu1+ErUy0yfqgvmpCqfsNOeGmHG+4qWbSZHlXqfch4
	 74qwrcUml0HPhjg8FvJLB8b7JBBH2YNytjIV3YbSVqM9jpJE61IEPIp2oqBye/DxoH
	 X233kSqqM7BpL+nJsqynYn6H8P/BQ45leoBzAHUI=
Message-ID: <026acf72-8c74-9fb0-ffca-35c259fa2add@ivitera.com>
Date: Fri, 9 Feb 2024 11:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug
 plugin?
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
 <14018498-75e9-28c4-cfe3-a958ede64d0e@ivitera.com>
 <79934c5e-25b2-4d71-a426-c05f9a4e6b40@perex.cz>
 <3a16fc87-6b65-048a-b9cd-1fb0f308e4fb@ivitera.com>
 <8567ca1f-9985-4370-b821-9fa70cd812e6@perex.cz>
 <1a852449-cd3e-acc0-57ec-f6163e82c620@ivitera.com>
 <5b4afa93-5ab9-2ff1-c440-d05c66a4cef5@ivitera.com>
 <25d7fac4-a7c6-4bbd-ef8a-7eefbcf03784@ivitera.com>
 <e63029c7-caed-c6ce-2395-e34eb9f5082c@ivitera.com>
 <a250b821-1876-4936-8082-d40475e60155@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <a250b821-1876-4936-8082-d40475e60155@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YGM5S2WKUBZSKRHXUYQS3VZ3TTJ6YE7T
X-Message-ID-Hash: YGM5S2WKUBZSKRHXUYQS3VZ3TTJ6YE7T
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGM5S2WKUBZSKRHXUYQS3VZ3TTJ6YE7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08. 02. 24 15:40, Jaroslav Kysela wrote:
> On 07. 02. 24 16:34, Pavel Hofman wrote:
> 
>> But honestly I still do not understand what it actually does and what is
>> the goal of snd_pcm_plug_slave_format().
>>
>> Without that I cannot modify snd_pcm_plug_slave_format() correctly to
>> incorporate support for IEC958.
> 
> I believe you're looking to a wrong place. Here's incomplete code:
> 
> ==========
> diff --git a/configure.ac b/configure.ac
> index 7a152a4a..3f238302 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -642,6 +642,9 @@ fi
>   if test "$build_pcm_alaw" = "yes"; then
>     AC_DEFINE([BUILD_PCM_PLUGIN_ALAW], "1", [Build PCM alaw plugin])
>   fi
> +if test "$build_pcm_iec958" = "yes"; then
> +  AC_DEFINE([BUILD_PCM_PLUGIN_IEC958], "1", [Build PCM iec958 plugin])
> +fi
>   if test "$build_pcm_mmap_emul" = "yes"; then
>     AC_DEFINE([BUILD_PCM_PLUGIN_MMAP_EMUL], "1", [Build PCM mmap-emul 
> plugin])
>   fi
> diff --git a/include/pcm_plugin.h b/include/pcm_plugin.h
> index 2d014394..f3e8f3b5 100644
> --- a/include/pcm_plugin.h
> +++ b/include/pcm_plugin.h
> @@ -133,6 +133,19 @@ int _snd_pcm_adpcm_open(snd_pcm_t **pcmp, const 
> char *name,
>               snd_config_t *root, snd_config_t *conf,
>               snd_pcm_stream_t stream, int mode);
> 
> +/*
> + *  IEC958 subframe conversion plugin
> + */
> +int snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
> +            snd_pcm_format_t sformat, snd_pcm_t *slave,
> +            int close_slave,
> +            const unsigned char *status_bits,
> +            const unsigned char *preamble_vals,
> +            int hdmi_mode);
> +int _snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
> +             snd_config_t *root, snd_config_t *conf,
> +             snd_pcm_stream_t stream, int mode);
> +
>   /*
>    *  Route plugin for linear formats
>    */
> diff --git a/src/pcm/pcm_plug.c b/src/pcm/pcm_plug.c
> index e5a3a189..287fb9f9 100644
> --- a/src/pcm/pcm_plug.c
> +++ b/src/pcm/pcm_plug.c
> @@ -186,7 +186,8 @@ static const snd_pcm_format_t 
> linear_preferred_formats[] = {
> 
>   #if defined(BUILD_PCM_PLUGIN_MULAW) || \
>       defined(BUILD_PCM_PLUGIN_ALAW) || \
> -    defined(BUILD_PCM_PLUGIN_ADPCM)
> +    defined(BUILD_PCM_PLUGIN_ADPCM) || \
> +    defined(BUILD_PCM_PLUGIN_IEC958)
>   #define BUILD_PCM_NONLINEAR
>   #endif
> 
> @@ -201,6 +202,10 @@ static const snd_pcm_format_t 
> nonlinear_preferred_formats[] = {
>   #ifdef BUILD_PCM_PLUGIN_ADPCM
>       SND_PCM_FORMAT_IMA_ADPCM,
>   #endif
> +#ifdef BUILD_PCM_PLUGIN_IEC958
> +    SND_PCM_FORMAT_IEC958_SUBFRAME_LE,
> +    SND_PCM_FORMAT_IEC958_SUBFRAME_BE,
> +#endif
>   };
>   #endif
> 
> @@ -490,6 +495,18 @@ static int snd_pcm_plug_change_channels(snd_pcm_t 
> *pcm, snd_pcm_t **new, snd_pcm
>   }
>   #endif
> 
> +#ifdef BUILD_PCM_PLUGIN_IEC958
> +static int iec958_open(snd_pcm_t **pcmp, const char *name,
> +               snd_pcm_format_t sformat, snd_pcm_t *slave,
> +               int close_slave)
> +{
> +    unsigned char preamble_vals[3] = {
> +          0x08, 0x02, 0x04 /* Z, X, Y */
> +        };
> +    return snd_pcm_iec958_open(pcmp, name, sformat, slave, close_slave, 
> NULL, preamble_vals, 0);
> +}
> +#endif
> +
>   static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new, 
> snd_pcm_plug_params_t *clt, snd_pcm_plug_params_t *slv)
>   {
>       snd_pcm_plug_t *plug = pcm->private_data;
> @@ -526,6 +543,12 @@ static int snd_pcm_plug_change_format(snd_pcm_t 
> *pcm, snd_pcm_t **new, snd_pcm_p
>           case SND_PCM_FORMAT_IMA_ADPCM:
>               f = snd_pcm_adpcm_open;
>               break;
> +#endif
> +#ifdef BUILD_PCM_PLUGIN_IEC958
> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
> +            f = iec958_open;
> +            break;
>   #endif
>           default:
>   #ifdef BUILD_PCM_PLUGIN_LFLOAT
> @@ -566,6 +589,12 @@ static int snd_pcm_plug_change_format(snd_pcm_t 
> *pcm, snd_pcm_t **new, snd_pcm_p
>           case SND_PCM_FORMAT_IMA_ADPCM:
>               f = snd_pcm_adpcm_open;
>               break;
> +#endif
> +#ifdef BUILD_PCM_PLUGIN_IEC958
> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
> +            f = iec958_open;
> +            break;
>   #endif
>           default:
>               return -EINVAL;
> =========
> 

Jaroslav, thanks a lot! I did not know it required just extending the 
nonlinear_preferred_formats, no further changes to the checks.

Tested on RPi4 HDMI, working fine. Please will you submit the patch, or 
should I prepare it based on your code?
