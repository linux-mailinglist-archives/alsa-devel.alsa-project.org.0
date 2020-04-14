Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B51A87FF
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1361F16A5;
	Tue, 14 Apr 2020 19:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1361F16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586886836;
	bh=bBmFGEaWpYg8ap7AtJ78GaxoqXkZsiVqGYraG7fEbc8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFj9GufaTk2hnC6LMCxXBUwtO/Nun3IQDWUFfoFSCSWtppfrNR97kxlCkDC4W4AOC
	 vx05O7kBHKQDJySvSG7gDLjH+KH6dBpnEsB2DxPX4opdg4vjKw8JV1ECWf8sScfV5x
	 uxIN5M4b1ENcJexfgvo2FNGg3Xkawpkl7fSDbRMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 318ABF800B9;
	Tue, 14 Apr 2020 19:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF6F8F8013D; Tue, 14 Apr 2020 19:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70107F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 19:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70107F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wp6LgqVs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AD842074D;
 Tue, 14 Apr 2020 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586886728;
 bh=bBmFGEaWpYg8ap7AtJ78GaxoqXkZsiVqGYraG7fEbc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wp6LgqVscVKq5YHlPBXE2syWWh3yNkgpqC+91VEwyp5Ovod8vI0hKx65GHf0fJ9Zj
 NhIbdFNC3a6cI3RsqmE1jhfGca3nnr/xKgndpgQI88y7MVj5MX6jQQiJGmNmEug8zE
 5Rq8xDU2kQrm/wrQPpZf0Ns36wk7rBj/ct3fbo8A=
Date: Tue, 14 Apr 2020 18:52:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
Message-ID: <20200414175205.GL5412@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
 <20200414171752.GC34613@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HLsZ5Z1opAQvdr2J"
Content-Disposition: inline
In-Reply-To: <20200414171752.GC34613@smile.fi.intel.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Michael Turquette <mturquette@baylibre.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
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


--HLsZ5Z1opAQvdr2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 08:17:52PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:28PM -0500, Pierre-Louis Bossart wrote:

> > +		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),

> It says GPIO 4 and here is number 3.
> Does this 4 come from hardware documentation?

Yes, the first GPIO in the device is GPIO1.

--HLsZ5Z1opAQvdr2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6V+EQACgkQJNaLcl1U
h9AWgQf/bIQs+gv5yXrGrVTSpNHyX246/chEfkEGGW13vu7i30lHMx7WqTl2XYH8
dxug0+PjPKNCxQqtt278m7YnB2VZw1Go9EhQg3pq1HE7nMmf5pVgzB6wHcAkst5R
EIQB8ezHiiVoAfJzdHSC7jXNvuc7PKuqJBPqaUZrink1flI50FyPMybtKNjCHe6n
B+2NyFFIue4/P64qCSVLUtK0GQ2xZiUGIcAbCLMZQJg/CBOvugTygvVYFmLOBIXA
0CHH9ozBELK/ofd55JItdSSueHgQ6RmDNmDiwlfLIkqQhPFC+1l4SJIy0agz3IeQ
tq3d+rvrTW68hHrgEsSddNeRQEXupw==
=7ljH
-----END PGP SIGNATURE-----

--HLsZ5Z1opAQvdr2J--
