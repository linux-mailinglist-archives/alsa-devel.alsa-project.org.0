Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82C4D2FE9
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 14:29:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C02B71728;
	Wed,  9 Mar 2022 14:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C02B71728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646832559;
	bh=GgSio9V80nivu9meltbA/oj2M0Xxx98EfpL6FyjL1e4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=brmAWECL+4ePToEYURudS+WORzPQWJtvPNPeHdQiNaMUE3qgCfZN7E8ajqNcv8mEg
	 0uKbukEDFmAaptWdzUgsg3RJ4azIsH2jRGOqItL09LNb6TKPnq8Y5m+/l9O9y7ECBx
	 WzQUt9L6084o6cK4giSwxV8AsjqsaMFU+GKPi8C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F97BF80236;
	Wed,  9 Mar 2022 14:28:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A54CF8016C; Wed,  9 Mar 2022 14:28:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15E02F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 14:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15E02F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iqLPDT39"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1606261A3E;
 Wed,  9 Mar 2022 13:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31715C340E8;
 Wed,  9 Mar 2022 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646832478;
 bh=GgSio9V80nivu9meltbA/oj2M0Xxx98EfpL6FyjL1e4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqLPDT39jg1D7hrjKWwuN9VBULz+kWRqNXkgf325UHd8r2Ep/Em1L9n0DeqbzfAle
 CyBsMx078ZvO6Z6H8JSRTdlevSMgn/6JWHMG5vo1/8tou96gDu6kqoEr5dgM60Q/YK
 SURLN9ax36kml8uTB/eaBgfhh48kcDMnlUH1WV5qDKnlf7+OLZUuc1Z0CP2u2AA9fm
 dTpqoT4CfAEJgtD92EbpPukPBLL8NNGQDZYyGHHCZwVmpircsFB7HdxOVyKjlemkLr
 Yw7hFh613zSvB6L1uGiGCzvUXlMxad6XH2QncQjcuEup2i586vKCELnsGLoDFZiXhX
 JEkp+SqNjwW2Q==
Date: Wed, 9 Mar 2022 13:27:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Message-ID: <YiirWBvf1LonIkA6@sirena.org.uk>
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
 <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CEoyfg+ALIwLqT5v"
Content-Disposition: inline
In-Reply-To: <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
X-Cookie: You will inherit millions of dollars.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--CEoyfg+ALIwLqT5v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 12:42:04AM +0100, Jerome Brunet wrote:

> If this is really a problem and Mark is Ok with, what you want to do is
> revert commit 024714223323 ("ASoC: meson: aiu: simplify component addition")

I'm OK with that.

--CEoyfg+ALIwLqT5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIoq1gACgkQJNaLcl1U
h9DThAf/biv3bEd5MHh6krAL6OnRjegkqQA4maxZahCGsI2KTdipGSI+ENi1CB+K
h/pLgFM73oyq26ovwfooz5oWt6JOzboItIsXVnB7C8wb97Ps7pwwdWHMnuXCOvi8
6LKFUI9+XNWA+ZXy60AEtg30ijcjdJpe/DuPleNY6wlqnqL4FMNbeQ/xk+1gv/MS
1HOOeE1nC8j3nPuRrU3ST3vGdR8kwf+DQuV+7aEsepuGl1208wZRdgSwh/QKZX4S
MJRDcv4+WOoxIlRAj6puJe8NOzlNoBjrEtipNlRIIkWMnPbKir1jIblVbzLr5DLo
/suV0sxeZRxh/FnmqAakQQB27EhCAg==
=4dHR
-----END PGP SIGNATURE-----

--CEoyfg+ALIwLqT5v--
