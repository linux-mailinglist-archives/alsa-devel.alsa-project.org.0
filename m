Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30497A3595
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5CA01655;
	Fri, 30 Aug 2019 13:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5CA01655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567164011;
	bh=b0T0BukowNi+eAZW7qKNMAjO5+yNu5pc4PovXL1PHQo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvN3ZH63utg/UJeGunI/ppySn5GhUhi0ImzNegE6Lmb4aAfy1UlUb2ZnY+ehxALwx
	 TaTVeaBA6UpWVE08ftHCj6dWvODdwryaY/g+JDY9eUSoruv2KmS4GFdOg6e76OlI1T
	 8FS441YKeHfLcwmsESZpXn89CzjYZWk+rSxo+qOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59525F80376;
	Fri, 30 Aug 2019 13:18:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51F1CF80369; Fri, 30 Aug 2019 13:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D40C8F80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40C8F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YV5bsu78"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Ag+0BOmBywnIFIz+nrRSrUI5T5t6J5drhYhi0EPdvc=; b=YV5bsu78PtYYon0Hved5dBaQz
 4DSi+cXKEYAburcA+avOKbLa/ntN5tkrCOXUuLlp1e20SOkqgX9Mkmg39dyDyoqQOi+fnignMJM+z
 NeHOOGYff+Ynu0VKlTKcet5oFAbcITTr+L0H02kgsk7QtrPvzhoY8DajjAOUDTa58HUdc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3ev4-0006Dq-OB; Fri, 30 Aug 2019 11:18:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 539872742B61; Fri, 30 Aug 2019 12:18:17 +0100 (BST)
Date: Fri, 30 Aug 2019 12:18:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <20190830111817.GA5182@sirena.co.uk>
References: <20190829173205.11805-1-katsuhiro@katsuster.net>
 <20190829173205.11805-2-katsuhiro@katsuster.net>
MIME-Version: 1.0
In-Reply-To: <20190829173205.11805-2-katsuhiro@katsuster.net>
X-Cookie: Send some filthy mail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: es8316: Add clock control of MCLK
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
Content-Type: multipart/mixed; boundary="===============1801542846718111986=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1801542846718111986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 30, 2019 at 02:32:04AM +0900, Katsuhiro Suzuki wrote:

> +	es8316->mclk = devm_clk_get(component->dev, "mclk");
> +	if (PTR_ERR(es8316->mclk) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

If we don't get a clock it'd be nice to at least log that in case
there's something wrong with the clock driver so that people have more
of a hint as to why things might be breaking.

> +
> +	if (es8316->mclk) {
> +		ret = clk_prepare_enable(es8316->mclk);
> +		if (ret)
> +			return ret;
> +	}
> +

There's nothing that disables the clock on remove.

Otherwise this looks good.

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1pBfYACgkQJNaLcl1U
h9Cfdgf/QHjLqKONAE1J+gdjS0oEehwivLJxEfiY5Bz+LQ/xr+cbRBqLot2+aWM7
b0nZOgOiyKEj6nHSsFnd5ss9GJPvxePyhpwrYifIwRk9UyD6Z16cDP7V1Rz4ad0z
SFmyAE1XHhvbO5MrQvfmKpO9NfiyiuieFf3HQNDgDfPzLKBHgBXZEv4uHuAp7Id6
DeggzMHMb4buK21+AWzcMUh8i8Uygh93qvvpWp6crjUkiIx11kmGuJSp7bYSTx28
1DAHiGVBssJ/RVRk/DJUDuHamDOg+zdDzsy2Br+67WLM8o7azI/4zV3q80HdMz3P
KnY0fDkDGYNvaRG9WZfo7UR6sCQNdQ==
=QHgV
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============1801542846718111986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1801542846718111986==--
