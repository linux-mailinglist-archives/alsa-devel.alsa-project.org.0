Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A177822183
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0B81539;
	Tue,  2 Jan 2024 19:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0B81539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221885;
	bh=JJPHl/frXCxWYkp8j/fa7Y6yDGtOBUVUKJEm8ULgotY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eq7S6jaFc/p71YLg6pXua7HXpufY0jK9KdVLyIY3fiWrDoNcsb+PZnX3Es8ezRBT+
	 rhDNmW7vfRW572NL0om0PheRdRPgaEWoJfV1egidJQ+6JaSPMLUpeK5j8GzJkWuh9h
	 MpwT9VOfjLkNVRrJ+/AGSZ3dYlc7r0ak9Cd1SH2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 854F1F897FF; Tue,  2 Jan 2024 19:51:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99701F8980D;
	Tue,  2 Jan 2024 19:51:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E3F6F80166; Fri, 15 Dec 2023 23:55:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D167DF8001F
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 23:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D167DF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=EEK7RQDQ
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so12303885e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Dec 2023 14:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702680928; x=1703285728;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfWah5pIv+cdtVmyxWmUY/L3xG6Co4HLc34UhFBOkUw=;
        b=EEK7RQDQ7Nvm3bqW6gRYA4vR+Z8gPnXl0fJZhQKRVIctGbNVxJ410RAc4Ty238nRwq
         s17a4SuVyLNVVFGGdav0oIZNhamQBLicvPmtqESxtOtlye/xFyZ3eiRQ6whwWdCv+KMY
         HaCDHIDcKnoxd/KCaFMjD2JTLWy1B4NlxKg59u1Bn3wtYhDRuBAGsIh1DoTY9AopNPtT
         k7P50t6peaRg6bWiIWNYtGlInFhoYSRs3TfY5NoyI9WUtofZsetAIKB/QVzvTKFvwFEd
         Z8qRsFi8yJNolkFr9W7GUmrqQaW66A+p+xJUFkDG9yWlEdhN9JiwaZI0/4Cy5CBKyAN+
         9nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702680928; x=1703285728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfWah5pIv+cdtVmyxWmUY/L3xG6Co4HLc34UhFBOkUw=;
        b=tIiZsU20u7qn62Zb4JJxqkCwcmLR0nyKltKCdgBN2JNRxtJRbLYpGgjqUapQ4J3SN2
         wdtO8ghPJJypYub+G5bKn1iL/BtO6JpsnRMcO6Yf7OIf2pzrP/x6KiuQio36ywQTCnzE
         6kfzoP54GGALwedcjNVkNVn8ZmzuwB+RYjJLQ7fSZwCdvL+ghXOkVFxrWXcQSD5y11x+
         9TzOoYEneCT+Mu8NbYSg3eqiEcmvFrdYd/AnrfdHYQqH3MmkJcTXneiXmHE8ecakyNxd
         f9aIw67YEz9K+vaNITEv35Xdz4/myl6H/uVNVjA0G1eLNbga1Zc2W64Y2ctYLczTzfh3
         MMPw==
X-Gm-Message-State: AOJu0YxM0j03wCqGjKXyi9j4U4u3SU22H9pULgwew2joImV/qg/RzOBo
	+pJUkT2TCni+Evs6W9i8hltSqQRCCaUpbeUgxQJNng==
X-Google-Smtp-Source: 
 AGHT+IFIB5xNMOQoGlg74oNU/TZnz/9PWSKGUJ3pLK/UQ1Nqs6+/vrrIi0CB3YqMFOOPJKuW3z2k6ksi5MjBtn5J/9M=
X-Received: by 2002:a05:600c:4507:b0:40b:5e21:cc15 with SMTP id
 t7-20020a05600c450700b0040b5e21cc15mr6325717wmo.64.1702680928219; Fri, 15 Dec
 2023 14:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20231106104013.704356-1-jbrunet@baylibre.com>
 <CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com>
 <1jil4zq2on.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jil4zq2on.fsf@starbuckisacylon.baylibre.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Fri, 15 Dec 2023 14:55:00 -0800
Message-ID: 
 <CACb=7PXkaKYupZafD2BTiqusHZ1nEFq8AfWVot7VL07kxm0uWw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: register hpd callback on component
 probe
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hsinyi@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BIRUNXCRQMRQR6YQ4QCJIGQH65QZMD24
X-Message-ID-Hash: BIRUNXCRQMRQR6YQ4QCJIGQH65QZMD24
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:15:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIRUNXCRQMRQR6YQ4QCJIGQH65QZMD24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 15, 2023 at 12:40=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
>
> On Fri 15 Dec 2023 at 12:51, Zhengqiao Xia <xiazhengqiao@huaqin.corp-part=
ner.google.com> wrote:
>
> > Hi Jerome,
> >
> > After my testing, I found that this patch will cause the audio on the e=
xternal display to not work properly after
> > restart.
> > You move the plugged_cb to run in hdmi_probe, at this time hcp- > jack =
=3D NULL, the driver cannot report `SND_JACK_LINEOUT
> > ` normally.
> > static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
> >                                  unsigned int jack_status)
> > {
> >       printk("xzq-866 hdmi_codec_jack_report: jack=3D%x, jack_status=3D=
%d", hcp->jack, jack_status !=3D hcp->jack_status);
> >       if (hcp->jack && jack_status !=3D hcp->jack_status) {
> >               snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINE=
OUT);
> >               hcp->jack_status =3D jack_status;
> >       }
> > }
> > So we must call  plugged_cb  in hdmi_codec_set_jack,  Can you make some=
 changes?
