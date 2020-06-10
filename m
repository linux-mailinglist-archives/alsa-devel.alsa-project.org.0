Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76E1F5AB1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 19:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C3E1614;
	Wed, 10 Jun 2020 19:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C3E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591810742;
	bh=utG4SogSUZldhtrkFrDEcO0SomUMTV8zNf9Bc9crx+Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qV6YBe++UQcGOIt9phb+1FHpjeWltlW9Ce7NBAYixOnydMQou+QQgL+zNp9B+8pfD
	 +XO5oy9vqlA7+2u79Hn2VtZEfOXJI2kMpXKye75PruCqYIZhUU4catqVO+D+9mGWh+
	 WF0qv5odTDDYQQ9M6wFCo1yM4MuoemiNzwPsAAu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EAFEF801F7;
	Wed, 10 Jun 2020 19:37:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08DDEF8021C; Wed, 10 Jun 2020 19:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 450FDF800E0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 19:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 450FDF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EhlvajO+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35D01204EC;
 Wed, 10 Jun 2020 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591810633;
 bh=utG4SogSUZldhtrkFrDEcO0SomUMTV8zNf9Bc9crx+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EhlvajO+Sj3UaawAk83wrJJ3AnCgi4UDhNSl2AqvNYAnOPDjnxEaCjzA7uHkP/TKX
 FYThE/vd7Gm9pv/M49vtKTTD8Ug+p2Qxu/v4Tf/kJtZNPlBxhPhZCFCAPsYc4hzIMY
 oXTO1oIkY7YTpPnN9Iagl7dcMSq4UelELdwXaFgs=
Date: Wed, 10 Jun 2020 18:37:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Subject: Re: [PATCH v2 0/6] Enable Greybus Audio codec driver
Message-ID: <20200610173711.GK5005@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5dNcufZ4prhark0F"
Content-Disposition: inline
In-Reply-To: <cover.1591802243.git.vaibhav.sr@gmail.com>
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
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


--5dNcufZ4prhark0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 10:58:24PM +0530, Vaibhav Agarwal wrote:
> The existing GB Audio codec driver is dependent on MSM8994 Audio driver.
> During the development stage, this dependency was configured due to
> various changes involved in MSM Audio driver to enable addtional codec
> card and some of the changes proposed in mainline ASoC framework.

I'm not sure why you're copying me on a staging driver?  I don't recall
the base driver having been submitted properly yet.

--5dNcufZ4prhark0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7hGkYACgkQJNaLcl1U
h9CrqAf+PTr4Z6aVY9XOlKtwcNflVCkOCX3qxnt1cwrgLmhUdXwDJ7MRRcKyzi2i
vCqjsn1rj9GAkhIwt0CC9FRnC+jq7pGLNucnbEugF6VuEr4GWTxKkS2P+yldMV2x
pdq12Re+x3tXN6oqziMyMcVWnqXXWdcxVaacEx2jqeXADr9pYkiQtN9ScJaERvPy
ComnaHl20yeooKklC7JdWutUyFCxijoMdkqhTPtO8lu5MoSk7DxuRlFgWD6EhyoP
Xx+2OdPgBaQMaIMk4GBm5Arornj2W80mLsVorGWV0SdWQ6gYuvoCn3U3h/IW6YS5
0/RCEd2Bon5c7Hd0v5eAUxPVChr5+A==
=yTza
-----END PGP SIGNATURE-----

--5dNcufZ4prhark0F--
