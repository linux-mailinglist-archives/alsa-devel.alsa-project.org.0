Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A594039BC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 14:28:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808D316C1;
	Wed,  8 Sep 2021 14:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808D316C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631104084;
	bh=hBJEdND0+TdIgnAIhoNTUiVWIoTiCjwpdhj1K/Ss5Rg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/0LzH9XuclDLNlurzh0jR5BFV6boO5Z0bnbMvHXzbqc5600p7lHtmnsDbN1HVMOS
	 0jsuXRdZcLH7xsY2o0v3fSiXFuUWQGIj78lMSj87K6Kzye4EpFCUrNgM3hqeSTj6uh
	 dcIpJWcoKhOgyJBzWQkEjRYiSXiKDrCHlnR7NQHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C72DFF8049C;
	Wed,  8 Sep 2021 14:26:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04F4EF80149; Wed,  8 Sep 2021 14:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C54F80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 14:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C54F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a3YfGlkF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C70EC60E77;
 Wed,  8 Sep 2021 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631103997;
 bh=hBJEdND0+TdIgnAIhoNTUiVWIoTiCjwpdhj1K/Ss5Rg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a3YfGlkFHoKcIInjVEEa1ZX2ALubp0X2byiwewn45Ixd9t7O6+9uKnwCn0ie+Kd0M
 bJO0KeaJslGyN6wMFQNfXBku5G3ENmh2h42f15u51nBAFOdtyWH1bTXWFK6NHtCJ63
 J5KiVXBvwnXLe8kAdQjmJkXyDey3sh6KHZAo3Sqn+LaGiv1oU06wbtMmFXp1Se51sT
 UQ/YmKHUu0RxAHornODQ4BidYkeRQgImM5pXYFF6VRXFld71QNroOLF64kXj2pUlPB
 bbxXcs4mcDbulja0APt+2pWYxXUKdYz2sYoVUZzmEv5ir6BWx4L7qPB8pcmwkLFbq1
 HmGvWYEC53gLA==
Date: Wed, 8 Sep 2021 13:26:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 15/21] ASoC: qdsp6: audioreach: add q6apm support
Message-ID: <20210908122600.GD4112@sirena.org.uk>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-16-srinivas.kandagatla@linaro.org>
 <081e6734-a258-6d21-cf66-f00bfeb38b04@linux.intel.com>
 <b1cfacb4-70b9-7146-00d5-9d680297d900@linaro.org>
 <f8bd8b94-528d-bf6f-9e84-0e41e4c56382@linux.intel.com>
 <0840d2e3-c261-8d85-35ff-8388448ab7fc@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
In-Reply-To: <0840d2e3-c261-8d85-35ff-8388448ab7fc@linaro.org>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org
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


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 12:28:05PM +0100, Srinivas Kandagatla wrote:
> On 07/09/2021 16:04, Pierre-Louis Bossart wrote:

> > > > > +=A0=A0=A0 spin_lock(&apm->lock);
> > > > > +=A0=A0=A0 idr_alloc(&apm->graph_idr, graph, graph_id,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 graph_id + 1, GFP_ATOMIC);
> > > >=20
> > > > does this need to be ATOMIC?
> > >=20
> > > We are inside spinlock.
> >=20
> > but this is not used in an interrupt handler or anything that isn't in a
> > process context, is it?
> >=20
> No, it is in process context only.

So why is it a spinlock then?

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE4q9cACgkQJNaLcl1U
h9D7IQf/RacC3eiSHKhTPqv8w0z92hzvNN6Z/EUlhhAuKJ81s8ZQzpdhFh4EDHuE
lzXJIVyivBsqNfH0sl4Pj6IkQxqwGTi+QRxU6walLlDKPb+NEqLikHYON+r6ouKY
Ndywr9KCQsvdFYso82JNIllnOMYvHI9BYEXZyfLhQ2bnHmLTpS/ftnFlV5KkL+pe
BH8ynq3fGYJfUtTnZm78gVWeh7ee7IZw31SglryPxBAUJ30rImN9w7lfPYxay2AB
kOll5w6Dd8rHG4rA02SqJdj24q+5OViCe4wGvuUmu8FRZteREdJZyKv9azqRIEHU
4PZdrAdyY3UrtQ0hPzHAx3AkH4SaFg==
=t9Jq
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
