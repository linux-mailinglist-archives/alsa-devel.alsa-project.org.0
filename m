Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921E4202B9
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 18:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 039F3168D;
	Sun,  3 Oct 2021 18:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 039F3168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633278823;
	bh=yHPjfgNMsdflwAFDOJJNmWoN1eSNc6ExXmyfFvcHjvo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCXuif02pE7hfthPvf0uvHjgIWSVGAfinXqnRfAY/ziua9AgAGrl5KdlhTzEHlzBy
	 oGlFKA5fmmjmP2HOdMnrsdUDJ91gMZnSqJ/ILSsyhWUEAT9b1PzoTYoLeEUNDctW9x
	 oRNCznSjgS/MZhSX6csdvPFdeATXgnyoTzqqs4Ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BEEF8028B;
	Sun,  3 Oct 2021 18:32:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED4AF8027D; Sun,  3 Oct 2021 18:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 998E7F800ED
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 18:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 998E7F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UUuJ2Evr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633278737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYMaZ3DbDBNVosFAwBUr+Rg45EcCrcRuK3md2pB5I1A=;
 b=UUuJ2EvrQBT0ex3GtZEqQD8QvBYVJwDt1udEurhFn8Xeai0UpL+XzQGAaD/AVuRHGWTkco
 EXOs7PoZJy5hRIw5/qAyHIM/WcBIHI0BSBWWxLEOzsVUjSv6rktsBOFUckuRt4UcVq1Xtb
 2+fpZjZZSfSr8Uu+9Dc6IBjKNEgYV8s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-63ACRAMZPFakwTjpHevO8A-1; Sun, 03 Oct 2021 12:32:16 -0400
X-MC-Unique: 63ACRAMZPFakwTjpHevO8A-1
Received: by mail-ed1-f72.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso14816484edx.2
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 09:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KYMaZ3DbDBNVosFAwBUr+Rg45EcCrcRuK3md2pB5I1A=;
 b=X+J1ukB0boC7RSxkmeNJN/OEqePMchxL9crMd0dnMeV1rn3AGL47dhV+bUkWkt3LAW
 JdbXltdyFd7HvqQsnwvMHMPgRYyRsgOlM6FxHkZeUE0T5nSLwBferyZFXiLkVMNGzERC
 PnXEUNjCB3YwbC0ufv7hn9GiSH1fVp77AnVSDNuUkhv9rr6S4GqM4XQfvphpQBuXCWuz
 EAviETZYHixl2sojeOO2Quhsa8myfN+l7xU7okKarIv06ZSrepwgsJ7+LoPiBGUeL8wE
 NC4J31JQ/1ETUm20J+pH32fCI4FHYEt4PmE5/pUBdoQy2m3VeB6wPUZAjIDBFWpgBy+d
 mBQg==
X-Gm-Message-State: AOAM533FpSkIqKjITzAHuu+bv975cKDhkaB1oK9QRCrZbif4AuQTBi90
 QJ8ZFd41wyqwLfUxkl8kXWjtCUCXT4HAstQX9jZ+hSSuoVYTHn8fHF3wMKpeRHoM6oDxKAtEuBf
 oT6l+twNvAmAtxj7gJIqGxbAQplZOuVYXwZa6/y50XvI1G8b4c3Do6TUbAGscuNARNc5QZ3/46z
 A=
X-Received: by 2002:a05:6402:16d9:: with SMTP id
 r25mr12001696edx.80.1633278735099; 
 Sun, 03 Oct 2021 09:32:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAzmnTe/LRyjxXcLuTbjkudrqNL3E9ZFusxv3N1BPouceoOACbmI7ZE+zonOgWdSWhEApm2g==
X-Received: by 2002:a05:6402:16d9:: with SMTP id
 r25mr12001668edx.80.1633278734822; 
 Sun, 03 Oct 2021 09:32:14 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r6sm552149edd.89.2021.10.03.09.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 09:32:14 -0700 (PDT)
Subject: Re: DAPM PIN switches do not update in alsamixer when changed through
 UCM profile
To: Takashi Iwai <tiwai@suse.de>
References: <b8cf9bb0-bad1-26a0-0806-0a7c66b228d0@redhat.com>
 <s5hv92ego8y.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e0a6491-bc87-0f9a-099f-3baff1fc0e0d@redhat.com>
Date: Sun, 3 Oct 2021 18:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hv92ego8y.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
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

Hi Takashi,

