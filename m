Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B369F010
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:21:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B1F850;
	Wed, 22 Feb 2023 09:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B1F850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054089;
	bh=m09uUF9M8/JbvUUex+R12hGi32AJxNf3hftUvm3ZQZc=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RSSBDaZc6OkKnoMe4HNrHrD0u0dpy+1l1h87Otgb+juNRAFeUvQwQAoVwUgSfVCYZ
	 zVvfCug6jsOWmnbWkA/eHnUjqC94oVI49JwqZYM7BFZL+p05kRAuLCb/ccJM3K95xv
	 AA+PYcHxXh4cr0trNN4jmoEJntT8jYVJzJXthTjA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23FD6F804B2;
	Wed, 22 Feb 2023 09:20:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 757A3F80266; Wed, 22 Feb 2023 08:56:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4417F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 08:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4417F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=We04ug73
Received: by mail-ed1-x52d.google.com with SMTP id x10so26010953edd.13
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 23:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgFg4u82TvD5fQ/qkOIk8bqnfcsUdnb5ri794YsSIUk=;
        b=We04ug736s7NZz1w+LsI1A/zzq9lsygNQuEg8sDER1ENddmP57YgH0DhF73Y+JWZxv
         /tQkKOc1NJciSK2RTuI9V9ykmKhcLNUXLPp/odXiLkvoEmpFg1DYZ6WAbYX1lMB+Vf0J
         HcdpcRJElLHrax2orAiwALCfMsmsxddxsg5PxDti9agbKf9O3aUf+DX3mnCPOx2VQdwU
         rrC7HM5M6bmAn942zaRhuBMnqlQfiDp1aEDZDCT2xhX3XyxQwrWeoVwvSeeVGPaFnIEx
         trrHweLwcgvBvDHgxmGZBfzpruBbrGfw59+rgvrHdp6HzT4NvbsiB7MDDLsQZdulvBF5
         gAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgFg4u82TvD5fQ/qkOIk8bqnfcsUdnb5ri794YsSIUk=;
        b=wW+cEXpvqoxGDU9erru2iJSWLKo0iKhvvZkx7+UVFrm75bNr6LKHUEeNk4d+SYZr4F
         RL3MH7bAAIuRzGgq0XZYBR2pIh4Kjl/rZs+O8JswZAsiArV2LDBqQtT3WH4VpgzpNPfm
         1MFG49340jlBYL3AZ1nrkqd3QQxFw/kEJOkj5iWLoxEw45IKNTJILukNzQ+OzbtHOzlL
         CUp1qp9eAxRNZG8cn8p8qIVGPcRCGMsZh2+99FDILZQ7mdfkxhIAABuU00xLLtIu0p8K
         tC1GnGY9rEYBXnRaNlP8bD0yKHfDgG5svAdnMkttkTnhbrYCyIpEOlkdOQp9/piHv2If
         vG4Q==
X-Gm-Message-State: AO0yUKWCxLZ+XMlMwYyLgBKadQHaQZD4fov9uGT6rdxKOaPyneiOp7gV
	c7bEbXpTB+d1vWnYiyNaoVIUHCKJqIlZOTCcNO8=
X-Google-Smtp-Source: 
 AK7set86EqLJbVtLPn+eFpQhyilCpoGiEYS+jNbNtWWgWpm5ic8N1YNya+4HDkYqa1aZTpjG14F9tumdchiAIzrcXZo=
X-Received: by 2002:a50:9f08:0:b0:4ab:4b85:a6a8 with SMTP id
 b8-20020a509f08000000b004ab4b85a6a8mr3408901edf.4.1677052563525; Tue, 21 Feb
 2023 23:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
 <Y/UcXNueAmrrhWG0@kadam>
In-Reply-To: <Y/UcXNueAmrrhWG0@kadam>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 09:55:52 +0200
Message-ID: 
 <CAPVz0n01YWQ6FY9RDsa1rw_36n=NKpRLokFiVTxLsMDpQEd4YA@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
To: Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5I46M2ACEPKMS5R7PAZQVHGMA45VLORO
X-Message-ID-Hash: 5I46M2ACEPKMS5R7PAZQVHGMA45VLORO
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:20:06 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5I46M2ACEPKMS5R7PAZQVHGMA45VLORO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=B2=D1=82, 21 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 21:32 Dan Carpente=
r <error27@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
> > diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/teg=
ra_asoc_machine.c
> > index 78faa8bcae27..607800ec07a6 100644
> > --- a/sound/soc/tegra/tegra_asoc_machine.c
> > +++ b/sound/soc/tegra/tegra_asoc_machine.c
> > @@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headse=
t_jack_gpio =3D {
> >  };
> >
> >  /* Mic Jack */
>
> This comment doesn't make sense now.  It was never super useful, though.
> Just delete it.

It does. Headset is Mic Jack + Headphones combined. headset_check function
performs check for a Mic Jack component in plugged Jack 3.5

> > +static int headset_check(void *data)
> > +{
> > +     struct tegra_machine *machine =3D (struct tegra_machine *)data;
> > +
> > +     /* Detect mic insertion only if 3.5 jack is in */
> > +     if (gpiod_get_value_cansleep(machine->gpiod_hp_det) &&
> > +         gpiod_get_value_cansleep(machine->gpiod_mic_det))
> > +             return SND_JACK_MICROPHONE;
> > +
> > +     return 0;
> > +}
> >
> >  static struct snd_soc_jack tegra_machine_mic_jack;
> >
> > @@ -183,8 +194,15 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_run=
time *rtd)
>
> regards,
> dan carpenter
