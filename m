Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B9816BCD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 12:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48245E74;
	Mon, 18 Dec 2023 12:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48245E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702897440;
	bh=viWEwi6O1oAicZQT2nCnB3m9LAHL/ty/LHUJhNUEt7Y=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d6P0m9iV9AX5DJ2DzOWJt+xkZd8CiZtcA03WRn4pK7ldBuDMpbZZSwXyql/JL9gEZ
	 BXyvNBRzKwK0VGBBiu0SvIsewVXQCFv4NPUMAIUerTJLlJSYRACH5UYOtg5VJ3uBGz
	 38AiveMm0xGB3c180+EDTFCb7tVi4DsXaT3RPjN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D670F80580; Mon, 18 Dec 2023 12:03:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62755F8057A;
	Mon, 18 Dec 2023 12:03:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 022F8F80425; Mon, 18 Dec 2023 12:03:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78E1CF800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 12:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E1CF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JgSciLQt
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c19f5f822so14763395e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Dec 2023 03:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702897388;
 x=1703502188; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drw+eEw0bKG1NerarLyZz6szuI6XjIyA1Y5nawkeBVk=;
        b=JgSciLQtZojI7/QRj+EFq/5d5OfSo0yjIq7YP5CKYp45rg5gqM5elYNYmzDaIiJlNT
         ibpNwiDqLgV5o65xg6Z+HUU7+/btIAW9VoF9L/SvM9E/4p/bcTEAvHrf1lzcYZTdQV8G
         nlt5yNFQOWJdhtyqvMlE8n8WKTIGUoj5SyrnqSksN9/I8dBRorKxzHLn789BkSnI/nAa
         knJd8kl3wpmtaA4K52cvZPrgj+0PRvUsUxBhfA5ds7c3MTibo2/82TSBA+wRzkHLbriD
         DTgXegfE7545CkokwKnq0QIoyt3dDfz11d3TVxnso30gb8GM3uoAuG7Y4cG0UcTqWqMD
         xYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897388; x=1703502188;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Drw+eEw0bKG1NerarLyZz6szuI6XjIyA1Y5nawkeBVk=;
        b=XFcgqmG0YMDYAaSE9HhEWH9nESTyY4PqDGi9nnlrTVwuR0hg1kQPmPDU1+ATAyzMpI
         7B7XwhTiS4v+EJhviYLDh7/54zoHVZ7nHc86XLU63y2HDBrpbeJz9m6vX46h6xU5Tc9L
         wdjRFJeGXjqu56ehmKNkiETbij0vMwYZuytdD5SD32nK3a90p8XWLsBn/5WZGuu5N1Y1
         gs+hEFutcwOzwo2VKJQElfuO6FBMBOrc94NrmAvr6nyBIrzpF0RehtV2iDtmxj0OCBBr
         TlWCZWdbxMpopJ+Itq+sSncxmLksh2IDJkkN9gzZAukvnxkrelTBVftKuWTA4qLb2zBj
         WmlQ==
X-Gm-Message-State: AOJu0YwoLnpMhCq4oWalgexEP4r+Fj3JnZ+vK5HGGR0326XLqyqjo896
	kjSuYnWyPurDVjbi+S4foemZvA==
X-Google-Smtp-Source: 
 AGHT+IE9ftK4zNSoDF9ZZdAHfmKKoCSOr+hOFAOIMPuXf3RKwwFH8thprBDvIOlmiwgclQAXqFu+rw==
X-Received: by 2002:a7b:cd8e:0:b0:40c:269c:518f with SMTP id
 y14-20020a7bcd8e000000b0040c269c518fmr8041416wmj.115.1702897388039;
        Mon, 18 Dec 2023 03:03:08 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e1c:b20d:6bfc:b0d4])
        by smtp.gmail.com with ESMTPSA id
 u23-20020adfa197000000b0033666096650sm3613638wru.42.2023.12.18.03.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:03:07 -0800 (PST)
