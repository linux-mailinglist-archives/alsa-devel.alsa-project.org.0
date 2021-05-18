Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912E387FB4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 20:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93371178E;
	Tue, 18 May 2021 20:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93371178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621363002;
	bh=XJyZ3btOtpI/qD2+8BYa2+IPxWF8tqgUCMjGDNYO7j0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aFzzjpteCJuOqFjJL+eNNKsxmCv+ywDBvNw/9w75+xTe5qSWiKyVSqz/vqCD76DQp
	 ZOtnkMVC66enhdc0/FptJrz91rxETeLpLMZHXfbHXHa0oODCo2jbhzDNOouZoPcaFw
	 /GGRUvMhmmHbDxwjGwhSHwpohxEt+5yst+OJz9Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6935CF80272;
	Tue, 18 May 2021 20:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96763F80257; Tue, 18 May 2021 20:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F000F801DB
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 20:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F000F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MlWq8wvn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B63286124C;
 Tue, 18 May 2021 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621362939;
 bh=XJyZ3btOtpI/qD2+8BYa2+IPxWF8tqgUCMjGDNYO7j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MlWq8wvnyveocW9is2F7cFDzcSYS+XcdcSp1EVdHkvPHgJLASrHkFjcHTM4a98BT1
 VTx6mCu4MAjLVydRigQuSEDFImYDJ5FSJ8KrA5YgYxsMJhfh26m2xZkuMlDagACX8Z
 kRaL/wRDtLw8olb4WaruUFmtK+Im4l6jzi27dx3WyvpvT8VsRe3GAEs7Sx4E6txZRa
 5h2NhaotJ6uNjxw98OmD2HBT0i2NL1QPT4ic4kxgbuID6WqYj0ODVz04s8nfEiJGS5
 NLTKAs5KKrO6EEuotfAPRSRAKuDctKdYoGI8mJEhyPCxJMQAIRnlN+SWdK322UQcMy
 NlYbKJhv94KAg==
Date: Tue, 18 May 2021 19:34:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210518183455.GE4358@sirena.org.uk>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <20210518180949.GA949047@robh.at.kernel.org>
X-Cookie: Radioactive cats have 18 half-lives.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Rowand <frowand.list@gmail.com>
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


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 01:09:49PM -0500, Rob Herring wrote:
> On Tue, May 18, 2021 at 03:13:56AM +0300, Dmitry Osipenko wrote:

> > Squash all machine drivers into a single-universal one. This reduces
> > code duplication, eases addition of a new drivers and upgrades older
> > code to a modern Linux kernel APIs.

> Nice, I never understood why each codec needed it's own machine driver=20
> (and typically in turn compatible string).

It's generally the clocking configuration, things with fancy clock trees
don't play so nicely with generic systems where we want to configure
them at runtime, or things with complex routing in the CPU where we
only recently started getting bindings that were functional enough to
use.  Tegra is fairly complex internally.

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCkCM4ACgkQJNaLcl1U
h9AZvQf9HjR/2m9uTMHCDFsce0DuGGYDqEzCiG5qOqeuuV4xjqIU+osUPQo4iKSK
kMg2Vjpq2bsjm1SWhgN34VBADGb8rrKl/yR/hGaveQ+CCJ+r3P972ODYG9eqpje+
KBaVc1sDnacC62AWm00l9ztcerToy17fTH0LXHpYYsFH57aapf/qDovV9uCn6BC2
il3CtEgBbir6jirbggzz4CORYPJGnbtxzHdW+SzrqgzS1gyAIqMzlgisNROi6UJr
F3ivHT3fjm7W7zZPSkWZVIZW0QISJe1m1e4am6L7Zn2YEIlh//xj58TbBVHaibMQ
uC+KH59xh17FYm2T4gTrsrC8ikJKpg==
=bgh3
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
