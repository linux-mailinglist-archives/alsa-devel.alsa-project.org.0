Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74ED82DE7E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 18:33:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EDC207;
	Mon, 15 Jan 2024 18:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EDC207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705339991;
	bh=zc1flDE3PhZVU04RXYvbgwNP4obU8SayEtt/EdQ/h1c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ShQr7iFgB8LwWoE8CZ9H7tqk+wFgYdWQrD7QtoQw1D4kVHa70cWzk6QQou9pzSvV9
	 9FjCQNyUFQFl7+Ct5LR1ysaD8NimUdRWu/u2lJ6MlzqNJwg9QxBwSVCyTZdftJhwOI
	 hG26HvMPRqk5GTDrqIj8DziRcK3BxWX210OrMdEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8FDCF80548; Mon, 15 Jan 2024 18:32:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC3BF80520;
	Mon, 15 Jan 2024 18:32:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D64EF801F5; Mon, 15 Jan 2024 18:32:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97E7EF80074
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 18:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E7EF80074
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQom-0004EU-7Y; Mon, 15 Jan 2024 18:32:12 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQoh-00044H-MF; Mon, 15 Jan 2024 18:32:07 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQoh-000A5v-1x;
	Mon, 15 Jan 2024 18:32:07 +0100
Message-ID: <289c4af00bcc46e83555dacbc76f56477126d645.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,  Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>,  Sean Anderson <sean.anderson@seco.com>
Date: Mon, 15 Jan 2024 18:32:07 +0100
In-Reply-To: <7f311659-9f49-44dc-ad40-977d34066d98@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
	 <CAMRc=MdcCZP5kgv7JBdy2m_naNbTSeq4MDE_3mk+1-5UD4ntwQ@mail.gmail.com>
	 <7f311659-9f49-44dc-ad40-977d34066d98@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: TJBK7B3TUA6W5G3FIZ22QK2M7JCVSGKQ
X-Message-ID-Hash: TJBK7B3TUA6W5G3FIZ22QK2M7JCVSGKQ
X-MailFrom: p.zabel@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJBK7B3TUA6W5G3FIZ22QK2M7JCVSGKQ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mo, 2024-01-15 at 17:13 +0100, Krzysztof Kozlowski wrote:
> On 15/01/2024 17:06, Bartosz Golaszewski wrote:
> > > +
> > > +static int __reset_add_reset_gpio_lookup(int id, struct device_node =
*np,
> > > +                                        unsigned int gpio,
> > > +                                        unsigned int of_flags)
> > > +{
> > > +       struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
> > > +       struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> > > +       char *label __free(kfree) =3D NULL;
> >=20
> > I got yelled at by Linus Torvalds personally for doing it like this. I
> > know this is a common pattern in code using GLib but Linus wants auto
> > variables to be initialized where they're declared...
>=20
> Declaration is here. Initialization is here. Therefore this is
> initialized where it is declared. What's more it is initialized to a
> valid value, because __free() accepts NULLs.
[...]
> > ... so this should become:
> >=20
> >   struct gpio_device *gdev __free(gpio_device_put) =3D gpio_device_find=
(...)
> >=20
> > and same for the rest.
> >=20
> > Don't get me wrong, I love cleanup.h but there's a (unofficial for
> > now) coding style.
>=20
> So you just want to declare it not in top-part of the function but just
> before first use?

IIUC, Linus wants exactly this:

https://lore.kernel.org/all/CAHk-=3DwgRHiV5VSxtfXA4S6aLUmcQYEuB67u3BJPJPtuE=
Ss1JyA@mail.gmail.com/

[...]
> >=20
> > > +               goto out_unlock;
> > >         }
> > >=20
> > >         rstc_id =3D rcdev->of_xlate(rcdev, &args);
> > >         if (rstc_id < 0) {
> > >                 rstc =3D ERR_PTR(rstc_id);
> > > -               goto out;
> > > +               goto out_unlock;
> > >         }
> > >=20
> > >         /* reset_list_mutex also protects the rcdev's reset_control l=
ist */
> > >         rstc =3D __reset_control_get_internal(rcdev, rstc_id, shared,=
 acquired);
> > >=20
> > > -out:
> > > +out_unlock:
> > >         mutex_unlock(&reset_list_mutex);
> > > +out_put:
> > >         of_node_put(args.np);
> >=20
> > I suggest reworking this to use cleanup.h as well.
>=20
> It's independent task. This is an existing code and any refactoring to
> cleanup or not is independent thing.

Seconded. Separate cleanup very welcome, but this series is about
adding functionality.

regards
Philipp
