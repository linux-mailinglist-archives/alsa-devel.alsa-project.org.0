Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05ED79D3BE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 16:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80E0A4C;
	Tue, 12 Sep 2023 16:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80E0A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694529187;
	bh=nCDXCDraqsGo2IZGYAIOuK+jrylfUNs1NltItNEvSsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPegAiM5Y7oRY5cR5KCBAPEfFrJTq+peR9OObth9zdjcrEUndztvQVHJ4WMpbtdfc
	 12i0g1+P5Ky6RM1/BruTnaq8jxkCOhVAtqoRvpSAV/q6urlJsY/kyq3PG8UapgIHYP
	 MiA4NAe1GyQyaxMMR2yYtiFo5fjZA+JN4fBRb7fA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0702FF80549; Tue, 12 Sep 2023 16:32:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B74F80246;
	Tue, 12 Sep 2023 16:32:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AAE2F80425; Tue, 12 Sep 2023 16:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED703F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 16:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED703F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IzfFF5eS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A2F1BCE1AE5;
	Tue, 12 Sep 2023 14:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C545DC433C7;
	Tue, 12 Sep 2023 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694529113;
	bh=nCDXCDraqsGo2IZGYAIOuK+jrylfUNs1NltItNEvSsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzfFF5eS0jKjFYDvO5isyKITSFx9Gnoou/xv7WTkxJg7qowQ87WM6A8bDeU4fZUs1
	 v+AU3kBJHoO/qvhkLBzY1LHIpY+mFTnKXIPiUxYl/w3RS3wkGKbFB69UBKlSVcpHoO
	 R9UMiesRBocyKoVCX9r61gVBb0m6a5HpXfKUD+oA6NSEynLpVPIsfvefLOWbcbq1lx
	 JGxEqnf0JXnj8shzNl1oXaeaaONd/2cX0VDR3d3YkhmkxsgAFwQcbMbGIsdIR/eV5I
	 SgC7qCUyKhiuK2IY0LWMINLlX//w2erE1Q9rltkmWhDbYoOgH/htDJbxJx4vH1fshy
	 XtHNCvawzd3Vg==
Date: Tue, 12 Sep 2023 15:31:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101505.225899-1-herve.codina@bootlin.com>
 <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rHoxlvq7D/pkDAXf"
Content-Disposition: inline
In-Reply-To: 
 <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
X-Cookie: Mickey Mouse wears a Spiro Agnew watch.
Message-ID-Hash: RIMOARM5NTVCZ7YINRNIBJF7ZSXS4QVR
X-Message-ID-Hash: RIMOARM5NTVCZ7YINRNIBJF7ZSXS4QVR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIMOARM5NTVCZ7YINRNIBJF7ZSXS4QVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rHoxlvq7D/pkDAXf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 01:04:56PM +0200, Linus Walleij wrote:
> On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootl=
in.com> wrote:

> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*

> I think SPDX mandates that you start the tag with C99 comments

> // SPDX-License-Identifier: GPL-2.0-only

Not for headers, they should use C style since they might be included in
contexts where C++ isn't supported.

--rHoxlvq7D/pkDAXf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUAdlAACgkQJNaLcl1U
h9AGMQf/fLsnOOVZlCeXkVRLWX87qtu4s7nr7P5jfwyYxnA4Bhl8MwftHW5rxDOf
TJcMOnHaQLx46ThWnYrWFopJsLO9g5x+NTP78wZTRCXJaJp4usJtpbNzUm4JAgfr
wJ7T2LLNlVFW5eJfODg+A+sL23DKqJ0B6MwZDixKhNM0tRYibE5ULV+DGzqxyvgz
yBkeRf5GWl9c4qVLP9Qg2VGx/9jbeOjiYGTd3LWeqJ6HxR8EItWZvKS72fGhOw+t
dp3VMrMnK9/HtTllRrE+m9GWdtkjG+FjaBGfp8LhzJ1IvYZb+Hyic+EVrTIQ+aC3
xmRd5GYPdrIG1w50Eci2Fa5Zqd4N4A==
=vkfj
-----END PGP SIGNATURE-----

--rHoxlvq7D/pkDAXf--
