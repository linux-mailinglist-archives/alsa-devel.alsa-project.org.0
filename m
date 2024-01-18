Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AA832164
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 23:08:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FFDC209;
	Thu, 18 Jan 2024 23:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FFDC209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705615687;
	bh=iseU8jQdo5TbasDTsLDq2FqVB/V3B0OwmtPqZ4AdvHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M+JNW5lxBDHUJB6QUHDGYJGikd4tUWuZmLumLaRLzdgljC8VrY4nJ0URjTK5pLei1
	 T4yDSqlp1H4WfiocfssQ7n9ZkfxSLoVAHxBPTuB+rduCsYdPs6cFBWyN9VpST50tJj
	 oKX6ipKKUk36RlZ0IWYrZ/twSqb9CLMJCKQLPrLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9930FF802E8; Thu, 18 Jan 2024 23:07:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F36A9F80568;
	Thu, 18 Jan 2024 23:07:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 705FDF801F5; Thu, 18 Jan 2024 23:07:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B65FFF800F5
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 23:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B65FFF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f6NCM36u
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1531ACE20FC;
	Thu, 18 Jan 2024 22:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596ECC433F1;
	Thu, 18 Jan 2024 22:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705615626;
	bh=iseU8jQdo5TbasDTsLDq2FqVB/V3B0OwmtPqZ4AdvHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6NCM36uAeF0IfTRbUH03Lri3cCsoKdvkLTwbchpoXLnitcPpd2hQvJji/o3GJod9
	 FVsOKYovvKJDaYreDsXBWTluZtFP5GoI6bAR+GGtV7JHSdpUd303Qj0bmzYzNX0V1s
	 +wSwD8JbKfT/moIH/rGvb2peKnPGeoeRhrPa57Qho/NdTgQpG/TyPa4+HuQ3k6BA4O
	 9RK6KXgdBsb9Mtu0RrVHfyNQjAm8BEKErTj6Q9H38l9ubDqPgFndwYsRpcKVBMXorN
	 j1gY6KZB3CaOyOabqW28lhoKZxU/V0KufzcJ9hlvOLMTIDS6WMWXJvCYEYYVDspYy3
	 W8yfgeaCBxdhg==
Date: Thu, 18 Jan 2024 22:07:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] ASoC: cs42l43: Add support for the cs42l43
Message-ID: <b1889bb0-2b9f-477c-80d3-a636b9017ea4@sirena.org.uk>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
 <Zali4qxdegY7H6eY@surfacebook.localdomain>
 <aec96f5a-b759-48c7-a5ec-bafe3bfa5357@sirena.org.uk>
 <CAHp75Vd6JtW4ddbSPXUp6WgEdBJizjwnS-XZzwLcXWWLxFWp-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71ujX23WTb2DYuTK"
Content-Disposition: inline
In-Reply-To: 
 <CAHp75Vd6JtW4ddbSPXUp6WgEdBJizjwnS-XZzwLcXWWLxFWp-w@mail.gmail.com>
X-Cookie: FEELINGS are cascading over me!!!
Message-ID-Hash: 247HAHAKBUF4SW2SAE4DZJC5N4TCU7VP
X-Message-ID-Hash: 247HAHAKBUF4SW2SAE4DZJC5N4TCU7VP
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/247HAHAKBUF4SW2SAE4DZJC5N4TCU7VP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--71ujX23WTb2DYuTK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 10:46:28PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 18, 2024 at 8:11=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Thu, Jan 18, 2024 at 07:41:54PM +0200, andy.shevchenko@gmail.com wro=
te:
> > > Fri, Aug 04, 2023 at 11:46:02AM +0100, Charles Keepax kirjoitti:

> > > > +   unsigned int hs2 =3D 0x2 << CS42L43_HSDET_MODE_SHIFT;

> > > BIT(1) ?

> > Given that this is writing a value into a register field called "MODE"
> > it seems very likely that it's an enumeration value rather than a
> > bitmask (and similarly for all the other places where you're making
> > similar comments).  Please think a bit more about the code being
> > commented on when making these minor stylistic comments.

> I read a bit further and have given a comment about this as you put it
> above that they are plain values.
> Please, read my comments in full.

I did eventually find that while going through the other comments but
given that the earlier ones hadn't been revised and it was all a bunch
of different fields it still seemed useful to highlight, if nothing else
it was a little unclear that your later comment applied to all the
fields you were asking for updates to.

In general in a case like this where the code is already in tree it does
seem like it'd be better to just write patche for the stylistic issues.

--71ujX23WTb2DYuTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpoQMACgkQJNaLcl1U
h9CCeQf+I21xMOQThraPXK85uU2p913UhGWbaP7HY9FD+DAulq1voxw9sDv5OoFD
ciLzUlxTW5AGYUk1xAKqSHaxLf7PYAztwmpSXO3NBY9khrbEbBTNpcylDRzKgrQx
ZhQAbiD54n6wKFCn6efN+Rh+8xXxP+XvRd2Dh8CVeWydMoRQaKs8GB0SnXr32F3M
irPxz+pFuUEi6uYVqn4FPY3nowFTSqTiL3AzjtfXsK1MTl2MDlwcJdld0jr6bCk3
GzrjYt+MDyyjj2Gk7LzEvNrZfgggAOH3KCNttfwRL9yO/bV7981VyOmdbzA7wxPL
yQVLQLMim55rdMKYjPcsaLFGmCTEfA==
=A+RS
-----END PGP SIGNATURE-----

--71ujX23WTb2DYuTK--
