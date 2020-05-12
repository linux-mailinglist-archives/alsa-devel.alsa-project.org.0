Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D51CF29A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 12:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7041697;
	Tue, 12 May 2020 12:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7041697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589279714;
	bh=iOtZ2eVyp6uykbgj4qii/+7h1t5fhrWXPOp64vb39Pk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NB/iPCiPatUtz14aDhiWyC7aDHA1Alrr4r+WVy22WpOpjQzem13WIu8TV95LNwNZ3
	 5iUcU7b55jVMP3hxp5AbuZlMLvsCCWDwYyU3t8Skxd31m/lCoGcVor7u+1LhFtV/Hi
	 gOBgS83vzv3WRCPFw1xAQ46z0R76hidEgSJ7fgnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FC81F801F2;
	Tue, 12 May 2020 12:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3390F801DB; Tue, 12 May 2020 12:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 445E4F8014C
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 12:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 445E4F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lUBRFPsW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D009206DD;
 Tue, 12 May 2020 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589279598;
 bh=iOtZ2eVyp6uykbgj4qii/+7h1t5fhrWXPOp64vb39Pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lUBRFPsWwF1B/9EwmQHd1AszTkgFtKc1UlbdnkEZkL8PWqW/9u4peAjCF+tt6E6/k
 E2WpIRHdC4aCOqXDTK9uUqPZlo4WtTgZZUCSs3QizExQM/zrBSNpO0mlLX1X4Nxi/Y
 nxYlTjJe8u1e3cUxYpbX6qxs71/8IbdwTgrMks64=
Date: Tue, 12 May 2020 11:33:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee.maxim@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200512103316.GB5110@sirena.org.uk>
References: <20200509031919.9006-1-steves.lee@maximintegrated.com>
 <20200511110346.GE8216@sirena.org.uk>
 <CABff4NQXs622x1X6ZvNABHNZoTMS57f4Y5sdo1Cng3JeTgboCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <CABff4NQXs622x1X6ZvNABHNZoTMS57f4Y5sdo1Cng3JeTgboCw@mail.gmail.com>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, krzk@kernel.org,
 lgirdwood@gmail.com, nuno.sa@analog.com, geert@linux-m68k.org, dmurphy@ti.com,
 shumingf@realtek.com, Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 rf@opensource.wolfsonmicro.com
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


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 06:13:05PM +0900, Steve Lee wrote:
> On Mon, May 11, 2020 at 8:03 PM Mark Brown <broonie@kernel.org> wrote:

> > > +static const char * const max98390_current_limit_text[] = {
> > > +     "0.00A", "0.50A", "1.00A", "1.05A", "1.10A", "1.15A", "1.20A", "1.25A",
> > > +     "1.30A", "1.35A", "1.40A", "1.45A", "1.50A", "1.55A", "1.60A", "1.65A",

> > This looks like it should be in DT too.

> Since this control  is needed while running system according to system
> battery situation.
> I'd keep this mixer for further use.

That's...  interesting for a current limit, and sounds like it would
have issues for the common case use of current limits to protect the
hardware.

> > > +static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
> > > +             struct snd_ctl_elem_value *ucontrol)
> > > +{
> > > +     struct snd_soc_component *component =
> > > +             snd_soc_kcontrol_component(kcontrol);
> > > +
> > > +     dev_warn(component->dev, "Get dsm_calib_get not supported\n");
> > > +
> > > +     return 0;
> > > +}

> > Just don't implement the operation if you can't implement it.

> If this not exist as dummy operation and all mixer was not working and
> could not implement better idea.

Could you be more specific about what you mean by "not working" or how
simply not initializing the value returned fixes things please?

> Could you consider it as with warn message ?

No, if there's a problem here we should fix it properly.

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66e2sACgkQJNaLcl1U
h9CQogf/R4loaD+oS7rnJp6kgm9vB0jnWzpi3rqYFNStSnuHqRBItJeYQU5jCjuT
A+pMPMF6GX70+4mnWRA7Lj54J5JDWqGX39pARZYckUdT82q/xwi5EJdjPN18wqQn
sP/GFgc+qi8It3N+2HJOXtHuUO+MhG12PpRVJ87lH3JVzM1pmOFsBjsb82DXTQL0
lmq8EqokSzxiY4M1b7bNjIyEqI6Lm53IGo16zfqapaNdjbvN14Y7/Ma4oVcBUhXA
0fezppgi5AzD8HgWAVhPHxfaCCUrIjW2mE8c31K6oHma6SkvXT+Ys045NXX4YUJw
qz/dy7x/0rIvjJKMcOFFXHYU/KPRPw==
=msPs
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
