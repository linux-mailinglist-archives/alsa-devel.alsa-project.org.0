Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FE421453
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 18:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B971674;
	Mon,  4 Oct 2021 18:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B971674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633365844;
	bh=565tHhBmRCysZjzSxOrrWmyYpky5MCNVPd5AEIAVT5M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eesp1QpNClc4wNwKMlbHEbTyrk0EjiVhG9U/YUHqzVszfOVLIq8pXr8xJl1E8wMk4
	 CWKXNtc62QNBY/Vtu/3LOWAl67jU/Yfnz8wikz8JOqDNNpSkRrM1u5dbaKJhPe21rh
	 q3We3Tr5YsnV9LKVyi/N48302fswOUvh7i04yNa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61BC0F8010B;
	Mon,  4 Oct 2021 18:42:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02793F80240; Mon,  4 Oct 2021 18:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54BF3F800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 18:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54BF3F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S/NM7V4Z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 322DD61213;
 Mon,  4 Oct 2021 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633365755;
 bh=565tHhBmRCysZjzSxOrrWmyYpky5MCNVPd5AEIAVT5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/NM7V4Zuu7OGEuBCi0YRpBF0xawsQ/LLX5uPlrSMHv3i8+d9Y9TorfYpYNwOJkXm
 OJ+nrO5bGWHfW8ePe2PbXHD8Q0nAqzKX7i7cE5caXqqf7H5ow2fEu9Y9gUmbBSeZfy
 QVgdUFP6jUbbN+ZjEXbNBi+4qGLkXscEVyWYCKGVTHbXE2Aap2BEHzBUY1G05WtztA
 zSTmQG1ef9VkfNmH1fPtICOYt0gKnz9Ry1A4rinuiQ7RPvnUNgh/zaLLxd38oHtC5z
 eXBGIFdtC5X2x+5UBo+dOGYi8t32m6oihaSduFwXFuRNwI2Z25Y1sV+Iu/q654mfL8
 6McKvijRxgrfA==
Date: Mon, 4 Oct 2021 17:42:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
Message-ID: <YVsu+QMjOQz8pAzY@sirena.org.uk>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
 <YVsETxqzhZI8Fb6D@sirena.org.uk>
 <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s4rg/Bs7+Dxer0A5"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
X-Cookie: If it heals good, say it.
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--s4rg/Bs7+Dxer0A5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 06:21:10PM +0200, Ricard Wanderlof wrote:
> On Mon, 4 Oct 2021, Mark Brown wrote:
> > On Mon, Oct 04, 2021 at 11:19:21AM +0200, Ricard Wanderlof wrote:

> > > +++ b/sound/soc/codecs/tlv320adc3xxx.c
> > > @@ -0,0 +1,1239 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Based on sound/soc/codecs/tlv320aic3x.c by  Vladimir Barinov

> > Please make the entire comment a C++ one so things look more
> > intentional.

> Ok, I'll change this. I was trying to follow the style of existing=20
> drivers, as the majority seem to have C style header comments even though=
=20
> the SPDX line uses C++. I'm now guessing this is for legacy reasons=20
> (minimizing changes in existing drivers when the SPDX line was added)?

A lot of SPDX stuff was done mechanically.

> > > +static bool adc3xxx_volatile_reg(struct device *dev, unsigned int re=
g)
> > > +{
> > > +	switch (reg) {
> > > +	case PAGE_SELECT: /* required by regmap implementation */

> > This is not required by regmap.

> Ok, I'll remove it. The regmap code was taken from tlv320aic3x.c which ha=
s=20
> a similar paging structure, but I see now that other drivers don't have=
=20
> this, so I guess it's not necessary for tlv320aic3x.c either and is there=
=20
> either erroneously or because it once was necessary?

It's probably an error in either the description of the pages or just
the driver.

> > > +static const char * const micbias_voltage[] =3D { "off", "2V", "2.5V=
",=20
> > > "AVDD" };

> > This should be configured in the DT, it's going to be a property of the
> > electrical design of the system.

> I can very well imagine that this something that should be runtime=20
> userspace configurable. In fact where I work we have had products where=
=20
> the bias voltage (for an externally connected microphone) could be=20
> configured by the end user, (although not for this specific driver quite=
=20
> honestly, we have had the need for hardware engineers to change it runtim=
e=20
> during circuit verification though).

> Would it be ok to have this configurable both in the DT as well as using =
a=20
> control? Or should it be implemented in another way, such as a number of=
=20
> pre set voltages that are selected between using a control?

It seems like a lot less work to just not have the runtime control and
let someone who needs it figure out how to represent it to userspace.
Something that's basically a backdoor for validation doesn't seem
persuasive, validation often wants to do things we actively wish to
prevent at runtime.

> > > +static const struct snd_kcontrol_new adc3xxx_snd_controls[] =3D {
> > > +	SOC_DOUBLE_R_TLV("PGA Gain Volume", LEFT_APGA_CTRL, RIGHT_APGA_CTRL,
> > > +			 0, 80, 0, pga_tlv),

> > s/Gain //

> But this would mean that the resulting control will be exposed as=20
> "PGA" when viewed in amixer as an scontrol which seems less than intutive=
,=20
> but perhaps there's nothing that can be done about that (other than=20
> perhaps expanding PGA to Programmable Gain Amplifier perhaps)?

The TLV information should mean that UIs can figure out to represent it
as a volume control which should be clear enough.

--s4rg/Bs7+Dxer0A5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFbLvgACgkQJNaLcl1U
h9AhCwf+K1M38yE4nawL6LzxNY8S0PX8zIVyA4KXhpFQieGSfk2J3XcYvqQrIew/
9f+6JJFDuUr+aXLsU/Tydbk+VPOIzLg7VpSbEdR9S2+9fEpijzH/pfEOJuY55jhb
iz7T3YsTGZGouJQEbeoze6qQGr/7W/nLn7xlMhyQJngt/OCZVy4XscVR2BNllHWb
ehbhoKrmB7aU6BnKia/kI124i+DF5v/IydJ8W8YsEK6UNtCGf/KytvUlTJrRuPoH
NVZJLO1h+SE7ccQp003NXHQZHp7nJVsLJKlVO14fv/SWNFU/m4Ya9k6piVvatOWx
Iv85Yef9ArVizYiaakC51CyDveiJjA==
=isUJ
-----END PGP SIGNATURE-----

--s4rg/Bs7+Dxer0A5--