References: <20231106104013.704356-1-jbrunet@baylibre.com>
 <CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com>
 <1jil4zq2on.fsf@starbuckisacylon.baylibre.com>
 <CACb=7PXkaKYupZafD2BTiqusHZ1nEFq8AfWVot7VL07kxm0uWw@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Hsin-Yi Wang <hsinyi@google.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Zhengqiao Xia
 <xiazhengqiao@huaqin.corp-partner.google.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdmi-codec: register hpd callback on component
 probe
Date: Mon, 18 Dec 2023 11:28:46 +0100
In-reply-to: 
 <CACb=7PXkaKYupZafD2BTiqusHZ1nEFq8AfWVot7VL07kxm0uWw@mail.gmail.com>
Message-ID: <1j5y0v22ol.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AD4YAA5RSCZWBI36TSFUFDKVLZOBHACI
X-Message-ID-Hash: AD4YAA5RSCZWBI36TSFUFDKVLZOBHACI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AD4YAA5RSCZWBI36TSFUFDKVLZOBHACI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Dec 2023 at 14:55, Hsin-Yi Wang <hsinyi@google.com> wrote:

> On Fri, Dec 15, 2023 at 12:40=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>>
>> On Fri 15 Dec 2023 at 12:51, Zhengqiao Xia
>> <xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>>
>> > Hi Jerome,
>> >
>> > After my testing, I found that this patch will cause the audio on the =
external display to not work properly after
>> > restart.
>> > You move the plugged_cb to run in hdmi_probe, at this time hcp- > jack=
 =3D NULL, the driver cannot report `SND_JACK_LINEOUT
>> > ` normally.
>> > static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
>> >                                  unsigned int jack_status)
>> > {
>> >       printk("xzq-866 hdmi_codec_jack_report: jack=3D%x, jack_status=
=3D%d", hcp->jack, jack_status !=3D hcp->jack_status);
>> >       if (hcp->jack && jack_status !=3D hcp->jack_status) {
>> >               snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LIN=
EOUT);
>> >               hcp->jack_status =3D jack_status;
>> >       }
>> > }
>> > So we must call  plugged_cb  in hdmi_codec_set_jack,  Can you make som=
e changes?
>>
>> Hi Zhengqiao,
>>
>> That is unfortunate. Sorry.
>>
>> This patch has changed when the hpd callback is registered, no when it
>> comes in effect. This is still dependent on calling .set_jack() and it
>> is not happening any later than it was before. So, in theory, it should
>> not have changed anything, if your driver actually relies on the HPD
>> event.
>>
>> Trying to guess what is happening for you, I suppose your HDMI driver is
>> "faking" an HPD event to report the initial jack status when the
>> hook_plugged_cb() is called. Could you point me to the hdmi driver you
>> are using so I can have a look ?
>>
>> My reference when testing this was dw-hdmi-i2s-audio and it does not do
>> that, it just registers the callback. I think this is what it supposed
>> to do TBH.
>>
>> An idea I have been thinking about for a while is have the hdmi-codec
>> insert the jack in the card itself, instead of the card doing. That
>> would give the jack "for free" to any user of the HDMI codec and might
>> also solve your issue. It would require a small rework of the cards doing
>> the hdmi jack register, but there are not many of these AFAIK.
>>
>
> The driver is it6505. The implementation of hook_plugged_cb():
> 1. register plugged_cb
> 2. call plugged_cb(bool plugged)
>
> bridge detect callback it6505_detect would also call plugged_cb, but
> only on the first time hpd status changed (eg. changed from connect
> <--> disconnect)
> it6505_detect() {
>   status =3D it6505->hpd_state ...
>   ...
>   if (it6505->connector_status !=3D status) {
>     it6505->connector_status =3D status;
>     it6505_plugged_status_to_codec(it6505); // this will call plugged_cb
>   }
> }
>
> Unfortunately the first time after boot that hpd status changed was
> detected before set_jack. If we replug hdmi, the plugged_cb() was
> called by bridge_detect, which is expected.
>
> Prior to this patch, the initial plugged_cb() was called by hook_plugged_=
cb().
> After the patch, plugged_cb() should be called by hpd change (by
> bridge detect), but due to the driver logic only calling it on the
> first hpd state change, it fails to call plugged_cb() again when jack
> is set.

