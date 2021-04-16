Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084923624B5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 17:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8306616AA;
	Fri, 16 Apr 2021 17:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8306616AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618588639;
	bh=JEJzzQ+tdLRQxK9H7PGh2vMSOhSroN+byz9JFysxcq8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBS65/VLfNrEFqgLhn76NryUas7YBS1Vri4Jq8HD0W6RzC7r6ouUBmnSOVKk4Vj0n
	 LxIHAsA32CZ0lY73YUZdO0dtRhkIEenaEPMiPUjyTsItKd3+tMKKnVLMUT5kDXmy9O
	 MAfk3JERzm6AW6qysgyA/HlN0WWUEQqUhR4eR2EY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBAC6F80269;
	Fri, 16 Apr 2021 17:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC23F8025B; Fri, 16 Apr 2021 17:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F9BF80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 17:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F9BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uxWk475Q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 246AE6113D;
 Fri, 16 Apr 2021 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618588539;
 bh=JEJzzQ+tdLRQxK9H7PGh2vMSOhSroN+byz9JFysxcq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uxWk475Q0YILN9uDHYFrNZQ8ukASmPIutEUmTOAFlTe984ffKwEEMIVVCub3ibQu0
 KBv33XMEEdYyEE8BBnNRgIgnsAQ/7bhuLIRKoY7DC8nsino2sFLfD0tlkVZS6k/Bbp
 cag8aUF27tY/+zPe4R1crDKp3W5QV/BvhkyhaM/FLShmEi5Xv/gHEGYFTWZBdUDfrI
 fut3nOygjzko26A7GbnNfADKExCr3HeXcxH27I+4eiQggI5GmedKEj1JC6LLxc8pDJ
 k2KwJMm4khokBX7Pi7YlxxCaQazItCB7f6gpYDbv+VhfJ7TMRqmHHc/he8sQvssyLm
 757hrI1pJqOYQ==
Date: Fri, 16 Apr 2021 16:55:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too
 many links
Message-ID: <20210416155515.GG5560@sirena.org.uk>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
 <1303b932-5226-0ee6-8f41-fd896908b045@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RDS4xtyBfx+7DiaI"
Content-Disposition: inline
In-Reply-To: <1303b932-5226-0ee6-8f41-fd896908b045@nvidia.com>
X-Cookie: Snow Day -- stay home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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


--RDS4xtyBfx+7DiaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 03:49:34PM +0100, Jon Hunter wrote:
>=20
> On 16/04/2021 08:11, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The DAI counting code doesn't propagate errors when the number of
> > maximum links is exceeded, which causes subsequent initialization code
> > to continue to run and that eventually leads to memory corruption with
> > the code trying to access memory that is out of bounds.
> >=20
> > Fix this by propgating errors when the maximum number of links is
>=20
> s/propgating/propagating
>=20
> > reached, which ensures that the driver fails to load and prevents the
> > memory corruption.
> >=20
> > Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Code=
c/Platform")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--RDS4xtyBfx+7DiaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB5s2IACgkQJNaLcl1U
h9AY5Qf/fknqCPfwrUTMIAXJVdVHFkSouCqz2DiWvpg5eePtbojW0X1Ot5RQ0Pwn
OaDVL5DdzXQ/gVk2EOp2Piv2NNlAnKGNuEApKMhpI64XGRIgXAp32ZoTJwqHCfnV
GEL7zMXWr0/ddIpDxnB75RRfM85U1so+KFC1zYX0MQJkr6WxQeMn5/vNxUfg8XiP
EU63NDsfcsaklSP6CoZeFNFfqcyHbueD5ZLUAdx6tQ3g8lklzIPbVQvDMpkUz4OU
CpC5HQbj0IZlATSPQsk5fkhv8yud+MJXH+k1YmQeRdEU5u8p00odp8FKd6uyS/+D
bNmX4wcz08PitzQEH8IWBG0nJ6t18w==
=tM5Y
-----END PGP SIGNATURE-----

--RDS4xtyBfx+7DiaI--
