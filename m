Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE51FF4F1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 16:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2931798;
	Thu, 18 Jun 2020 16:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2931798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592491282;
	bh=etN4J2cAIG1MAkGuXWgQccKMRYufQ7F4qFAKChIOWw4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJopDWu/Mi3+jCppKqudNCnNDfkFFT3shHxEhyjBffxyHjwnTq0qjH20KYLp3nrjd
	 S+bjC/LUEyT/Qbf25O7X9fwNovbD1Pl9RuZaNmm9gTfTYulUksTEuNybr+MVYHmxb/
	 dWu1mtpFLRkBZXzrmWuGWFkATmocaDo3wJdKgrk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B903DF8010E;
	Thu, 18 Jun 2020 16:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34572F80116; Thu, 18 Jun 2020 16:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 837D8F80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 16:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 837D8F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2U3qhHIs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B82220773;
 Thu, 18 Jun 2020 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592491172;
 bh=etN4J2cAIG1MAkGuXWgQccKMRYufQ7F4qFAKChIOWw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2U3qhHIsheqY690iXD1qI+ppqRsMzOpm+NzmomO4TavPiWPKf3REImXF7dg36dTEV
 rOLYl4hv03TMsebFcRG1Jqi/47TFJuX0qZDJr5GEkWNWojjz/sWVGx6XZj1aRdwm67
 /58MLjC3dSXuFKj/enxe8zkb+YKjMumDQJK27Wqs=
Date: Thu, 18 Jun 2020 15:39:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200618143930.GI5789@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dMdWWqg3F2Dv/qfw"
Content-Disposition: inline
In-Reply-To: <20200618143046.GT1931@sasha-vm>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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


--dMdWWqg3F2Dv/qfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 10:30:46AM -0400, Sasha Levin wrote:
> On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:
> > On Wed, Jun 17, 2020 at 09:01:41PM -0400, Sasha Levin wrote:
> > > From: Dmitry Osipenko <digetx@gmail.com>
> > >=20
> > > [ Upstream commit 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 ]
> > >=20
> > > The microphone-jack state needs to be masked in a case of a 4-pin jack
> > > when microphone and ground pins are shorted. Presence of nvidia,heads=
et
> > > tells that WM8903 CODEC driver should mask microphone's status if sho=
rt
> > > circuit is detected, i.e headphones are inserted.

> > This is a new feature not a bugfix.

> I saw this patch more as a hardware quirk.

Pretty much any DT property is a hardware quirk :(

--dMdWWqg3F2Dv/qfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rfKEACgkQJNaLcl1U
h9D4egf9GAyUHzaf4lnzptpzMRgqOKL3WVybRfxzlzkgBkgbNNF3Rxgl2TGJpoPu
DQIe6X4ijMZ/LNocdFZi+BWCr/rh9ml0dUly5TEXbwjHQ1Im5SBdJgy9tLq1yjPD
OY1sD5faXc2gH1A+z3LQ7xYFpNnpRwug4G+SbyiPtfkPXhIXKnx+cF+tdcqYw8hz
dDcihB9jR8gPEYGqPBQOacSjd969ocvYYj2npO9TztHNXfwvFwNxErrg7pebwrI5
7NbFOUdEU7aLAPIx2AfHoHTD9FzDGvqY37Q/UZZYqqFxRQ46ZluGN1cyuOet3sEb
83lXKDitdxTNZOmNGYNNCEZL/dcdTA==
=Ja8t
-----END PGP SIGNATURE-----

--dMdWWqg3F2Dv/qfw--