This is what thought=20

>
> I checked the dw-hdmi.c's bridge_detect, and it's similar in that it
> also checks the last_connector_result, so maybe it's due to a timing
> difference?

No, I have overlooked that.
I'm preparing a fix. I'll Cc you.

Eventually, I still would like to make it easier for cards to use the
HDMI jack and have to codec do that registration on its own. It will
require some rework of cards already doing it.

I've only seen 2 cards doing that at the moment:
* imx-hdmi.c
* mt8188-mt6359.c

Could you point me to yours ?

>
>> >
>> > On Mon, Nov 6, 2023 at 6:40=E2=80=AFPM Jerome Brunet <jbrunet@baylibre=
.com> wrote:
>> >
>> >  The HDMI hotplug callback to the hdmi-codec is currently registered w=
hen
>> >  jack is set.
>> >
>> >  The hotplug not only serves to report the ASoC jack state but also to=
 get
>> >  the ELD. It should be registered when the component probes instead, s=
o it
>> >  does not depend on the card driver registering a jack for the HDMI to
>> >  properly report the ELD.
>> >
>> >  Fixes: 25ce4f2b3593 ("ASoC: hdmi-codec: Get ELD in before reporting p=
lugged event")
>> >  Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >  ---
>> >   sound/soc/codecs/hdmi-codec.c | 27 +++++++++++++++++++--------
>> >   1 file changed, 19 insertions(+), 8 deletions(-)
>> >
>> >  diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-co=
dec.c
>> >  index 09eef6042aad..20da1eaa4f1c 100644
>> >  --- a/sound/soc/codecs/hdmi-codec.c
>> >  +++ b/sound/soc/codecs/hdmi-codec.c
>> >  @@ -877,18 +877,13 @@ static int hdmi_codec_set_jack(struct snd_soc_c=
omponent *component,
>> >                                 void *data)
>> >   {
>> >          struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata=
(component);
>> >  -       int ret =3D -ENOTSUPP;
>> >
>> >          if (hcp->hcd.ops->hook_plugged_cb) {
>> >                  hcp->jack =3D jack;
>> >  -               ret =3D hcp->hcd.ops->hook_plugged_cb(component->dev-=
>parent,
>> >  -                                                   hcp->hcd.data,
>> >  -                                                   plugged_cb,
>> >  -                                                   component->dev);
>> >  -               if (ret)
>> >  -                       hcp->jack =3D NULL;
>> >  +               return 0;
>> >          }
>> >  -       return ret;
>> >  +
>> >  +       return -ENOTSUPP;
>> >   }
>> >
>> >   static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
>> >  @@ -982,6 +977,21 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_c=
omponent *component,
>> >          return ret;
>> >   }
>> >
>> >  +static int hdmi_probe(struct snd_soc_component *component)
>> >  +{
>> >  +       struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata=
(component);
>> >  +       int ret =3D 0;
>> >  +
>> >  +       if (hcp->hcd.ops->hook_plugged_cb) {
>> >  +               ret =3D hcp->hcd.ops->hook_plugged_cb(component->dev-=
>parent,
>> >  +                                                   hcp->hcd.data,
>> >  +                                                   plugged_cb,
>> >  +                                                   component->dev);
>> >  +       }
>> >  +
>> >  +       return ret;
>> >  +}
>> >  +
>> >   static void hdmi_remove(struct snd_soc_component *component)
>> >   {
>> >          struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata=
(component);
>> >  @@ -992,6 +1002,7 @@ static void hdmi_remove(struct snd_soc_component=
 *component)
>> >   }
>> >
>> >   static const struct snd_soc_component_driver hdmi_driver =3D {
>> >  +       .probe                  =3D hdmi_probe,
>> >          .remove                 =3D hdmi_remove,
>> >          .dapm_widgets           =3D hdmi_widgets,
>> >          .num_dapm_widgets       =3D ARRAY_SIZE(hdmi_widgets),
>>
>>
>> --
>> Jerome


--=20
Jerome
