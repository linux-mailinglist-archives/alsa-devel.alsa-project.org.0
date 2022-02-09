Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A34AF5E1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 16:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70D618D8;
	Wed,  9 Feb 2022 16:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70D618D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644422318;
	bh=UGC91cSE5Bua8ussizrGFzIUjH41dIOPJ7eA0zYcOJ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cfC5b3/Jdmc4BhXo8Ue6PYna6oUrt/hwFmSDcWiWrlSFpW0IsvFCa2isLa5uK/RVk
	 VP11BbuXPCA+GN9u6QsFjScn9Am6oz8LdWuGQXQv/84LVbd/RZlTJcoThemrkG00UJ
	 cemGLbEDbGenNHjciSo0M39JhfuQ1JiqLlcudkmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E71D6F8016B;
	Wed,  9 Feb 2022 16:57:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4927F8016A; Wed,  9 Feb 2022 16:57:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48B6DF800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 16:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B6DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bL9Resg8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8F2DB81CDA;
 Wed,  9 Feb 2022 15:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F57C340E7;
 Wed,  9 Feb 2022 15:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644422243;
 bh=UGC91cSE5Bua8ussizrGFzIUjH41dIOPJ7eA0zYcOJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bL9Resg89/te9DqcdtT9RGG4gvDz8Kq5yYeXo3cm3cbPZfCf+a+SX1/Ra+ut/NQDD
 kjfaahN3QoTMfsbxiZXhZ6LYYw4gVfmZkzCqcmo5G6O8TlIr4YSAcpu6QSMoll8nbZ
 SQMIMXgPjSeIKR36jfWafTQlJEbTWgfhLCwIS6vFuOIMuEBjnsICpNHHSmR8zrfPw0
 vTyXSDrK1j9sZRIcoP/j2YsiOOsgueeDdSpUrKSRu2ADQU756YVLg766ZKxpYZOw77
 9OAc2z9TKMGLQ0hypI+1oVwsPNDv8u5sh7naXjIHCdTyCwQGPPPMX4dhF7enr8Cqvf
 VFqI9sqZlU82w==
Date: Wed, 9 Feb 2022 15:57:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
Message-ID: <YgPkX4UaYa0jyo6K@sirena.org.uk>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
 <YgK81R6ipwLagmoE@sirena.org.uk>
 <alpine.DEB.2.21.2202091518030.21772@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E90k9dCQZ5LiRyk7"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2202091518030.21772@lnxricardw1.se.axis.com>
X-Cookie: Disc space -- the final frontier!
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com,
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


--E90k9dCQZ5LiRyk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 03:53:28PM +0100, Ricard Wanderlof wrote:
> On Tue, 8 Feb 2022, Mark Brown wrote:
> > On Mon, Feb 07, 2022 at 06:12:06PM +0100, Ricard Wanderlof wrote:

> > Other than resyncing the cache (and see below for that) a cache will
> > affect reads not writes, writes should be affected unless the driver
> > turns on cache only mode.

> Isn't one consequence of caching that writing to a register which is know=
n=20
> to already have the value to be written are simply skipped?=20

No, look at the code for regmap_write().

> I remember having that problem with a codec which did not have any means=
=20
> of resetting the codec other than power-on-reset (i.e. no reset pin or=20
> software controlled reset). If the system was rebooted without cycling th=
e=20
> power, the registers would potentially contain non-default values, and=20
> this meant that for instance attempting to explicitly set the sample rate=
=20
> to the default value was not possible, as the regcache assumed that the=
=20
> default value was already set and thus skipped the corresponding register=
=20

This is during a cache sync, a sync will only write out non-default
values if the device was flagged as having been reset in order to reduce
power on times.  Your driver is not doing a cache sync at any point so
won't be affected by this, but in any case...

> write. (A workaround was to write another sample rate and then default).

If your driver has no way of ensuring that the device has default
register values your driver should just not specify any register
defaults, but in this case it sounds like you have some other bug going
on.  If the device is getting suspended with a default value set in the
registers then comes out of suspend with a non-default value it's hard
to see how that could happen in the hardware, either the device will
retain the value it had or it will reset to power on default but either
way it's the same value.  I have seen drivers bypassing the cache for a
shutdown sequence that wrote non-default values to the hardware without
updating the cache.

--E90k9dCQZ5LiRyk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmID5F4ACgkQJNaLcl1U
h9DvfggAgKsoNCdmI/nPEPXdX3rT3KVKCZahdvWyhgJIqC/s5ggrTdsOOSioPAZ0
dMiwCZxdrNGh1EpMs5ni3SLenq+9pblQQarFpS4UcBY6Aekp1rQlAtkcVzydSiDE
SVlfU2welKC9mNz1r9gp7cQmFTZnB61Vf7YusxiENUMxkOzX0BK9lIro4Htsd8Ay
IHGySQFYq1m1VUOjnyf94ObFL0/3aswYOO8jAlHvMr4lcBrnZ++ZVchxeVH2bgPr
ZjFA61KECMAfTpfc6kebETlG3NPDlzBASCXX87PLpCYUlIJ7wFjXJr3BzZ0Velc5
njMql9b82SiAEa8rkeqYMEqy+17cqg==
=OVK0
-----END PGP SIGNATURE-----

--E90k9dCQZ5LiRyk7--
