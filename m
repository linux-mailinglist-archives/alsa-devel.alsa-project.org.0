Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA848372E04
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 18:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0D01695;
	Tue,  4 May 2021 18:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0D01695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620145603;
	bh=d0zOX0pHJzsgjXUlHWQinXCcgbbeYod6xgiZ1/M2PtU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wut0swPlaK4Uuy9KqTnbDxOnsGzBFlHHYcGql0ONWfc7J6Ds3AuXL3H5T+Kh2+uxX
	 N37QGKVP1eieeoFWjhyQGATfsumdz7ID4xd63GbTtYMa+6/D8TPu34tAg5agr7Aac9
	 NuNxP33CZJuhs/UV3CGF9lLRDkDp8hKIwH247fNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4051F80234;
	Tue,  4 May 2021 18:25:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A5CAF8021C; Tue,  4 May 2021 18:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4201CF80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 18:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4201CF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TCOuNadz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19C2E611AD;
 Tue,  4 May 2021 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620145502;
 bh=d0zOX0pHJzsgjXUlHWQinXCcgbbeYod6xgiZ1/M2PtU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TCOuNadzyZEII1Ur8bHzXPd0Zwj8cC9gufmZ5bde+f2Nnc1kwzZlnWACrPPCz5Ve3
 ZkN47CEl8T1tKqRQylmr2Ig8jivUyBroHlipxo8piObWx1jl7mt8PRsBRrpcn8cewB
 IcF8MSPy++kSTV8CCE0gW0Tdqyv5CGeIrjhEwQFKQuNnXNp6jKNGUVYV4z4VBFOAq7
 ZuzaKCgrFTn4j7mx6KzHq2Ov0LOwrTqbIiVEsunlIlkrOji6TnivRzO4t3qFo6R31l
 mj8lKfIBu4s+1wAEcbgvOMxeuW+LjV6/JYl81XUiMsMTzif9r99mGeiHH7wCzWcz6+
 dIDMKF2fiqD4Q==
Date: Tue, 4 May 2021 17:24:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: Intel: add new TGL/ADL configurations
Message-ID: <20210504162426.GD7094@sirena.org.uk>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
 <161858869852.28833.4104992497142755503.b4-ty@kernel.org>
 <ce1dde92-6d5b-8fa7-8b36-a6efbb39b922@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline
In-Reply-To: <ce1dde92-6d5b-8fa7-8b36-a6efbb39b922@linux.intel.com>
X-Cookie: MY income is ALL disposable!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, "Lu,
 Brent" <brent.lu@intel.com>
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


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 04, 2021 at 11:19:09AM -0500, Pierre-Louis Bossart wrote:

> Mark, I thought the series was applied but only 3 out of 9 patches seemed to
> have been merged. There wasn't any expectation/pressure that they would land
> in 5.13 so that's not a problem, but for the 5.14 cycle should I resend the
> remaining ones, we now have a new machine driver developed by Brent Lu [1]
> that relies on the sof-maxim-common module in patch 9?
> Let me know what's easiest for you, thanks!

I don't recall deliberately discarding any of the patches, I can only
assume that something caused b4 to only see some of them.  Please
resend.

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCRdToACgkQJNaLcl1U
h9Bapgf+MmmPbHXsPHPDz+rW7EVAU5VmOw08CI7opKUwj5EFxPSUld0R4I/Zh7Wp
UWslvAHmjpvo2ZCvhSiAsBZccZkJ7xBpbTHhEWQFQWUFmBtngTw715rzPncoweFu
YhmAb9Ib6FbTzAaSoyGx85uD7H5vs25t4TXAb65/sn8iqS8Lg3FlhwmRW7WHd8v6
WMupWTV1c+QxuFQa51ZLR+CBcep+JUBRBtbevxdNQNAvYClvRkIfoIgbsB1iEBdM
yxMIN7P434h+nrK29FetuKcikcml3f46fbDX1yJ7Kr/1yT7h2FmRS+IQT7UYk7P3
/SUsTYUuV9RSpHMblxoAXfbzmJBMVw==
=N6Hc
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
