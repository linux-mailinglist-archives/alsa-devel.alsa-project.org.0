Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FB805454
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 13:36:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62F5FA;
	Tue,  5 Dec 2023 13:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62F5FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701779812;
	bh=snvkOlLktmb6jJDyHKDbsDB6Alf/8zvJNCTlZkcTcmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YQV0KNHboCapn/VKZiJAlMkk8QE/BN9RBaikp4xpWO3gbHv6dq5xQLBMTjonLsYi/
	 zZtL+KdjX4B2B+XJsBrQPwsCKj2hZRGWszlE9wE3RXFeeGbjXoRSKNrDWbHWmTtibR
	 WMvZ9mAn9LCb5ZY1RUHRbT0x+zy2ixBRIN9Brpsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87066F8057E; Tue,  5 Dec 2023 13:36:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DADF0F80557;
	Tue,  5 Dec 2023 13:36:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F73F8024E; Tue,  5 Dec 2023 13:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73CBBF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 13:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73CBBF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kcQPgukD
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66cso44155025e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701779768; x=1702384568;
 darn=alsa-project.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi/+U1S70zCpRCmtolwQMMJpjEnLtDmB7aIF6AJ1vQ4=;
        b=kcQPgukD4mAbshxb/hz+67OQIUFkjRV76NSBUMbYjlsgmgv0FuRxLZYLPWE0y9h+KN
         jVXWMupwHg/n42yqrWsqt5dNQaxOetrsjiNEtdOlHZpbH8Eon97VfL8/uPD3nW0pGFRS
         Xpnu4LdL6GENS/UsnvirVLCA6uQ1gWoMRwtgTjwuQnldDJbZtaPTnmm4Zg5scwm5DjWW
         xuNkpR+tNHqkEjxpovpbFSilaYR+giR7GEjx1EP8Bg2iPcR8AEtMxtx/cBp5yYFsbywp
         3IVqFw6nBUWZ/mp2zgiiX1xAFFVimKnD7hxknpgViOYtC2Tex4IM4daKZjxje8RA+jTJ
         EnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701779768; x=1702384568;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vi/+U1S70zCpRCmtolwQMMJpjEnLtDmB7aIF6AJ1vQ4=;
        b=klCbHhsCoctNItI06E5Pfweq5BTKL6TSrdSuyCRJXzLkQoalHB5yVCRD8KxdX0RWFZ
         +s1qswrho6P0j6kJpYtrMDykhLkmc3tkYoTmblAm0aDYF/59KIBq/UMzftL3FtK0pEAs
         /UBxfBSzVD4NNG+6rm0NroOSpZwg+WLF2MdC50g8T/nnKFCaJpD2ZGSezJny6KUqW5FO
         TiSdtJAWHcz6Vp9n+DqQ9XNBM4RpjJBSr2Bmrdnwv+mRhV6obGuUjA/5BnrOf8c60if/
         lzvovHHvM8l+MGAsY5G6EG/re1LOtSP0elm3MMlJlQ+4WLJhzC61JhOR85eyO3Fjbq2e
         QzRw==
X-Gm-Message-State: AOJu0Yy+B4qAosfIe7W/hdc/4QG6Hsc0yRh6ke2+/L+QtWpV8bokp68n
	s/GHUNBwJjp5OJpAPYS9rk8=
X-Google-Smtp-Source: 
 AGHT+IFRXDtzFmX4tYMMU5n5XaYJrLQWKmuFyEOl3CF2puX317iplwOttL32TpsSZhFHKXsaDUn0Zw==
X-Received: by 2002:a05:600c:3007:b0:40b:5e21:dd2c with SMTP id
 j7-20020a05600c300700b0040b5e21dd2cmr431012wmh.90.1701779767917;
        Tue, 05 Dec 2023 04:36:07 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 i21-20020a170906251500b009ff1997ce86sm6715307ejb.149.2023.12.05.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 04:36:07 -0800 (PST)
