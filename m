Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552B25AE724
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0147A886;
	Tue,  6 Sep 2022 14:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0147A886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662465797;
	bh=3GH7hLJBzpN0pESX5zoNW6x7RBgnP3xD1YCmlktbkSg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GcRZgLXY+Jilmzu9uTyazATa65lNZHmOMm5KjNwklyjvcODh9BJQOh3/tPAVGLy4u
	 92EDcMAEw/zO4HvPt5JWddRnE8WLIMypjN/hCA2FTtCWxZoIOXsZNpNsCJV7f+10i9
	 lnooI734DVye2SmvYd/smzI9BAoTuE0hzpvuIyKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2602EF804AB;
	Tue,  6 Sep 2022 14:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA0ACF80165; Tue,  6 Sep 2022 14:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFA5AF80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA5AF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NuM+AR6j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0488DB81893;
 Tue,  6 Sep 2022 12:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C617C433D7;
 Tue,  6 Sep 2022 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662465735;
 bh=3GH7hLJBzpN0pESX5zoNW6x7RBgnP3xD1YCmlktbkSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuM+AR6j1VUHq6MwyVoIn84U2K8ydUSSJPsbbSluzTP3l07Je5ng+IacvmVpGsxnh
 kICXN6/23z+JWxYKj0ciTLD5ggnF4Zgvw0VSnwpZl0e00xpgYeVdmPcRlTj3iLZuXs
 cy7meLybZEa0GEwoIxy+ucDOPfybZ4oDUO0B2l425Su+nU1zz2jTn4C6cVAUgM4RY3
 m/Gq37nR1whlpNIPHJEHHfMUSNMy4c/KOCVi2kD0cULbaRpXcO/k+4me2niqaxgF3K
 fKnkVOMpOKKsyvqf9CDwcu+Q/E20jtu8OmxPbAzYEs6fc+MCNxP/xhb4GuOOFRfJdr
 csHNmghkaKgsA==
Date: Tue, 6 Sep 2022 13:02:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/4] ASoC: soc-dapm.c: don't use kzalloc() for param on
 snd_soc_dai_link_event_pre_pmu()
Message-ID: <Yxc2wzbZsSVZNf8Y@sirena.org.uk>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
 <871qsp9zsm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Af2jHRUfLUWzF9G2"
Content-Disposition: inline
In-Reply-To: <871qsp9zsm.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: divorce, n:
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Af2jHRUfLUWzF9G2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 11:17:29PM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> Current snd_soc_dai_link_event_pre_pmu() is using kzalloc() / kfree()
> for "params", but it is fixed size, and not used on private data.
> It is used for setup rtd at end of this function, just a local variable.
> We don't need to use kzalloc() / kfree() for it.
> This patch replace it as local variable.

The reason we're allocating it dynamically is that it's quite large (608
bytes on arm64) and is starting to get a bit excessive for allocation on
the stack, especially when you're building with some of the KASAN type
stuff that increases stack usage.

--Af2jHRUfLUWzF9G2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMXNsMACgkQJNaLcl1U
h9C4egf/W7gs/UHCQw9Qs2jX3CZufKayzvnDmgEej+YYhMYHynBReiylj/6HrkZz
1Akc+zI9YuE1v3K+EBcF/dWetm8S0qrqNACBcLWwjXlxb/c2oFDJX5SIQ173fI4c
oLr9ESqjoocCIixE3RRbbah6i5JRkE/diaDBHnyslTy28/i+d6Lz2hrCxKtJghJN
hDyLhFHAExTpc1TXPTpPZY/jRCttnjCvCP8LYy8Cuvyn2Oifw5+VoOVvHh4EnLRJ
zel18PJSXWGd1QPQ7QpZPByl3H4y/VhrSZwvoCeH67aeWvghDkzpNKPUej8664Wy
1EfApTIeu0tQfFlWHp92H8ih7+NNdA==
=pVjc
-----END PGP SIGNATURE-----

--Af2jHRUfLUWzF9G2--
