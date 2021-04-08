Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7576135876D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 16:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E551A1669;
	Thu,  8 Apr 2021 16:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E551A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617893345;
	bh=V7QIcN7yySLpZhk+b3AfRbn8KZrDKV5DAtxDeTJ0k+8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nT0JZ2CllGzDA3b0InZMNr3bL9IBYy33T1n1IJX886cGU6jlD6F95jnIr79ad9By2
	 cR6AwbhpJUE5w41zR7aYoD/i8HoQKvd8d2zGPWw4CU4c1KLofDGvHaC9LB3gXsBcGU
	 kvgFDESlGwqxgBD9Mf9SsV1uRDncnN0Du6ESzO3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3501FF80246;
	Thu,  8 Apr 2021 16:47:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055E9F8020B; Thu,  8 Apr 2021 16:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BDC1F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 16:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BDC1F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t4/sTVeL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 524D461103;
 Thu,  8 Apr 2021 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617893244;
 bh=V7QIcN7yySLpZhk+b3AfRbn8KZrDKV5DAtxDeTJ0k+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4/sTVeL9Jj+iKJgCxr+A09oruQNGZzWpeXz0rusllUzu9/Xjc+0KINbcEvgTSyCj
 rUq3vDGrqFgsm2a41faJ9i2HWvWEUMqK9YRF0Lgs20EOXL2bRq/E609oNFqHNMEZro
 Uv/yd/V+TA2IJRRGdGkFaM1KJcv3/bGWvTRiXRsS7ozvV3uOXcU/X4Fudz3asbt8Wn
 Q1JsoLVSRUa/X9U71DK8csSjV7XvBWO+iIHFTgvisEikY5zKbjEbQltVnC9oH7pN7a
 INOGknfBSYP2kqlXmShmWLxrdSAfkpA5gJSqDEU5B8OhI4QqQCYd8etp0lU3QSTkG7
 L2y83pUGokdkg==
Date: Thu, 8 Apr 2021 15:47:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
Message-ID: <20210408144706.GK4516@sirena.org.uk>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk>
 <s5hpmz47w3i.wl-tiwai@suse.de>
 <a15ad17a-e86d-50b3-64e2-9c9dd019ff2e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x1F0m3RQhDZyj8sd"
Content-Disposition: inline
In-Reply-To: <a15ad17a-e86d-50b3-64e2-9c9dd019ff2e@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>
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


--x1F0m3RQhDZyj8sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 09:12:57AM -0500, Pierre-Louis Bossart wrote:
> On 4/8/21 8:18 AM, Takashi Iwai wrote:

> > I guess the question here is how to identify the proper profile for a
> > certain platform and how to get it passed over the whole system.
> > Theoretically, the rename of the card name or mixer name strings could
> > be done in user-space side, too (e.g. mapping in alsa-lib or
> > whatever), so I don't think it mandatory to make them variable via
> > sysfs, if it's meant only for the consistency reason.

> > Didn't we discuss in the past about the possibility to store the
> > profile name in the card component string?

> Because of OEM or user customization, we will have multiple versions of
> firmware and topology that will have to be enabled in specific setting. T=
he
> last thing we want is hard-coded rules in the kernel on which firmware
> customization to use for which platform.

=2E..

> If the users wipes the OEM image and installs a standard distribution on =
the
> same device, they would by default use the firmware generated from the SOF
> main branch, without any differentiation and 3rd party IP.

> So the point is: how do we expose this information to UCM? In the machine
> driver where the card is created? There is zero information on what the
> firmware/topology does. The information can only be extracted when the
> topology is loaded when probing the SOF component driver.

So what we're looking for here is a mechanism to tell userspace what
firmware has been loaded?
>=20
> I don't think the point was to rewrite the controls but make sure that UCM
> is aware that the card definition was changed by a different selection of
> firmware.
>=20
> Jaroslav, please correct me if I misunderstood the intent of this patch!

--x1F0m3RQhDZyj8sd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBvF2kACgkQJNaLcl1U
h9Ctogf/UOVTZ3vZ6YJvg+42O1p1pJl8CCG1NWMW30HJZcqOcv/nF9DmHjML9Enf
xD8k3N0JJdHi/AgiwF1BIHgps5cNHqywbdFp8HDwCjT9f6pwSgx2YyaSldYQlIqG
0ZlN2Rj/pOm4DWoPH1+YdcwtIRkFmgv1jNOZo1/C1BLI/jI1N4BLxZcs8+zYjdTS
KGjZYLeLqzfrXM7aCGxvLKcw6Adc6KOyEhaUJ88wNfj3SZeMcqUjcAHa5XINAO+j
htB5OUi0RFKi1hBeVrEdw+bTHeDMzjFj874woH33gnDGJqDDuMp89WzO3gDJdpS0
2qYpfw3Bj1ko5bCNSPx3mWjdzpobgw==
=lpff
-----END PGP SIGNATURE-----

--x1F0m3RQhDZyj8sd--
