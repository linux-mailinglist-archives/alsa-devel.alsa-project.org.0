Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A048AE3B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 14:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6C818A8;
	Tue, 11 Jan 2022 14:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6C818A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641906865;
	bh=9HR4Davs4tO5CA9fLLeW2zQmybg4H+n2JnHPQNKShR0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bpuzzaymss1eSpaCnSvpveYGuYDBpBENXFAtjBddRv0MsCdnVJpE9+9gqR1N/kx/b
	 WXWKIYHlzpKR3d08He+TBTykKEp4dUfXk92HCa4MQ/AVAysVDD4x3zxqW0Cit9VFY2
	 L84hwLDuHHtEQXvO86hx5q81BEXLUqHXmBM+cDqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 248D4F80054;
	Tue, 11 Jan 2022 14:13:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E8F6F80302; Tue, 11 Jan 2022 14:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706A6F800A7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 14:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706A6F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZifKXTd4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92CA0B81AAA;
 Tue, 11 Jan 2022 13:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9762C36AEB;
 Tue, 11 Jan 2022 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641906787;
 bh=9HR4Davs4tO5CA9fLLeW2zQmybg4H+n2JnHPQNKShR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZifKXTd4tSk5xoiiUZUi6kLN1eIT4PFKwcRZtnH5kvFG5DLFiq88l+1ffBhQV880F
 CLgW4bF0CAJHaVZ5T1+a0/8dO/uzOUHst6S06UHO3CrWAql0ZqDTYZc2MK/DlE5iP9
 /j6r8VLlIFJxo9duID6OX2LuNPWSXZbTJ42CGYMZOjX6Uw+9GQuj36w/XTM0ZbDHdH
 j35RMFFOltvBbBfCdC5xqWzZWNcgmx2YEnFwVdwF7nThk95/GPZvprZzsZHidvwyxo
 K5XTuU8xLjCgZE0hfx28EzMeflMTibtPa5rWpRsXNwALQRPtnz/mq376TEvmbIvrGU
 ps6PvzI2vExgQ==
Date: Tue, 11 Jan 2022 13:13:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Message-ID: <Yd2CXvSH3jo9tmUL@sirena.org.uk>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
 <20220107214711.1100162-3-robert.hancock@calian.com>
 <YdxGrApvHyPW1aii@sirena.org.uk>
 <b45aa6b8f3aa443da90b561e579370a0255e7017.camel@calian.com>
 <YdyXlalTSxPksLXH@sirena.org.uk>
 <20a640e08f80b2cbc28c5fdd27282b398bc844a6.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="daeKLc4q6nBKR6di"
Content-Disposition: inline
In-Reply-To: <20a640e08f80b2cbc28c5fdd27282b398bc844a6.camel@calian.com>
X-Cookie: Many a family tree needs trimming.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--daeKLc4q6nBKR6di
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2022 at 09:24:38PM +0000, Robert Hancock wrote:
> On Mon, 2022-01-10 at 20:31 +0000, Mark Brown wrote:

> > If the device is using mclk-fs then either there's a fixed sample rate
> > (in which case simple-card probably ought to force it without the driver
> > worrying) or the sysclk will vary in which case simple-card should be
> > setting the sysclk to 0 when the card goes idle to clear any
> > constraints (which as you say later it does).

> It sounds like to fix that, simple-card needs to keep track of whether the DAI
> has a fixed clock rate or not. If it does, then it shouldn't be zeroing out the
> sysclk when closing the device as that's wiping out information that needs to
> be persistent. I guess if the frequency was read from a system-clock-frequency
> property then we know it is fixed. There are other cases where it could be a
> fixed rate, such as if the clock is connected to a fixed-clock. Maybe we need
> an explicit DT flag "system-clock-fixed" or something for those cases?

If the clock is fixed in the clock API we should arrange to be able to
enumerate that from the clock API - we shouldn't be requiring redundant
properties for something like that.

> Then at least in the case where mclk-fs is set and one or more of the DAIs have
> a fixed rate, simple-card can add a constraint to restrict the sample rate to
> the fixed clock divided by mclk-fs?

Yes, however we figure out that sysclk is fixed.

--daeKLc4q6nBKR6di
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHdgl0ACgkQJNaLcl1U
h9BDQgf+IzDKotghJePsPMOVEbKklpdd3e8XIuQzUz+qsnE+CknRqsX8r11Ypcqj
gtTT4Lq6nioaapytSrU6wGUB239zkoOfA9AOfw2ipJFUFWtYJbOEj6Ju0J5npTWc
esgQ0Pyun8wuDeOtl/S7+rEJdnJubEaa4p00Il9hmC1QxQjzSB6dgmmRZIj83/y5
LiNn3YvnMTmBgQvCo4LgMWWBu36fLYWjDIJ9OMU5gOdMXHuAgCpsca4/IoMeX+GP
ocvh4CudID4wIs649333L7SkNEqALt+OdF4+ubb6vWnzcQqrrPCDSf5d5hjQBNVH
8KAUa+naAbfRMT9GgiKjijBOG8FF6w==
=vKPq
-----END PGP SIGNATURE-----

--daeKLc4q6nBKR6di--
