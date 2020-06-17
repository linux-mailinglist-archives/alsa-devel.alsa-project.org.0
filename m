Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618611FD0E1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 17:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62FF1676;
	Wed, 17 Jun 2020 17:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62FF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592407588;
	bh=iQ2FqG0YS/24aUBAuxw3yNfDbeptcW4pvEPIthuyF70=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7YnPDb9OWj+ACLyVp6VM6LziiZeGtik4azae/ZS/oq/KzaWLdrUYoEeuO6KBbnP7
	 SJowj+uyRNu/KkhjfhN2z6bs89RAizHqiv/KpkH3UjrKLwR9ttEMnx9IQinyraeFvC
	 1tfPsn6/9d/3RPyGNC5wqkL4vtMk/umTHZniOwAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDFC2F800EF;
	Wed, 17 Jun 2020 17:24:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A87F80162; Wed, 17 Jun 2020 17:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14C71F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 17:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14C71F800EF
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jlZvZ-0001Yq-6q
 for alsa-devel@alsa-project.org; Wed, 17 Jun 2020 15:24:37 +0000
Received: by mail-pf1-f197.google.com with SMTP id p18so2000596pfq.14
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 08:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=683Q9JCe9F/UMYLnm+lPw6gboNB4i1YDCLWv7+DNnwo=;
 b=oXSc4+9BfzUL9DLcz8wsPW2xvhJ7Obxc5IPrKy0zfoQXAo0KnkLd1D7Y3K2xq6OQh+
 tUAlLR2xWwXlvYlDD8qSG2s7zEzLYkU6LurTVQ06TRpO0dgsQJmME5MdY4VZocEN8hiq
 HWS4k0mC4nfrfd3SB7Yyjf1Iz37q8VnAtXpL0Kpd+4MXUu4ACGLwEkTBdgJcNjsDqjdU
 SGpd/BGLYDPL3IGcEuxX8osV+jR8sUT3sWAtYo/KPjljaVBHp/R7PDm5wfMOzkdMpUpC
 ybfKNVICKbmjdSCdTKPQt6r5S/HjXIvEjKepQogiTj/QG+ytZKbBCXSvH/pugb40Cykk
 PLFA==
X-Gm-Message-State: AOAM530Dk1f6xpMq+zMPdGuKvnBicigS1HpFXjKQCLKP1EZv6PHGy+Do
 mJs3D8VETGRgxdN36Vx0QL+9IqelodGneRvDWMIGQZWei/YoBb9zTYTSxgxSRQaQMQJn3DfHLAk
 ZtzzRp9hbOVLDTKDs65KhoXQnH1jvQqFUrB7m2aZK
X-Received: by 2002:a62:18d3:: with SMTP id 202mr7139462pfy.180.1592407475743; 
 Wed, 17 Jun 2020 08:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeqn+JCnh0gio1iUG8+0i1DDlnENVKupwKJxgzTMv91B6Efx8p6AdEfQch5sNAOMSOcliaBg==
X-Received: by 2002:a62:18d3:: with SMTP id 202mr7139416pfy.180.1592407475178; 
 Wed, 17 Jun 2020 08:24:35 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id l3sm203953pgm.59.2020.06.17.08.24.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 08:24:34 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 1/2] ALSA: hda/realtek: Add COEF controlled micmute LED
 support
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hd05xzz3d.wl-tiwai@suse.de>
Date: Wed, 17 Jun 2020 23:24:30 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <934401DE-7A4E-4B2C-8B06-E2AA203A9336@canonical.com>
References: <20200617102906.16156-1-kai.heng.feng@canonical.com>
 <s5hd05xzz3d.wl-tiwai@suse.de>
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



