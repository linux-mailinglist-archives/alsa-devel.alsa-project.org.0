Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40574283B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 16:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB3D7822;
	Thu, 29 Jun 2023 16:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB3D7822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688048661;
	bh=Cl64NSXCEzp6krj0LeHcOjj1IvL5UV/UkBxiVL5pfRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwCLjcQL9YV6DnBA0cY7uVN0UlKNLn3wbo8P9rqD21BGva5GNqeQ7mAK7LY9KBLCJ
	 nsAq5Mr6HLAGe13zaUY3WS/ft0pb8sz8zP37jo8DQiMwOzl6jZwPwttFTkfmV9m1Kp
	 6PXLNXt1sxnPlvGuQC6KoNSXhLBVyLfIGtHvswfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 808D9F80246; Thu, 29 Jun 2023 16:23:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E923AF80212;
	Thu, 29 Jun 2023 16:23:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9F0F80246; Thu, 29 Jun 2023 16:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AFF4F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 16:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AFF4F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SNWmiWH9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5A9661558;
	Thu, 29 Jun 2023 14:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BB3C433C8;
	Thu, 29 Jun 2023 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688048595;
	bh=Cl64NSXCEzp6krj0LeHcOjj1IvL5UV/UkBxiVL5pfRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNWmiWH9irc2j4RkMBv/9Lr+OOEPhO8+7gllg5GMU2kYJ1sRCLUi+8aGhR/4jajS4
	 sfmmPGG5XO0Za3VeCJGqrlIxPkpPdGsbyqbtIg0nAeTdMVtPLt5J2kkW0k+nzzxYkW
	 uVlWAkWA5mRDJfTSJJwlV9G43kkWxaMNc/atMWGF6q4KgwKhrEoxGOt61gDKUYZdlu
	 KirAn0GnsNghKIJZ8XhswExP3th0Nnv4Ypu8yHGno8XN8jlnMx/EnEf438Ac7xvMnd
	 7I5rVxp5DiWpY2iVmzM21nOg2TXjJfrcBUIrK6oaZ+paeeyHN9xjX4N8cVuI7MqbYj
	 eWsRKsECbVJIQ==
Date: Thu, 29 Jun 2023 15:23:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Always store of_node when getting DAI link
 component
Message-ID: <1d74d2ed-0c4d-4fce-849d-5f2288394569@sirena.org.uk>
References: <20230623-asoc-fix-meson-probe-v1-1-82b2c2ec5ca4@kernel.org>
 <87jzvrksi2.wl-kuninori.morimoto.gx@renesas.com>
 <9fbe4924-5c02-43f7-b47f-bc290fd07e67@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p3xSwJ/njDdW/FTy"
Content-Disposition: inline
In-Reply-To: <9fbe4924-5c02-43f7-b47f-bc290fd07e67@sirena.org.uk>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: QCN6TASCWJBG2PBDPT2I5GBMS7ZEVQS3
X-Message-ID-Hash: QCN6TASCWJBG2PBDPT2I5GBMS7ZEVQS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCN6TASCWJBG2PBDPT2I5GBMS7ZEVQS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--p3xSwJ/njDdW/FTy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 12:49:16PM +0100, Mark Brown wrote:
> On Sun, Jun 25, 2023 at 11:54:29PM +0000, Kuninori Morimoto wrote:
>=20
> > > The generic snd_soc_dai_get_dlc() contains a default translation func=
tion
> > > for DAI names which has factored out common code in a number of card
> > > drivers, resolving the dai_name and of_node either using a driver pro=
vided
>=20
> > Yes, indeed.
> > But I think we want to set it under lock and if ret was no error case ?
>=20
> It doesn't really matter - there's only one possible result, and nothing
> should be looking at the dlc unless we return success, but yes that'd
> probably be a little cleaner providing we don't ever return early.

BTW that's not to say don't submit this as a patch, just that it doesn't
need to get applied as a fix.

--p3xSwJ/njDdW/FTy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdk84ACgkQJNaLcl1U
h9A7NQf8DiMYBVpbql+uhhR4/aQO3adkGIelIoUtUaDRAb9Qvsuliz0afLzBRmLY
iXJEQ02Hak6oJrt0OiPFct2vtsZ8E6LPJf3P/WirIlmiUpLIShr9/feri3Nt7gIo
WCja2NjjWjfmHj1fkZxjXnQ3CRB4+byV9cyeRjfSok65A6P/jLMif6GlnNp0ieFK
zwaEmmLGzayLL6UTekwL2gU/I8CI+yp4zVgAkIe6utxTSQJ06mz/HEBL1np/+qFs
hQf4zjGdVUGpDQ+O9yS2P7CpOQPQaay4bvM8LRGkIvFZWGsMSkS0VBbsK7FiLpI6
PXqIUOfTj4BmMRnqc5vmLVMPfKgKrg==
=W096
-----END PGP SIGNATURE-----

--p3xSwJ/njDdW/FTy--
