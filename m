Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 315FD313779
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 16:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213B6167B;
	Mon,  8 Feb 2021 16:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213B6167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612798048;
	bh=+WGRxfTf3SmVnOnMu2BEXZkFM4poWL99zz9p04NYNew=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4jsKG3MHHQlZFh0+oDI5FUyTCRQX0uW1VDAQ+GRjBTjBkyA0dxbBUwIZ69kLrjEO
	 cb/2MpznV0m4wl1zlfl61AUzZ6yeSaqAvqh8klFump7dPpSkOAXK9dQVJlA8JRQhkB
	 abJMYAM4oZ/et0FD/MLnBn6ur2C2Tu/L0URpmIdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 032B6F8022D;
	Mon,  8 Feb 2021 16:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04E6BF8022B; Mon,  8 Feb 2021 16:25:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D33FF8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 16:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D33FF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NkFn+etQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9205664E88;
 Mon,  8 Feb 2021 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612797947;
 bh=+WGRxfTf3SmVnOnMu2BEXZkFM4poWL99zz9p04NYNew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NkFn+etQECgOBWC7AHCUONlfgYrTpB7REwo3Dx2gyTEr07MvWLVOyQAaUw1GhJttP
 HmHUw+dOhngtE2AZYgxtxvfrYsds8ed+AYuPkEdlRKR9xr/bCcCPjbJsfBju5wUDld
 tGwAwq5MHfLU5Xc+bxeZMg/pRCQjbjOzDhKNwMgW5/fjtzJsXrTUtPToVhCRM2NNIF
 IrQdFmGmpyABU57iCM/x35usc5QNuJj6+zjnUPY/HWyQ74nGYk0VLv5nZGBX2H3mdr
 ytCPq53Q3K9EwpfRdPNLfNZ7JEqO4v8kLomU2eUi0DUieIpYIUj2EvI3IdiNcDGrf8
 IePqUKcO6AjEA==
Date: Mon, 8 Feb 2021 15:24:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210208152455.GH8645@sirena.org.uk>
References: <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
 <20210204150456.GN2789116@dell>
 <20210204151139.GE4288@sirena.org.uk>
 <20210204154058.GP2789116@dell>
 <20210204194213.GG4288@sirena.org.uk>
 <20210205083416.GR2789116@dell>
 <20210205211101.GL4720@sirena.org.uk> <20210208083350.GA4766@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline
In-Reply-To: <20210208083350.GA4766@dell>
X-Cookie: You will triumph over your enemy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2021 at 08:33:50AM +0000, Lee Jones wrote:
> On Fri, 05 Feb 2021, Mark Brown wrote:

> > No, it's that there's plenty of drivers like this that are listed in
> > MAINTAINERS but still generally go through subsystem trees - this is
> > also true of for quite a few MFD drivers, you tend to get a bit annoyed
> > (quite reasonably) whenever I mistakenly pull MFD changes for them into
> > one of my trees without syncing with you.

> Driver Maintainers in MFD don't sent Acks.

Ah, that's not the case elsewhere (and there's the case where the driver
maintainer is sending patches for their own driver which causes a bit of
confusion).

> > I guess, or at least a pull request so it's in my tree and I'll notice
> > any coverage issues.

> Okay, I'll process it.

Thanks, pulled it in now.

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAhV8YACgkQJNaLcl1U
h9BUlgf/U+gi/WKLvvsMpVe1g3YNDDGoBm2fcVXM446X3TG4lLtzw1bbeLtOXagm
m+s6zM8Hcw3mD9gZzINHbnMyv/DVmJ/4a/oc1PFlX7y/nVNjxbNQzolruFwDoCaW
mVG72RJ5XWdOASUuvwRi1V7BesNLhGjHzvfR1Wp+l/eSl8+L6jbqf58i5kzeFOOA
TSYfowD80iu2dRTxcN5Rg8gpafuM5zbjqWo6oz6zC7BZ8X2C9OENi0imPJj/YjLS
5j3Lc1gfumC8wts7vBjuYMU0g6oVfflvJvAT6BGUVaFO3w73yehcyx0ZyTtULyEN
zaJEesqjbat/0sDdNFnjsp8Jx2w6Cw==
=EzRc
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--