> On Jun 17, 2020, at 19:55, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Wed, 17 Jun 2020 12:29:01 +0200,
> Kai-Heng Feng wrote:
>>=20
>> Currently, HDA codec LED class can only be used by GPIO controlled =
LED.
>> However, there are some new systems that control LED via COEF instead =
of
>> GPIO.
>>=20
>> In order to support those systems, create a new helper that can be
>> facilitated by both COEF controlled and GPIO controlled LED.
>>=20
>> In addition to that, add LED_CORE_SUSPENDRESUME flag since some =
systems
>> don't restore the LED properly after suspend.
>>=20
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>=20
> Thanks for the quick follow up, the issues I pointed were fixed.
>=20
> But, now looking at the code change again, I'm no longer sure whether
> it's the right move.
>=20
> Basically, the led cdev should serve only for turning on/off the LED
> as given.  But your patch changes it to call the generic mixer
> updater, which is rather the one who would call the led cdev state
> update itself.  That is, it's other way round.
>=20
> IMO, what we need is to make all places calling
> snd_hda_gen_add_micmute_led() to create led cdev, and change those
> calls with snd_hda_gen_fixup_micmute_led().

Ok, so it's the same as patch v1.
How should we handle vendors other than HP?
Only create led cdev if the ID matches to HP?

>=20
> It'll be a bit more changes and likely not fitting with 5.8, but the
> whole result will be more consistent.

