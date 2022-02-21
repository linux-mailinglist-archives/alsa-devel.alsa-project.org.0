Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A142C4BDA77
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 16:09:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B5A16E4;
	Mon, 21 Feb 2022 16:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B5A16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645456194;
	bh=RF7Y3gmMFltHIOkh7LQL5lvjHbYfLxDB28JbkS7Exb4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6AYIu2pden8uV2dxwKlNnykkyjWZA2ItNif3VM0egRy7M3DuBGy0M7VygC8P/oMn
	 m8hO1t9g4ZFFAVQk/l7sgCnJBFsfFJWsNWqKuZ4mftR27/gBR4aGd8r7GhHo7XS4eT
	 u/Auhk/AGmtjKwoGrWesqsm3lfA5GlQr4YAfhT5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D75AF80149;
	Mon, 21 Feb 2022 16:08:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A04CCF8013D; Mon, 21 Feb 2022 16:08:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C179F800FA
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 16:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C179F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dGMmO3nJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5059760C75;
 Mon, 21 Feb 2022 15:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6BDC340E9;
 Mon, 21 Feb 2022 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645456120;
 bh=RF7Y3gmMFltHIOkh7LQL5lvjHbYfLxDB28JbkS7Exb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGMmO3nJOXkzNF2NksZJdt2ZcCwE49Q5Pk6IeBWYB9wT5PTk+hCE+zqxuoczYuJAw
 70cNqD2DCdc5FnhFc3BiXPgft76aedZdyAq13/cgwoWA0soZKq6VCgUVDl6/WClMLo
 Vebj8/5H6jBIGIqqcAKVTX4xmnm4WHs3i+JQBeFiAltOD8yxg0lc53yHH0KkPMmZzD
 5AhWIbm5h7uCGIGkE0+gX5E2c5qZOdaoGoAWDyxp1BWMHjEkJz0aye4w1ZtzdX99Is
 Ljqg3TSlhvOzdcIGtyz/wal5LLMOE0/ldlxisL7DdaTRxZalgPUcuCd74IxrItZp7h
 HpsN/M1doui2Q==
Date: Mon, 21 Feb 2022 15:08:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: Codec without controls in device tree
Message-ID: <YhOq9IlK32UDMLLz@sirena.org.uk>
References: <20220221150512.GF9136@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6oFSYIV7xbb8DKui"
Content-Disposition: inline
In-Reply-To: <20220221150512.GF9136@pengutronix.de>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org
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


--6oFSYIV7xbb8DKui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 21, 2022 at 04:05:12PM +0100, Sascha Hauer wrote:

> I have several i.MX8 boards here which have codecs connected to them
> which are really just plane D/A converters without any control interface
> like a pcm1754 or a pcm4104 in hardware mode. Currently we use the
> simple-audio-card OF driver with custom codec code in sound/soc/codecs/.
> The codec does nothing except specifying desired rates, channels and
> formats.
> Is this the way to go or is there some device tree solution to get rid
> of the codec?

That's the right way to go - the CODEC will have some constraints on
what it supports that need to be advertised, sometimes there's GPIOs for
a control interface and someone might want to hook up a clock or some
regulators.  There's several existing drivers like this.

--6oFSYIV7xbb8DKui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmITqvQACgkQJNaLcl1U
h9CCCQf/c2OZW3k2OQNIEW71FK414YFoAXsfrvgY5O/XjW79WNw9ikLdAsXpCcat
V5ZaeAUkTfcEk10r6vEOR6kznyaEpHUaqX6mpHK5919ti20gbADNwXel1VeiusLb
HMoBnGzC0pvB9TW3CN52ox8iz7bJcWyxggQH7BZQo+FxyC2TPYTRVMAFkcqduOgW
LYFQqYZq/nKm0ORb7mI2/ZqoCH5t01ph1d5+5eIOHGLVU29j+wzWatJ6VkJiqOv6
LM04y7kUzhwGhWw5b38ucAe1u1Cw8ukUh85CHWCcuwBIe8ayeWKOSlu6NjhJFmiI
hc3A4cGO9+QY7TcVLMN9gswFanR0sQ==
=Da8g
-----END PGP SIGNATURE-----

--6oFSYIV7xbb8DKui--
