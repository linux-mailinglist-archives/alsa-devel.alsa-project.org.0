Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F911AAD48
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 18:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E7A1612;
	Wed, 15 Apr 2020 18:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E7A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586967886;
	bh=5vqYtdTCKFz1d6OC39tkbz4gI+3qu+ArDdtxYAtQrdc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dvklcWM7K+N7COPmbQn7Jyr2Vt9bxOZtF31rZbmjc2e4CLXwZSI+jiTYCN3Cb+17Y
	 x46rZJDqihTZYpm8xCfdOPsMVLQ6xeR0IWGJKTlbEf1E0FRkYf4HRaovDKm3uM67Hs
	 kXVnEiNouZm2mrzcVhdNxOzNbKpE20zLcXGevNmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F38F8025F;
	Wed, 15 Apr 2020 18:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCBA9F80245; Wed, 15 Apr 2020 18:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BC30F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BC30F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="utbHXhov"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76CBF206F9;
 Wed, 15 Apr 2020 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586967771;
 bh=5vqYtdTCKFz1d6OC39tkbz4gI+3qu+ArDdtxYAtQrdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=utbHXhovrSMk2Z+MefR5IojzWv2ZfkATL0DePNHpYK2CiqAB04Zmq/N9YZKqDzQTb
 Nr26wl52buZfyRKbSXTvn7HP6bSwM2cz+XnhTxHwXV3cEnxswsDB+0iQJgeaGGCWFP
 XhjtEzs72xyUjkaAF9FhYHckGVTu3by4V162+WP0=
Date: Wed, 15 Apr 2020 17:22:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200415162247.GF5265@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <20200415113630.GC5265@sirena.org.uk>
 <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Michael Turquette <mturquette@baylibre.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-clk@vger.kernel.org
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


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 09:44:12AM -0500, Pierre-Louis Bossart wrote:
> On 4/15/20 6:36 AM, Mark Brown wrote:

> > Architectures that don't have firmware bindings use straight C code to
> > register and set things up.  Machine drivers are essentially board
> > files, they're just audio specific bits of board file that use audio
> > APIs and so are in the sound directory.

> Humm, we may have a conceptual disconnect here. In the ACPI world, there is
> no support for the machine driver - unlike Device Tree. It is probed when

This is nothing to do with device tree except in that it has useful
firmware descriptions of the hardware.

> the SST/SOF driver creates a platform device using the codec _HID as a key
> to hard-coded lookup tables in sound/soc/intel/common/soc-acpi*.c - it will
> be probed *after* the codec driver probes. I really don't see how to use the
> machine driver as currently implemented to establish board-level connections
> that would influence the codec driver probe and its use of a clock.

You have the opportunity to run whatever code you want to run at the
point where you're registering your drivers with the system on module
init, things like DMI quirk tables (which is what you're going to need
to do here AFAICT) should work just as well there as they do later on
when the driver loads.

> > I think you're giving up way too easily here.  The kernel has really
> > good support for systems that don't have any firmware description at
> > all, this shouldn't be complex or breaking new ground.

> See above, I don't think the machine driver can do what you had in mind?

> I don't see how to proceed unless we remove all support for ACPI, both for
> codec and clock driver, and trigger their probe "manually" with a
> board-level initialization.

The clkdev stuff can use dev_name() so so long as the devices appear
with predictable names you should be fine.  If not IIRC everything in
ACPI is named in the AML so clkdev could be extended to be able to find
things based on the names it gives.

> And btw there's already a precedent for using global names, it's what the
> Skylake driver does for the mclk and ssp clocks. To the best of my knowledge
> the device specific namespacing does not exist on any ACPI platform. We have

No machine description at all exists on board file systems other than
what we write in C and they manage to cope with this, I'm sure we can
find a way to do it with ACPI.  I mentioned clkdev before, that is
something that's done entirely at the Linux level.

> a request from Dialog to implement the same thing for SOF to solve
> dependencies on the clock being stable before turning on the codec, so if
> global names are not acceptable we have a real problem.

If existing usages that have ended up getting merged are going to be
used to push for additional adoption then that's not encouraging.

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XNNYACgkQJNaLcl1U
h9Aqhwf/cG1ywCKHbggOqbCvgesS1TiRvusYdrRC114nvcJ7Ljju1ZCzTa+SK2Xp
bBL2XaKZ0KYChnzuGMGYjQEJbf1sUbA3zyM5barfwt4syASXT7VeaUfdcTYxS4dA
pDtWAex05jD2YGVPThnn4AKiCBRB9ygszMsf4NTZHGW7l9bKvvZOWQTuvrZWY3pb
0vRL6roijlkQ+2lDjpMZPQ9i5ni5Za0rwrHhS2b/kaGkBRZjpYuWjsQJXFRVKOsi
yF5K3jCsFr7F6AAjEtGYoS5riG2c6vi2nvpquEe3EeAc0i0OlgJNpddd6K/mL+P0
qqBUAo1IHNAuum9AYzbm9FSCpYBcyg==
=ww1w
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