A bit off topic, but do you think it's reasonable to also create led =
cdev for mute LED, in addition to micmute LED?
I just found that the LEDs are still on during system suspend, and led =
cdev has the ability to turn off the LEDs on system suspend.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>=20
>> ---
>> v3:
>> - Wording.
>> - Properly prefix exported symbol.
>> v2:
>> - Prevent platforms like Dell, Lenovoe and Huawei create double LED
>>   class devices.
>> sound/pci/hda/hda_generic.c   |  7 ++++---
>> sound/pci/hda/hda_generic.h   |  1 +
>> sound/pci/hda/patch_realtek.c | 29 ++++++++++++++++-------------
>> 3 files changed, 21 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/sound/pci/hda/hda_generic.c =
b/sound/pci/hda/hda_generic.c
>> index f4e9d9445e18..e4f534e9a88c 100644
>> --- a/sound/pci/hda/hda_generic.c
>> +++ b/sound/pci/hda/hda_generic.c
>> @@ -3897,7 +3897,7 @@ enum {
>> 	MICMUTE_LED_FOLLOW_MUTE,
>> };
>>=20
>> -static void call_micmute_led_update(struct hda_codec *codec)
>> +void snd_hda_gen_call_micmute_led_update(struct hda_codec *codec)
>> {
>> 	struct hda_gen_spec *spec =3D codec->spec;
>> 	unsigned int val;
>> @@ -3924,6 +3924,7 @@ static void call_micmute_led_update(struct =
hda_codec *codec)
>> 	if (spec->micmute_led.update)
>> 		spec->micmute_led.update(codec);
>> }
>> +EXPORT_SYMBOL_GPL(snd_hda_gen_call_micmute_led_update);
>>=20
>> static void update_micmute_led(struct hda_codec *codec,
>> 			       struct snd_kcontrol *kcontrol,
>> @@ -3945,7 +3946,7 @@ static void update_micmute_led(struct hda_codec =
*codec,
>> 			spec->micmute_led.capture |=3D mask;
>> 		else
>> 			spec->micmute_led.capture &=3D ~mask;
>> -		call_micmute_led_update(codec);
>> +		snd_hda_gen_call_micmute_led_update(codec);
>> 	}
>> }
>>=20
>> @@ -3982,7 +3983,7 @@ static int micmute_led_mode_put(struct =
snd_kcontrol *kcontrol,
>> 	if (mode =3D=3D spec->micmute_led.led_mode)
>> 		return 0;
>> 	spec->micmute_led.led_mode =3D mode;
>> -	call_micmute_led_update(codec);
>> +	snd_hda_gen_call_micmute_led_update(codec);
>> 	return 1;
>> }
>>=20
>> diff --git a/sound/pci/hda/hda_generic.h =
b/sound/pci/hda/hda_generic.h
>> index fb9f1a90238b..062be242339a 100644
>> --- a/sound/pci/hda/hda_generic.h
>> +++ b/sound/pci/hda/hda_generic.h
>> @@ -353,6 +353,7 @@ unsigned int snd_hda_gen_path_power_filter(struct =
hda_codec *codec,
>> void snd_hda_gen_stream_pm(struct hda_codec *codec, hda_nid_t nid, =
bool on);
>> int snd_hda_gen_fix_pin_power(struct hda_codec *codec, hda_nid_t =
pin);
>>=20
>> +void snd_hda_gen_call_micmute_led_update(struct hda_codec *codec);
>> int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
>> 				void (*hook)(struct hda_codec *));
>> void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
>> diff --git a/sound/pci/hda/patch_realtek.c =
b/sound/pci/hda/patch_realtek.c
>> index 6d73f8beadb6..0587d1e96b19 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -4114,10 +4114,10 @@ static int micmute_led_set(struct =
led_classdev *led_cdev,
>> 			   enum led_brightness brightness)
>> {
>> 	struct hda_codec *codec =3D =
dev_to_hda_codec(led_cdev->dev->parent);
>> -	struct alc_spec *spec =3D codec->spec;
>> +	struct hda_gen_spec *spec =3D codec->spec;
>>=20
>> -	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
>> -			    spec->micmute_led_polarity, !!brightness);
>> +	spec->micmute_led.led_mode =3D !brightness;
>> +	snd_hda_gen_call_micmute_led_update(codec);
>> 	return 0;
>> }
>>=20
>> @@ -4126,7 +4126,17 @@ static struct led_classdev micmute_led_cdev =3D =
{
>> 	.max_brightness =3D 1,
>> 	.brightness_set_blocking =3D micmute_led_set,
>> 	.default_trigger =3D "audio-micmute",
>> +	.flags =3D LED_CORE_SUSPENDRESUME,
>> };
>> +
>> +static void alc_register_micmute_led(struct hda_codec *codec)
>> +{
>> +		micmute_led_cdev.brightness =3D =
ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +		if (devm_led_classdev_register(&codec->core.dev, =
&micmute_led_cdev))
>> +			codec_warn(codec, "failed to register micmute =
LED\n");
>> +}
>> +#else
>> +static inline void alc_register_micmute_led(struct hda_codec *codec) =
{}
>> #endif
>>=20
>> /* setup mute and mic-mute GPIO bits, add hooks appropriately */
>> @@ -4136,9 +4146,6 @@ static void alc_fixup_hp_gpio_led(struct =
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
>> @@ -4151,13 +4158,7 @@ static void alc_fixup_hp_gpio_led(struct =
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
>> +		alc_register_micmute_led(codec);
>> 	}
>> }
>>=20
>> @@ -4305,6 +4306,7 @@ static void =
alc285_fixup_hp_coef_micmute_led(struct hda_codec *codec,
>> 		spec->mic_led_coefbit_on =3D 1<<13;
>> 		spec->mic_led_coefbit_off =3D 0;
>> 		snd_hda_gen_add_micmute_led(codec, =
alc_hp_cap_micmute_update);
>> +		alc_register_micmute_led(codec);
>> 	}
>> }
>>=20
>> @@ -4319,6 +4321,7 @@ static void =
alc236_fixup_hp_coef_micmute_led(struct hda_codec *codec,
>> 		spec->mic_led_coefbit_on =3D 2<<2;
>> 		spec->mic_led_coefbit_off =3D 1<<2;
>> 		snd_hda_gen_add_micmute_led(codec, =
alc_hp_cap_micmute_update);
>> +		alc_register_micmute_led(codec);
>> 	}
>> }
>>=20
>> --=20
>> 2.17.1
>>=20

