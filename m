Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AAE1D9A17
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 16:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3192D1790;
	Tue, 19 May 2020 16:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3192D1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589899074;
	bh=C6EWjtedLGwqvy2K9YYDlSlp1wXijD0Uj/LprssIUUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjQ0P3PrHiBhEf+OS9Ve6AEAQzkhx2pKym6VYIueDifpM3DoPY64eJOdKB4ia08oy
	 7wK5GZRHXg39xQZWc2pk4z+lSASnHGkBJs9w50fDQt1Q4FRqH5zL/ZVo8IthqBUo9Y
	 7mFIF2hsVVJek6RMsvsjcG1n5YBDSnA7BCK5UIc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 919BAF801F8;
	Tue, 19 May 2020 16:36:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6EA0F801A3; Tue, 19 May 2020 16:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FBBFF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 16:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FBBFF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HPEBnsqf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BAC3E204EA;
 Tue, 19 May 2020 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589898986;
 bh=C6EWjtedLGwqvy2K9YYDlSlp1wXijD0Uj/LprssIUUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HPEBnsqfBP5p2Z0eY8BUg8oZJQfjWPvKZhp/BxnLMe8Q+CGhoJeuMuw8OcXLmRkbs
 CTteO+I2FEsEXCTTw6Mhgw6LFUO1K72lr/dxPrJcB4CCWggr0BrMx/3rXEbrjCWwQi
 xtWORGVAyZEUywWO3pC3a44dmg0s+uevjnLuL3AY=
Date: Tue, 19 May 2020 15:36:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Message-ID: <20200519143623.GL4611@sirena.org.uk>
References: <20200519075858.27869-1-geert+renesas@glider.be>
 <20200519124714.GA45550@sirena.org.uk>
 <CAMuHMdUHHzBNFHy07hgdryJEeHUDMOCP8XauCn7TmUK7uGZcFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sCNd3Ivk/oijKKf1"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHHzBNFHy07hgdryJEeHUDMOCP8XauCn7TmUK7uGZcFg@mail.gmail.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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


--sCNd3Ivk/oijKKf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 03:33:01PM +0200, Geert Uytterhoeven wrote:
> On Tue, May 19, 2020 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:

> > This doesn't apply against current code, please check and resend.

> It indeed doesn't apply to your sound/for-next branch.
> It does apply to robh/for-next, which has commit 9f60a65bc5e6cd88
> ("dt-bindings: Clean-up schema indentation formatting"), so I guess
> Rob will have to take it.

Makes sense

Acked-by: Mark Brown <broonie@kernel.org>

--sCNd3Ivk/oijKKf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7D7uYACgkQJNaLcl1U
h9AdXwf9F+QuYk9a+SUgYNZ1Ji+henF264E7f4Bh7WdvB4oiefqaaK5meCJ0PxhV
mIUVO6ScSgRHcidWCJXIFNsmjNTS/vutR3RULzT+I9QPJIrx7IvMgnBAFsTxssOE
JdCtLWUqKYqRmbHk8ngmCu+It3I8KxOQvruZoVxrpLIrui4Ld0+2K7PosiESg8LM
xa9oNFfperdahGO4zbQ1Q6j1goTwnSO5qywsbgrfLa9Ft6GhlLdZqPsXg5WgH37G
y1SsfhFcsMjyx4UaiBBJM7Y3gVxwEt9KI0WxEfER6brc4nE5VBOAMo4cWjEXRkvZ
zoffd+yPURmu7eFDZB413wlK2Trlbw==
=DeUG
-----END PGP SIGNATURE-----

--sCNd3Ivk/oijKKf1--
