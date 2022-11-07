Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2361F607
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 15:30:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01371DB;
	Mon,  7 Nov 2022 15:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01371DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667831406;
	bh=LSL5E65oSDMAePIFF3scAB4HMBSWUk9M9ubTRhNvo+M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTY4CEcr1ppDxyU53jQhIF2oKF1+fLfN0a5/Xud7lC7ymgYlqHDi7yk5Z4NIYHeU2
	 AQrzjWdXUdgOTFvSebclm6zTiJhPRNS1lOeh1eFCAANKVb3Z8x/YkHLvhooASgVck/
	 8A7fyEnOsA0dKZEsfcnN1IMPhHDJ0GiGHGzT+zBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABB9F804BD;
	Mon,  7 Nov 2022 15:29:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C87C6F8025A; Mon,  7 Nov 2022 15:29:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2946F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 15:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2946F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AigbpHsE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D41BFB811E9;
 Mon,  7 Nov 2022 14:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03C3C433C1;
 Mon,  7 Nov 2022 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667831342;
 bh=LSL5E65oSDMAePIFF3scAB4HMBSWUk9M9ubTRhNvo+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AigbpHsE+HRb2x3yabitMTVm7nUzEEZ1+sGHQXF9jQsL8V6t6s5a1yZVkbrYmB3S1
 CFSw0vSPJDVKbLJxOMcsdW2jSDbTOV9o0QXxTDTF3rR0M3LrjeGHXDl6hoAhciQEsR
 kJnZw6gXTrW3737a4p3ZHDqdI8Tg/zM/AhLE8EcRVWy1ft/lLaJuVneu5KToEK/csO
 5JQyKX3r8fB3m34m4GW8YTYijFCibfndiu+v+qb0CzTNSTLUZUUH93h6f2h0bgF0Jm
 /XwFiR9UDy2eYCjUBSW3wzFXhOfDktBvDspqJc+AA3BG4ftMxeiCV0SN0gq3I/YgXs
 ToD65j4LCbzBA==
Date: Mon, 7 Nov 2022 14:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 2/3] ASoC: core: Inline resume work back to resume function
Message-ID: <Y2kWKRLp2WARpPqZ@sirena.org.uk>
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-3-cezary.rojewski@intel.com>
 <925c6405-f651-f68d-73f3-46cf85cb2fa5@linux.intel.com>
 <Y2WmRUBJ+7K5zBm7@sirena.org.uk>
 <3ebce110-1a76-e59b-2172-616a3c0f1984@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HK9FO/3nfGzccr15"
Content-Disposition: inline
In-Reply-To: <3ebce110-1a76-e59b-2172-616a3c0f1984@intel.com>
X-Cookie: Minimum charge for booths.
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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


--HK9FO/3nfGzccr15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2022 at 10:26:14AM +0100, Cezary Rojewski wrote:
> On 2022-11-05 12:54 AM, Mark Brown wrote:

> > The other question is what we'd constructively do about a resume failure
> > that we can't defer.  It feels like we should at least retain the
> > ability to defer for devices where this is an issue (older components

> I believe that framework should be supporting both, the deferred and the
> instant resume options. 'void' in front of suspend/resume in ASoC hinders
> developer's options.

It'd be good to at least have some idea of practical usage as well, the
functions return void because nothing was making any use of the return
values.

> (load)
> The HDAudio driver is actually a good example of how to do it right - we did
> not modify driver/base/ to have ->probe() return void. It remained as is,
> instead, a developer opt-ins for a delayed probe through a workqueue. This
> way, everyone is satisfied.
> Cohesiveness is not to be forgotten too - keeping behavior and expectations
> of the standard set of functionalities aligned with the rest of the
> driver/base makes it easier to hop into ASoC.

There's also an expectation that suspend and resume be fast...

--HK9FO/3nfGzccr15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNpFiYACgkQJNaLcl1U
h9AjXAf/ea9alJe6oA/o4y/IsoB/h0joKlLTwFWWWnLj3GvrxYXLKq67fvFG7g6m
5wJXOfk9ZRV9SD5zVEnj8RRtT3zGroa8R6o6jfK/fo3QN1v38IurPdmJLAkqdk6e
GfKZbrCXYPUPgpezDXT9MK0Wpg5zulrVBBZpvbT42gm222O4esHRFTQckuf5vNLc
3xFW8Omz0WvqoTd7mhmlpZ3eA3Zeqvu0G9flZOOfd4EIEOE8sneEZ5tpypHMtIFb
ua7vs+MJUDHhdrrz7UddJYQxBiHDgzHSM3kD+TxtGLID26jpVpAdpsIwy2aqCx+D
fqbTL3DCbXNfE2SZwRXZR6OPLnVd2Q==
=kU6L
-----END PGP SIGNATURE-----

--HK9FO/3nfGzccr15--
