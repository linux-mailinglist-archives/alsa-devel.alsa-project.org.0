Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C18E06C4
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 16:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A5C166C;
	Tue, 22 Oct 2019 16:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A5C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571755874;
	bh=W8jr3RMLO53xLB0zR3f9Hy4aDxWys41zf5qYBfKVFAY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuXcPlJ2hKvj6BTKF7Nd7dvEBcQ4ybzAqa8BV4eP/Be59Clg5Sd9MO0RRum7u9ZuG
	 B5euVP4nUxfnSBNX8r+bTCOK7dKkqLnbI6TBqjopVQqoSfHua642drxFbtJS0stDmg
	 XazQmrsy3aqXhZnR9FBUOGx+ICUd1AZs9xv+X8fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149CCF802FB;
	Tue, 22 Oct 2019 16:49:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98E11F8031A; Tue, 22 Oct 2019 16:49:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A7E5F80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 16:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A7E5F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Oi3fy8aD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0eKDxE4HL61aJt0ApJeOxdPcu8dTF+4AVsl1J7hRGaE=; b=Oi3fy8aDOtcJxcw+JN/EoKP9e
 NgyNqq3nYMps/boQLpeSJTiUK45m0eTrnQ3WRo6Iv+57VZbEaUg7d+FVldg0M2UHuipyc6VOp5wjc
 VDy+/Sul/Www4oIS192iH3GoT1df8AcQDuynAVgX/iVGUWP+5Q4Y3IiaHbwzW1fU+Vsr0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMvTP-0006q0-JJ; Tue, 22 Oct 2019 14:49:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BA90D2743259; Tue, 22 Oct 2019 15:49:22 +0100 (BST)
Date: Tue, 22 Oct 2019 15:49:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20191022144922.GE5554@sirena.co.uk>
References: <20191022135702.GU25745@shell.armlinux.org.uk>
 <1jpnioc1eu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jpnioc1eu.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [alsa-devel] [REGRESSION 5.3] WARNING: pulseaudio/1297 still
	has locks held!
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
Content-Type: multipart/mixed; boundary="===============0333135082567853217=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0333135082567853217==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2019 at 04:14:49PM +0200, Jerome Brunet wrote:

> AFAIK, the revert is safe. We can keep the codec this way if it is ok
> with you. IMO, it is simpler that way

Let's just do the revert, at least initially, so it can be backported
simply.

> I can also submit a follow-up to use a mutex in a safer/cleaner way (mutex
> + busy flag) if you prefer.

That'd definitely be worth looking at, both for the extra safety and in
case we discover on review that the revert is causing problems.

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vFvEACgkQJNaLcl1U
h9CPKQf/YT4wSPz6G5f2G8dy2JwW/xXl8JeqZfYK81EPbKcNW2y+Qaas2xSjehzN
XrDEG/Yh9ZGcZIUxR0kHv41DbSe44UlZRBF7WPc+8QPfvv5OOopPQOSnylaPKj0H
95fKWZb2ReWFbMccEo/y9NQ97rBqIqAbILvGgowzyvm0RZ2eIZcDMAVnO/mmJ35l
bBjTSNe9oSjoCPdf48rQcdF9CN302y2GeCnuaEowl9VNmz4ynGtpVAhwbg9pWyck
+18nnOrSXs9x4z70jVhQJwgPVEUO1EWJLMc5+5sngP663Gd0l1V9gq+btz4zPWNF
sIlC4WTMWiGUaROexxAWtF7/k1o72g==
=Obxc
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--

--===============0333135082567853217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0333135082567853217==--
