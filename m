Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757514CA9E1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 17:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 039561F26;
	Wed,  2 Mar 2022 17:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 039561F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646237500;
	bh=kfBblESBiE4/YJ1a5p6rpR3290nfywtLFhp+/AB4t/0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sAwtOGjvbNH7kP9gCd4eZirYn/JJqCH79lnM6FWow4ZCmMsN6CNv2o+LW4Ei8OFS3
	 Lp3xk4lNESMzTbuP7qWsTwzOM6fR6+fQyDxLDQ6NB9KQ9DUvGTdxegZfQlONrz/Wge
	 EO6ZNvhe9LuCVA+FV7cTJvMfO9CGP0A9tyD3Sp1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C35DF8027D;
	Wed,  2 Mar 2022 17:10:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C4DF80154; Wed,  2 Mar 2022 17:10:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B18F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 17:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B18F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VySpElJs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A5BDB820CD;
 Wed,  2 Mar 2022 16:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B854C340ED;
 Wed,  2 Mar 2022 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646237427;
 bh=kfBblESBiE4/YJ1a5p6rpR3290nfywtLFhp+/AB4t/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VySpElJs/lO7mB130aOs/z55Vn/TcyEWXdTe4et5WpXI4DJeyHwu2pLD17hINQpC6
 fZDQ9/vrlFoRwUgtRpcH7268ykqH89mBzVs7f+eZLCGBzS74wYD9rzAUnAEndGBc2y
 /evYj8sfvnGC+2syz3GvcyskSIoxMKDA6EcaonqN2OLacoAf/M4oblrfCp7IGTYwso
 r6uQM6TaUQJdvzUq6CB0IWRilQ5f3A6y2DGjbuzUWrxwtK3y6s/DH7aldsFXPCI29R
 dAV9s7D0Da1NfuVfAZumEvvjwUzMitwRLjQFykq+WChVLHBv1e+ywN6VQgU8mA6WHp
 PGRZiofzl2QOg==
Date: Wed, 2 Mar 2022 16:10:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 7/8] ASoC: Intel: sof_ssp_amp: rename driver and support
 cs35l41 amplifier
Message-ID: <Yh+W7qDWC73cAQ+i@sirena.org.uk>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
 <20220301194903.60859-8-pierre-louis.bossart@linux.intel.com>
 <e597f364-96b6-08b1-3c88-436693c65b04@linux.intel.com>
 <33d27810-a023-f2f7-5218-e406fc7c13e5@linux.intel.com>
 <05ee9a2c-e7dc-1f75-da7c-39b30464bd08@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PCgZmmshjalLmNUC"
Content-Disposition: inline
In-Reply-To: <05ee9a2c-e7dc-1f75-da7c-39b30464bd08@linux.intel.com>
X-Cookie: The sheep died in the wool.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>
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


--PCgZmmshjalLmNUC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 05:05:05PM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:

> I think you've misunderstood me, I'm not talking about squashing, but
> splitting patch 7 into two separate patches - one doing rename and another
> adding/changing things.

> I was looking at:
> +	links =3D devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
> +					sof_ssp_amp_card.num_links, GFP_KERNEL);
> +	cpus =3D devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
> +					sof_ssp_amp_card.num_links, GFP_KERNEL);

> and wondered where sof_ssp_amp_card.num_links comes from, and it only sho=
ws
> up 4 times in removed file, but 6 times in added one, which tells me that
> things changed, but it is hard to see what, when the diff shows whole fil=
es
> being moved instead of things that changed.

That would've been a bit nicer but TBH it was fine - I've already queued
the patches.

--PCgZmmshjalLmNUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIflu0ACgkQJNaLcl1U
h9ABPwf+MvEA7YeIF94uB5z2ik/sVzAfkvhLADCSDSVBbLGG6Purqkp7eBeuOKsC
khivisONuGkhqWT0/K3lc9J1K0zU0nC6NSWsE6c1/sVLmcQz4KnEeOHOcaJuUjKs
Nw6SiUEMOpOvAKKC8n1Z6wtSUw1w/Y4hkc6PMis1apxPp/pQbgMHSXfS+GkoSaaj
f311ePYSgu9q6mhAOYtC7hnZTJltfiTfKV2VuhqkcjRIm/1jz6XFVOzMYjlgxgYq
r1ZnKAKX0oVeFxeJP+sKPGeM/T3le4g7grWIFh6KpqrzZjat8vs1WBobdewHjT6A
CHuDckc1EVcUjdZfxaO+OHfV28y6Pw==
=jfJf
-----END PGP SIGNATURE-----

--PCgZmmshjalLmNUC--
