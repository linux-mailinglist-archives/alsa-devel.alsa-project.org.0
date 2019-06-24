Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A76650C00
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 15:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D7B1662;
	Mon, 24 Jun 2019 15:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D7B1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561382944;
	bh=EMOfh2n0E35ll6mUOx4GMuhESr8kETFZfTQAdcrFCqQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=penhP6ho0TP17imXqVaXkVypzr6V3lxxShu8sDWjrk3jiziif9XnAVLf2Nu5OYfHC
	 R8dHQ8vhfpzgtSpP/aEld3FYztgXFz5jYjirlvcWuvoAJBfXPRYBFq9mTjlfH4rDfz
	 /Neb6M85u7JK7uUlfCj7eoabzTwQ5sFV2MW03zPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF443F896B7;
	Mon, 24 Jun 2019 15:27:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01C5EF896B7; Mon, 24 Jun 2019 15:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43BF5F8065B
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 15:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43BF5F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cuZg+HW4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FtTxaDbGJniCes2exh+kfj5Fg0/J+UIoxAMJ+1UX0DY=; b=cuZg+HW4nSa1EwVgQ90UK07u1
 4/ezEp94RhlggFH9D8WO+oy0ZHNQk8zS/FN8AewZQAKp8JVaM/6/1kxgMFszBkP2GDhEp9alQyWfs
 JFYKzxQi/c7tdtTjj1oN3N+KxYTcw7e36jD+5G2mcfZ8bH76mxUVzHuFm4//cEai0KkGk=;
Received: from 188.29.164.245.threembb.co.uk ([188.29.164.245]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfP02-0001UH-7k; Mon, 24 Jun 2019 13:27:10 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 02852440046; Mon, 24 Jun 2019 14:27:02 +0100 (BST)
Date: Mon, 24 Jun 2019 14:27:02 +0100
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Message-ID: <20190624132702.GM5316@sirena.org.uk>
References: <1561381680-5250-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
In-Reply-To: <1561381680-5250-1-git-send-email-derek.fang@realtek.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 bard.liao@intel.com, shumingf@realtek.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH v3] ASoC: rt1308: Add RT1308 amplifier
	driver
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
Content-Type: multipart/mixed; boundary="===============5516767230248695233=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5516767230248695233==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tIeJbwHNpP5qezKJ"
Content-Disposition: inline


--tIeJbwHNpP5qezKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2019 at 09:08:00PM +0800, derek.fang@realtek.com wrote:

> +static struct i2c_driver rt1308_i2c_driver = {
> +	.driver = {
> +		.name = "rt1308",
> +		.owner = THIS_MODULE,
> +#if defined(CONFIG_OF)
> +		.of_match_table = rt1308_of_match,
> +#endif

As I said last time this should be using of_match_ptr().

--tIeJbwHNpP5qezKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Qz6YACgkQJNaLcl1U
h9BNiwf7Bg7JrAQrr+LiuJIgysAFPBjqs3vwAy/qXb0hUzSyd/rHgdj3FFF/bkU4
odRFoqQXlLjuimvFZ1x5ygsmCVP25ZYRFg2tR3bs9dUuMMR+KzWs0ZoKBekuIJeH
PGfKe9oVxAqk2Mii3vuU/1qz7chaTRjQrEDGgyFbce4POY/wvPBwDPz/r6xqTGi2
mT9zsVIdAJrfDe66QsgIvZOpHxJwCqUZ2DKvbjXmjg6/pCcosJ2UDl7wvm8gklzM
KtpJzLvnXIPTAic4mCHwKZrVj0UILDfQBoCMnWFq5lxC4YckV55DoEr4VC0wWRZO
Pl+dYC5KbNPl/M5B5XePwarjTMr8OQ==
=XXu9
-----END PGP SIGNATURE-----

--tIeJbwHNpP5qezKJ--

--===============5516767230248695233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5516767230248695233==--
