Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A42A2D1F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 15:41:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68634171F;
	Mon,  2 Nov 2020 15:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68634171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604328061;
	bh=KpJty3oiki6h0YdYHu1NHIFu21+mA2Am7+1yhjzp018=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2+tqGhA1gmpUCLrY9aVtE6S8ELpSKUKl/wAGIRPRvqgGXnPH5y8B5WRxQ8k7OKLf
	 ZAMFAqwPNNizgNjuXdrq8kXhpU3aXlEelrqXZ+aMZTc3i1SBVhU5n12NgBEW+d2JOG
	 9flTutztKw6S66yFGbUWa6YkRtC00RLLbOhGXytQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A89EEF80234;
	Mon,  2 Nov 2020 15:39:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D219DF80232; Mon,  2 Nov 2020 15:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790B4F8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790B4F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FN1lX9Px"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67E792072C;
 Mon,  2 Nov 2020 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604327956;
 bh=KpJty3oiki6h0YdYHu1NHIFu21+mA2Am7+1yhjzp018=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FN1lX9PxLoXzWXOAX/+61VE/buxJ/jcVtFucnRKUtr94/vuc4aNNcXtP9DqYDu0x/
 QnMyR2ixMlniJMhSlUZ5WafZJsrH8ef6QBQmdHznXlAnCV6vlsL6qJaCKkNuWAneUq
 BL61be2cZHtu3+SkxogT+DBUJts47tMGMvwNcNpc=
Date: Mon, 2 Nov 2020 14:39:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 2/2] ASoC: soc-compress: assume SNDRV_PCM_STREAM_xxx
 and SND_COMPRESS_xxx are same
Message-ID: <20201102143907.GA5014@sirena.org.uk>
References: <875z6smszj.wl-kuninori.morimoto.gx@renesas.com>
 <87361wmsyg.wl-kuninori.morimoto.gx@renesas.com>
 <20201030140150.GE4405@sirena.org.uk>
 <87v9eohe5t.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <87v9eohe5t.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 08:08:57AM +0900, Kuninori Morimoto wrote:

> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >=20
> > > soc-compress.c is using both SND_COMPRESS_xxx and SND_COMPRESS_xxx.
> >=20
> > I think one of these is supposed to be SND_PCM_STREAM_xxx!  Otherwise
> > this looks OK.

> Grr, indeed.
> Do I need to resend ?
> Or can you fixup it ?

I should be able to update it.

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+gGgoACgkQJNaLcl1U
h9B0ywf/WEFrgHnDyMEF2H3iTNlIPDyF20WdiIzF8/OaZqBuGWKF8Jop3lM5oXmc
FVFYhGcsfHcPmR/pPEh/hhrRUvJV6IOCQ168EbnNcjfa6IRFWbhKBrczYQL+2dBy
cAAQdfg5Q9w30IeTeNKKqeU8BLwAOnZEUjvJVE0oGgR6niRCIjKxKh07+RMAluwh
xnN3mx/oyhRHueyi7C+jfBCUZ+4HPh7zAKE/8MbSJ1BEzMTVIS+TCzI653+r4zuO
sOaMVRK7SjodrNLNos6c8vyhmZsCh0T3Vu3rB5bF65YLQSrGh2mV5XxWGbQ6qCdG
riZvacSsw7yFZmAG4JVO0tC1Xu9Xrg==
=tbnu
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
