Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE89E0959
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375721684;
	Tue, 22 Oct 2019 18:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375721684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762556;
	bh=FRwhcT9WBV0Xk5EsXDC6t3mFwE695bqyQ5CjN7ZmUBU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3GcU45/apVeAXvmU6pJg3al6EbF/x+/hstBQcR9SmE3VUS3UhdbHqAAL0tHmquMY
	 eU0Djsa03jWXNhhzVrG30bbU7fXsBYAKTqSHM6yMO5F8bs6UW9Ofz1E5LMSYWQb1Oj
	 6BNxZY7VwxE/BtdtwXKH/55YVvATDze0smyIgwYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B71AF80642;
	Tue, 22 Oct 2019 18:38:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD95AF8063D; Tue, 22 Oct 2019 18:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92B18F80390
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B18F80390
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tvMimewQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bsylmx/HNBO7oRMVXVNwiEyRC4cckwd84bjAM8mOb0k=; b=tvMimewQkFDL1nlGaO6PkBOA9
 Uz7PsgZsauauop8auYsA+ghDMICgo2GT8QSnMV8A8V9+ieTunlHA+7J23r62K6HvzUsmO3lkD7Fzq
 b8iU+yUyOvY2SUgQlWyNhKtR45P6HZSX0S9MMuW/jKwjP/Ct7+R6gr8L85x3g5wwLrv7A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxB2-000742-Ce; Tue, 22 Oct 2019 16:38:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DC3042743259; Tue, 22 Oct 2019 17:38:31 +0100 (BST)
Date: Tue, 22 Oct 2019 17:38:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163831.GT5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-23-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-23-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 23/46] ARM: pxa: z2: use gpio lookup for
	audio device
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
Content-Type: multipart/mixed; boundary="===============7925625324361911814=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7925625324361911814==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EmW68jKGQIhj8inv"
Content-Disposition: inline


--EmW68jKGQIhj8inv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:38PM +0200, Arnd Bergmann wrote:
> The audio device is allocated by the audio driver, and it uses a gpio
> number from the mach/z2.h header file.

Acked-by: Mark Brown <broonie@kernel.org>

--EmW68jKGQIhj8inv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMIcACgkQJNaLcl1U
h9AZ6wf+NeOxr9MNvwixJZADUIwYW+QadpN3eAfqqY58BvEqVnkDjruFpIZbmXSC
VEjT32396OacS57CequHpHFX0DpuykmnBIetGlt/lPUczLOUOwtyyHXwM9wOhGr1
cBB14AbepdJGFcFpyZtM340gSCawyWqZUbp6p0TH63HoYzcO3CL4kIB8dJWOhC+j
2bYM8XBRhlBqqVv052oG7xP6IwZS99me4hkg3nnCcAFc5lR3nfg7QUaKN1O+Nh8g
UdVkFvIhdkOS3r31q6AmAnDKPYAhN432virDNtx7ySFB0T3meatGmMRT+c1aHTRN
9t3W9zkNbk+Ec0xQcDT8f9dJkriSSg==
=AnlZ
-----END PGP SIGNATURE-----

--EmW68jKGQIhj8inv--

--===============7925625324361911814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7925625324361911814==--
