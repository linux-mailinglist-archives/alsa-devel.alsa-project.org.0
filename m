Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72E17181
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798891820;
	Wed,  8 May 2019 08:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798891820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557296819;
	bh=sDy8gqOJnn30ZWng2pHD1E/BlqHNJj+lNsS/S1E6vn0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+CD0Yw/hJIBZEbB1qV0T/8Z2OQnb+5GnPATe3NxBI4cOz2EI0pDrlYjD7neTQmNU
	 bYXTe914oSXWicEd+B1TcF6dsDqwXv153OYe3XFe5YB6J1GCiIIdnBUsONfyk2Qd3h
	 5xb/L0fdwjIMp+gD+V14v/cm1G+ks0lHWyq5SUaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B589BF896E6;
	Wed,  8 May 2019 08:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCD3AF896F0; Wed,  8 May 2019 08:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92418F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92418F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ECGc+Rf/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4CRGC+9V3qGHt8nhFJ4BERpbkiFBBbP58J2cUCUxjI=; b=ECGc+Rf/zYPNT6Zdnr0L9J6Ys
 1Ic1qHN5K6GCjO1eNqlYCuTq5SwhCc80beRv1DOkEd7US9VRvWVr5mjNyUkvmfr3fn0gz/AC/c1tI
 ysj6vDPK6RZBKU6/jsTP01pgfXjfI2VE1jbP16QTY7rEZxZJb0DdYzu5KbmzppP/7AEy0=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOG0n-00074y-D2; Wed, 08 May 2019 06:25:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B4C72440010; Wed,  8 May 2019 07:24:59 +0100 (BST)
Date: Wed, 8 May 2019 15:24:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
Message-ID: <20190508062459.GJ14916@sirena.org.uk>
References: <20190507233213.53036-1-cujomalainey@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190507233213.53036-1-cujomalainey@chromium.org>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5677: Add component driver name
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
Content-Type: multipart/mixed; boundary="===============5442244428135578018=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5442244428135578018==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5HJNHpVrs9F5Roc"
Content-Disposition: inline


--z5HJNHpVrs9F5Roc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 07, 2019 at 04:32:13PM -0700, Curtis Malainey wrote:

> Add name to component driver so it is possible to lookup the component
> when needed.

This claims that the change is adding a name...

>  static const struct gpio_chip rt5677_template_chip = {
> -	.label			= "rt5677",
> +	.label			= RT5677_DRV_NAME,

...but the actual content of the change appears to consist of rewriting
existing names to use a #define.

--z5HJNHpVrs9F5Roc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSdjoACgkQJNaLcl1U
h9Cabwf/QmN9TCd1xk5Sa4R0xXwVvN8bDpKpU26vmDQh5762hphHTHXVD1ZwvjUL
j+Q+GN9S8TCtw7J47C8rMou+z4m2gQ1KZR5yQ6aT4OHtqEaTCnxn3MqfjJ4GIlq0
FqFtXRUDQBowgsdZZ/030xeG9PESkTz0Qp+aud0tX05XbBgqjuvvjTbuqbUkSMOe
9uUBH9vxuYSjeUXHwuCR9ecMP4I6Pk69uA8vwNsaSAjT9rL5QJYCBJKy4JYM3WWS
yQhH3ndGjZPGNgTghzrDCUjCJbBb3D8lBCVMcliSV8MgC45aYJiuIqhf+L9xHU9r
cjHuo7c/ui9a1uBZFX3hktSd/Z5rvg==
=vUq0
-----END PGP SIGNATURE-----

--z5HJNHpVrs9F5Roc--

--===============5442244428135578018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5442244428135578018==--
