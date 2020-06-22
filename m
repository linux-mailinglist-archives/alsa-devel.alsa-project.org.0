Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B602034AE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 12:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2306F1655;
	Mon, 22 Jun 2020 12:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2306F1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592821224;
	bh=9Y/rtCRYD4aEh3139uBPC2Fcw4zMJcS1iHtnd8Z1zRw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kB+jQ0WfZD8JLO07Me04B3ugr3Jj2YcxEemwKsZ/RDNe7dv3UT4JXqa3osYgyrl26
	 lu32204tYr78kzbA7jbmjRTc4EcPvbT5KVxJtx7aX1t6CdJjMxU0CTXf6OhGc4FjiF
	 daATe3n8TIa2Uh8RuzJgJyFAsOLbYXqzu74e4FX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C5EF80157;
	Mon, 22 Jun 2020 12:18:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7036DF80157; Mon, 22 Jun 2020 12:18:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5E42F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 12:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E42F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IVLnqSFm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0E1020675;
 Mon, 22 Jun 2020 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592821112;
 bh=9Y/rtCRYD4aEh3139uBPC2Fcw4zMJcS1iHtnd8Z1zRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IVLnqSFmSbtxv9lgC1ENDKsj6DhcVTbwS/S24NdVUCpfcA+ZAhDbxODgSOYeXHfyl
 OppQ5vIzrO4c+eCi/drrMwa278Fn5w1kJ/b8Hbn2wCg5eMTtHk8ZUABZmzpDcTsr1n
 QZOUX6IvzvYLEoyxt58sbiak1b3wTuFSOcf7IdzU=
Date: Mon, 22 Jun 2020 11:18:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 130/388] ASoC: Fix wrong dependency of da7210
 and wm8983
Message-ID: <20200622101830.GA4560@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-130-sashal@kernel.org>
 <20200618110258.GD5789@sirena.org.uk>
 <20200621233453.GB1931@sasha-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20200621233453.GB1931@sasha-vm>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Wei Li <liwei391@huawei.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 21, 2020 at 07:34:53PM -0400, Sasha Levin wrote:
> On Thu, Jun 18, 2020 at 12:02:58PM +0100, Mark Brown wrote:

> > This is purely about build testing, are you sure this is stable
> > material?

> Is this not something that can happen in practice?

Not outside of build testing.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7whXUACgkQJNaLcl1U
h9BDzQf/RzQdCcVRGWZhfoT1fNalQOZMEnvqtp8b6Y31rlwZ6+PGxc525TkQJ3yM
zgniKy6yj9g6df+e5VG7TAeYXsSG1WT41FMruuBxHeYcBYrHtA/tR8ojN2vaNXRU
dngRsHbjO5iL1+qutTylc//yk2R/ytncWq/4PqECCdkcReGt9/kqfgBOfltTRfNU
DkjR5I5c/FkGveWlgWqIZOjMx3NP7r00oor56FhRbs+IYu0OrhWk8GJd4m/BoxY0
GGvm8Mizp+qFdOTq0ff9CKJm9tWVLHk1uo/YfDAukmHrO+fgcmhckj9EU4vpoGT3
4x26/YcBwCErNU8cUNW3gl6+VlESkQ==
=4bpC
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
