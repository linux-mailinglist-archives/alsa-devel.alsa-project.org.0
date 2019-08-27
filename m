Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372709E60C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 12:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A26E51607;
	Tue, 27 Aug 2019 12:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A26E51607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566902887;
	bh=2i09UaANL4B60EncOxiGcrQixKBpVRjWfPVujLgsu5k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYRzLzfcGFZkjW0TWiJtZDedRsF4cRLXdWTqoPCm7VKwIEIZR5dkK5mPg+OkABP3D
	 5fgsIau7q9edi1oeRiHkjTcaxpLYTsytmIpkH+H+CFMosaou7BlMGh1ej3Wye0Re5n
	 iU5T0W1573kOiKLGoLyAslOzhcAoMGtOFj8e2cqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A01C1F80274;
	Tue, 27 Aug 2019 12:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A80F80274; Tue, 27 Aug 2019 12:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16335F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 12:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16335F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SpcTXMiQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8QAAUf3vEixa4AQLyanZm3bk3o3NCepVwowzlteGrV8=; b=SpcTXMiQRD7y+zEJj7wHEMuF4
 BdHm2bdibtEv5B+rAJ0/EF+oWbDSmWg9KZTTH95faBeQs4OseJpdk1lTxb4kOQMe/faiAgyE9jVPL
 v3iJ12dlMyxSwM0jmxfpZoy9dG7xoOY4qvJ+kJnde+0Xempz1BfkDPGyZejBx0KdfnbCM=;
Received: from [92.54.175.117] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2YzP-0007t4-Tr; Tue, 27 Aug 2019 10:46:15 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8B4A3D02CE6; Tue, 27 Aug 2019 11:46:15 +0100 (BST)
Date: Tue, 27 Aug 2019 11:46:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Message-ID: <20190827104615.GZ23391@sirena.co.uk>
References: <0e5b4abf06cd3202354315201c6af44caeb20236.1566242458.git-series.maxime.ripard@bootlin.com>
 <20190820174105.96899274314F@ypsilon.sirena.org.uk>
 <CAGb2v64vzcZbXqfW27cgobpQ-AXQjb2zanqotAR0ezw+6KCdpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64vzcZbXqfW27cgobpQ-AXQjb2zanqotAR0ezw+6KCdpw@mail.gmail.com>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] Applied "ASoC: sun4i-i2s: Fix the MCLK and BCLK
 dividers on newer SoCs" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============1817136449615383448=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1817136449615383448==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lIC76ItX9S6XOZ/S"
Content-Disposition: inline


--lIC76ItX9S6XOZ/S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 27, 2019 at 05:25:21PM +0800, Chen-Yu Tsai wrote:

> > From: Marcus Cooper <codekipper@gmail.com>

> The authorship of this patch looks to be wrong. Maybe it's a tooling issue.
> I imagine it might have happened if Maxime created the patches using
> `git format-patch` with his @bootlin.com address, then sent them with his
> @kernel.org address, and `git send-email` swapped out the "From:" header
> and prepended it to the body.

No idea.  In any case it's kind of hard to fix at this point
since there's a merge in the way.  This is why I like using
branches for things but Linus doesn't :/

> Either way the "From:" line looks odd in the commit log.

This is what git format-patch does when sending stuff via e-mail
if the author is different from the sender, it uses that to
override things.

--lIC76ItX9S6XOZ/S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1lCfYACgkQJNaLcl1U
h9Di7ggAgNoZ8rQn7YvVm4cejhwJBcdMuUs1+pBMAGoZh58gwfOMXjpmjeBhjc/F
tSA0tLaf56ov+6K+icWnoYNv3uAMWBA1jimgQTS/ZOPTnfNPQ94/StKIHQKDxj+U
o4MwOkNdSc/ilIGdzRYa9mbTszAjTcB8zylCWd8ONcxTM8RxADVVlVSNXinS7ZnI
cslI9umNwU7+S8WoO7Q5gdk0cOHWmEjW12kgv6LsT6GyLrdlY08Nylb+uaLX+cQP
Tfoym0mSqCbh5/yCHO5tffAuvsMTUdWw+Pid75EkdaY/u4zmnn0+4D5n64a/wfmi
o2fP8Rqk1GMMBWKc42wqfjqulKd53A==
=onS9
-----END PGP SIGNATURE-----

--lIC76ItX9S6XOZ/S--

--===============1817136449615383448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1817136449615383448==--
