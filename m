Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1A8143D9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 09:41:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A901E72;
	Fri, 15 Dec 2023 09:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A901E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702629660;
	bh=g9UkJatCj1NLvkKbmRR1hb0SNUzts3M/O9vVeQbNGek=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ggxBRxMIVspX2RX2W8mosE/k0Na+GjXfgy8V4jj4eR3zaVXL9UrIDqmqDbPaWilLI
	 9MJwhcA8YHwRTQ8ulQBQPHnBaMJGhPu+66HjEBH9o9Xl9EHkahxc910ZuWwfn9dyu6
	 fXSNWxBbVeAOM0MZI62IeXO09nKvy10Xer+h5r/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B64B0F805A0; Fri, 15 Dec 2023 09:40:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E20CF800D2;
	Fri, 15 Dec 2023 09:40:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE2C9F8016A; Fri, 15 Dec 2023 09:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4572F800D2
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 09:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4572F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=V0WrIm8u
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so1761555e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Dec 2023 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702629610;
 x=1703234410; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YtVAfSplXJke0Lc4PMkOXYv6bL4Yj/HkhXbIEQJcK4=;
        b=V0WrIm8u8o/SjRrYUIsj24x6mDSEzVAqmT4kSEVpn93xK9gLpAvEwk8LK6f7MKMO9P
         00MqShObmZ8dSgtjK21IjxSCUAQSUoVs17tJxygaU8JguzAe2qTohh74Ep9VzzVolx+M
         L9zYhOYsJU7peORvMknKUQp9bxu47s37rDIjBu8P5wOuk4+Ddt6a2w+ckDqoRcWRXFzE
         CVtNlO2HOM9GJYT16lgjY8x56D4hS/0jH59rGgRkNaV6AvqDANr4Z21GkiK4/lB57OF4
         H5i8fL2E17dA6014dE1zUDueZ016/AqzmNEfRknkljMlCcAFhNaO9TqyT4K5AH2UN+Uu
         uRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702629610; x=1703234410;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7YtVAfSplXJke0Lc4PMkOXYv6bL4Yj/HkhXbIEQJcK4=;
        b=faolS3hGz+RaBDLgVXvzj9dNaOA0a+zF3vousDVvBsZCXyI6fWhcRrQUV/X/MiAo28
         5KpCNIA6p84g1dhDB4+D1Ni4YpEQ6lOiSdwakck9KEvypLCkF1gmwNwaB2G5YYUDiqlE
         Rf26HdoxXYBixgSMy23oxcgHq89msYDexfk4j4w8ZVokU5Rnk6kb3PO8j4hH+4B+geY9
         mu2TC702WO5dJIQu4UUyHJM3JBmFEeHM/HumjhTZFbHuLaAIiEDhicHEbM9HLylyBixj
         zTG8pH4juCYcWtUap4A7H8xzW0ty79/kXsjNc+3EwTLxObECZCLKDU9F/XQXMdIaCQY3
         7ibg==
X-Gm-Message-State: AOJu0YzfoZHHdPiDBtcWmQ819GiTM6FCni86Er8o7xtIeiVR9yjvL+y4
	MVQG0jShacS75RwT/o3tjt7g4g==
X-Google-Smtp-Source: 
 AGHT+IGFZfTLkMYS21w0oGbQOTfR0aJ4jsw/dLyqHOqHoVp9u5QTN/Jj53IQ/SW0XSMaY6Xrcsnb0A==
X-Received: by 2002:a05:600c:34ce:b0:40c:6cbe:aacf with SMTP id
 d14-20020a05600c34ce00b0040c6cbeaacfmr168118wmq.165.1702629609931;
        Fri, 15 Dec 2023 00:40:09 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:95b3:332a:9768:b3f2])
        by smtp.gmail.com with ESMTPSA id
 fc17-20020a05600c525100b0040c42681fcesm21307104wmb.15.2023.12.15.00.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:40:09 -0800 (PST)
References: <20231106104013.704356-1-jbrunet@baylibre.com>
 <CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Hsin-Yi Wang
 <hsinyi@google.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: register hpd callback on component
 probe
Date: Fri, 15 Dec 2023 08:57:39 +0100
In-reply-to: 
 <CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com>
Message-ID: <1jil4zq2on.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AVE2MA4KHDKRJAB7RN4UVNCTEFZNM57D
X-Message-ID-Hash: AVE2MA4KHDKRJAB7RN4UVNCTEFZNM57D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVE2MA4KHDKRJAB7RN4UVNCTEFZNM57D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Dec 2023 at 12:51, Zhengqiao Xia <xiazhengqiao@huaqin.corp-partne=
r.google.com> wrote:

