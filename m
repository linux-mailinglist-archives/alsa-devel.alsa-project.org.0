Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DCC17ADC1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 19:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B371667;
	Thu,  5 Mar 2020 18:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B371667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583431234;
	bh=Yql8417UCaJqZfRn8XoU5J8ZpwsCTSdlp43oWY9Hj4Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hya+8rn2ya3AroR4mbLwJufhNddzRfDQKNZ1UZYg6Wv1Yz/BV3G+stB64c32B3iWy
	 cRKxYMxdQ4EVWkMnhSz1iw5SHyaQOSXtkLSBULr1PSygNLvGudGrcQcdfLt3XqHxIF
	 jRyBkKO8qyFE5TuUzjmxls82evtwujdgONWj/X8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C88F80245;
	Thu,  5 Mar 2020 18:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA382F8025F; Thu,  5 Mar 2020 18:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5F14BF800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 18:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F14BF800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9713630E;
 Thu,  5 Mar 2020 09:58:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 182C33F6CF;
 Thu,  5 Mar 2020 09:58:44 -0800 (PST)
Date: Thu, 5 Mar 2020 17:58:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305175843.GI4046@sirena.org.uk>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305142723.GM1224808@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y96v7rNg6HAoELs5"
Content-Disposition: inline
In-Reply-To: <20200305142723.GM1224808@smile.fi.intel.com>
X-Cookie: When among apes, one must play the ape.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--y96v7rNg6HAoELs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2020 at 04:27:23PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 05, 2020 at 07:47:47AM -0600, Pierre-Louis Bossart wrote:

> > I don't fully get the acpi mapping and all.

> This one is easy to explain. ACPI lacks of the proper labeling / mapping GPIO
> resources. _DSD() method helps there, but there are no Wintel firmware that
> supports it (Google basically is the first who utilizes it).

That's not entirely true - the _DSD stuff was also actively being used
by the embedded x86 people since they needed firmware bindings for
things and wanted to import all the work that's been done for DT, or as
much as possible anyway given that there's bits of ACPI that actively
conflict with DT.  They were driving this much more actively and doing
much more extensive work than the ChromeOS people.  That all seems to
have been abandoned though.

--y96v7rNg6HAoELs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5hPdIACgkQJNaLcl1U
h9D3EQf+MXcCkNsn5bc/PqeJuswTmkNw5PFoa7cOsf1wRiZAah0qyiVwXtuaWAph
4nCa0n10GO+S2lKRG9qgihkWlz1VjBz4lNxoA2snnaJ2fs3aoi977T5WUU4sm5zU
u9rKYyJAE5p5Y1g5h1hcRYGJnOl0wCt+KzwwhbbQ9E6nQgFLBXkDH8cvASFh6plT
kF8SEzOQ+xpxRiVjHLYs8rdCOb4IDgdm9PVNtrVXw9UZ2H55XzrO6HCIpD3duwFP
Oxx130deqpADOQp9gRBzLnToNo09TwvvvCPh811TG7m4ee4ZfHUI5s+JLkZ8j8pg
Z6Xpg/oDbfAhXg615OHo1w8VZNMUXQ==
=ne/c
-----END PGP SIGNATURE-----

--y96v7rNg6HAoELs5--
