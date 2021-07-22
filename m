Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 556483D22A3
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 13:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F04C16DB;
	Thu, 22 Jul 2021 13:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F04C16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626952787;
	bh=m5i/HGha8p73s8l9UOhqIe3ohallavMbtB2eJoF8dHw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xmg3bR4xR30GKzdGjC4LyK7wQ6mjuc+GRX4ZKmre5DVoDK6cOqpYUpPY2gH1ECXsT
	 V6PrZYGg+ECqcNfO13M3LbjcJRm+5f7ruVVMh1ZAqkMna40No/JNSNGT8OcpGsG8xN
	 ZDFwVibo2tW7zfplltdRAFHPsoEvkEZyyYpXBLDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D20DF800F2;
	Thu, 22 Jul 2021 13:18:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC565F80227; Thu, 22 Jul 2021 13:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A74EF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 13:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A74EF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JEBK1omV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6B1361222;
 Thu, 22 Jul 2021 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626952722;
 bh=m5i/HGha8p73s8l9UOhqIe3ohallavMbtB2eJoF8dHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEBK1omVVNb4fuMVVM27w/UH/Ucwfs3tY8nZqwGZVKfIRmoeYNeUChHyIGDXaA2N1
 gV3iU+Y1LjXKrCORtoGuQD0I8wmVktwnhlCvVuEMsCo5qgWR0jKTjYwRoTQvkTg1WS
 RLz5L7NjJeIugpM/uH1hwrsglgA4s56t1QgeLuQ4gayIFNyGVB2l4XlXt2tRXijm5a
 gzmgWwNbcrsAbyOsnRXUGfgVIekMjF6S3lkLLP94wbeu3sJH+xRlLA385Ym7awvKbV
 XXUHp2cNoomrqps6dQ4rlgXRqtiCJiY53y9ryvuttn3hW2C9jB9mNMt7eK44FxStQu
 hh9iWCQSkOpHQ==
Date: Thu, 22 Jul 2021 12:18:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: Don't show messages about deferred probing
 by default
Message-ID: <20210722111835.GA5258@sirena.org.uk>
References: <20210721183603.747-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20210721183603.747-1-mario.limonciello@amd.com>
X-Cookie: Who's scruffy-looking?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: markpearson@lenovo.com,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 01:36:02PM -0500, Mario Limonciello wrote:
> Nearly every boot with a Lenovo P14s is showing
> acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517
>=20
> This isn't useful to a user, especially as probing will run again.
> Downgrade the message to debug, and only show errors.

dev_err_probe()

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD5VAsACgkQJNaLcl1U
h9D8kgf/ZJkAkmRVujjjmqs004qoXLAApHs0WXOcLWSxzpb9vG9UUgE1MAaxGLHx
tOBvB3hY1FZHYemyA01b8/9C3OMLM9nfhrjCiA2YTFKkA+OK5dkklTiXSZHKqvQv
7w+YRV7XZD/K8vgl5x/FrO1uA43T61mkn47teSTN/DPEYymCjKQlwUjIQBmsJTcc
TuL0kQYH5SnWm8x8ldrTb9LV829Szk+hGrKYFNFC0WTFDWSzIe3QppbbbNJVSkFN
c99c9J2s0hiKrCCVV2UTCK4KxJLyjGfyl/WQlKUO05IwE2Jb4jDy1xPV9oi5qeG5
z+IK88B3HuK0XP3FS7RXnU1EVM5aQg==
=+FI7
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
