Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8C7F1482
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 14:37:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9DA3A4B;
	Mon, 20 Nov 2023 14:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9DA3A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700487439;
	bh=PHdu57Wzp+xZqOVNY9Pteh5+H3/OUfTVYEQwZtnjgaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NI5qi0i4yspcy3ivSn+33fDVQAJqhaar6yoiPeEwZr0zXHu9LUC6CcbdQ4yofyATh
	 rdj4WVjr6zZazscSz86zDwWlNipWc9fbvOlw9MHMuyjHOMHL6q/d+JUjqqchdv+005
	 GvvQfC0SbdatrPDUSpKfVsWuZc0WhgTJeIKzlaSI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E9DF80246; Mon, 20 Nov 2023 14:36:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E35FFF80249;
	Mon, 20 Nov 2023 14:36:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3633DF80254; Mon, 20 Nov 2023 14:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49BFCF80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 14:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BFCF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Adn5+nCR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 470B3B81117;
	Mon, 20 Nov 2023 13:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD7EC433C8;
	Mon, 20 Nov 2023 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700487020;
	bh=PHdu57Wzp+xZqOVNY9Pteh5+H3/OUfTVYEQwZtnjgaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Adn5+nCRh7+2esCt06PpWOJ6Q7Sf9wGWzyL8OZ3xQ4KTuGsVYCl41uUSDvoZM1Qgh
	 xYH9OzH46SDNykHqua+lZM2VDAFNJNwAhIazL4+HhuPw4y+ePFT4d4rp8a2u9mWmRp
	 PnCbz5w1ll14XS8VhdWdJuOuFS0/ORhBUxPN9LZrU5nM5XwUgSrSc4kXfWDjHIHbGB
	 JT3utmOA0eqk2DInnearZCiHRLiXuzkgmY4JBzfMGPTQF/bM9Mo53CgDyCMs/E4vK7
	 vEYpztDFwP8Cf9bC1VZuImptYoTJCr3dqt3i1A+skz+dJKGH7DjDkXQ+BECL8kWBh6
	 +vMaV+mcY9SLg==
Date: Mon, 20 Nov 2023 13:30:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
 <20231117164746.0589e955@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuVabfiR1A06kEJd"
Content-Disposition: inline
In-Reply-To: <20231117164746.0589e955@kernel.org>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: NB5HAOBMF5UZOJLQXWIO7W6LS63MJRMJ
X-Message-ID-Hash: NB5HAOBMF5UZOJLQXWIO7W6LS63MJRMJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NB5HAOBMF5UZOJLQXWIO7W6LS63MJRMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HuVabfiR1A06kEJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 04:47:46PM -0800, Jakub Kicinski wrote:
> On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:
> >    - Removed Patches 6, 7 and 8 (patches applied)
> >=20
> >    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
> >      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'

> I thought someone (Mark?) asked for the networking stuff to be put=20
> on a branch. If that's still the preference - is it possible to factor
> these out as a standalone series, too?  Will they build on their own?

Yes, can we *please* at least get the generic non-driver bits of this
series moving - they seem uncontroversial as far as I can see and are a
tiny portion of the overall 20 patches.  Patches 21-23 look like they
can go on a branch in the net tree?

--HuVabfiR1A06kEJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbX18ACgkQJNaLcl1U
h9BhUQf/Y8e+dECLekhRMQLy8O0p4YRvMtVtYbyazFL0PEJyvuI93CnL/nqRzW/7
x6zzsmJn2uab1/SmDbu8m5yE2PQDQs448v2ZAIcvu9SOQoH9ph+y/Li1dsCx0MQS
b+VU0vl6YJcBmn8ycRkgBldpLgOoc6HU2tss4FQBAlR2R0Aw6KG97Smd+Py70Yyg
ewedo+nXh+OkOHdJiG3Fbcbw6GwLEoQB+jj2MFy4QA3VilnEu+NBvRxIoegctggc
mPB4GWRQNg9fb57iy6IqsME7oUq1hUb4SJ55O7s88qko3hFJ4ediuncLVP25kbl/
HNP87K6I1Mebqh5LHTcVOvfo8zM/BQ==
=n/vU
-----END PGP SIGNATURE-----

--HuVabfiR1A06kEJd--
