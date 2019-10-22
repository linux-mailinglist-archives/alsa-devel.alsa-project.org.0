Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCAE095D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82811696;
	Tue, 22 Oct 2019 18:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82811696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762595;
	bh=yPK3i8R3NvtlvYxKlI1lOVmuUUHTiDV5P5oqb6DIm30=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P6CqmUl9zvtUTsOqJ4MxoSMjNF+UrSkI6wP8qRqXHJbz/5hzDB4FwKkHWOyTGU4eR
	 HR7jTasyqQ27beVKya3Z7XvY2ixh5yV06gyzN2yXnvtWmIxBIKfZDu9aZWcm4hXHRe
	 2kxJdiEvNYqWUJ8014uLFDqjOA+ay3QUBN6oEk2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D826F80659;
	Tue, 22 Oct 2019 18:39:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBE19F80649; Tue, 22 Oct 2019 18:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C80BDF80390
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C80BDF80390
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LSW1HEZC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oh88TdIVwomXyqjDgrD03dKXu9TTl8Lvlp/IGQhs5uw=; b=LSW1HEZCZm9pDFMe606YRrM0S
 +75xL9xLQ0Mdnl4kGlDA95WS5lkCzyihsB3yV/gQYe35SBGkMDrSljMusL38h46axGYQ5fUnwOcUO
 ZgnfRMr5EFmZdO/4zCelANLkSmfRrzn7kJ+bGeKv8OkU18WMWh2IucRUHV2h0RAUbi4Vk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxBR-00074D-IX; Tue, 22 Oct 2019 16:38:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D79D42743259; Tue, 22 Oct 2019 17:38:56 +0100 (BST)
Date: Tue, 22 Oct 2019 17:38:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163856.GU5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-24-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-24-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 24/46] ARM: pxa: magician: use platform
	driver for audio
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
Content-Type: multipart/mixed; boundary="===============4026294183148658187=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4026294183148658187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVVcQco/7vcH19KK"
Content-Disposition: inline


--TVVcQco/7vcH19KK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:39PM +0200, Arnd Bergmann wrote:
> The magician audio driver creates a codec device and gets
> data from a board specific header file, both of which is
> a bit suspicious. Move these into the board file itself,
> using a gpio lookup table.

Acked-by: Mark Brown <broonie@kernel.org>

--TVVcQco/7vcH19KK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMKAACgkQJNaLcl1U
h9Cafwf+IMs9u3JG7wwFGnBDA4ojo/c0GOly2J9qruoKDijxJlyOzNvP4v4EoarL
O+4UcvUiFTB4Ju5s+obbJGO3MU0uuMM8lGcgK7qmiZ0hly1jukKegk4whw3z+cyr
xx5ek42aS5EmkfBVd9nErG/x062u145i53UtDLyCeCxJHmv9vy5Z/8GJpk9NyeyS
ZsqGoud0yh0X8Llz0G85Ok4ziRCvtw0HzS8GLGXuxZsnPgIACxHBAy5tYT3KlePN
EpBXQTKHS5WEsQ5kFWG/Kux+GrufCEFe+kAvIcYbZQxqD0R9hFuwiw2RQ/EGwX7v
TFQvoO2AhUmcr/eD/5QT56wssTj1nQ==
=1xnE
-----END PGP SIGNATURE-----

--TVVcQco/7vcH19KK--

--===============4026294183148658187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4026294183148658187==--
