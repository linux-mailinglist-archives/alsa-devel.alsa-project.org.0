Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B775066B1F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9A31680;
	Fri, 12 Jul 2019 12:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9A31680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562928814;
	bh=kuX0tm+X8YNPv9APwliQ4rzpVN3YoF0tJaEHYGrWDCc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHsQ8taL87PfAxtVCajhl1C/xTatsKcPkNjzEgcdoAZU4IKdJSy+wxahsX1Wreve/
	 mHhTW6id7zy1q2h8MlKso9nIlC7TUT3VYrfwWZ0bZMqD7ycXNpkPdlZAqiHREE+r1q
	 1NYEuX0AfJgmwIfsvhlYZd+mnyd4RiyN/Jr2nIj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2288F802A0;
	Fri, 12 Jul 2019 12:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12E22F800D8; Fri, 12 Jul 2019 12:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 832E9F800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 832E9F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ezvzt9ay"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aaI4p4EEAxpN02vVJPJQogMN4BqQgEI0aPUI4CF1HAI=; b=ezvzt9ayQtGkPG5mm7g7jbLpD
 T0nfbe7J9CjZI+bLj1cGGHd6Mw3zYxwUPJXWWlqgSO3iAjK5UVjtGKzxpxRFecbnpV/k+dE8Wu3bP
 GTCivmORAqr+pq4dkPMvQZ3O3TuBjSZhidLUm9/KfHAR2J4uLesGaAdzTH5IFxfrwdyV8=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlt9T-00068h-I8; Fri, 12 Jul 2019 10:51:43 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 343ABD02DAD; Fri, 12 Jul 2019 11:51:43 +0100 (BST)
Date: Fri, 12 Jul 2019 11:51:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190712105143.GK14859@sirena.co.uk>
References: <87sgrd43ja.wl-kuninori.morimoto.gx@renesas.com>
 <20190711115807.34F58D02DA8@fitzroy.sirena.org.uk>
 <87ftnb66na.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87ftnb66na.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Visit beautiful Vergas, Minnesota.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Applied "ASoC: audio-graph-card: add missing const
 at graph_get_dai_id()" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============8306428139368744638=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8306428139368744638==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuKVzAmB+c+zQlhu"
Content-Disposition: inline


--uuKVzAmB+c+zQlhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2019 at 04:45:10PM +0900, Kuninori Morimoto wrote:
> > Fixes: c152f8491a8d9 ("ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()")
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Acked-by: Wen Yang <wen.yang99@zte.com.cn>
> > Link: https://lore.kernel.org/r/87sgrd43ja.wl-kuninori.morimoto.gx@renesas.com
> > Signed-off-by: Mark Brown <broonie@kernel.org>

> I noticed that latest commit has "Link" line,
> but, it will be "404 Not Found" for me.
> Is this bug ?

It's because alsa-devel isn't archived by lore and you didn't CC
to any list that is.  I guess we should look at getting the list
archived on lore.

--uuKVzAmB+c+zQlhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0oZj4ACgkQJNaLcl1U
h9B1GwgAgWjrvCyKy91QXTm+WiJbfwG4EoOoAxlXs05YRlF7zYkKP8Wuj5/a4Ok6
ujpIq9Xe76bWgDltQeR/IJ94M+xcsB/tcD2ytB3PNZl6uSZS4zcZiZgXnlwzmWVX
zUFbkd6RHKqlZDUsieRbeM4Ctu5gtvOO5nuZmyoluqNMVysnBva869YKMihcY6QX
3LDQw7HEb0Q9VvGgJM4CAXfPgNboRIYxwjA6OuVPjHnO285txqf23ubSn82ryecb
UVUUPVTtizFBpNUvlQaH0bk0zjJdArzmR8tv8TuGgT9uPin/ZtAcpOoKGC2ZE2aq
s2yDq1gmMwno1LG/4NqBkQUnRI1Uxw==
=MZuw
-----END PGP SIGNATURE-----

--uuKVzAmB+c+zQlhu--

--===============8306428139368744638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8306428139368744638==--
