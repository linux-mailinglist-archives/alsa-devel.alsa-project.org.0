Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86951FAB66
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 10:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539D11607;
	Tue, 16 Jun 2020 10:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539D11607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592296718;
	bh=+ji1OCceWF4hCR6jZl7a1RCy9CZwDcqcKnsjrlRI8kw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVqBd/JE66xAjNeKBe/giUWSQOgWvceZE5s1lpNVaSyIKb8weKWWhTbtDFf+773W+
	 3Ay+rPCNT4Ej/6p7TinIfmYnxpkslMke42PYR5IuDH1LHnB14qVEykq7raT2yKxaLM
	 VWQ6eaV5DYQNS1h/7ag+ZvxjuY7VR5lN5p87H2xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5713CF80217;
	Tue, 16 Jun 2020 10:36:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06F91F8022B; Tue, 16 Jun 2020 10:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 214D0F80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 10:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 214D0F80101
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jl75N-0005Fk-C8
 for alsa-devel@alsa-project.org; Tue, 16 Jun 2020 08:36:49 +0000
Received: by mail-pl1-f198.google.com with SMTP id d13so4169094plr.20
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=4luD9Pjs2w7u5TOT9P/1cM0hYy6m6xjsnc/GO2bXHUI=;
 b=Aacg9BNa275EHq2p/Y5jPEg6MeKdF7rdjaLYRXYdNlMLIwh8F96CT7+8t7xPYzAdvW
 NY5LTy57fDnVzwMqz/UD66ppn3CswZ8twxfVcgq8LFlo8GqBF/g96keifTI1zTkXzgEI
 yhU5WSu3OYEHYck9S4BWkaYMdVS/CBvVzLQCyYxQHszM2mcQDwyOA6VCm5gjPdoCM8jO
 ZOZ+rI/2yOAkqNWflAN3DHbj8q4qR+EcZozesgruceQFjyud4WZI/8QcaTnrdD3hpQeY
 zPCjLxZ4ejnUJ7uzcH5BJOyrYNm3zknuMSnQTjNNqQe5XFT6UlS3bbJc6DNs7QTR3Jnp
 pc+g==
X-Gm-Message-State: AOAM531Lbvb1quAsbeH5/hmuD0lcrmpSiOd5/RHepY6fW1g1hBNeRPHh
 YEWbqfHM71/rdET1IaMvtpMf5xQefQXiQD1PrvYL8Lj4j/g53g9s+AVbZrXFllH4SUPGNyGEXzl
 LsMm3BjFRPZ4VsacWtmqSkmQAa8+Z/2XF65wrbb+A
X-Received: by 2002:a17:902:6bcb:: with SMTP id
 m11mr1171728plt.126.1592296606571; 
 Tue, 16 Jun 2020 01:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr46RVkzz2pu7Plw4kJd58Tn68BBk+EPxhGs7rpMn1DvmsWcr5I98wLFFpjURYCM5noKBbYQ==
X-Received: by 2002:a17:902:6bcb:: with SMTP id
 m11mr1171698plt.126.1592296606019; 
 Tue, 16 Jun 2020 01:36:46 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id a12sm15906822pfr.44.2020.06.16.01.36.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 01:36:45 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] ALSA: hda: Make codec controlled LED support more
 generic
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5himfr30cv.wl-tiwai@suse.de>
Date: Tue, 16 Jun 2020 16:36:41 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <B11E093E-6A30-4820-AC0E-C2887F5462F2@canonical.com>
References: <20200616044702.17570-1-kai.heng.feng@canonical.com>
 <s5himfr30cv.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Kailang Yang <kailang@realtek.com>,
 Tomas Espeleta <tomas.espeleta@gmail.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Hui Wang <hui.wang@canonical.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>
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



> On Jun 16, 2020, at 16:01, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Tue, 16 Jun 2020 06:46:58 +0200,
> Kai-Heng Feng wrote:
>>=20
>> Currently, only HDA codec GPIO controlled LED class is supported, and
>> only via platform specific quirk.
>>=20
>> There are systems that control LED via COEF instead of GPIO, and to
>> support those systems, move the LED class registration to
>> snd_hda_gen_add_micmute_led(), so all systems can facilitate the same
>> interface.
>=20
> This will result in creating the led cdev always when the mic-mute LED
> feature is used, not only for HP but also for Dell and Huawei.
> Is this the intended result?

Ok, I can see there are other vendors calling =
snd_hda_gen_fixup_micmute_led() to create LED class.
And no, that's not the intended result.

I guess a chained function can be a better approach.

