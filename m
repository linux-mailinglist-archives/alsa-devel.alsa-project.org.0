Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2799EAD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:23:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07CB1670;
	Thu, 22 Aug 2019 20:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07CB1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566498182;
	bh=erOndTz+XqnRAw9yUeahhr5wAg2XIO7JlLRm+RqanUw=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:References:
	 In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q8SPooPRkQ3q5Up5L1TMWgJ3/dydASzET8Uanj/K2QXclxdgJgPRTRZ5FKxzKdoGc
	 9Wucqq2H6T8TPxuaqFpBzotmSV4Bqa6exAO44Lwd+2L56loCL20mGpD7k82rjsS6es
	 oTa/xkUkP5ED0mYfDyBacU4ZcR24Mk+ol/Jd/Ecc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE165F80391;
	Thu, 22 Aug 2019 20:21:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 498CDF8036E; Thu, 22 Aug 2019 20:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FE07F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FE07F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ihvsx0WD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Resent-To:
 Resent-Message-ID:Resent-Date:Resent-From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Sender:
 Resent-Cc:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q/5kdoTJMU83XWBDjIxsZNJxUqYcYIIXifiOSDQ6JyU=; b=i
 hvsx0WDQMe3ORuyQh8PRdVokhIDAho7wwzKaMfd6Emo/DLe+EvGIqvxBAxt5GSqkqS6/lIsvMHJuB
 5orIhWiXnt9K3ayj0RfQv4XtxNireh7rUOmoDWJ3LEaCzEy/caAbkR7S32v7x6Zf44QnDDgegvvW7
 So7e0nqtr1jHtc7w=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rhq-0007cm-O5; Thu, 22 Aug 2019 18:21:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8AAC0D02CB0; Thu, 22 Aug 2019 19:21:02 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Thu, 22 Aug 2019 19:21:02 +0100
Resent-Message-ID: <20190822182102.GF23391@sirena.co.uk>
Resent-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 ranjani.sridharan@intel.com
Date: Thu, 22 Aug 2019 18:18:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190822171857.GC23391@sirena.co.uk>
References: <87a7c41lf1.wl-kuninori.morimoto.gx@renesas.com>
 <8736hw1lde.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <8736hw1lde.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: [alsa-devel] [PATCH resend 05/11] ASoC: soc-core: don't alloc
 memory carelessly when creating debugfs
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
Content-Type: multipart/mixed; boundary="===============3291320765867180315=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3291320765867180315==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 02:05:06PM +0900, Kuninori Morimoto wrote:

> Current ALSA SoC might allocate debugfs name memory via kasprintf(),
> but, it is unnecessary and the code becoming very complex.
> Using local variable with appropriate size is enough.

> This patch uses 64byte local variable for it.

Is it enough though?  It'd be a very long name but as soon as you
start putting a fixed limit in you're tempting fate a bit.

The other potential issue is that it's a relatively large
allocation to do on the stack and while we're probably fine it
still doesn't feel great.

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ezoAACgkQJNaLcl1U
h9A8rQgAg6Lut5zwamdfXGOUV35xOXekSeZb8a3B9nHlGaE8qPFWHnp/+vQklzQB
o20UOaEA7ZBJKUppexfv/Nc0eDMJPjbnmR+4KrhghasQi1HKxjvoTUK76wTjOK/6
StkoMAs87oAOb1tYH6w1VbPbAR7HfXqvnFK3XReZ9UZJGiFXBeLjQHZkwJWsIHR/
KIFYbWtvuhW+S07I7W8aVaSe1G/Sr/QYpwdk2mnHF/kudAy4r4IA6SkKoH/xDeie
cmJO+aN5mUImMiMafBmMh95IM/cL7nxzWzAZayCIMx3AR/FUQEj6jgRBETf+3qnz
uVMTBOijbqmM+kUVQ9O1NLyb4LbAcw==
=Uero
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--

--===============3291320765867180315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3291320765867180315==--
