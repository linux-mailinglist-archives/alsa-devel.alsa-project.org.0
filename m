Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D93E93D0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 16:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90EA21772;
	Wed, 11 Aug 2021 16:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90EA21772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628692991;
	bh=567DqEJ2CW8yoSvw1a5r0eKHS+MofAlVun4Dh6mctKw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHgbcqmPF2k3OOYb0oVyDOqyMEEfXvvzK6FIgZxYli9jpFWwnG0NPiUoIgPuszhzP
	 PLxwJrlHfyQf4o/zWzvFxGn/EHTUypGvtkbfC6QM7OIugypq9uDK3qAg7egzqCzris
	 c9uCoJ/LpvlEPHqTJyHPXn+RLiSJ8LhB74GWgrnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88CFFF804B4;
	Wed, 11 Aug 2021 16:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6023AF804B0; Wed, 11 Aug 2021 16:42:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0D8BF80148
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 16:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D8BF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m4nzoWsz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 839BE60C40;
 Wed, 11 Aug 2021 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628692922;
 bh=567DqEJ2CW8yoSvw1a5r0eKHS+MofAlVun4Dh6mctKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m4nzoWszuVSWD73z+V3eW7ZyJ6MkRW74PpSMwcdiB/R7qEeMB1o8ISO5BGDySgBJB
 3uqKiK55QBIZIP2CGQ2d2udlzk1wS83qUnCPxWJxQiXoALMiq/tzoNfNEi3QgKai3k
 Z4CaQVTgkMUctnm2fYN3ns33UQp/mHzrP4cjGDL+dyGiZUnC5lH1zAzNQaEUTvmz4I
 6pV0OhGv7VDZqhKvHDz+trOk0szvz10ayMFJWWCvJ4M5SN+Dn5nhKoTxzjBlq3b4Xn
 XzBy9ExsbfE4rMRCAX6vrzrI2ZcKaWq1jAoaqnjtWwA+mncFk2LfjLl2lJXKZN8sF1
 IyUAKbNbmVUVQ==
Date: Wed, 11 Aug 2021 15:41:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 04/12] ASoC: cs42l42: Don't reconfigure the PLL while it
 is running
Message-ID: <20210811144143.GE4167@sirena.org.uk>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
 <20210810153759.24333-5-rf@opensource.cirrus.com>
 <20210810154959.GD4704@sirena.org.uk>
 <c194004a-2a22-5354-9042-3ce811236319@opensource.cirrus.com>
 <20210811115637.GA4167@sirena.org.uk>
 <bae1afcb-d983-c17c-d932-3afac16df501@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline
In-Reply-To: <bae1afcb-d983-c17c-d932-3afac16df501@opensource.cirrus.com>
X-Cookie: To stay youthful, stay useful.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 01:21:24PM +0100, Richard Fitzgerald wrote:
> On 11/08/2021 12:56, Mark Brown wrote:
> > On Tue, Aug 10, 2021 at 05:27:45PM +0100, Richard Fitzgerald wrote:

> > > cs42l42_pll_config() could check whether it is already running and skip
> > > configuration in that case, but that seems to me a rather opaque
> > > implementation. In my opinion this doesn't really fall into the case of
> > > ignoring-bad-stuff-to-be-helpful (like free() accepting a NULL).

> > This doesn't treat the situation as an error though, it just ignores it,
> > and there's nothing to stop _pll_config() generating a warning if that
> > makes sense.

> It isn't an error. hw_params() will be called for both substreams
> (PLAYBACK and CAPTURE) and if one is already running we mustn't
> reconfigure the things we already configured. The DAI is marked
> symmetric so both substreams will always produce the same I2C BCLK.

If it's a noop reconfiguration then there's a case for saying that
_pll_config() should just silently do nothing anyway regardless of
issues with reconfiguring, though you might also want to warn dpeending
on other expectations.  If it's not a noop reconfiguration then
presumably the new configuration not taking effect might mean that other
things aren't going to see the clocks they expect.  Either way if a
reconfiguration gets introduced via a path other than hw_params(),
either now or later, having the check in the _pll_config() would catch
it.

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmET4aYACgkQJNaLcl1U
h9DrmQgAhIQarTTvYNjhmlbeS0r6u4MqTIjCzyT8my/0LDFR/3QbeNOLzkt5BmaN
he52NPO92gWzet0lby3zYDerMvDsHZniAfV/c0U+u+ZhN6wRWMzNbAfH6VR6ijgw
fL0cT2Gtr4C7WGWnDrvBNJxx1QgiQjIZD4d8wTT1lKZNWEYK9gUUyUA9OEYR4YFM
wVvKPIS6N2zRx1kRauCCy4tOtq3k+MorJ04T6VpUKc/72CUmx8uSI7Fc9Z5H0UO6
Do70jom82Aj6dEbbSWCyXHQnxaB5JiuUkr/7TLXVea2Gfr1v1ssxc1R4uXlo3O11
mADp4anO/f5zLjL4+o5tC5ndq2RCew==
=Io2A
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
