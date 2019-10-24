Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDAE307D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76DA516A1;
	Thu, 24 Oct 2019 13:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76DA516A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571916998;
	bh=7yrpvMs7gzaKwEWL9UoqgOyMNCfOVaFyKsgOGIhnUtc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8TfhS1wRWCRulf/GTHWrvynWnopP+OyU4ICghKmODCETAdDs32wXvzMX4wMo9+BZ
	 /vogXaVnQqoLK0kSOXxjlqWvaUATM7Malx9uiTnqC5O+ixL1kgnr6LzmmwonqQZyll
	 7oWSif2l6jSJUU4LYXr8PZq0GcorIx86f7dmDL3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95D54F8036E;
	Thu, 24 Oct 2019 13:34:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01FBAF8036B; Thu, 24 Oct 2019 13:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94DC9F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94DC9F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LhvNFFdz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zYu/dXer5u/VUFfPBAUTgmknjpEgfPNLcXJ/0E1S8L0=; b=LhvNFFdzJvXOUO83h2NEw4uon
 6DEMRCSXJ02rM36UaeXAGpyCQgllHBpDF0+Qv5g4s+0+oIF4EODOkW5G8drbc3DtjDpS2yP1n6Ict
 LUQL2UC/K5C4mcJgpgt71w+F8ZSFewDissDmSN2M+5xYxQdF979KfvRZrPUoGWDn16Mws=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNbO9-0003P6-Lm; Thu, 24 Oct 2019 11:34:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DD08E274293C; Thu, 24 Oct 2019 12:34:44 +0100 (BST)
Date: Thu, 24 Oct 2019 12:34:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20191024113444.GF5207@sirena.co.uk>
References: <20191023161203.28955-1-jbrunet@baylibre.com>
 <s5ha79rph1j.wl-tiwai@suse.de>
 <1jv9sfcpr8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jv9sfcpr8.fsf@starbuckisacylon.baylibre.com>
X-Cookie: What foods these morsels be!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 0/2] ASoC: hdmi-codec: fix locking issue
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
Content-Type: multipart/mixed; boundary="===============0391174282640790632=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0391174282640790632==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Content-Disposition: inline


--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2019 at 07:53:31PM +0200, Jerome Brunet wrote:

> With the revert, we are back to the bit ops. Even if it works, Mark's
> original comment on the bit ops still stands I think. This is why I'm
> proposing patch 2 but I don't really mind if it is applied or not.

Yeah, it's not *required* but the atomic operations have lots of spiky
edges so a simpler locking construct would have less chance of running
into trouble later when someone's updating the code.

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xjFQACgkQJNaLcl1U
h9B8Kwf+Jg2QiKBt6TLiix2B5dhQZdYmJEpilzMEzc5b+2MXGLi68PkPqJGiLBF3
Y3sqkh/oeZxKDlBeFLpvpTVKszZjaYKe/pBAstw5HHYCI5TTrXD0zEGxQ1x4/FTr
+24kfJQqxxdL/vyi5uWSobaSGpgD/gd9T0u2e2nsmFKehOK7aTJCt6sD+Sh3mQCn
wo6X1ZqLZmLdDt3cQFJoJ4TDE5tlnETgu4KoCFW7gMG/TSdjF0cfThHV7SCmWsIa
6ucoDHEi8YXEC2I6c10QEmxf5Vc/QJfyblfbibYUqjfDeNFA7i2Zh62ZvuduePk+
n1M+ixOpZpLiFk1DgTdJgIDimtwyqw==
=/3nu
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--

--===============0391174282640790632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0391174282640790632==--