Date: Tue, 5 Dec 2023 13:36:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Message-ID: <ZW8ZNZ_FJSV8fq-U@orome.fritz.box>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <170119374454.445690.515311393756577368.b4-ty@gmail.com>
 <20231128205841.al23ra5s34rn3muj@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tgq7dxd4jwke8dPo"
Content-Disposition: inline
In-Reply-To: <20231128205841.al23ra5s34rn3muj@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
Message-ID-Hash: QQ66BWFRGA7YT6HIJNGM3A5OABCT5OGJ
X-Message-ID-Hash: QQ66BWFRGA7YT6HIJNGM3A5OABCT5OGJ
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQ66BWFRGA7YT6HIJNGM3A5OABCT5OGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Tgq7dxd4jwke8dPo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 09:58:41PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Nov 28, 2023 at 06:49:23PM +0100, Thierry Reding wrote:
> >=20
> > On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> > > Merging
> > > =3D=3D=3D=3D=3D=3D=3D
> > > I propose to take entire patchset through my tree (Samsung SoC), beca=
use:
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> > > 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAut=
ov920), so
> > >    they will touch the same lines in some of the DT bindings (not all=
, though).
> > >    It is reasonable for me to take the bindings for the new SoCs, to =
have clean
> > >    `make dtbs_check` on the new DTS.
> > > 2. Having it together helps me to have clean `make dtbs_check` within=
 my tree
> > >    on the existing DTS.
> > > 3. No drivers are affected by this change.
> > > 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus ex=
pect
> > >    follow up patchsets.
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
> >=20
> > [12/17] dt-bindings: pwm: samsung: add specific compatibles for existin=
g SoC
> >         commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f
>=20
> You didn't honor (or even comment) Krzysztof's proposal to take the
> whole patchset via his tree (marked above). Was there some off-list
> agreement?

I had read all that and then looking at patchwork saw that you had
marked all other patches in the series as "handled-elsewhere" and only
this one was left as "new", so I assumed that, well, everything else was
handled elsewhere and I was supposed to pick this one up...

I'll drop this one.

Thierry

--Tgq7dxd4jwke8dPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVvGTUACgkQ3SOs138+
s6FxSg/9GYBUdx6f/ahQ2fBXUlTXv4ykvHBiRJGfUuGbx8MJaPoRIbAl2gcTnwnB
fRuGMlQD0DbWYLVejy/wzASn//gvqYVp3sjPDSKFuFoUMSVNRBAJJy+DmdHcb7ia
ZnhU2k/meHpKnCP8Y3im5k1MEbiexQ8OShzyVx8ARU/Y4BXrj2SfODDI/KGVYFa9
Wfv2b1eoatUBHcDzYbjxow+qyza8E9Ym2b06HRhzQOotMSxLdBF5z1KP/29i4IWj
WGwsIEbPMmM4rLFmQ45IRWz7GwZL8Fh3afeaUijl2cytKINUgBSkvqPsQPx25FdO
xKMJHxcPjtERjnHorOGLNpotMNldbw2VRtQDD57QcqqqDBagcqpHfXwsOfuyK6v/
r9p9gAFCFjF/bpQlKZdwLZ/+khDrkH+UH3cR0OBq/mN1Sb4JcSKbLwv8pGE/F+v6
NXrlp9Xwx/gIyrRL6yijGCW50TXnE06/w4NDhHwi0tdio//f1BhQTWWYVKOArw0B
Dpsrq/yDC2xJ7afiBdfKs+nTFuujmcTS1OguA5v+Ww/8a8Bp5bsBJj5p2GkbJa/3
dChdDhsGy9As2KbUN2WYE+VIYUudcMiXbB8oKf+/kxhgwhSNgP+nirXkV422hKQs
0w+Dee6JI0kKyL3S8AjiEW3ZmbKqJpV30pgyRVUlSIXRjoljdzA=
=cbqG
-----END PGP SIGNATURE-----

--Tgq7dxd4jwke8dPo--
