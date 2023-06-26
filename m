Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F9673DE3D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7A4155A;
	Mon, 26 Jun 2023 13:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7A4155A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780385;
	bh=WMnyc76wPixdfN6eTs+gBg4osYliPCF6Ft6xT2Ch/o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWjjopD4OY5kEZUTlVxEkP0Q0a24W3VwL9Rc2Q4BDL12Ukh28s/JzskoaUdJyLjo1
	 nu0SGHAoZWXpXV9FsqvwYhYQFp/CG7sHEOsp1U3NoZ7+4IlQ4vH5CB9vbxc73pIV4K
	 Xgku2LHvjG8wFpqTIyu50OpgwyDsJm1rUOkFeDRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4761F8051E; Mon, 26 Jun 2023 13:49:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65CF2F80093;
	Mon, 26 Jun 2023 13:49:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12157F80246; Mon, 26 Jun 2023 13:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1117EF800E3
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 13:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1117EF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jem1nIw5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23B2160DDF;
	Mon, 26 Jun 2023 11:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788C8C433C8;
	Mon, 26 Jun 2023 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687780156;
	bh=WMnyc76wPixdfN6eTs+gBg4osYliPCF6Ft6xT2Ch/o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jem1nIw5r5mSLKK4uESM0pz0NZbdpCCfk35MvqualwJ5PeQmgF5z4KrvcdkbC6R0h
	 aNhlRlCXVXiYnKTp1vfRwC9gRbl1uOFliiex6vP5xDuFO5Kuik2mtU+jIqpU98no14
	 x2iK2iAKaUNF8S/CxXZMyVKVtywmNNO4v0aS5GJ+ypaEW15gSlZJopyOgoUbmaBqGH
	 ANpcNOqqKshGEHP+zRyb5DFYcqNdrFQePbvsnIby1oMUbuMMWuPm7IvuUueZUGP1dn
	 UAq3kuXm8U67PKzp+5ig/ESPdJB8i6+53j4gmvyxL42ydPj9TeR3UMj4tYXJ509izs
	 wHhYE5EJiZTKQ==
Date: Mon, 26 Jun 2023 12:49:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Always store of_node when getting DAI link
 component
Message-ID: <9fbe4924-5c02-43f7-b47f-bc290fd07e67@sirena.org.uk>
References: <20230623-asoc-fix-meson-probe-v1-1-82b2c2ec5ca4@kernel.org>
 <87jzvrksi2.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3CDck05rY9k9by3C"
Content-Disposition: inline
In-Reply-To: <87jzvrksi2.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Nihilism should commence with oneself.
Message-ID-Hash: NJO265G4SOMY5DVJCUOAGWRVEZJN52RC
X-Message-ID-Hash: NJO265G4SOMY5DVJCUOAGWRVEZJN52RC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJO265G4SOMY5DVJCUOAGWRVEZJN52RC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3CDck05rY9k9by3C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 25, 2023 at 11:54:29PM +0000, Kuninori Morimoto wrote:

> > The generic snd_soc_dai_get_dlc() contains a default translation function
> > for DAI names which has factored out common code in a number of card
> > drivers, resolving the dai_name and of_node either using a driver provided

> Yes, indeed.
> But I think we want to set it under lock and if ret was no error case ?

It doesn't really matter - there's only one possible result, and nothing
should be looking at the dlc unless we return success, but yes that'd
probably be a little cleaner providing we don't ever return early.

--3CDck05rY9k9by3C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSZezcACgkQJNaLcl1U
h9BtEQf+INsq9seLiC6VRG4jRO5+qnpMCXRjGjCNE3PIyshFO46vmTbThLBD2WJ4
82psfBGU3USI8oSeR3uDUMsi7lh7hQq9n8IxaFVbr0TZTaD2EYctvzdRcT5zMbTY
hJ9NHlvfD/Yc6ryT3g3NMYMaHn2ghSUBBN72ihz3PR0VFJ5h4KZc1V6Xw84k7Ekq
qcLCNcIowshKkOZMF2DtiHh4LaPQxkOlKLpkWCdnwYlNPtLjAISRr5kS/8McMiVM
c82esARYyN56ajMf3pcxhZ0tr6kgCKIaydBh/6DQXLuybXheb6SQqb4BXvuervF2
9Mc8GrUj2SFs9x5B/a4KtbK2QRAJUg==
=8Ks5
-----END PGP SIGNATURE-----

--3CDck05rY9k9by3C--
