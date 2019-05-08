Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F287F175C9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 12:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D131AAC;
	Wed,  8 May 2019 12:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D131AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557310573;
	bh=V+iLSp0cb8xnIDb5yQdIQaW23fKR7tcQRManspsHl9Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssDRDl3G4PyxcXOA75rNS220TNRzZLEz2g+VkPMGRphUyYku8lbCEI6GbMadTe9IT
	 RVtlpwXTTUv8TazAXPoSA8IomQeJkgpDvN8zVhmDZRUqGmYRq4tHm7fRntYKbVSFHA
	 y3CqPftD26gqr18wxe0sNb5p0+9aMhPhhyGJZ6Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB118F896F0;
	Wed,  8 May 2019 12:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86BB2F896F0; Wed,  8 May 2019 12:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81571F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 12:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81571F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a8ihxtxh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7WxJStN1XIav0PX2Js6HoD+FLNS3YqepZJZfGa2kTs=; b=a8ihxtxhar1jj+xWeQcKvAnJL
 oD59+6d0FCQ45yI5mK1C6zoM1jRuFjIciB9D4fsNPweEDufQAaaS65hHc9/7x04tJLc94J6WyWR9T
 kn4Nm1qDnTjWikEXWuJ+9VV3h4HmzmUqTyKhmRe3pHYErmC/Pt2OX/QEJtJVOoNOBi4M0=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOJag-0007qb-IQ; Wed, 08 May 2019 10:14:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4D1B644000C; Wed,  8 May 2019 11:13:02 +0100 (BST)
Date: Wed, 8 May 2019 19:13:02 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508101302.GN14916@sirena.org.uk>
References: <20190508085037.24773-1-tiwai@suse.de>
 <s5h8svhnx96.wl-tiwai@suse.de>
 <20190508093249.GJ14916@sirena.org.uk>
 <s5himuls28b.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5himuls28b.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Fwd: [PATCH] ASoC: SOF: Fix unused variable
	warnings
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
Content-Type: multipart/mixed; boundary="===============7888769540800182723=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7888769540800182723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aaeYxw/B9teUOk8U"
Content-Disposition: inline


--aaeYxw/B9teUOk8U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 11:51:48AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Forwarding stuff doesn't work with patchwork or with git am and with my
> > scripts using patchwork if things don't hit the list they get delayed by
> > several days :/

> I mind resubmitting, but I thought it would mind you.
> OK, will resend in such a case at the next time.

It would've got applied after a few days either way, what I'm doing at
the minute is saving patches I want to apply to mailboxes that are then
applied by a script.  If the script can't find the patch in patchwork
it'll give things a few days in case it's been held up by moderation on
the list then apply it anyway.

--aaeYxw/B9teUOk8U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSq60ACgkQJNaLcl1U
h9BndQf/cCPTbRUULTpljkmfkQQIr6F3UT2SvBSLtDB457CoOM0yeHLu3od6mO3l
SM8G1Fck0C09w/BHCwP2wQLnruMAlJHLJuHAt6q7VU+8OKddWc0heLAJifRXAjfC
9qw9c4/7h604Do8TCEFvNV53TjpDwp3+h91TjbB/ipo/7Kt9AouVK2Jv6i0PVMGe
9NC5Dc/hE8T6AWFCRoPiy6fZYROyiof3WFkOqACMEsLJAmCuqQQE8Vzjy2cWhP09
nVVdIK4t1vOprDzcggIs+dS2VnzPzTjYNyXepsmlS/pk0jCZj5uvw3GhAtcreuMM
8pUPckBIxyzYcKOlwrSxvVgYN3o3Bw==
=SK1u
-----END PGP SIGNATURE-----

--aaeYxw/B9teUOk8U--

--===============7888769540800182723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7888769540800182723==--
