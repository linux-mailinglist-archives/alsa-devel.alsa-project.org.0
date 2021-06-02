Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25053398FE6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 18:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B001700;
	Wed,  2 Jun 2021 18:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B001700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622651096;
	bh=UCoY7WAQxdmxFwmXEbFK0I50CsM6OmgTJPzu0d26h3U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezThELN+JHDf+fsVLviXocHS/KsHGYzOFD8W5LFMo1idRFc9hu6vwtXFylNsYi7zt
	 mkYqiahrESbqUnlu2YSvP6jZ1hnsjFAGZKODmGk6TqQr1QFJDphtxBF4NKBoTqr8rL
	 KlyP31ne9ALDuLxzSmJkatUclijFD1lNA9FS8PHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0987F80425;
	Wed,  2 Jun 2021 18:23:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD6D8F80424; Wed,  2 Jun 2021 18:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4101BF80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 18:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4101BF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fvjJyCIk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA92A61621;
 Wed,  2 Jun 2021 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622651002;
 bh=UCoY7WAQxdmxFwmXEbFK0I50CsM6OmgTJPzu0d26h3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvjJyCIks2sXfONtl5DXws6HSpqJ+p1K7nQGQkakuLocp90OPO2Mc2fCYObOLxU+Y
 cQd4xjecyKwA7dskXObml2Jed6QYrkaJzbWVsMA69EdRPF1Vr2clXbyAuf7zbawj9U
 WgpIN2zlyy4J7tGeTkooYge2hZIQ+lZTiOHMu0QwghHRQ2ru0rF5DsvR0gS3MzM3d1
 IgbQC79ncR8/y95710Tqothm9BW3JqiGhEn9DE9fwfRQhUmHIV8+w613CIfL6fZ1VR
 rweDYnYWq8083p4g4ZwrNA3lMkqrcnQgxQKTL49aCJEfdVBGv64lUeSHG9NcymiM/c
 PvG6YbjnyKlGA==
Date: Wed, 2 Jun 2021 17:23:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Pearson <markpearson@lenovo.com>
Subject: Re: [External] Re: [PATCH] ASoC: AMD Renoir - add DMI entry for
 Lenovo 2020 AMD platforms
Message-ID: <20210602162311.GB4914@sirena.org.uk>
References: <markpearson@lenovo.com>
 <20210531145502.6079-1-markpearson@lenovo.com>
 <162265045454.22459.12647691279142134758.b4-ty@kernel.org>
 <8d6916ed-af82-e9ff-7728-411a5e2a48eb@lenovo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline
In-Reply-To: <8d6916ed-af82-e9ff-7728-411a5e2a48eb@lenovo.com>
X-Cookie: I have a TINY BOWL in my HEAD
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: stable@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Gabriel Craciunescu <nix.or.die@gmail.com>, tiwai@suse.com
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


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 02, 2021 at 12:19:25PM -0400, Mark Pearson wrote:
> On 2021-06-02 12:16 p.m., Mark Brown wrote:

> My apologies - I found out just now that this patch causes problems for
> the microphone that I'd missed so need to revert it. I was writing the
> email to pull the patch when I got your update :(

> Sorry for the confusion and churn - I need to go and work with the
> firmware team to solve this one.

OK, please send a patch doing the revert, explaining why it's required.

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC3sG4ACgkQJNaLcl1U
h9CU0gf+KpUyNkhlRC55JdtpkQPk8L5LJt6imVAUOtjeeRWVr50H2QRM6Xyiqonu
7ouM/XwVTSkzyKn650R1T7bVkwon6hRoprWWfnTn60txgaxQxFb+hqNR0OlyFu6m
VZUZAbveXs5npvM8Lf8fPuxilbW22OryDCnTEXdPrJYCGeKkjITMIKBl1vWHfQG4
Pk+0luleD3WEvNXThJoMe/IpFFSpiApeJnfDDxoleElsESVocUgkhBQ7srV69CJJ
6dPm36gayeUvZCbOefAjadqXSkglbgRCKT5AbbsTFcefriF7PQ9R4r7xEPfe9qLU
axWJhcGKdys7uslEuc9IjdlW0FQ0Gg==
=JwRH
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
