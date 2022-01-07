Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0705487A26
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 17:12:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B0D618BB;
	Fri,  7 Jan 2022 17:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B0D618BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641571932;
	bh=+bRBiiu+vY6g6r/bhBId2ouHPBKv6FeRjaexg3pIxe0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDfAjp94S4GlmIw6Vx2tkZ8aQNpXvzsp4Qj6KRp8lBONK14bna0oXpbscBQ0vX88h
	 +f4bTZpM2AyMKQNfu0cmVgx082yHb6DT4U71O9EBveMoQZyGM/IZkh9C3J+DbnYtXt
	 5vmEAGBvMKlx4TGeo0W+qV4z4bFhhDsmFQbJLj6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACFE0F80254;
	Fri,  7 Jan 2022 17:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97457F80249; Fri,  7 Jan 2022 17:11:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D16F80082
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D16F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K2oSle9a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8226260AAF;
 Fri,  7 Jan 2022 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83465C36AEB;
 Fri,  7 Jan 2022 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641571849;
 bh=+bRBiiu+vY6g6r/bhBId2ouHPBKv6FeRjaexg3pIxe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2oSle9aCItIMB91HZjg763/7OsqOboUjBwjusqHzEJg7zGqLcI0LajnUm6XxvbVe
 9cvY451dS+t2FQ2Fi+rQQZfMLSTdCzxg1oqpgLCBdNRFsSyqkPNPiIq2aR+XCQ4YuJ
 579Zca0S0rpWZwew2D4Od7E8LaQg3rtYPFlLuCZ8b+v83dbSxP4jsLZdrX6OanexSm
 wIAdz70e8s0CrxzR1glvxUjjZvHHtvF/nbWvUAXYEbJh0RYvUi3oWTmt4xuH3LPbIF
 /PCqct+1CLDhpMcKwwns9tH4qpZFkKqBybo6/fpc9IIkfgZ3hKNpHmZUr1UtKXFQpC
 fOUhRHs8B3vUA==
Date: Fri, 7 Jan 2022 16:10:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] Add low power hibernation support to cs35l41
Message-ID: <YdhmBS4A+qzAHm/q@sirena.org.uk>
References: <20220107160636.6555-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UGhceDVfkx2yM+yp"
Content-Disposition: inline
In-Reply-To: <20220107160636.6555-1-ckeepax@opensource.cirrus.com>
X-Cookie: teamwork, n.:
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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


--UGhceDVfkx2yM+yp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 07, 2022 at 04:06:34PM +0000, Charles Keepax wrote:

> These patches will cause some very minor conflicts with Lucas's
> currently outstanding work on the HDA version of cs35l41.  Whilst
> things will still build (well now I fixed my silly mistake), this
> patch adds a test key function his code will now have to call.

Which patches are these?  It looks like everything I was aware of is
merged.

--UGhceDVfkx2yM+yp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHYZgQACgkQJNaLcl1U
h9DvZgf/ZF064tZhdCwMwWh+5obBJcQ6ubJssdqZWt5GZPmIyLVsL9sVsBLYbhZq
WRLeKH6UO9r5i6+jAGChYq/Bcco1xfob2xFEqjyCHYn7EQcdK9PeCcfryzXzeJmI
ix4Zsc/5ny+9yG1OHKn6oVSoyJ8qrCh9BZ2Swtjzn0pvvm1wajnwlNYlC56uTHRV
yTHEWVmKwpGqaOfsPbQiMT+8L5WtRMl5N/HX2Zeh8igNXeb8YPjvY8gj/4H0Y4Ek
Pi9wooOLbZk2NTcf8d3AiBbsOcNg6qZa2ky1cdZob9dzjP0vBLL+NSeRG0rgLZCC
aTNAu33ocYep9pD9VjUBFVL2yuCOqQ==
=nkoz
-----END PGP SIGNATURE-----

--UGhceDVfkx2yM+yp--