>
> Hi Zhengqiao,
>
> That is unfortunate. Sorry.
>
> This patch has changed when the hpd callback is registered, no when it
> comes in effect. This is still dependent on calling .set_jack() and it
> is not happening any later than it was before. So, in theory, it should
> not have changed anything, if your driver actually relies on the HPD
> event.
>
> Trying to guess what is happening for you, I suppose your HDMI driver is
> "faking" an HPD event to report the initial jack status when the
> hook_plugged_cb() is called. Could you point me to the hdmi driver you
> are using so I can have a look ?
>
> My reference when testing this was dw-hdmi-i2s-audio and it does not do
> that, it just registers the callback. I think this is what it supposed
> to do TBH.
>
> An idea I have been thinking about for a while is have the hdmi-codec
> insert the jack in the card itself, instead of the card doing. That
> would give the jack "for free" to any user of the HDMI codec and might
> also solve your issue. It would require a small rework of the cards doing
> the hdmi jack register, but there are not many of these AFAIK.
>

The driver is it6505. The implementation of hook_plugged_cb():
1. register plugged_cb
2. call plugged_cb(bool plugged)

bridge detect callback it6505_detect would also call plugged_cb, but
only on the first time hpd status changed (eg. changed from connect
<--> disconnect)
it6505_detect() {
  status =3D it6505->hpd_state ...
  ...
  if (it6505->connector_status !=3D status) {
    it6505->connector_status =3D status;
    it6505_plugged_status_to_codec(it6505); // this will call plugged_cb
  }
}

Unfortunately the first time after boot that hpd status changed was
detected before set_jack. If we replug hdmi, the plugged_cb() was
called by bridge_detect, which is expected.

Prior to this patch, the initial plugged_cb() was called by hook_plugged_cb=
().
After the patch, plugged_cb() should be called by hpd change (by
bridge detect), but due to the driver logic only calling it on the
first hpd state change, it fails to call plugged_cb() again when jack
is set.

I checked the dw-hdmi.c's bridge_detect, and it's similar in that it
also checks the last_connector_result, so maybe it's due to a timing
difference?

> >
> > On Mon, Nov 6, 2023 at 6:40=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
> >
> >  The HDMI hotplug callback to the hdmi-codec is currently registered wh=
en
> >  jack is set.
> >
> >  The hotplug not only serves to report the ASoC jack state but also to =
get
> >  the ELD. It should be registered when the component probes instead, so=
 it
> >  does not depend on the card driver registering a jack for the HDMI to
> >  properly report the ELD.
> >
> >  Fixes: 25ce4f2b3593 ("ASoC: hdmi-codec: Get ELD in before reporting pl=
ugged event")
> >  Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >  ---
> >   sound/soc/codecs/hdmi-codec.c | 27 +++++++++++++++++++--------
> >   1 file changed, 19 insertions(+), 8 deletions(-)
> >
> >  diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-cod=
ec.c
> >  index 09eef6042aad..20da1eaa4f1c 100644
> >  --- a/sound/soc/codecs/hdmi-codec.c
> >  +++ b/sound/soc/codecs/hdmi-codec.c
> >  @@ -877,18 +877,13 @@ static int hdmi_codec_set_jack(struct snd_soc_co=
mponent *component,
> >                                 void *data)
> >   {
> >          struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(=
component);
> >  -       int ret =3D -ENOTSUPP;
> >
> >          if (hcp->hcd.ops->hook_plugged_cb) {
> >                  hcp->jack =3D jack;
> >  -               ret =3D hcp->hcd.ops->hook_plugged_cb(component->dev->=
parent,
> >  -                                                   hcp->hcd.data,
> >  -                                                   plugged_cb,
> >  -                                                   component->dev);
> >  -               if (ret)
> >  -                       hcp->jack =3D NULL;
> >  +               return 0;
> >          }
> >  -       return ret;
> >  +
> >  +       return -ENOTSUPP;
> >   }
> >
> >   static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
> >  @@ -982,6 +977,21 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_co=
mponent *component,
> >          return ret;
> >   }
> >
> >  +static int hdmi_probe(struct snd_soc_component *component)
> >  +{
> >  +       struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(=
component);
> >  +       int ret =3D 0;
> >  +
> >  +       if (hcp->hcd.ops->hook_plugged_cb) {
> >  +               ret =3D hcp->hcd.ops->hook_plugged_cb(component->dev->=
parent,
> >  +                                                   hcp->hcd.data,
> >  +                                                   plugged_cb,
> >  +                                                   component->dev);
> >  +       }
> >  +
> >  +       return ret;
> >  +}
> >  +
> >   static void hdmi_remove(struct snd_soc_component *component)
> >   {
> >          struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(=
component);
> >  @@ -992,6 +1002,7 @@ static void hdmi_remove(struct snd_soc_component =
*component)
> >   }
> >
> >   static const struct snd_soc_component_driver hdmi_driver =3D {
> >  +       .probe                  =3D hdmi_probe,
> >          .remove                 =3D hdmi_remove,
> >          .dapm_widgets           =3D hdmi_widgets,
> >          .num_dapm_widgets       =3D ARRAY_SIZE(hdmi_widgets),
>
>
> --
> Jerome