I'll send another series.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>>=20
>> In addition to that, add LED_CORE_SUSPENDRESUME flag since some =
systems
>> don't restore the LED properly after suspend.
>>=20
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> sound/pci/hda/hda_generic.c   | 28 ++++++++++++++++++++++++++++
>> sound/pci/hda/patch_realtek.c | 30 ------------------------------
>> 2 files changed, 28 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/sound/pci/hda/hda_generic.c =
b/sound/pci/hda/hda_generic.c
>> index f4e9d9445e18..4242407734c0 100644
>> --- a/sound/pci/hda/hda_generic.c
>> +++ b/sound/pci/hda/hda_generic.c
>> @@ -4006,6 +4006,28 @@ static const struct snd_kcontrol_new =
micmute_led_mode_ctl =3D {
>>  *
>>  * Returns 0 if the hook is established or a negative error code.
>>  */
>> +
>> +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
>> +static int micmute_led_set(struct led_classdev *led_cdev,
>> +			   enum led_brightness brightness)
>> +{
>> +	struct hda_codec *codec =3D =
dev_to_hda_codec(led_cdev->dev->parent);
>> +	struct hda_gen_spec *spec =3D codec->spec;
>> +
>> +	spec->micmute_led.led_mode =3D !brightness;
>> +	call_micmute_led_update(codec);
>> +	return 0;
>> +}
>> +
>> +static struct led_classdev micmute_led_cdev =3D {
>> +	.name =3D "hda::micmute",
>> +	.max_brightness =3D 1,
>> +	.brightness_set_blocking =3D micmute_led_set,
>> +	.default_trigger =3D "audio-micmute",
>> +	.flags =3D LED_CORE_SUSPENDRESUME,
>> +};
>> +#endif
>> +
>> int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
>> 				void (*hook)(struct hda_codec *))
>> {
>> @@ -4019,6 +4041,12 @@ int snd_hda_gen_add_micmute_led(struct =
hda_codec *codec,
>> 	spec->cap_sync_hook =3D update_micmute_led;
>> 	if (!snd_hda_gen_add_kctl(spec, NULL, &micmute_led_mode_ctl))
>> 		return -ENOMEM;
>> +
>> +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
>> +	micmute_led_cdev.brightness =3D =
ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +	if (devm_led_classdev_register(&codec->core.dev, =
&micmute_led_cdev))
>> +		codec_warn(codec, "failed to register micmute LED\n");
>> +#endif
>> 	return 0;
>> }
>> EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led);
>> diff --git a/sound/pci/hda/patch_realtek.c =
b/sound/pci/hda/patch_realtek.c
>> index 6d73f8beadb6..cead44a6c6cd 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -4109,26 +4109,6 @@ static void alc_gpio_micmute_update(struct =
hda_codec *codec)
>> 			    spec->gen.micmute_led.led_value);
>> }
>>=20
>> -#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
>> -static int micmute_led_set(struct led_classdev *led_cdev,
>> -			   enum led_brightness brightness)
>> -{
>> -	struct hda_codec *codec =3D =
dev_to_hda_codec(led_cdev->dev->parent);
>> -	struct alc_spec *spec =3D codec->spec;
>> -
>> -	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
>> -			    spec->micmute_led_polarity, !!brightness);
>> -	return 0;
>> -}
>> -
>> -static struct led_classdev micmute_led_cdev =3D {
>> -	.name =3D "hda::micmute",
>> -	.max_brightness =3D 1,
>> -	.brightness_set_blocking =3D micmute_led_set,
>> -	.default_trigger =3D "audio-micmute",
>> -};
>> -#endif
>> -
>> /* setup mute and mic-mute GPIO bits, add hooks appropriately */
>> static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
>> 				  int action,
>> @@ -4136,9 +4116,6 @@ static void alc_fixup_hp_gpio_led(struct =
hda_codec *codec,
>> 				  unsigned int micmute_mask)
>> {
>> 	struct alc_spec *spec =3D codec->spec;
>> -#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
>> -	int err;
>> -#endif
>>=20
>> 	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
>>=20
>> @@ -4151,13 +4128,6 @@ static void alc_fixup_hp_gpio_led(struct =
hda_codec *codec,
>> 	if (micmute_mask) {
>> 		spec->gpio_mic_led_mask =3D micmute_mask;
>> 		snd_hda_gen_add_micmute_led(codec, =
alc_gpio_micmute_update);
>> -
>> -#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
>> -		micmute_led_cdev.brightness =3D =
ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> -		err =3D devm_led_classdev_register(&codec->core.dev, =
&micmute_led_cdev);
>> -		if (err)
>> -			codec_warn(codec, "failed to register micmute =
LED\n");
>> -#endif
>> 	}
>> }
>>=20
>> --=20
>> 2.17.1
>>=20

