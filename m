Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30C1B7DB4
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 20:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A549916C2;
	Fri, 24 Apr 2020 20:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A549916C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587752225;
	bh=RN7HRtXcctHJsBWrQvMDFmxfA8ZNdyHq8xgiCJBHJCs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKfmQ5j5UOqVMRaHBg0xpGlNff+zcvbtLy3l7J6ss+A059yYOTSfbSIWNz+pc/YD3
	 63Qvl7sG05H3ILuUFaiSRJjIbVLmb+Kf6hRPk01UbQ0hl2IOQeHeJgIDjhqEGHDwSV
	 ETLOJWVo3kQz+/XlDVTGt1Q9tB/JH6E7A3Hdse1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77207F800BE;
	Fri, 24 Apr 2020 20:15:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A635F80142; Fri, 24 Apr 2020 20:15:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AB53F80117
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 20:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AB53F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eixTM8rk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71E64206A1;
 Fri, 24 Apr 2020 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587752113;
 bh=RN7HRtXcctHJsBWrQvMDFmxfA8ZNdyHq8xgiCJBHJCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eixTM8rkWqsLEJsV+6gnElkCAhwvYltyA+kBBlRGgcvG9QFXEfYjhTqpP9MKAlv9+
 sbXLHUq9MlB+dzrgOzg+GC/qiITQaAZ73nPJAIgXJYQs/rj28L3cK69UFvYYSG0yL6
 7xfIoY/o2UjCZZHssyyQVTsIByI8kU+KHEwH4V8w=
Date: Fri, 24 Apr 2020 19:15:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: ASoC driver names
Message-ID: <20200424181510.GJ5850@sirena.org.uk>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
 <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
 <20200423184056.GS4808@sirena.org.uk>
 <aaff591f-9f3a-257b-4fba-71c39b3bf3ea@perex.cz>
 <20200424164944.GI5850@sirena.org.uk>
 <0a1b7396-f7d9-b6a9-2e85-70517b5dc718@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fU0UwhtRbpo05rnG"
Content-Disposition: inline
In-Reply-To: <0a1b7396-f7d9-b6a9-2e85-70517b5dc718@perex.cz>
X-Cookie: Information is the inverse of entropy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--fU0UwhtRbpo05rnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 07:11:46PM +0200, Jaroslav Kysela wrote:
> Dne 24. 04. 20 v 18:49 Mark Brown napsal(a):

> > So if it's not really going to be used for anything particularly
> > concrete then I'm having a hard time summoning the enthusiasm for a
> > change.

> The driver name is used as the directory name in UCM / UCM2. For DT, it
> means thousands possible directories (one per board / board + codec variant
> and so on..). The generic simple asoc card is a good example.

Sure, then you end up with a few directories with huge numbers of files
which seems similar?  TBH if UCM weren't doing the directory thing it'd
be easier to see fixing the neatness issue, what UCM is doing means that
it's much more likely that people will notice a problem.

> >  It feels more like a neatness thing than anything else and the
> > postitive case just isn't jumping out at me, certainly not as a thing to
> > force for everything.  New stuff, sure.  I guess I'm not bothered enough
> > to block any platform that has a burning desire to convert either though
> > if users start coming and complaining about kernel upgrades breaking
> > things we'd have to revert.

> :-( I don't propose to force one way. We can conditionally change the driver
> names using a well documented CONFIG_ option to keep compatibility with the
> older user space code. The new driver names may be selected manually in the
> kernel config.

That does provide some mitigation, though there's some potential for
confusion too.  We could try it and see I guess.

> > > I would prefer to have the sound hardware description in the long name field
> > > than the whole hardware platform info here, too.

> > Does it also cope with the DT equivalents (and I guess there's nothing
> > we can do for board file based systems)?  This stuff does get used for
> > embedded systems where the plastics are often important for the
> > configuration.

> The author of DT config knows what hardware is described, thus this person
> should be resposible for the nice GUI sound part name.

Assuming they're working on a system where the sound card name will be
displayed in a GUI.

--fU0UwhtRbpo05rnG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6jLK0ACgkQJNaLcl1U
h9BHyQf8Dt1b3H5sKlRABHMRqwrF1ZuMKILmEmlO76pyVDm+QZhqB8s/TeukQRLt
sLudne0lGIXAC69cZuKYNZcz603fXEcn7Cl3VGCXpaw3W3YqTwtIR3DNVNOXZdVd
Z8F4cIF/bnjCKQIjTzdg8En3Ty7BwAREjALs8FXX0/hjXPNuCaQ9lKwavY4UsYiQ
pJzDL94F/VicSCsxmhd9s2nqNQVB9ffzQ5dBHwRNUs8DnZkBJl8z0lTaBqGF3XKO
d6DlSK4iGBFS74AoLC4yDEyyIk67iYxCkFid6E/7Xaye5l5N+T/EIUZWZSgdA+R7
HUZ7gIR6IqRr9rATJ+7prmdnIXw7XQ==
=ZXUO
-----END PGP SIGNATURE-----

--fU0UwhtRbpo05rnG--
