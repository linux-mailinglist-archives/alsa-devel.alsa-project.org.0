Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B76CEEF0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB7D31F1;
	Wed, 29 Mar 2023 18:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB7D31F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106442;
	bh=XjKItjM/IRb+tOD62ZCLE6IyekKfM/0znPoegOLAB5k=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qzKH2NNhzisdnRUXOT1H9vK6Bkg/6mmRHG58VedSpNEr0ICPLmO1FAkVI6bj3TS+r
	 soogqY6nT9vA8h736uhW9ThbYI75JCer84NXuCoCwXgX7tKH9XwiLiASlYGSgqagB8
	 sIjUMFGhegdvuJKjtQdfdFnZpkaPMHv0FCah1iJ0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B46BF80553;
	Wed, 29 Mar 2023 18:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9EA7F80272; Mon, 27 Mar 2023 10:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5130F800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 10:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5130F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lSd7ukge
Received: by mail-ed1-x52a.google.com with SMTP id ew6so32529363edb.7
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679906236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alcgPkT70wWVcnAPv13WswAdsJvkYrPqqfWqcJe5IXA=;
        b=lSd7ukgeVlHRCzTfzLETp+jivNZUnMIBsvjrBRUW/ML6Sj/gzrK53xqMpcfOZbLYss
         Ah1Gyh0uu+DZzEeG3zI74NDdKClOW40FIMt0w1pwuiV6i4z1ht0Ig0hPNrh8gTesgIYt
         3ZWHZkXXjuvNzevYSplmkNR46OxWdSi7MlIWQ4XiLKWppKioq0cwBn9Q3C41O8iWZn1t
         OfBF35YrNz48jc6mgJyRIQp4vMbHK+cfSvYkoySgmqZLhcHl+UZwNUIsdazpZhFA1Y2Z
         TlWuhwHOOkTVPlKXP2QVu6GXMbDq7Ro3/81qzTxo3zxJjj6cufrW47dW/tT6ke2NOwoY
         9Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alcgPkT70wWVcnAPv13WswAdsJvkYrPqqfWqcJe5IXA=;
        b=QkIMWxCPIkF5XQzmwwdPY2BsMULoT/1WNwtm9XH6nsGv4Cjp5X6eiOy6VQDNHm+V7C
         XfMYhadMsZZAXH4GiUOJm8HzzQ4oF4ucsXQhFw2yK97256aWJXvTAbke9bQf/y4DjdpQ
         jTwUH74B7QUucqQO4ilcbuH+g/JZER7DSyfqoxzWLZ6HXPdyXUBJ187gU5GESLvnKNEX
         8y71khu9IdrLbn67r7R+43k1dtiSGo36FEfXgi/brMTWp78BZpGcC2N8naEG1aKUvHm8
         mdqaSIwyj9K5DbRjpH+d9tUEECm8I8MrwSHqZqT8xSMB1mA1q05UuxBqdmcF+Nm/DzZH
         YUzA==
X-Gm-Message-State: AAQBX9eTm87gEjnZJYyhYhwrWpHalTGfdl2ms0gs+w4fjfltm0dZWhEh
	8VcCi2xJpKCoctcIjh1kWXF4h2X+144vRl7UTsg=
X-Google-Smtp-Source: 
 AKy350asEfigB4Hm1EKOSNKhMWyL5Vxg08Ww3GQgwCTEbPXRBhFzkdiSzYjjDBvFMUQf3xyqAp/uA+Z+oxo9OJD/Gn0=
X-Received: by 2002:a17:906:7051:b0:8db:b5c1:7203 with SMTP id
 r17-20020a170906705100b008dbb5c17203mr5368965ejj.11.1679906236204; Mon, 27
 Mar 2023 01:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230325083643.7575-2-clamor95@gmail.com>
 <20230327083208.GQ68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230327083208.GQ68926@ediswmail.ad.cirrus.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Mar 2023 11:37:05 +0300
Message-ID: 
 <CAPVz0n1AaTzdwmfkxaUX5peAiQ2K73aoqKfLUy1jwEE6__uG2w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: wm8903: implement DMIC support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MG3PCAOSF4ZX65UUGAD5K3DCJBQZOD76
X-Message-ID-Hash: MG3PCAOSF4ZX65UUGAD5K3DCJBQZOD76
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:12:16 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MG3PCAOSF4ZX65UUGAD5K3DCJBQZOD76/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=BF=D0=BD, 27 =D0=B1=D0=B5=D1=80. 2023=E2=80=AF=D1=80. =D0=BE 11:32 Char=
les Keepax <ckeepax@opensource.cirrus.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Mar 25, 2023 at 10:36:43AM +0200, Svyatoslav Ryhel wrote:
> > Add DMIC input and routing.
> >
> > Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF300T
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  sound/soc/codecs/wm8903.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
> > index 41346e5ec5ad..9c2f0aadcff3 100644
> > --- a/sound/soc/codecs/wm8903.c
> > +++ b/sound/soc/codecs/wm8903.c
> > @@ -9,7 +9,6 @@
> >   *
> >   * TODO:
> >   *  - TDM mode configuration.
> > - *  - Digital microphone support.
> >   */
> >
> >  #include <linux/module.h>
> > @@ -816,6 +815,7 @@ SND_SOC_DAPM_INPUT("IN2L"),
> >  SND_SOC_DAPM_INPUT("IN2R"),
> >  SND_SOC_DAPM_INPUT("IN3L"),
> >  SND_SOC_DAPM_INPUT("IN3R"),
> > +SND_SOC_DAPM_INPUT("DMIC"),
> >  SND_SOC_DAPM_INPUT("DMICDAT"),
>
> There is already a datapath for the DMIC here, DMICDAT. Are you
> sure you don't just need to set the "Left/Right ADC Input" muxes
> correctly through the ALSA controls?
>

I will check once more, but so far I was not able to set the mic to
work with DMICDAT. Only with this patch.

Best regards,
Svyatoslav R.

> >
> >  SND_SOC_DAPM_OUTPUT("HPOUTL"),
> > @@ -996,6 +996,9 @@ static const struct snd_soc_dapm_route wm8903_inter=
con[] =3D {
> >       { "AIFTXL", NULL, "Left Capture Mux" },
> >       { "AIFTXR", NULL, "Right Capture Mux" },
> >
> > +     { "ADCL", NULL, "DMIC" },
> > +     { "ADCR", NULL, "DMIC" },
> > +
>
> And at any rate these should not be directly connected to the
> ADC you need some muxing to indicate whether the DMIC or AMICs
> are active. Which the DMICDAT path appears to already have.
>
> Thanks,
> Charles
