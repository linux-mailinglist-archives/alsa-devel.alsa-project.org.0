Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F5E22B1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D225C165E;
	Wed, 23 Oct 2019 20:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D225C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571856517;
	bh=Rjsgp/shVAxTVSwxlDew+2FpttJH0vhEx3K/KAR+ppk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aABlyGiYYVXcb5UyZMMcOD9YgysZVQTWmyL41DOAvwt87DtKa/OdbRZgklDn6FgfS
	 LEsmraUoticV+P/wVWaQH6eqmqdKRv2RmmJnbNIzIeS48xSg1G+EewUJwVDB5VVtrS
	 9CUeJ6dolpF9pmHiyAlGyU/bLQLiPB4wd9Kgr71g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D07F80274;
	Wed, 23 Oct 2019 20:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC8F3F80368; Wed, 23 Oct 2019 20:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D6BEF80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D6BEF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HiIyxVYF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fLdwq/VvKULq7jt6cG/bIySr1awEyiRVYbUab2xrSZA=; b=HiIyxVYFokpeiHOOH6sZm2QbO
 ltYwsGyJZl8lZVshacALlzLpNLS4to3qynfBXm9qCDyOM0Y0q4aIXnKaTF5oSnZ9WuErzXW/dXXso
 lSomU+hxDaiU4Vx1rprMVvd3E1NmaltvPuY0WZHdoEuNj9vXr8NIFH33QnD6PvFs9NINA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLeb-00019i-EE; Wed, 23 Oct 2019 18:46:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 883192743021; Wed, 23 Oct 2019 19:46:40 +0100 (BST)
Date: Wed, 23 Oct 2019 19:46:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Message-ID: <20191023184640.GN5723@sirena.co.uk>
References: <20191023161203.28955-1-jbrunet@baylibre.com>
 <20191023161203.28955-2-jbrunet@baylibre.com>
 <20191023163716.GI5723@sirena.co.uk>
 <20191023182618.GC25745@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <20191023182618.GC25745@shell.armlinux.org.uk>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH 1/2] Revert "ASoC: hdmi-codec: re-introduce
	mutex locking"
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
Content-Type: multipart/mixed; boundary="===============3576803148388596193=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3576803148388596193==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nb8zVy0QMK3AA1xu"
Content-Disposition: inline


--nb8zVy0QMK3AA1xu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2019 at 07:26:18PM +0100, Russell King - ARM Linux admin wrote:

> If you look at the git log for reverted commits, the vast majority
> of them follow _this_ style.  From 5.3 back to the start of current
> git history, there are 3665 commits with "Revert" in their subject
> line, 3050 of those start with "Revert" with no subsystem prefix.

That's assuming that all reverts have Revert in their subject line of
course!

> It seems that there are a small number of subsystems that want
> something different, ASoC included.  That will be an ongoing problem,
> people won't remember which want it when the majority don't.

> Maybe the revert format should be standardised in some manner?

My general thought on this is that reverts are commits like any other
and that the documentation for how you're supposed to do commit messages
also applies to them, might be worth a note though as I do see people
not writing a commit log at all for them sometimes.

--nb8zVy0QMK3AA1xu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2woA8ACgkQJNaLcl1U
h9CMiwf9EJdc+RNiYB+xMKLeYHQ2oOUm2OgQDbGEq9GrRjgTFwUdSDrtRMJtqttS
QwsvXxANfiQCYD0g+5A51/WY16SkLF2Vq2+WWAkR44nQpPwqpVFY6Y2/hN8N1Ne9
P2fC+oXsbAe2TFxEtvkojdzp5Vmz7HevYKnTv1cGoi6nx/QKwJ6oFKHFYcae3vD6
Fg4RuSz9txILSbR8v18+YvYf48Y/3+INJYVBnLJbeI+ispLKcVJz2nHjznIqQw19
SsaOw9bIOtxpK4Ah5g5UxIFL0/QiS7pKV2dS/aIb0WkeCTr+deu8WMHiOdXVG6vK
lPwi9F0aVSs73wwXh18mTPvhGdP05w==
=/6rf
-----END PGP SIGNATURE-----

--nb8zVy0QMK3AA1xu--

--===============3576803148388596193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3576803148388596193==--
