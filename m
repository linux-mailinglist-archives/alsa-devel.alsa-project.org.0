Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFC1A8988
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1499116A2;
	Tue, 14 Apr 2020 20:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1499116A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586888961;
	bh=setRMLbaGbdY6PfeXmGfv+P7oCdBEUV8af+jR4fH8Oo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlloKjsEZjiJtkVpX8JhvxTHxm+FFsbh5HPiyf+AjA0LKt3G9qly4zpQKK4/7iyBM
	 Kuqif5MRaelc0gyFAmrO6daOu6f+45dZ0TXWdlcGtlLt+MkAXJysV/atGtP9Yl9uNB
	 1Fpj2e01tja5WaoJAco8skg0SWVxzDLYldFLK2OM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAB2F8014E;
	Tue, 14 Apr 2020 20:27:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F85EF8013D; Tue, 14 Apr 2020 20:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA00CF80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA00CF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mgUpmwnb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2070620774;
 Tue, 14 Apr 2020 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586888851;
 bh=setRMLbaGbdY6PfeXmGfv+P7oCdBEUV8af+jR4fH8Oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgUpmwnb5CDveFVgJHc4JDrOUzHq9FBD78BcxY4mQQouaDyuIGe1f1kFNblCrx3Ja
 nvkNxhJcNe9EQKPcCiE/1QcJc81oQZh4MeXoY97nuBMpATca9MxwKNv/YFNGy/LPEn
 eGjATpc0T7zOs8qPcKYUdihbl1y7nTWUKNhxcqK8=
Date: Tue, 14 Apr 2020 19:27:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200414182728.GM5412@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2YJj5f1P6Th4nBRw"
Content-Disposition: inline
In-Reply-To: <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
X-Cookie: I've only got 12 cards.
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


--2YJj5f1P6Th4nBRw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 01:14:41PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 12:45 PM, Mark Brown wrote:
> > On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:

> > > Using devm_clk_get() with a NULL string fails on ACPI platforms, use
> > > the "sclk" string as a fallback.

> > Is this something that could be fixed at the ACPI level?

> I guess to fix this we'd need some sort of ACPI-level connection or
> description of the clock, and I've never seen such a description?

Wait, so SCLK is in the *global* namespace and the provider has to
register the same name?  That doesn't sound clever.  It might be better
to have the board register the connection from the clock provider to the
device rather than hard code global namespace strings like this, that
sounds like a recipie for misery.

It is really sad that nobody involved in producing these systems that
don't work with the current limitations in ACPI has been able to make
progress on improving ACPI so it can cope with modern hardware and we're
having to deal with this stuff.

> All the examples I've seen use an explicit 'mclk' string (that's e.g. what
> we did for the PMC clocks for Baytrail/Cherrytrail machine drivers, we added
> a lookup). Here I used 'sclk' since it's what TI refers to in their
> documentation.

They appear to call it SCK not SCLK.

--2YJj5f1P6Th4nBRw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6WAJAACgkQJNaLcl1U
h9BADwf/fED5QJj8MeBLvtZRaTiqY4MJ/SKDCRbWQCSE1rKJquN+Q6S3Sw9LA6Pl
+b6iqkWOyfvqyeHJTwR0cSNAgmaPHhbsmMKx6zX2+lyV0PO440CQ9B7EyK48Bp4F
CX950pYjFVn0bmMKvwCE2zfogp2U7ZZky8NftSWGUkYb84/8sRyL3MTa52dR+SEW
XI7I157Jehggi1pMsv5W11ikZnzGF3IwlIviWtq/3cM1Ji+4ZDiYCAni/zheOfFF
w8OdUEoRqh8NIU2/apKSFLWAuyEubp7v2i784hEmjJrXgDQfs4P06rwb2Z0Og2MG
0xmKr5g0y2UpAqVwO5SPq+uriix5FA==
=5dN/
-----END PGP SIGNATURE-----

--2YJj5f1P6Th4nBRw--
