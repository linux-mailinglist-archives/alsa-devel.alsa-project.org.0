Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F953405A5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 13:39:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E39D1681;
	Thu, 18 Mar 2021 13:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E39D1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616071182;
	bh=sB5uw3STz2TYweS4HcUmZnoeceFul0CoHn5xYzH3Jcg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbkfTzjPfBmTZkmYfbTj3pUfG6YjqeWsxmoGzpTyRk/jZdO3/gXrBXZAIvRbAOMCb
	 8psqvDmXs4Sy05CE3B8TrgJfo9Ar9Hmlt0oQHI/Ogma86Je9gNMZFzkRn7WPWfuKkJ
	 eizF1rX9kw4b//QnKi8RbekvoFMl61efWDrpa0T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F786F800C8;
	Thu, 18 Mar 2021 13:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 672AEF80165; Thu, 18 Mar 2021 13:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B186AF80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 13:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B186AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qJ3uqNrE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 346FE64E33;
 Thu, 18 Mar 2021 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616071083;
 bh=sB5uw3STz2TYweS4HcUmZnoeceFul0CoHn5xYzH3Jcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJ3uqNrEJe0XswSQ8XQ4t5k2zKZ5bsn/Rka6J/aZLVbUur2nEypnytmb3DkRpwt5u
 12cbctfuLNTnNqIA/oSPj7dam5yIbYd9lyvOylfPxJKAOVQUE9ZJfoIAL9HutD8OCg
 ZC7SPCeUzqGoRukyGuhc5jUO4CkjqY1kTtnBBRgMH8Uync0elaBq3118TAZvjsbmH1
 23Fg1LP9DNhdlHAoUPTw+05TShoDsgaybSOPicnmFS7HSog7Jv3kQSxHE0sOvjDHHd
 qhm8BGTqL6bdO7NE/joJosvJgM7VBB369GHTrhb+YYyqMbRxftV6VjJNe/5Z26kDp5
 8R24QbN82CRDQ==
Date: Thu, 18 Mar 2021 12:38:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <20210318123800.GC5469@sirena.org.uk>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
 <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210317204453.GF5559@sirena.org.uk>
 <SN6PR06MB534202C2ADB33A0CD0AF77C0A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210317210530.GH5559@sirena.org.uk>
 <SN6PR06MB5342A36ADB963DCB4402F5E6A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342A36ADB963DCB4402F5E6A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: You are false data.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 04:18:16PM -0500, Chris Morgan wrote:

> Sorry, still getting the hang of mutt. I've got my wrap set at 80 now, and I'll try to make sure I'm replying correctly. Hopefully this one comes through correct.

No change visible at this end :/

> As-is, when I start the driver after removing the device-tree compatible field or the of_compatible from the MFD driver, it doesn't find the mclk (and thus doesn't start). But that's my problem, and I'll try to get to the bottom of it.

Do you have the MCLK mapped in the CODEC node or the top level node?
You will need to have it mapped in the top level node.

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBTSacACgkQJNaLcl1U
h9AMWQf+LfdWhieAo7yDvuTc9cIsr839vs3MwJ7GuTUKfieShShZ04fvfokRtLp3
c7CJIPfO+uT5yFtWqEwqEg4fhg4X59pZSZreT66Vo64XBRNNDtTidtxQhtwfENIW
maR0zbklhfoIjGRcQPDh6Mjnl3VOjGFEzxFohQimTedJ5kARLykfSVeav7A6Xkjf
+ft6pmNOje/dYwqkdD9U/bUyQFaNuCjhOOl/8xF6pi0PiDYk56TiALOf/HZTgcOE
mJqZPsZv8pSr3E385Y4pllDzEzr3C03v1KFkLYTENJKWh+/vIUnZqUVy6U8LMe7Q
IL+o76bJIM98Dit08p/GUKzryTUwdw==
=Qn9O
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