> Hi Jerome,
>
> After my testing, I found that this patch will cause the audio on the ext=
ernal display to not work properly after
> restart.=20
> You move the plugged_cb to run in hdmi_probe, at this time hcp- > jack =
=3D NULL, the driver cannot report `SND_JACK_LINEOUT
> ` normally.
> static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
> 				   unsigned int jack_status)
> {
> 	printk("xzq-866 hdmi_codec_jack_report: jack=3D%x, jack_status=3D%d", hc=
p->jack, jack_status !=3D hcp->jack_status);
> 	if (hcp->jack && jack_status !=3D hcp->jack_status) {
> 		snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
> 		hcp->jack_status =3D jack_status;
> 	}
> }
> So we must call  plugged_cb  in hdmi_codec_set_jack,  Can you make some c=
hanges?

Hi Zhengqiao,

That is unfortunate. Sorry.

This patch has changed when the hpd callback is registered, no when it
comes in effect. This is still dependent on calling .set_jack() and it
is not happening any later than it was before. So, in theory, it should
not have changed anything, if your driver actually relies on the HPD
event.

Trying to guess what is happening for you, I suppose your HDMI driver is
"faking" an HPD event to report the initial jack status when the
hook_plugged_cb() is called. Could you point me to the hdmi driver you
are using so I can have a look ?

My reference when testing this was dw-hdmi-i2s-audio and it does not do
that, it just registers the callback. I think this is what it supposed
to do TBH.

An idea I have been thinking about for a while is have the hdmi-codec
insert the jack in the card itself, instead of the card doing. That
would give the jack "for free" to any user of the HDMI codec and might
also solve your issue. It would require a small rework of the cards doing
the hdmi jack register, but there are not many of these AFAIK.

>
> On Mon, Nov 6, 2023 at 6:40=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
>  The HDMI hotplug callback to the hdmi-codec is currently registered when
>  jack is set.
>
>  The hotplug not only serves to report the ASoC jack state but also to get
>  the ELD. It should be registered when the component probes instead, so it
>  does not depend on the card driver registering a jack for the HDMI to
>  properly report the ELD.
>
>  Fixes: 25ce4f2b3593 ("ASoC: hdmi-codec: Get ELD in before reporting plug=
ged event")
>  Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>  ---
>   sound/soc/codecs/hdmi-codec.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
>
>  diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec=
.c
>  index 09eef6042aad..20da1eaa4f1c 100644
>  --- a/sound/soc/codecs/hdmi-codec.c
>  +++ b/sound/soc/codecs/hdmi-codec.c
>  @@ -877,18 +877,13 @@ static int hdmi_codec_set_jack(struct snd_soc_comp=
onent *component,
>                                 void *data)
>   {
>          struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(co=
mponent);
>  -       int ret =3D -ENOTSUPP;
>
>          if (hcp->hcd.ops->hook_plugged_cb) {
>                  hcp->jack =3D jack;
>  -               ret =3D hcp->hcd.ops->hook_plugged_cb(component->dev->pa=
rent,
>  -                                                   hcp->hcd.data,
>  -                                                   plugged_cb,
>  -                                                   component->dev);
>  -               if (ret)
>  -                       hcp->jack =3D NULL;
>  +               return 0;
>          }
>  -       return ret;
>  +
>  +       return -ENOTSUPP;
>   }
>
>   static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
>  @@ -982,6 +977,21 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_comp=
onent *component,
>          return ret;
>   }
>
>  +static int hdmi_probe(struct snd_soc_component *component)
>  +{
>  +       struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(co=
mponent);
>  +       int ret =3D 0;
>  +
>  +       if (hcp->hcd.ops->hook_plugged_cb) {
>  +               ret =3D hcp->hcd.ops->hook_plugged_cb(component->dev->pa=
rent,
>  +                                                   hcp->hcd.data,
>  +                                                   plugged_cb,
>  +                                                   component->dev);
>  +       }
>  +
>  +       return ret;
>  +}
>  +
>   static void hdmi_remove(struct snd_soc_component *component)
>   {
>          struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(co=
mponent);
>  @@ -992,6 +1002,7 @@ static void hdmi_remove(struct snd_soc_component *c=
omponent)
>   }
>
>   static const struct snd_soc_component_driver hdmi_driver =3D {
>  +       .probe                  =3D hdmi_probe,
>          .remove                 =3D hdmi_remove,
>          .dapm_widgets           =3D hdmi_widgets,
>          .num_dapm_widgets       =3D ARRAY_SIZE(hdmi_widgets),


--=20
Jerome