On 10/3/21 4:46 PM, Takashi Iwai wrote:
> On Sun, 03 Oct 2021 15:12:57 +0200,
> Hans de Goede wrote:
>>
>> Hi All,
>>
>> I notice that DAPM PIN switches, such as e.g. the "Headphone"
>> SOC_DAPM_PIN_SWITCH defined in:
>> sound/soc/intel/boards/cht_bsw_nau8824.c:
>>
>> static const struct snd_kcontrol_new cht_mc_controls[] = {
>>         SOC_DAPM_PIN_SWITCH("Headphone"),
>>         SOC_DAPM_PIN_SWITCH("Headset Mic"),
>>         SOC_DAPM_PIN_SWITCH("Int Mic"),
>>         SOC_DAPM_PIN_SWITCH("Ext Spk"),
>> };
>>
>> Do not get updated to reflect state-changes when the output
>> is switched between e.g. Headphone / "Ext Spk" by
>> pulseaudio/pipewire through the UCM profile mechanism.
>>
>> If I exit alsa-mixer after changing the output and
>> start it again then the control does show the expect
>> value. So it seems that we are failing to send a change
>> event about this somewhere?
> 
> Does the patch below work?

Thank you for the quick response.

This works for the "Speaker" DAPM PIN switch on a rt5640
board:


static const struct snd_kcontrol_new byt_rt5640_controls[] = {
        SOC_DAPM_PIN_SWITCH("Headphone"),
        SOC_DAPM_PIN_SWITCH("Headset Mic"),
        SOC_DAPM_PIN_SWITCH("Headset Mic 2"),
        SOC_DAPM_PIN_SWITCH("Internal Mic"),
        SOC_DAPM_PIN_SWITCH("Speaker"),
        SOC_DAPM_PIN_SWITCH("Line Out"),
};

But it does not work for the "Headphone" and "Line Out" switches,
these are actually hooked up to jack-detect, so I guess that the
jack-detection is already flipping them and then when the UCM
profile changes them it is a no-op causing the UCM setting of
the control to not cause an event because it is not a change.

Relevant jack-detect bits from sound/soc/intel/boards/bytcr_rt5640.c:


static struct snd_soc_jack_pin rt5640_pins[] = {
        {
                .pin    = "Headphone",
                .mask   = SND_JACK_HEADPHONE,
        },
        {
                .pin    = "Headset Mic",
                .mask   = SND_JACK_MICROPHONE,
        },
};

static struct snd_soc_jack_pin rt5640_pins2[] = {
        {
                /* The 2nd headset jack uses lineout with an external HP-amp */
                .pin    = "Line Out",
                .mask   = SND_JACK_HEADPHONE,
        },
        {
                .pin    = "Headset Mic 2",
                .mask   = SND_JACK_MICROPHONE,
        },
};


                ret = snd_soc_card_jack_new(card, "Headset",
                                            SND_JACK_HEADSET | SND_JACK_BTN_0,
                                            &priv->jack, rt5640_pins,
                                            ARRAY_SIZE(rt5640_pins));

                ret = snd_soc_card_jack_new(card, "Headset 2",
                                            SND_JACK_HEADSET,
                                            &priv->jack2, rt5640_pins2,
                                            ARRAY_SIZE(rt5640_pins2));

I tried both jacks a HP Elitepad 1000G2 with dock (one on the tablet
and one on the dock).

With your patch the SOC_DAPM_PIN_SWITCH("Speaker") control correctly
updates (which it did not do before). But the "Line Out" (used for
the second headset jack) and the "Headphone" controls do not update.

(exiting alsa-mixer and starting it again does show the "Line Out"
and "Headphone" controls have changed.

Regards,

Hans



> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2561,6 +2561,7 @@ static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
>  				const char *pin, int status)
>  {
>  	struct snd_soc_dapm_widget *w = dapm_find_widget(dapm, pin, true);
> +	int ret = 0;
>  
>  	dapm_assert_locked(dapm);
>  
> @@ -2573,13 +2574,14 @@ static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
>  		dapm_mark_dirty(w, "pin configuration");
>  		dapm_widget_invalidate_input_paths(w);
>  		dapm_widget_invalidate_output_paths(w);
> +		ret = 1;
>  	}
>  
>  	w->connected = status;
>  	if (status == 0)
>  		w->force = 0;
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> @@ -3583,14 +3585,15 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
>  {
>  	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
>  	const char *pin = (const char *)kcontrol->private_value;
> +	int ret;
>  
>  	if (ucontrol->value.integer.value[0])
> -		snd_soc_dapm_enable_pin(&card->dapm, pin);
> +		ret = snd_soc_dapm_enable_pin(&card->dapm, pin);
>  	else
> -		snd_soc_dapm_disable_pin(&card->dapm, pin);
> +		ret = snd_soc_dapm_disable_pin(&card->dapm, pin);
>  
>  	snd_soc_dapm_sync(&card->dapm);
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_dapm_put_pin_switch);
>  
> @@ -4023,7 +4026,7 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
>  
>  	rtd->params_select = ucontrol->value.enumerated.item[0];
>  
> -	return 0;
> +	return 1;
>  }
>  
>  static void
> 

