Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293ED91CC
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 14:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3839985D;
	Wed, 16 Oct 2019 14:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3839985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571230774;
	bh=/L6u5+X0Dbo8NynHpMhk6mXW4RhJQsCMXTTnj37n7so=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXckXBLVneIY1sPyOElJAdD69OzkoUwlNOVYNkEhOW8BrJGAOCgAoPKo8FXOpmBb/
	 0A8WgYr4hZZ0bxcG1y1D2G4/5Lq3YJbR1V6vfKDWDMws0e6QMdb+1T6PPal/UlJBOG
	 Oj5aoj3VwsdCbgUW1X/puKsbn+Gc0hLjPvOcIazM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A11C9F80323;
	Wed, 16 Oct 2019 14:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B70C1F80362; Wed, 16 Oct 2019 14:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39EDEF8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 14:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39EDEF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OPBiyJxO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pnWCUaxojtpsU29FdVjkcjNFtqj5VmMqmqWJ71fCmBw=; b=OPBiyJxOmvNfNhuxuvq6fMCqX
 f2IFhGquz2XUJT+UlHC/qteg1YJhUE8vgiPadV2gWAwB/58qCt5mRfB0HxeD/UzMcey56NeFEiTov
 6D9tf/ry/DiIAG0pkjJBR1QMAEbRWrwEtVnlzxamu5h+Ar4ZtTCsdxYu6BtpPzfDGBJfc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKis3-0005MD-VI; Wed, 16 Oct 2019 12:57:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6A0D42741FD5; Wed, 16 Oct 2019 13:57:43 +0100 (BST)
Date: Wed, 16 Oct 2019 13:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Message-ID: <20191016125741.GA1733@sirena.co.uk>
References: <20191016115617.23213-1-shumingf@realtek.com>
 <20191016125449.GB11371@sirena.co.uk>
MIME-Version: 1.0
In-Reply-To: <20191016125449.GB11371@sirena.co.uk>
X-Cookie: Yow!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: rt1011: add r0 and
 temperature device property
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
Content-Type: multipart/mixed; boundary="===============5112691516584507836=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5112691516584507836==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 01:54:49PM +0100, Mark Brown wrote:
> On Wed, Oct 16, 2019 at 07:56:17PM +0800, shumingf@realtek.com wrote:

> > Typically, the r0 (calibration data) and temperature were measured in the factory.
> > This information is written into the non-volatile area
> > where keeps data whether factory reset or OS update.

> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Sorry, fat fingered things and replied to the wrong e-mail here - no
issues at all with the subject line on this one.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2nE8QACgkQJNaLcl1U
h9DMbwf/cQsfkq/ZHQHeB+5NBq6lWIpwq5op1RLF2ZUQ6jjNSlTtuYNEJ/SCGFEO
ln5UH3NZVpd7/npgUu40jdDdLNGU6d56qxOtKqWOEVy9P2JFT+Wod2Jnle0+phMX
GX3AZDEPPYYWeDBaLfw22c/CKktEwR7q8q1OWdvg3pmyHtFTiupDNWERmhQG2UCa
GpKqvwpDZz8f0VZG3iQW8K+kMawFfCAHmBStq6G8SEGDfAqzCVdMCWoUiUt3q4fP
FNscrIjcaKGHCwd7TOFY1In3smY5iqAIOgu5cA1/VCAGEkRX84ScpwH7bgdB26tm
lmYFkBFYoyiJLerOUl54oZuvFSvRgw==
=D8eb
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

--===============5112691516584507836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5112691516584507836==--
