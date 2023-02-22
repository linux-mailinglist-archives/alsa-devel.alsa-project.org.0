Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A869F734
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:58:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D17E7E;
	Wed, 22 Feb 2023 15:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D17E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677077900;
	bh=0oI0QSVIZmrYGzm5qMI9FC9aY3lntQPLGoGkeh0XrTQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QTZL0i9iLMBF+7OcZJE0NwVEWPRi1XrI2zzDxKRCEBaE+e0XeVFUwnjCygRyhQ7xJ
	 1TRiWEr8TGo7NIdFKWYnZVp9u5AlQPkcdRROi6unzb8AT9VA5/F7++1YxaGTxYHqjm
	 Yk9yDaXVG6UYd4gIq+oAljVtrpPW5SJmM0D+UY8g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6C3F800BA;
	Wed, 22 Feb 2023 15:57:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13B27F80266; Wed, 22 Feb 2023 15:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DC8EF80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC8EF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zhr39bqj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75A6E61487;
	Wed, 22 Feb 2023 14:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7FFC433D2;
	Wed, 22 Feb 2023 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677077837;
	bh=0oI0QSVIZmrYGzm5qMI9FC9aY3lntQPLGoGkeh0XrTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zhr39bqj+x9QOvNA+gfkh257ZaUD7gPdpSBgJ2x/L5bH8xIqU5qhpEHpMC/GMgXhO
	 0ulwaRWnaBj6fhmCnbcdPAwn2y+qIb0xDkNN3M1RUBih935hUPxP4gWtiWxLyCPvMV
	 kKeiejMm2q0cKVSluDw685zojrYX9OvB0Gi/Sr0JxMT6lw/g241bbusWK8ilMJ9RAn
	 e+XTiYjBARNyh9n0yQitJByY/7dQqpvvHM8QcNIP4CaeY/DurtL5TK1w1Tkg1h+A8y
	 rEZtoUT3Ff5fu5N1cQlRoJK4qxQVfS2Nde9UAmD71lleNujfrZIbqGj4Un+IBMQ+Jc
	 +ftVYAfe92jmw==
Date: Wed, 22 Feb 2023 14:57:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
Message-ID: <Y/YtRtSqFAQj+AZU@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
 <Y/UcXNueAmrrhWG0@kadam>
 <CAPVz0n01YWQ6FY9RDsa1rw_36n=NKpRLokFiVTxLsMDpQEd4YA@mail.gmail.com>
 <Y/YYaVhE7WwqLIey@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SP3ot0dvarn2c/WQ"
Content-Disposition: inline
In-Reply-To: <Y/YYaVhE7WwqLIey@kadam>
X-Cookie: My LESLIE GORE record is BROKEN ...
Message-ID-Hash: HYHEL7CLPJTI567E6DJOTIRW247SQZTU
X-Message-ID-Hash: HYHEL7CLPJTI567E6DJOTIRW247SQZTU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYHEL7CLPJTI567E6DJOTIRW247SQZTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SP3ot0dvarn2c/WQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 04:28:09PM +0300, Dan Carpenter wrote:
> On Wed, Feb 22, 2023 at 09:55:52AM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 21 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 21:32 Dan Carp=
enter <error27@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:

> > > >  /* Mic Jack */

> > > This comment doesn't make sense now.  It was never super useful, thou=
gh.
> > > Just delete it.

> > It does. Headset is Mic Jack + Headphones combined. headset_check funct=
ion
> > performs check for a Mic Jack component in plugged Jack 3.5

> I feel if we need to discuess what a comment means or if it even means
> anything then that's a useless comment by definition.

If the device doesn't have a distinct mic jack then it's not ideal to
talk about there being one (as opposed to the microphone on the headset
jack).

--SP3ot0dvarn2c/WQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2LUUACgkQJNaLcl1U
h9DohwgAg5B1RDs7IHmHXbAnOEJot3PmpYe4ZT8mvWdsipVsEOmicv9Jq5TgOMBr
8tj3IwItO4yzHJDcN3A/dwYZFVppFntMyVC8RRP13DSzXdwquSXpfnKm+JPoV7MQ
pgCCVTw6NMhE35JfxkzGrvEmJdnPYzxkeDhjOKpNLL+j5w/BntNBUfvtf1mLv0HL
9kHud7beeXTyY6TNXMnm33ZeUjXpGsSXizJgvDrxl+kjr2KG02uS6ad/7fdNhBK3
AnNKzJbzKuydQFAWbBGDQUg2qwkcBzyo8aQm1rpw7WmdS839MaeU0lxyM9aa3WiQ
ndwCYvC+WVNlJ6v9nFJ5XeCtAIJBGA==
=g3uz
-----END PGP SIGNATURE-----

--SP3ot0dvarn2c/WQ--
