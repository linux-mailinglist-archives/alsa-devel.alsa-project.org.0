Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F0535047
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 15:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D5116B3;
	Thu, 26 May 2022 15:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D5116B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653573570;
	bh=PmXYcl2ypiDCMUcautpDUCznwapHrv2gu+aDgn737Po=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HB6IdlRtAdMiK9Djiqs+gdGhNF2YGitnyCwX1qSDOwrjhtiLphoqTwnKi/p7MT4s4
	 Q9lCWYyJgMboo3o68HUyH8eUXDZ+KwubNeRGvWiky7mTHZsL69soAYXUsdadZf0lsB
	 Ywi+P+3AvL691cVYN0Mn68zQBf+5OYgHbIKKdMTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C674CF80171;
	Thu, 26 May 2022 15:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 334D1F8014B; Thu, 26 May 2022 15:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0753F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 15:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0753F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lg0yYuff"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8BA861AC2;
 Thu, 26 May 2022 13:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097AAC385A9;
 Thu, 26 May 2022 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653573504;
 bh=PmXYcl2ypiDCMUcautpDUCznwapHrv2gu+aDgn737Po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lg0yYuffcrnlILumzAnFKUmkCnJrpQYr4HnwHVfMWn+cutYGCpuVr2OjQ/3oKE8EY
 MS1C/pHsM1lJ/0FSxh4cilu75mtuQLEkCj/bCEhPOXGLS1PDfLsubYzIgyBBeQGmYA
 zr+sYjUvO8F/gVv4AhhMUcverTPEUr09cK2DKoEAl1nw4/1feySmDwR2ahwqY5WR1A
 HF330LfQfitDQZCC8YCk0HLg4PPUw5FwTdOFlDoh4as/m9XKWm6nYW/BzuZm4V/fIK
 DQNoPdaIz7Kl+NItzc+OqCHmBVe09eH7gdN9K7X6ccDag24h6zXkt55cfHTRF3g4Y/
 hwrCJUS1gv46A==
Date: Thu, 26 May 2022 14:58:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: About Cleanup ASoC
Message-ID: <Yo+HcXe5Ru0mxBT9@sirena.org.uk>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v+9VlTkSHlqbXVVR"
Content-Disposition: inline
In-Reply-To: <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
X-Cookie: Money is the root of all wealth.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--v+9VlTkSHlqbXVVR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 26, 2022 at 08:48:26AM -0500, Pierre-Louis Bossart wrote:

> I don't know if it's feasible in a Device Tree environment: the DT blob
> exposes the machine device, which uses *references* to resources exposed
> by platform and codec drivers. If there were multiple machine devices
> for different cards, how would that split of resources between different
> components be done?

You can add whatever properties you like however this is getting into
policy decisions so isn't really hardware description and it wouldn't be
idiomatic.

--v+9VlTkSHlqbXVVR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKPh3AACgkQJNaLcl1U
h9DFKQf/fS7GgVeq+Lx2FDTH1x+pvkbu5Qc3dswf2RGtyAdBnCzKsE6yJhn36E67
2VSyKUQ62WkU1kXUlkcZYG0bJw35goJR0hhB7E/VNRguewhmWbVTCldPl4hGghDs
qEcIKi1fFLj15vZsQ8d7HSHpQj2V0mOVopQPjJ3MP1xyfntrZkHPuZX3psC5nr3k
iR8tCFNsJciNHBZKngYF42TgH9cSrmy2qpgdBLfniepk92H5p02BFOWIGOVsW4J8
IB5R5u5nvuCKgHLc0ZoL3nkAhzpThpAu+j5v4BztBfrAe+aC6h/aSW0GL7oWLRJk
zaEM6BX0sE6GZGjpnVRbemO/Lj9mzw==
=Zmy2
-----END PGP SIGNATURE-----

--v+9VlTkSHlqbXVVR--
