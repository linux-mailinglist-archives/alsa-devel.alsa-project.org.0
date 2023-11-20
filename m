Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555047F1545
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 15:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 351B1839;
	Mon, 20 Nov 2023 15:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 351B1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700489243;
	bh=kp9GIj/goDcYsosIrC/QG7Ed0kq5bMEXQ3yCcvXKf7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jAYnScisUxVsd7QdPrDFIIQ3zSDTATEgmOpH6ruM1763lmlhUaQ9yTbIFDLdlINP3
	 qxRCByvjBgc2pERotv+t5wrIsU9UkgLgs1pE63Pvh0/3RH0hRDgo4IwuEDUkH95IOZ
	 ro/nyNx0mA8IBQlNFQ6ORutLsStwfAay1fss8W5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BF5F80093; Mon, 20 Nov 2023 15:06:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2026DF80249;
	Mon, 20 Nov 2023 15:06:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00593F80254; Mon, 20 Nov 2023 15:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A40BCF80246
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 14:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A40BCF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A1VRC4aD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BE1461226;
	Mon, 20 Nov 2023 13:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3451C433C8;
	Mon, 20 Nov 2023 13:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700488774;
	bh=kp9GIj/goDcYsosIrC/QG7Ed0kq5bMEXQ3yCcvXKf7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1VRC4aDFojjm/UQogsTGuCn+zMKMIt7xImvA/CpumGE2XX+jYts3al4PcCRKW/+L
	 gOn0NhLIcrSs3rfG74IoGuU/U2uBM9mH+zzwoW5wSqkuKGEB8D1k17puMeYZIefsDJ
	 E4oRU1ZZ/n77yaHaa63uUJjQB2jILK+evLvOzZU5hj+yzTt3uspanCgzKDRsRCausY
	 buPLO4iqshwPnClWLQnJ0Kr8JKUb0ssGDdiKmB0Zf0IZEWZ6KMeUuGlAsY1HoELju1
	 VIodMcFB4YgUqP4guOo3F2OQs0Prq2un9Iq1ad/SjCyqz6BwQuypsJQNPqRk9tcSAt
	 8i4Rp0FMvTKzA==
Date: Mon, 20 Nov 2023 13:59:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] ASoC: cs43130: Allow driver to work without IRQ
 thread
Message-ID: <0e0eb66f-b4e5-4c6d-b788-6ea66dddd705@sirena.org.uk>
References: <20231120104153.76248-1-mstrozek@opensource.cirrus.com>
 <7d8bf03f-e9a5-405b-8753-a360f46a04df@sirena.org.uk>
 <e9698a93d2eeae8c00cfcebdfa69f686849ded0b.camel@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AITBtLlNg/X8BBBy"
Content-Disposition: inline
In-Reply-To: 
 <e9698a93d2eeae8c00cfcebdfa69f686849ded0b.camel@opensource.cirrus.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: BDZP5MEYZWTUBAH6D6XPIGXKGGFJ2KGD
X-Message-ID-Hash: BDZP5MEYZWTUBAH6D6XPIGXKGGFJ2KGD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDZP5MEYZWTUBAH6D6XPIGXKGGFJ2KGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--AITBtLlNg/X8BBBy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 01:51:33PM +0000, Maciej Strozek wrote:
> W=C2=A0dniu pon, 20.11.2023 o=C2=A0godzinie 12=E2=88=B631=E2=80=89+0000, =
u=C5=BCytkownik Mark Brown
> > On Mon, Nov 20, 2023 at 10:41:53AM +0000, Maciej Strozek wrote:

> > > This is to support systems without physical IRQ connection. The
> > > device
> > > only requires the IRQ for a couple of internal delays, this polling
> > > mechanism is a fallback when no IRQ is specified.

> > Your changelog here doesn't describe the change - is then intention
> > here
> > to remove the IRQ thread (and presumably open code?) or to make
> > interrupts entirely optional?

> Apologies, I thought the word "fallback" would describe the intention
> of making an optional way for the driver to work in absence of IRQ
> rather than removing the IRQ thread. Will send an amended (and
> unnumbered) v3.

Your subject line says that the patch is changing things to work
"without an IRQ thread" - the thread specifically.  This conflicts with
the additional text you've added in the body of the changelog which
talks about removing the need
for an interrupt entirely.

--AITBtLlNg/X8BBBy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbZkAACgkQJNaLcl1U
h9AAdwf/arV0PhcfCyqkCFakj1BG46dMC7HVL4Dzu+KIWk731zcL7HMZhPF2p/Dd
bP4EiQbsY31kAqZp2Xw/RIy0O1a6fkmGp5wC0Sjgg/gNPDIzrAhlYxoBqevGg0Ps
GR27N690fXA/f12/4htbB2ToBFdqvpIRlYvkKdpovz8x/9iaeGmwZxTkVzUG0VcS
hVucwQCowQU9ii2P+4iQsY1wKElbCslbw5uaA/MSBs/DD3En2pImFNqdnaVoIObk
fx61W/rfDoWMASGXx0cVb4xnHFGmth79GWm16QBx1NWn8tR+dmccgO2m7KmVzRZJ
nJkb4OrE+QoFeEo6br01/lWG7iWpPg==
=zt0C
-----END PGP SIGNATURE-----

--AITBtLlNg/X8BBBy--
