Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B59142D2E28
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 16:23:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12CFE16E8;
	Tue,  8 Dec 2020 16:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12CFE16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607441038;
	bh=agNWNjQCc77UMknNZ+hqc7G36GIX7edrBXKF11O9ZzM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDJKSXezFbDRN7Tht/kCvDtqhSJKHmlhnGUvbzlx5ZlVozsy/9n3+sprw/034jTjw
	 He5UyoDp58vwMji3uinQAQr+uv3h1iIn/eXPqfGG9snabVxe7HOz0B+4nekdZ3xYSR
	 ScYUMwTRMMyWd/coKP2bWr2mYoW94QF2FmQdOKkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1ABBF80218;
	Tue,  8 Dec 2020 16:22:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63133F8019D; Tue,  8 Dec 2020 16:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B24F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 16:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B24F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fnRyKhdb"
Date: Tue, 8 Dec 2020 15:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607440933;
 bh=agNWNjQCc77UMknNZ+hqc7G36GIX7edrBXKF11O9ZzM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=fnRyKhdbPBeKAFCf3aXCoNV3ZIWToIpoE64c032G+yHtSUTK/S/HHMXgTahu4fMDY
 Oikm0kgBkpY7GOIBCGVvuqjpmHM7bALrYyG4ByqCRwx6Fj5ItyCf0MbKIzoobdCisI
 5pHp7ueSgRLzLMnvCEd2xK8IBmJkAWaznEAf8Qf82AmbgDEgT+Iz9UBKav0UIB2Wk+
 i1XOjmIXHhf6943Fl5PD0O54ALLJlQ7ywXsj9pBfHNbJoh+sfja/WeSJI6i8eu1O7z
 64yPbnTC/SC86928VoZobnbBuCICyrjLXSFQz46fGfx8Wfsjvb3G8AhTQNpzGBySax
 z9cR+1M8b1z6w==
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: Re: [PATCH v6 0/6] Tegra210 audio graph card
Message-ID: <20201208152206.GF6686@sirena.org.uk>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
 <20201207123131.GB5694@sirena.org.uk>
 <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
 <20201208121312.GB6686@sirena.org.uk>
 <a6ecb66e-db25-dcfa-4a70-d9b2fad75cd9@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Content-Disposition: inline
In-Reply-To: <a6ecb66e-db25-dcfa-4a70-d9b2fad75cd9@nvidia.com>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com
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


--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2020 at 08:18:21PM +0530, Sameer Pujar wrote:

> > I don't seem to have them in my backlog so either there was feedback
> > from someone else I was expecting to see addressed or some other issue.

> I am pretty sure that it is not because of any outstanding comments, because
> I got none on v6 and previous v5 feedback was taken care. May be this is
> because of the doc dependency I listed in the cover letter?

Ah, yes - Rob said the dependency needed some rework.

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/Pmh0ACgkQJNaLcl1U
h9B7Zwf9GGi3vqDul7G6TFq9/yQzz54/ViItyV8CHg0CuGmqI+LRO8c0kCH7q1J1
JqIf1OJiTxZrmKJJntJls8toh5GEJyuHnp9dUgv13wmRzgBduecr96Xzk3epHjTM
fs6k3x9+IvGuCCAZ5gL2znrPE/QSR48jSjJczOz5WFyxC35dKU85Nl6Tb4/80npN
3qYKZ6WuXnge3/ckBH0s9Wvmj4EN77cGAbkOvJxbG5QgAYlHzK6FEM+RzbbUtMbv
SugMrZ4yKT8a74dv+jXNKztE7vephHPcZNSBM3G4E2bJ6uurnUJQdBrRgkGNKc3S
UiXFEjmtP6XMmBiEcaVJQIFTYGY9bA==
=QfyK
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--
