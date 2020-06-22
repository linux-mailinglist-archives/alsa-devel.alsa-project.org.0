Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3425920359D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 13:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1491686;
	Mon, 22 Jun 2020 13:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1491686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592825112;
	bh=lKPO9e624hVOJb9ys3y9YhyfWRz6FABHB2gyDaZqj2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F1iPjquVCr76y6VtAspjLYta/UJPVPEc3br16sDpHjdjXpNWjaFMJmbGWANclnOte
	 uyX5n7E07y92KgXjnkNJziBI+oPZNhyWr/3AGgNMOjVcZKLi8OV1ws+GwjlyO5Emvn
	 plO6uNMkW57c0oKs6UAvy0sT2GkO63sO/IsmuFTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7BFF8015A;
	Mon, 22 Jun 2020 13:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB9ADF8015B; Mon, 22 Jun 2020 13:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A4B7F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 13:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A4B7F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rMxttB7F"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 992FE20716;
 Mon, 22 Jun 2020 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592825004;
 bh=lKPO9e624hVOJb9ys3y9YhyfWRz6FABHB2gyDaZqj2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMxttB7FzTiHJEa3tbN3WPIxJHrnt0u8SEYPYobsr7cEH3VUpxi+DC7EAYV+F1X4l
 8QFmz85HHyuh+539leKlpPpSOYSEf3r8Spfs8V/djIJZCuNccky7F0Xl0iBTosnKqA
 kGowYb1JP0oSedLkJKguEaO6QduxXMYsGqSEVmGM=
Date: Mon, 22 Jun 2020 12:23:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200622112321.GB4560@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <20200621233352.GA1931@sasha-vm>
X-Cookie: laser, n.:
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


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 21, 2020 at 07:33:52PM -0400, Sasha Levin wrote:
> On Thu, Jun 18, 2020 at 03:39:30PM +0100, Mark Brown wrote:
> > On Thu, Jun 18, 2020 at 10:30:46AM -0400, Sasha Levin wrote:
> > > On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:

> > > > This is a new feature not a bugfix.

> > > I saw this patch more as a hardware quirk.

> > Pretty much any DT property is a hardware quirk :(

> Which is why we're taking most of them :)

That's concerning - please don't do this.  It's not what stable is
expected to be and there's no guarantee that you're getting all the
changes required to actually make things work.

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wlKgACgkQJNaLcl1U
h9DxBQf9GXl9yCwJEINWq/Z/dhvqydIs7W9lZH5AwwYXFPMJqBw8hFXOc0py8n1n
KyNasLuU3f6KllPb0/5OVx13fx8zGxkO3R+oGlO3Efu7Hy8PGBKDUCvSN3ot0Y/D
G63LKSioz3J8TW/YESn7D1sIHgBeomqhnaXeqeXv3CvcOzSwNrxo7XEFdFezSfby
QMKNjitxBVEiU5JiuuhpWhQ3A9f0bsNONgYLXX/j2nUFF2GTaoVqqAeuVHJsRtvY
AxfBsxyFqe85oe6t6oelQ5DoiQTkEJYKTGpApxIby0uOXAoo2PgF4slrPeEqa+ZS
tp+7ng+EvDqFhLMnHiZq1WTtbV02bw==
=kpI5
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
