Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE921A9CB3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 13:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384481666;
	Wed, 15 Apr 2020 13:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384481666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586950703;
	bh=hGaPNPo2bXtmqhGm530nnBNN9yGymFS64dOLD7ZHm+o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ccr9Ida0YaWoIKQwZMqIq0lMYAj9159ju2rcqCwwBz+XPMgci61pgPEFEivb6OLAf
	 wBZ6j5ytxc3in0W27mLMpGMkJe4Jf1o8UdHPY61tTcOAGK8iuAdBYigS+hrn3N94TH
	 TJPYPXisgI75UXEBi37YcVTJMp7p+eQir6ie2MeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 513E6F80115;
	Wed, 15 Apr 2020 13:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77FC3F80245; Wed, 15 Apr 2020 13:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB88BF800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 13:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB88BF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RDSYzi66"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF07220857;
 Wed, 15 Apr 2020 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950592;
 bh=hGaPNPo2bXtmqhGm530nnBNN9yGymFS64dOLD7ZHm+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RDSYzi66kakJCorZcJfkhARuzoUP//RGk5PLdJ450hrz9g205FplNu38EDzppW/ov
 TCUjHOeKWHOSTLwCFCbpwKqRyUxti0cC9B2ozrkZROzXFkqvqAvpSIOxTy8oo0lB0W
 Xk5FBXSqwwoz0VxNjsg4z4a60Fm/ZN4QZv2mS4DA=
Date: Wed, 15 Apr 2020 12:36:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200415113630.GC5265@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline
In-Reply-To: <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
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


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 03:13:01PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 2:50 PM, Mark Brown wrote:

> > It's not just DT platforms that I'm worried about here, it's also ACPI
> > systems - all it takes is for a system to have a second device and a
> > name collision could happen, especially with such generic names.  We
> > tried to avoid doing this for board files for the same reason.

> I am on the paranoid side but here I don't see much potential for conflicts:

> a) this only works for the Up2 board with a HAT connector
> b) this only work with the Hifiberry DAC+ PRO board.

> This codec is not used in any traditional client devices.

That's what you're doing right now but someone else can use the same
devices, or adopt the same approaches on something like a Chromebook.

> > My understanding is that ACPI just doesn't have clock bindings (or audio
> > bindings or...) so you're basically using board files here and board
> > files can definitely do more than we're seeing here.

> I don't understand your definition of board file, sorry. We've never had
> one, the only thing that's board-specific is the machine driver.

Architectures that don't have firmware bindings use straight C code to
register and set things up.  Machine drivers are essentially board
files, they're just audio specific bits of board file that use audio
APIs and so are in the sound directory.

> > You should be able to register links between devices using the clock
> > API, or add that functionality if it's not there but AFAIK clkdev still
> > works.

> The machine driver has no information whatsoever on who provides the clock.
> I just don't see how I might link stuff without at least some amount of
> information?

The machine driver must have this information, it knows exactly what
hardware it runs on.  The whole point of a machine driver is that it's
board specific.

> All I needed was to toggle 2 gpios to select 44.1 or 48kHz...Looks like it's
> going to take two more years, oh well.

I think you're giving up way too easily here.  The kernel has really
good support for systems that don't have any firmware description at
all, this shouldn't be complex or breaking new ground.

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6W8b0ACgkQJNaLcl1U
h9D17Af/RhGgm4ZGHtLAdFJ+aGM6tFqBf1vbPHV3CiIESBM6b2F4siv8Zz1Tm62X
ZrLAoIDt7NB9a9wxuWGYzZL0QKOunAXzw4kAxwdh3HlJPhrlc+mG0CPkc2gccNgb
v9AQRQJX5Q6RkRsXPKLTENGvvBH/pjsybKCnHGZtj4ffWfitIRGLkRWa5ieEL0XS
NAY2B1/Oqj0m9UXZnPC4vHPEyflD5z5thYNpCtrikrqWA0f/ydpYVOhLZxI7/Sli
Bc/Z2E7vEoA/uifEu97t0X0VEqHShdd1ha7EPpNdPv5OUFW4GSrM6XJOIYGmtcAx
ZKzPKc7vExdL8HgvNakMTp98Uxxfhw==
=Be0S
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
