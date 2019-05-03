Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88212815
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 08:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE0E187C;
	Fri,  3 May 2019 08:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE0E187C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556866451;
	bh=n8PP61XYkaLap5xkNvYYe8D4Jq/NxpXTwRFEgIqRh5M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mgvd6IZg8HcNgmtal0lnyE0cPsbc22Pk0tw9pIj4apcAaTsFS80YZgau0hVESU0cg
	 XB8uENaOcgfNmZBqwfw4iiGZfYSJmZTStEzzz+PYDO4hp35eAyz24BDqAlXF7pherK
	 CPZ+MA5gofeDf5FBHt9thKH1RhTKTLI35QeTmwIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81036F896B7;
	Fri,  3 May 2019 08:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2547F896B7; Fri,  3 May 2019 08:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_SBL_CSS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25E5CF8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 08:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E5CF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gfDsgzG+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JlQAeL3Y/OZXPnUamb7S3t7t4kp7KHEAF4rsUZp0Y0E=; b=gfDsgzG+0+1WFyd4Mpi/ZEgab
 PGEg86/XfJ50OesRqJc45oR0T5Kn2jVg5rpO7/tO6UJTJG3aXHU8bxzFhfBbzZpIWOjxQxIeKva7o
 Nxyc6cfaULJhmhgLL6++JF2fGsv+Gtk2vaMd6WIsPbdIkNvgZrVcTvKIhC8JHMmn13XUw=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMS3O-0000sI-A2; Fri, 03 May 2019 06:52:20 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id B398A441D3C; Fri,  3 May 2019 07:52:07 +0100 (BST)
Date: Fri, 3 May 2019 15:52:07 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190503065207.GG14916@sirena.org.uk>
References: <20190423141336.12568-1-tiwai@suse.de>
 <20190423141336.12568-2-tiwai@suse.de>
 <20190427175938.GJ14916@sirena.org.uk>
 <s5h36lxpcbd.wl-tiwai@suse.de> <s5hsgtxnvhz.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hsgtxnvhz.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Add support for Conexant CX2072X
	CODEC
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
Content-Type: multipart/mixed; boundary="===============1904691544575323139=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1904691544575323139==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qCuyVVLLFvr0p6ls"
Content-Disposition: inline


--qCuyVVLLFvr0p6ls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 02, 2019 at 09:52:40AM +0200, Takashi Iwai wrote:
> Takashi Iwai wrote:

> > Not to read the register while the chip is turned off, I suppose.

> Actually other way round: the codec driver tries to avoid the whole
> register access while the chip is in BIAS_OFF state.  OTOH, the jack
> state check is still required even in that state, so it flips the
> cache-only flag temporarily at reading the jack detect bit.

> I guess we may remove the cache-only behavior, although this is a
> nice-to-have thing.

No, it should be removed - it's buggy and racy.  Devices should only be
going into cache only mode if they can't be physically accessed,
otherwise you end up with incoherent things like this that create bugs.
If the driver is actually able to access the register map, actively
doing so and therefore needs to try flipping cache only mode on and off
without coordinating with the rest of the device it isn't really in a
cache only mode.

--qCuyVVLLFvr0p6ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzL5RYACgkQJNaLcl1U
h9B39Af8DFdRU4DenPYRVOhhCVX5lnAR3Y1cM7UtBQlzr6G2ZaWkp5tK51mXP4E0
3QttvJVXq/Vv3ckDP8CuLtN9LMGc1030IeYe1nUglbsmo82qt4IKxY2WqdKrXCDd
4IqfHD/qRn77l513Eq0bYueZ04XBXTyua6LejeO1YqEao3jlESvwF4SzLdKjlwu7
nsKns/xTma7PQhjXVA66SMr8BHzIQZx3QRNmA2v6BT5XTKUick+oz+k+UdHBu7uv
wxuIXDb02iVEdn2jKHlVG6DQQFw2OyEu/KDuWzK0pcZbKNyxSwWr3lptwFG7gtbh
ojRy7vadrRTT04OYJTtGMHbFP5Nblw==
=DMEO
-----END PGP SIGNATURE-----

--qCuyVVLLFvr0p6ls--

--===============1904691544575323139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1904691544575323139==--
