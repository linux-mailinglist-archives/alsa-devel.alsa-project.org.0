Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD111A9BCC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 13:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55F591663;
	Wed, 15 Apr 2020 13:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55F591663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586948984;
	bh=UK2YfDhi6th3yPk2HH2R+bk5vBepXBcx+kjcQDjg4ns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idWrXumsZ7yQygSM5Qtl+ENZcRiJtssIaziS0DRnjVoCmAregP6uqRwlA8BJZ+fMQ
	 VC+IHB4UTJX4k8AJpFKWXy4yaE3ZZExcflhko3MLYCB/yni0VC++4im6JVN01TuR7K
	 c7taFxxSxq4Q1S3SBjxY6F0828SM1g4P6fnnb1PM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C360BF800ED;
	Wed, 15 Apr 2020 13:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14440F80245; Wed, 15 Apr 2020 13:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79DD4F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 13:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79DD4F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wNkzIf6I"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D1E720737;
 Wed, 15 Apr 2020 11:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586948874;
 bh=UK2YfDhi6th3yPk2HH2R+bk5vBepXBcx+kjcQDjg4ns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wNkzIf6IsycXNBLxZcPoEvQ8q6mBrTzaO4+u1noOkWYub3+X6Mmtsf5qLANSSeXMu
 9Toyd5nAP8MhKkzRSSzM8x1phPlseQAusbk1xtvXRFR02aQ9PsFYZ3cUmItglNdmul
 5b2O6SNPBP5LmjwudDb0WBwLQkB5GqpL52iniCM0=
Date: Wed, 15 Apr 2020 12:07:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200415110751.GB5265@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <8876c7ef-89f1-b79f-c7c4-7862b9f37db1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <8876c7ef-89f1-b79f-c7c4-7862b9f37db1@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Matuschek <daniel@hifiberry.com>,
 linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>
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


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 04:02:00PM -0500, Pierre-Louis Bossart wrote:

> Thinking a bit more on this, is the objection on the notion of using a fixed
> string, on the way it's registered or the lack of support for clocks in
> ACPI?

The issue is using a clock named in the global namespace.  Like I keep
saying you're not using ACPI here, you're using board files and board
files can do better.

> From a quick look, the use of a fixed string is rather prevalent, see below.
> Less than 10% of codec drivers rely on a NULL string, so is it really a
> dangerous precedent so use "sclk" in this case? It seems to me that all clk
> providers need to use a unique string - what am I missing here?

> adau17x1.c:	adau->mclk = devm_clk_get(dev, "mclk");

Notice how all the clock lookup functions take both a device and a
string - the device is important here, the string is namespaced with the
device in most usage (including board file usage) so if two different
devices ask for the same name they might get different clocks.

> wm8962.c:	pdata->mclk = devm_clk_get(&i2c->dev, NULL);

This is how lookups that don't even specify a name can work.  You seem
to want to rely on the name only which is very much not good practice,
even on board files.

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6W6wYACgkQJNaLcl1U
h9D2/gf+LXkjRBEzfUWscE+SXIB9cbYvEbk/QxdKbt4nE92a9znb/4i7OhX0mL1n
jypfnP5cV3Jwxe7W6H9DiQ/7kOkzyj0T4eeUANUrnTdO4T/2syULRbl5iEJt4Bcg
G1Kr5copsLvu+Q4DA2dnDSGf+IHoWld/VilQjf3jYKMjQ7nB3EyCMVx2uh4T86uF
XffW9vJJPSnceNgAEgZPBrjfRCp2VR0H0vDZuod9Hi7gbRQ9a9VLTHh0HgrjbOxx
tu9j5y1f9ORSRgzt+i4lg9T5mTY4z+Cp7wS1PBSMSQhbsE26+sXxls+CXYYY2W94
ZyJy69fNojmO5e1xy3kBpKozOk1PJQ==
=Prgy
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
