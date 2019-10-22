Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42003E0963
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D68168C;
	Tue, 22 Oct 2019 18:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D68168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762629;
	bh=kuClYarwTM7ibys45r160P7NBIYEa2j/tCLTyQxyBpI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gt3aE7gZVYnvcjBJhfoK6qQVGZX0IH/39up7Kjr4bqQl+ve3ozTjpjeHEtyWKwV9K
	 z6XDU3FgBEzK1Ul15bspn83ekpXr4Ytz5/Fz/FYJjA1kHas2Tyj5vvVLXzMc1rTvxB
	 oL3ofXXDNZH11598aIiqsZ+3YaeOqSESNhiV0U1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1062F805FD;
	Tue, 22 Oct 2019 18:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C42FF805FC; Tue, 22 Oct 2019 18:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A25AEF800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25AEF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="V6tU+o2W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oA1KbQ+iL4lJATXS+Rqeu+8Px+PrmA76Q7yx0VphYaw=; b=V6tU+o2WhZ+Gvunqxu1pwYPXC
 qlrlBZyT944wbkAHtEbGIryATy9jVaQoJddFATuvTLvFSr8SYTEXyz+Fxu7W7ExD8kCkXfzwiXEKx
 /lppA2ah0Y2pgZ0Uon3QdL92ifyOZkKPfEfefYZJONXGT5xuAKf0jFnoVu0NpIpfCA360=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxBi-00074O-E1; Tue, 22 Oct 2019 16:39:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DCD5C2743259; Tue, 22 Oct 2019 17:39:13 +0100 (BST)
Date: Tue, 22 Oct 2019 17:39:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163913.GV5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-30-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-30-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 30/46] SoC: pxa: use pdev resource for FIFO
	regs
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
Content-Type: multipart/mixed; boundary="===============0439739870599723124=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0439739870599723124==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gYb7txo4D4wAJl1C"
Content-Disposition: inline


--gYb7txo4D4wAJl1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:45PM +0200, Arnd Bergmann wrote:
> The driver currently takes the hardwired FIFO address from
> a header file that we want to eliminate. Change it to use
> the mmio resource instead and stop including the heare.

Acked-by: Mark Brown <broonie@kernel.org>

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--gYb7txo4D4wAJl1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMLEACgkQJNaLcl1U
h9B4BAf+Nigk17USU9kJexq9HKaYufhu9ucbNDUZLT0gHczwHLubKDwFnz4+gbh5
pUlTULZnfpE0LXEGKSAR5sdY8XbPEQ/mZfwzWFYsmNj/kA0X/H36jS5+kGtFZUpl
2BuiFzUmWYqAo/oBVD2Eprt+OgkO18z/7ftvbs4VcNoQaGU4hZNm+ccBnB/KS0UK
6qPnSD640/Tr3lCHDIfhte9DJ2B1W8Rxiv8J0zvpXQhUGn2AyRPWal+8bBFyg6wb
QdOdpouPKeQV+9azp5dam2tL6qzo9eLSHj3ZMjacGJkEfOfmLSPSSe8EVAMknjrb
uHHkt8gIg41WbFX7zBCEMKsRiRA0gg==
=1IWc
-----END PGP SIGNATURE-----

--gYb7txo4D4wAJl1C--

--===============0439739870599723124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0439739870599723124==--
